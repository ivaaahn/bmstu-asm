PUBLIC output_X
EXTRN X: byte

SYM 	equ		2 			; size of 1 symbol is 2 bytes
LINE 	equ 	80 * SYM 	; size of 1 symb * 80 symbols

DS2 SEGMENT AT 0b800h
	CA LABEL word			; WTF
	ORG LINE + SYM * 5		; 80*2 - line, 80*2*2 - 2 lines,  80*2*2 + 2*2 - to 3rd sym
	SYMB LABEL word	
DS2 ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSEG, ES:DS2
output_X proc near
	mov ax, DS2
	mov es, ax
	
	mov ah, 10 				;00001010b
	mov al, X
	mov symb, ax
	ret
output_X endp
CSEG ENDS
END