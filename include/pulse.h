#ifndef AM_PULSE_H
#define AM_PULSE_H

#include <pulse/simple.h>

#include "io.h"

typedef struct {
	Io io;
	pa_simple * recorder;
	pa_simple * player;
} Pulse;

void * initPulse(int sampleRate);

#endif
