public convertBin
extrn number:word, newLine: near

include io.inc

dataSeg segment para public 'DATA'
    outputBin db 'Binary format: $'
dataSeg ends

codeSeg segment para public 'CODE'
    assume cs:codeSeg, ds:dataSeg

convertBin proc near
    ; Пояснение вывода
    mov dx, offset outputBin
    mov ah, FuncPrintStr
    int 21h

    ; Сохраняем число в BX
    mov bx, number

    ; for (i=0; i<16; i++)
    mov cx, 16
    printLoop:
        ; Выдавливаем левый бит в флаг переноса
        shl bx, 1

        ; jump if carry
        jc print1

        print0:
            mov dl, '0'
            jmp endIteration
        
        print1: 
            mov dl, '1'

        endIteration:
            mov ah, FuncPutch
            int 21h
            loop printLoop

    ret
convertBin endp

codeSeg ends
end