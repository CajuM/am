#ifndef AM_IO_H
#define AM_IO_H

#include <stdint.h>

typedef struct {
	void (* write) (void * io, void * buf, uintmax_t len);
	void * (* read)(void * io, uintmax_t len);
	void (* close) (void * io);
} Io;

#endif
