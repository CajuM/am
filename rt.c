#include "rt.h"

uint8_t get_bit(uint8_t byte, uint8_t poz) {
	return (byte >> (8 - poz)) & (uint8_t) 0x01;
}

uint8_t flip_bit(uint8_t byte, uint8_t poz) {
	return byte ^ (((uint8_t) 0x01) << (8 - poz));
}

void mmpush(void *dst, uintmax_t ld, void *src, uintmax_t ls) {
	void *tmp = malloc(ld - ls);
	memcpy(tmp, dst + ls, ld - ls);
	memcpy(dst, tmp, ld - ls);
	memcpy(dst + ld - ls, src, ls);
	free(tmp);
}

int mmcmp(void *s1, void *s2, int len) {
	int i;
	for (i = 0; i < len; i++)
		if (*((uint8_t *) s1 + i) != *((uint8_t *) s2 + i))
			return i + 1;
	return len;
}

void flushfb(void * buf, uintmax_t len) {
	int i;
	for (i = 0; i < len; i++)
		((uint8_t *) buf)[i] = 0;
}

const char * byte_to_binary(uint8_t x) {
	static char b[9];
	b[0] = '\0';

	int z;
	for (z = 128; z > 0; z >>= 1) {
		strcat(b, ((x & z) == z) ? "1" : "0");
	}

	return b;
}
