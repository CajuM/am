all:
	gcc -o am -lpulse-simple -lpulse -lm am.c wav.c crc8.c
