ORG 0x7c00
BITS 16

start:
    mov si,message
    call _loop
    ;jmp $

_loop:
    lodsb
    cmp al,0
    jne _loop
    call printChar
    ret

printChar:
    mov ah,0eh
    int 0x10
    ret

message: db "hello world",0
times 510-($-$$) db 0
dw 0xAA55
