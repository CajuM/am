#ifndef AM_MODULATION_H
#define AM_MODULATION_H

#include <stdint.h>


typedef struct {
	char * name;
	double sampleRate;
	double amplitude;
	double pulsation;
	double frequency;
	void * filter;
	uintmax_t sampleSize;
	int32_t * (* modulate) (void * mod, uint8_t * data, uintmax_t len);
	uint8_t * (* demodulate) (void * am, int32_t * sbf, uintmax_t len);
	uintmax_t (* oSize) (void * v, uintmax_t len);
} Modulation;

#endif
