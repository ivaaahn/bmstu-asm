#!/bin/bash

if [[ ! -d dis ]]
then 
	mkdir dis
fi


gcc -DASM -I./includes/ -masm=intel -O0 -S -DX87 -m80387 -mfpmath=387 sources/measures32.c -o ./dis/32b_x87.s -lm
gcc -DASM -I./includes/ -masm=intel -O0 -S -DX87 -mno-80387 sources/measures32.c -o ./dis/32b_no_x87.s -lm


gcc -DASM -I./includes/ -masm=intel -O0 -S -DX87 -m80387 -mfpmath=387 sources/measures64.c -o ./dis/64b_x87.s -lm
gcc -DASM -I./includes/ -masm=intel -O0 -S -DX87 -mno-80387 sources/measures64.c -o ./dis/64b_no_x87.s -lm


gcc -DASM -I./includes/ -masm=intel -O0 -S -DX87 -m80387 -mfpmath=387 sources/measures80.c -o ./dis/80b_no_x87.s -lm

gcc -DASM -I./includes/ -masm=intel -O0 -S -DX87 -m80387 -mfpmath=387 sources/measures_sin.c -o ./dis/sin_x87.s -lm
gcc -DASM -I./includes/ -masm=intel -O0 -S -DX87 -mno-80387 sources/measures_sin.c -o ./dis/sin_no_x87.s -lm