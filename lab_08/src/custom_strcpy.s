section .text
    global _custom_strcpy
        

; Order: rdi, rsi, rdx, rcx ...
_custom_strcpy:
    ; rdi - dest string
    ; rsi - src string
    ; rdx - size

_check_nullptr:
    test rdi, rdi
    je _copy_end

    test rsi, rsi
    je _copy_end 

    mov rcx, rdx
    rep movsb 
    mov byte [rdi], 0

_copy_end:
    ret