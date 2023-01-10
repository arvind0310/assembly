section .data
    msg db "Hello, world!",10
    len equ $ - msg

section .text
global _start

_start:
    mov rax, 1    ; sys_write system call
    mov rdi,1
    mov rsi, msg  ; bytes to write
    mov rdx, len  ; number of bytes to write
    INT 0x80      ; perform system call

    mov rax, 60    ; sys_exit system call
    mov rdi,0
    int 0x80
