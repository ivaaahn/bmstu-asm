public readNumber, number
extrn newLine: near

include io.inc

MinusExist      equ     1
MinusNoExist    equ     0

dataSeg segment para public 'DATA'
    number dw 0
    inputMsg db 'Enter signed hex number (from -8000 to 7FFF): $'
dataSeg ends


codeSeg segment para public 'CODE'
    assume ds:dataSeg, cs:codeSeg


readNumber proc near

    ; Вывод приглашения к вводу
    mov dx, offset inputMsg
    mov ah, FuncPrintStr
    int 21h

    ; В dx собираем число
    mov dx, 0

    ; Проверяем наличие минуса в начале
    mov ah, FuncGetch
    int 21h

    cmp al, '-'
    je numberIsNegative

    numberIsPositive:
        mov bl, MinusNoExist
        call handleHexDigit
        mov dl, al
        jmp constructProcess

    numberIsNegative:
        mov bl, MinusExist

    constructProcess:
        ; Считываем ASCII символ 16-ричной цифры
        mov ah, FuncGetch
        int 21h

        ; Выходим из цикла если встречаем <Enter>
        cmp al, CR
        je endProcess

        ; Вызываем обработчик цифр (0-9, A-F, a-f)
        call handleHexDigit

        ; Сохраняем уже саму цифру в CL
        mov cl, al

        ; dx *= 16
        mov ax, 16
        mul dx
        mov dx, ax

        ; dx += cx
        add dx, cx

        jmp constructProcess


    endProcess:

    ; Если был минус, то домножаем число на -1
    cmp bl, MinusNoExist
    je endRead
    neg dx

    endRead:
        mov Number, dx
        ret

readNumber endp

handleHexDigit proc near
    cmp al, 'a'
    jae smallLetter

    cmp al, 'A'
    jae capLetter

    digit:
        sub al, DigitsOffset
        jmp endHandling

    capLetter:
        sub al, CapLettersOffset
        jmp endHandling
        
    smallLetter:
        sub al, SmallLettersOffset
        jmp endHandling

    endHandling:
        ret
handleHexDigit endp


codeSeg ends
end