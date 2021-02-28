StkSeg  SEGMENT PARA STACK 'STACK'
        DB 200h DUP (?)            ; alloc 512 bytes for the stack
StkSeg  ENDS

DataS   SEGMENT WORD 'DATA'
HelloMessage   DB 0Dh              ; '\r' (or DB 13)
               DB 0Ah              ; '\n' (or DB 10)
               DB 'Hello, world !' ;
               DB '$'              ; equ '\0' in C
DataS   ENDS

Code    SEGMENT WORD 'CODE'
        ASSUME CS:Code, DS:DataS

DispMsg:
        mov AX, DataS                
        mov DS, AX                      ; only through AX or any other common register
        mov DX, OFFSET HelloMessage     ; DS:DX - адрес строки
        mov AH, 09h                     ; АН=09h - print the string

        mov CX, 3                       ; cycle for 3 times (counter register CX)
        do_loop:
                int 21h              
                loop do_loop

        mov AH, 7                       ; АН=07h - input some symbol without echo
        int 21h
        mov AH, 4Ch                     ; АН=4Ch - exit
        int 21h

        
Code    ENDS
        END DispMsg                     ; start is DispMsg