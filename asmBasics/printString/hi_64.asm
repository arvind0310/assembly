section .data
  msg: db "Hello, world!", 10
  msglen: equ $ - msg

section .text
	global _start

_start:
  mov eax, 1        ; write(
  mov edi, 1        ;   STDOUT_FILENO,
  mov esi, msg      ;   "Hello, world!\n",
  mov edx, msglen   ;   sizeof("Hello, world!\n")
  syscall           ; );

  mov eax, 60       ; exit(
  mov edi, 0        ;   EXIT_SUCCESS
  syscall           ; );
