; xxOS
; src/kern/kcall.asm
; Start of kernel code to ensure entry at main() method of kernel

[BITS 32]                   ; 32-bit code
[EXTERN main]               ; Reference external linked main() function

CALL main                   ; Call main() of kernel
JMP $                       ; Hang

