#include <stdio.h>
#include <stdlib.h>
#include <pulse/error.h>
#include <pulse/simple.h>

#include "pulse.h"

pa_simple * get_ch(int sampleRate) {
	pa_simple *s;
	pa_sample_spec ss;
	ss.format = PA_SAMPLE_S32LE;
	ss.channels = 1;
	ss.rate = sampleRate;
	int err = 0;
	s = pa_simple_new(NULL, // Use the default server.
			"AM-chat", // Our application's name.
			PA_STREAM_RECORD,
			NULL, // Use the default device.
			"AM-rx", // Description of our stream.
			&ss, // Our sample format.
			NULL, // Use default channel map
			NULL, // Use default buffering attributes.
			&err // Ignore error code.
	);
	if (!s)
		printf("error: %s\n", pa_strerror(err));
	return s;
}


pa_simple *get_pl(int sampleRate) {
	pa_simple *s;
	pa_sample_spec ss;
	ss.format = PA_SAMPLE_S32LE;
	ss.channels = 1;
	ss.rate = sampleRate;
	int err = 0;
	s = pa_simple_new(NULL, // Use the default server.
			"AM-chat", // Our application's name.
			PA_STREAM_PLAYBACK,
			NULL, // Use the default device.
			"AM-tx", // Description of our stream.
			&ss, // Our sample format.
			NULL, // Use default channel map
			NULL, // Use default buffering attributes.
			&err // Ignore error code.
	);
	if (!s)
		printf("error: %s\n", pa_strerror(err));
	return s;
}

void * paRead(void * iov, uintmax_t len) {
	Pulse * pulse = iov;
	int err;
	void * buf = malloc(len);

	if (pa_simple_read(pulse->recorder, buf, len, &err))
		fprintf(stderr, "Error: %s\n", pa_strerror(err));

	return buf;
}

void paWrite(void * iov, void * buf, uintmax_t len) {
	Pulse * pulse = iov;
	int err;
	if (pa_simple_write(pulse->player, buf, len, &err))
		printf("error: %s\n", pa_strerror(err));
    if (pa_simple_drain(pulse->player, &err) < 0)
        fprintf(stderr, "Error: %s\n", pa_strerror(err));
}

void * initPulse(int sampleRate) {
	Pulse * ret = calloc(1, sizeof(Pulse));

	ret->io.write = &paWrite;
	ret->io.read = &paRead;

	ret->player = get_pl(sampleRate);
	ret->recorder = get_ch(sampleRate);


	return ret;
}

void paClose(Pulse * pa) {
	pa_simple_free(pa->player);
	pa_simple_free(pa->recorder);
}
