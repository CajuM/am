#ifndef AM_ENC_H
#define AM_ENC_H

#include <stdint.h>

typedef void * Frame;

typedef struct {
	char * name;
	uintmax_t frameSize;
	uintmax_t dataSize;
	Frame (* encapsulate) (void * enc, uint8_t * data, uintmax_t len);
	uint8_t * (* decapsulate) (void * enc, Frame frm);
	int (* check) (void * enc, Frame frm);
} Encapsulation;

#endif
