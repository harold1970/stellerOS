; |===== speaker drivers v1 =====|
; |  WRITTEN BY: FINN HARRISON   |
; | PURPOSE: TO PLAY SOUNDS ON   |
; | THE SPEAKER, THIS IS CUSTOM. |
; | IT IS ON THE 0x6004 PORT.    |
; |______________________________|
SPEAKER = $6004


play_tone:
    sta SPEAKER
    rts
; ===== PLAY MUSIC =====
; INPUT: THE PTR TO THE AUDIO
; OUTPUT: THE AUDIO
play_music:
    lda $00
    beq play_music_done
    jsr play_tone
    lda $00
    bne play_music
play_music_done:
    rts
    