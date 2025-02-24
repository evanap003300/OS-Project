org 0x7C00
[bits 16]

mov si, msg_real_mode
call print
call new_line

_boot:
    jmp $

%include "bootloader/print_string.asm"
%include "bootloader/print_newline.asm"
%include "bootloader/gdt.asm"
%include "bootloader/switch_to_pm.asm"
%include "bootloader/print_string_pm.asm"

[bits 32]

BEGIN_PM:
    mov ebx, msg_pm_mode
    call print_string_pm
    
    jmp $

msg_real_mode:
    db "Booting GovieOS...", 0

msg_pm_mode:
    db "Testing", 0

times 510-($-$$) db 0
dw 0xAA55