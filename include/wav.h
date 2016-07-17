/*
 * wav.h
 *
 *  Created on: Mar 13, 2016
 *      Author: mihai
 */

#ifndef INCLUDE_WAV_H_
#define INCLUDE_WAV_H_

#include <stdio.h>

#include "io.h"


typedef struct {
	Io io;
	FILE * file;
	uint32_t sampleRate;
	uint32_t len;
} Wav;

void * initWav(char * fname, double sampleRate);

#endif /* INCLUDE_WAV_H_ */
