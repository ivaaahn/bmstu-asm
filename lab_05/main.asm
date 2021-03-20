.186

extrn readDimens: near, readMatrix: near, printMatrix: near
extrn printStr: near, calculate: near, newLine: near, initMatrix: near

OK equ 0
ERR equ 1

stackSeg segment para STACK 'STACK'
    db 100 dup(0)
stackSeg ends

interfSeg segment para public 'DATA'
    errorInputMsg db "Error Input! $"
    inputDimMsg db "Enter matrix dimension: $"
    inputMatrixMsg db "Enter matrix: $"
    resultMatrixMsg db "Result matrix: $"
interfSeg ends


codeSeg segment para public 'CODE'
assume ss:stackSeg, ds:interfSeg

main:
    mov ax, interfSeg
    mov ds, ax

    call initMatrix

    mov dx, offset inputDimMsg
    call printStr

    call readDimens
    cmp dl, ERR
    je errInput

    mov dx, offset inputMatrixMsg
    call printStr
    call newLine

    call readMatrix
    cmp dl, ERR
    je errInput


    call newLine
    
    call calculate

    mov dx, offset resultMatrixMsg
    call printStr
    call printMatrix

    jmp exit

errInput:
    call printError
    mov ah, 4ch
	int 21h

exit:
	mov ah, 4ch
	int 21h

printError proc near
    call newLine

    mov dx, offset errorInputMsg
    call printStr
    ret
printError endp

codeSeg ends
end main