amplitude modulation
====================

A POC for intercomputer communication via sound waves.
The program first tests that it's parameters work and generates a wav file in which is an encoded a message. Then it starts listening on the microphone for recieved messages. When a text is entered it modulates the signal end sends it through the sound speaker. The program uses crc8 for error detection and hamming encoding for error corection. It also works at an astounding speed of less than 64Bpsi, and at a distance under one meeter(using builtin laptop audio harware)

prerequisites
-------------

In order to compile the program you will need the pulseaduio development files.
