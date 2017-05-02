; da65 V2.15
; Created:    2017-05-02 15:09:54
; Input file: B7STRA40.rom
; Page:       1


        .setcpu "6502"

; ----------------------------------------------------------------------------
RES             := $0002
RESB            := $0004
L0008           := $0008
L001A           := $001A
BASIC11_INTERPRETER_VECTOR:= $00F0
SEDORIC_TRAV0   := $00F2
SEDORIC_TRAV1   := $00F3
SEDORIC_TRAV2   := $00F4
SEDORIC_TRAV3   := $00F5
SEDORIC_TRAV4   := $00F6
SEDORIC_TRAV5   := $00F7
SEDORIC_TRAV6   := $00F8
SEDORIC_TRAV7   := $00F9
STACK           := $0100
BASIC11_KEYBOARD_MATRIX:= $0208                 ; For keyboard decoding
BASIC11_PATTERN_ARG:= $020C
BASIC11_LOWERCASE_UPPERCASE:= $0213
BASIC11_MEMORY_SIZE:= $0220
BASIC10_IRQ_VECTOR:= $0229                      ; Vecteur IRQ Oric -1
BASIC10_IRQ2_VECTOR:= $022C                     ; Vecteur IRQ Oric -1
BASIC11_KEYBOARD_GET_VECTOR:= $023C             ; Vecteur Prendre un caractère au clavier (EB78 ATMOS et 045B SEDORIC)
BASIC11_IRQ_VECTOR:= $0245                      ; Vecteur IRQ (EE22 ATMOS et 0488 SEDORIC)
BASIC11_X       := $0248                        ; Vecteur NMI (F8B2 ATMOS et 04C4 SEDORIC)
BASIC11_CLOADING_SPEED:= $024D
BASIC11_KEYBOARD_DURATION_REPEAT:= $024E        ; Only on atmos
BASIC11_KEYBOARD_REPEAT:= $024F                 ; Only on atmos
BASIC11_NUMBER_OF_COLUMN_FOR_PRINTER:= $0256
BASIC11_NUMBER_OF_LINES_FOR_PRINTER:= $0257
BASIC11_X_TEXT  := $0268
BASIC11_Y_TEXT  := $0269
BASIC11_FLG     := $026A
BASIC11_COLOR_CURSOR:= $0271                    ; Couleur du curseur (#01 ATMOS et #00 SEDORIC)
BASIC11_BLINK_CURSOR:= $0274                    ; Clignotement curseur (#0004 ATMOS et #000B SEDORIC)
BASIC11_TIMER3_VALUE:= $0276                    ; Timer 3 (#6B81 ATMOS et #F6D7 SEDORIC)
BASIC11_DUNNO_VALUE:= $02A0                     ; (#FF ATMOS et #05 SEDORIC)
BASIC11_DUNNO_VALUE2:= $02BE                    ; (#80 ATMOS et #FF SEDORIC)
BASIC11_HIMEM_MAX_ADRESS:= $02C1                ; X
BASIC11_LAST_KEY_PRESSED:= $02DF                ; X
BASIC11_PARAMS  := $02E0
BASIC11_BANG_VECTOR:= $02F5                     ; Vecteur ! (D336 ATMOS et 0467 SEDORIC)
BASIC11_ESPERLUETTE_VECTOR:= $02FC              ; Vecteur &() (D336 ATMOS et 0461 SEDORIC)
V1DRB           := $0300
V1DRA           := $0301
V1DDRB          := $0302
V1DDRA          := $0303
V1T1            := $0304
V1T1L           := $0306
V1T2            := $0308
V1ACR           := $030B
V1PCR           := $030C
V1IFR           := $030D
V1ER            := $030E
V1DRAB          := $030F
MICRODISC_FDC_COMMAND:= $0310
MICRODISC_FDC_TRACK:= $0311
MICRODISC_FDC_SECTOR:= $0312
MICRODISC_FDC_DATA:= $0313
MICRODISC_CONTROL:= $0314
MICRODISC_DRQ   := $0318
V2DRB           := $0320
V2DRA           := $0321
V2DDRB          := $0322
V2DDRA          := $0323
V2T1            := $0324
V2T1L           := $0326
V2T2            := $0328
V2ACR           := $032B
V2PCR           := $032C
V2IFR           := $032D
V2ER            := $032E
V2DRAB          := $032F
DO_EXEVEC       := $0453                        ; Exec code inside overlay
DO_RAMROM       := $0477                        ; Switch from ROM to Overlay and vice-versa
SED_IRQ         := $0488                        ; Replaces IRQ
SED_COLDSTART   := $04A8                        ; Replaces COLDSTART
DO_IRQRAM       := $04B3                        ; forwards IRQ/NMI from overlay to ROM
EXERAM          := $04EC
EXEVEC          := $04EF
RAMROM          := $04F2
IRQRAM          := $04F5
NMIRAM          := $04F8
MICRODISC_CONTROL_SHADOW:= $04FB                ; Caches the control register as it's write-only
FLAGIF          := $04FC                        ; b7=1 if inside IF
SEDORIC_IDERROR := $04FD                        ; id of Error
NOLIGN          := $04FE                        ; Line of Error
LB800           := $B800
LB900           := $B900
SEDORIC_CODE    := $C000                        ; X
LC400           := $C400
LF85D           := $F85D
LF8AC           := $F8AC
; ----------------------------------------------------------------------------
; $FC00
START_STRATORIC:
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
        cmp     #$4C                            ; FC2E C9 4C                    .L
        beq     LFC39                           ; FC30 F0 07                    ..
        lda     $022B                           ; FC32 AD 2B 02                 .+.
        cmp     #$4C                            ; FC35 C9 4C                    .L
        bne     init_first_boot                 ; FC37 D0 35                    .5
LFC39:  jsr     READ_KEYBOARD                   ; FC39 20 DB FD                  ..
        bne     init_first_boot                 ; FC3C D0 30                    .0
        ldy     #$06                            ; FC3E A0 06                    ..
        lda     #$47                            ; FC40 A9 47                    .G
        ldx     $0247                           ; FC42 AE 47 02                 .G.
        cpx     #$4C                            ; FC45 E0 4C                    .L
        beq     skip2                           ; FC47 F0 04                    ..
        ldy     #$05                            ; FC49 A0 05                    ..
        lda     #$2B                            ; FC4B A9 2B                    .+
skip2:  ldx     #$02                            ; FC4D A2 02                    ..
        sta     $B904                           ; FC4F 8D 04 B9                 ...
        stx     $B905                           ; FC52 8E 05 B9                 ...
        lda     LFC6B                           ; FC55 AD 6B FC                 .k.
        sta     $B903                           ; FC58 8D 03 B9                 ...
        lda     LFD5A                           ; FC5B AD 5A FD                 .Z.
        sta     LB900                           ; FC5E 8D 00 B9                 ...
        lda     #$21                            ; FC61 A9 21                    .!
        ldx     #$03                            ; FC63 A2 03                    ..
        sta     $B901                           ; FC65 8D 01 B9                 ...
        stx     $B902                           ; FC68 8E 02 B9                 ...
LFC6B:  jmp     LB900                           ; FC6B 4C 00 B9                 L..

; ----------------------------------------------------------------------------
; First boot : initialize values for atmos rom
init_first_boot:
        jsr     FIXME2                          ; FC6E 20 E7 FD                  ..
        beq     LFC81                           ; FC71 F0 0E                    ..
        lda     #$03                            ; FC73 A9 03                    ..
        ldy     #$EC                            ; FC75 A0 EC                    ..
        sta     L0008                           ; FC77 85 08                    ..
        sty     $09                             ; FC79 84 09                    ..
        lda     #$05                            ; FC7B A9 05                    ..
        ldy     #$00                            ; FC7D A0 00                    ..
        beq     LFC8D                           ; FC7F F0 0C                    ..
LFC81:  lda     #$22                            ; FC81 A9 22                    ."
        ldy     #$EE                            ; FC83 A0 EE                    ..
        sta     L0008                           ; FC85 85 08                    ..
        sty     $09                             ; FC87 84 09                    ..
        lda     #$06                            ; FC89 A9 06                    ..
        ldy     #$80                            ; FC8B A0 80                    ..
LFC8D:  sty     $00                             ; FC8D 84 00                    ..
        sta     $01                             ; FC8F 85 01                    ..
        sta     $1C                             ; FC91 85 1C                    ..
        sta     $0247                           ; FC93 8D 47 02                 .G.
        ldx     #$EF                            ; FC96 A2 EF                    ..
LFC98:  lda     COPY_CODE_TO_B800,x             ; FC98 BD CF FC                 ...
        sta     $B7FF,x                         ; FC9B 9D FF B7                 ...
        dex                                     ; FC9E CA                       .
        bne     LFC98                           ; FC9F D0 F7                    ..
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
LFCBD:  ldy     #$00                            ; FCBD A0 00                    ..
        lda     #$C0                            ; FCBF A9 C0                    ..
        sty     RES                             ; FCC1 84 02                    ..
        sta     RES+1                           ; FCC3 85 03                    ..
        lda     #$C4                            ; FCC5 A9 C4                    ..
        sty     RESB                            ; FCC7 84 04                    ..
        sta     RESB+1                          ; FCC9 85 05                    ..
        ldx     #$3C                            ; FCCB A2 3C                    .<
COPY_CODE_TO_B800:= * + 2                       ; $FCCF
        jmp     LB800                           ; FCCD 4C 00 B8                 L..

; ----------------------------------------------------------------------------
; $FCD0
COPY_C000_FROM_ROM_TO_C400_RAM_OVERLAY:
        lda     (RES),y                         ; FCD0 B1 02                    ..
        pha                                     ; FCD2 48                       H
        lda     #$00                            ; FCD3 A9 00                    ..
        sta     V2DRA                           ; FCD5 8D 21 03                 .!.
        pla                                     ; FCD8 68                       h
        sta     (RESB),y                        ; FCD9 91 04                    ..
        lda     #$07                            ; FCDB A9 07                    ..
        sta     V2DRA                           ; FCDD 8D 21 03                 .!.
        iny                                     ; FCE0 C8                       .
        bne     COPY_C000_FROM_ROM_TO_C400_RAM_OVERLAY; FCE1 D0 ED              ..
        inc     RES+1                           ; FCE3 E6 03                    ..
        inc     RESB+1                          ; FCE5 E6 05                    ..
        dex                                     ; FCE7 CA                       .
        bne     COPY_C000_FROM_ROM_TO_C400_RAM_OVERLAY; FCE8 D0 E6              ..
        stx     V2DRA                           ; FCEA 8E 21 03                 .!.
        ldx     #$0A                            ; FCED A2 0A                    ..
LFCEF:  lda     $B8E4,x                         ; FCEF BD E4 B8                 ...
        sta     $C67A,x                         ; FCF2 9D 7A C6                 .z.
        sta     $C77A,x                         ; FCF5 9D 7A C7                 .z.
        dex                                     ; FCF8 CA                       .
        bpl     LFCEF                           ; FCF9 10 F4                    ..
        lda     $01                             ; FCFB A5 01                    ..
        sta     $C67E                           ; FCFD 8D 7E C6                 .~.
        sta     $C77E                           ; FD00 8D 7E C7                 .~.
        lda     $00                             ; FD03 A5 00                    ..
        asl     a                               ; FD05 0A                       .
        rol     a                               ; FD06 2A                       *
        sta     $C007                           ; FD07 8D 07 C0                 ...
        lda     $01                             ; FD0A A5 01                    ..
        sta     V2DRA                           ; FD0C 8D 21 03                 .!.
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
        jmp     LF8AC                           ; FD2C 4C AC F8                 L..

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
        lda     #$22                            ; FD4B A9 22                    ."
        ldy     #$EE                            ; FD4D A0 EE                    ..
        bit     $00                             ; FD4F 24 00                    $.
        bmi     LFD5F                           ; FD51 30 0C                    0.
        lda     #$03                            ; FD53 A9 03                    ..
        ldy     #$EC                            ; FD55 A0 EC                    ..
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
        lda     #$00                            ; FD76 A9 00                    ..
        sta     V2DRA                           ; FD78 8D 21 03                 .!.
        sta     SEDORIC_CODE                    ; FD7B 8D 00 C0                 ...
        sta     $00                             ; FD7E 85 00                    ..
        jmp     LC400                           ; FD80 4C 00 C4                 L..

; ----------------------------------------------------------------------------
        .byte   $0C                             ; FD83 0C                       .
        asl     a                               ; FD84 0A                       .
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
        .byte   $4C,$7C,$F7,$4C,$78,$EB,$4C,$C1 ; FDBF 4C 7C F7 4C 78 EB 4C C1  L|.Lx.L.
        .byte   $F5,$4C,$65,$F8,$4C,$68,$B8,$4C ; FDC7 F5 4C 65 F8 4C 68 B8 4C  .Le.Lh.L
        .byte   $B2,$F8,$40                     ; FDCF B2 F8 40                 ..@
; XX
ADDRESS_0X228_TABLE:
        .byte   $4C,$68,$B8,$4C,$30,$F4,$01,$00 ; FDD2 4C 68 B8 4C 30 F4 01 00  Lh.L0...
        .byte   $40                             ; FDDA 40                       @
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
FIXME2: ldx     #$DF                            ; FDE7 A2 DF                    ..
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
        .byte   $FF                             ; FE17 FF                       .
        .byte   $FF                             ; FE18 FF                       .
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE19 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE21 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE29 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE31 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE39 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE41 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE49 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE51 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE59 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE61 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE69 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE71 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE79 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE81 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE89 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE91 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FE99 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FEA1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FEA9 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FEB1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FEB9 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FEC1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FEC9 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FED1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FED9 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FEE1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FEE9 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FEF1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$00,$FC,$FF,$FF,$FF ; FEF9 FF FF FF 00 FC FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF01 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF09 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF11 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF19 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF21 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF29 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF31 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF39 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF41 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF49 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF51 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF59 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF61 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF69 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF71 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF79 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF81 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF89 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF91 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF99 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFA1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFA9 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFB1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFB9 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFC1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFC9 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFD1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFD9 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFE1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFE9 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFF1 FF FF FF FF FF FF FF FF  ........
        .byte   $FF                             ; FFF9 FF                       .
; ----------------------------------------------------------------------------
NMI_VECTOR:
        .addr   LFFFF                           ; FFFA FF FF                    ..
RESET_VECTOR:
        .addr   START_STRATORIC                 ; FFFC 00 FC                    ..
; ----------------------------------------------------------------------------
IRQ_VECTOR:
        .byte   $FF                             ; FFFE FF                       .
LFFFF:  .byte   $FF                             ; FFFF FF                       .
