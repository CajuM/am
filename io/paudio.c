#include <stdio.h>
#include <stdlib.h>

#include "paudio.h"

void * portAudioRead(void * iov, uintmax_t len) {
	PortAudio * paudio = iov;
	PaError err;
	void * buf = malloc(len * sizeof(int32_t));

	err = Pa_ReadStream(paudio->recorder, buf, len);
	if (err != paNoError) {
		fprintf(stderr, "PortAudio read error: %s\n", Pa_GetErrorText(err));
		free(buf);
		return NULL;
	}

	return buf;
}

void portAudioWrite(void * iov, void * buf, uintmax_t len) {
	PortAudio * paudio = iov;
	PaError err;

//	Pa_StartStream(paudio->player);

	err = Pa_WriteStream(paudio->player, buf, len);
	if (err != paNoError) {
		fprintf(stderr, "PortAudio write error: %s\n", Pa_GetErrorText(err));
	}

//	Pa_StopStream(paudio->player);
}



void portAudioClose(void * pav) {
	PortAudio * paudio = pav;

	Pa_StopStream(paudio->recorder);
	Pa_StopStream(paudio->player);

	Pa_Terminate();
}



void * initPortAudio(int sampleRate) {
	Pa_Initialize();

	PortAudio * ret = calloc(1, sizeof(PortAudio));

	ret->io.write = &portAudioWrite;
	ret->io.read = &portAudioRead;
	ret->io.close = &portAudioClose;

	PaStream * recorder;
	PaStream * player;
	PaError err;


	err = Pa_OpenDefaultStream(
		&recorder,
		1, 0,
		paInt32,
		sampleRate,
		paFramesPerBufferUnspecified,
		NULL,
		NULL
	);

	if( err != paNoError ) {
		fprintf(stderr, "PortAudio initialization error: %s\n", Pa_GetErrorText(err));
		return NULL;
	}

	err = Pa_OpenDefaultStream(
		&player,
		0, 1,
		paInt32,
		sampleRate,
		paFramesPerBufferUnspecified,
		NULL,
		NULL
	);

	if( err != paNoError ) {
		fprintf(stderr, "PortAudio initialization error: %s\n", Pa_GetErrorText(err));
		return NULL;
	}

	ret->recorder = recorder;
	ret->player = player;

	Pa_StartStream(ret->recorder);
	Pa_StartStream(ret->player);

	return ret;
}
