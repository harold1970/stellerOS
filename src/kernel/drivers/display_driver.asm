;                   _____________________________
;                  |===== display driver V1 =====|
;                  |__WRITTEN BY: FINN HARRISON__|
;                  |_____________________________|
; PURPOSE: TO ALLOW THE USER TO EASALY DISPLAY CONTENT ON THE LCD
; LAST UPDATED: 2024-08-08






.org $8000 ; load into the first part of EEPROM

; Define memory-mapped I/O addresses for the LCD
PORTA = $6001 ; Port A for the LCD
PORTB = $6000 ; Port B for other LCD controls
DDRB = $6002  ; Data Direction for PORTB
DDRA = $6003  ; Data Direction for PORTA

E = %10000000 ; Bit for Enable
RW = %01000000 ; Bit for Read/Write
RS = %00100000 ; Bit for Register Select

.segment "code"

; ===== LCD initialization =====
; INPUT: NONE
; PURPOSE: INITIALIZE THE LCD
; LAST UPDATED: 2024-08-06
init_lcd:
    lda #$38           ; Function set: 8-bit mode, 2 lines, 5x8 dots
    jsr lcd_instruction
    lda #$0C           ; Display on, cursor off
    jsr lcd_instruction
    lda #$06           ; Entry mode: Increment, no shift
    jsr lcd_instruction
    lda #$01           ; Clear display
    jsr lcd_instruction
    rts

; ===== clear screen =====
; INPUT: NONE
; PURPOSE: CLEARS THE SCREEN
; LAST UPDATED: 2024-08-06
clear_screen:
    lda #$01           ; Clear display command
    jsr lcd_instruction
    rts

; ===== write char =====
; INPUT: A (CHAR)
; PURPOSE: WRITES A CHAR TO THE SCREEN
; LAST UPDATED: 2024-08-06
write_char:
    sta PORTB          ; Output the character to PORTB
    lda #RS            ; Select data register
    sta PORTA
    lda #RS | E        ; Set E bit to send data
    sta PORTA
    lda #RS            ; Clear E bit to latch data
    sta PORTA
    rts

; ===== lcd_instruction ====
; INPUT: A(INSTRUCTION)
; PURPOSE: SENDS AN INSTRUCTION TO THE LCD
; LAST UPDATED: 2024-08-06
lcd_instruction:
    sta PORTB          ; Output the instruction to PORTB
    lda #0             ; Clear RS/RW/E bits
    sta PORTA
    lda #E             ; Set E bit to send instruction
    sta PORTA
    ; Delay to ensure the LCD processes the instruction
    jsr delay
    lda #0             ; Clear RS/RW/E bits
    sta PORTA
    rts

; ===== delay =====
; INPUT: NONE
; PURPOSE: PROVIDES A DELAY FOR LCD TO PROCESS COMMANDS
; LAST UPDATED: 2024-08-06
delay:
    ldy #$FF
delay_loop:
    dey
    bne delay_loop
    rts

; ===== write string =====
; INPUT: A (ADDRESS OF STRING)
; PURPOSE: WRITES A NULL-TERMINATED STRING TO THE SCREEN
; LAST UPDATED: 2024-08-06
write_string:
    lda $00            ; Load the address of the string (assuming it's stored in memory)
    beq done           ; If end of string, return
    jsr write_char     ; Write the character to the LCD
    lda $00            ; Load the next character
    bne write_string   ; Continue until null terminator
done:
    rts
