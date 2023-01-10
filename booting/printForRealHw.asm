ORG 0
BITS 16
;message: db "hello world 3",0 // work in both way

;Note: first 3+33 byte of space of boot sector contain some values that BIOS might fill up some random data
; BPB (BIOS Parameter Block)->[https://wiki.osdev.org/FAT], first 3 byte contains jmp instruction
_start:
    jmp short start
    nop

; times 30 db 0 
; dont corrupt the code with random value inserting in bw 
times 33-($-$$) db 0 ;after 3 byte if you see rest byte and those 8+2+1+2... = 33 

start:
jmp 0x7C0:step2 ; important to have 

step2:
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

message: db "hello world_hardWare",0
times 510-($-$$) db 0 ; rest remaining byte after above code and instruction , maek 0 till 510 
dw 0xAA55
