ORG 0
BITS 16

;message: db "hello world 3",0 // work in both way
;jmp 0x7C0:start ; important to have 

start:
    cli ; clear interrupt
    mov ax,0x7C0
    mov ds,ax
    ; since lodsb reg works with DS:SI -> PA = DS x 10h + SI(address)
    mov es,ax
    mov ax,0x00
    mov ss,ax
    mov sp,0x7c00
    mov si,message
    call _loop
    ;jmp $ ; will work without it also

_loop:

    lodsb ; Now loadsb knows that byte that has to be read from PhyAdd = DS x 10h + SI(address) -> 0x7C0 x 10 + SI -> from first byte of 0X7C00
    cmp al,0
    je _done
    call _printChar
    jmp _loop

_done:
    ret

_printChar:
    mov ah,0eh
    int 0x10
    ret

message: db "hello world_3",0
times 510-($-$$) db 0
dw 0xAA55
