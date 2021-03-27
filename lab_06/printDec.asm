public convertDec
extrn number:word, newLine: near

include io.inc

dataSeg segment para public 'DATA'
    outputDec db 'Decimal format: $'
dataSeg ends

codeSeg segment para public 'CODE'
    assume cs:codeSeg, ds:dataSeg

convertDec proc near
    ; Пояснение вывода
    mov dx, offset outputDec
    mov ah, FuncPrintStr
    int 21h

    ; сохраняем число в ax
    mov ax, number

    ; проверяем на знак    
    cmp ax, 0
    jge numIsPositive

    numIsNegative:
        ; временно сохраняем AX
        push ax

        ; выводим минус
        mov ah, FuncPutch
        mov dl, '-'
        int 21h

        ; восстанавливаем AX
        ; и домножаем на -1
        pop ax
        neg ax
    
    numIsPositive:

    ; в CX храним кол-во цифр в ответе
    ; на старте зануляем.
    xor cx, cx

    ; в BX кладем делитель
    mov bx, 10
    decomposeLoop:
        ; в DX храним остаток от деления
        ; на старте зануляем.
        xor dx, dx  ; очистили dx

        ; ax = ax / bx
        div bx

        ; dx = ax % bx
        ; Остаток пушим на стек
        push dx
       
        ; Обновляем счетчик цифр
        inc cx

        ; if (ax == 0) break;
        or ax, ax
        jne decomposeLoop

    mov ah, FuncPutch
    displayLoop:
        ; Берем цифру со стека (ASCII)
        pop dx
        
        ; Переводим ее в число
        add dl, ZeroASCII
        int 21h

        loop displayLoop

    ret
convertDec endp


codeSeg ends
end