set(CFLAGS "-O3 -mtune=native -ffast-math -fomit-frame-pointer -unroll-loops -dA")

set(SRC
	kiss_fft.c
	tools/kiss_fftr.c
)

include_directories(
	./
	../	
)

add_library(kiss_fft STATIC ${SRC})
