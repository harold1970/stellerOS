.org $8000 ; load into the first part of EEPROM

; Define memory-mapped I/O addresses for the LCD
PORTA = $6001 ; Port A for the LCD
PORTB = $6000 ; Port B for other LCD controls

.segment "code"
main:
    lda #0      ; Initialize accumulator to 0
    sta PORTA   ; Initialize PORTA to 0
    ldx #0      ; Initialize index register to 0

loopu:
    inx         ; Increment X register
    cpx #15     ; Compare X with 15
    bne continue_loopu ; If not equal, branch to continue_loopu

    ; When X equals 15
    lda #15     ; Load accumulator with 15
    sta PORTA   ; Send value to PORTA
    jmp wait    ; Jump to wait

continue_loopu:
    jmp loopu   ; Repeat the loop

wait:
    ; Simple delay loop to avoid rapid switching
    ldx #0
delay_loop:
    dex
    bne delay_loop
    jmp switchd ; Jump to switchd after delay

switchd:
    lda #0      ; Load accumulator with 0
    sta PORTA   ; Send value to PORTA
    jmp wait    ; Jump to wait

