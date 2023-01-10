section .data
  msg: db "Hello, world!", 10
  msglen: equ $ - msg

section .text
        global _start

_start:
  mov eax, 4        ; write sys call
  mov ebx, 1        ; show at Std output 
  mov ecx, msg      ;   "Hello, world!\n"
  mov edx, msglen   ;   sizeof("Hello, world!\n")
  int 80h

  mov eax, 1       ; exit syscall
  mov ebx, 0       ; EXIT_SUCCESS
  int 80h

