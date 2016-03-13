#ifndef AM_FILTER_H
#define AM_FILTER_H

#include <stdint.h>

typedef struct {
	void * modulation;
	double * frequencies;
	uintmax_t frequenciesNr;
	double * (* filter) (void * flt, int * buf, uintmax_t len);
} Filter;

void * initGoertzel(void * mod, double * frequencies, uintmax_t nrfq);

#endif
