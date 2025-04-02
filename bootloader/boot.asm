; ----------------------------------
; Description: Bootloader for JerkOS
; Author: Evan Phillips
; Last Updated: 04/02/2025
; ----------------------------------

[org 0x7C00]

    ; Set up stack
    mov bp, 0x9000
    mov sp, bp

    ; Clears Screen
    mov ah, 0x0
    mov ax, 0x03  
    int 0x10      

    call switch_to_pm

%include "bootloader/gdt.asm"
%include "bootloader/switch_to_pm.asm"
%include "bootloader/print_string_pm.asm"
%include "bootloader/print_string.asm"

[bits 32]

BEGIN_PM:
    mov ebx, msg_pm_mode
    call print_string_pm
    
    jmp $

msg_pm_mode: db "Welcome to JerkOS ;)", 0

times 510-($-$$) db 0
dw 0xAA55