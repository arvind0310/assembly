section .data
	num1 DB 1
	num2 DB 2
section .text
global _start

_start:
	;MOV ebx,[num1]
        MOV bl,[num1]
	;MOV ecx,[num2]
       	MOV cl,[num2]
	MOV eax,1
	INT 80h


