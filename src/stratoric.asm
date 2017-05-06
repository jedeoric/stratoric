
; ----------------------------------------------------------------------------
#define RES               $0002
#define RESB              $0004
#define L0008             $0008
#define L001A             $001A
#define BASIC11_INTERPRETER_VECTOR  $00F0
#define SEDORIC_TRAV0     $00F2
#define SEDORIC_TRAV1     $00F3
#define SEDORIC_TRAV2     $00F4
#define SEDORIC_TRAV3     $00F5
#define SEDORIC_TRAV4     $00F6
#define SEDORIC_TRAV5     $00F7
#define SEDORIC_TRAV6     $00F8
#define SEDORIC_TRAV7     $00F9
#define STACK             $0100
#define BASIC11_KEYBOARD_MATRIX  $0208                 ; For keyboard decoding
#define BASIC11_PATTERN_ARG  $020C
#define BASIC11_LOWERCASE_UPPERCASE  $0213
#define BASIC11_MEMORY_SIZE  $0220
#define BASIC10_IRQ_VECTOR  $0229                      ; Vecteur IRQ Oric -1
#define BASIC10_IRQ2_VECTOR  $022C                     ; Vecteur IRQ Oric -1
#define BASIC11_KEYBOARD_GET_VECTOR  $023C             ; Vecteur Prendre un caractère au clavier (EB78 ATMOS et 045B SEDORIC)
#define BASIC11_IRQ_VECTOR  $0245                      ; Vecteur IRQ (EE22 ATMOS et 0488 SEDORIC)
#define BASIC11_X         $0248                        ; Vecteur NMI (F8B2 ATMOS et 04C4 SEDORIC)
#define BASIC11_CLOADING_SPEED  $024D
#define BASIC11_KEYBOARD_DURATION_REPEAT  $024E        ; Only on atmos
#define BASIC11_KEYBOARD_REPEAT  $024F                 ; Only on atmos
#define BASIC11_NUMBER_OF_COLUMN_FOR_PRINTER  $0256
#define BASIC11_NUMBER_OF_LINES_FOR_PRINTER  $0257
#define BASIC11_X_TEXT    $0268
#define BASIC11_Y_TEXT    $0269
#define BASIC11_FLG       $026A
#define BASIC11_COLOR_CURSOR  $0271                    ; Couleur du curseur (#01 ATMOS et #00 SEDORIC)
#define BASIC11_BLINK_CURSOR  $0274                    ; Clignotement curseur (#0004 ATMOS et #000B SEDORIC)
#define BASIC11_TIMER3_VALUE  $0276                    ; Timer 3 (#6B81 ATMOS et #F6D7 SEDORIC)
#define BASIC11_DUNNO_VALUE  $02A0                     ; (#FF ATMOS et #05 SEDORIC)
#define BASIC11_DUNNO_VALUE2  $02BE                    ; (#80 ATMOS et #FF SEDORIC)
#define BASIC11_HIMEM_MAX_ADRESS  $02C1                ; X
#define BASIC11_LAST_KEY_PRESSED  $02DF                ; X
#define BASIC11_PARAMS    $02E0
#define BASIC11_BANG_VECTOR  $02F5                     ; Vecteur ! (D336 ATMOS et 0467 SEDORIC)
#define BASIC11_ESPERLUETTE_VECTOR  $02FC              ; Vecteur &() (D336 ATMOS et 0461 SEDORIC)
#define V1DRB             $0300
#define V1DRA             $0301
#define V1DDRB            $0302
#define V1DDRA            $0303
#define V1T1              $0304
#define V1T1L             $0306
#define V1T2              $0308
#define V1ACR             $030B
#define V1PCR             $030C
#define V1IFR             $030D
#define V1ER              $030E
#define V1DRAB            $030F
#define MICRODISC_FDC_COMMAND  $0310
#define MICRODISC_FDC_TRACK  $0311
#define MICRODISC_FDC_SECTOR  $0312
#define MICRODISC_FDC_DATA  $0313
#define MICRODISC_CONTROL  $0314
#define MICRODISC_DRQ     $0318
#define V2DRB             $0320
#define V2DRA             $0321
#define V2DDRB            $0322
#define V2DDRA            $0323
#define V2T1              $0324
#define V2T1L             $0326
#define V2T2              $0328
#define V2ACR             $032B
#define V2PCR             $032C
#define V2IFR             $032D
#define V2ER              $032E
#define V2DRAB            $032F
#define DO_EXEVEC         $0453                        ; Exec code inside overlay
#define DO_RAMROM         $0477                        ; Switch from ROM to Overlay and vice-versa
#define SED_IRQ           $0488                        ; Replaces IRQ
#define SED_COLDSTART     $04A8                        ; Replaces COLDSTART
#define DO_IRQRAM         $04B3                        ; forwards IRQ/NMI from overlay to ROM
#define EXERAM            $04EC
#define EXEVEC            $04EF
#define RAMROM            $04F2
#define IRQRAM            $04F5
#define NMIRAM            $04F8
#define MICRODISC_CONTROL_SHADOW  $04FB                ; Caches the control register as it's write-only
#define FLAGIF            $04FC                        ; b7=1 if inside IF
#define SEDORIC_IDERROR   $04FD                        ; id of Error
#define NOLIGN            $04FE                        ; Line of Error
#define LB800             $B800
#define LB900             $B900
#define SEDORIC_CODE      $C000                        ; X
#define LC400             $C400
#define SEDORIC_START_RAM_OVERLAY             $C400
#define LF85D             $F85D
#define LF8AC             $F8AC
#define BASIC10_IRQ_VECTOR_ROM $ec03		
#define BASIC11_IRQ_VECTOR_ROM $ee22		


; ----------------------------------------------------------------------------
; $FC00
*=$c000
#include "sedoric.asm"

*=$fc00
START_STRATORIC:
.(
    sei                                     ; FC00 78                       x
    cld                                     ; FC01 D8                       .
    ldx     #$FF                            ; FC02 A2 FF                    ..
    txs                                     ; FC04 9A                       .
    lda     #$FF                            ; FC05 A9 FF                    ..
    sta     V1DDRA                          ; FC07 8D 03 03                 ...
    lda     #$F7                            ; FC0A A9 F7                    ..
    sta     V1DDRB                          ; FC0C 8D 02 03                 ...
    lda     #$17                            ; FC0F A9 17                    ..
    sta     V2DRA                           ; FC11 8D 21 03                 .!.
    sta     V2DDRA                          ; FC14 8D 23 03                 .#.
    lda     #$7F                            ; FC17 A9 7F                    ..
    sta     V2IFR                           ; FC19 8D 2D 03                 .-.
    sta     V1IFR                           ; FC1C 8D 0D 03                 ...
    lda     #$02                            ; FC1F A9 02                    ..
    sta     $031E                           ; FC21 8D 1E 03                 ...
    lda     #$07                            ; FC24 A9 07                    ..
    ldx     #$40                            ; FC26 A2 40                    .@
    jsr     INIT_VIA1                       ; FC28 20 FC FD                  ..
    lda     $0247                           ; FC2B AD 47 02                 .G.
    cmp     #$4C                            ; jmp opcode 
    beq     LFC39                           ; checking if jmp is in 0247
    lda     $022B                           ; FC32 AD 2B 02                 .+.
    cmp     #$4C                            ; FC35 C9 4C                    .L
    bne     init_first_boot                 ; FC37 D0 35                    .5
LFC39:
	jsr     READ_KEYBOARD                   ; FC39 20 DB FD                  ..
    bne     init_first_boot                 ; FC3C D0 30                    .0
    ldy     #$06                            ; atmos rom selected
    lda     #$47                            ; FC40 A9 47                    .G
    ldx     $0247                           ; FC42 AE 47 02                 .G.
    cpx     #$4C                            ; FC45 E0 4C                    .L
    beq     skip2                           ; FC47 F0 04                    ..
    ldy     #$05                            ; Oric 1 rom selected
    lda     #$2B                            ; FC4B A9 2B                    .+
skip2:
	ldx     #$02                            ; FC4D A2 02                    ..
    sta     $B904                           ; FC4F 8D 04 B9                 ...
    stx     $B905                           ; FC52 8E 05 B9                 ...
    lda     LFC6B                           ; load jmp
    sta     $B903                           ; and store it
    lda     LFD5A                           ; 
    sta     LB900                           ; 
    lda     #$21                            ; FC61 A9 21                    .!
    ldx     #$03                            ; FC63 A2 03                    ..
    sta     $B901                           ; FC65 8D 01 B9                 ...
    stx     $B902                           ; FC68 8E 02 B9                 ...
	; here $b900 contains
	; sty $0321 ; switch to correct ROM
	; jmp $0247 ($f8b2) or $22B it depends of the Rom selected
.)	
LFC6B:  jmp     LB900                           ; FC6B 4C 00 B9                 L..

; ----------------------------------------------------------------------------
; First boot : initialize values for atmos rom
init_first_boot:
    jsr     FIXME2                          ; FC6E 20 E7 FD                  ..
    beq     start_atmos_mode                           ; if A=0 then Atmos
    ; Oric -1 management
    lda     #$03                            ; FC73 A9 03                    ..
    ldy     #$EC                            ; FC75 A0 EC                    ..
    sta     L0008                           ; FC77 85 08                    ..
    sty     $09                             ; FC79 84 09                    ..
    lda     #$05                            ; load Oric 1 rom
    ldy     #$00                            ; FC7D A0 00                    ..
    beq     LFC8D                           ; FC7F F0 0C                    ..
	; atmos management
start_atmos_mode
LFC81:
    lda     #$22                            ; FC81 A9 22                    ."
    ldy     #$EE                            ; FC83 A0 EE                    ..
    sta     L0008                           ; FC85 85 08                    ..
    sty     $09                             ; FC87 84 09                    ..
    lda     #$06                            ; FC89 A9 06                    ..
    ldy     #$80                            ; FC8B A0 80                    ..
LFC8D:
    sty     $00                             ; FC8D 84 00                    ..
    sta     $01                             ; Store 6 in $01, it will be used to start ATMOS ROM
    sta     $1C                             ; FC91 85 1C                    ..
    sta     $0247                           ; FC93 8D 47 02                 .G.
    ldx     #$EF                            ; FC96 A2 EF                    ..
LFC98:
.(
loop
	lda     COPY_CODE_TO_B800+2,x             ; FC98 BD CF FC                 ...
    sta     $B7FF,x                         ; FC9B 9D FF B7                 ...
    dex                                     ; FC9E CA                       .
    bne     loop                           ; FC9F D0 F7                    ..
.)	
    bit     $00                             ; FCA1 24 00                    $.
    bpl     LFCB2                           ; FCA3 10 0D                    ..
    ldx     #$12                            ; FCA5 A2 12                    ..
LFCA7:  lda     ADDRESS_0X238_TABLE,x           ; FCA7 BD BF FD                 ...
        sta     $0238,x                         ; FCAA 9D 38 02                 .8.
        dex                                     ; FCAD CA                       .
        bpl     LFCA7                           ; FCAE 10 F7                    ..
        bmi     LFCBD                           ; FCB0 30 0B                    0.
LFCB2:  ldx     #$08                            ; FCB2 A2 08                    ..
LFCB4:  lda     ADDRESS_0X228_TABLE,x           ; FCB4 BD D2 FD                 ...
        sta     $0228,x                         ; FCB7 9D 28 02                 .(.
        dex                                     ; FCBA CA                       .
        bpl     LFCB4                           ; FCBB 10 F7                    ..
LFCBD:  ldy     #<SEDORIC_CODE                            ; FCBD A0 00                    ..
        lda     #>SEDORIC_CODE                            ; FCBF A9 C0                    ..
        sty     RES                             ; FCC1 84 02                    ..
        sta     RES+1                           ; FCC3 85 03                    ..
        lda     #>SEDORIC_START_RAM_OVERLAY                            ; FCC5 A9 C4                    ..
        sty     RESB                             ; FCC7 84 04                    ..
        sta     RESB+1 ; Store also $00 because it's in $c400                          ; FCC9 85 05                    ..
        ldx     #$3C                            ; FCCB A2 3C                    .<
COPY_CODE_TO_B800                   ; $FCCF
        jmp     LB800                           ; FCCD 4C 00 B8                 L..

; ----------------------------------------------------------------------------
; $FCD0
COPY_C000_FROM_ROM_TO_C400_RAM_OVERLAY:
    ; This code copy $c000 from bank 7 (stratoric) into overlay ram
    lda     (RES),y                         ; get $c000 from stratoric
    pha                                     ; pha and pla because we used all register (don't forget that X and Y are used to loop in this routine)
    lda     #$00                            ; Switch to overlay ram
    sta     V2DRA                           ; 
    pla                                     ; FCD8 68                       h
    sta     (RESB),y                        ; store into $c400 in overlay ram
    lda     #$07                            ; bank 7
    sta     V2DRA                           ; switch to stratotic bank
    iny                                     ; 
    bne     COPY_C000_FROM_ROM_TO_C400_RAM_OVERLAY; loop :)
    inc     RES+1                           ; inc to jump to $c100, $c200 and so on ..
    inc     RESB+1                          ; inc to jump to $c400, $c500 and so on ..
    dex                                     ; 
    bne     COPY_C000_FROM_ROM_TO_C400_RAM_OVERLAY; FCE8 D0 E6              ..
    stx     V2DRA                           ; Finished, here we switch to OVL RAM
    ldx     #$0A                            ; copy 10 bytes
.(		
loop:
	lda     $B8E4,x                         ; FCEF BD E4 B8                 ...
    sta     $C67A,x                         ; FCF2 9D 7A C6                 .z.
    sta     $C77A,x                         ; FCF5 9D 7A C7                 .z.
    dex                                     ; FCF8 CA                       .
    bpl     loop                           ; FCF9 10 F4                    ..
.)		
    lda     $01                             ; Load 6 value, and store it on ram overlau
    sta     $C67E                           ; FCFD 8D 7E C6                 .~.
    sta     $C77E                           ; FD00 8D 7E C7                 .~.
    lda     $00                             ; FD03 A5 00                    ..
    asl                                     ; FD05 0A                       .
    rol                                     ; FD06 2A                       *
    sta     $C007                           ; FD07 8D 07 C0                 ...
	; Dunno
    lda     $01                             ; it contains the bank 6 (for atmos rom)
    sta     V2DRA                           ; Switch to atmos bank
    ldx     #$FF                            ; FD0F A2 FF                    ..
    stx     $A6                             ; FD11 86 A6                    ..
    stx     BASIC11_HIMEM_MAX_ADRESS        ; FD13 8E C1 02                 ...
    stx     BASIC11_PARAMS+1                ; FD16 8E E1 02                 ...
    bit     $00                             ; FD19 24 00                    $.
    bpl     LFD2F                           ; FD1B 10 12                    ..
    lda     #$00                            ; FD1D A9 00                    ..
    sta     $0260                           ; FD1F 8D 60 02                 .`.
    sta     BASIC11_MEMORY_SIZE             ; FD22 8D 20 02                 . .
    ldy     #$97                            ; FD25 A0 97                    ..
    sty     $A7                             ; FD27 84 A7                    ..
    sty     BASIC11_HIMEM_MAX_ADRESS+1      ; FD29 8C C2 02                 ...
    jmp     LF8AC                           ; Jump to $F8AC

; ----------------------------------------------------------------------------
LFD2F:  ldy     #$BF                            ; FD2F A0 BF                    ..
        sty     BASIC11_PARAMS+2                ; FD31 8C E2 02                 ...
        inx                                     ; FD34 E8                       .
        jmp     LF85D                           ; FD35 4C 5D F8                 L].

; ----------------------------------------------------------------------------
        pha                                     ; FD38 48                       H
        lda     $1C                             ; FD39 A5 1C                    ..
        cmp     #$CC                            ; FD3B C9 CC                    ..
        beq     LFD47                           ; FD3D F0 08                    ..
        cmp     #$CB                            ; FD3F C9 CB                    ..
        beq     LFD47                           ; FD41 F0 04                    ..
        pla                                     ; FD43 68                       h
        jmp     (L0008)                         ; FD44 6C 08 00                 l..

		

; ----------------------------------------------------------------------------
LFD47:  pla                                     ; FD47 68                       h
        pla                                     ; FD48 68                       h
        pla                                     ; FD49 68                       h
        pla                                     ; FD4A 68                       h
        lda     #<BASIC11_IRQ_VECTOR_ROM                            ; FD4B A9 22                    ."
        ldy     #>BASIC11_IRQ_VECTOR_ROM                            ; FD4D A0 EE                    ..
        bit     $00                             ; FD4F 24 00                    $.
        bmi     LFD5F                           ; FD51 30 0C                    0.
        lda     #<BASIC10_IRQ_VECTOR_ROM                            ; FD53 A9 03                    ..
        ldy     #>BASIC10_IRQ_VECTOR_ROM                            ; FD55 A0 EC                    ..
        sta     BASIC10_IRQ_VECTOR              ; FD57 8D 29 02                 .).
LFD5A:  sty     BASIC10_IRQ_VECTOR+1            ; FD5A 8C 2A 02                 .*.
        bne     LFD65                           ; FD5D D0 06                    ..
LFD5F:  sta     BASIC11_IRQ_VECTOR              ; FD5F 8D 45 02                 .E.
        sty     BASIC11_IRQ_VECTOR+1            ; FD62 8C 46 02                 .F.
LFD65:  lda     #$10                            ; FD65 A9 10                    ..
        ldy     #$07                            ; FD67 A0 07                    ..
        sta     $026B                           ; FD69 8D 6B 02                 .k.
        sty     $026C                           ; FD6C 8C 6C 02                 .l.
        lda     #$B3                            ; FD6F A9 B3                    ..
        ldy     #$B8                            ; FD71 A0 B8                    ..
        jsr     L001A                           ; FD73 20 1A 00                  ..
        lda     #$00                            ; switch to overlay ram
        sta     V2DRA                           ; 		
        sta     SEDORIC_CODE                    ; sedoric start 
        sta     $00                             ; FD7E 85 00                    ..
        jmp     LC400                           ; FD80 4C 00 C4                 L..

; ----------------------------------------------------------------------------
        .byte   $0C                             ; FD83 0C                       .
        asl                                    ; FD84 0A                       .
; $FD86
str_STRATORIC:
        .byte   $94                             ; FD85 94                       .
        .byte   "STRATORIC V4.0 "               ; FD86 53 54 52 41 54 4F 52 49  STRATORI
                                                ; FD8E 43 20 56 34 2E 30 20     C V4.0 
        .byte   $90,$0D,$0A                     ; FD95 90 0D 0A                 ...
        .byte   "` 1987 ORIC International"     ; FD98 60 20 31 39 38 37 20 4F  ` 1987 O
                                                ; FDA0 52 49 43 20 49 6E 74 65  RIC Inte
                                                ; FDA8 72 6E 61 74 69 6F 6E 61  rnationa
                                                ; FDB0 6C                       l
        .byte   $0D,$0A,$00,$AD                 ; FDB1 0D 0A 00 AD              ....
; ----------------------------------------------------------------------------
        and     (RES+1,x)                       ; FDB5 21 03                    !.
        eor     #$00                            ; FDB7 49 00                    I.
        sta     V2DRA                           ; FDB9 8D 21 03                 .!.
        pla                                     ; FDBC 68                       h
        plp                                     ; FDBD 28                       (
        rts                                     ; FDBE 60                       `

; ----------------------------------------------------------------------------
; XX
ADDRESS_0X238_TABLE:
    jmp $f77c
    jmp $eb78
    jmp $f5c1
    jmp $f865
    jmp $b868
    jmp $f8b2
    .byte   $40                     ; FDCF B2 F8 40                 ..@
; XX
ADDRESS_0X228_TABLE:
	jmp $b868
	jmp $f430
    .byte   $01,$00,$40                             ; FDDA 40                       @
; ----------------------------------------------------------------------------
; $FDDB
READ_KEYBOARD:
    ldx     #$DF                            ; FDDB A2 DF                    ..
    lda     #$0E                            ; FDDD A9 0E                    ..
    jsr     INIT_VIA1                       ; FDDF 20 FC FD                  ..
    lda     #$05                            ; FDE2 A9 05                    ..
    jmp     LFDF3                           ; FDE4 4C F3 FD                 L..

; ----------------------------------------------------------------------------
; $FDE7
FIXME2:
	; Read Keyboard to start on Oric 1 ?
    ldx     #$DF                            ; FDE7 A2 DF                    ..
    lda     #$0E                            ; FDE9 A9 0E                    ..
    jsr     INIT_VIA1                       ; FDEB 20 FC FD                  ..
    lda     #$00                            ; FDEE A9 00                    ..
    jmp     LFDF3                           ; FDF0 4C F3 FD                 L..

; ----------------------------------------------------------------------------
LFDF3:  sta     V1DRB                           ; FDF3 8D 00 03                 ...
        lda     #$08                            ; FDF6 A9 08                    ..
        and     V1DRB                           ; FDF8 2D 00 03                 -..
        rts                                     ; FDFB 60                       `

; ----------------------------------------------------------------------------
; $FDFC
INIT_VIA1:
        sta     V1DRA                           ; FDFC 8D 01 03                 ...
        lda     #$EE                            ; FDFF A9 EE                    ..
        sta     V1PCR                           ; FE01 8D 0C 03                 ...
        lda     #$CC                            ; FE04 A9 CC                    ..
        sta     V1PCR                           ; FE06 8D 0C 03                 ...
        stx     V1DRAB                          ; FE09 8E 0F 03                 ...
        lda     #$EC                            ; FE0C A9 EC                    ..
        sta     V1PCR                           ; FE0E 8D 0C 03                 ...
        lda     #$CC                            ; FE11 A9 CC                    ..
        sta     V1PCR                           ; FE13 8D 0C 03                 ...
        rts                                     ; FE16 60                       `

; ----------------------------------------------------------------------------
	
    .dsb 229,$ff
    .byte  $00,$FC ; Dunno why there is that :/
    .dsb 252,$ff
; ----------------------------------------------------------------------------
NMI_VECTOR:
    .byt $ff,$ff
    
RESET_VECTOR:
    .byt <START_STRATORIC                 ; FFFC 00 FC                    ..
    .byt >START_STRATORIC                 
; ----------------------------------------------------------------------------
IRQ_VECTOR:
    .byte   $FF                             ; FFFE FF                       .
LFFFF:
.byte   $FF                             ; FFFF FF                       .
