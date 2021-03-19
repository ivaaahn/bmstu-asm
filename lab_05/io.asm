public putSpace
public putCh
public getCh
public putInt
public readInt
public printStr
public newLine


codeSeg segment para public 'CODE'

putSpace proc near
    mov dl, 32
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
    add dl, 30h
    call putCh
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

codeSeg ends
end