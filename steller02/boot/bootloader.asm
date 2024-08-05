; =======================|STELLER02|=======================|
; --------------------------|v1|---------------------------|
; A basic OS for ben eaters 65c02 computer.                |
; written by: Finn Harrison                                |
; file: bootloader.asm                                     |
; purpose: need a bootloader to boot the os                |


.org $8000 ; loads into the first part of eeprom

PORTA $6001 ; port A for the lcd
PORTB $6000 ; port B for other lcd stuff
FILE_ALLOC_TABLE $0000-$000f ; loads into ram, for now 15 files only will increase, 2024 aug 5
main:


; ===================== F/V1 =====================
; sets up the file system, custom
; format first 8bytes name, next 2bytes size (so max file size is 512 bytes), then the rest of the data
; ================================================
write_file: