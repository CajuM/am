#include <math.h>
#include <stdlib.h>

#include "am.h"
#include "rt.h"
#include "filter.h"

#define U_BYTE 4
#define BITS_BYTE 8

int32_t * amModulate(void * amv, uint8_t * data, uintmax_t len) {
	Am * am = amv;
	Modulation * mod = amv;
	int i, j, k;
	int * vbuf = malloc(len * U_BYTE * mod->sampleSize * sizeof(int32_t));
	for (i = 0; i < len; i++)
		for (j = 0; j < U_BYTE; j++) {
			int bit0 = get_bit(data[i], (2 * j + 1));
			int bit1 = get_bit(data[i], (2 * j + 2));
			for (k = 0; k < mod->sampleSize; k++) {
				long index = i * U_BYTE * mod->sampleSize + j * mod->sampleSize
						+ k;
				vbuf[index] = bit0 * mod->amplitude / 2
						* sin(index * mod->pulsation / mod->sampleRate)
						+ bit1 * mod->amplitude / 2
								* sin(
										index
												* (mod->pulsation
														+ am->pulsationDelta)
												/ mod->sampleRate);
			}
		}
	return vbuf;
}

uint8_t * amDemodulate(void * amv, int32_t * sbf, uintmax_t len) {
	Am * am = amv;
	Modulation * mod = (void *) am;
	Filter * flt = ((Filter *) mod->filter);
	double frq[] = { mod->frequency, mod->frequency + am->frequencyDelta };
	double * pow =
			flt->filter(flt, sbf + mod->sampleSize, mod->sampleSize);
	double base_pow = pow[1];
	free(pow);
	base_pow /= 4;
	char *msg = (uint8_t *) malloc(sizeof(uint8_t) * len / mod->sampleSize);

	for (uintmax_t i = 0; i < len / mod->sampleSize; i++) {
		double * pow = flt->filter(flt, sbf + i * mod->sampleSize,
				mod->sampleSize);
		double pow0 = pow[0];
		double pow1 = pow[1];
		free(pow);
		//	printf("%lf %lf\n", base_pow, pow);

		if (pow0 > base_pow) {
			int idx0 = i * (BITS_BYTE / U_BYTE);
			int bidx0 = idx0 / BITS_BYTE;
			msg[bidx0] = flip_bit(msg[bidx0], (idx0 % BITS_BYTE) + 1);
		}
		if (pow1 > base_pow) {
			int idx1 = i * (BITS_BYTE / U_BYTE) + 1;
			int bidx1 = idx1 / BITS_BYTE;
			msg[bidx1] = flip_bit(msg[bidx1], (idx1 % BITS_BYTE) + 1);
		}
	}
	return msg;
}

uintmax_t amOSize(void * v, uintmax_t len) {
	Modulation * mod = v;
	return len * mod->sampleSize * U_BYTE;
}

void * initAm(double sampleRate, double amplitude, double frequency,
		double frequencyDelta, uintmax_t sampleSize) {
	Am * ret = calloc(1, sizeof(Am));
	double frq[] = { frequency, frequency + frequencyDelta };

	ret->mod.filter = initGoertzel(ret, frq, 2);
	ret->mod.name = "AM";
	ret->mod.sampleRate = sampleRate;
	ret->mod.amplitude = amplitude;
	ret->mod.frequency = frequency;
	ret->mod.pulsation = 2 * M_PI * frequency;
	ret->mod.sampleSize = sampleSize;

	ret->mod.modulate = &amModulate;
	ret->mod.demodulate = &amDemodulate;
	ret->mod.oSize = &amOSize;

	ret->frequencyDelta = frequencyDelta;
	ret->pulsationDelta = 2 * M_PI * frequencyDelta;

	return ret;
}
