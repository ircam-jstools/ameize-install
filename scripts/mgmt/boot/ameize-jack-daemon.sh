#!/bin/bash

nice -n -19 jackd -p 16 -R -P75 -dalsa -dhw:0 -p128 -n4 -s -r48000
