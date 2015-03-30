; xxOS
; src/boot/gdt.asm
; Global descriptor table for 32-bit real mode

gdt_start:                              ; Start of global descriptor table
    
    gdt_null:                           ; Null descriptor chunk
        dd 0x00
        dd 0x00
        
    gdt_code:                           ; Code descriptor chunk
        dw 0xFFFF
        dw 0x0000
        db 0x00
        db 0x9A
        db 0xCF
        db 0x00
        
    gdt_data:                           ; Data descriptor chunk
        dw 0xFFFF
        dw 0x0000
        db 0x00
        db 0x92
        db 0xCF
        db 0x00
        
    gdt_end:                            ; Bottom of table
    
gdt_descriptor:                         ; Table descriptor
    dw gdt_end - gdt_start - 1          ; Size of table
    dd gdt_start                        ; Start point of table
    
gdt_codeSeg equ gdt_code - gdt_start    ; Offset of code segment from start
gdt_dataSeg equ gdt_data - gdt_start    ; Offset of data segment from start

