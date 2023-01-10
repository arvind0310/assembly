section .data
	num DD 5 ;db->1byte, dw->2byte,dd->4byte, dt->32byte

section .text
global _start

_start:
	MOV eax,1
	MOV ebx,[num]
	INT 80h

;way to assemble --

;nasm -f elf64 -o data.o data.asm

;ld data.o -o data

;to see o/p (exit status) -> echo $? on shell
