.include "../drivers/cpu_drivers.asm"
.include "../drivers/display_driver.asm"
.include "../drivers/keyboard_driver.asm"
.include "../drivers/string_driver.asm"

.segment "CODE"
main:
    jsr init_lcd ; init the lcd, from display_driver.asm
    lda bootup_message ; copy the message into ax
    jsr write_string ; write the message from ax into the lcd, from display_driver.asm
    jsr get_string

loop:
    lda #'>'
    jsr write_char
    jsr get_string
    ldx exit
    jsr strcmp
    jsr check_for_exit
    jsr check_for_help
check_for_exit:
    jsr strcmp
    cmp #1
    bne exit_sub 
    rts
check_for_help:
    jsr strcmp
    cmp #1
    bne help_sub
    rts

exit_sub:
    jmp hlt
help_sub:
    lda help_commands
    jsr write_string
    jmp loop


.segment "DATA"
bootup_message: .asciiz "StellerOSv1\0"
exit: .asciiz "exit"
help: .asciiz "help"
load: .asciiz "load"
help_commands: .asciiz "help | exit | load (loads whatever is in the eeprom)"