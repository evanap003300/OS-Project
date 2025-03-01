gdt_start: 
    dq 0x0

gdt_code:
    dw 0xFFFF ; limit (bits 0-15)
    dw 0x0 ; base (bits 0-15) 
    db 0x0 ; base (bits 16-23)
    db 10011010b ; first flags
    db 11001111b ; second flags
    db 0x0 ; base (bits 24-31)

gdt_data:
    ; Same stuff but change code bit to data bit
    dw 0xFFFF ; limit (bits 0-15)
    dw 0x0 ; base (bits 0-15) 
    db 0x0 ; base (bits 16-23)
    db 10010010b ; first flags
    db 11001111b ; second flags
    db 0x0 ; base (bits 24-31)

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start
    dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
