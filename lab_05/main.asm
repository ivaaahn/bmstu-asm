.186
SSEG segment para STACK 'STACK'
    db 100 DUP('?')             ; temporary '?' -> 0
SSEG ends

ISEG segment para public 'DATA'
    INPUT_ROWS_MSG db "Enter num of rows: $"
    INPUT_COLS_MSG db "Enter num of cols: $"
    INPUT_MTRX_MSG db "Enter matrix: $"
ISEG ends

MTRX_SEG segment para public 'DATA'
    matrRows db 0
    matrCols db 0

    matrix LABEL byte
    db 81 DUP('X')              ; temporary 'X' -> 0
MTRX_SEG ends


CSEG segment para public 'CODE'
assume ss:SSEG, cs:CSEG, ds:ISEG, es:MTRX_SEG

main:
    mov ax, ISEG
    mov ds, ax

    mov ax, MTRX_SEG
    mov es, ax

    call readDimens

    ; mov dl, es:M_ROWS
    ; call PRINT_INT

   

    ; mov dl, es:M_COLS
    ; call PRINT_INT
    ; call CRLF

    call readMatrix
    call newLine
    call printMatrix

    jmp exit


readDimens proc near
    mov dx, offset INPUT_ROWS_MSG
    call printStr

    call readInt
    mov es:matrRows, al
    call newLine

    mov dx, offset INPUT_COLS_MSG
    call printStr

    call readInt
    mov es:matrCols, al
    call newLine

    ret
readDimens endp



readMatrix proc near
    mov si, offset es:matrix

    mov cl, es:matrRows
    rowsLoop:
        push cx

        mov cl, es:matrCols
        colsLoop:
            call readInt
            mov [si], al
            inc si
            call putSpace
            loop colsLoop

        call newLine
        pop cx
        loop rowsLoop
    ret
readMatrix endp


printMatrix proc near
    mov si, offset es:matrix
    mov cl, es:matrRows
    rowsLoop:
        push cx

        mov cl, es:matrCols
        colsLoop:
            mov dl, [si]
            call putInt
            inc si
            call putSpace
            loop colsLoop

        call newLine
        pop cx
        loop rowsLoop
    ret
printMatrix endp


putSpace proc near
    mov dl, 32
    call PUTCH
    ret
putSpace endp

putCh proc near
    mov ah, 02h
    int 21h
    ret
putCh endp

printStr proc near
    mov ah, 09h
    int 21h
    ret
printStr endp


putInt proc near
    add dl, 30h
    call PUTCH
    ret
putInt endp

readInt proc near
    call getCh
    sub al, 30h
    ret
readInt endp

getCh proc near
    mov ah, 01h
    int 21h
    ret
getCh endp

newLine proc near
    CR equ 0Dh
    LF equ 0Ah

    mov ah, 02h
    
    mov DL, CR
    int 21h    
    mov DL, LF
    int 21h

    ret
newLine endp

exit:
	mov AH, 4Ch
	int 21h

CSEG ends

end main