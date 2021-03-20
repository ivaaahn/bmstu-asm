zeroASCII equ 30h
spaceASCII equ 32
CR equ 0Dh
LF equ 0Ah

OK equ 0
ERR equ 1

codeSeg segment para public 'CODE'

putSpace proc near
    mov dl, spaceASCII
    call putCh
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
    add dl, zeroASCII
    call putCh
    ret
putInt endp


isInt proc near
    cmp al, '0'
    jl false

    cmp al, '9'
    jg false

    true:
        mov dl, OK
        ret

    false:
        mov dl, ERR
        ret
isInt endp

isNat proc near
    cmp al, '0'
    je false
    
    call isInt
    cmp dl, ERR
    je false

    true:
        mov dl, OK
        ret

    false:
        mov dl, ERR
        ret
isNat endp


readInt proc near
    call getCh
    call isInt
    sub al, zeroASCII
    ret
readInt endp

readNat proc near
    call getCh
    call isNat
    sub al, zeroASCII
    ret
readNat endp

getCh proc near
    mov ah, 01h
    int 21h
    ret
getCh endp

newLine proc near
    mov ah, 02h
    
    mov dl, CR
    int 21h    
    
    mov dl, LF
    int 21h

    ret
newLine endp

codeSeg ends
end