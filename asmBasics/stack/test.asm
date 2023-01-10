section .data
        digit db 0,10 ; a char 0, if 48 is added then become integer 0
        digitLen equ $ - digit


section .text
        global _start

_start:
	push 3
	pop rax
        call _printDigit

        ; exit sys call to exit the program( other wise seg fault)
        mov rax,60
        mov rdi,0
        syscall

_printDigit:
        add rax,48 ; since 48 is ASCII of 0 character ( 48 + that no == that no in decimal)
        mov [digit],al ;mov al reg val on the add of digit (ex: *digit = 51)
        mov rax,1
        mov rdi,1
        mov rsi,digit
        mov rdx,digitLen
        syscall
        ret

