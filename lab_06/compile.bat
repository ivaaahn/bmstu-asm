ml /c main.asm 
ml /c printBin.asm
ml /c printDec.asm
ml /c readHex.asm
ml /c io.asm 

ml /Fe app.exe printBin.obj printDec.obj main.obj readHex.obj io.obj

del main.obj
del readHex.obj
del io.obj
del printBin.obj
del printDec.obj
