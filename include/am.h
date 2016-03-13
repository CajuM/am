#ifndef AM_AM_H
#define AM_AM_H

#include "modulation.h"

typedef struct {
	Modulation mod;
	double pulsationDelta;
	double frequencyDelta;
} Am;

void * initAm(double sampleRate, double amplitude, double frequency,
		double frequencyDelta, uintmax_t sampleSize);

#endif
