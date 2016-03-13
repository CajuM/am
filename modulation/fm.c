#include <math.h>
#include <stdlib.h>

#include "fm.h"
#include "rt.h"
#include "filter.h"

#define U_BYTE 8

uint8_t * fmDemodulate(void * fmv, int32_t *sbf, uintmax_t len) {
	Fm * fm = fmv;
	Modulation * mod = fmv;
	Filter * flt = mod->filter;
	char *msg = (char *) malloc(sizeof(char) * len / mod->sampleSize);
	double frq[] = { mod->frequency, mod->frequency + fm->frequencyDelta };
	for (int i = 0; i < len / (mod->sampleSize * U_BYTE); i++) {
		uint8_t byte = 0;
		for (int j = 0; j < U_BYTE; j++) {
			double * pow = flt->filter(flt,
					sbf + i * U_BYTE * mod->sampleSize + j * mod->sampleSize,
					mod->sampleSize);
			if (pow[1] > pow[0])
				byte = flip_bit(byte, j + 1);
		}
		msg[i] = byte;
	}
	return msg;
}

int32_t * fmModulate(void * fmv, uint8_t * data, uintmax_t len) {
	Fm * fm = fmv;
	Modulation * mod = fmv;
	int * vbuf = malloc(sizeof(int) * len * U_BYTE * mod->sampleSize);
	for (uintmax_t i = 0; i < len; i++)
		for (uintmax_t j = 0; j < U_BYTE; j++) {
			int bit = get_bit(data[i], j + 1);
			for (uintmax_t k = 0; k < mod->sampleSize; k++) {
				uintmax_t index = i * U_BYTE * mod->sampleSize
						+ j * mod->sampleSize + k;
				if (bit)
					vbuf[index] = mod->amplitude
							* sin(
									(mod->pulsation + fm->pulsationDelta)
											* index / mod->sampleRate);
				else
					vbuf[index] = mod->amplitude
							* sin(mod->pulsation * index / mod->sampleRate);
			}
		}
	return vbuf;
}

uintmax_t fmOSize(void * v, uintmax_t len) {
	Modulation * mod  = v;
	return len * mod->sampleSize * U_BYTE;
}

void * initFm(double sampleRate, double amplitude, double frequency,
		double frequencyDelta, uintmax_t sampleSize) {
	Fm * ret = calloc(1, sizeof(Fm));
	double frq[] = { frequency, frequencyDelta };

	ret->mod.name = "FM";
	ret->mod.filter = initGoertzel(ret, frq, 2);
	ret->mod.sampleRate = sampleRate;
	ret->mod.amplitude = amplitude;
	ret->mod.frequency = frequency;
	ret->mod.pulsation = 2 * M_PI * frequency;
	ret->mod.sampleSize = sampleSize;

	ret->mod.modulate = &fmModulate;
	ret->mod.demodulate = &fmDemodulate;
	ret->mod.oSize = &fmOSize;

	ret->frequencyDelta = frequencyDelta;
	ret->pulsationDelta = 2 * M_PI * frequencyDelta;

	return ret;
}
