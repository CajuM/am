#ifndef AM_ENC1_H
#define AM_ENC1_H

#include "enc.h"

typedef struct __attribute__ ((packed)) {
	uint8_t start[2];
	uint8_t data[61];
	uint8_t crc;
} Enc1Frame;

void * initEnc1();

#endif
