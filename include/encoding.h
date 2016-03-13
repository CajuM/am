#ifndef AM_ENCODING_H
#define AM_ENCODING_H

#include <stdint.h>

typedef struct {
	uint8_t * (* encode) (uint8_t *data, uintmax_t len);
	uint8_t * (* decode) (uint8_t *data, uintmax_t len);
} Encoding;

#endif
