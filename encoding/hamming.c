#include "encoding.h"

uint8_t * hmEncode(uint8_t *data, uintmax_t len) {
	uintmax_t i, j;
	uint8_t t;
	uint8_t * rez = (uint8_t *) calloc(sizeof(uint8_t), (len * 7) / 4);
	for (i = 0; i < len * 2; i++) {
		t = data[i / 2];
		if (i % 2 == 0)
			t = t >> 4;
		t &= (uint8_t) 0x0F;
		t += (get_bit(t, 6) ^ get_bit(t, 7) ^ get_bit(t, 8)) << 6;
		t += (get_bit(t, 5) ^ get_bit(t, 7) ^ get_bit(t, 8)) << 5;
		t += (get_bit(t, 5) ^ get_bit(t, 6) ^ get_bit(t, 8)) << 4;
		t <<= 1;
		for (j = 1; j < 8; j++) {
			rez[(i * 7 + j - 1) / 8] += get_bit(t, j)
					<< (7 - ((i * 7 + j - 1) % 8));
		}
	}
	return rez;
}

uint8_t * hmDecode(uint8_t *data, uintmax_t len) {
	uint8_t * rez = calloc(sizeof(char), len * 4 / 7);
	uint8_t bl;
	uint8_t hb;
	uint8_t sind;
	int i, j;
	for (i = 0; i < len * 8 / 7; i++) {
		bl = 0;
		for (j = 0; j < 7; j++)
			bl += get_bit(data[(i * 7 + j) / 8], ((i * 7 + j) % 8) + 1)
					<< (7 - j);
		bl >>= 1;
		sind = (get_bit(bl, 2) ^ get_bit(bl, 6) ^ get_bit(bl, 7)
				^ get_bit(bl, 8)) << 2;
		sind += (get_bit(bl, 3) ^ get_bit(bl, 5) ^ get_bit(bl, 7)
				^ get_bit(bl, 8)) << 1;
		sind += (get_bit(bl, 4) ^ get_bit(bl, 5) ^ get_bit(bl, 6)
				^ get_bit(bl, 8)) << 0;
		if (sind != 0) {
			//	printf("corecting error %s %d %d\n", byte_to_binary(bl), i, sind);
			bl = flip_bit(bl, sind + 1);
		}
		hb = (get_bit(bl, 5) << 3) + (get_bit(bl, 6) << 2)
				+ (get_bit(bl, 7) << 1) + (get_bit(bl, 8) << 0);
		rez[i / 2] += hb << (i % 2 ? 0 : 4);

	}
	return rez;
}

Encoding initHm() {
	Encoding ret;

	ret.decode = hmDecode;
	ret.encode = hmEncode;

	return ret;
}
