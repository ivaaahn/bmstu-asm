.186


;; TODO: раскидать по модулям 


SSEG segment para STACK 'STACK'
    db 100 DUP('?')             ; temporary '?' -> 0
SSEG ends

ISEG segment para public 'DATA'
    inputRowsMsg db "Enter num of rows: $"
    inputColsMsg db "Enter num of cols: $"
    inputMatrixMsg db "Enter matrix: $"
    resultMatrixMsg db "Result matrix: $"
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
    call newLine

    call readMatrix
    call newLine
    
    call calc

    call printMatrix

    jmp exit


calc proc near
    mov dx, offset inputMatrixMsg
    mov si, offset es:matrix
    
    mov cl, es:matrRows
    rowsLoop:
        push cx

        mov cl, es:matrCols
        sub cl, 1
        colsLoop:
            mov al, [si]
            add al, [si + 1]

            ; Написать оптимальнее?
            ;;;;;;;;;;;;;;;;;
            cmp al, 10
            jb ok
            sub al, 10
            ok:
            ;;;;;;;;;;;;;;;;;

            mov [si], al 
            inc si
            loop colsLoop
        inc si

        pop cx
        loop rowsLoop
    ret
calc endp


readDimens proc near
    mov dx, offset inputRowsMsg
    call printStr

    call readInt
    mov es:matrRows, al
    call newLine

    mov dx, offset inputColsMsg
    call printStr

    call readInt
    mov es:matrCols, al
    call newLine

    ret
readDimens endp


readMatrix proc near
    mov dx, offset inputMatrixMsg
    call printStr
    call newLine

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
    mov dx, offset resultMatrixMsg
    call printStr
    call newLine

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