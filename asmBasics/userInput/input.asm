section .data
	text1 db "enter a string?",0
	text1Len equ $ - text1

section .bss
	name resb 16

section .text
	global _start

_start:
	call _printText1
	call _getName
	call _showName

	mov rax,60
        mov rdi,0
        syscall




_printText1:
	mov rax,1
	mov rdi,1
	mov rsi,text1
	mov rdx,text1Len
	syscall
	ret

_getName:
	mov rax,0
	mov rdi,0
	mov rsi,name
	mov rdx,16 ;optional
	syscall
	ret

_showName:
        mov rax,1
        mov rdi,1
        mov rsi,name
        mov rdx,16
        syscall
        ret

