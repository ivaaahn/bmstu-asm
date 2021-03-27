public newLine
include io.inc

codeSeg segment para public 'CODE'

newLine proc near
    mov ah, FuncPutch
    
    mov dl, CR
    int 21h    
    
    mov dl, LF
    int 21h

    ret
newLine endp

codeSeg ends
end
