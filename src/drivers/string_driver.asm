;                   _____________________________
;                  |===== strings driver V1 =====|
;                  |__WRITTEN BY: FINN HARRISON__|
;                  |_____________________________|
; PURPOSE: TO ALLOW THE USER TO EASALY DISPLAY CONTENT ON THE LCD
; LAST UPDATED: 2024-08-09
; WHAT IS IN IT:
; strcmp, strlen

; ===== STRLEN =====
; TAKES: POINTER TO A STRING
; INPUT: X (PTR)
; RETURNS: STRLEN (AX)
; DELETES: AX
strlen:
    lda #0
    strlen_loop:
        beq strlen_done
        adc #$01
        bne strlen_loop
strlen_done:
    rts 
        
; ===== STRCMP =====
; INPUT: Y, X
; RETURNS: AX
; 0: STRINGS MATCH
; 1: STRINGS DO NOT MATCH
strcmp:
    rts