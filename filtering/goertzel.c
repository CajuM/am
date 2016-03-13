#include <math.h>
#include <stdlib.h>

#include "filter.h"
#include "modulation.h"

double * goertzel(void * filter, int * buf, uintmax_t len) {
	Filter * flt = filter;
	Modulation * mod = (Modulation *)(flt->modulation);
	double * ret = malloc(sizeof(double) * flt->frequenciesNr);

	for (uintmax_t i = 0; i < flt->frequenciesNr; i++) {
		double omega = (2.0 * M_PI * flt->frequencies[i]) / mod->sampleRate;
		double coeff = 2.0 * cos(omega);

		double Q1 = 0, Q2 = 0;
		for (uintmax_t j = 0; j < len; j++) {
			double Q0 = coeff * Q1 - Q2 + buf[j];
			Q2 = Q1;
			Q1 = Q0;
		}
		ret[i] = sqrt(Q1*Q1 + Q2*Q2 - coeff*Q1*Q2);
	}
	return ret;
}

void * initGoertzel(void * mod, double * frequencies, uintmax_t nrfq) {
	Filter * ret = calloc(1, sizeof(Filter));

	ret->modulation = mod;
	ret->frequencies = frequencies;
	ret->frequenciesNr = nrfq;
	ret->filter = &goertzel;

	return ret;
}
