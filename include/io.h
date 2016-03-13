#ifndef AM_IO_H
#define AM_IO_H

#include <stdint.h>

typedef struct {
	void (* write) (void * io, int32_t * buf, uintmax_t len);
	int32_t * (* read)(void * io, uintmax_t len);
	void (* close) ();
} Io;

#endif
