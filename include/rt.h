#ifndef AM_RT_H
#define AM_RT_H

#include <stdint.h>

uint8_t get_bit(uint8_t byte, uint8_t poz);
uint8_t flip_bit(uint8_t byte, uint8_t poz);
void mmpush(void *dst, uintmax_t ld, void *src, uintmax_t ls);
int mmcmp(void *s1, void *s2, int len);
void flushfb(void * buf, uintmax_t len);
const char * byte_to_binary(uint8_t x);

#endif
