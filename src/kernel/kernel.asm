.include "drivers/cpu_drivers.asm"
.include "drivers/display_driver.asm"
.segment "CODE"
main:
    jsr init_lcd
    lda bootup_message
    jsr write_string
    jsr hlt

.segment "DATA"
bootup_message: .asciiz "StellerOSv1\0"