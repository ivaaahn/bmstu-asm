.186

extrn readDimens: near
extrn readMatrix: near
extrn printMatrix: near
extrn calculate: near
extrn newLine: near


stackSeg segment para STACK 'STACK'
    db 100 dup('?')   ; temporary '?' -> 0
stackSeg ends


codeSeg segment para public 'CODE'
assume ss:stackSeg

main:
    call readDimens
    call newLine

    call readMatrix
    call newLine
    
    call calculate
    call printMatrix

    jmp exit
exit:
	mov ah, 4ch
	int 21h

codeSeg ends
end main