extrn readNumber: near, newLine: near
extrn convertBin: near, convertDec: near

include io.inc

stackSeg segment para STACK 'STACK'
    db 100 dup(0)
stackSeg ends


dataSeg segment para public 'DATA'
    menu    db LF, LF, 'Choose action:', CR, LF, LF
            db '0. Input signed hex number', CR, LF
            db '1. Convert to unsigned binary', CR, LF
            db '2. Convert to signed decimal', CR, LF, LF
            db '3. Exit program', CR, LF, LF,'$'
    actions dw readNumber, convertBin, convertDec, exit
dataSeg ends


codeSeg segment para public 'CODE'
    assume ss:stackSeg, ds:dataSeg, cs:codeSeg

printMenu proc near
    mov dx, offset menu
    mov ah, FuncPrintStr
    int 21h
    ret
printMenu endp


readAction proc near
    mov ah, FuncGetchWithoutEcho
    int 21h
    cmp al, '3'
    ja readAction
    cmp al, '0'
    jb readAction

    sub al, '0'

    mov cl, 2
    mul cl

    mov si, ax
    ret
readAction endp

main:
    mov ax, dataSeg
    mov ds, ax

    eventLoop:
        call printMenu
        call readAction
        call actions[si]
        jmp eventLoop

exit proc near
	mov ah, 4ch
	int 21h
exit endp

codeSeg ends
end main