section .data
	text1 db "i am string one",10
	text1Len equ $ - text1

	text2 db "i am string two",10
        text2Len equ $ - text2

section .text
	global _start

_start:
	call _printText1
	call _printText2

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

_printText2:
        mov rax,1
        mov rdi,1
        mov rsi,text2
        mov rdx,text2Len
        syscall
        ret
