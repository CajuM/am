#include <stdlib.h>
#include <string.h>

#include "enc1.h"

extern uint8_t crc8(const void *vptr, int len);

Frame enc1Encapsulate(void * enc, uint8_t * data, uintmax_t len) {
	Encapsulation * enc1 = enc;
	Enc1Frame * frm = calloc(1, sizeof(Enc1Frame));
	frm->start[0] = 0xFF;
	frm->start[1] = 0x00;
	memcpy(frm->data, data, (len < (enc1->frameSize - 3)) ? len : (enc1->frameSize - 3));
	frm->crc = crc8(frm->data, enc1->frameSize - 3);
	return frm;
}

int enc1Check(void * enc, Frame frm) {
	Encapsulation * enc1 = enc;
	Enc1Frame * fram = frm;
	if (fram->start[0] != (uint8_t) 0xFF)
		return 0;
	if (fram->start[1] != (uint8_t) 0x00)
		return 0;
	if (crc8(fram->data, 61) != fram->crc)
		return 0;
	return 1;
}

uint8_t * enc1Decapsulate(void * enc, Frame frm) {
	Enc1Frame * fram = frm;
	uint8_t * ret = malloc(sizeof(uint8_t) * 63);
	memcpy(ret, fram->data, 63);
	return ret;
}

void * initEnc1() {
	Encapsulation * ret = calloc(1, sizeof(Encapsulation));

	ret->name = "enc1";
	ret->frameSize = 64;
	ret->dataSize = 61;
	ret->encapsulate = &enc1Encapsulate;
	ret->decapsulate = &enc1Decapsulate;
	ret->check = &enc1Check;

	return ret;
}
