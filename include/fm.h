/*
 * fm.h
 *
 *  Created on: Mar 13, 2016
 *      Author: mihai
 */

#ifndef INCLUDE_FM_H_
#define INCLUDE_FM_H_


#include "modulation.h"

typedef struct {
	Modulation mod;
	double pulsationDelta;
	double frequencyDelta;
} Fm;

void * initFm(double sampleRate, double amplitude, double frequency,
		double frequencyDelta, uintmax_t sampleSize);

#endif /* INCLUDE_FM_H_ */
