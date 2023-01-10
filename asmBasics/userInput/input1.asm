section .data
        text1 db "what is your name?",10
        text1Len equ $ - text1

        text2 db "hello ",0
        text2Len equ $ - text2

section .bss
        name resb 16

section .text
        global _start

_start:
        call _printText1
        call _getName
	call _printText2
        call _showName

        mov rax,60 ; exit syscall
        mov rdi,0
        syscall


_printText1:
        mov rax,1 ;write syscall
        mov rdi,1 ; std o/p device
        mov rsi,text1
        mov rdx,text1Len
        syscall
        ret

_getName:
        mov rax,0 ;read syscall
        mov rdi,0 ;std i/p device
        mov rsi,name
        mov rdx,16 ; optional
        syscall
        ret

_printText2:
        mov rax,1
        mov rdi,1
        mov rsi,text2
        mov rdx,text2Len
        syscall
        ret

_showName:
        mov rax,1 ; write
        mov rdi,1
        mov rsi,name
        mov rdx,16
        syscall
        ret

