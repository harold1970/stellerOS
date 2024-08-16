DRIVE = $6004
DRIVE_INSTRUCTION = $6005

; === get byte from drive === WIP
; INPUT: PTR (AX), RETURN (X) 
; RETURNS: BYTE STORED AT THE ADDRESS IN X
; DELETS: Y
drive_read_byte:
    ldy #b00000001 ; set drive to read byte WIP
    sty DRIVE_INSTRUCTION
    lda DRIVE
    sta x
    rts

