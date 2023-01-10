section .data
    text db "i am string one",10,0
    text2 db "i am string two",10,0
section .text
    global _start
 
_start:
    mov rax, text ;address of text into rax
    call _print
    mov rax, text2
    call _print
 
    mov rax, 60
    mov rdi, 0
    syscall
 
 
;input: rax as pointer to string
;output: print string at rax

_print:
    push rax ; push the value(adress here) on stack so that it can be used when poped.
    mov rbx, 0 ; for counting length
_printLoop:
    inc rax
    inc rbx
    mov cl, [rax]
    cmp cl, 0
    jne _printLoop
 
    mov rax, 1
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall
 
    ret
