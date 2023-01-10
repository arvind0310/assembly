ORG 0x7c00
BITS 16

start:
    mov si,message
    call _loop
    ;jmp $

_loop:
    lodsb ;go to the add pointed by si and put first byte from that address in 'al' reg and inc si by +1
    cmp al,0
    je _done
    call printChar
    jmp _loop

_done:
    ret
printChar:
    mov ah,0eh
    int 0x10
    ret

message: db "hello world",0
times 510-($-$$) db 0
dw 0xAA55



	
