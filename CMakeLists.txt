project(am C)
cmake_minimum_required(VERSION 3.2)

add_subdirectory(kiss_fft130)

set(SRC
	main.c
	io/pulse.c
	io/wav.c
	encapsulation/enc1.c
	modulation/am.c
	modulation/amo.c
	modulation/fm.c
	filtering/goertzel.c
	crc8.c
	rt.c
)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

find_package(LibPulseSimple REQUIRED)

include_directories(
	./kiss_fft130
	./kiss_fft130/tools
	./include
	${PULSEAUDIO_INCLUDE_DIRS}
)

link_libraries(
	${PULSEAUDIO_LIBRARIES}
	pthread
	m
	kiss_fft
)

add_executable("am" ${SRC})
