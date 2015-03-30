; xxOS
; src/boot/msg.asm
; TTY messaging functions

; void msg_printStr ( char *str ) ;
;   BX = [str]
; Print string in protected mode
msg_printStr:
    PUSHA                           ; Preserve registers on stack
    
    MOV AH, 0x0E                    ; BIOS TTY
    MOV SI, BX                      ; Move str to [SI]
    
    ; Loop through string printing characters
    msg_printStr_loopChar:
        LODSB                       ; Load new byte from SI into AX
        
        CMP AL, 0x00                ; Check null-termination character
        JE msg_printStrEnd          ; Terminate loop
        
        INT 0x10                    ; Otherwise call BIOS interrupt
        JMP msg_printStr_loopChar   ; Print another character
     
    ; End printstring function
    msg_printStrEnd:
        POPA                        ; Restore registers from stack
        RET                         ; Return from function

