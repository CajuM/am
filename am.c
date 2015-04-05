#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <ctype.h>
#include <limits.h>
#include <unistd.h>
#include <sys/select.h>
#include <pulse/simple.h>
#include <pulse/error.h>
#include <getopt.h>

#define PI 3.141592653589793
#define SAMPLE_RATE 48000
#define FREQUENCY 15000
#define FREQUENCY_DELTA 750
#define PULSATION (2*PI*FREQUENCY)
#define PULSATION_DELTA (2*PI*FREQUENCY_DELTA)
#define WAV_AMPL 2000000000

#define SAMPLE_BUFFER 48
#define FRAME_SIZE 64
#define EF_SIZE (FRAME_SIZE * 7 /4 )
#define BITS_BYTE 8
#define BIT_SIZE (SAMPLE_BUFFER * 2)
#define FRAME_BUFFER (EF_SIZE * BITS_BYTE * BIT_SIZE)
#define PING_STR "Hristos se naste, bucurie lumii !"

typedef enum {
	AM,
	FM
} modulation;

typedef struct {
	char start[2];
	char data[FRAME_SIZE - 3];
	uint8_t crc;
} frame;

int *sbf;
void write_wav(FILE* wav_file, unsigned long num_samples, int * data);
int *get_fdata(char * data, size_t len, modulation m);
int *modulate_am(char *data);
int *modulate_fm(char *data);
const char *byte_to_binary(int x);
frame *get_msg(int *sbf, modulation m);
frame *get_msg_am(int *sbf);
frame *get_msg_fm(int *sbf);


char get_bit(char byte, uint8_t poz) {
	return (byte >> (8 - poz)) & (char) 0x01;
}

char flip_bit(char byte, uint8_t poz) {
	return byte ^ (((char) 0x01) << (8 - poz));
}

char * hm_encode(char *data, size_t len) {
	size_t i, j;
	char t;
	char * rez = (char *) calloc(sizeof(char), (len * 7) / 4);
	for (i = 0; i < len * 2; i++) {
		t = data[i / 2];
		if (i % 2 == 0)
			t = t >> 4;
		t &= (char) 0x0F;
		t += (get_bit(t, 6) ^ get_bit(t, 7) ^ get_bit(t, 8)) << 6;
		t += (get_bit(t, 5) ^ get_bit(t, 7) ^ get_bit(t, 8)) << 5;
		t += (get_bit(t, 5) ^ get_bit(t, 6) ^ get_bit(t, 8)) << 4;
		t <<= 1;
		for (j = 1; j < 8; j++) {
			rez[(i * 7 + j - 1) / 8] += get_bit(t, j)
					<< (7 - ((i * 7 + j - 1) % 8));
		}
	}
	return rez;
}

char * hm_decode(char *data, size_t len) {
	char *rez = calloc(sizeof(char), len * 4 / 7);
	unsigned char bl;
	char hb;
	char sind;
	int i, j;
	for (i = 0; i < len * 8 / 7; i++) {
		bl = 0;
		for (j = 0; j < 7; j++)
			bl += get_bit(data[(i * 7 + j) / 8], ((i * 7 + j) % 8) + 1)
					<< (7 - j);
		bl >>= 1;
		sind = (get_bit(bl, 2) ^ get_bit(bl, 6) ^ get_bit(bl, 7)
				^ get_bit(bl, 8)) << 2;
		sind += (get_bit(bl, 3) ^ get_bit(bl, 5) ^ get_bit(bl, 7)
				^ get_bit(bl, 8)) << 1;
		sind += (get_bit(bl, 4) ^ get_bit(bl, 5) ^ get_bit(bl, 6)
				^ get_bit(bl, 8)) << 0;
		if (sind != 0) {
			//	printf("corecting error %s %d %d\n", byte_to_binary(bl), i, sind);
			bl = flip_bit(bl, sind + 1);
		}
		hb = (get_bit(bl, 5) << 3) + (get_bit(bl, 6) << 2)
				+ (get_bit(bl, 7) << 1) + (get_bit(bl, 8) << 0);
		rez[i / 2] += hb << (i % 2 ? 0 : 4);

	}
	return rez;
}

/* sample rate 48000 fq1 14000 fq2 16000

 Digital filter designed by mkfilter/mkshape/gencode   A.J. Fisher
 Command line: /www/usr/fisher/helpers/mkfilter -Bu -Bs -o 2 -a 4.0816326531e-01 4.3083900227e-01 -l
 */

static void filter_frq(int *sample, int len) {
	const int NZEROS = 4;
	const int NPOLES = 4;
	const float GAIN = 6.943565084e+01;
	float xv[NZEROS + 1], yv[NPOLES + 1];
	int i;
	for (i = 0; i <= NPOLES; i++)
		xv[i] = yv[i] = 0;

	for (i = 0; i < len; i++) {
		xv[0] = xv[1];
		xv[1] = xv[2];
		xv[2] = xv[3];
		xv[3] = xv[4];
		xv[4] = (float) sample[i] / GAIN;
		yv[0] = yv[1];
		yv[1] = yv[2];
		yv[2] = yv[3];
		yv[3] = yv[4];
		/* 14000-16000 Hz */
		yv[4] = (xv[0] + xv[4]) - 2 * xv[2] + (-0.6905989233 * yv[0])
				+ (-1.1634343027 * yv[1]) + (-2.1281581223 * yv[2])
				+ (-1.4022830186 * yv[3]);
		/* 18000-20000 Hz */
		//yv[4] = (xv[0] + xv[4]) - 2 * xv[2] + (-0.6905989232 * yv[0])
		//		+ (-2.4119530978 * yv[1]) + (-3.7611512840 * yv[2])
		//		+ (-2.9071180582 * yv[3]);
		sample[i] = (int) yv[4];
	}
}

int *modulate_fm(char *data) {
	int i, j, k;
	int index;
	uintmax_t suma = 0;
	int * vbuf = malloc(sizeof(int) * FRAME_BUFFER);
	for (i = 0; i < EF_SIZE; i++)
		for (j = 0; j < BITS_BYTE; j++)
			for (k = 0; k < BIT_SIZE; k++) {
				suma += get_bit(data[i], j + 1);
				index = i * BITS_BYTE * BIT_SIZE + j * BIT_SIZE + k;
				vbuf[index] = WAV_AMPL * sin(
								((double)(PULSATION * index + PULSATION_DELTA * suma))
								/ SAMPLE_RATE
							);
			}
	return vbuf;
}

int *modulate_am(char *data) {
	int i, j, k;
	int * vbuf = malloc(sizeof(int) * FRAME_BUFFER);
	for (i = 0; i < EF_SIZE; i++)
		for (j = 0; j < BITS_BYTE; j++)
			for (k = 0; k < BIT_SIZE; k++) {
				long index = i * BITS_BYTE * BIT_SIZE + j * BIT_SIZE + k;
				vbuf[index] =
						get_bit(data[i], (j + 1)) * WAV_AMPL
						* sin(
							((double) index * PULSATION) / ((double) SAMPLE_RATE)
						);
			}
	return vbuf;
}

frame *encapsulate(char * data, size_t len) {
	frame *frm = calloc(sizeof(char), sizeof(frame));
	frm->start[0] = 0xBE;
	frm->start[1] = 0xEF;
	memcpy(frm->data, data, (len < (FRAME_SIZE - 3)) ? len : (FRAME_SIZE - 3));
	frm->crc = crc8(frm->data, FRAME_SIZE - 3);
	return frm;
}

int *get_fdata(char * data, size_t len, modulation m) {
	frame *frm = encapsulate(data, len);
	char *enc = hm_encode((char *) frm, FRAME_SIZE);
	int * vbuf;
	switch (m) {
		case AM:
			vbuf = modulate_am(enc);
			break;
		case FM:
			vbuf = modulate_fm(enc);
			break;
	}
	free(enc);
	free(frm);
	return vbuf;
}

pa_simple *get_ch() {
	pa_simple *s;
	pa_sample_spec ss;
	ss.format = PA_SAMPLE_S32LE;
	ss.channels = 1;
	ss.rate = 48000;
	int err = 0;
	s = pa_simple_new(NULL, // Use the default server.
			"AM-chat", // Our application's name.
			PA_STREAM_RECORD,
			NULL, // Use the default device.
			"AM-rx", // Description of our stream.
			&ss, // Our sample format.
			NULL, // Use default channel map
			NULL, // Use default buffering attributes.
			&err // Ignore error code.
	);
	if (!s)
		printf("error: %s\n", pa_strerror(err));
	return s;
}

pa_simple *get_pl() {
	pa_simple *s;
	pa_sample_spec ss;
	ss.format = PA_SAMPLE_S32LE;
	ss.channels = 1;
	ss.rate = 48000;
	int err = 0;
	s = pa_simple_new(NULL, // Use the default server.
			"AM-chat", // Our application's name.
			PA_STREAM_PLAYBACK,
			NULL, // Use the default device.
			"AM-tx", // Description of our stream.
			&ss, // Our sample format.
			NULL, // Use default channel map
			NULL, // Use default buffering attributes.
			&err // Ignore error code.
	);
	if (!s)
		printf("error: %s\n", pa_strerror(err));
	return s;
}

void mmpush(void *dst, size_t ld, void *src, size_t ls) {
	void *tmp = malloc(ld - ls);
	memcpy(tmp, dst + ls, ld - ls);
	memcpy(dst, tmp, ld - ls);
	memcpy(dst + ld - ls, src, ls);
	free(tmp);
}

int mmcmp(void *s1, void *s2, int len) {
	int i;
	for (i = 0; i < len; i++)
		if (*((char *) s1 + i) != *((char *) s2 + i))
			return i + 1;
	return len;
}

int chk_frm(frame *frm) {
	if (frm->start[0] != (char) 0xBE)
		return 0;
	if (frm->start[1] != (char) 0xEF)
		return 0;
	if (crc8(frm->data, FRAME_SIZE - 3) != frm->crc)
		return 0;
	return 1;
}

int chk_wav_data(int *vbuf, frame **frm, modulation m) {
	filter_frq(vbuf, FRAME_BUFFER);
	*frm = get_msg(vbuf, m);
	return chk_frm(*frm);
}

void flushfb() {
	int i;
	for (i = 0; i < FRAME_BUFFER; i++)
		sbf[i] = 0;
}

frame *get_msg(int *sbf, modulation m) {
	switch (m) {
		case AM:
			return get_msg_am(sbf);
		case FM:
			return get_msg_fm(sbf);
	}
}

frame *get_msg_fm(int *sbf) {
	char *msg = (char *) calloc(sizeof(char), EF_SIZE);
	int i, j, k, index;
	double freq;
	int highcount;
	char byte;
	for (i = 0; i < EF_SIZE; i++) {
		byte = 0;
		for (j = 0; j < BITS_BYTE; j++) {
			highcount = 0;
			for (k = 0; k < (BIT_SIZE - 2); k++) {
				index = i * BITS_BYTE * BIT_SIZE + j * BIT_SIZE + k;
				if (( sbf[index]  < sbf[index + 1] ) && (sbf[index + 1] > sbf[index + 2]))
					highcount++;
				if (( sbf[index]  > sbf[index + 1] ) && (sbf[index + 1] < sbf[index + 2]))
					highcount++;
			}
			freq = ((double) highcount) * SAMPLE_RATE / (BIT_SIZE * 2);
			if (freq > FREQUENCY) {byte = flip_bit(byte, (j + 1)); /*printf("%d ", (int) freq);*/}
		}
		msg[i] = byte;
	}
	return (frame *) hm_decode(msg, EF_SIZE);
}

frame *get_msg_am(int *sbf) {
	int i, j;
	long long med;
	long long base_ampl = 0;
	char *msg = (char *) calloc(sizeof(char), EF_SIZE);

	for (i = BIT_SIZE, j = 0; i < 2 * BIT_SIZE - 2; i++)
		if (sbf[i] < sbf[i + 1] && sbf[i + 1] > sbf[i + 2]) {
			base_ampl += sbf[i + 1];
			j++;
		}
	if (j == 0)
		return (frame *) hm_decode(msg, EF_SIZE);
	base_ampl /= j;
	base_ampl /= 2;

	for (i = 0; i < FRAME_BUFFER / BIT_SIZE; i++) {
		med = 0;

		for (j = 0; j < BIT_SIZE; j++)
			med += abs(sbf[BIT_SIZE * i + j]);
		med /= BIT_SIZE;
		if (med > base_ampl) {
			msg[i / BITS_BYTE] += 1 << (7 - (i % BITS_BYTE));
		}
	}
	return (frame *) hm_decode(msg, EF_SIZE);
}

const char *byte_to_binary(int x) {
	static char b[9];
	b[0] = '\0';

	int z;
	for (z = 128; z > 0; z >>= 1) {
		strcat(b, ((x & z) == z) ? "1" : "0");
	}

	return b;
}

int main(int argc, char **argv) {
	modulation mod = AM;
	int genwav = 0;
	int test = 0;
	int chat = 0;
	static struct option long_options[] = {
		{"modulation",  required_argument, 0, 'm'},
		{"genwav",  no_argument,       0, 'g'},
		{"test",  no_argument,       0, 't'},
		{"chat",  no_argument,       0, 'c'},
		{0, 0, 0, 0}
	};
	int c;
	int option_index = 0;
	do {
		c = getopt_long (argc, argv, "m:gt",
                       long_options, &option_index);
		switch (c) {
			case 0:
				break;
			case 'm':
				if (strcmp(optarg, "AM") == 0) {
					mod = AM;
					break;
				}
			 	if (strcmp(optarg, "FM") == 0) {
					mod = FM;
					break;
				}
				fprintf(stderr, "Error: Invalid modulation\n");
				return 1;
			case 't':
				test = 1;
				break;
			case 'g':
				genwav = 1;
				break;
			case 'c':
				chat = 1;
				break;
			case -1:
				break;
			default:
				return 1;
				break;
		}
	} while (c != -1);
	if (!(test || chat || genwav)) {
		fprintf(stderr, "Error: You must suply an action\n");
		return 1;
	}


	int *vbuf;
	frame *msg;
	int i;

	if (genwav || test) {
		vbuf = get_fdata(PING_STR, strlen(PING_STR), mod);
		if (chk_wav_data(vbuf, &msg, mod))
			printf("Info: PCM data is ok.\n");
		else {
			fprintf(stderr, "Error: PCM data can not be read\n");
			for (i = 0; i < FRAME_SIZE; i++)
				fprintf(stderr, "%hhx", ((char *) msg)[i]);
			fprintf(stderr, "\n");
		}
	}
	if (genwav) {
		FILE *am = fopen("am.wav", "w");
		if (am == NULL) {
			printf("could not open files\n");
			exit(1);
		}
		write_wav(am, FRAME_BUFFER, vbuf);
		printf("Info: WAV ready\n");
	}

	if (!chat) return 0;

	char *mg  = (char *) malloc(65536);
	int j;
	pa_simple *ch = get_ch();
	pa_simple *pl = get_pl();
	int err = 0;
	int *buf = (int *) malloc(sizeof(int) * SAMPLE_BUFFER);
	sbf = (int *) calloc(sizeof(int), FRAME_BUFFER);
	int *pbf;
	fd_set set;
	int rv;
	struct timeval tv;

	printf("Info: Starting soundwave chat.\n");
	while (1) {
		if (pa_simple_read(ch, buf, sizeof(int) * SAMPLE_BUFFER, &err))
			fprintf(stderr, "Error: %s\n", pa_strerror(err));
		//filter_frq(buf, SAMPLE_BUFFER);
		mmpush(sbf, FRAME_BUFFER * sizeof(int), buf, SAMPLE_BUFFER * sizeof(int));
		msg = get_msg(sbf, mod);
		if (chk_frm(msg)) {
			printf("M: %.*s", 61, msg->data);
			flushfb();
		}
		free(msg);
		FD_ZERO(&set);
		FD_SET(STDIN_FILENO, &set);
		tv.tv_sec = 0;
		tv.tv_usec = 0;
		rv = select(STDIN_FILENO + 1, &set, NULL, NULL, &tv);
		if ((rv != 0) && (rv != -1)) {
			rv = read(STDIN_FILENO, mg, 65536);
			for (i = 0; i < rv; i += 61) {
				j = ((i + 61) <= rv) ? 61 : (rv - i);
				pbf = get_fdata(mg + i, j, mod);
				if (pa_simple_write(pl, pbf, FRAME_BUFFER * sizeof(int), &err))
					printf("error: %s\n", pa_strerror(err));
				free(pbf);
			}
		}
		fflush(stdin);
		fflush(stdout);
		fflush(stderr);
	}
	printf("\n");
	pa_simple_free(ch);
	pa_simple_free(pl);
	return 0;
}
