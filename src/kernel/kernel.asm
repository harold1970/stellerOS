.org $8000 ; load into the first part of EEPROM

; Define memory-mapped I/O addresses for the LCD
PORTA = $6001 ; Port A for the LCD
PORTB = $6000 ; Port B for other LCD controls

.segment "code"

main:
    sta PORTA   ; Initialize PORTA to 0
    ldx #0      ; Initialize index register to 0

    