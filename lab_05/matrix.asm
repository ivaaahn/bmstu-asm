extrn putSpace: near, newLine: near, putCh: near, putInt: near
extrn readInt: near, readNat: near, printStr: near, getCh: near

MAX_ROWS equ 9
MAX_COLS equ 9

OK equ 0
ERR equ 1

matrixSeg segment para public 'DATA'
    matrRows db 0
    matrCols db 0

    matrix label byte
    db MAX_COLS * MAX_ROWS dup(0)
matrixSeg ends

codeSeg segment para public 'CODE'
assume cs:codeSeg, es:matrixSeg

initMatrix proc near
    mov ax, matrixSeg
    mov es, ax
    ret
initMatrix endp

calculate proc near
    xor bx, bx    
    cmp es:matrCols, 1  
    je done

    mov cl, es:matrRows
    rowsLoop:
        push cx

        mov cl, es:matrCols
        dec cl
        xor si, si
        colsLoop:
            mov al, es:matrix[bx][si]
            add al, es:matrix[bx][si + 1]

            cmp al, 10
            jb less10
            sub al, 10
            less10:

            mov es:matrix[bx][si], al 
            inc si
            loop colsLoop
        inc si

        pop cx
        add bl, es:matrCols
        loop rowsLoop

    done:
        ret
calculate endp


readDimens proc near
    call readNat
    cmp dl, ERR
    je errorRead

    mov es:matrRows, al
    call putSpace

    call readNat
    cmp dl, ERR
    je errorRead

    mov es:matrCols, al
    call newLine

    successRead:
        mov dl, OK
        ret

    errorRead:
        mov dl, ERR
        ret
readDimens endp


readMatrix proc near
    xor bx, bx
    mov cl, es:matrRows
    rowsLoop:
        push cx

        mov cl, es:matrCols
        xor si, si
        colsLoop:
            call readInt

            cmp dl, ERR
            je errorRead

            mov es:matrix[bx][si], al
            inc si
            call putSpace
            loop colsLoop

        call newLine
        pop cx
        add bl, es:matrCols
        loop rowsLoop

    successRead:
        mov dl, OK
        ret
    
    errorRead:
        mov dl, ERR
        pop cx
        ret
readMatrix endp


printMatrix proc near
    call newLine

    xor bx, bx
    mov cl, es:matrRows
    rowsLoop:
        push cx

        mov cl, es:matrCols
        xor si, si
        colsLoop:
            mov dl, es:matrix[bx][si]
            call putInt
            inc si
            call putSpace
            loop colsLoop

        call newLine
        pop cx
        add bl, es:matrCols
        loop rowsLoop
    ret
printMatrix endp


codeSeg ends
end

