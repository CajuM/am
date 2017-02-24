#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <string.h>
#include <sys/select.h>
#include <getopt.h>
#include <pthread.h>
#include <unistd.h>
#include <time.h>

#include "am.h"
#include "fm.h"
#include "enc1.h"
#include "pulse.h"
#include "paudio.h"
#include "encoding.h"
#include "rt.h"
#include "wav.h"

#define PING_STR "Κύριε, ἐλέησον"
uint8_t * ping_frm;
int sent = 0;
int received = 0;
time_t start;

typedef struct {
	Io * io;
	Modulation * mod;
	Encapsulation * enc;
	enum {
		ZERO,
		TEST,
		CHAT,
		GENWAV,
	} action;
} Stack;

static Stack * getStack(int argc, char ** argv) {
	Stack * stack = malloc(sizeof(Stack));
	stack->enc = initEnc1();
	int genwav = 0;
	int test = 0;
	int chat = 0;
	static struct option long_options[] = {
		{ "help", no_argument, 0, 'h' },
		{ "modulation", required_argument, 0, 'm' },
		{ "genwav", no_argument, 0, 'g' },
		{ "test", no_argument, 0, 't' },
		{ "chat", no_argument, 0, 'c' },
		{ 0, 0, 0, 0 }
	};
	int c;
	int option_index = 0;
	do {
		c = getopt_long(argc, argv, "m:gtch", long_options, &option_index);
		switch (c) {
		case 0:
			break;
		case 'h':
			printf(
				"Usage: %s\n"
				"-m|--modulation AM|AMO|AMM|FM\n"
				"-g|--genwav\n"
				"-t|--test\n"
				"-c|--chat\n"
			,argv[0]);
			return NULL;
		case 'm':
			if (strcmp(optarg, "AM") == 0) {
				stack->mod = initAm(48000, INT_MAX, 22000, 2000, 250);
				break;
			}
			if (strcmp(optarg, "FM") == 0) {
				stack->mod = initFm(48000, INT_MAX, 22000, 2000, 250);
				break;
			}
			if (strcmp(optarg, "AMO") == 0) {
				stack->mod = initAmo(48000, INT_MAX, 22000, 250);
				break;
			}
			if (strcmp(optarg, "AMM") == 0) {
				stack->mod = initAmm(48000, INT_MAX, 22000, 250);
				break;
			}
			fprintf(stderr, "Error: Invalid modulation\n");
			return NULL;
		case 't':
			stack->action = TEST;
			break;
		case 'g':
			stack->action = GENWAV;
			break;
		case 'c':
			stack->action = CHAT;
			break;
		case -1:
			break;
		default:
			return NULL;
		}
	} while (c != -1);
	if (stack->action == ZERO) {
		fprintf(stderr, "Error: You must suply an action\n");
		return NULL;
	}

	if (stack->action == CHAT)
		stack->io = initPortAudio(48000);
//		stack->io = initPulse(48000);

	if (stack->action == GENWAV)
		stack->io = initWav("am.wav", 48000);

	return stack;
}

int match(uint8_t * base, uint8_t * test, uintmax_t len) {
	for (uintmax_t i = 0; i < len; i++) {
		if (base[i] && (!test[i]))
			return 0;
		if ((!base[i]) && test[i])
			return 0;
	}
	return 1;
}

static void * listen(void * vstack) {
	Stack * stack = vstack;
	uintmax_t signalLen = stack->mod->oSize(stack->mod, stack->enc->frameSize);
	uintmax_t fbufSize = (signalLen + stack->mod->sampleSize);
	int32_t * fbuf = calloc(fbufSize, sizeof(int32_t));
	while (1) {
		int32_t * sample = stack->io->read(stack->io,
				stack->mod->sampleSize);
		mmpush(fbuf, fbufSize * sizeof(int32_t), sample,
				stack->mod->sampleSize * sizeof(int32_t));
		free(sample);

		for (uintmax_t ii = 0; ii < 4; ii++) {
		uintmax_t fbufShift = (ii * stack->mod->sampleSize) / 4;
		Frame frm = stack->mod->demodulate(stack->mod, fbuf + fbufShift, signalLen);

		if (match(ping_frm, frm, stack->enc->frameSize)) {
			for (uintmax_t i = 0; i < stack->enc->frameSize; i++) {
				printf("%.2x", ((uint8_t *) frm)[i]);
			}
			printf("\n");
			for (uintmax_t i = 0; i < stack->enc->frameSize; i++) {
				printf("%.2x", ping_frm[i]);
			}
			printf("\n");
			printf("\n");
		}
		if (stack->enc->check(stack->enc, frm)) {
			uint8_t * data = stack->enc->decapsulate(stack->enc, frm);
			received += 1;
			printf("M: %s; s: %d; r: %d; r/t: %f \n", data, sent, received,
					(float) received / (time(NULL) - start));
			free(data);
		}
		free(frm);
		}
	}
}

static void * send(void * vstack) {
	Stack * stack = vstack;
	char * data = malloc(sizeof(char) * 65536);
	uintmax_t signalLen = stack->mod->oSize(stack->mod, stack->enc->frameSize);
	fd_set set;
	start = time(NULL);
	while (1) {
		/*struct timeval tv;
		 FD_ZERO(&set);
		 FD_SET(STDIN_FILENO, &set);
		 tv.tv_sec = 0;
		 tv.tv_usec = 0;
		 int rv = select(STDIN_FILENO + 1, &set, NULL, NULL, &tv);
		 if ((rv != 0) && (rv != -1)) {
		 rv = read(STDIN_FILENO, data, 65536);
		 for (uintmax_t i = 0; i < rv; i += stack->enc->dataSize) {
		 Frame frm = stack->enc->encapsulate(stack->enc, PING_STR,
		 strlen(PING_STR));*/
		int32_t * signal = stack->mod->modulate(stack->mod, ping_frm,
				stack->enc->frameSize);
		stack->io->write(stack->io, signal, signalLen);
		free(signal);
		sent += 1;
		//free(frm);
		usleep(
				3 * 1000000ull * stack->mod->sampleSize
						/ stack->mod->sampleRate);
		/*}
		 }
		 fflush(stdin);
		 fflush(stdout);
		 fflush(stderr);
		 usleep(100);*/
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
		for (uintmax_t i = 0; i < stack->enc->frameSize; i++) {
			printf("%.2x", ping_frm[i]);
		}
		printf("\n");
	} else {
		printf("Configuration OK !\n");
	}
	free(frm);
	return ret;
}

static void genwav(void *v) {
	Stack * stack = v;

	Frame frm = stack->enc->encapsulate(stack->enc, PING_STR,
			strlen(PING_STR) + 1);
	uintmax_t signalLen = stack->mod->oSize(stack->mod, stack->enc->frameSize);
	int32_t * signal = stack->mod->modulate(stack->mod, frm,
			stack->enc->frameSize);
	stack->io->write(stack->io, signal, signalLen * sizeof(int32_t));
}

int main(int argc, char ** argv) {
	Stack * stack = getStack(argc, argv);
	int ret = 0;

	if (stack == NULL)
		return 255;

	ping_frm = stack->enc->encapsulate(stack->enc, PING_STR,
			strlen(PING_STR) + 1);

	if (stack->action == TEST)
		ret = test(stack);

	if (stack->action == GENWAV) {
		genwav(stack);
	}

	if (stack->action == CHAT) {
		printf("Info: Starting soundwave chat.\n");

		pthread_t tid1, tid2;

		pthread_create(&tid1, NULL, &listen, stack);
		pthread_create(&tid2, NULL, &send, stack);

		void *status;
		pthread_join(tid1, &status);
		pthread_join(tid2, &status);
	}

	if (stack->action != TEST)
		stack->io->close(stack->io);

	return ret;
}
