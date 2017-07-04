project(am C)
cmake_minimum_required(VERSION 3.2)

find_package(PkgConfig)

add_subdirectory(kiss_fft130)

set(SRC
	main.c
	io/paudio.c
	io/wav.c
	encapsulation/enc1.c
	modulation/am.c
	modulation/amm.c
	modulation/amo.c
	modulation/fm.c
	filtering/goertzel.c
	crc8.c
	rt.c
)

pkg_check_modules(PORTAUDIO REQUIRED portaudio-2.0)

include_directories(
	./kiss_fft130
	./kiss_fft130/tools
	./include
	${PORTAUDIO_INCLUDE_DIRS}
)

link_libraries(
	${PORTAUDIO_LIBRARIES}
	pthread
	m
	kiss_fft
)

add_executable("am" ${SRC})
