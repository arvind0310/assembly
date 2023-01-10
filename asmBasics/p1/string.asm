section .data
	string DB "ABCD",0
section .text
	global _start

_start:
	mov bl,[string]
	mov eax,1
	INT 80h
