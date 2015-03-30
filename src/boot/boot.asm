; xxOS
; src/boot/boot.asm
; Bootloader to load kernel, switch to 32-bit real mode and execute kernel

[BITS 16]                       ; 16-bit protected mode
[ORG 0x7C00]                    ; Loaded into memory at 0x7C00

MOV [bootDrive], DL             ; Store DL (boot drive number) in memory

MOV BP, 0x9000                  ; Move Base Pointer in free memory space
MOV SP, BP                      ; Move Stack Pointer to base of stack

MOV BX, ADDR_KERNEL_OFFSET      ; ES:BX = Address to load kernel into
MOV DH, 0x01                    ; DH    = Number of sectors to load
MOV DL, [bootDrive]             ; DL    = Drive number to load from
CALL disk_loadSectors           ; Call disk load function

CLI                             ; Disable interrupts in preperation for real mode
LGDT [gdt_descriptor]           ; Load global descriptor table for real mode

MOV EAX, CR0                    ; Move CR0 to GP register
OR EAX, 0x1                     ; Set first bit to switch to real mode
MOV CR0, EAX                    ; Update CR0 from GP register to complete switch

JMP gdt_codeSeg:start32         ; Jump to start of 32-bit code

[BITS 32]                       ; 32-bit real mode
start32:                        ; Jump target for start of real mode

MOV AX, gdt_dataSeg             ; Update segments for real mode as defined in GDT
MOV DS, AX
MOV SS, AX
MOV ES, AX
MOV FS, AX
MOV GS, AX

MOV EBP, 0x90000                ; Set stack base at top of free space
MOV ESP, EBP                    ; Set stack pointer at base of stack

CALL ADDR_KERNEL_OFFSET         ; Begin executing the kernel

; Includes
%include "src/boot/disk.asm"
%include "src/boot/gdt.asm"

; Data
bootDrive db 0x00               ; Get byte to store boot drive number
ADDR_KERNEL_OFFSET EQU 0x1000   ; Define location for kernel in memory

; Tail
times 510-($-$$) db 0x00        ; Fill bootloader to 512-bytes
dw 0xAA55                       ; Magic word signature

