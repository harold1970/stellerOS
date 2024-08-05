; =======================|STELLER02|=======================|
; --------------------------|v1|---------------------------|
; A basic OS for ben eaters 65c02 computer.                |
; written by: Finn Harrison                                |
; file: bootloader.asm                                     |
; purpose: need a bootloader to boot the os                |


.org $8000 ; loads into the first part of eeprom

PORTA $6001 ; port A for the lcd
PORTB $6000 ; port B for other lcd stuff
FILE_ALLOC_TABLE $0000-$000f ; loads into ram, for now 15 files only, will increase, 2024 aug 5
FILE_ALLOC_TABLE_PTR 0

; ===================== F/V1 =====================
; FORMAT: first 8bytes id 0-14, (so file size is 512 bytes), then the rest of the data
; USES: A, X, FILE_ALLOC_TABLE and FILE_ALLOC_TABLE_PTR
; A: FILE PTR
; X: FILE CONTENTS
; FILE_ALLOC_TABLE: the table of all the files and there ptrs
; FILE_ALLOC_TABLE_PTR: the ptr so you know where to put a table
; ================================================
write_file:
    sta [FILE_ALLOC_TABLE, FILE_ALLOC_TABLE_PTR] ; stores the ptr of the file into FILE_ALLOC_TABLE
    inc FILE_ALLOC_TABLE_PTR
    sty 0
    .loop:    
        stx [a ,y]
        inc y
        