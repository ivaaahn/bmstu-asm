.186
.model tiny

timerIntHandler equ 1Ch
autorepeatMode equ 0F3h
timesPerSecond equ 18
minSpeed equ 00011111b
maxSpeed equ 0

.code
org 100h    

main:
    jmp installer

oldHandler dd (0)               ; double word
currSpeed db minSpeed
counter db timesPerSecond

myHandler proc
    pusha
    push es
    push ds

    cmp counter, 0
    jne endHandling
    
    mov counter, timesPerSecond

speedUp:
    mov al, autorepeatMode
    out 60h, al

    call waiter

    mov al, currSpeed
    out 60h, al

    cmp currSpeed, maxSpeed
    jne speedIsNotMax

speedIsMax:
    mov currSpeed, minSpeed
    jmp endHandling

speedIsNotMax:
    dec currSpeed

endHandling:
    dec counter
    pop ds
    pop es
    popa

    jmp cs:oldHandler
myHandler endp

waiter proc
    in al,64h
    test al,0010b
    jnz waiter
    ret
waiter endp


installer proc
    mov ah, 35h                 ; возвращает в ES:BX адрес обработчика 
    mov al, timerIntHandler
    int 21h

    mov word ptr cs:oldHandler, bx
    mov word ptr cs:oldHandler+2, es

    ; Set my handler
    mov ah, 25h                 ; AL = номер прерывания, DS:DX - адрес обработчика
    mov al, timerIntHandler
    mov dx, offset myHandler
    int 21h

    mov dx, offset installer
    int 27h

    ret
installer endp

uninstaller proc
    mov ah, 25h
    mov al, timerIntHandler

    mov ds, word ptr cs:oldHandler+2
    mov dx, word ptr cs:oldHandler
    int 21h

exit:
	mov ah, 4ch
	int 21h
uninstaller endp
end main
