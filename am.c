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

#define PI (3.141592653589793)
#define SAMPLE_RATE (48000)
#define PULSATION (2*PI*15000)
#define WAV_AMPL 2000000000

#define SAMPLE_BUFFER (43)
#define FRAME_SIZE (64)
#define EF_SIZE (FRAME_SIZE * 7 /4 )
#define BITS_BYTE (8)
#define BIT_SIZE (SAMPLE_BUFFER * 2)
#define FRAME_BUFFER (EF_SIZE * BITS_BYTE * BIT_SIZE)
#define PING_STR "Hristos se naste, bucurie lumii !"

int *sbf;
void write_wav(FILE* wav_file, unsigned long num_samples, int * data);
int *get_fdata(char * data, size_t len);
const char *byte_to_binary(int x);
struct frame *get_msg(int *sbf);
struct frame {
	char start[2];
	char data[FRAME_SIZE - 3];
	uint8_t crc;
};

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

int *modulate(char *data) {
	int i, j, k;
	int * vbuf = malloc(sizeof(int) * FRAME_BUFFER);
	for (i = 0; i < EF_SIZE; i++)
		for (j = 0; j < BITS_BYTE; j++)
			for (k = 0; k < BIT_SIZE; k++) {
				vbuf[(i * BITS_BYTE * BIT_SIZE + j * BIT_SIZE + k)] = ((data[i]
						& (1 << (7 - j))) >> (7 - j)) * WAV_AMPL
						* sin(
								((float) (i * BITS_BYTE * 2 * BIT_SIZE
										+ j * BIT_SIZE + k)
										/ (float) SAMPLE_RATE) * PULSATION);
			}
	return vbuf;
}

struct frame *encapsulate(char * data, size_t len) {
	struct frame *frm = calloc(sizeof(char), sizeof(struct frame));
	frm->start[0] = 0xBE;
	frm->start[1] = 0xEF;
	memcpy(frm->data, data, (len < (FRAME_SIZE - 3)) ? len : (FRAME_SIZE - 3));
	frm->crc = crc8(frm->data, FRAME_SIZE - 3);
	return frm;
}

int *get_fdata(char * data, size_t len) {
	struct frame *frm = encapsulate(data, len);
	char *enc = hm_encode((char *) frm, FRAME_SIZE);
	int * vbuf = modulate(enc);
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

int chk_frm(struct frame *frm) {
	if (frm->start[0] != (char) 0xBE)
		return 0;
	if (frm->start[1] != (char) 0xEF)
		return 0;
	if (crc8(frm->data, FRAME_SIZE - 3) != frm->crc)
		return 0;
	return 1;
}

int chk_wav_data(int *vbuf) {
	filter_frq(vbuf, FRAME_BUFFER);
	struct frame *frm = get_msg(vbuf);
	return chk_frm(frm);
}

void flushfb() {
	int i;
	for (i = 0; i < FRAME_BUFFER; i++)
		sbf[i] = 0;
}

struct frame *get_msg(int *sbf) {
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
		return (struct frame *) hm_decode(msg, EF_SIZE);
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
	return (struct frame *) hm_decode(msg, EF_SIZE);
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

int main() {
	int i, j;
	char *mg = (char *) malloc(65536);
	FILE *am = fopen("am.wav", "w");
	if (am == NULL) {
		printf("could not open files\n");
		exit(1);
	}

	/*
	 char *rez = hm_encode(encapsulate(PING_STR, strlen(PING_STR)), FRAME_SIZE);
	 for (i = 0; i< 14; i++) printf("%s", byte_to_binary(rez[i]));
	 printf("\n");
	 rez[0]=flip_bit(rez[0], 5);
	 rez = hm_decode(rez, FRAME_SIZE*7/4);
	 printf("%.64s\n", rez);
	 if (!chk_frm(rez)) {
	 for (i = 0; i < FRAME_SIZE; i++)
	 printf("%hhx", ((char *)rez)[i]);
	 printf("\n");
	 }
	 exit(0);*/
	pa_simple *ch = get_ch();
	pa_simple *pl = get_pl();
	int err = 0;
	struct frame *msg;
	int *buf = (int *) malloc(sizeof(int) * SAMPLE_BUFFER);
	sbf = (int *) calloc(sizeof(int), FRAME_BUFFER);
	int *pbf;

	fd_set set;
	struct timeval timeout;
	timeout.tv_sec = 1;
	int rv;

	int *vbuf = get_fdata(PING_STR, strlen(PING_STR));
	if (chk_wav_data(vbuf))
		printf("WAV data is ok.\n");
	else {
		printf("WAV data can not be read\n");
		msg = get_msg(vbuf);
		for (i = 0; i < FRAME_SIZE; i++)
			printf("%hhx", ((char *) msg)[i]);
		printf("\n");
	}
	write_wav(am, FRAME_BUFFER, vbuf);
	printf("WAV ready !\n");

	printf("Initialization ok. Starting loop.\n");
	while (1) {
		if (pa_simple_read(ch, buf, sizeof(int) * SAMPLE_BUFFER, &err))
			printf("error: %s\n", pa_strerror(err));
		filter_frq(buf, SAMPLE_BUFFER);
		mmpush(sbf, FRAME_BUFFER * sizeof(int), buf,
		SAMPLE_BUFFER * sizeof(int));
		msg = get_msg(sbf);
		if (chk_frm(msg)) {
			fwrite(msg->data, 1, 61, stdout);
			fflush(stdout);
			flushfb();
		}
		free(msg);

		FD_ZERO(&set);
		FD_SET(STDIN_FILENO, &set);
		rv = select(STDIN_FILENO + 1, &set, NULL, NULL, &timeout);
		if ((rv != 0) && (rv != -1)) {
			rv = read(STDIN_FILENO, mg, 65536);
			for (i = 0; i < rv; i += 61) {
				j = ((i + 61) <= rv) ? 61 : (rv - i);
				pbf = get_fdata(mg + i, j);
				if (pa_simple_write(pl, pbf, FRAME_BUFFER * sizeof(int), &err))
					printf("error: %s\n", pa_strerror(err));
				fflush(stdin);
				fflush(stdout);
				free(pbf);
			}
		}
	}
	printf("\n");
	pa_simple_free(ch);
	pa_simple_free(pl);
	return 0;
}
