#include <stdio.h>
#include <stdlib.h>

#include "wav.h"

static void writeLittleEndian(unsigned int word, int num_bytes, FILE *wav_file) {
	unsigned buf;
	while (num_bytes > 0) {
		buf = word & 0xff;
		fwrite(&buf, 1, 1, wav_file);
		num_bytes--;
		word >>= 8;
	}
}

/* information about the WAV file format from

 http://ccrma.stanford.edu/courses/422/projects/WaveFormat/

 */

void wavWrite(void * v, void * buf, uintmax_t len) {
	Wav * wav = v;
	int32_t * data = buf;

	uint32_t bytes_per_sample = 4;
	uint32_t num_channels = 1;

	len /= bytes_per_sample;

	fseek(wav->file, 44 + wav->len * bytes_per_sample * num_channels, SEEK_SET);
	for (uint32_t i = 0; i < len; i++) {
		writeLittleEndian((unsigned int) (data[i]), bytes_per_sample,
				wav->file);
	}
	wav->len += len;
}

void wavClose(void * v) {
	Wav * wav = v;

	unsigned int num_channels;
	unsigned int bytes_per_sample;
	unsigned int byte_rate;
	unsigned long i; /* counter for samples */

	num_channels = 1; /* monoaural */
	bytes_per_sample = 4;

	byte_rate = wav->sampleRate * num_channels * bytes_per_sample;

	fseek(wav->file, 0, SEEK_SET);
	/* write RIFF header */
	fwrite("RIFF", 1, 4, wav->file);
	writeLittleEndian(36 + bytes_per_sample * wav->len * num_channels, 4,
			wav->file);
	fwrite("WAVE", 1, 4, wav->file);

	/* write fmt  subchunk */
	fwrite("fmt ", 1, 4, wav->file);
	writeLittleEndian(16, 4, wav->file); /* SubChunk1Size is 16 */
	writeLittleEndian(1, 2, wav->file); /* PCM is format 1 */
	writeLittleEndian(num_channels, 2, wav->file);
	writeLittleEndian(wav->sampleRate, 4, wav->file);
	writeLittleEndian(byte_rate, 4, wav->file);
	writeLittleEndian(num_channels * bytes_per_sample, 2, wav->file); /* block align */
	writeLittleEndian(8 * bytes_per_sample, 2, wav->file); /* bits/sample */

	/* write data subchunk */
	fwrite("data", 1, 4, wav->file);
	writeLittleEndian(bytes_per_sample * wav->len * num_channels, 4, wav->file);

	fclose(wav->file);
}

void * initWav(char * fname, double sampleRate) {
	Wav * ret = calloc(1, sizeof(Wav));

	ret->len = 0;
	ret->file = fopen(fname, "w+b");
	ret->sampleRate = sampleRate;

	ret->io.write = &wavWrite;
	ret->io.read = NULL;
	ret->io.close = &wavClose;

	return ret;
}
