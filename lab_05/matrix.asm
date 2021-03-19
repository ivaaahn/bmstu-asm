extrn putSpace: near
extrn putCh: near
extrn getCh: near
extrn putInt: near
extrn readInt: near
extrn printStr: near
extrn newLine: near

public readDimens
public readMatrix
public printMatrix

interfSeg segment para public 'DATA'
    inputRowsMsg db "Enter num of rows: $"
    inputColsMsg db "Enter num of cols: $"
    inputMatrixMsg db "Enter matrix: $"
    resultMatrixMsg db "Result matrix: $"
interfSeg ends

matrixSeg segment para public 'DATA'
    matrRows db 0
    matrCols db 0

    matrix label byte
    db 81 dup('X')              ; temporary 'X' -> 0
matrixSeg ends


codeSeg segment para public 'CODE'
assume cs:codeSeg, ds:interfSeg, es:matrixSeg

initSegs proc near
    mov ax, interfSeg
    mov ds, ax
    mov ax, matrixSeg
    mov es, ax
    ret
initSegs endp

calculate proc near
    call initSegs

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
calculate endp


readDimens proc near
    call initSegs

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
    call initSegs

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
    call initSegs

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

codeSeg ends
end

