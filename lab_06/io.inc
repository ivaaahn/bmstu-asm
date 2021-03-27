LF  equ  0Ah ; 10
CR  equ  0Dh ; 13

SpaceASCII      equ     20h
ZeroASCII       equ     30h

DigitsOffset        equ     ZeroASCII
CapLettersOffset    equ     DigitsOffset + 7 
SmallLettersOffset  equ     DigitsOffset + 39

FuncGetch            equ    1
FuncPutch            equ    2
FuncGetchWithoutEcho equ    8
FuncPrintStr         equ    9
