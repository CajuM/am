#include "kiss_fftr.h"

#include "filter.h"

double * fft(Filter * flt, int * buf, uintmax_t len) {
	double * ret = malloc(sizeof(double) * flt->frequenciesNr);
	kiss_fftr_cfg fft_cfg = kiss_fftr_alloc(len, 0, NULL, NULL);
	kiss_fft_scalar *fin = malloc(sizeof(kiss_fft_scalar) * len);
	kiss_fft_cpx *fout = malloc(sizeof(kiss_fft_cpx) * (len / 2 + 1));
	for (uintmax_t i = 0; i < len; i++) {
		fin[i] = buf[i];
	}
	kiss_fftr(fft_cfg, fin, fout);
	for (int i = 0; i < flt->frequenciesNr; i++) {
		int bin = flt->frequencies[i] * len / flt->modulation->sampleRate;
		ret[i] = sqrt(fout[bin].r * fout[bin].r + fout[bin].i * fout[bin].i);
	}
	free(fin);
	free(fout);
	free(fft_cfg);
	return ret;
}

Filter * fftInit(double * frequencies, uintmax_t nrfq, uintmax_t bins) {
	Filter * ret = calloc(sizeof(Filter));

	ret->frequencies = frequencies;
	ret->frequenciesNr = nrfq;
	ret->filter = fft;

	return ret;
}
