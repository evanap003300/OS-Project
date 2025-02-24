print:
    mov ah, 0x0e
    mov al, [si]
    loop:
        int 0x10
        inc si
        mov al, [si]
        cmp al, 0
        jne loop
    ret