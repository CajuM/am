#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/select.h>
#include <getopt.h>
#include <pthread.h>
#include <unistd.h>

#include "am.h"
#include "fm.h"
#include "enc1.h"
#include "pulse.h"
#include "encoding.h"

#define PING_STR "Hristos se naste, bucurie lumii !"

typedef struct {
	Io * io;
	Modulation * mod;
	Encapsulation * enc;
	enum {
		ZERO, TEST, CHAT, ONCE
	} action;
} Stack;

static Stack * getStack(int argc, char ** argv) {
	Stack * stack = malloc(sizeof(Stack));
	stack->enc = initEnc1();
	stack->io = initPulse(48000);
	int genwav = 0;
	int test = 0;
	int chat = 0;
	static struct option long_options[] = { { "modulation", required_argument,
			0, 'm' }, { "genwav", no_argument, 0, 'g' }, { "test", no_argument,
			0, 't' }, { "chat", no_argument, 0, 'c' }, { 0, 0, 0, 0 } };
	int c;
	int option_index = 0;
	do {
		c = getopt_long(argc, argv, "m:gtc", long_options, &option_index);
		switch (c) {
		case 0:
			break;
		case 'm':
			if (strcmp(optarg, "AM") == 0) {
				stack->mod = initAm(48000, INT_MAX / 2, 20000, 1000, 128);
				break;
			}
			if (strcmp(optarg, "FM") == 0) {
				stack->mod = initFm(48000, INT_MAX / 2, 20000, 1000, 128);
				break;
			}
			fprintf(stderr, "Error: Invalid modulation\n");
			return NULL;
		case 't':
			stack->action = TEST;
			break;
		case 'g':
			stack->action = ONCE;
			break;
		case 'c':
			stack->action = CHAT;
			break;
		case -1:
			break;
		default:
			return NULL;
			break;
		}
	} while (c != -1);
	if (stack->action == ZERO) {
		fprintf(stderr, "Error: You must suply an action\n");
		return NULL;
	}

	return stack;
}

/*
 int *modulate_am(char *data) {
 int i, j, k;
 int * vbuf = malloc(sizeof(int) * FRAME_BUFFER);
 for (i = 0; i < EF_SIZE; i++)
 for (j = 0; j < BITS_BYTE; j++) {
 int bit = get_bit(data[i], (j + 1));
 for (k = 0; k < BIT_SIZE; k++) {
 long index = i * BITS_BYTE * BIT_SIZE + j * BIT_SIZE + k;
 vbuf[index] =
 bit * WAV_AMPL * sin(
 ((double) index * PULSATION) / ((double) SAMPLE_RATE)
 );
 }
 }
 return vbuf;
 }
 */

/*
 frame *get_msg_am(int *sbf) {
 double frq[] = {FREQUENCY};
 double base_pow = goertzel(sbf + BIT_SIZE * 1, BIT_SIZE , frq, 1)[0];
 base_pow /= 2;
 char *msg = (char *) calloc(sizeof(char), EF_SIZE);

 for (uintmax_t i = 0; i < FRAME_BUFFER / BIT_SIZE; i++) {
 double pow = goertzel(sbf + i * BIT_SIZE, BIT_SIZE, frq, 1)[0];
 //	printf("%lf %lf\n", base_pow, pow);

 if (pow > base_pow) {
 msg[i / BITS_BYTE] += 1 << (7 - (i % BITS_BYTE));
 }
 }
 return (frame *) hm_decode(msg, EF_SIZE);
 }
 */

static void * listen(void * vstack) {
	Stack * stack = vstack;
	uintmax_t signalLen = stack->mod->oSize(stack->mod, stack->enc->frameSize);
	while (1) {
		int32_t * signal = stack->io->read(stack->io,
				signalLen * sizeof(int32_t));
		Frame frm = stack->mod->demodulate(stack->mod, signal, signalLen);
		if (stack->enc->check(stack->enc, frm)) {
			char * data = stack->enc->decapsulate(stack->enc, frm);
			printf("M: %.*s\n", stack->enc->dataSize, data);
			free(data);
		}
		free(frm);
		free(signal);
	}
}

static void * send(void * vstack) {
	Stack * stack = vstack;
	char * data = malloc(sizeof(char) * 65536);
	uintmax_t signalLen = stack->mod->oSize(stack->mod, stack->enc->frameSize);
	fd_set set;
	while (1) {
		struct timeval tv;
		FD_ZERO(&set);
		FD_SET(STDIN_FILENO, &set);
		tv.tv_sec = 0;
		tv.tv_usec = 0;
		int rv = select(STDIN_FILENO + 1, &set, NULL, NULL, &tv);
		if ((rv != 0) && (rv != -1)) {
			rv = read(STDIN_FILENO, data, 65536);
			for (uintmax_t i = 0; i < rv; i += stack->enc->dataSize) {
				Frame frm = stack->enc->encapsulate(stack->enc, data,
						stack->enc->dataSize);
				int32_t * signal = stack->mod->modulate(stack->mod, frm,
						stack->enc->frameSize);
				stack->io->write(stack->io, signal,
						signalLen * sizeof(int32_t));
				free(signal);
				free(frm);
				usleep(100);
			}
		}
		fflush(stdin);
		fflush(stdout);
		fflush(stderr);
		usleep(100);
	}
}

static int test(void * vstack) {
	printf("Testing configuration\n");
	Stack * stack = vstack;
	Frame frm = stack->enc->encapsulate(stack->enc, PING_STR,
			strlen(PING_STR) + 1);
	uintmax_t signalLen = stack->mod->oSize(stack->mod, stack->enc->frameSize);
	int32_t * signal = stack->mod->modulate(stack->mod, frm,
			stack->enc->frameSize);
	free(frm);
	frm = stack->mod->demodulate(stack->mod, signal, signalLen);
	free(signal);
	int ret = stack->enc->check(stack->enc, frm);
	if (!ret) {
		printf("Configuration invalid\n");
		for (uintmax_t i = 0; i < stack->enc->frameSize; i++) {
			printf("%.2x", ((uint8_t *) frm)[i]);
		}
		printf("\n");
	}
	free(frm);
	return ret;
}

int main(int argc, char ** argv) {
	Stack * stack = getStack(argc, argv);

	if (stack == NULL)
		return 1;

	if (stack->action == TEST) {
		return !test(stack);
	}

	printf("Info: Starting soundwave chat.\n");

	pthread_t tid1, tid2;

	pthread_create(&tid1, NULL, &listen, stack);
	pthread_create(&tid2, NULL, &send, stack);

	void *status;
	pthread_join(tid1, &status);
	pthread_join(tid2, &status);

	return 0;
}
