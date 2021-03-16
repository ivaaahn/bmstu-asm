EXTRN X: byte
PUBLIC exit

SD2 SEGMENT para 'DATA'
	Y db 'Y'
SD2 ENDS

SC2 SEGMENT para public 'CODE'
	assume CS:SC2, DS:SD2
exit:
	mov ax, seg X 	; ES = SD1 = SEG(X)
	mov es, ax

	mov bh, es:X	; Кладем в BH ASCII код X (58).

	mov ax, SD2		; DS = SD2
	mov ds, ax

	xchg ah, Y		; Получим, что в AH ляжет Y (59), а sв Y ляжет AH, то есть какой-то мусор.
	xchg ah, ES:X   ; В ИКС ляжет значение AH (ASCII код игрека), а в AH ляжет ASCII код ИКСА
	xchg ah, Y		; Y = ES:X, AH = AH

	mov ah, 2
	mov dl, Y
	int 21h	
	
	mov ax, 4c00h
	int 21h
SC2 ENDS
END