all:
	gcc -o am am.c wav.c crc8.c -lpulse-simple -lpulse -lm
