; xxOS
; src/boot/disk.asm
; Disk loading routines

; void disk_loadSectors ( char* addr , int disk , int num ) ;
;   BX = [addr]
;   DH = [num:disk]
; Load DH sectors from disk DL into address ES:BX
disk_loadSectors:
    PUSHA                       ; Preserve register values in stack
    
    PUSH DX                     ; Store [DH:DL], DH = number of sectors to load 
    
    MOV AH, 0x02                ; BIOS sector load
    MOV AL, DH                  ; AL = DH = number of sectors to load
    MOV CH, 0x00                ; CH = Cylinder = 0
    MOV DH, 0x00                ; DH = Head = 0
    MOV CL, 0x02                ; CL = Base Sector = 2
    
    INT 0x13                    ; BIOS interrupt
    
    JC disk_loadSectorsFail     ; Jump if error (carry flag)
    
    POP DX                      ; Restore [DH:DL], DH = number of sectors to load
    CMP DH, AL                  ; Compare number of actual loaded sectors
    JNE disk_loadSectorsFail    ; Jump if error (incorrect number of sectors)

    POPA                        ; Restore register values
    RET                         ; Return function call

    ; Report disk_loadSectors failure
    disk_loadSectorsFail:
        MOV BX, disk_errorMsg   ; BX = pointer to disk fail string
        CALL msg_printStr       ; Print string
        JMP $                   ; Hang

; Included sources
%include "src/boot/msg.asm"

; Strings
disk_errorMsg   db "Disk read error!",0

