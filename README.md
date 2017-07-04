amplitude modulation
====================

A program that makes to computers chat using sound waves, it supports AM and FM, it can also test that it's internal parameters are theoreticaly sane(practicaly is another story).

Usage
----------

    Usage: ./am
    -m|--modulation AM|AMO|AMM|FM default AMM, as it's the only one that cant't be heared if used with high frequencies
    -g|--genwav generates a wav file containing a frame, for testing purposes
    -t|--test outputs a frame into a buffer and attempts to read it
    -c|--chat sends a frame in a while loop over the speaker and listens for it on the microphone
    --frequency <float> the base frequency for the chosen modulation shceme default 22000
    --amplitude <float> the amplitude of the signal between 0 and 1 default 1
    -h|--help you're reading it

Prerequisites
-------------

In order to compile the program you will need the PortAudio development files and cmake.
