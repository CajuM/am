#ifndef AM_PAUDIO_H
#define AM_PAUDIO_H

#include <portaudio.h>

#include "io.h"

typedef struct {
	Io io;
	PaStream * recorder;
	PaStream * player;
} PortAudio;

void * initPortAudio(int sampleRate);

#endif
