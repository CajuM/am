#include <math.h>
#include <stdlib.h>

#include "modulation.h"
#include "filter.h"
#include "rt.h"

#define U_BYTE 8
#define BITS_BYTE 8

int32_t * ammModulate(void * amv, uint8_t * data, uintmax_t len) {
	Modulation * mod = amv;
	int * vbuf = malloc(len * U_BYTE * mod->sampleSize * sizeof(int32_t));
        int state = 0;
	int lowAmp = mod->amplitude / 2;
	int deltaAmp = mod->amplitude - lowAmp;
	double slope = deltaAmp / mod->sampleSize;

	for (uintmax_t i = 0; i < len; i++)
		for (int j = 0; j < BITS_BYTE; j++) {
			int bit = get_bit(data[i], (j + 1));
			for (uintmax_t k = 0; k < mod->sampleSize; k++) {
				long index = i * U_BYTE * mod->sampleSize + j * mod->sampleSize
						+ k;
				int ampl;
				if (bit == 0) {
					ampl = state ? mod->amplitude : lowAmp;
				} else {
					ampl = state ? mod->amplitude - slope * k : lowAmp + slope * k;
				}
				vbuf[index] = ampl * sin(
					((double) index * mod->pulsation)
					/ ((double) mod->sampleRate)
				);
			}
			if (bit) {
				state = (state + 1) % 2;
			}
		}
	return vbuf;
}

uint8_t * ammDemodulate(void * amv, int32_t *sbf, uintmax_t len) {
	Modulation * mod = amv;
	Filter * flt = mod->filter;
	uintmax_t frameLen = len / (mod->sampleSize * U_BYTE);
	char *msg = (uint8_t *) calloc(1, sizeof(uint8_t) * frameLen);

	int state = 0;
	for (uintmax_t i = 0; i < len / mod->sampleSize; i++) {
		double * powo0 = flt->filter(flt, sbf + i * mod->sampleSize, mod->sampleSize / 2);
		double pow0 = *powo0;
		free(powo0);

		double * powo1 = flt->filter(flt, sbf + i * mod->sampleSize + mod->sampleSize / 2, mod->sampleSize / 2);
		double pow1 = *powo1;
		free(powo1);
		//	printf("%lf %lf\n", base_pow, pow);

		if ((!state && (pow1 - pow0) > pow0 / 10) || (state && (pow0 - pow1) > pow1 / 10)) {
			msg[i / BITS_BYTE] += 1 << (7 - (i % BITS_BYTE));
			state = (state + 1) % 2;
		}
	}
	return msg;
}

uintmax_t ammOSize(void *amv, uintmax_t len) {
	Modulation * mod = amv;
	return len * U_BYTE * mod->sampleSize;
}

void * initAmm(double sampleRate, double amplitude, double frequency,
		uintmax_t sampleSize) {
	Modulation * ret = calloc(1, sizeof(Modulation));
	double frq[] = { frequency };

	ret->filter = initGoertzel(ret, frq, 1);
	ret->name = "AMO";
	ret->sampleRate = sampleRate;
	ret->amplitude = amplitude;
	ret->frequency = frequency;
	ret->pulsation = 2 * M_PI * frequency;
	ret->sampleSize = sampleSize;

	ret->modulate = &ammModulate;
	ret->demodulate = &ammDemodulate;
	ret->oSize = &ammOSize;

	return ret;
}
