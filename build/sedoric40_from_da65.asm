; da65 V2.15
; Created:    2017-05-02 17:23:15
; Input file: B7STRA40.rom
; Page:       1


        .setcpu "6502"

; ----------------------------------------------------------------------------
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
DO_EXEVEC       := $0453                        ; Exec code inside overlay
L0471           := $0471
DO_RAMROM       := $0477                        ; Switch from ROM to Overlay and vice-versa
SED_IRQ         := $0488                        ; Replaces IRQ
SED_COLDSTART   := $04A8                        ; Replaces COLDSTART
DO_IRQRAM       := $04B3                        ; forwards IRQ/NMI from overlay to ROM
L04D1           := $04D1
SEDORIC_EXERAM  := $04EC
SEDORIC_EXEVEC  := $04EF
RAMROM          := $04F2
IRQRAM          := $04F5
NMIRAM          := $04F8
MICRODISC_CONTROL_SHADOW:= $04FB                ; Caches the control register as it's write-only
SEDORIC_FLAGIF  := $04FC                        ; b7=1 if inside IF
SEDORIC_IDERROR := $04FD                        ; id of Error
SEDORIC_NOLIGN  := $04FE                        ; Line of Error
L2020           := $2020
L2310           := $2310
L4C41           := $4C41
L4D45           := $4D45
L4F4E           := $4F4E
L574F           := $574F
L5B20           := $5B20
SEDORIC_DRIVE   := $C000
SEDORIC_TRACK   := $C001
SEDORIC_SECTOR  := $C002
SEDORIC_RWBUF   := $C003
SEDORIC_TYPE_OF_ERROR:= $C005                   ; b5=0 write fault if b5=1 read fault
SEDORIC_XRWTS_RETRY:= $C006                     ; XRWTS (nombre de tentatives possibles en cas de secteur non trouvé)
SEDORIC_NUMBER_OF_RETRY:= $C007
SEDORIC_DRVDEF  := $C009
SEDORIC_DRVSYS  := $C00A
SEDORIC_ACTIVATE_DRIVE_AND_TRACK:= $C00B        ; activation drive et piste  contains $00 $0b
SEDORIC_EXTER   := $C00D
SEDORIC_EXTMS   := $C00F
SEDORIC_EXTNB   := $C015
SEDORIC_IO_ERROR:= $C017                        ; number of I/O error
SEDORIC_FLAGERR := $C018                        ; flag ERR (b7 à 1 si SET, à 0 si OFF)
SEDORIC_ERRVEC  := $C01D                        ; adresse de traitement des erreurs (D685 par ex)
SEDORIC_ATMORI  := $C024
SEDORIC_BUFNOM  := $C028
SEDORIC_TABDRV  := $C039                        ; TABDRV D2 D2 D2 D2 table d'activation des lecteurs (4 lecteurs double face, 82 pistes par face)
SEDORIC_MODCLA  := $C03D                        ; mode clavier (b6=ACCENT, b7=AZERTY)
SEDORIC_COMMAND_TYPE_LAUNCHED:= $C048           ; equal to 0. type de code de fonction: * b6=0 si commande SEDORIC (RAM overlay visée) * b6=1 si commande BASIC (ROM visée) * b7=0 si commande re-définissable ou pré-définie * b7=1 dans tous les autres cas
SEDORIC_USER_COMMAND_1_VECTOR:= $C066           ; $23 $DE $80
SEDORIC_USER_COMMAND_2_VECTOR:= $C069           ; $23 $DE $80
SEDORIC_USER_COMMAND_3_VECTOR:= $C06C           ; $23 $DE $80
SEDORIC_USER_COMMAND_4_VECTOR:= $C06F           ; $23 $DE $80
SEDORIC_BACKUP_CHAR_LINPUT:= $C075              ; $2e sauvegarde de caractère pour LINPUT
SEDORIC_BUF1    := $C100                        ; buffer for descriptors
SEDORIC_BUF2    := $C200                        ; buffer for bitmap
SEDORIC_BUF3    := $C300                        ; buffer for directory sector
; ----------------------------------------------------------------------------
SEDKERN_START:
        lda     SEDORIC_NUMBER_OF_RETRY         ; C400 AD 07 C0                 ...
        lsr     a                               ; C403 4A                       J
LC404:  lda     #$00                            ; C404 A9 00                    ..
        ror     a                               ; C406 6A                       j
        sta     SEDORIC_ATMORI                  ; C407 8D 24 C0                 .$.
        bpl     LC41B                           ; C40A 10 0F                    ..
        lda     #$50                            ; C40C A9 50                    .P
        sta     BASIC11_NUMBER_OF_COLUMN_FOR_PRINTER; C40E 8D 56 02             .V.
        lsr     a                               ; C411 4A                       J
        sta     $31                             ; C412 85 31                    .1
        sta     $32                             ; C414 85 32                    .2
        sta     BASIC11_NUMBER_OF_LINES_FOR_PRINTER; C416 8D 57 02              .W.
        bne     LC421                           ; C419 D0 06                    ..
LC41B:  lda     #$5D                            ; C41B A9 5D                    .]
        sta     $31                             ; C41D 85 31                    .1
        sta     $32                             ; C41F 85 32                    .2
LC421:  inc     BASIC11_HIMEM_MAX_ADRESS        ; C421 EE C1 02                 ...
        inc     BASIC11_HIMEM_MAX_ADRESS+1      ; C424 EE C2 02                 ...
        ldx     #$00                            ; C427 A2 00                    ..
LC429:  lda     page4_oric1,x                   ; C429 BD 00 C6                 ...
        bit     SEDORIC_ATMORI                  ; C42C 2C 24 C0                 ,$.
        bpl     LC434                           ; C42F 10 03                    ..
        lda     page4_atmos,x                   ; C431 BD 00 C7                 ...
LC434:  sta     $0400,x                         ; C434 9D 00 04                 ...
        inx                                     ; C437 E8                       .
        bne     LC429                           ; C438 D0 EF                    ..
        lda     #$4C                            ; C43A A9 4C                    .L
        ldy     #$00                            ; C43C A0 00                    ..
        ldx     #$04                            ; C43E A2 04                    ..
        sta     $EF                             ; C440 85 EF                    ..
        sty     BASIC11_INTERPRETER_VECTOR      ; C442 84 F0                    ..
        stx     BASIC11_INTERPRETER_VECTOR+1    ; C444 86 F1                    ..
        lda     #$88                            ; C446 A9 88                    ..
        ldy     #$C4                            ; C448 A0 C4                    ..
        bit     SEDORIC_ATMORI                  ; C44A 2C 24 C0                 ,$.
        bpl     LC475                           ; C44D 10 26                    .&
        sta     BASIC11_IRQ_VECTOR              ; C44F 8D 45 02                 .E.
        stx     BASIC11_IRQ_VECTOR+1            ; C452 8E 46 02                 .F.
        sty     BASIC11_X                       ; C455 8C 48 02                 .H.
        stx     BASIC11_X+1                     ; C458 8E 49 02                 .I.
        lda     #$5B                            ; C45B A9 5B                    .[
        sta     BASIC11_KEYBOARD_GET_VECTOR     ; C45D 8D 3C 02                 .<.
        stx     BASIC11_KEYBOARD_GET_VECTOR+1   ; C460 8E 3D 02                 .=.
        lda     #$09                            ; C463 A9 09                    ..
        ldy     #$01                            ; C465 A0 01                    ..
        sta     BASIC11_KEYBOARD_DURATION_REPEAT; C467 8D 4E 02                 .N.
        sty     BASIC11_KEYBOARD_REPEAT         ; C46A 8C 4F 02                 .O.
        lda     #$0F                            ; C46D A9 0F                    ..
        ldx     #$70                            ; C46F A2 70                    .p
        ldy     #$D0                            ; C471 A0 D0                    ..
        bne     LC487                           ; C473 D0 12                    ..
LC475:  sta     BASIC10_IRQ_VECTOR              ; C475 8D 29 02                 .).
        stx     BASIC10_IRQ_VECTOR+1            ; C478 8E 2A 02                 .*.
        sty     BASIC10_IRQ2_VECTOR             ; C47B 8C 2C 02                 .,.
        stx     BASIC10_IRQ2_VECTOR+1           ; C47E 8E 2D 02                 .-.
        lda     #$07                            ; C481 A9 07                    ..
        ldx     #$E4                            ; C483 A2 E4                    ..
        ldy     #$CF                            ; C485 A0 CF                    ..
LC487:  sta     BASIC11_FLG                     ; C487 8D 6A 02                 .j.
        stx     $02F9                           ; C48A 8E F9 02                 ...
        sty     $02FA                           ; C48D 8C FA 02                 ...
        ldx     #$04                            ; C490 A2 04                    ..
        lda     #$9A                            ; C492 A9 9A                    ..
        ldy     #$D0                            ; C494 A0 D0                    ..
        sta     IRQ_VECTOR                      ; C496 8D FE FF                 ...
        sty     IRQ_VECTOR+1                    ; C499 8C FF FF                 ...
        lda     #$67                            ; C49C A9 67                    .g
        ldy     #$61                            ; C49E A0 61                    .a
        sta     BASIC11_BANG_VECTOR             ; C4A0 8D F5 02                 ...
LC4A5           := * + 2
        stx     BASIC11_BANG_VECTOR+1           ; C4A3 8E F6 02                 ...
        sty     BASIC11_ESPERLUETTE_VECTOR      ; C4A6 8C FC 02                 ...
        stx     BASIC11_ESPERLUETTE_VECTOR+1    ; C4A9 8E FD 02                 ...
        lda     #$00                            ; C4AC A9 00                    ..
        sta     SEDORIC_DRVDEF                  ; C4AE 8D 09 C0                 ...
        sta     SEDORIC_DRVSYS                  ; C4B1 8D 0A C0                 ...
        sta     SEDORIC_ACTIVATE_DRIVE_AND_TRACK; C4B4 8D 0B C0                 ...
        sta     SEDORIC_ACTIVATE_DRIVE_AND_TRACK+1; C4B7 8D 0C C0               ...
        sta     SEDORIC_EXTNB                   ; C4BA 8D 15 C0                 ...
        sta     SEDORIC_FLAGERR                 ; C4BD 8D 18 C0                 ...
        sta     BASIC11_LAST_KEY_PRESSED        ; C4C0 8D DF 02                 ...
        sta     SEDORIC_COMMAND_TYPE_LAUNCHED   ; C4C3 8D 48 C0                 .H.
        sta     $87                             ; C4C6 85 87                    ..
        lda     #$85                            ; C4C8 A9 85                    ..
        ldy     #$D6                            ; C4CA A0 D6                    ..
        sta     SEDORIC_ERRVEC                  ; C4CC 8D 1D C0                 ...
        sty     SEDORIC_ERRVEC+1                ; C4CF 8C 1E C0                 ...
        lda     MICRODISC_FDC_TRACK             ; C4D2 AD 11 03                 ...
LC4D7           := * + 2
        sta     SEDORIC_ACTIVATE_DRIVE_AND_TRACK+1; C4D5 8D 0C C0               ...
        lda     #$23                            ; C4D8 A9 23                    .#
        ldy     #$DE                            ; C4DA A0 DE                    ..
        ldx     #$80                            ; C4DC A2 80                    ..
        sta     SEDORIC_USER_COMMAND_1_VECTOR   ; C4DE 8D 66 C0                 .f.
        sty     SEDORIC_USER_COMMAND_1_VECTOR+1 ; C4E1 8C 67 C0                 .g.
        stx     SEDORIC_USER_COMMAND_1_VECTOR+2 ; C4E4 8E 68 C0                 .h.
        sta     SEDORIC_USER_COMMAND_2_VECTOR   ; C4E7 8D 69 C0                 .i.
        sty     SEDORIC_USER_COMMAND_2_VECTOR+1 ; C4EA 8C 6A C0                 .j.
        stx     SEDORIC_USER_COMMAND_2_VECTOR+2 ; C4ED 8E 6B C0                 .k.
        sta     SEDORIC_USER_COMMAND_3_VECTOR   ; C4F0 8D 6C C0                 .l.
        sty     SEDORIC_USER_COMMAND_3_VECTOR+1 ; C4F3 8C 6D C0                 .m.
        stx     SEDORIC_USER_COMMAND_3_VECTOR+2 ; C4F6 8E 6E C0                 .n.
        sta     SEDORIC_USER_COMMAND_4_VECTOR   ; C4F9 8D 6F C0                 .o.
        sty     SEDORIC_USER_COMMAND_4_VECTOR+1 ; C4FC 8C 70 C0                 .p.
        stx     SEDORIC_USER_COMMAND_4_VECTOR+2 ; C4FF 8E 71 C0                 .q.
        lda     #$2E                            ; C502 A9 2E                    ..
        sta     SEDORIC_BACKUP_CHAR_LINPUT      ; C504 8D 75 C0                 .u.
        lda     #$1A                            ; C507 A9 1A                    ..
        ldy     #$00                            ; C509 A0 00                    ..
        sta     SEDORIC_EXEVEC+1                ; C50B 8D F0 04                 ...
        sty     SEDORIC_EXEVEC+2                ; C50E 8C F1 04                 ...
        lda     $00                             ; C511 A5 00                    ..
        beq     LC527                           ; C513 F0 12                    ..
        ldx     #$FF                            ; C515 A2 FF                    ..
LC517:  inx                                     ; C517 E8                       .
        lda     MSG_DOS_ALTERED,x               ; C518 BD 74 C5                 .t.
        sta     $B900,x                         ; C51B 9D 00 B9                 ...
        bne     LC517                           ; C51E D0 F7                    ..
        lda     #$00                            ; C520 A9 00                    ..
        ldy     #$B9                            ; C522 A0 B9                    ..
        jsr     SEDORIC_EXERAM                  ; C524 20 EC 04                  ..
LC527:  lda     #$14                            ; C527 A9 14                    ..
        ldy     #$01                            ; C529 A0 01                    ..
        jsr     READ_SECTOR_TRACK               ; C52B 20 5D DA                  ].
        ldx     #$08                            ; C52E A2 08                    ..
LC530:  lda     SEDORIC_BUF1,x                  ; C530 BD 00 C1                 ...
        sta     SEDORIC_TABDRV,x                ; C533 9D 39 C0                 .9.
        cpx     #$05                            ; C536 E0 05                    ..
        bcc     LC53D                           ; C538 90 03                    ..
        sta     SEDORIC_MODCLA,x                ; C53A 9D 3D C0                 .=.
LC53D:  dex                                     ; C53D CA                       .
        bpl     LC530                           ; C53E 10 F0                    ..
        jsr     SEDORIC_XCHAR                   ; C540 20 A3 EB                  ..
        jsr     SEDORIC_XROM                    ; C543 20 D8 D5                  ..
        cpx     #$F7                            ; C546 E0 F7                    ..
        asl     SEDORIC_TRAV6,x                 ; C548 16 F8                    ..
        ldx     #$41                            ; C54A A2 41                    .A
LC54C:  lda     SEDORIC_BUF1+30,x               ; C54C BD 1E C1                 ...
        sta     $36,x                           ; C54F 95 36                    .6
        dex                                     ; C551 CA                       .
        bpl     LC54C                           ; C552 10 F8                    ..
        lda     #$3A                            ; C554 A9 3A                    .:
        sta     $35                             ; C556 85 35                    .5
        jsr     LD206                           ; C558 20 06 D2                  ..
        lda     #$BD                            ; C55B A9 BD                    ..
        ldy     #$C4                            ; C55D A0 C4                    ..
        bit     SEDORIC_ATMORI                  ; C55F 2C 24 C0                 ,$.
        bmi     LC566                           ; C562 30 02                    0.
        lda     #$CD                            ; C564 A9 CD                    ..
LC566:  sta     SEDORIC_EXEVEC+1                ; C566 8D F0 04                 ...
        sty     SEDORIC_EXEVEC+2                ; C569 8C F1 04                 ...
        ldx     #$34                            ; C56C A2 34                    .4
        ldy     #$00                            ; C56E A0 00                    ..
        cli                                     ; C570 58                       X
        jmp     L0471                           ; C571 4C 71 04                 Lq.

; ----------------------------------------------------------------------------
MSG_DOS_ALTERED:
        .byte   $0A,$8C,$81                     ; C574 0A 8C 81                 ...
        .byte   "** "                           ; C577 2A 2A 20                 ** 
LC57A:  .byte   "WARNING **"                    ; C57A 57 41 52 4E 49 4E 47 20  WARNING 
                                                ; C582 2A 2A                    **
        .byte   $88,$87                         ; C584 88 87                    ..
        .byte   "DOS"                           ; C586 44 4F 53                 DOS
LC589:  .byte   " is altered !"                 ; C589 20 69 73 20 61 6C 74 65   is alte
                                                ; C591 72 65 64 20 21           red !
        .byte   $0D,$0A,$00                     ; C596 0D 0A 00                 ...
        .byte   "L"                             ; C599 4C                       L
; ----------------------------------------------------------------------------
        .byte   $64                             ; C59A 64                       d
        .byte   $D3                             ; C59B D3                       .
        rts                                     ; C59C 60                       `

; ----------------------------------------------------------------------------
        lda     LC5AE                           ; C59D AD AE C5                 ...
        ldx     LC5AF                           ; C5A0 AE AF C5                 ...
        sta     SEDORIC_TRACK                   ; C5A3 8D 01 C0                 ...
        stx     SEDORIC_SECTOR                  ; C5A6 8E 02 C0                 ...
        lda     LC5B0                           ; C5A9 AD B0 C5                 ...
        bne     LC589                           ; C5AC D0 DB                    ..
LC5AE:  .byte   $27                             ; C5AE 27                       '
LC5AF:  .byte   $09                             ; C5AF 09                       .
LC5B0:  .byte   $1A                             ; C5B0 1A                       .
SEDORIC_STR_IN_DRIVE:
        .byte   "IN DRIVE"                      ; C5B1 49 4E 20 44 52 49 56 45  IN DRIVE
; ----------------------------------------------------------------------------
        .byte   $A0                             ; C5B9 A0                       .
SEDORIC_STR_LOAD_DISC_FOR_BACKUP:
        .byte   "LOAD DISCS FOR BACKUP FROM"    ; C5BA 4C 4F 41 44 20 44 49 53  LOAD DIS
                                                ; C5C2 43 53 20 46 4F 52 20 42  CS FOR B
                                                ; C5CA 41 43 4B 55 50 20 46 52  ACKUP FR
                                                ; C5D2 4F 4D                    OM
        .byte   $A0                             ; C5D4 A0                       .
        .byte   " TO"                           ; C5D5 20 54 4F                  TO
        .byte   $A0                             ; C5D8 A0                       .
; ----------------------------------------------------------------------------
        .byte   $0D                             ; C5D9 0D                       .
        asl     a                               ; C5DA 0A                       .
SEDORIC_STR_LOAD_SOURCE_DISC:
        .byte   "LOAD SOURCE DISC"              ; C5DB 4C 4F 41 44 20 53 4F 55  LOAD SOU
                                                ; C5E3 52 43 45 20 44 49 53 43  RCE DISC
        .byte   $A0                             ; C5EB A0                       .
; ----------------------------------------------------------------------------
        .byte   $0D                             ; C5EC 0D                       .
        asl     a                               ; C5ED 0A                       .
SEDORIC_STR_LOAD_TARGET_DISC:
        .byte   "LOAD TARGET DISC"              ; C5EE 4C 4F 41 44 20 54 41 52  LOAD TAR
                                                ; C5F6 47 45 54 20 44 49 53 43  GET DISC
        .byte   $A0                             ; C5FE A0                       .
; ----------------------------------------------------------------------------
        .byte   $0D                             ; C5FF 0D                       .
; Page4, ORIC-1
page4_oric1:
        .byte   $C9,$30,$90,$04,$C9,$3A,$90,$35 ; C600 C9 30 90 04 C9 3A 90 35  .0...:.5
        .byte   $86,$0F,$AA,$30,$2E,$85,$C1,$68 ; C608 86 0F AA 30 2E 85 C1 68  ...0...h
        .byte   $AA,$68,$48,$E0,$F7,$D0,$04,$C9 ; C610 AA 68 48 E0 F7 D0 04 C9  .hH.....
        .byte   $C8,$F0,$09,$E0,$58,$D0,$18,$C9 ; C618 C8 F0 09 E0 58 D0 18 C9  ....X...
        .byte   $CA,$D0,$14,$24,$18,$6E,$FC,$04 ; C620 CA D0 14 24 18 6E FC 04  ...$.n..
        .byte   $A0,$FF,$C8,$B1,$E9,$F0,$11,$C9 ; C628 A0 FF C8 B1 E9 F0 11 C9  ........
        .byte   $3A,$F0,$0D,$C9,$D4,$D0,$F3,$8A ; C630 3A F0 0D C9 D4 D0 F3 8A  :.......
        .byte   $48,$A5,$C1,$A6,$0F,$4C,$41,$EA ; C638 48 A5 C1 A6 0F 4C 41 EA  H....LA.
        .byte   $68,$20,$E9,$04                 ; C640 68 20 E9 04              h ..
LC644:  .byte   $20,$67,$04,$0E,$FC,$04,$B0,$03 ; C644 20 67 04 0E FC 04 B0 03   g......
        .byte   $4C,$AD,$C8,$EA,$EA,$EA,$60,$20 ; C64C 4C AD C8 EA EA EA 60 20  L.....` 
        .byte   $77,$04,$B1,$16,$4C,$77,$04,$EA ; C654 77 04 B1 16 4C 77 04 EA  w...Lw..
        .byte   $EA,$EA,$EA,$EA,$EA,$A9,$8E,$A0 ; C65C EA EA EA EA EA A9 8E A0  ........
        .byte   $F8,$D0,$04,$A9,$AE,$A0,$D3,$8D ; C664 F8 D0 04 A9 AE A0 D3 8D  ........
        .byte   $F0,$04,$8C,$F1,$04,$20,$77,$04 ; C66C F0 04 8C F1 04 20 77 04  ..... w.
        .byte   $20,$EF,$04,$08,$48,$78,$AD,$FB ; C674 20 EF 04 08 48 78 AD FB   ...Hx..
        .byte   $04,$49,$02,$8D,$FB,$04,$8D,$14 ; C67C 04 49 02 8D FB 04 8D 14  .I......
        .byte   $03,$68,$28,$60,$2C,$0D,$03,$50 ; C684 03 68 28 60 2C 0D 03 50  .h(`,..P
        .byte   $0F,$48,$A9,$04,$2D,$6A,$02,$F0 ; C68C 0F 48 A9 04 2D 6A 02 F0  .H..-j..
        .byte   $03,$EE,$74,$02,$68,$4C,$03,$EC ; C694 03 EE 74 02 68 4C 03 EC  ..t.hL..
        .byte   $68,$68,$85,$F2,$68,$AA,$A9,$36 ; C69C 68 68 85 F2 68 AA A9 36  hh..h..6
        .byte   $A0,$D1,$D0,$C3,$20,$F2,$04,$68 ; C6A4 A0 D1 D0 C3 20 F2 04 68  .... ..h
        .byte   $40,$8D,$14,$03,$6C,$FC,$FF,$18 ; C6AC 40 8D 14 03 6C FC FF 18  @...l...
        .byte   $20,$77,$04,$48,$A9,$04,$48,$A9 ; C6B4 20 77 04 48 A9 04 48 A9   w.H..H.
        .byte   $A8,$48,$08,$B0,$03,$4C,$28,$02 ; C6BC A8 48 08 B0 03 4C 28 02  .H...L(.
        .byte   $20,$88,$F8,$A9,$17,$A0,$EC,$20 ; C6C4 20 88 F8 A9 17 A0 EC 20   ...... 
        .byte   $6B,$04,$4C,$75,$C4,$A9,$04,$48 ; C6CC 6B 04 4C 75 C4 A9 04 48  k.Lu...H
        .byte   $A9,$F1,$48,$8A,$48,$98,$48,$20 ; C6D4 A9 F1 48 8A 48 98 48 20  ..H.H.H 
        .byte   $F2,$04,$4C,$70,$D2,$EA,$EA,$EA ; C6DC F2 04 4C 70 D2 EA EA EA  ..Lp....
        .byte   $EA,$EA,$EA,$EA,$EA,$4C,$87,$04 ; C6E4 EA EA EA EA EA 4C 87 04  .....L..
        .byte   $4C,$71,$04,$4C,$00,$00,$4C,$77 ; C6EC 4C 71 04 4C 00 00 4C 77  Lq.L..Lw
        .byte   $04,$4C,$B3,$04,$4C,$B4,$04,$84 ; C6F4 04 4C B3 04 4C B4 04 84  .L..L...
        .byte   $00,$00,$00,$00                 ; C6FC 00 00 00 00              ....
; Page4, Atmos
page4_atmos:
        .byte   $C9,$30,$90,$04,$C9,$3A,$90,$35 ; C700 C9 30 90 04 C9 3A 90 35  .0...:.5
        .byte   $86,$0F,$AA,$30,$2E,$85,$C1,$68 ; C708 86 0F AA 30 2E 85 C1 68  ...0...h
        .byte   $AA,$68,$48,$E0,$0E,$D0,$04,$C9 ; C710 AA 68 48 E0 0E D0 04 C9  .hH.....
        .byte   $C9,$F0,$09,$E0,$8A,$D0,$18,$C9 ; C718 C9 F0 09 E0 8A D0 18 C9  ........
        .byte   $CA,$D0,$14,$24,$18,$6E,$FC,$04 ; C720 CA D0 14 24 18 6E FC 04  ...$.n..
        .byte   $A0,$FF,$C8,$B1,$E9,$F0,$11,$C9 ; C728 A0 FF C8 B1 E9 F0 11 C9  ........
        .byte   $3A,$F0,$0D,$C9,$D4,$D0,$F3,$8A ; C730 3A F0 0D C9 D4 D0 F3 8A  :.......
        .byte   $48,$A5,$C1,$A6,$0F,$4C,$B9,$EC ; C738 48 A5 C1 A6 0F 4C B9 EC  H....L..
        .byte   $68,$20,$E9,$04,$20,$67,$04,$0E ; C740 68 20 E9 04 20 67 04 0E  h .. g..
        .byte   $FC,$04,$B0,$03,$4C,$C1,$C8,$6E ; C748 FC 04 B0 03 4C C1 C8 6E  ....L..n
        .byte   $52,$02,$60,$20,$77,$04,$B1,$16 ; C750 52 02 60 20 77 04 B1 16  R.` w...
        .byte   $4C,$77,$04,$A9,$45,$A0,$D8,$D0 ; C758 4C 77 04 A9 45 A0 D8 D0  Lw..E...
        .byte   $0A,$A9,$8E,$A0,$F8,$D0,$04,$A9 ; C760 0A A9 8E A0 F8 D0 04 A9  ........
        .byte   $AE,$A0,$D3,$8D,$F0,$04,$8C,$F1 ; C768 AE A0 D3 8D F0 04 8C F1  ........
        .byte   $04,$20,$77,$04,$20,$EF,$04,$08 ; C770 04 20 77 04 20 EF 04 08  . w. ...
        .byte   $48,$78,$AD,$FB,$04,$49,$02,$8D ; C778 48 78 AD FB 04 49 02 8D  Hx...I..
        .byte   $FB,$04,$8D,$14,$03,$68,$28,$60 ; C780 FB 04 8D 14 03 68 28 60  .....h(`
        .byte   $2C,$0D,$03,$50,$0F,$48,$A9,$04 ; C788 2C 0D 03 50 0F 48 A9 04  ,..P.H..
        .byte   $2D,$6A,$02,$F0,$03,$EE,$74,$02 ; C790 2D 6A 02 F0 03 EE 74 02  -j....t.
        .byte   $68,$4C,$22,$EE,$68,$68,$85,$F2 ; C798 68 4C 22 EE 68 68 85 F2  hL".hh..
        .byte   $68,$AA,$A9,$36,$A0,$D1,$D0,$C3 ; C7A0 68 AA A9 36 A0 D1 D0 C3  h..6....
        .byte   $20,$F2,$04,$68,$40,$8D,$14,$03 ; C7A8 20 F2 04 68 40 8D 14 03   ..h@...
        .byte   $6C,$FC,$FF,$18,$20,$77,$04,$48 ; C7B0 6C FC FF 18 20 77 04 48  l... w.H
        .byte   $A9,$04,$48,$A9,$A8,$48,$08,$B0 ; C7B8 A9 04 48 A9 A8 48 08 B0  ..H..H..
        .byte   $03,$4C,$44,$02,$20,$B8,$F8,$A9 ; C7C0 03 4C 44 02 20 B8 F8 A9  .LD. ...
        .byte   $17,$A0,$EC,$20,$6B,$04,$4C,$71 ; C7C8 17 A0 EC 20 6B 04 4C 71  ... k.Lq
        .byte   $C4,$A9,$04,$48,$A9,$F1,$48,$8A ; C7D0 C4 A9 04 48 A9 F1 48 8A  ...H..H.
        .byte   $48,$98,$48,$20,$F2,$04,$4C,$06 ; C7D8 48 98 48 20 F2 04 4C 06  H.H ..L.
        .byte   $D3,$EA,$EA,$EA,$EA,$EA,$EA,$EA ; C7E0 D3 EA EA EA EA EA EA EA  ........
        .byte   $EA,$4C,$87,$04,$4C,$71,$04,$4C ; C7E8 EA 4C 87 04 4C 71 04 4C  .L..Lq.L
        .byte   $00,$00,$4C,$77,$04,$4C,$B3,$04 ; C7F0 00 00 4C 77 04 4C B3 04  ..Lw.L..
        .byte   $4C,$B4,$04,$84,$00,$00,$00,$00 ; C7F8 4C B4 04 84 00 00 00 00  L.......
; Key shortcut table
KEYDEF: .byte   $07,$45,$57,$4B,$00,$18,$07,$08 ; C800 07 45 57 4B 00 18 07 08  .EWK....
        .byte   $59,$7B,$06,$09,$00,$42,$41,$51 ; C808 59 7B 06 09 00 42 41 51  Y{...BAQ
        .byte   $05,$67,$24,$00,$00,$5B,$27,$00 ; C810 05 67 24 00 00 5B 27 00  .g$..['.
        .byte   $1B,$3F,$04,$0A,$00,$5F,$3D,$0D ; C818 1B 3F 04 0A 00 5F 3D 0D  .?..._=.
        .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; C820 00 00 00 00 00 00 00 00  ........
        .byte   $01,$00,$08,$00,$00,$00,$21,$FF ; C828 01 00 08 00 00 00 21 FF  ......!.
        .byte   $6D,$63,$02,$0C,$00,$0F,$72,$00 ; C830 6D 63 02 0C 00 0F 72 00  mc....r.
        .byte   $03,$32,$29,$00,$00,$0E,$1E,$0B ; C838 03 32 29 00 00 0E 1E 0B  .2).....
        .byte   $17,$B2,$A8,$F1,$00,$8C,$A6,$18 ; C840 17 B2 A8 F1 00 8C A6 18  ........
        .byte   $90,$C9,$16,$19,$00,$92,$A2,$BC ; C848 90 C9 16 19 00 92 A2 BC  ........
        .byte   $15,$9C,$CA,$00,$00,$D2,$9B,$10 ; C850 15 9C CA 00 00 D2 9B 10  ........
        .byte   $EB,$8D,$14,$1A,$00,$87,$C8,$1D ; C858 EB 8D 14 1A 00 87 C8 1D  ........
        .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; C860 00 00 00 00 00 00 00 00  ........
        .byte   $11,$00,$A5,$00,$00,$00,$D1,$FF ; C868 11 00 A5 00 00 00 D1 FF  ........
        .byte   $A4,$9A,$12,$1C,$00,$1F,$CB,$00 ; C870 A4 9A 12 1C 00 1F CB 00  ........
        .byte   $13,$91,$ED,$00,$00,$1E,$B5,$1B ; C878 13 91 ED 00 00 1E B5 1B  ........
; Key shortcut table
REDEF:  .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C880 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$20,$20,$20,$20,$A0 ; C888 20 20 20 20 20 20 20 A0         .
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F ; C890 20 20 20 20 20 20 44 4F        DO
        .byte   $4B,$45,$23,$32,$46,$35,$2C,$A3 ; C898 4B 45 23 32 46 35 2C A3  KE#2F5,.
        .byte   $20,$20,$44,$4F,$4B,$45,$23,$32 ; C8A0 20 20 44 4F 4B 45 23 32    DOKE#2
        .byte   $46,$35,$2C,$23,$34,$36,$37,$8D ; C8A8 46 35 2C 23 34 36 37 8D  F5,#467.
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F ; C8B0 20 20 20 20 20 20 44 4F        DO
        .byte   $4B,$45,$23,$32,$46,$39,$2C,$A3 ; C8B8 4B 45 23 32 46 39 2C A3  KE#2F9,.
        .byte   $20,$44,$4F,$4B,$45,$23,$32,$46 ; C8C0 20 44 4F 4B 45 23 32 46   DOKE#2F
        .byte   $39,$2C,$23,$44,$30,$37,$30,$8D ; C8C8 39 2C 23 44 30 37 30 8D  9,#D070.
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F ; C8D0 20 20 20 20 20 20 44 4F        DO
        .byte   $4B,$45,$23,$32,$46,$43,$2C,$A3 ; C8D8 4B 45 23 32 46 43 2C A3  KE#2FC,.
        .byte   $20,$20,$44,$4F,$4B,$45,$23,$32 ; C8E0 20 20 44 4F 4B 45 23 32    DOKE#2
        .byte   $46,$43,$2C,$23,$34,$36,$31,$8D ; C8E8 46 43 2C 23 34 36 31 8D  FC,#461.
        .byte   $20,$20,$20,$20,$50,$41,$50,$45 ; C8F0 20 20 20 20 50 41 50 45      PAPE
        .byte   $52,$30,$3A,$49,$4E,$4B,$37,$8D ; C8F8 52 30 3A 49 4E 4B 37 8D  R0:INK7.
        .byte   $20,$20,$20,$20,$20,$20,$43,$41 ; C900 20 20 20 20 20 20 43 41        CA
        .byte   $4C,$4C,$23,$46,$38,$44,$30,$8D ; C908 4C 4C 23 46 38 44 30 8D  LL#F8D0.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C910 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$20,$20,$20,$20,$FE ; C918 20 20 20 20 20 20 20 FE         .
        .byte   $20,$20,$20,$20,$3F,$48,$45,$58 ; C920 20 20 20 20 3F 48 45 58      ?HEX
        .byte   $24,$28,$50,$45,$45,$4B,$28,$A3 ; C928 24 28 50 45 45 4B 28 A3  $(PEEK(.
        .byte   $20,$20,$20,$20,$3F,$48,$45,$58 ; C930 20 20 20 20 3F 48 45 58      ?HEX
        .byte   $24,$28,$44,$45,$45,$4B,$28,$A3 ; C938 24 28 44 45 45 4B 28 A3  $(DEEK(.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C940 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$50,$45,$45,$4B,$28,$A3 ; C948 20 20 50 45 45 4B 28 A3    PEEK(.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C950 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$44,$45,$45,$4B,$28,$A3 ; C958 20 20 44 45 45 4B 28 A3    DEEK(.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C960 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$50,$4F,$4B,$45,$A3 ; C968 20 20 20 50 4F 4B 45 A3     POKE.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C970 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$44,$4F,$4B,$45,$A3 ; C978 20 20 20 44 4F 4B 45 A3     DOKE.
; Key shortcut table
PREDEF: .byte   $48,$45,$58,$24,$A8,$43,$41,$4C ; C980 48 45 58 24 A8 43 41 4C  HEX$.CAL
        .byte   $4C,$A3,$54,$45,$58,$54,$8D,$46 ; C988 4C A3 54 45 58 54 8D 46  L.TEXT.F
        .byte   $4F,$52,$49,$3D,$31,$54,$CF,$4C ; C990 4F 52 49 3D 31 54 CF 4C  ORI=1T.L
        .byte   $45,$46,$54,$24,$A8,$4D,$49,$44 ; C998 45 46 54 24 A8 4D 49 44  EFT$.MID
        .byte   $24,$A8,$52,$49,$47,$48,$54,$24 ; C9A0 24 A8 52 49 47 48 54 24  $.RIGHT$
        .byte   $A8,$53,$54,$52,$24,$A8,$55,$4E ; C9A8 A8 53 54 52 24 A8 55 4E  .STR$.UN
        .byte   $50,$52,$4F,$54,$8D,$E0,$55,$53 ; C9B0 50 52 4F 54 8D E0 55 53  PROT..US
        .byte   $49,$4E,$C7,$56,$49,$53,$55,$48 ; C9B8 49 4E C7 56 49 53 55 48  IN.VISUH
        .byte   $49,$52,$45,$53,$A2,$56,$55,$53 ; C9C0 49 52 45 53 A2 56 55 53  IRES.VUS
        .byte   $45,$52,$8D,$57,$49,$44,$54,$C8 ; C9C8 45 52 8D 57 49 44 54 C8  ER.WIDT.
        .byte   $57,$49,$4E,$44,$4F,$D7,$21,$52 ; C9D0 57 49 4E 44 4F D7 21 52  WINDO.!R
        .byte   $45,$53,$54,$4F,$52,$C5         ; C9D8 45 53 54 4F 52 C5        ESTOR.
; ----------------------------------------------------------------------------
; SEDORIC token table
TOKEN_TABLE:
        .byte   "PP"                            ; C9DE 50 50                    PP
        .byte   $80,$00                         ; C9E0 80 00                    ..
        .byte   "ZERTY"                         ; C9E2 5A 45 52 54 59           ZERTY
        .byte   $00                             ; C9E7 00                       .
        .byte   "CCENT"                         ; C9E8 43 43 45 4E 54           CCENT
        .byte   $00                             ; C9ED 00                       .
        .byte   "OX"                            ; C9EE 4F 58                    OX
        .byte   $00                             ; C9F0 00                       .
        .byte   "ACKUP"                         ; C9F1 41 43 4B 55 50           ACKUP
        .byte   $00                             ; C9F6 00                       .
        .byte   "UILD"                          ; C9F7 55 49 4C 44              UILD
        .byte   $00                             ; C9FB 00                       .
        .byte   "HDIR"                          ; C9FC 48 44 49 52              HDIR
        .byte   $00                             ; CA00 00                       .
        .byte   "HANGE"                         ; CA01 48 41 4E 47 45           HANGE
        .byte   $00                             ; CA06 00                       .
        .byte   "LOSE"                          ; CA07 4C 4F 53 45              LOSE
        .byte   $00                             ; CA0B 00                       .
        .byte   "OPY"                           ; CA0C 4F 50 59                 OPY
        .byte   $00                             ; CA0F 00                       .
        .byte   "REATEW"                        ; CA10 52 45 41 54 45 57        REATEW
        .byte   $00                             ; CA16 00                       .
        .byte   "RESEC"                         ; CA17 52 45 53 45 43           RESEC
        .byte   $00                             ; CA1C 00                       .
        .byte   "HKSUM"                         ; CA1D 48 4B 53 55 4D           HKSUM
        .byte   $00                             ; CA22 00                       .
        .byte   "ELDIR"                         ; CA23 45 4C 44 49 52           ELDIR
        .byte   $00                             ; CA28 00                       .
        .byte   "E"                             ; CA29 45                       E
        .byte   $96                             ; CA2A 96                       .
        .byte   "E"                             ; CA2B 45                       E
        .byte   $00                             ; CA2C 00                       .
        .byte   "ESTROY"                        ; CA2D 45 53 54 52 4F 59        ESTROY
        .byte   $00                             ; CA33 00                       .
        .byte   "ELBAK"                         ; CA34 45 4C 42 41 4B           ELBAK
        .byte   $00                             ; CA39 00                       .
        .byte   "EL"                            ; CA3A 45 4C                    EL
        .byte   $00                             ; CA3C 00                       .
        .byte   "IR"                            ; CA3D 49 52                    IR
        .byte   $00                             ; CA3F 00                       .
        .byte   "NUM"                           ; CA40 4E 55 4D                 NUM
        .byte   $00                             ; CA43 00                       .
        .byte   "NAME"                          ; CA44 4E 41 4D 45              NAME
        .byte   $00                             ; CA48 00                       .
        .byte   "KEY"                           ; CA49 4B 45 59                 KEY
        .byte   $00                             ; CA4C 00                       .
        .byte   "SYS"                           ; CA4D 53 59 53                 SYS
        .byte   $00                             ; CA50 00                       .
        .byte   "TRACK"                         ; CA51 54 52 41 43 4B           TRACK
        .byte   $00                             ; CA56 00                       .
        .byte   "RR"                            ; CA57 52 52                    RR
        .byte   $97,$00                         ; CA59 97 00                    ..
        .byte   "RRGOTO"                        ; CA5B 52 52 47 4F 54 4F        RRGOTO
        .byte   $00                             ; CA61 00                       .
        .byte   "RROR"                          ; CA62 52 52 4F 52              RROR
        .byte   $00                             ; CA66 00                       .
        .byte   "RR"                            ; CA67 52 52                    RR
        .byte   $D2,$00                         ; CA69 D2 00                    ..
        .byte   "RR"                            ; CA6B 52 52                    RR
        .byte   $00                             ; CA6D 00                       .
        .byte   "SAVE"                          ; CA6E 53 41 56 45              SAVE
        .byte   $00                             ; CA72 00                       .
        .byte   "XT"                            ; CA73 58 54                    XT
        .byte   $00                             ; CA75 00                       .
        .byte   "IELD"                          ; CA76 49 45 4C 44              IELD
        .byte   $00                             ; CA7A 00                       .
        .byte   "RSEC"                          ; CA7B 52 53 45 43              RSEC
        .byte   $00                             ; CA7F 00                       .
        .byte   "CUR"                           ; CA80 43 55 52                 CUR
        .byte   $00                             ; CA83 00                       .
        .byte   "NIT"                           ; CA84 4E 49 54                 NIT
        .byte   $00                             ; CA87 00                       .
        .byte   "NSTR"                          ; CA88 4E 53 54 52              NSTR
        .byte   $00                             ; CA8C 00                       .
        .byte   "NIST"                          ; CA8D 4E 49 53 54              NIST
        .byte   $00                             ; CA91 00                       .
        .byte   "UMP"                           ; CA92 55 4D 50                 UMP
        .byte   $00                             ; CA95 00                       .
        .byte   "EY"                            ; CA96 45 59                    EY
        .byte   $99,$00                         ; CA98 99 00                    ..
        .byte   "EYIF"                          ; CA9A 45 59 49 46              EYIF
        .byte   $00                             ; CA9E 00                       .
        .byte   "EYUSE"                         ; CA9F 45 59 55 53 45           EYUSE
        .byte   $00                             ; CAA4 00                       .
        .byte   "EYDEF"                         ; CAA5 45 59 44 45 46           EYDEF
        .byte   $00                             ; CAAA 00                       .
        .byte   "EY"                            ; CAAB 45 59                    EY
        .byte   $B8,$00                         ; CAAD B8 00                    ..
        .byte   "EYSAVE"                        ; CAAF 45 59 53 41 56 45        EYSAVE
        .byte   $00                             ; CAB5 00                       .
        .byte   "EY"                            ; CAB6 45 59                    EY
        .byte   $00                             ; CAB8 00                       .
        .byte   "INE"                           ; CAB9 49 4E 45                 INE
        .byte   $00                             ; CABC 00                       .
        .byte   "SET"                           ; CABD 53 45 54                 SET
        .byte   $00                             ; CAC0 00                       .
        .byte   "USING"                         ; CAC1 55 53 49 4E 47           USING
        .byte   $00                             ; CAC6 00                       .
        .byte   "U"                             ; CAC7 55                       U
        .byte   $E3                             ; CAC8 E3                       .
        .byte   "G"                             ; CAC9 47                       G
        .byte   $00,$92,$00                     ; CACA 00 92 00                 ...
        .byte   "OAD"                           ; CACD 4F 41 44                 OAD
        .byte   $00                             ; CAD0 00                       .
        .byte   "DIR"                           ; CAD1 44 49 52                 DIR
        .byte   $00                             ; CAD4 00                       .
        .byte   "TYPE"                          ; CAD5 54 59 50 45              TYPE
        .byte   $00                             ; CAD9 00                       .
        .byte   "CUR"                           ; CADA 43 55 52                 CUR
        .byte   $00                             ; CADD 00                       .
        .byte   "KDIR"                          ; CADE 4B 44 49 52              KDIR
        .byte   $00                             ; CAE2 00                       .
        .byte   "OVE"                           ; CAE3 4F 56 45                 OVE
        .byte   $00                             ; CAE6 00                       .
        .byte   "ERGE"                          ; CAE7 45 52 47 45              ERGE
        .byte   $00                             ; CAEB 00                       .
        .byte   "UM"                            ; CAEC 55 4D                    UM
        .byte   $00                             ; CAEE 00                       .
        .byte   "UT"                            ; CAEF 55 54                    UT
        .byte   $00                             ; CAF1 00                       .
        .byte   "LD"                            ; CAF2 4C 44                    LD
        .byte   $00                             ; CAF4 00                       .
        .byte   "PEN"                           ; CAF5 50 45 4E                 PEN
        .byte   $00                             ; CAF8 00                       .
        .byte   "ATHDIR"                        ; CAF9 41 54 48 44 49 52        ATHDIR
        .byte   $00                             ; CAFF 00                       .
        .byte   "UT"                            ; CB00 55 54                    UT
        .byte   $00                             ; CB02 00                       .
        .byte   "ROT"                           ; CB03 52 4F 54                 ROT
        .byte   $00                             ; CB06 00                       .
        .byte   "R"                             ; CB07 52                       R
        .byte   $00                             ; CB08 00                       .
        .byte   "MAP"                           ; CB09 4D 41 50                 MAP
        .byte   $00                             ; CB0C 00                       .
        .byte   "UIT"                           ; CB0D 55 49 54                 UIT
        .byte   $00                             ; CB10 00                       .
        .byte   "WERTY"                         ; CB11 57 45 52 54 59           WERTY
        .byte   $00                             ; CB16 00                       .
        .byte   "ESUME"                         ; CB17 45 53 55 4D 45           ESUME
        .byte   $00                             ; CB1C 00                       .
        .byte   "SET"                           ; CB1D 53 45 54                 SET
        .byte   $00                             ; CB20 00                       .
        .byte   "EWIND"                         ; CB21 45 57 49 4E 44           EWIND
        .byte   $00                             ; CB26 00                       .
        .byte   "ENUM"                          ; CB27 45 4E 55 4D              ENUM
        .byte   $00                             ; CB2B 00                       .
        .byte   "EN"                            ; CB2C 45 4E                    EN
        .byte   $00,$D1                         ; CB2E 00 D1                    ..
        .byte   "OM"                            ; CB30 4F 4D                    OM
        .byte   $00                             ; CB32 00                       .
        .byte   "ANDOM"                         ; CB33 41 4E 44 4F 4D           ANDOM
        .byte   $00                             ; CB38 00                       .
        .byte   "ESET"                          ; CB39 45 53 45 54              ESET
        .byte   $00                             ; CB3D 00                       .
        .byte   "WAP"                           ; CB3E 57 41 50                 WAP
        .byte   $00                             ; CB41 00                       .
        .byte   "EEK"                           ; CB42 45 45 4B                 EEK
        .byte   $00                             ; CB45 00                       .
        .byte   "TRUN"                          ; CB46 54 52 55 4E              TRUN
        .byte   $00                             ; CB4A 00                       .
        .byte   "T"                             ; CB4B 54                       T
        .byte   $98,$00                         ; CB4C 98 00                    ..
        .byte   "YSTEM"                         ; CB4E 59 53 54 45 4D           YSTEM
        .byte   $00                             ; CB53 00                       .
        .byte   "TATUS"                         ; CB54 54 41 54 55 53           TATUS
        .byte   $00                             ; CB59 00                       .
        .byte   "AVEU"                          ; CB5A 41 56 45 55              AVEU
        .byte   $00                             ; CB5E 00                       .
        .byte   "AVEM"                          ; CB5F 41 56 45 4D              AVEM
        .byte   $00                             ; CB63 00                       .
        .byte   "AVEO"                          ; CB64 41 56 45 4F              AVEO
        .byte   $00                             ; CB68 00                       .
        .byte   "AVE"                           ; CB69 41 56 45                 AVE
        .byte   $00                             ; CB6C 00                       .
        .byte   "EARCH"                         ; CB6D 45 41 52 43 48           EARCH
        .byte   $00                             ; CB72 00                       .
        .byte   "YS"                            ; CB73 59 53                    YS
        .byte   $00                             ; CB75 00                       .
        .byte   "MAP"                           ; CB76 4D 41 50                 MAP
        .byte   $00                             ; CB79 00                       .
        .byte   "KEN"                           ; CB7A 4B 45 4E                 KEN
        .byte   $00                             ; CB7D 00                       .
        .byte   "AKE"                           ; CB7E 41 4B 45                 AKE
        .byte   $00                             ; CB81 00                       .
        .byte   "YPE"                           ; CB82 59 50 45                 YPE
        .byte   $00                             ; CB85 00                       .
        .byte   "RACK"                          ; CB86 52 41 43 4B              RACK
        .byte   $00                             ; CB8A 00                       .
        .byte   "SER"                           ; CB8B 53 45 52                 SER
        .byte   $00                             ; CB8E 00                       .
        .byte   "NTKEN"                         ; CB8F 4E 54 4B 45 4E           NTKEN
        .byte   $00,$E3                         ; CB94 00 E3                    ..
        .byte   "G"                             ; CB96 47                       G
        .byte   $00                             ; CB97 00                       .
        .byte   "NPROT"                         ; CB98 4E 50 52 4F 54           NPROT
        .byte   $00                             ; CB9D 00                       .
        .byte   "ISU"                           ; CB9E 49 53 55                 ISU
        .byte   $A2,$00                         ; CBA1 A2 00                    ..
        .byte   "USER"                          ; CBA3 55 53 45 52              USER
        .byte   $00                             ; CBA7 00                       .
        .byte   "IDTH"                          ; CBA8 49 44 54 48              IDTH
        .byte   $00                             ; CBAC 00                       .
        .byte   "INDOW"                         ; CBAD 49 4E 44 4F 57           INDOW
        .byte   $00,$9A,$00                     ; CBB2 00 9A 00                 ...
        .byte   "]"                             ; CBB5 5D                       ]
        .byte   $00,$FF,$00,$00,$00             ; CBB6 00 FF 00 00 00           .....
; ----------------------------------------------------------------------------
; SEDORIC token initials table
TOKEN_INITIALS_TABLE:
        .byte   $DE                             ; CBBB DE                       .
LCBBC:  .byte   $C9                             ; CBBC C9                       .
LCBBD:  .byte   $00                             ; CBBD 00                       .
LCBBE:  .byte   $03,$EE,$C9,$03,$03,$FC,$C9,$06 ; CBBE 03 EE C9 03 03 FC C9 06  ........
        .byte   $07,$23,$CA,$0D,$0B,$57,$CA,$18 ; CBC6 07 23 CA 0D 0B 57 CA 18  .#...W..
        .byte   $07,$76,$CA,$1F,$02,$CC,$CC,$21 ; CBCE 07 76 CA 1F 02 CC CC 21  .v.....!
        .byte   $00,$80,$CA,$21,$01,$84,$CA,$22 ; CBD6 00 80 CA 21 01 84 CA 22  ...!..."
        .byte   $03,$92,$CA,$25,$01,$96,$CA,$26 ; CBDE 03 92 CA 25 01 96 CA 26  ...%...&
        .byte   $07,$B9,$CA,$2D,$09,$DE,$CA,$36 ; CBE6 07 B9 CA 2D 09 DE CA 36  ...-...6
        .byte   $03,$EC,$CA,$39,$01,$EF,$CA,$3A ; CBEE 03 EC CA 39 01 EF CA 3A  ...9...:
        .byte   $03,$F9,$CA,$3D,$05,$0D,$CB,$42 ; CBF6 03 F9 CA 3D 05 0D CB 42  ...=...B
        .byte   $02,$17,$CB,$44,$08,$3E,$CB,$4C ; CBFE 02 17 CB 44 08 3E CB 4C  ...D.>.L
        .byte   $0D,$7A,$CB,$59,$04,$8B,$CB,$5D ; CC06 0D 7A CB 59 04 8B CB 5D  .z.Y...]
        .byte   $04,$9E,$CB,$61,$02,$A8,$CB,$63 ; CC0E 04 9E CB 61 02 A8 CB 63  ...a...c
        .byte   $02,$CC,$CC,$65,$00,$CC,$CC,$65 ; CC16 02 CC CC 65 00 CC CC 65  ...e...e
        .byte   $00,$CC,$CC,$65,$00,$B3,$CB,$65 ; CC1E 00 CC CC 65 00 B3 CB 65  ...e...e
        .byte   $03                             ; CC26 03                       .
; ----------------------------------------------------------------------------
; SEDORIC token address table
TOKEN_ADDR_TABLE:
        .addr   LFE06                           ; CC27 06 FE                    ..
        .addr   LEBDD                           ; CC29 DD EB                    ..
        .addr   LEB90                           ; CC2B 90 EB                    ..
        .addr   LF0DD                           ; CC2D DD F0                    ..
        .addr   LF150                           ; CC2F 50 F1                    P.
        .addr   LFEDF                           ; CC31 DF FE                    ..
        .addr   LE772                           ; CC33 72 E7                    r.
        .addr   LF147                           ; CC35 47 F1                    G.
        .addr   LFB8C                           ; CC37 8C FB                    ..
        .addr   LF156                           ; CC39 56 F1                    V.
        .addr   LDE4C                           ; CC3B 4C DE                    L.
        .addr   LF9BB                           ; CC3D BB F9                    ..
        .addr   LE9FE                           ; CC3F FE E9                    ..
        .addr   LE775                           ; CC41 75 E7                    u.
        .addr   LF141                           ; CC43 41 F1                    A.
        .addr   LE443                           ; CC45 43 E4                    C.
        .addr   LE436                           ; CC47 36 E4                    6.
        .addr   LE445                           ; CC49 45 E4                    E.
        .addr   LE343                           ; CC4B 43 E3                    C.
        .addr   LF129                           ; CC4D 29 F1                    ).
        .addr   LF144                           ; CC4F 44 F1                    D.
        .addr   LF123                           ; CC51 23 F1                    #.
        .addr   LF126                           ; CC53 26 F1                    &.
        .addr   LF138                           ; CC55 38 F1                    8.
        .addr   LE998                           ; CC57 98 E9                    ..
        .addr   LE998                           ; CC59 98 E9                    ..
        .addr   LE9AF                           ; CC5B AF E9                    ..
        .addr   LE9AF                           ; CC5D AF E9                    ..
        .addr   LE97E                           ; CC5F 7E E9                    ~.
        .addr   LDDDF                           ; CC61 DF DD                    ..
        .addr   LE9EC                           ; CC63 EC E9                    ..
        .addr   LFBBE                           ; CC65 BE FB                    ..
        .addr   LF99B                           ; CC67 9B F9                    ..
        .addr   LEBF4                           ; CC69 F4 EB                    ..
        .addr   LF168                           ; CC6B 68 F1                    h.
        .addr   LEC2D                           ; CC6D 2D EC                    -.
        .addr   LF12C                           ; CC6F 2C F1                    ,.
        .addr   LFE11                           ; CC71 11 FE                    ..
        .addr   LDA1F                           ; CC73 1F DA                    ..
        .addr   LDA1F                           ; CC75 1F DA                    ..
        .addr   LE73F                           ; CC77 3F E7                    ?.
        .addr   LE742                           ; CC79 42 E7                    B.
        .addr   LE742                           ; CC7B 42 E7                    B.
        .addr   LDDCC                           ; CC7D CC DD                    ..
        .addr   LE70A                           ; CC7F 0A E7                    ..
        .addr   LF078                           ; CC81 78 F0                    x.
        .addr   LFC72                           ; CC83 72 FC                    r.
        .addr   LF035                           ; CC85 35 F0                    5.
        .addr   LF035                           ; CC87 35 F0                    5.
        .addr   LEC93                           ; CC89 93 EC                    ..
        .addr   LDFF6                           ; CC8B F6 DF                    ..
        .addr   LE74E                           ; CC8D 4E E7                    N.
        .addr   LFE94                           ; CC8F 94 FE                    ..
        .addr   LEBEB                           ; CC91 EB EB                    ..
        .addr   LE76F                           ; CC93 6F E7                    o.
        .addr   LF135                           ; CC95 35 F1                    5.
        .addr   LF13B                           ; CC97 3B F1                    ;.
        .addr   LE748                           ; CC99 48 E7                    H.
        .addr   LE71E                           ; CC9B 1E E7                    ..
        .addr   LE0AE                           ; CC9D AE E0                    ..
        .addr   LFA4F                           ; CC9F 4F FA                    O.
        .addr   LE778                           ; CCA1 78 E7                    x.
        .addr   LF9CA                           ; CCA3 CA F9                    ..
        .addr   LE9F5                           ; CCA5 F5 E9                    ..
        .addr   LE7BF                           ; CCA7 BF E7                    ..
        .addr   LF98F                           ; CCA9 8F F9                    ..
        .addr   LE7F4                           ; CCAB F4 E7                    ..
        .addr   LEBE0                           ; CCAD E0 EB                    ..
        .addr   LE9BA                           ; CCAF BA E9                    ..
        .addr   LFC74                           ; CCB1 74 FC                    t.
        .addr   LFABA                           ; CCB3 BA FA                    ..
        .addr   LF14D                           ; CCB5 4D F1                    M.
        .addr   LE74B                           ; CCB7 4B E7                    K.
        .addr   LE795                           ; CCB9 95 E7                    ..
        .addr   LE795                           ; CCBB 95 E7                    ..
        .addr   LE7B7                           ; CCBD B7 E7                    ..
        .addr   LEA3A                           ; CCBF 3A EA                    :.
        .addr   LF153                           ; CCC1 53 F1                    S.
        .addr   LE852                           ; CCC3 52 E8                    R.
        .addr   LE852                           ; CCC5 52 E8                    R.
        .addr   LE9FB                           ; CCC7 FB E9                    ..
        .addr   LE9F2                           ; CCC9 F2 E9                    ..
        .addr   LDD4C                           ; CCCB 4C DD                    L.
        .addr   LDD49                           ; CCCD 49 DD                    I.
        .addr   LDD52                           ; CCCF 52 DD                    R.
        .addr   LDD4F                           ; CCD1 4F DD                    O.
        .addr   LE5FB                           ; CCD3 FB E5                    ..
        .addr   LF159                           ; CCD5 59 F1                    Y.
        .addr   LF995                           ; CCD7 95 F9                    ..
        .addr   LE89C                           ; CCD9 9C E8                    ..
        .addr   LF8DE                           ; CCDB DE F8                    ..
        .addr   LFE97                           ; CCDD 97 FE                    ..
        .addr   LF12F                           ; CCDF 2F F1                    /.
        .addr   LEA7E                           ; CCE1 7E EA                    ~.
        .addr   LE8E0                           ; CCE3 E0 E8                    ..
        .addr   LEE98                           ; CCE5 98 EE                    ..
        .addr   LE9F8                           ; CCE7 F8 E9                    ..
        .addr   LE9EF                           ; CCE9 EF E9                    ..
        .addr   LF120                           ; CCEB 20 F1                     .
        .addr   LE745                           ; CCED 45 E7                    E.
        .addr   LF20F                           ; CCEF 0F F2                    ..
        .addr   LE7D8                           ; CCF1 D8 E7                    ..
        .addr   LEC03                           ; CCF3 03 EC                    ..
        .addr   LE83D                           ; CCF5 3D E8                    =.
; ----------------------------------------------------------------------------
; common names and extentions
COMMON_EXT_TABLE:
        .byte   "COM"                           ; CCF7 43 4F 4D                 COM
LCCFA:  .byte   "BAKCOM?????????BAK"            ; CCFA 42 41 4B 43 4F 4D 3F 3F  BAKCOM??
                                                ; CD02 3F 3F 3F 3F 3F 3F 3F 42  ???????B
                                                ; CD0A 41 4B                    AK
; ----------------------------------------------------------------------------
; unknown
MISC1:  .byte   $28,$50,$35,$5D                 ; CD0C 28 50 35 5D              (P5]
LCD10:  .byte   $00,$00,$01,$01,$FA,$BF,$23,$34 ; CD10 00 00 01 01 FA BF 23 34  ......#4
        .byte   $36,$37                         ; CD18 36 37                    67
LCD1A:  .byte   $FF,$7B,$0E,$FA,$35             ; CD1A FF 7B 0E FA 35           .{..5
LCD1F:  .byte   $10,$81,$C9,$0F,$DA,$A2         ; CD1F 10 81 C9 0F DA A2        ......
LCD25:  .byte   $C6,$C9,$88,$02,$88,$02         ; CD25 C6 C9 88 02 88 02        ......
LCD2B:  .byte   $4F,$46,$46                     ; CD2B 4F 46 46                 OFF
LCD2E:  .byte   $53,$45,$54,$C7,$81,$C2,$82,$45 ; CD2E 53 45 54 C7 81 C2 82 45  SET....E
        .byte   $D3,$66,$A5,$C8,$A3,$8F,$D2,$42 ; CD36 D3 66 A5 C8 A3 8F D2 42  .f.....B
        .byte   $B5,$98,$E0                     ; CD3E B5 98 E0                 ...
; QWERTY/AZERTY convertion
QWAZERTY_CONV:
        .byte   $B1,$BE,$AE,$AA,$82,$93         ; CD41 B1 BE AE AA 82 93        ......
LCD47:  .byte   $AE,$AA,$B1,$BE,$93,$82         ; CD47 AE AA B1 BE 93 82        ......
; Accented characters
ACCENTED_FONT:
        .byte   $40,$10,$08,$1C,$02,$1E,$22,$1E ; CD4D 40 10 08 1C 02 1E 22 1E  @.....".
        .byte   $00,$5C,$00,$00,$1E,$20,$20,$20 ; CD55 00 5C 00 00 1E 20 20 20  .\...   
        .byte   $1E,$04,$7B,$04,$08,$1C,$22,$3E ; CD5D 1E 04 7B 04 08 1C 22 3E  ..{...">
        .byte   $20,$1E,$00,$7C,$10,$08,$22,$22 ; CD65 20 1E 00 7C 10 08 22 22   ..|..""
        .byte   $22,$26,$1A,$00,$7D,$10,$08,$1C ; CD6D 22 26 1A 00 7D 10 08 1C  "&..}...
        .byte   $22,$3E,$20,$1E,$00,$7E,$1C,$22 ; CD75 22 3E 20 1E 00 7E 1C 22  "> ..~."
        .byte   $1C,$22,$3E,$20,$1E,$00         ; CD7D 1C 22 3E 20 1E 00        ."> ..
; unknown
MISC2:  .byte   $41,$58,$59,$50,$B8             ; CD83 41 58 59 50 B8           AXYP.
LCD88:  .byte   $0A,$64,$E8,$10                 ; CD88 0A 64 E8 10              .d..
LCD8C:  .byte   $00,$00,$03,$27,$84,$A4,$C4,$E4 ; CD8C 00 00 03 27 84 A4 C4 E4  ...'....
; ----------------------------------------------------------------------------
; System variable names
SYS_VAR_NAMES:
        .byte   "E"                             ; CD94 45                       E
LCD95:  .byte   "NELINOMSKFTEORARXRYRPEFSTEDEXCX"; CD95 4E 45 4C 49 4E 4F 4D 53 NELINOMS
                                                ; CD9D 4B 46 54 45 4F 52 41 52  KFTEORAR
                                                ; CDA5 58 52 59 52 50 45 46 53  XRYRPEFS
                                                ; CDAD 54 45 44 45 58 43 58     TEDEXCX
        .byte   "CYFPFS"                        ; CDB4 43 59 46 50 46 53        CYFPFS
LCDBA:  .byte   "SCJKE"                         ; CDBA 53 43 4A 4B 45           SCJKE
; Error message strings
ERROR_MESSAGES:
        .byte   "FILE NOT FOUN"                 ; CDBF 46 49 4C 45 20 4E 4F 54  FILE NOT
                                                ; CDC7 20 46 4F 55 4E            FOUN
        .byte   $C4                             ; CDCC C4                       .
        .byte   "DRIVE NOT IN LIN"              ; CDCD 44 52 49 56 45 20 4E 4F  DRIVE NO
                                                ; CDD5 54 20 49 4E 20 4C 49 4E  T IN LIN
        .byte   $C5                             ; CDDD C5                       .
        .byte   "INVALID FILE NAM"              ; CDDE 49 4E 56 41 4C 49 44 20  INVALID 
                                                ; CDE6 46 49 4C 45 20 4E 41 4D  FILE NAM
        .byte   $C5                             ; CDEE C5                       .
        .byte   "DISK I/"                       ; CDEF 44 49 53 4B 20 49 2F     DISK I/
        .byte   $CF                             ; CDF6 CF                       .
        .byte   "WRITE PROTECTE"                ; CDF7 57 52 49 54 45 20 50 52  WRITE PR
                                                ; CDFF 4F 54 45 43 54 45        OTECTE
        .byte   $C4                             ; CE05 C4                       .
        .byte   "WILDCARD(S) NOT ALLOWE"        ; CE06 57 49 4C 44 43 41 52 44  WILDCARD
                                                ; CE0E 28 53 29 20 4E 4F 54 20  (S) NOT 
                                                ; CE16 41 4C 4C 4F 57 45        ALLOWE
        .byte   $C4                             ; CE1C C4                       .
        .byte   "FILE ALREADY EXIST"            ; CE1D 46 49 4C 45 20 41 4C 52  FILE ALR
                                                ; CE25 45 41 44 59 20 45 58 49  EADY EXI
                                                ; CE2D 53 54                    ST
        .byte   $D3                             ; CE2F D3                       .
        .byte   "DISK FUL"                      ; CE30 44 49 53 4B 20 46 55 4C  DISK FUL
        .byte   $CC                             ; CE38 CC                       .
        .byte   "ILLEGAL QUANTIT"               ; CE39 49 4C 4C 45 47 41 4C 20  ILLEGAL 
                                                ; CE41 51 55 41 4E 54 49 54     QUANTIT
        .byte   $D9                             ; CE48 D9                       .
        .byte   "SYNTA"                         ; CE49 53 59 4E 54 41           SYNTA
        .byte   $D8                             ; CE4E D8                       .
        .byte   "UNKNOWN FORMA"                 ; CE4F 55 4E 4B 4E 4F 57 4E 20  UNKNOWN 
                                                ; CE57 46 4F 52 4D 41           FORMA
        .byte   $D4,$D4                         ; CE5C D4 D4                    ..
        .byte   "TYPE MISMATC"                  ; CE5E 54 59 50 45 20 4D 49 53  TYPE MIS
                                                ; CE66 4D 41 54 43              MATC
        .byte   $C8                             ; CE6A C8                       .
        .byte   "FILE TYPE MISMATC"             ; CE6B 46 49 4C 45 20 54 59 50  FILE TYP
                                                ; CE73 45 20 4D 49 53 4D 41 54  E MISMAT
                                                ; CE7B 43                       C
        .byte   $C8                             ; CE7C C8                       .
        .byte   "FILE NOT OPE"                  ; CE7D 46 49 4C 45 20 4E 4F 54  FILE NOT
                                                ; CE85 20 4F 50 45               OPE
        .byte   $CE                             ; CE89 CE                       .
        .byte   "FILE ALREADY OPE"              ; CE8A 46 49 4C 45 20 41 4C 52  FILE ALR
                                                ; CE92 45 41 44 59 20 4F 50 45  EADY OPE
        .byte   $CE                             ; CE9A CE                       .
        .byte   "END OF FIL"                    ; CE9B 45 4E 44 20 4F 46 20 46  END OF F
                                                ; CEA3 49 4C                    IL
        .byte   $C5                             ; CEA5 C5                       .
        .byte   "BAD RECORD NUMBE"              ; CEA6 42 41 44 20 52 45 43 4F  BAD RECO
                                                ; CEAE 52 44 20 4E 55 4D 42 45  RD NUMBE
        .byte   $D2                             ; CEB6 D2                       .
        .byte   "FIELD OVERFLO"                 ; CEB7 46 49 45 4C 44 20 4F 56  FIELD OV
                                                ; CEBF 45 52 46 4C 4F           ERFLO
        .byte   $D7                             ; CEC4 D7                       .
        .byte   "STRING TOO LON"                ; CEC5 53 54 52 49 4E 47 20 54  STRING T
                                                ; CECD 4F 4F 20 4C 4F 4E        OO LON
        .byte   $C7                             ; CED3 C7                       .
        .byte   "UNKNOWN FIELD NAM"             ; CED4 55 4E 4B 4E 4F 57 4E 20  UNKNOWN 
                                                ; CEDC 46 49 45 4C 44 20 4E 41  FIELD NA
                                                ; CEE4 4D                       M
        .byte   $C5,$C5                         ; CEE5 C5 C5                    ..
; Message strings
MESSAGES:
        .byte   $0A,$0D                         ; CEE7 0A 0D                    ..
        .byte   "TRACK"                         ; CEE9 54 52 41 43 4B           TRACK
        .byte   $BA                             ; CEEE BA                       .
        .byte   " SECTOR"                       ; CEEF 20 53 45 43 54 4F 52      SECTOR
        .byte   $BA                             ; CEF6 BA                       .
        .byte   " WRITE FAULT"                  ; CEF7 20 57 52 49 54 45 20 46   WRITE F
                                                ; CEFF 41 55 4C 54              AULT
        .byte   $A0                             ; CF03 A0                       .
        .byte   " READ FAULT"                   ; CF04 20 52 45 41 44 20 46 41   READ FA
                                                ; CF0C 55 4C 54                 ULT
        .byte   $A0,$0A,$0D                     ; CF0F A0 0A 0D                 ...
        .byte   " BREA"                         ; CF12 20 42 52 45 41            BREA
LCF17:  .byte   "K ON BYTE "                    ; CF17 4B 20 4F 4E 20 42 59 54  K ON BYT
                                                ; CF1F 45 20                    E 
        .byte   $A3,$0D,$0A                     ; CF21 A3 0D 0A                 ...
        .byte   "Drive"                         ; CF24 44 72 69 76 65           Drive
        .byte   $A0                             ; CF29 A0                       .
        .byte   " V4 (Mst)"                     ; CF2A 20 56 34 20 28 4D 73 74   V4 (Mst
                                                ; CF32 29                       )
        .byte   $A0                             ; CF33 A0                       .
        .byte   " free sectors "                ; CF34 20 66 72 65 65 20 73 65   free se
                                                ; CF3C 63 74 6F 72 73 20        ctors 
        .byte   $A8                             ; CF42 A8                       .
        .byte   " Files"                        ; CF43 20 46 69 6C 65 73         Files
        .byte   $A0                             ; CF49 A0                       .
        .byte   " IS PROTECTE"                  ; CF4A 20 49 53 20 50 52 4F 54   IS PROT
                                                ; CF52 45 43 54 45              ECTE
        .byte   $C4                             ; CF56 C4                       .
        .byte   " (Y)es or (N)o"                ; CF57 20 28 59 29 65 73 20 6F   (Y)es o
                                                ; CF5F 72 20 28 4E 29 6F        r (N)o
        .byte   $BA                             ; CF65 BA                       .
        .byte   " DELETED"                      ; CF66 20 44 45 4C 45 54 45 44   DELETED
        .byte   $0D,$8A                         ; CF6E 0D 8A                    ..
        .byte   "INSERT MASTER"                 ; CF70 49 4E 53 45 52 54 20 4D  INSERT M
                                                ; CF78 41 53 54 45 52           ASTER
        .byte   $A0                             ; CF7D A0                       .
        .byte   "AND PRESS 'RETURN"             ; CF7E 41 4E 44 20 50 52 45 53  AND PRES
                                                ; CF86 53 20 27 52 45 54 55 52  S 'RETUR
                                                ; CF8E 4E                       N
        .byte   $A7                             ; CF8F A7                       .
        .byte   " ALREADY EXISTS"               ; CF90 20 41 4C 52 45 41 44 59   ALREADY
                                                ; CF98 20 45 58 49 53 54 53      EXISTS
        .byte   $0A,$8D                         ; CF9F 0A 8D                    ..
        .byte   " -->"                          ; CFA1 20 2D 2D 3E               -->
        .byte   $A0                             ; CFA5 A0                       .
        .byte   "USER"                          ; CFA6 55 53 45 52              USER
        .byte   $A0                             ; CFAA A0                       .
        .byte   " V4 (Slv)"                     ; CFAB 20 56 34 20 28 53 6C 76   V4 (Slv
                                                ; CFB3 29                       )
        .byte   $A0                             ; CFB4 A0                       .
        .byte   " (Type"                        ; CFB5 20 28 54 79 70 65         (Type
        .byte   $BD                             ; CFBB BD                       .
        .byte   ")"                             ; CFBC 29                       )
        .byte   $A0                             ; CFBD A0                       .
        .byte   " DISC IN DRIVE"                ; CFBE 20 44 49 53 43 20 49 4E   DISC IN
                                                ; CFC6 20 44 52 49 56 45         DRIVE
        .byte   $A0                             ; CFCC A0                       .
; ----------------------------------------------------------------------------
XRWTS:  php                                     ; CFCD 08                       .
        lda     V1ER                            ; CFCE AD 0E 03                 ...
        pha                                     ; CFD1 48                       H
        tya                                     ; CFD2 98                       .
        pha                                     ; CFD3 48                       H
        lda     #$40                            ; CFD4 A9 40                    .@
        sta     V1ER                            ; CFD6 8D 0E 03                 ...
        jsr     XRWTS_INTERNAL                  ; CFD9 20 E9 CF                  ..
        pla                                     ; CFDC 68                       h
        tay                                     ; CFDD A8                       .
        pla                                     ; CFDE 68                       h
        sta     V1ER                            ; CFDF 8D 0E 03                 ...
        plp                                     ; CFE2 28                       (
        lda     #$FF                            ; CFE3 A9 FF                    ..
        bit     SEDORIC_IO_ERROR                ; CFE5 2C 17 C0                 ,..
        rts                                     ; CFE8 60                       `

; ----------------------------------------------------------------------------
XRWTS_INTERNAL:
        nop                                     ; CFE9 EA                       .
        .byte   $A0                             ; CFEA A0                       .
; Entrée secondaire pour rebouclage
XRWTS_INTERNAL_LOOP:
        .byte   $03                             ; CFEB 03                       .
LCFEC:  sty     SEDORIC_XRWTS_RETRY             ; CFEC 8C 06 C0                 ...
        ldy     #$08                            ; CFEF A0 08                    ..
        .byte   $8C                             ; CFF1 8C                       .
        .byte   $07                             ; CFF2 07                       .
XRWTS_ONCE:
        .byte   $C0                             ; CFF3 C0                       .
LCFF4:  pha                                     ; CFF4 48                       H
        sei                                     ; CFF5 78                       x
        stx     SEDORIC_TYPE_OF_ERROR           ; CFF6 8E 05 C0                 ...
LCFF9:  ldy     SEDORIC_DRIVE                   ; CFF9 AC 00 C0                 ...
        lda     LD122,y                         ; CFFC B9 22 D1                 .".
        bit     SEDORIC_TRACK                   ; CFFF 2C 01 C0                 ,..
        bpl     LD006                           ; D002 10 02                    ..
        ora     #$10                            ; D004 09 10                    ..
LD006:  sta     MICRODISC_CONTROL_SHADOW        ; D006 8D FB 04                 ...
        lda     LD126,y                         ; D009 B9 26 D1                 .&.
        nop                                     ; D00C EA                       .
        nop                                     ; D00D EA                       .
        sta     MICRODISC_FDC_TRACK             ; D00E 8D 11 03                 ...
        lda     SEDORIC_RWBUF                   ; D011 AD 03 C0                 ...
        sta     SEDORIC_TRAV1                   ; D014 85 F3                    ..
        lda     SEDORIC_RWBUF+1                 ; D016 AD 04 C0                 ...
        sta     SEDORIC_TRAV2                   ; D019 85 F4                    ..
        lda     #$20                            ; D01B A9 20                    . 
        bit     SEDORIC_TYPE_OF_ERROR           ; D01D 2C 05 C0                 ,..
        bpl     LD04C                           ; D020 10 2A                    .*
        bvc     LD026                           ; D022 50 02                    P.
        beq     LD04C                           ; D024 F0 26                    .&
LD026:  lda     SEDORIC_TRACK                   ; D026 AD 01 C0                 ...
        and     #$7F                            ; D029 29 7F                    ).
        nop                                     ; D02B EA                       .
        sta     MICRODISC_FDC_DATA              ; D02C 8D 13 03                 ...
        nop                                     ; D02F EA                       .
        nop                                     ; D030 EA                       .
        nop                                     ; D031 EA                       .
        cmp     MICRODISC_FDC_TRACK             ; D032 CD 11 03                 ...
        beq     LD04C                           ; D035 F0 15                    ..
        txa                                     ; D037 8A                       .
        ldx     #$18                            ; D038 A2 18                    ..
        jsr     LCFF4                           ; D03A 20 F4 CF                  ..
        sta     SEDORIC_TYPE_OF_ERROR           ; D03D 8D 05 C0                 ...
        ldy     MICRODISC_FDC_DATA              ; D040 AC 13 03                 ...
        ora     #$04                            ; D043 09 04                    ..
        tax                                     ; D045 AA                       .
        sty     MICRODISC_FDC_TRACK             ; D046 8C 11 03                 ...
        nop                                     ; D049 EA                       .
        nop                                     ; D04A EA                       .
        nop                                     ; D04B EA                       .
LD04C:  ldy     SEDORIC_SECTOR                  ; D04C AC 02 C0                 ...
        sty     MICRODISC_FDC_SECTOR            ; D04F 8C 12 03                 ...
        ldy     #$00                            ; D052 A0 00                    ..
        txa                                     ; D054 8A                       .
        bmi     LD05A                           ; D055 30 03                    0.
LD057:  dey                                     ; D057 88                       .
        bne     LD057                           ; D058 D0 FD                    ..
LD05A:  lda     MICRODISC_CONTROL_SHADOW        ; D05A AD FB 04                 ...
        stx     MICRODISC_FDC_COMMAND           ; D05D 8E 10 03                 ...
        ora     #$01                            ; D060 09 01                    ..
        sta     MICRODISC_CONTROL               ; D062 8D 14 03                 ...
        txa                                     ; D065 8A                       .
        and     #$F0                            ; D066 29 F0                    ).
        cmp     #$E0                            ; D068 C9 E0                    ..
        cli                                     ; D06A 58                       X
        beq     LD073                           ; D06B F0 06                    ..
        and     #$20                            ; D06D 29 20                    ) 
        bne     LD085                           ; D06F D0 14                    ..
        nop                                     ; D071 EA                       .
        nop                                     ; D072 EA                       .
LD073:  lda     MICRODISC_DRQ                   ; D073 AD 18 03                 ...
        bmi     LD073                           ; D076 30 FB                    0.
        lda     MICRODISC_FDC_DATA              ; D078 AD 13 03                 ...
        sta     (SEDORIC_TRAV1),y               ; D07B 91 F3                    ..
        iny                                     ; D07D C8                       .
        bne     LD073                           ; D07E D0 F3                    ..
        .byte   $E6                             ; D080 E6                       .
read_data:
        .byte   $F4                             ; D081 F4                       .
        jmp     LD073                           ; D082 4C 73 D0                 Ls.

; ----------------------------------------------------------------------------
LD085:  lda     MICRODISC_DRQ                   ; D085 AD 18 03                 ...
        bmi     LD085                           ; D088 30 FB                    0.
        lda     (SEDORIC_TRAV1),y               ; D08A B1 F3                    ..
        sta     MICRODISC_FDC_DATA              ; D08C 8D 13 03                 ...
        iny                                     ; D08F C8                       .
        bne     LD085                           ; D090 D0 F3                    ..
        .byte   $E6                             ; D092 E6                       .
write_data:
        .byte   $F4                             ; D093 F4                       .
        jmp     LD085                           ; D094 4C 85 D0                 L..

; ----------------------------------------------------------------------------
        nop                                     ; D097 EA                       .
        nop                                     ; D098 EA                       .
        nop                                     ; D099 EA                       .
        bit     MICRODISC_CONTROL               ; D09A 2C 14 03                 ,..
        bpl     LD0A2                           ; D09D 10 03                    ..
        jmp     IRQRAM                          ; D09F 4C F5 04                 L..

; ----------------------------------------------------------------------------
LD0A2:  pla                                     ; D0A2 68                       h
        pla                                     ; D0A3 68                       h
        pla                                     ; D0A4 68                       h
        lda     MICRODISC_CONTROL_SHADOW        ; D0A5 AD FB 04                 ...
        sta     MICRODISC_CONTROL               ; D0A8 8D 14 03                 ...
        ldy     SEDORIC_DRIVE                   ; D0AB AC 00 C0                 ...
        lda     MICRODISC_FDC_TRACK             ; D0AE AD 11 03                 ...
        sta     LD126,y                         ; D0B1 99 26 D1                 .&.
        clc                                     ; D0B4 18                       .
        lda     MICRODISC_FDC_COMMAND           ; D0B5 AD 10 03                 ...
        and     #$5C                            ; D0B8 29 5C                    )\
        tay                                     ; D0BA A8                       .
        .byte   $AE                             ; D0BB AE                       .
LD0BC:  .byte   $05                             ; D0BC 05                       .
LD0BD:  cpy     #$30                            ; D0BD C0 30                    .0
        .byte   $02                             ; D0BF 02                       .
        ldy     #$00                            ; D0C0 A0 00                    ..
LD0C2:  sty     SEDORIC_IO_ERROR                ; D0C2 8C 17 C0                 ...
        and     #$40                            ; D0C5 29 40                    )@
        bne     LD0D8                           ; D0C7 D0 0F                    ..
        tya                                     ; D0C9 98                       .
        and     #$10                            ; D0CA 29 10                    ).
        beq     LD0DB                           ; D0CC F0 0D                    ..
        dec     SEDORIC_XRWTS_RETRY             ; D0CE CE 06 C0                 ...
        beq     LD0D8                           ; D0D1 F0 05                    ..
        jsr     LD0E8                           ; D0D3 20 E8 D0                  ..
        bcc     LD0E5                           ; D0D6 90 0D                    ..
LD0D8:  sec                                     ; D0D8 38                       8
LD0D9:  pla                                     ; D0D9 68                       h
        rts                                     ; D0DA 60                       `

; ----------------------------------------------------------------------------
LD0DB:  tya                                     ; D0DB 98                       .
        and     #$0C                            ; D0DC 29 0C                    ).
        beq     LD0D9                           ; D0DE F0 F9                    ..
        dec     SEDORIC_NUMBER_OF_RETRY         ; D0E0 CE 07 C0                 ...
        beq     LD0D8                           ; D0E3 F0 F3                    ..
LD0E5:  jmp     LCFF9                           ; D0E5 4C F9 CF                 L..

; ----------------------------------------------------------------------------
LD0E8:  txa                                     ; D0E8 8A                       .
        pha                                     ; D0E9 48                       H
; Test de la piste sous la tête.
SEDORIC_TEST_TRACK_UNDER_HEAD:
        lda     SEDORIC_RWBUF                   ; D0EA AD 03 C0                 ...
        pha                                     ; D0ED 48                       H
        lda     SEDORIC_RWBUF+1                 ; D0EE AD 04 C0                 ...
        pha                                     ; D0F1 48                       H
        lda     #$60                            ; D0F2 A9 60                    .`
        ldy     #$C0                            ; D0F4 A0 C0                    ..
        sta     SEDORIC_RWBUF                   ; D0F6 8D 03 C0                 ...
        sty     SEDORIC_RWBUF+1                 ; D0F9 8C 04 C0                 ...
        lda     SEDORIC_XRWTS_RETRY             ; D0FC AD 06 C0                 ...
        ldx     #$C0                            ; D0FF A2 C0                    ..
        ldy     #$01                            ; D101 A0 01                    ..
        jsr     LCFEC                           ; D103 20 EC CF                  ..
        sta     SEDORIC_XRWTS_RETRY             ; D106 8D 06 C0                 ...
        pla                                     ; D109 68                       h
        sta     SEDORIC_RWBUF+1                 ; D10A 8D 04 C0                 ...
        pla                                     ; D10D 68                       h
        sta     SEDORIC_RWBUF                   ; D10E 8D 03 C0                 ...
        bcs     LD11C                           ; D111 B0 09                    ..
        lda     MICRODISC_FDC_SECTOR            ; D113 AD 12 03                 ...
        ldy     SEDORIC_DRIVE                   ; D116 AC 00 C0                 ...
        sta     LD126,y                         ; D119 99 26 D1                 .&.
LD11C:  pla                                     ; D11C 68                       h
        tax                                     ; D11D AA                       .
        stx     SEDORIC_TYPE_OF_ERROR           ; D11E 8E 05 C0                 ...
LD121:  rts                                     ; D121 60                       `

; ----------------------------------------------------------------------------
LD122:  sty     $A4                             ; D122 84 A4                    ..
        cpy     $E4                             ; D124 C4 E4                    ..
LD126:  bvc     SEDORIC_INIT_STACK_DISPLAY_ERROR_AND_GOTO_READY; D126 50 50     PP
        bvc     LD17A                           ; D128 50 50                    PP
        bvc     LD0BC                           ; D12A 50 90                    P.
        ora     $A9                             ; D12C 05 A9                    ..
        bne     LD0BD                           ; D12E D0 8D                    ..
        bpl     LD135                           ; D130 10 03                    ..
        sec                                     ; D132 38                       8
LD135           := * + 2
        jmp     NMIRAM                          ; D133 4C F8 04                 L..

; ----------------------------------------------------------------------------
        stx     SEDORIC_TRAV1                   ; D136 86 F3                    ..
        ldx     #$04                            ; D138 A2 04                    ..
        jsr     LD36C                           ; D13A 20 6C D3                  l.
        sec                                     ; D13D 38                       8
        ldx     SEDORIC_TRAV1                   ; D13E A6 F3                    ..
        lda     SEDORIC_TRAV0                   ; D140 A5 F2                    ..
        sbc     #$02                            ; D142 E9 02                    ..
        bcs     LD147                           ; D144 B0 01                    ..
        dex                                     ; D146 CA                       .
LD147:  pha                                     ; D147 48                       H
        txa                                     ; D148 8A                       .
        jsr     XAFHEX                          ; D149 20 13 D6                  ..
        pla                                     ; D14C 68                       h
        jsr     XAFHEX                          ; D14D 20 13 D6                  ..
        cli                                     ; D150 58                       X
        ldx     #$FF                            ; D151 A2 FF                    ..
        txs                                     ; D153 9A                       .
        jsr     SEDORIC_XROM                    ; D154 20 D8 D5                  ..
; adresse ROM 1.0 adresse ROM 1.1
adress_return:
        .byte   $AD,$C4,$A0,$C4                 ; D157 AD C4 A0 C4              ....
; ----------------------------------------------------------------------------
        rts                                     ; D15B 60                       `

; ----------------------------------------------------------------------------
; Décale un bloc mémoire vers le haut
SEDORIC_SHIFT_BLOCK_MEMORY_UP:
        jsr     SEDORIC_XROM                    ; D15C 20 D8 D5                  ..
; adresse ROM 1.0 adresse ROM 1.1
adress return:
        .byte   $F8,$C3,$F4,$C3                 ; D15F F8 C3 F4 C3              ....
; ----------------------------------------------------------------------------
        rts                                     ; D163 60                       `

; ----------------------------------------------------------------------------
; Vérifie que l'adresse AY est en dessous des chaînes
SEDORIC_CHECK_AY_ADRESS_IS_LOWER:
        jsr     SEDORIC_XROM                    ; D164 20 D8 D5                  ..
; adresse ROM 1.0 adresse ROM 1.1
Garbage:.byte   $48,$C4,$44,$C4                 ; D167 48 C4 44 C4              H.D.
; ----------------------------------------------------------------------------
        rts                                     ; D16B 60                       `

; ----------------------------------------------------------------------------
; X
SEDORIC_DISPLAY_OUT_OF_MEMORY:
        ldx     #$4D                            ; D16C A2 4D                    .M
        .byte   $2C                             ; D16E 2C                       ,
; X
SEDORIC_DISPLAY_TYPE_MISMATCH:
        ldx     #$A3                            ; D16F A2 A3                    ..
        jsr     SEDORIC_XROM                    ; D171 20 D8 D5                  ..
; adresse ROM 1.0 adresse ROM 1.1
Garbage2:
        .byte   $85,$C4,$7E,$C4                 ; D174 85 C4 7E C4              ..~.
; ----------------------------------------------------------------------------
; Réinitialise la pile, affiche ' ERROR' et retourne au 'Ready'
SEDORIC_INIT_STACK_DISPLAY_ERROR_AND_GOTO_READY:
LD17A           := * + 2
        jsr     SEDORIC_XROM                    ; D178 20 D8 D5                  ..
; adresse ROM 1.0 adresse ROM 1.1
Garbage3:
        .byte   $A3,$C4,$96,$C4                 ; D17B A3 C4 96 C4              ....
; ----------------------------------------------------------------------------
        rts                                     ; D17F 60                       `

; ----------------------------------------------------------------------------
; Retourne au Ready
SEDORIC_RETURN_TO_READY:
        jsr     SEDORIC_XROM                    ; D180 20 D8 D5                  ..
; adresse ROM 1.0 adresse ROM 1.1
Garbage4:
        .byte   $B5,$C4,$A8,$C4                 ; D183 B5 C4 A8 C4              ....
; ----------------------------------------------------------------------------
        rts                                     ; D187 60                       `

; ----------------------------------------------------------------------------
LD188:  lda     $9A                             ; D188 A5 9A                    ..
        ldy     $9B                             ; D18A A4 9B                    ..
; Restaure les liens des lignes à partir de l'adresse AY
SEDORIC_RESTORE_LINK_OF_LINE_WITH_ADRESS_AY:
        jsr     SEDORIC_XROM                    ; D18C 20 D8 D5                  ..
; adresse ROM 1.0 adresse ROM 1.1
Garbage5:
        .byte   $73,$C5,$63,$C5                 ; D18F 73 C5 63 C5              s.c.
; ----------------------------------------------------------------------------
        rts                                     ; D193 60                       `

; ----------------------------------------------------------------------------
; Encode les mots-clé
SEDORIC_ENCODE_KEYWORD:
        jsr     SEDORIC_XROM                    ; D194 20 D8 D5                  ..
; adresse ROM 1.0 adresse ROM 1.1
Garbage6:
        .byte   $0A,$C6,$FA,$C5                 ; D197 0A C6 FA C5              ....
; ----------------------------------------------------------------------------
        rts                                     ; D19B 60                       `

; ----------------------------------------------------------------------------
LD19C:  jsr     SEDORIC_XROM                    ; D19C 20 D8 D5                  ..
        dec     $B3C6,x                         ; D19F DE C6 B3                 ...
        dec     $60                             ; D1A2 C6 60                    .`
        jsr     SEDORIC_XROM                    ; D1A4 20 D8 D5                  ..
        inc     SEDORIC_BUF3+198                ; D1A7 EE C6 C3                 ...
        dec     $60                             ; D1AA C6 60                    .`
LD1AC:  jsr     SEDORIC_XROM                    ; D1AC 20 D8 D5                  ..
        adc     $C7                             ; D1AF 65 C7                    e.
        .byte   $3A                             ; D1B1 3A                       :
        .byte   $C7                             ; D1B2 C7                       .
        rts                                     ; D1B3 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D1B4 20 D8 D5                  ..
        sta     $6CC7,y                         ; D1B7 99 C7 6C                 ..l
        .byte   $C7                             ; D1BA C7                       .
        rts                                     ; D1BB 60                       `

; ----------------------------------------------------------------------------
LD1BC:  jsr     SEDORIC_XROM                    ; D1BC 20 D8 D5                  ..
        rti                                     ; D1BF 40                       @

; ----------------------------------------------------------------------------
        iny                                     ; D1C0 C8                       .
        asl     $C8,x                           ; D1C1 16 C8                    ..
        rts                                     ; D1C3 60                       `

; ----------------------------------------------------------------------------
LD1C4:  .byte   $20                             ; D1C4 20                        
        cld                                     ; D1C5 D8                       .
LD1C6:  cmp     $3D,x                           ; D1C6 D5 3D                    .=
        iny                                     ; D1C8 C8                       .
        .byte   $2F                             ; D1C9 2F                       /
        iny                                     ; D1CA C8                       .
        rts                                     ; D1CB 60                       `

; ----------------------------------------------------------------------------
LD1CC:  jsr     SEDORIC_XROM                    ; D1CC 20 D8 D5                  ..
        .byte   $1F                             ; D1CF 1F                       .
        cmp     #$52                            ; D1D0 C9 52                    .R
        cmp     #$60                            ; D1D2 C9 60                    .`
        jsr     SEDORIC_XROM                    ; D1D4 20 D8 D5                  ..
        .byte   $F1                             ; D1D7 F1                       .
LD1D8:  cmp     #$23                            ; D1D8 C9 23                    .#
        dex                                     ; D1DA CA                       .
        rts                                     ; D1DB 60                       `

; ----------------------------------------------------------------------------
LD1DC:  jsr     SEDORIC_XROM                    ; D1DC 20 D8 D5                  ..
        .byte   $1C                             ; D1DF 1C                       .
        dex                                     ; D1E0 CA                       .
        .byte   $4E                             ; D1E1 4E                       N
        dex                                     ; D1E2 CA                       .
LD1E3:  jsr     SEDORIC_XROM                    ; D1E3 20 D8 D5                  ..
        ora     $3FCA                           ; D1E6 0D CA 3F                 ..?
        dex                                     ; D1E9 CA                       .
        rts                                     ; D1EA 60                       `

; ----------------------------------------------------------------------------
LD1EB:  jsr     SEDORIC_XROM                    ; D1EB 20 D8 D5                  ..
        eor     ($CA,x)                         ; D1EE 41 CA                    A.
        .byte   $73                             ; D1F0 73                       s
        dex                                     ; D1F1 CA                       .
        rts                                     ; D1F2 60                       `

; ----------------------------------------------------------------------------
        jsr     LD39E                           ; D1F3 20 9E D3                  ..
        jsr     SEDORIC_XROM                    ; D1F6 20 D8 D5                  ..
        tya                                     ; D1F9 98                       .
        dex                                     ; D1FA CA                       .
        .byte   $E2                             ; D1FB E2                       .
        dex                                     ; D1FC CA                       .
        rts                                     ; D1FD 60                       `

; ----------------------------------------------------------------------------
LD1FE:  jsr     SEDORIC_XROM                    ; D1FE 20 D8 D5                  ..
        .byte   $EF                             ; D201 EF                       .
        dex                                     ; D202 CA                       .
        and     $60CB,y                         ; D203 39 CB 60                 9.`
LD206:  jsr     SEDORIC_XROM                    ; D206 20 D8 D5                  ..
        .byte   $9F                             ; D209 9F                       .
        .byte   $CB                             ; D20A CB                       .
        beq     LD1D8                           ; D20B F0 CB                    ..
        rts                                     ; D20D 60                       `

; ----------------------------------------------------------------------------
LD20E:  jsr     SEDORIC_XROM                    ; D20E 20 D8 D5                  ..
        .byte   $12                             ; D211 12                       .
        cpy     TOKEN_ADDR_TABLE+178            ; D212 CC D9 CC                 ...
        rts                                     ; D215 60                       `

; ----------------------------------------------------------------------------
LD216:  jsr     LD224                           ; D216 20 24 D2                  $.
LD219:  clc                                     ; D219 18                       .
        .byte   $24                             ; D21A 24                       $
LD21B:  sec                                     ; D21B 38                       8
LD21C:  jsr     SEDORIC_XROM                    ; D21C 20 D8 D5                  ..
        adc     $09CE,x                         ; D21F 7D CE 09                 }..
        .byte   $CF                             ; D222 CF                       .
        rts                                     ; D223 60                       `

; ----------------------------------------------------------------------------
LD224:  jsr     SEDORIC_XROM                    ; D224 20 D8 D5                  ..
        .byte   $8B                             ; D227 8B                       .
        dec     LCF17                           ; D228 CE 17 CF                 ...
        rts                                     ; D22B 60                       `

; ----------------------------------------------------------------------------
LD22C:  lda     #$2C                            ; D22C A9 2C                    .,
LD22E:  jsr     SEDORIC_XROM                    ; D22E 20 D8 D5                  ..
        .byte   $DB                             ; D231 DB                       .
        .byte   $CF                             ; D232 CF                       .
        .byte   $67                             ; D233 67                       g
        bne     LD282                           ; D234 D0 4C                    .L
        lda     ($D3,x)                         ; D236 A1 D3                    ..
LD238:  jsr     SEDORIC_XROM                    ; D238 20 D8 D5                  ..
        .byte   $FC                             ; D23B FC                       .
        .byte   $D0                             ; D23C D0                       .
LD23D:  dey                                     ; D23D 88                       .
        cmp     ($85),y                         ; D23E D1 85                    ..
        .byte   $D3                             ; D240 D3                       .
        sty     $D4                             ; D241 84 D4                    ..
        rts                                     ; D243 60                       `

; ----------------------------------------------------------------------------
LD244:  jsr     SEDORIC_XROM                    ; D244 20 D8 D5                  ..
        cli                                     ; D247 58                       X
        cmp     ($E8),y                         ; D248 D1 E8                    ..
        cmp     ($60),y                         ; D24A D1 60                    .`
LD24C:  jsr     SEDORIC_XROM                    ; D24C 20 D8 D5                  ..
        .byte   $17                             ; D24F 17                       .
        .byte   $D2                             ; D250 D2                       .
        lda     #$D2                            ; D251 A9 D2                    ..
        rts                                     ; D253 60                       `

; ----------------------------------------------------------------------------
LD254:  .byte   $20                             ; D254 20                        
LD255:  cld                                     ; D255 D8                       .
        cmp     $ED,x                           ; D256 D5 ED                    ..
        .byte   $D3                             ; D258 D3                       .
        sta     $60D4,y                         ; D259 99 D4 60                 ..`
LD25C:  jsr     SEDORIC_XROM                    ; D25C 20 D8 D5                  ..
LD25F:  ora     LD2D4,y                         ; D25F 19 D4 D2                 ...
        .byte   $D4                             ; D262 D4                       .
        rts                                     ; D263 60                       `

; ----------------------------------------------------------------------------
LD264:  jsr     SEDORIC_XROM                    ; D264 20 D8 D5                  ..
        beq     LD23D                           ; D267 F0 D4                    ..
        .byte   $AB                             ; D269 AB                       .
        cmp     $60,x                           ; D26A D5 60                    .`
        jsr     SEDORIC_XROM                    ; D26C 20 D8 D5                  ..
        .byte   $C7                             ; D26F C7                       .
        dec     $82,x                           ; D270 D6 82                    ..
        .byte   $D7                             ; D272 D7                       .
        rts                                     ; D273 60                       `

; ----------------------------------------------------------------------------
LD274:  jsr     LD21B                           ; D274 20 1B D2                  ..
LD277:  jsr     SEDORIC_XROM                    ; D277 20 D8 D5                  ..
        ora     $D7,x                           ; D27A 15 D7                    ..
        bne     LD255                           ; D27C D0 D7                    ..
        rts                                     ; D27E 60                       `

; ----------------------------------------------------------------------------
LD27F:  jsr     LD216                           ; D27F 20 16 D2                  ..
LD282:  jsr     SEDORIC_XROM                    ; D282 20 D8 D5                  ..
        bpl     LD25F                           ; D285 10 D8                    ..
        .byte   $CB                             ; D287 CB                       .
        cld                                     ; D288 D8                       .
        rts                                     ; D289 60                       `

; ----------------------------------------------------------------------------
LD28A:  jsr     SEDORIC_XROM                    ; D28A 20 D8 D5                  ..
        .byte   $6B                             ; D28D 6B                       k
        cld                                     ; D28E D8                       .
        rol     $D9                             ; D28F 26 D9                    &.
        rts                                     ; D291 60                       `

; ----------------------------------------------------------------------------
LD292:  jsr     SEDORIC_XROM                    ; D292 20 D8 D5                  ..
        stx     $D9,y                           ; D295 96 D9                    ..
        .byte   $22                             ; D297 22                       "
        .byte   $DA                             ; D298 DA                       .
        rts                                     ; D299 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D29A 20 D8 D5                  ..
        .byte   $80                             ; D29D 80                       .
        .byte   $DA                             ; D29E DA                       .
        .byte   $0B                             ; D29F 0B                       .
        .byte   $DB                             ; D2A0 DB                       .
        rts                                     ; D2A1 60                       `

; ----------------------------------------------------------------------------
LD2A2:  jsr     SEDORIC_XROM                    ; D2A2 20 D8 D5                  ..
        .byte   $97                             ; D2A5 97                       .
        .byte   $DA                             ; D2A6 DA                       .
        .byte   $22                             ; D2A7 22                       "
        .byte   $DB                             ; D2A8 DB                       .
        rts                                     ; D2A9 60                       `

; ----------------------------------------------------------------------------
LD2AA:  jsr     SEDORIC_XROM                    ; D2AA 20 D8 D5                  ..
        .byte   $B7                             ; D2AD B7                       .
        .byte   $DC                             ; D2AE DC                       .
        sbc     $60DC                           ; D2AF ED DC 60                 ..`
        jsr     SEDORIC_XROM                    ; D2B2 20 D8 D5                  ..
        cpx     #$DD                            ; D2B5 E0 DD                    ..
        cpx     $DD                             ; D2B7 E4 DD                    ..
        rts                                     ; D2B9 60                       `

; ----------------------------------------------------------------------------
LD2BA:  jsr     SEDORIC_XROM                    ; D2BA 20 D8 D5                  ..
        .byte   $73                             ; D2BD 73                       s
        dec     LDE7B,x                         ; D2BE DE 7B DE                 .{.
        rts                                     ; D2C1 60                       `

; ----------------------------------------------------------------------------
LD2C2:  jsr     SEDORIC_XROM                    ; D2C2 20 D8 D5                  ..
        lda     $DE                             ; D2C5 A5 DE                    ..
        lda     $60DE                           ; D2C7 AD DE 60                 ..`
LD2CA:  jsr     SEDORIC_XROM                    ; D2CA 20 D8 D5                  ..
        cmp     $D8,x                           ; D2CD D5 D8                    ..
        rti                                     ; D2CF 40                       @

; ----------------------------------------------------------------------------
        .byte   $DF                             ; D2D0 DF                       .
        rts                                     ; D2D1 60                       `

; ----------------------------------------------------------------------------
LD2D2:  .byte   $20                             ; D2D2 20                        
        cld                                     ; D2D3 D8                       .
LD2D4:  cmp     $D1,x                           ; D2D4 D5 D1                    ..
        cpx     #$D5                            ; D2D6 E0 D5                    ..
        cpx     #$60                            ; D2D8 E0 60                    .`
LD2DA:  jsr     SEDORIC_XROM                    ; D2DA 20 D8 D5                  ..
        adc     $71E2                           ; D2DD 6D E2 71                 m.q
        .byte   $E2                             ; D2E0 E2                       .
        rts                                     ; D2E1 60                       `

; ----------------------------------------------------------------------------
LD2E2:  jsr     SEDORIC_XROM                    ; D2E2 20 D8 D5                  ..
        adc     $7DE3,y                         ; D2E5 79 E3 7D                 y.}
        .byte   $E3                             ; D2E8 E3                       .
        rts                                     ; D2E9 60                       `

; ----------------------------------------------------------------------------
LD2EA:  jsr     SEDORIC_XROM                    ; D2EA 20 D8 D5                  ..
        .byte   $87                             ; D2ED 87                       .
        .byte   $E3                             ; D2EE E3                       .
        .byte   $8B                             ; D2EF 8B                       .
        .byte   $E3                             ; D2F0 E3                       .
        rts                                     ; D2F1 60                       `

; ----------------------------------------------------------------------------
LD2F2:  jsr     SEDORIC_XROM                    ; D2F2 20 D8 D5                  ..
        stx     $92E3                           ; D2F5 8E E3 92                 ...
        .byte   $E3                             ; D2F8 E3                       .
        rts                                     ; D2F9 60                       `

; ----------------------------------------------------------------------------
LD2FA:  jsr     SEDORIC_XROM                    ; D2FA 20 D8 D5                  ..
        sta     $53E7,x                         ; D2FD 9D E7 53                 ..S
        inx                                     ; D300 E8                       .
        rts                                     ; D301 60                       `

; ----------------------------------------------------------------------------
; Saisit une touche: si touche frappée alors N = 1 et A = code ASCII sinon N = 0
SEDORIC_KEYBOARD_WAIT:
        jsr     SEDORIC_XROM                    ; D302 20 D8 D5                  ..
        ora     $E9                             ; D305 05 E9                    ..
        sei                                     ; D307 78                       x
        .byte   $EB                             ; D308 EB                       .
        rts                                     ; D309 60                       `

; ----------------------------------------------------------------------------
LD30A:  jsr     SEDORIC_XROM                    ; D30A 20 D8 D5                  ..
        .byte   $C7                             ; D30D C7                       .
        cpx     LEDE0                           ; D30E EC E0 ED                 ...
        rts                                     ; D311 60                       `

; ----------------------------------------------------------------------------
LD312:  jsr     SEDORIC_XROM                    ; D312 20 D8 D5                  ..
        adc     $10F0,y                         ; D315 79 F0 10                 y..
        sbc     ($60),y                         ; D318 F1 60                    .`
LD31A:  jsr     SEDORIC_XROM                    ; D31A 20 D8 D5                  ..
        .byte   $94                             ; D31D 94                       .
LD31E:  .byte   $F4                             ; D31E F4                       .
        .byte   $EF                             ; D31F EF                       .
        .byte   $F4                             ; D320 F4                       .
        rts                                     ; D321 60                       `

; ----------------------------------------------------------------------------
LD322:  jsr     SEDORIC_XROM                    ; D322 20 D8 D5                  ..
        and     SEDORIC_TRAV3,x                 ; D325 35 F5                    5.
        bcc     LD31E                           ; D327 90 F5                    ..
        rts                                     ; D329 60                       `

; ----------------------------------------------------------------------------
LD32A:  jsr     SEDORIC_XROM                    ; D32A 20 D8 D5                  ..
        .byte   $CB                             ; D32D CB                       .
        .byte   $F7                             ; D32E F7                       .
        ora     (SEDORIC_TRAV6,x)               ; D32F 01 F8                    ..
        rts                                     ; D331 60                       `

; ----------------------------------------------------------------------------
LD332:  jsr     SEDORIC_XROM                    ; D332 20 D8 D5                  ..
        rol     $82F9,x                         ; D335 3E F9 82                 >..
        .byte   $F9                             ; D338 F9                       .
        rts                                     ; D339 60                       `

; ----------------------------------------------------------------------------
LD33A:  jsr     SEDORIC_XROM                    ; D33A 20 D8 D5                  ..
        .byte   $E2                             ; D33D E2                       .
        brk                                     ; D33E 00                       .
        .byte   $E2                             ; D33F E2                       .
        brk                                     ; D340 00                       .
        rts                                     ; D341 60                       `

; ----------------------------------------------------------------------------
LD342:  jsr     SEDORIC_XROM                    ; D342 20 D8 D5                  ..
        inx                                     ; D345 E8                       .
        brk                                     ; D346 00                       .
        inx                                     ; D347 E8                       .
        brk                                     ; D348 00                       .
        rts                                     ; D349 60                       `

; ----------------------------------------------------------------------------
; ROUTINES SEDORIC D’USAGE GENERAL. Copie NOM et EXT de la table CCF7 dans BUFNOMSaisit une touche: si touche frappée alors N = 1 et A = code ASCII sinon N = 0
SEDORIC_COPY_NAME_AND_EXT_IN_BUFNOM:
        ldy     #$09                            ; D34A A0 09                    ..
; XX
Garbage60:
        .byte   $2C                             ; D34C 2C                       ,
; ----------------------------------------------------------------------------
; X
Garbage100:
        ldy     #$00                            ; D34D A0 00                    ..
LD34F:  lda     COMMON_EXT_TABLE,x              ; D34F BD F7 CC                 ...
        sta     $C029,y                         ; D352 99 29 C0                 .).
        iny                                     ; D355 C8                       .
        inx                                     ; D356 E8                       .
        cpy     #$0C                            ; D357 C0 0C                    ..
        bne     LD34F                           ; D359 D0 F4                    ..
        rts                                     ; D35B 60                       `

; ----------------------------------------------------------------------------
LD35C:  lda     SEDORIC_EXTER                   ; D35C AD 0D C0                 ...
        ldy     $C00E                           ; D35F AC 0E C0                 ...
        bne     LD376                           ; D362 D0 12                    ..
LD364:  lda     SEDORIC_EXTMS                   ; D364 AD 0F C0                 ...
        ldy     $C010                           ; D367 AC 10 C0                 ...
        bne     LD376                           ; D36A D0 0A                    ..
LD36C:  lda     #$E6                            ; D36C A9 E6                    ..
        ldy     #$CE                            ; D36E A0 CE                    ..
        bne     LD376                           ; D370 D0 04                    ..
LD372:  lda     #$BE                            ; D372 A9 BE                    ..
        ldy     #$CD                            ; D374 A0 CD                    ..
LD376:  sta     $18                             ; D376 85 18                    ..
        sty     $19                             ; D378 84 19                    ..
        ldy     #$00                            ; D37A A0 00                    ..
LD37C:  dex                                     ; D37C CA                       .
        bmi     LD38B                           ; D37D 30 0C                    0.
LD37F:  inc     $18                             ; D37F E6 18                    ..
        bne     LD385                           ; D381 D0 02                    ..
        inc     $19                             ; D383 E6 19                    ..
LD385:  lda     ($18),y                         ; D385 B1 18                    ..
        bpl     LD37F                           ; D387 10 F6                    ..
        bmi     LD37C                           ; D389 30 F1                    0.
LD38B:  iny                                     ; D38B C8                       .
        lda     ($18),y                         ; D38C B1 18                    ..
        php                                     ; D38E 08                       .
        and     #$7F                            ; D38F 29 7F                    ).
        jsr     XAFCAR                          ; D391 20 2A D6                  *.
        plp                                     ; D394 28                       (
        bpl     LD38B                           ; D395 10 F4                    ..
        rts                                     ; D397 60                       `

; ----------------------------------------------------------------------------
LD398:  jsr     LD33A                           ; D398 20 3A D3                  :.
        jmp     LD3A1                           ; D39B 4C A1 D3                 L..

; ----------------------------------------------------------------------------
LD39E:  jsr     LD342                           ; D39E 20 42 D3                  B.
LD3A1:  php                                     ; D3A1 08                       .
        cmp     #$61                            ; D3A2 C9 61                    .a
        bcc     LD3AC                           ; D3A4 90 06                    ..
        cmp     #$7B                            ; D3A6 C9 7B                    .{
        bcs     LD3AC                           ; D3A8 B0 02                    ..
        and     #$DF                            ; D3AA 29 DF                    ).
LD3AC:  plp                                     ; D3AC 28                       (
        rts                                     ; D3AD 60                       `

; ----------------------------------------------------------------------------
        ldx     #$00                            ; D3AE A2 00                    ..
        stx     SEDORIC_IDERROR                 ; D3B0 8E FD 04                 ...
        tsx                                     ; D3B3 BA                       .
        stx     $C023                           ; D3B4 8E 23 C0                 .#.
        lda     $E9                             ; D3B7 A5 E9                    ..
        ldy     $EA                             ; D3B9 A4 EA                    ..
        sta     $C01F                           ; D3BB 8D 1F C0                 ...
        sty     $C020                           ; D3BE 8C 20 C0                 . .
        jsr     LD39E                           ; D3C1 20 9E D3                  ..
        sbc     #$41                            ; D3C4 E9 41                    .A
        ldy     #$1A                            ; D3C6 A0 1A                    ..
        bcc     LD3D2                           ; D3C8 90 08                    ..
        cmp     #$1A                            ; D3CA C9 1A                    ..
        bcs     LD3D2                           ; D3CC B0 04                    ..
        tay                                     ; D3CE A8                       .
        jsr     LD33A                           ; D3CF 20 3A D3                  :.
LD3D2:  tya                                     ; D3D2 98                       .
        asl     a                               ; D3D3 0A                       .
        asl     a                               ; D3D4 0A                       .
        tay                                     ; D3D5 A8                       .
        lda     TOKEN_INITIALS_TABLE,y          ; D3D6 B9 BB CB                 ...
        sta     $18                             ; D3D9 85 18                    ..
        lda     LCBBC,y                         ; D3DB B9 BC CB                 ...
        sta     $19                             ; D3DE 85 19                    ..
        lda     LCBBE,y                         ; D3E0 B9 BE CB                 ...
        sta     SEDORIC_TRAV0                   ; D3E3 85 F2                    ..
        ldx     LCBBD,y                         ; D3E5 BE BD CB                 ...
LD3E8:  dec     SEDORIC_TRAV0                   ; D3E8 C6 F2                    ..
        bmi     LD428                           ; D3EA 30 3C                    0<
        ldy     #$FF                            ; D3EC A0 FF                    ..
LD3EE:  iny                                     ; D3EE C8                       .
        lda     ($18),y                         ; D3EF B1 18                    ..
        beq     LD417                           ; D3F1 F0 24                    .$
        sta     SEDORIC_TRAV1                   ; D3F3 85 F3                    ..
        lda     ($E9),y                         ; D3F5 B1 E9                    ..
        cmp     #$61                            ; D3F7 C9 61                    .a
        bcc     LD401                           ; D3F9 90 06                    ..
        cmp     #$7B                            ; D3FB C9 7B                    .{
        bcs     LD401                           ; D3FD B0 02                    ..
        and     #$DF                            ; D3FF 29 DF                    ).
LD401:  cmp     SEDORIC_TRAV1                   ; D401 C5 F3                    ..
        beq     LD3EE                           ; D403 F0 E9                    ..
LD405:  iny                                     ; D405 C8                       .
        lda     ($18),y                         ; D406 B1 18                    ..
        bne     LD405                           ; D408 D0 FB                    ..
        inx                                     ; D40A E8                       .
        sec                                     ; D40B 38                       8
        tya                                     ; D40C 98                       .
        adc     $18                             ; D40D 65 18                    e.
        sta     $18                             ; D40F 85 18                    ..
        bcc     LD3E8                           ; D411 90 D5                    ..
        inc     $19                             ; D413 E6 19                    ..
        bcs     LD3E8                           ; D415 B0 D1                    ..
LD417:  txa                                     ; D417 8A                       .
        asl     a                               ; D418 0A                       .
        tax                                     ; D419 AA                       .
        lda     TOKEN_ADDR_TABLE+1,x            ; D41A BD 28 CC                 .(.
        pha                                     ; D41D 48                       H
        lda     TOKEN_ADDR_TABLE,x              ; D41E BD 27 CC                 .'.
        pha                                     ; D421 48                       H
        jsr     LD1E3                           ; D422 20 E3 D1                  ..
        jmp     LD39E                           ; D425 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LD428:  lda     $C01F                           ; D428 AD 1F C0                 ...
        ldy     $C020                           ; D42B AC 20 C0                 . .
        sta     $E9                             ; D42E 85 E9                    ..
        sty     $EA                             ; D430 84 EA                    ..
        jsr     LD39E                           ; D432 20 9E D3                  ..
        beq     LD449                           ; D435 F0 12                    ..
        ldy     #$FF                            ; D437 A0 FF                    ..
LD439:  iny                                     ; D439 C8                       .
        lda     ($E9),y                         ; D43A B1 E9                    ..
        beq     LD44A                           ; D43C F0 0C                    ..
        cmp     #$3A                            ; D43E C9 3A                    .:
        beq     LD44A                           ; D440 F0 08                    ..
        cmp     #$D3                            ; D442 C9 D3                    ..
        bne     LD439                           ; D444 D0 F3                    ..
        jmp     LF5BA                           ; D446 4C BA F5                 L..

; ----------------------------------------------------------------------------
LD449:  rts                                     ; D449 60                       `

; ----------------------------------------------------------------------------
LD44A:  lda     #$00                            ; D44A A9 00                    ..
        jmp     LDFF9                           ; D44C 4C F9 DF                 L..

; ----------------------------------------------------------------------------
LD44F:  sec                                     ; D44F 38                       8
        .byte   $24                             ; D450 24                       $
LD451:  clc                                     ; D451 18                       .
        lda     #$80                            ; D452 A9 80                    ..
LD454:  php                                     ; D454 08                       .
        sta     SEDORIC_TRAV2                   ; D455 85 F4                    ..
        lsr     SEDORIC_TRAV3                   ; D457 46 F5                    F.
        lda     SEDORIC_DRVDEF                  ; D459 AD 09 C0                 ...
        sta     SEDORIC_BUFNOM                  ; D45C 8D 28 C0                 .(.
        ldx     #$0B                            ; D45F A2 0B                    ..
        lda     #$20                            ; D461 A9 20                    . 
        sta     SEDORIC_TRAV1                   ; D463 85 F3                    ..
LD465:  sta     $C029,x                         ; D465 9D 29 C0                 .).
        dex                                     ; D468 CA                       .
        bpl     LD465                           ; D469 10 FA                    ..
        plp                                     ; D46B 28                       (
        bpl     LD4D0                           ; D46C 10 62                    .b
        bcs     LD4AB                           ; D46E B0 3B                    .;
        jsr     LD39E                           ; D470 20 9E D3                  ..
        bne     LD481                           ; D473 D0 0C                    ..
LD475:  lda     #$0C                            ; D475 A9 0C                    ..
        sta     SEDORIC_TRAV0                   ; D477 85 F2                    ..
        ldx     #$00                            ; D479 A2 00                    ..
        jsr     LD5B5                           ; D47B 20 B5 D5                  ..
        jmp     LD503                           ; D47E 4C 03 D5                 L..

; ----------------------------------------------------------------------------
LD481:  cmp     #$2C                            ; D481 C9 2C                    .,
        beq     LD475                           ; D483 F0 F0                    ..
        cmp     #$C3                            ; D485 C9 C3                    ..
        beq     LD475                           ; D487 F0 EC                    ..
        sec                                     ; D489 38                       8
        sbc     #$41                            ; D48A E9 41                    .A
        tay                                     ; D48C A8                       .
        cmp     #$04                            ; D48D C9 04                    ..
        bcs     LD4AB                           ; D48F B0 1A                    ..
        jsr     LD398                           ; D491 20 98 D3                  ..
        beq     LD49E                           ; D494 F0 08                    ..
        cmp     #$C3                            ; D496 C9 C3                    ..
        beq     LD49E                           ; D498 F0 04                    ..
        cmp     #$2C                            ; D49A C9 2C                    .,
        bne     LD4A3                           ; D49C D0 05                    ..
LD49E:  sty     SEDORIC_BUFNOM                  ; D49E 8C 28 C0                 .(.
        bcs     LD475                           ; D4A1 B0 D2                    ..
LD4A3:  lda     $E9                             ; D4A3 A5 E9                    ..
        bne     LD4A9                           ; D4A5 D0 02                    ..
        dec     $EA                             ; D4A7 C6 EA                    ..
LD4A9:  dec     $E9                             ; D4A9 C6 E9                    ..
LD4AB:  jsr     LD224                           ; D4AB 20 24 D2                  $.
        jsr     LD274                           ; D4AE 20 74 D2                  t.
        sta     SEDORIC_TRAV1                   ; D4B1 85 F3                    ..
        tay                                     ; D4B3 A8                       .
        dey                                     ; D4B4 88                       .
        bmi     LD532                           ; D4B5 30 7B                    0{
LD4B7:  lda     ($91),y                         ; D4B7 B1 91                    ..
        cmp     #$20                            ; D4B9 C9 20                    . 
        bne     LD4BF                           ; D4BB D0 02                    ..
        dec     SEDORIC_TRAV1                   ; D4BD C6 F3                    ..
LD4BF:  dey                                     ; D4BF 88                       .
        bpl     LD4B7                           ; D4C0 10 F5                    ..
        lda     $E9                             ; D4C2 A5 E9                    ..
        pha                                     ; D4C4 48                       H
        lda     $EA                             ; D4C5 A5 EA                    ..
        pha                                     ; D4C7 48                       H
        lda     $91                             ; D4C8 A5 91                    ..
        sta     $E9                             ; D4CA 85 E9                    ..
        lda     $92                             ; D4CC A5 92                    ..
        sta     $EA                             ; D4CE 85 EA                    ..
LD4D0:  jsr     LD39E                           ; D4D0 20 9E D3                  ..
        sbc     #$41                            ; D4D3 E9 41                    .A
        tax                                     ; D4D5 AA                       .
        cmp     #$04                            ; D4D6 C9 04                    ..
        bcs     LD509                           ; D4D8 B0 2F                    ./
        ldy     #$01                            ; D4DA A0 01                    ..
        lda     ($E9),y                         ; D4DC B1 E9                    ..
        cmp     #$2D                            ; D4DE C9 2D                    .-
        beq     LD4E6                           ; D4E0 F0 04                    ..
        cmp     #$CD                            ; D4E2 C9 CD                    ..
        bne     LD509                           ; D4E4 D0 23                    .#
LD4E6:  stx     SEDORIC_BUFNOM                  ; D4E6 8E 28 C0                 .(.
        dec     SEDORIC_TRAV1                   ; D4E9 C6 F3                    ..
        dec     SEDORIC_TRAV1                   ; D4EB C6 F3                    ..
        beq     LD53D                           ; D4ED F0 4E                    .N
        jsr     LD398                           ; D4EF 20 98 D3                  ..
        jsr     LD398                           ; D4F2 20 98 D3                  ..
        bne     LD509                           ; D4F5 D0 12                    ..
        bit     SEDORIC_TRAV2                   ; D4F7 24 F4                    $.
        bmi     LD532                           ; D4F9 30 37                    07
        pla                                     ; D4FB 68                       h
        pla                                     ; D4FC 68                       h
        jsr     LD7BD                           ; D4FD 20 BD D7                  ..
        jsr     LE5B9                           ; D500 20 B9 E5                  ..
LD503:  jsr     LD7BD                           ; D503 20 BD D7                  ..
        jmp     LD39E                           ; D506 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LD509:  ldx     #$00                            ; D509 A2 00                    ..
        lda     #$09                            ; D50B A9 09                    ..
        sta     SEDORIC_TRAV0                   ; D50D 85 F2                    ..
        lsr     SEDORIC_TRAV4                   ; D50F 46 F6                    F.
        jsr     LD39E                           ; D511 20 9E D3                  ..
LD514:  bit     SEDORIC_TRAV4                   ; D514 24 F6                    $.
        bmi     LD52A                           ; D516 30 12                    0.
        cmp     #$2E                            ; D518 C9 2E                    ..
        bne     LD52A                           ; D51A D0 0E                    ..
        ror     SEDORIC_TRAV4                   ; D51C 66 F6                    f.
        cpx     #$0A                            ; D51E E0 0A                    ..
        bcs     LD53D                           ; D520 B0 1B                    ..
        lda     #$0C                            ; D522 A9 0C                    ..
        sta     SEDORIC_TRAV0                   ; D524 85 F2                    ..
        ldx     #$08                            ; D526 A2 08                    ..
        bne     LD53F                           ; D528 D0 15                    ..
LD52A:  cmp     #$2C                            ; D52A C9 2C                    .,
        bne     LD534                           ; D52C D0 06                    ..
        bit     SEDORIC_TRAV2                   ; D52E 24 F4                    $.
        bpl     LD559                           ; D530 10 27                    .'
LD532:  bmi     LD5AC                           ; D532 30 78                    0x
LD534:  jsr     LD567                           ; D534 20 67 D5                  g.
        sta     $C029,x                         ; D537 9D 29 C0                 .).
        tya                                     ; D53A 98                       .
        cpx     SEDORIC_TRAV0                   ; D53B E4 F2                    ..
LD53D:  bcs     LD5AC                           ; D53D B0 6D                    .m
LD53F:  dec     SEDORIC_TRAV1                   ; D53F C6 F3                    ..
        beq     LD553                           ; D541 F0 10                    ..
        inx                                     ; D543 E8                       .
        bit     SEDORIC_TRAV3                   ; D544 24 F5                    $.
        bmi     LD514                           ; D546 30 CC                    0.
        jsr     LD398                           ; D548 20 98 D3                  ..
        bne     LD514                           ; D54B D0 C7                    ..
        bit     SEDORIC_TRAV2                   ; D54D 24 F4                    $.
        bpl     LD559                           ; D54F 10 08                    ..
        bmi     LD5AC                           ; D551 30 59                    0Y
LD553:  pla                                     ; D553 68                       h
        sta     $EA                             ; D554 85 EA                    ..
        pla                                     ; D556 68                       h
        sta     $E9                             ; D557 85 E9                    ..
LD559:  lda     $C032                           ; D559 AD 32 C0                 .2.
        cmp     #$20                            ; D55C C9 20                    . 
        bne     LD503                           ; D55E D0 A3                    ..
        ldx     #$00                            ; D560 A2 00                    ..
        jsr     SEDORIC_COPY_NAME_AND_EXT_IN_BUFNOM; D562 20 4A D3               J.
        beq     LD503                           ; D565 F0 9C                    ..
LD567:  bit     SEDORIC_TRAV3                   ; D567 24 F5                    $.
        bmi     LD58F                           ; D569 30 24                    0$
        tay                                     ; D56B A8                       .
        bpl     LD5B1                           ; D56C 10 43                    .C
        sta     SEDORIC_TRAV3                   ; D56E 85 F5                    ..
        and     #$7F                            ; D570 29 7F                    ).
        sta     $24                             ; D572 85 24                    .$
        lda     #$E9                            ; D574 A9 E9                    ..
        ldy     #$C0                            ; D576 A0 C0                    ..
        sta     $16                             ; D578 85 16                    ..
        sty     $17                             ; D57A 84 17                    ..
        ldy     #$00                            ; D57C A0 00                    ..
LD57E:  dec     $24                             ; D57E C6 24                    .$
        bmi     LD58F                           ; D580 30 0D                    0.
LD582:  inc     $16                             ; D582 E6 16                    ..
        bne     LD588                           ; D584 D0 02                    ..
        inc     $17                             ; D586 E6 17                    ..
LD588:  jsr     DO_EXEVEC                       ; D588 20 53 04                  S.
        bpl     LD582                           ; D58B 10 F5                    ..
        bmi     LD57E                           ; D58D 30 EF                    0.
LD58F:  ldy     #$00                            ; D58F A0 00                    ..
        inc     $16                             ; D591 E6 16                    ..
        bne     LD597                           ; D593 D0 02                    ..
        inc     $17                             ; D595 E6 17                    ..
LD597:  jsr     DO_EXEVEC                       ; D597 20 53 04                  S.
        pha                                     ; D59A 48                       H
        ldy     #$01                            ; D59B A0 01                    ..
        jsr     DO_EXEVEC                       ; D59D 20 53 04                  S.
        tay                                     ; D5A0 A8                       .
        pla                                     ; D5A1 68                       h
        php                                     ; D5A2 08                       .
        and     #$7F                            ; D5A3 29 7F                    ).
        plp                                     ; D5A5 28                       (
        bpl     LD5C1                           ; D5A6 10 19                    ..
        lsr     SEDORIC_TRAV3                   ; D5A8 46 F5                    F.
        bpl     LD5C3                           ; D5AA 10 17                    ..
LD5AC:  ldx     #$02                            ; D5AC A2 02                    ..
        jmp     LD67E                           ; D5AE 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LD5B1:  cmp     #$2A                            ; D5B1 C9 2A                    .*
        bne     LD5C3                           ; D5B3 D0 0E                    ..
LD5B5:  lda     #$3F                            ; D5B5 A9 3F                    .?
LD5B7:  sta     $C029,x                         ; D5B7 9D 29 C0                 .).
        inx                                     ; D5BA E8                       .
        cpx     SEDORIC_TRAV0                   ; D5BB E4 F2                    ..
        bne     LD5B7                           ; D5BD D0 F8                    ..
        dex                                     ; D5BF CA                       .
        rts                                     ; D5C0 60                       `

; ----------------------------------------------------------------------------
LD5C1:  inc     SEDORIC_TRAV1                   ; D5C1 E6 F3                    ..
LD5C3:  cmp     #$3F                            ; D5C3 C9 3F                    .?
        beq     LD5D7                           ; D5C5 F0 10                    ..
        cmp     #$30                            ; D5C7 C9 30                    .0
        bcc     LD5AC                           ; D5C9 90 E1                    ..
        cmp     #$3A                            ; D5CB C9 3A                    .:
        bcc     LD5D7                           ; D5CD 90 08                    ..
        cmp     #$41                            ; D5CF C9 41                    .A
        bcc     LD5AC                           ; D5D1 90 D9                    ..
        cmp     #$5B                            ; D5D3 C9 5B                    .[
        bcs     LD5AC                           ; D5D5 B0 D5                    ..
LD5D7:  rts                                     ; D5D7 60                       `

; ----------------------------------------------------------------------------
SEDORIC_XROM:
        sta     $0C                             ; D5D8 85 0C                    ..
        sty     $0D                             ; D5DA 84 0D                    ..
        php                                     ; D5DC 08                       .
        pla                                     ; D5DD 68                       h
        sta     $27                             ; D5DE 85 27                    .'
        clc                                     ; D5E0 18                       .
        pla                                     ; D5E1 68                       h
        sta     $0E                             ; D5E2 85 0E                    ..
        adc     #$04                            ; D5E4 69 04                    i.
        tay                                     ; D5E6 A8                       .
        pla                                     ; D5E7 68                       h
        sta     $0F                             ; D5E8 85 0F                    ..
        adc     #$00                            ; D5EA 69 00                    i.
        pha                                     ; D5EC 48                       H
        tya                                     ; D5ED 98                       .
        pha                                     ; D5EE 48                       H
        ldy     #$01                            ; D5EF A0 01                    ..
        lda     SEDORIC_ATMORI                  ; D5F1 AD 24 C0                 .$.
        bpl     LD5F8                           ; D5F4 10 02                    ..
        ldy     #$03                            ; D5F6 A0 03                    ..
LD5F8:  lda     ($0E),y                         ; D5F8 B1 0E                    ..
        sta     SEDORIC_EXEVEC+1                ; D5FA 8D F0 04                 ...
        iny                                     ; D5FD C8                       .
        lda     ($0E),y                         ; D5FE B1 0E                    ..
        sta     SEDORIC_EXEVEC+2                ; D600 8D F1 04                 ...
        ldy     $0D                             ; D603 A4 0D                    ..
        lda     $27                             ; D605 A5 27                    .'
        pha                                     ; D607 48                       H
        lda     $0C                             ; D608 A5 0C                    ..
        plp                                     ; D60A 28                       (
        jmp     L0471                           ; D60B 4C 71 04                 Lq.

; ----------------------------------------------------------------------------
LD60E:  clc                                     ; D60E 18                       .
        adc     #$41                            ; D60F 69 41                    iA
        bvc     XAFCAR                          ; D611 50 17                    P.
XAFHEX: pha                                     ; D613 48                       H
        lsr     a                               ; D614 4A                       J
        lsr     a                               ; D615 4A                       J
        lsr     a                               ; D616 4A                       J
        lsr     a                               ; D617 4A                       J
        jsr     LD61E                           ; D618 20 1E D6                  ..
        pla                                     ; D61B 68                       h
        and     #$0F                            ; D61C 29 0F                    ).
LD61E:  cmp     #$0A                            ; D61E C9 0A                    ..
        bcc     LD624                           ; D620 90 02                    ..
        adc     #$06                            ; D622 69 06                    i.
LD624:  clc                                     ; D624 18                       .
        adc     #$30                            ; D625 69 30                    i0
        .byte   $2C                             ; D627 2C                       ,
XAFCAR_DISPLAY_SPACE:
        lda     #$20                            ; D628 A9 20                    . 
XAFCAR: cmp     #$0D                            ; D62A C9 0D                    ..
        bne     LD634                           ; D62C D0 06                    ..
        lda     #$00                            ; D62E A9 00                    ..
        sta     $30                             ; D630 85 30                    .0
        lda     #$0D                            ; D632 A9 0D                    ..
LD634:  jmp     LD20E                           ; D634 4C 0E D2                 L..

; ----------------------------------------------------------------------------
XAFSTR: sta     $91                             ; D637 85 91                    ..
        sty     $92                             ; D639 84 92                    ..
        ldy     #$00                            ; D63B A0 00                    ..
LD63D:  lda     ($91),y                         ; D63D B1 91                    ..
        beq     LD647                           ; D63F F0 06                    ..
        jsr     XAFCAR                          ; D641 20 2A D6                  *.
        iny                                     ; D644 C8                       .
        bne     LD63D                           ; D645 D0 F6                    ..
LD647:  rts                                     ; D647 60                       `

; ----------------------------------------------------------------------------
LD648:  ldx     #$14                            ; D648 A2 14                    ..
        jsr     LD36C                           ; D64A 20 6C D3                  l.
        lda     SEDORIC_DRIVE                   ; D64D AD 00 C0                 ...
        jsr     LD60E                           ; D650 20 0E D6                  ..
        jsr     LD206                           ; D653 20 06 D2                  ..
        ldx     #$0D                            ; D656 A2 0D                    ..
        jsr     LD36C                           ; D658 20 6C D3                  l.
        cli                                     ; D65B 58                       X
        jsr     LD669                           ; D65C 20 69 D6                  i.
        sei                                     ; D65F 78                       x
        php                                     ; D660 08                       .
        jsr     LD206                           ; D661 20 06 D2                  ..
        jsr     LD206                           ; D664 20 06 D2                  ..
        plp                                     ; D667 28                       (
        rts                                     ; D668 60                       `

; ----------------------------------------------------------------------------
LD669:  jsr     SEDORIC_KEYBOARD_WAIT           ; D669 20 02 D3                  ..
        cmp     #$1B                            ; D66C C9 1B                    ..
        beq     LD675                           ; D66E F0 05                    ..
        cmp     #$0D                            ; D670 C9 0D                    ..
        bne     LD669                           ; D672 D0 F5                    ..
        clc                                     ; D674 18                       .
LD675:  rts                                     ; D675 60                       `

; ----------------------------------------------------------------------------
        jsr     LD669                           ; D676 20 69 D6                  i.
        bcc     LD675                           ; D679 90 FA                    ..
        pla                                     ; D67B 68                       h
        pla                                     ; D67C 68                       h
        rts                                     ; D67D 60                       `

; ----------------------------------------------------------------------------
LD67E:  inx                                     ; D67E E8                       .
        stx     SEDORIC_IDERROR                 ; D67F 8E FD 04                 ...
        jmp     (SEDORIC_ERRVEC)                ; D682 6C 1D C0                 l..

; ----------------------------------------------------------------------------
        txa                                     ; D685 8A                       .
        jsr     LD7DE                           ; D686 20 DE D7                  ..
        lda     $A8                             ; D689 A5 A8                    ..
        ldy     $A9                             ; D68B A4 A9                    ..
        cpy     #$FF                            ; D68D C0 FF                    ..
        bne     LD692                           ; D68F D0 01                    ..
        tya                                     ; D691 98                       .
LD692:  sta     SEDORIC_NOLIGN                  ; D692 8D FE 04                 ...
        sty     SEDORIC_NOLIGN+1                ; D695 8C FF 04                 ...
        jsr     LD7F2                           ; D698 20 F2 D7                  ..
        jsr     LD1C4                           ; D69B 20 C4 D1                  ..
        cli                                     ; D69E 58                       X
        bit     SEDORIC_FLAGERR                 ; D69F 2C 18 C0                 ,..
        bpl     LD6C9                           ; D6A2 10 25                    .%
        ldx     $C023                           ; D6A4 AE 23 C0                 .#.
        txs                                     ; D6A7 9A                       .
        lda     $C01B                           ; D6A8 AD 1B C0                 ...
        ldy     $C01C                           ; D6AB AC 1C C0                 ...
        sta     $A8                             ; D6AE 85 A8                    ..
        sty     $A9                             ; D6B0 84 A9                    ..
        lda     $C019                           ; D6B2 AD 19 C0                 ...
        ldy     $C01A                           ; D6B5 AC 1A C0                 ...
        sta     $E9                             ; D6B8 85 E9                    ..
        sty     $EA                             ; D6BA 84 EA                    ..
        lda     $C01F                           ; D6BC AD 1F C0                 ...
        ldy     $C020                           ; D6BF AC 20 C0                 . .
        sta     $C021                           ; D6C2 8D 21 C0                 .!.
        sty     $C022                           ; D6C5 8C 22 C0                 .".
        rts                                     ; D6C8 60                       `

; ----------------------------------------------------------------------------
LD6C9:  jsr     LD30A                           ; D6C9 20 0A D3                  ..
        ldx     SEDORIC_IDERROR                 ; D6CC AE FD 04                 ...
        cpx     #$04                            ; D6CF E0 04                    ..
        bne     LD706                           ; D6D1 D0 33                    .3
        ldx     #$00                            ; D6D3 A2 00                    ..
        jsr     LD36C                           ; D6D5 20 6C D3                  l.
        lda     SEDORIC_TRACK                   ; D6D8 AD 01 C0                 ...
        jsr     XAFHEX                          ; D6DB 20 13 D6                  ..
        lda     SEDORIC_TYPE_OF_ERROR           ; D6DE AD 05 C0                 ...
        and     #$F0                            ; D6E1 29 F0                    ).
        eor     #$F0                            ; D6E3 49 F0                    I.
        beq     LD6FB                           ; D6E5 F0 14                    ..
        ldx     #$01                            ; D6E7 A2 01                    ..
        jsr     LD36C                           ; D6E9 20 6C D3                  l.
        lda     SEDORIC_SECTOR                  ; D6EC AD 02 C0                 ...
        jsr     XAFHEX                          ; D6EF 20 13 D6                  ..
        ldx     #$03                            ; D6F2 A2 03                    ..
        lda     SEDORIC_TYPE_OF_ERROR           ; D6F4 AD 05 C0                 ...
        and     #$20                            ; D6F7 29 20                    ) 
        beq     LD6FD                           ; D6F9 F0 02                    ..
LD6FB:  ldx     #$02                            ; D6FB A2 02                    ..
LD6FD:  jsr     LD36C                           ; D6FD 20 6C D3                  l.
        lda     SEDORIC_IO_ERROR                ; D700 AD 17 C0                 ...
        jsr     XAFHEX                          ; D703 20 13 D6                  ..
LD706:  ldx     SEDORIC_IDERROR                 ; D706 AE FD 04                 ...
        dex                                     ; D709 CA                       .
        jsr     LD206                           ; D70A 20 06 D2                  ..
        lda     #$3F                            ; D70D A9 3F                    .?
        jsr     XAFCAR                          ; D70F 20 2A D6                  *.
        cpx     #$1A                            ; D712 E0 1A                    ..
        bcs     LD71B                           ; D714 B0 05                    ..
        jsr     LD372                           ; D716 20 72 D3                  r.
        bmi     LD73B                           ; D719 30 20                    0 
LD71B:  cpx     #$32                            ; D71B E0 32                    .2
        bcc     LD734                           ; D71D 90 15                    ..
        ldx     #$10                            ; D71F A2 10                    ..
        jsr     LD36C                           ; D721 20 6C D3                  l.
        lda     SEDORIC_IDERROR                 ; D724 AD FD 04                 ...
        ldy     #$00                            ; D727 A0 00                    ..
        sty     $C04C                           ; D729 8C 4C C0                 .L.
        ldx     #$01                            ; D72C A2 01                    ..
        jsr     LD758                           ; D72E 20 58 D7                  X.
        jmp     LD73B                           ; D731 4C 3B D7                 L;.

; ----------------------------------------------------------------------------
LD734:  txa                                     ; D734 8A                       .
        sbc     #$19                            ; D735 E9 19                    ..
        tax                                     ; D737 AA                       .
        jsr     LD35C                           ; D738 20 5C D3                  \.
LD73B:  jmp     SEDORIC_INIT_STACK_DISPLAY_ERROR_AND_GOTO_READY; D73B 4C 78 D1  Lx.

; ----------------------------------------------------------------------------
XCURON: sec                                     ; D73E 38                       8
        .byte   $24                             ; D73F 24                       $
XCUROFF:clc                                     ; D740 18                       .
        php                                     ; D741 08                       .
        lsr     BASIC11_FLG                     ; D742 4E 6A 02                 Nj.
        plp                                     ; D745 28                       (
        rol     BASIC11_FLG                     ; D746 2E 6A 02                 .j.
        lda     #$01                            ; D749 A9 01                    ..
        jmp     LD32A                           ; D74B 4C 2A D3                 L*.

; ----------------------------------------------------------------------------
LD74E:  ldx     #$00                            ; D74E A2 00                    ..
LD750:  ldy     #$00                            ; D750 A0 00                    ..
        bit     $03A2                           ; D752 2C A2 03                 ,..
        .byte   $2C                             ; D755 2C                       ,
LD756:  ldx     #$02                            ; D756 A2 02                    ..
LD758:  sta     SEDORIC_TRAV1                   ; D758 85 F3                    ..
        sty     SEDORIC_TRAV2                   ; D75A 84 F4                    ..
        lda     #$00                            ; D75C A9 00                    ..
        sta     $C073                           ; D75E 8D 73 C0                 .s.
LD761:  lda     #$FF                            ; D761 A9 FF                    ..
        sta     SEDORIC_TRAV0                   ; D763 85 F2                    ..
LD765:  inc     SEDORIC_TRAV0                   ; D765 E6 F2                    ..
        sec                                     ; D767 38                       8
        lda     SEDORIC_TRAV1                   ; D768 A5 F3                    ..
        tay                                     ; D76A A8                       .
        sbc     LCD88,x                         ; D76B FD 88 CD                 ...
        sta     SEDORIC_TRAV1                   ; D76E 85 F3                    ..
        lda     SEDORIC_TRAV2                   ; D770 A5 F4                    ..
        pha                                     ; D772 48                       H
        sbc     LCD8C,x                         ; D773 FD 8C CD                 ...
        sta     SEDORIC_TRAV2                   ; D776 85 F4                    ..
        pla                                     ; D778 68                       h
        bcs     LD765                           ; D779 B0 EA                    ..
        sty     SEDORIC_TRAV1                   ; D77B 84 F3                    ..
        sta     SEDORIC_TRAV2                   ; D77D 85 F4                    ..
        lda     SEDORIC_TRAV0                   ; D77F A5 F2                    ..
        beq     LD788                           ; D781 F0 05                    ..
        sta     $C073                           ; D783 8D 73 C0                 .s.
        bne     LD791                           ; D786 D0 09                    ..
LD788:  ldy     $C073                           ; D788 AC 73 C0                 .s.
        bne     LD791                           ; D78B D0 04                    ..
        lda     $C04C                           ; D78D AD 4C C0                 .L.
        .byte   $2C                             ; D790 2C                       ,
LD791:  ora     #$30                            ; D791 09 30                    .0
        jsr     XAFCAR                          ; D793 20 2A D6                  *.
        dex                                     ; D796 CA                       .
        bpl     LD761                           ; D797 10 C8                    ..
        lda     SEDORIC_TRAV1                   ; D799 A5 F3                    ..
        jmp     LD624                           ; D79B 4C 24 D6                 L$.

; ----------------------------------------------------------------------------
LD79E:  sec                                     ; D79E 38                       8
        .byte   $24                             ; D79F 24                       $
LD7A0:  clc                                     ; D7A0 18                       .
        ror     SEDORIC_TRAV0                   ; D7A1 66 F2                    f.
        ldx     #$0B                            ; D7A3 A2 0B                    ..
LD7A5:  lda     $C029,x                         ; D7A5 BD 29 C0                 .).
        cmp     #$3F                            ; D7A8 C9 3F                    .?
        beq     LD7B1                           ; D7AA F0 05                    ..
        dex                                     ; D7AC CA                       .
        bpl     LD7A5                           ; D7AD 10 F6                    ..
        sec                                     ; D7AF 38                       8
LD7B0:  rts                                     ; D7B0 60                       `

; ----------------------------------------------------------------------------
LD7B1:  rol     SEDORIC_TRAV0                   ; D7B1 26 F2                    &.
        bcc     LD7B0                           ; D7B3 90 FB                    ..
        ldx     #$05                            ; D7B5 A2 05                    ..
        .byte   $2C                             ; D7B7 2C                       ,
LD7B8:  ldx     #$01                            ; D7B8 A2 01                    ..
        jmp     LD67E                           ; D7BA 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LD7BD:  ldy     SEDORIC_BUFNOM                  ; D7BD AC 28 C0                 .(.
LD7C0:  sty     SEDORIC_DRIVE                   ; D7C0 8C 00 C0                 ...
        lda     SEDORIC_TABDRV,y                ; D7C3 B9 39 C0                 .9.
        beq     LD7B8                           ; D7C6 F0 F0                    ..
        rts                                     ; D7C8 60                       `

; ----------------------------------------------------------------------------
LD7C9:  ldx     #$0E                            ; D7C9 A2 0E                    ..
        .byte   $2C                             ; D7CB 2C                       ,
LD7CC:  ldx     #$10                            ; D7CC A2 10                    ..
        .byte   $2C                             ; D7CE 2C                       ,
LD7CF:  ldx     #$12                            ; D7CF A2 12                    ..
        .byte   $2C                             ; D7D1 2C                       ,
LD7D2:  ldx     #$14                            ; D7D2 A2 14                    ..
        .byte   $2C                             ; D7D4 2C                       ,
LD7D5:  ldx     #$16                            ; D7D5 A2 16                    ..
        .byte   $2C                             ; D7D7 2C                       ,
LD7D8:  ldx     #$06                            ; D7D8 A2 06                    ..
        .byte   $2C                             ; D7DA 2C                       ,
LD7DB:  ldx     #$04                            ; D7DB A2 04                    ..
        .byte   $2C                             ; D7DD 2C                       ,
LD7DE:  ldx     #$00                            ; D7DE A2 00                    ..
        .byte   $2C                             ; D7E0 2C                       ,
LD7E1:  ldx     #$0A                            ; D7E1 A2 0A                    ..
        bit     $1EA2                           ; D7E3 2C A2 1E                 ,..
        .byte   $2C                             ; D7E6 2C                       ,
LD7E7:  ldx     #$20                            ; D7E7 A2 20                    . 
        .byte   $2C                             ; D7E9 2C                       ,
LD7EA:  ldx     #$22                            ; D7EA A2 22                    ."
        .byte   $2C                             ; D7EC 2C                       ,
LD7ED:  ldx     #$24                            ; D7ED A2 24                    .$
        ldy     #$00                            ; D7EF A0 00                    ..
        .byte   $2C                             ; D7F1 2C                       ,
LD7F2:  ldx     #$02                            ; D7F2 A2 02                    ..
        bit     $08A2                           ; D7F4 2C A2 08                 ,..
        .byte   $2C                             ; D7F7 2C                       ,
LD7F8:  ldx     #$18                            ; D7F8 A2 18                    ..
        .byte   $2C                             ; D7FA 2C                       ,
LD7FB:  ldx     #$1A                            ; D7FB A2 1A                    ..
        .byte   $2C                             ; D7FD 2C                       ,
LD7FE:  ldx     #$1C                            ; D7FE A2 1C                    ..
        nop                                     ; D800 EA                       .
        nop                                     ; D801 EA                       .
        nop                                     ; D802 EA                       .
        sta     SEDORIC_TRAV0                   ; D803 85 F2                    ..
        lda     SYS_VAR_NAMES,x                 ; D805 BD 94 CD                 ...
        sta     $B4                             ; D808 85 B4                    ..
        lda     LCD95,x                         ; D80A BD 95 CD                 ...
        sta     $B5                             ; D80D 85 B5                    ..
        tya                                     ; D80F 98                       .
        ldy     SEDORIC_TRAV0                   ; D810 A4 F2                    ..
        jsr     LD2CA                           ; D812 20 CA D2                  ..
        jsr     LD244                           ; D815 20 44 D2                  D.
        tax                                     ; D818 AA                       .
        jmp     LD2C2                           ; D819 4C C2 D2                 L..

; ----------------------------------------------------------------------------
LD81C:  inc     $16                             ; D81C E6 16                    ..
        bne     LD822                           ; D81E D0 02                    ..
        inc     $17                             ; D820 E6 17                    ..
LD822:  ldy     #$00                            ; D822 A0 00                    ..
        bit     SEDORIC_COMMAND_TYPE_LAUNCHED   ; D824 2C 48 C0                 ,H.
        bvc     LD82C                           ; D827 50 03                    P.
        jmp     DO_EXEVEC                       ; D829 4C 53 04                 LS.

; ----------------------------------------------------------------------------
LD82C:  lda     ($16),y                         ; D82C B1 16                    ..
        beq     LD86F                           ; D82E F0 3F                    .?
        bpl     LD871                           ; D830 10 3F                    .?
        bit     SEDORIC_COMMAND_TYPE_LAUNCHED   ; D832 2C 48 C0                 ,H.
        bpl     LD86F                           ; D835 10 38                    .8
        and     #$7F                            ; D837 29 7F                    ).
        rts                                     ; D839 60                       `

; ----------------------------------------------------------------------------
LD83A:  jsr     LEA1E                           ; D83A 20 1E EA                  ..
        lda     #$08                            ; D83D A9 08                    ..
        and     V1DRB                           ; D83F 2D 00 03                 -..
        rts                                     ; D842 60                       `

; ----------------------------------------------------------------------------
LD843:  sec                                     ; D843 38                       8
        .byte   $24                             ; D844 24                       $
LD845:  clc                                     ; D845 18                       .
        ror     $C04A                           ; D846 6E 4A C0                 nJ.
        jsr     SEDORIC_KEYBOARD_WAIT           ; D849 20 02 D3                  ..
        php                                     ; D84C 08                       .
        sta     $C046                           ; D84D 8D 46 C0                 .F.
        stx     $C047                           ; D850 8E 47 C0                 .G.
        bit     $C049                           ; D853 2C 49 C0                 ,I.
        bpl     LD872                           ; D856 10 1A                    ..
        bit     $C04A                           ; D858 2C 4A C0                 ,J.
        bmi     LD864                           ; D85B 30 07                    0.
        cpx     #$4E                            ; D85D E0 4E                    .N
        bcc     LD864                           ; D85F 90 03                    ..
        lsr     $C049                           ; D861 4E 49 C0                 NI.
LD864:  jsr     LD81C                           ; D864 20 1C D8                  ..
        bpl     LD86C                           ; D867 10 03                    ..
        lsr     $C049                           ; D869 4E 49 C0                 NI.
LD86C:  and     #$7F                            ; D86C 29 7F                    ).
        plp                                     ; D86E 28                       (
LD86F:  bit     $E2                             ; D86F 24 E2                    $.
LD871:  rts                                     ; D871 60                       `

; ----------------------------------------------------------------------------
LD872:  plp                                     ; D872 28                       (
        bpl     LD871                           ; D873 10 FC                    ..
        lda     #$00                            ; D875 A9 00                    ..
        sta     $C04B                           ; D877 8D 4B C0                 .K.
        sta     SEDORIC_COMMAND_TYPE_LAUNCHED   ; D87A 8D 48 C0                 .H.
        lda     #$0E                            ; D87D A9 0E                    ..
        ldx     #$EF                            ; D87F A2 EF                    ..
        jsr     LD322                           ; D881 20 22 D3                  ".
        lda     #$15                            ; D884 A9 15                    ..
        jsr     LD83A                           ; D886 20 3A D8                  :.
        bne     LD8C3                           ; D889 D0 38                    .8
        lda     $C046                           ; D88B AD 46 C0                 .F.
        ldx     $C047                           ; D88E AE 47 C0                 .G.
        bit     SEDORIC_MODCLA                  ; D891 2C 3D C0                 ,=.
        bpl     LD86F                           ; D894 10 D9                    ..
        lda     BASIC11_KEYBOARD_MATRIX         ; D896 AD 08 02                 ...
        ldx     #$05                            ; D899 A2 05                    ..
LD89B:  cmp     QWAZERTY_CONV,x                 ; D89B DD 41 CD                 .A.
        beq     LD8AC                           ; D89E F0 0C                    ..
        dex                                     ; D8A0 CA                       .
        bpl     LD89B                           ; D8A1 10 F8                    ..
        lda     $C046                           ; D8A3 AD 46 C0                 .F.
LD8A6:  ldx     LEA47                           ; D8A6 AE 47 EA                 .G.
        jmp     LD86F                           ; D8A9 4C 6F D8                 Lo.

; ----------------------------------------------------------------------------
LD8AC:  lda     BASIC11_KEYBOARD_MATRIX         ; D8AC AD 08 02                 ...
        pha                                     ; D8AF 48                       H
        lda     LCD47,x                         ; D8B0 BD 47 CD                 .G.
        sta     BASIC11_KEYBOARD_MATRIX         ; D8B3 8D 08 02                 ...
        jsr     LD31A                           ; D8B6 20 1A D3                  ..
        tax                                     ; D8B9 AA                       .
        pla                                     ; D8BA 68                       h
        sta     BASIC11_KEYBOARD_MATRIX         ; D8BB 8D 08 02                 ...
        txa                                     ; D8BE 8A                       .
        and     #$7F                            ; D8BF 29 7F                    ).
        bpl     LD8A6                           ; D8C1 10 E3                    ..
LD8C3:  lda     #$17                            ; D8C3 A9 17                    ..
        jsr     LD83A                           ; D8C5 20 3A D8                  :.
        bne     LD8D1                           ; D8C8 D0 07                    ..
        lda     #$14                            ; D8CA A9 14                    ..
        jsr     LD83A                           ; D8CC 20 3A D8                  :.
        beq     LD8D3                           ; D8CF F0 02                    ..
LD8D1:  lda     #$40                            ; D8D1 A9 40                    .@
LD8D3:  ora     BASIC11_KEYBOARD_MATRIX         ; D8D3 0D 08 02                 ...
        and     #$7F                            ; D8D6 29 7F                    ).
        tax                                     ; D8D8 AA                       .
        lda     KEYDEF,x                        ; D8D9 BD 00 C8                 ...
        tay                                     ; D8DC A8                       .
        iny                                     ; D8DD C8                       .
        bne     LD8E3                           ; D8DE D0 03                    ..
        jmp     LD963                           ; D8E0 4C 63 D9                 Lc.

; ----------------------------------------------------------------------------
LD8E3:  iny                                     ; D8E3 C8                       .
        beq     LD952                           ; D8E4 F0 6C                    .l
        cmp     #$20                            ; D8E6 C9 20                    . 
        ror     a                               ; D8E8 6A                       j
        sta     SEDORIC_COMMAND_TYPE_LAUNCHED   ; D8E9 8D 48 C0                 .H.
        rol     a                               ; D8EC 2A                       *
        bmi     LD8F3                           ; D8ED 30 04                    0.
        bcc     LD8F3                           ; D8EF 90 02                    ..
        sbc     #$20                            ; D8F1 E9 20                    . 
LD8F3:  and     #$7F                            ; D8F3 29 7F                    ).
        tax                                     ; D8F5 AA                       .
        lda     #$E9                            ; D8F6 A9 E9                    ..
        ldy     #$C0                            ; D8F8 A0 C0                    ..
        bit     SEDORIC_COMMAND_TYPE_LAUNCHED   ; D8FA 2C 48 C0                 ,H.
        bvs     LD928                           ; D8FD 70 29                    p)
        bmi     LD907                           ; D8FF 30 06                    0.
        lda     #$7F                            ; D901 A9 7F                    ..
        ldy     #$C8                            ; D903 A0 C8                    ..
        bne     LD928                           ; D905 D0 21                    .!
LD907:  lda     SEDORIC_TRAV0                   ; D907 A5 F2                    ..
        pha                                     ; D909 48                       H
        jsr     LEA30                           ; D90A 20 30 EA                  0.
        ldy     #$00                            ; D90D A0 00                    ..
LD90F:  lda     LCBBD,y                         ; D90F B9 BD CB                 ...
        inx                                     ; D912 E8                       .
        iny                                     ; D913 C8                       .
        iny                                     ; D914 C8                       .
        iny                                     ; D915 C8                       .
        iny                                     ; D916 C8                       .
        cmp     SEDORIC_TRAV0                   ; D917 C5 F2                    ..
        bcc     LD90F                           ; D919 90 F4                    ..
        stx     $C04B                           ; D91B 8E 4B C0                 .K.
        ldx     SEDORIC_TRAV0                   ; D91E A6 F2                    ..
        dex                                     ; D920 CA                       .
        pla                                     ; D921 68                       h
        sta     SEDORIC_TRAV0                   ; D922 85 F2                    ..
        lda     #$DD                            ; D924 A9 DD                    ..
        ldy     #$C9                            ; D926 A0 C9                    ..
LD928:  sta     $16                             ; D928 85 16                    ..
        sty     $17                             ; D92A 84 17                    ..
LD92C:  dex                                     ; D92C CA                       .
        bmi     LD936                           ; D92D 30 07                    0.
LD92F:  jsr     LD81C                           ; D92F 20 1C D8                  ..
        bpl     LD92F                           ; D932 10 FB                    ..
        bmi     LD92C                           ; D934 30 F6                    0.
LD936:  jsr     LD81C                           ; D936 20 1C D8                  ..
        cmp     #$20                            ; D939 C9 20                    . 
        beq     LD936                           ; D93B F0 F9                    ..
        lda     $16                             ; D93D A5 16                    ..
        bne     LD943                           ; D93F D0 02                    ..
        dec     $17                             ; D941 C6 17                    ..
LD943:  dec     $16                             ; D943 C6 16                    ..
        lda     $C04B                           ; D945 AD 4B C0                 .K.
LD948:  sec                                     ; D948 38                       8
        ror     $C049                           ; D949 6E 49 C0                 nI.
LD94C:  ldx     $C047                           ; D94C AE 47 C0                 .G.
LD94F:  jmp     LD86F                           ; D94F 4C 6F D8                 Lo.

; ----------------------------------------------------------------------------
LD952:  lda     #$7F                            ; D952 A9 7F                    ..
        bit     $C04A                           ; D954 2C 4A C0                 ,J.
        bmi     LD94C                           ; D957 30 F3                    0.
        ldx     $C047                           ; D959 AE 47 C0                 .G.
        beq     LD94C                           ; D95C F0 EE                    ..
        dex                                     ; D95E CA                       .
        lda     #$08                            ; D95F A9 08                    ..
        bne     LD94F                           ; D961 D0 EC                    ..
LD963:  ldy     $C042                           ; D963 AC 42 C0                 .B.
        lda     $C043                           ; D966 AD 43 C0                 .C.
        jsr     LD2CA                           ; D969 20 CA D2                  ..
        jsr     LD2D2                           ; D96C 20 D2 D2                  ..
        ldx     #$00                            ; D96F A2 00                    ..
        stx     $17                             ; D971 86 17                    ..
        dex                                     ; D973 CA                       .
        stx     $16                             ; D974 86 16                    ..
LD976:  inx                                     ; D976 E8                       .
        lda     STACK+1,x                       ; D977 BD 01 01                 ...
        bne     LD976                           ; D97A D0 FA                    ..
        sta     STACK+2,x                       ; D97C 9D 02 01                 ...
        txa                                     ; D97F 8A                       .
        pha                                     ; D980 48                       H
        lda     $C042                           ; D981 AD 42 C0                 .B.
        ldy     $C043                           ; D984 AC 43 C0                 .C.
        sta     $33                             ; D987 85 33                    .3
        sty     $34                             ; D989 84 34                    .4
        jsr     LD19C                           ; D98B 20 9C D1                  ..
        pla                                     ; D98E 68                       h
        tax                                     ; D98F AA                       .
        lda     #$20                            ; D990 A9 20                    . 
        bcc     LD996                           ; D992 90 02                    ..
        lda     #$2A                            ; D994 A9 2A                    .*
LD996:  sta     STACK+1,x                       ; D996 9D 01 01                 ...
        clc                                     ; D999 18                       .
        lda     $C044                           ; D99A AD 44 C0                 .D.
        adc     $C042                           ; D99D 6D 42 C0                 mB.
        sta     $C042                           ; D9A0 8D 42 C0                 .B.
        lda     $C045                           ; D9A3 AD 45 C0                 .E.
        adc     $C043                           ; D9A6 6D 43 C0                 mC.
        sta     $C043                           ; D9A9 8D 43 C0                 .C.
        lda     #$0D                            ; D9AC A9 0D                    ..
        bne     LD948                           ; D9AE D0 98                    ..
LD9B0:  lda     #$00                            ; D9B0 A9 00                    ..
        sta     LE7D1                           ; D9B2 8D D1 E7                 ...
        sta     LE7D2                           ; D9B5 8D D2 E7                 ...
        sta     LE7D3                           ; D9B8 8D D3 E7                 ...
        jsr     LE55C                           ; D9BB 20 5C E5                  \.
LD9BE:  jsr     LDA63                           ; D9BE 20 63 DA                  c.
        ldx     #$10                            ; D9C1 A2 10                    ..
        cpx     SEDORIC_BUF3+2                  ; D9C3 EC 02 C3                 ...
        beq     LD9EC                           ; D9C6 F0 24                    .$
        lda     SEDORIC_BUF3+2                  ; D9C8 AD 02 C3                 ...
        sec                                     ; D9CB 38                       8
        sbc     #$10                            ; D9CC E9 10                    ..
        lsr     a                               ; D9CE 4A                       J
        lsr     a                               ; D9CF 4A                       J
        lsr     a                               ; D9D0 4A                       J
        lsr     a                               ; D9D1 4A                       J
        clc                                     ; D9D2 18                       .
        adc     LE7D1                           ; D9D3 6D D1 E7                 m..
        bcc     LD9DB                           ; D9D6 90 03                    ..
        inc     LE7D2                           ; D9D8 EE D2 E7                 ...
LD9DB:  sta     LE7D1                           ; D9DB 8D D1 E7                 ...
        inc     LE7D3                           ; D9DE EE D3 E7                 ...
        .byte   $AD                             ; D9E1 AD                       .
LD9E2:  brk                                     ; D9E2 00                       .
        .byte   $C3                             ; D9E3 C3                       .
        ldy     SEDORIC_BUF3+1                  ; D9E4 AC 01 C3                 ...
        beq     LD9EC                           ; D9E7 F0 03                    ..
        jmp     LD9BE                           ; D9E9 4C BE D9                 L..

; ----------------------------------------------------------------------------
LD9EC:  jsr     LDB2D                           ; D9EC 20 2D DB                  -.
        rts                                     ; D9EF 60                       `

; ----------------------------------------------------------------------------
        lda     LE7D3                           ; D9F0 AD D3 E7                 ...
        sta     SEDORIC_BUF2+8                  ; D9F3 8D 08 C2                 ...
        lda     LE7D1                           ; D9F6 AD D1 E7                 ...
        ldx     LE7D2                           ; D9F9 AE D2 E7                 ...
        rts                                     ; D9FC 60                       `

; ----------------------------------------------------------------------------
        dec     SEDORIC_BUF2+8                  ; D9FD CE 08 C2                 ...
        dec     LE7D3                           ; DA00 CE D3 E7                 ...
        rts                                     ; DA03 60                       `

; ----------------------------------------------------------------------------
        lda     LE7D4                           ; DA04 AD D4 E7                 ...
        bne     LDA16                           ; DA07 D0 0D                    ..
        lda     LE7D3                           ; DA09 AD D3 E7                 ...
        sta     SEDORIC_BUF2+8                  ; DA0C 8D 08 C2                 ...
        lda     LE7D1                           ; DA0F AD D1 E7                 ...
        ldx     LE7D2                           ; DA12 AE D2 E7                 ...
        rts                                     ; DA15 60                       `

; ----------------------------------------------------------------------------
LDA16:  lda     SEDORIC_BUF2+4                  ; DA16 AD 04 C2                 ...
        ldx     SEDORIC_BUF2+5                  ; DA19 AE 05 C2                 ...
        rts                                     ; DA1C 60                       `

; ----------------------------------------------------------------------------
        nop                                     ; DA1D EA                       .
        nop                                     ; DA1E EA                       .
LDA1F:  nop                                     ; DA1F EA                       .
        jsr     LD27F                           ; DA20 20 7F D2                  ..
        php                                     ; DA23 08                       .
        sei                                     ; DA24 78                       x
        txa                                     ; DA25 8A                       .
        pha                                     ; DA26 48                       H
        lsr     a                               ; DA27 4A                       J
        lsr     a                               ; DA28 4A                       J
        lsr     a                               ; DA29 4A                       J
        and     #$07                            ; DA2A 29 07                    ).
        tax                                     ; DA2C AA                       .
        clc                                     ; DA2D 18                       .
        lda     #$FF                            ; DA2E A9 FF                    ..
LDA30:  rol     a                               ; DA30 2A                       *
        dex                                     ; DA31 CA                       .
        bpl     LDA30                           ; DA32 10 FC                    ..
        tax                                     ; DA34 AA                       .
        lda     #$0E                            ; DA35 A9 0E                    ..
        jsr     LD322                           ; DA37 20 22 D3                  ".
        pla                                     ; DA3A 68                       h
        and     #$07                            ; DA3B 29 07                    ).
        ora     #$B8                            ; DA3D 09 B8                    ..
        jsr     LD83A                           ; DA3F 20 3A D8                  :.
        sta     $D0                             ; DA42 85 D0                    ..
        plp                                     ; DA44 28                       (
        jsr     LD1EB                           ; DA45 20 EB D1                  ..
        lsr     SEDORIC_FLAGIF                  ; DA48 4E FC 04                 N..
        rts                                     ; DA4B 60                       `

; ----------------------------------------------------------------------------
XPMAP:  jsr     LE62E                           ; DA4C 20 2E E6                  ..
        nop                                     ; DA4F EA                       .
LDA50:  jsr     LDA60                           ; DA50 20 60 DA                  `.
        ldx     SEDORIC_BUF2                    ; DA53 AE 00 C2                 ...
        inx                                     ; DA56 E8                       .
        beq     LDACD                           ; DA57 F0 74                    .t
        ldx     #$0A                            ; DA59 A2 0A                    ..
        bne     LDA7F                           ; DA5B D0 22                    ."
; $DA5D
READ_SECTOR_TRACK:
        ldx     #$C1                            ; DA5D A2 C1                    ..
LDA60           := * + 1
        bit     SEDORIC_BUF2+162                ; DA5F 2C A2 C2                 ,..
LDA63           := * + 1
        bit     SEDORIC_BUF3+162                ; DA62 2C A2 C3                 ,..
        stx     SEDORIC_RWBUF+1                 ; DA65 8E 04 C0                 ...
        ldx     #$00                            ; DA68 A2 00                    ..
        stx     SEDORIC_RWBUF                   ; DA6A 8E 03 C0                 ...
LDA6D:  sta     SEDORIC_TRACK                   ; DA6D 8D 01 C0                 ...
        sty     SEDORIC_SECTOR                  ; DA70 8C 02 C0                 ...
XPRSEC: ldx     #$88                            ; DA73 A2 88                    ..
LDA75:  jsr     XRWTS                           ; DA75 20 CD CF                  ..
        beq     LDACD                           ; DA78 F0 53                    .S
        ldx     #$03                            ; DA7A A2 03                    ..
        bvc     LDA7F                           ; DA7C 50 01                    P.
        inx                                     ; DA7E E8                       .
LDA7F:  jmp     LD67E                           ; DA7F 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
XSCAT:  lda     $C025                           ; DA82 AD 25 C0                 .%.
        ldy     $C026                           ; DA85 AC 26 C0                 .&.
        bne     LDA94                           ; DA88 D0 0A                    ..
XSMAP:  jmp     LDC80                           ; DA8A 4C 80 DC                 L..

; ----------------------------------------------------------------------------
        nop                                     ; DA8D EA                       .
LDA8E:  ldx     #$C2                            ; DA8E A2 C2                    ..
        .byte   $2C                             ; DA90 2C                       ,
LDA91:  ldx     #$C1                            ; DA91 A2 C1                    ..
        .byte   $2C                             ; DA93 2C                       ,
LDA94:  ldx     #$C3                            ; DA94 A2 C3                    ..
        stx     SEDORIC_RWBUF+1                 ; DA96 8E 04 C0                 ...
        ldx     #$00                            ; DA99 A2 00                    ..
        stx     SEDORIC_RWBUF                   ; DA9B 8E 03 C0                 ...
LDA9E:  sta     SEDORIC_TRACK                   ; DA9E 8D 01 C0                 ...
        sty     SEDORIC_SECTOR                  ; DAA1 8C 02 C0                 ...
XSVSEC: ldx     #$A8                            ; DAA4 A2 A8                    ..
        bne     LDA75                           ; DAA6 D0 CD                    ..
LDAA8:  lda     #$00                            ; DAA8 A9 00                    ..
        ldy     #$C1                            ; DAAA A0 C1                    ..
        sta     SEDORIC_RWBUF                   ; DAAC 8D 03 C0                 ...
        sty     SEDORIC_RWBUF+1                 ; DAAF 8C 04 C0                 ...
        bne     XSVSEC                          ; DAB2 D0 F0                    ..
LDAB4:  ldx     $C027                           ; DAB4 AE 27 C0                 .'.
        ldy     #$08                            ; DAB7 A0 08                    ..
        jsr     LDAC3                           ; DAB9 20 C3 DA                  ..
        lda     #$2E                            ; DABC A9 2E                    ..
        jsr     XAFCAR                          ; DABE 20 2A D6                  *.
        ldy     #$02                            ; DAC1 A0 02                    ..
LDAC3:  lda     SEDORIC_BUF3,x                  ; DAC3 BD 00 C3                 ...
        jsr     XAFCAR                          ; DAC6 20 2A D6                  *.
        inx                                     ; DAC9 E8                       .
        dey                                     ; DACA 88                       .
        bpl     LDAC3                           ; DACB 10 F6                    ..
LDACD:  rts                                     ; DACD 60                       `

; ----------------------------------------------------------------------------
LDACE:  lda     #$C1                            ; DACE A9 C1                    ..
        bit     SEDORIC_BUF2+169                ; DAD0 2C A9 C2                 ,..
        .byte   $2C                             ; DAD3 2C                       ,
LDAD4:  lda     #$C3                            ; DAD4 A9 C3                    ..
        sta     $0F                             ; DAD6 85 0F                    ..
        lda     #$00                            ; DAD8 A9 00                    ..
        sta     $0E                             ; DADA 85 0E                    ..
        ldy     #$00                            ; DADC A0 00                    ..
        tya                                     ; DADE 98                       .
LDADF:  sta     ($0E),y                         ; DADF 91 0E                    ..
        iny                                     ; DAE1 C8                       .
        bne     LDADF                           ; DAE2 D0 FB                    ..
        rts                                     ; DAE4 60                       `

; ----------------------------------------------------------------------------
        lda     $C025                           ; DAE5 AD 25 C0                 .%.
        ldy     $C026                           ; DAE8 AC 26 C0                 .&.
        jsr     LDA63                           ; DAEB 20 63 DA                  c.
LDAEE:  ldx     $C027                           ; DAEE AE 27 C0                 .'.
        ldy     #$F0                            ; DAF1 A0 F0                    ..
LDAF3:  lda     $BF39,y                         ; DAF3 B9 39 BF                 .9.
        sta     SEDORIC_BUF3,x                  ; DAF6 9D 00 C3                 ...
        inx                                     ; DAF9 E8                       .
        iny                                     ; DAFA C8                       .
        bne     LDAF3                           ; DAFB D0 F6                    ..
        rts                                     ; DAFD 60                       `

; ----------------------------------------------------------------------------
LDAFE:  lda     $C025                           ; DAFE AD 25 C0                 .%.
        ldy     $C026                           ; DB01 AC 26 C0                 .&.
        jsr     LDA63                           ; DB04 20 63 DA                  c.
LDB07:  ldx     $C027                           ; DB07 AE 27 C0                 .'.
        ldy     #$F0                            ; DB0A A0 F0                    ..
LDB0C:  lda     SEDORIC_BUF3,x                  ; DB0C BD 00 C3                 ...
        sta     $BF39,y                         ; DB0F 99 39 BF                 .9.
        inx                                     ; DB12 E8                       .
        iny                                     ; DB13 C8                       .
        bne     LDB0C                           ; DB14 D0 F6                    ..
        rts                                     ; DB16 60                       `

; ----------------------------------------------------------------------------
LDB17:  ldy     #$F4                            ; DB17 A0 F4                    ..
LDB19:  lda     $BF35,y                         ; DB19 B9 35 BF                 .5.
        cmp     #$3F                            ; DB1C C9 3F                    .?
        beq     LDB25                           ; DB1E F0 05                    ..
        cmp     SEDORIC_BUF3,x                  ; DB20 DD 00 C3                 ...
        bne     LDB41                           ; DB23 D0 1C                    ..
LDB25:  inx                                     ; DB25 E8                       .
        iny                                     ; DB26 C8                       .
        bne     LDB19                           ; DB27 D0 F0                    ..
        ldx     $C027                           ; DB29 AE 27 C0                 .'.
        rts                                     ; DB2C 60                       `

; ----------------------------------------------------------------------------
LDB2D:  jsr     XPMAP                           ; DB2D 20 4C DA                  L.
XTVNM:  jsr     CMD_REN                         ; DB30 20 37 E5                  7.
        nop                                     ; DB33 EA                       .
LDB34:  sta     $C025                           ; DB34 8D 25 C0                 .%.
        sty     $C026                           ; DB37 8C 26 C0                 .&.
        jsr     LDA63                           ; DB3A 20 63 DA                  c.
        ldx     #$10                            ; DB3D A2 10                    ..
        bne     LDB48                           ; DB3F D0 07                    ..
LDB41:  lda     $C027                           ; DB41 AD 27 C0                 .'.
        clc                                     ; DB44 18                       .
        adc     #$10                            ; DB45 69 10                    i.
        tax                                     ; DB47 AA                       .
LDB48:  stx     $C027                           ; DB48 8E 27 C0                 .'.
        cpx     SEDORIC_BUF3+2                  ; DB4B EC 02 C3                 ...
        bne     LDB17                           ; DB4E D0 C7                    ..
        lda     SEDORIC_BUF3                    ; DB50 AD 00 C3                 ...
        ldy     SEDORIC_BUF3+1                  ; DB53 AC 01 C3                 ...
        bne     LDB34                           ; DB56 D0 DC                    ..
        rts                                     ; DB58 60                       `

; ----------------------------------------------------------------------------
XTRVCA: jsr     LDBA5                           ; DB59 20 A5 DB                  ..
        bne     LDB92                           ; DB5C D0 34                    .4
        jmp     LDB6F                           ; DB5E 4C 6F DB                 Lo.

; ----------------------------------------------------------------------------
        dec     SEDORIC_BUF2+8                  ; DB61 CE 08 C2                 ...
        dec     LE7D3                           ; DB64 CE D3 E7                 ...
        rts                                     ; DB67 60                       `

; ----------------------------------------------------------------------------
        .byte   $C2                             ; DB68 C2                       .
        sta     SEDORIC_BUF2+8                  ; DB69 8D 08 C2                 ...
        jmp     CMD_REN                         ; DB6C 4C 37 E5                 L7.

; ----------------------------------------------------------------------------
LDB6F:  jsr     XLIBSE                          ; DB6F 20 6C DC                  l.
        sta     SEDORIC_BUF3                    ; DB72 8D 00 C3                 ...
        sty     SEDORIC_BUF3+1                  ; DB75 8C 01 C3                 ...
        inc     SEDORIC_BUF2+8                  ; DB78 EE 08 C2                 ...
        jsr     XSMAP                           ; DB7B 20 8A DA                  ..
        jsr     XSCAT                           ; DB7E 20 82 DA                  ..
        lda     SEDORIC_BUF3                    ; DB81 AD 00 C3                 ...
        ldy     SEDORIC_BUF3+1                  ; DB84 AC 01 C3                 ...
        sta     $C025                           ; DB87 8D 25 C0                 .%.
        sty     $C026                           ; DB8A 8C 26 C0                 .&.
        jsr     LDAD4                           ; DB8D 20 D4 DA                  ..
        ldx     #$10                            ; DB90 A2 10                    ..
LDB92:  txa                                     ; DB92 8A                       .
        stx     $C027                           ; DB93 8E 27 C0                 .'.
        clc                                     ; DB96 18                       .
        adc     #$10                            ; DB97 69 10                    i.
        sta     SEDORIC_BUF3+2                  ; DB99 8D 02 C3                 ...
        inc     SEDORIC_BUF2+4                  ; DB9C EE 04 C2                 ...
        bne     LDBBF                           ; DB9F D0 1E                    ..
        inc     SEDORIC_BUF2+5                  ; DBA1 EE 05 C2                 ...
        rts                                     ; DBA4 60                       `

; ----------------------------------------------------------------------------
LDBA5:  jsr     CMD_REN                         ; DBA5 20 37 E5                  7.
        nop                                     ; DBA8 EA                       .
LDBA9:  sta     $C025                           ; DBA9 8D 25 C0                 .%.
        sty     $C026                           ; DBAC 8C 26 C0                 .&.
        jsr     LDA63                           ; DBAF 20 63 DA                  c.
        ldx     SEDORIC_BUF3+2                  ; DBB2 AE 02 C3                 ...
        bne     LDBBF                           ; DBB5 D0 08                    ..
        lda     SEDORIC_BUF3                    ; DBB7 AD 00 C3                 ...
        ldy     SEDORIC_BUF3+1                  ; DBBA AC 01 C3                 ...
        bne     LDBA9                           ; DBBD D0 EA                    ..
LDBBF:  rts                                     ; DBBF 60                       `

; ----------------------------------------------------------------------------
XWDESC: sta     $C058                           ; DBC0 8D 58 C0                 .X.
        sty     $C059                           ; DBC3 8C 59 C0                 .Y.
        sta     $C05A                           ; DBC6 8D 5A C0                 .Z.
        sty     $C05B                           ; DBC9 8C 5B C0                 .[.
        jsr     LDACE                           ; DBCC 20 CE DA                  ..
        ldx     #$01                            ; DBCF A2 01                    ..
        stx     $C05E                           ; DBD1 8E 5E C0                 .^.
        jsr     XLIBSE                          ; DBD4 20 6C DC                  l.
        sta     $C05C                           ; DBD7 8D 5C C0                 .\.
        sty     $C05D                           ; DBDA 8C 5D C0                 .].
        sta     SEDORIC_TRACK                   ; DBDD 8D 01 C0                 ...
        sty     SEDORIC_SECTOR                  ; DBE0 8C 02 C0                 ...
        ldx     #$08                            ; DBE3 A2 08                    ..
LDBE5:  lda     $C051,x                         ; DBE5 BD 51 C0                 .Q.
        sta     SEDORIC_BUF1+3,x                ; DBE8 9D 03 C1                 ...
        dex                                     ; DBEB CA                       .
        bpl     LDBE5                           ; DBEC 10 F7                    ..
        stx     SEDORIC_BUF1+2                  ; DBEE 8E 02 C1                 ...
        ldx     #$0C                            ; DBF1 A2 0C                    ..
LDBF3:  stx     $C05F                           ; DBF3 8E 5F C0                 ._.
        lda     $C058                           ; DBF6 AD 58 C0                 .X.
        ora     $C059                           ; DBF9 0D 59 C0                 .Y.
        beq     LDC56                           ; DBFC F0 58                    .X
        lda     $C058                           ; DBFE AD 58 C0                 .X.
        bne     LDC06                           ; DC01 D0 03                    ..
        dec     $C059                           ; DC03 CE 59 C0                 .Y.
LDC06:  dec     $C058                           ; DC06 CE 58 C0                 .X.
        jsr     XLIBSE                          ; DC09 20 6C DC                  l.
        ldx     $C05F                           ; DC0C AE 5F C0                 ._.
        sta     SEDORIC_BUF1,x                  ; DC0F 9D 00 C1                 ...
        inx                                     ; DC12 E8                       .
        tya                                     ; DC13 98                       .
        sta     SEDORIC_BUF1,x                  ; DC14 9D 00 C1                 ...
        inx                                     ; DC17 E8                       .
        bne     LDBF3                           ; DC18 D0 D9                    ..
        lda     $C058                           ; DC1A AD 58 C0                 .X.
        ora     $C059                           ; DC1D 0D 59 C0                 .Y.
        beq     LDC56                           ; DC20 F0 34                    .4
        ldy     SEDORIC_BUF1+1                  ; DC22 AC 01 C1                 ...
        bne     LDC43                           ; DC25 D0 1C                    ..
        jsr     XLIBSE                          ; DC27 20 6C DC                  l.
        sta     SEDORIC_BUF1                    ; DC2A 8D 00 C1                 ...
        pha                                     ; DC2D 48                       H
        sty     SEDORIC_BUF1+1                  ; DC2E 8C 01 C1                 ...
        tya                                     ; DC31 98                       .
        pha                                     ; DC32 48                       H
        jsr     LDAA8                           ; DC33 20 A8 DA                  ..
        pla                                     ; DC36 68                       h
        sta     SEDORIC_SECTOR                  ; DC37 8D 02 C0                 ...
        pla                                     ; DC3A 68                       h
        sta     SEDORIC_TRACK                   ; DC3B 8D 01 C0                 ...
        inc     $C05E                           ; DC3E EE 5E C0                 .^.
        bne     LDC4F                           ; DC41 D0 0C                    ..
LDC43:  jsr     LDAA8                           ; DC43 20 A8 DA                  ..
        lda     SEDORIC_BUF1                    ; DC46 AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; DC49 AC 01 C1                 ...
        jsr     READ_SECTOR_TRACK               ; DC4C 20 5D DA                  ].
LDC4F:  jsr     LDACE                           ; DC4F 20 CE DA                  ..
        ldx     #$02                            ; DC52 A2 02                    ..
        bne     LDBF3                           ; DC54 D0 9D                    ..
LDC56:  lda     #$00                            ; DC56 A9 00                    ..
        sta     SEDORIC_BUF1                    ; DC58 8D 00 C1                 ...
        sta     SEDORIC_BUF1+1                  ; DC5B 8D 01 C1                 ...
        jsr     LDAA8                           ; DC5E 20 A8 DA                  ..
        lda     $C05C                           ; DC61 AD 5C C0                 .\.
        ldy     $C05D                           ; DC64 AC 5D C0                 .].
        jmp     READ_SECTOR_TRACK               ; DC67 4C 5D DA                 L].

; ----------------------------------------------------------------------------
        clc                                     ; DC6A 18                       .
        .byte   $24                             ; DC6B 24                       $
XLIBSE: sec                                     ; DC6C 38                       8
        lda     SEDORIC_BUF2+2                  ; DC6D AD 02 C2                 ...
        tax                                     ; DC70 AA                       .
        ora     SEDORIC_BUF2+3                  ; DC71 0D 03 C2                 ...
        bne     LDC7D                           ; DC74 D0 07                    ..
        bcc     LDCD4                           ; DC76 90 5C                    .\
LDC78:  ldx     #$07                            ; DC78 A2 07                    ..
        jmp     LD67E                           ; DC7A 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LDC7D:  jmp     LE67F                           ; DC7D 4C 7F E6                 L..

; ----------------------------------------------------------------------------
LDC80:  bit     $2F                             ; DC80 24 2F                    $/
        bpl     LDC89                           ; DC82 10 05                    ..
        php                                     ; DC84 08                       .
        jsr     LE63A                           ; DC85 20 3A E6                  :.
        plp                                     ; DC88 28                       (
LDC89:  ldy     #$02                            ; DC89 A0 02                    ..
LDC8B:  lda     #$14                            ; DC8B A9 14                    ..
        jmp     LDA8E                           ; DC8D 4C 8E DA                 L..

; ----------------------------------------------------------------------------
LDC90:  lda     #$01                            ; DC90 A9 01                    ..
        ldy     #$00                            ; DC92 A0 00                    ..
LDC94:  pha                                     ; DC94 48                       H
        and     SEDORIC_BUF2+16,x               ; DC95 3D 10 C2                 =..
        bne     LDC9F                           ; DC98 D0 05                    ..
        pla                                     ; DC9A 68                       h
        asl     a                               ; DC9B 0A                       .
        iny                                     ; DC9C C8                       .
        bne     LDC94                           ; DC9D D0 F5                    ..
LDC9F:  pla                                     ; DC9F 68                       h
        eor     #$FF                            ; DCA0 49 FF                    I.
        and     SEDORIC_BUF2+16,x               ; DCA2 3D 10 C2                 =..
        sta     SEDORIC_BUF2+16,x               ; DCA5 9D 10 C2                 ...
LDCA8:  lda     #$00                            ; DCA8 A9 00                    ..
        sta     SEDORIC_TRAV1                   ; DCAA 85 F3                    ..
        txa                                     ; DCAC 8A                       .
LDCAD:  asl     a                               ; DCAD 0A                       .
        rol     SEDORIC_TRAV1                   ; DCAE 26 F3                    &.
        asl     a                               ; DCB0 0A                       .
        rol     SEDORIC_TRAV1                   ; DCB1 26 F3                    &.
        asl     a                               ; DCB3 0A                       .
        rol     SEDORIC_TRAV1                   ; DCB4 26 F3                    &.
        sta     SEDORIC_TRAV0                   ; DCB6 85 F2                    ..
        tya                                     ; DCB8 98                       .
        ora     SEDORIC_TRAV0                   ; DCB9 05 F2                    ..
        ldx     #$FF                            ; DCBB A2 FF                    ..
LDCBD:  sec                                     ; DCBD 38                       8
        inx                                     ; DCBE E8                       .
        tay                                     ; DCBF A8                       .
        sbc     SEDORIC_BUF2+7                  ; DCC0 ED 07 C2                 ...
        bcs     LDCBD                           ; DCC3 B0 F8                    ..
        dec     SEDORIC_TRAV1                   ; DCC5 C6 F3                    ..
        bpl     LDCBD                           ; DCC7 10 F4                    ..
        txa                                     ; DCC9 8A                       .
        cpx     SEDORIC_BUF2+6                  ; DCCA EC 06 C2                 ...
        bcc     LDCD4                           ; DCCD 90 05                    ..
        sbc     SEDORIC_BUF2+6                  ; DCCF ED 06 C2                 ...
        ora     #$80                            ; DCD2 09 80                    ..
LDCD4:  iny                                     ; DCD4 C8                       .
        rts                                     ; DCD5 60                       `

; ----------------------------------------------------------------------------
LDCD6:  dey                                     ; DCD6 88                       .
        tax                                     ; DCD7 AA                       .
        bpl     LDCE0                           ; DCD8 10 06                    ..
        and     #$7F                            ; DCDA 29 7F                    ).
        clc                                     ; DCDC 18                       .
        adc     SEDORIC_BUF2+6                  ; DCDD 6D 06 C2                 m..
LDCE0:  tax                                     ; DCE0 AA                       .
        lda     #$00                            ; DCE1 A9 00                    ..
        sta     SEDORIC_TRAV1                   ; DCE3 85 F3                    ..
        cpx     #$00                            ; DCE5 E0 00                    ..
        beq     LDCF4                           ; DCE7 F0 0B                    ..
LDCE9:  clc                                     ; DCE9 18                       .
        adc     SEDORIC_BUF2+7                  ; DCEA 6D 07 C2                 m..
        bcc     LDCF1                           ; DCED 90 02                    ..
        inc     SEDORIC_TRAV1                   ; DCEF E6 F3                    ..
LDCF1:  dex                                     ; DCF1 CA                       .
        bne     LDCE9                           ; DCF2 D0 F5                    ..
LDCF4:  sta     SEDORIC_TRAV0                   ; DCF4 85 F2                    ..
        clc                                     ; DCF6 18                       .
        tya                                     ; DCF7 98                       .
        adc     SEDORIC_TRAV0                   ; DCF8 65 F2                    e.
        bcc     LDCFE                           ; DCFA 90 02                    ..
        inc     SEDORIC_TRAV1                   ; DCFC E6 F3                    ..
LDCFE:  pha                                     ; DCFE 48                       H
        and     #$07                            ; DCFF 29 07                    ).
        tay                                     ; DD01 A8                       .
        pla                                     ; DD02 68                       h
        lsr     SEDORIC_TRAV1                   ; DD03 46 F3                    F.
        ror     a                               ; DD05 6A                       j
        lsr     SEDORIC_TRAV1                   ; DD06 46 F3                    F.
        ror     a                               ; DD08 6A                       j
        lsr     SEDORIC_TRAV1                   ; DD09 46 F3                    F.
        jmp     LE6C4                           ; DD0B 4C C4 E6                 L..

; ----------------------------------------------------------------------------
LDD0E:  lda     #$00                            ; DD0E A9 00                    ..
LDD10:  rol     a                               ; DD10 2A                       *
        dey                                     ; DD11 88                       .
        bpl     LDD10                           ; DD12 10 FC                    ..
        rts                                     ; DD14 60                       `

; ----------------------------------------------------------------------------
XDETSE: jsr     LDCD6                           ; DD15 20 D6 DC                  ..
        ora     SEDORIC_BUF2+16,x               ; DD18 1D 10 C2                 ...
        cmp     SEDORIC_BUF2+16,x               ; DD1B DD 10 C2                 ...
        beq     LDD2C                           ; DD1E F0 0C                    ..
        sta     SEDORIC_BUF2+16,x               ; DD20 9D 10 C2                 ...
        inc     SEDORIC_BUF2+2                  ; DD23 EE 02 C2                 ...
        bne     LDD2C                           ; DD26 D0 04                    ..
        inc     SEDORIC_BUF2+3                  ; DD28 EE 03 C2                 ...
        clc                                     ; DD2B 18                       .
LDD2C:  rts                                     ; DD2C 60                       `

; ----------------------------------------------------------------------------
XCREAY: jsr     LDCD6                           ; DD2D 20 D6 DC                  ..
        eor     #$FF                            ; DD30 49 FF                    I.
        and     SEDORIC_BUF2+16,x               ; DD32 3D 10 C2                 =..
        cmp     SEDORIC_BUF2+16,x               ; DD35 DD 10 C2                 ...
        beq     LDD2C                           ; DD38 F0 F2                    ..
        sta     SEDORIC_BUF2+16,x               ; DD3A 9D 10 C2                 ...
        lda     SEDORIC_BUF2+2                  ; DD3D AD 02 C2                 ...
        bne     LDD45                           ; DD40 D0 03                    ..
        dec     SEDORIC_BUF2+3                  ; DD42 CE 03 C2                 ...
LDD45:  dec     SEDORIC_BUF2+2                  ; DD45 CE 02 C2                 ...
        clc                                     ; DD48 18                       .
LDD49:  rts                                     ; DD49 60                       `

; ----------------------------------------------------------------------------
CMD_SAVEM:
        lda     #$40                            ; DD4A A9 40                    .@
LDD4C:  .byte   $2C                             ; DD4C 2C                       ,
CMD_SAVEU:
        lda     #$C0                            ; DD4D A9 C0                    ..
LDD4F:  .byte   $2C                             ; DD4F 2C                       ,
CMD_SAVE:
        lda     #$80                            ; DD50 A9 80                    ..
LDD52:  .byte   $2C                             ; DD52 2C                       ,
CMD_SAVEO:
        lda     #$00                            ; DD53 A9 00                    ..
        jsr     LDE28                           ; DD55 20 28 DE                  (.
        jsr     LD44F                           ; DD58 20 4F D4                  O.
        jsr     LD79E                           ; DD5B 20 9E D7                  ..
LDD5E:  jsr     LD39E                           ; DD5E 20 9E D3                  ..
        bne     LDD66                           ; DD61 D0 03                    ..
        jmp     LDE0B                           ; DD63 4C 0B DE                 L..

; ----------------------------------------------------------------------------
LDD66:  jsr     LD22C                           ; DD66 20 2C D2                  ,.
        cmp     #$54                            ; DD69 C9 54                    .T
        bne     LDD89                           ; DD6B D0 1C                    ..
        jsr     LD398                           ; DD6D 20 98 D3                  ..
        jsr     LD2FA                           ; DD70 20 FA D2                  ..
        sty     $C056                           ; DD73 8C 56 C0                 .V.
        sta     $C057                           ; DD76 8D 57 C0                 .W.
        lsr     $C051                           ; DD79 4E 51 C0                 NQ.
        sec                                     ; DD7C 38                       8
        rol     $C051                           ; DD7D 2E 51 C0                 .Q.
        bne     LDD5E                           ; DD80 D0 DC                    ..
LDD82:  lda     #$40                            ; DD82 A9 40                    .@
        sta     $C051                           ; DD84 8D 51 C0                 .Q.
        bne     LDD5E                           ; DD87 D0 D5                    ..
LDD89:  cmp     #$41                            ; DD89 C9 41                    .A
        bne     LDD9B                           ; DD8B D0 0E                    ..
        jsr     LD398                           ; DD8D 20 98 D3                  ..
        jsr     LD2FA                           ; DD90 20 FA D2                  ..
        sty     $C052                           ; DD93 8C 52 C0                 .R.
        sta     $C053                           ; DD96 8D 53 C0                 .S.
        bcc     LDD82                           ; DD99 90 E7                    ..
LDD9B:  cmp     #$45                            ; DD9B C9 45                    .E
        bne     LDDAD                           ; DD9D D0 0E                    ..
        jsr     LD398                           ; DD9F 20 98 D3                  ..
        jsr     LD2FA                           ; DDA2 20 FA D2                  ..
        sty     $C054                           ; DDA5 8C 54 C0                 .T.
        sta     $C055                           ; DDA8 8D 55 C0                 .U.
        bcc     LDD82                           ; DDAB 90 D5                    ..
LDDAD:  cmp     #$C7                            ; DDAD C9 C7                    ..
        bne     LDE23                           ; DDAF D0 72                    .r
        jsr     LD398                           ; DDB1 20 98 D3                  ..
        bne     LDE23                           ; DDB4 D0 6D                    .m
        lsr     $C051                           ; DDB6 4E 51 C0                 NQ.
        sec                                     ; DDB9 38                       8
        rol     $C051                           ; DDBA 2E 51 C0                 .Q.
        bmi     LDE0B                           ; DDBD 30 4C                    0L
        lda     $C052                           ; DDBF AD 52 C0                 .R.
        ldy     $C053                           ; DDC2 AC 53 C0                 .S.
        sta     $C056                           ; DDC5 8D 56 C0                 .V.
        sty     $C057                           ; DDC8 8C 57 C0                 .W.
        .byte   $90                             ; DDCB 90                       .
LDDCC:  .byte   $3E                             ; DDCC 3E                       >
CMD_KEYSAVE:
        jsr     LD44F                           ; DDCD 20 4F D4                  O.
        lda     #$00                            ; DDD0 A9 00                    ..
        ldy     #$C8                            ; DDD2 A0 C8                    ..
        sta     $C052                           ; DDD4 8D 52 C0                 .R.
        sty     $C053                           ; DDD7 8C 53 C0                 .S.
        lda     #$DD                            ; DDDA A9 DD                    ..
        ldy     #$C9                            ; DDDC A0 C9                    ..
        .byte   $D0                             ; DDDE D0                       .
LDDDF:  .byte   $1E                             ; DDDF 1E                       .
CMD_ESAVE:
        jsr     LD44F                           ; DDE0 20 4F D4                  O.
        lda     $021F                           ; DDE3 AD 1F 02                 ...
        bne     LDDF0                           ; DDE6 D0 08                    ..
        ldx     #$80                            ; DDE8 A2 80                    ..
        ldy     #$BB                            ; DDEA A0 BB                    ..
        lda     #$DF                            ; DDEC A9 DF                    ..
        bne     LDDF6                           ; DDEE D0 06                    ..
LDDF0:  ldx     #$00                            ; DDF0 A2 00                    ..
        ldy     #$A0                            ; DDF2 A0 A0                    ..
        lda     #$3F                            ; DDF4 A9 3F                    .?
LDDF6:  stx     $C052                           ; DDF6 8E 52 C0                 .R.
        sty     $C053                           ; DDF9 8C 53 C0                 .S.
        ldy     #$BF                            ; DDFC A0 BF                    ..
; BUG JSR DE3B #######################################
FIXME_BUG____________________:
        ldx     #$40                            ; DDFE A2 40                    .@
LDE00:  jsr     LDE3B                           ; DE00 20 3B DE                  ;.
        lda     #$C0                            ; DE03 A9 C0                    ..
        sta     $C04D                           ; DE05 8D 4D C0                 .M.
        jsr     LD79E                           ; DE08 20 9E D7                  ..
LDE0B:  sec                                     ; DE0B 38                       8
        lda     $C054                           ; DE0C AD 54 C0                 .T.
        sbc     $C052                           ; DE0F ED 52 C0                 .R.
        sta     $C04F                           ; DE12 8D 4F C0                 .O.
        lda     $C055                           ; DE15 AD 55 C0                 .U.
        sbc     $C053                           ; DE18 ED 53 C0                 .S.
        sta     $C050                           ; DE1B 8D 50 C0                 .P.
        bcs     LDE9C                           ; DE1E B0 7C                    .|
LDE20:  ldx     #$08                            ; DE20 A2 08                    ..
        .byte   $2C                             ; DE22 2C                       ,
LDE23:  ldx     #$09                            ; DE23 A2 09                    ..
        jmp     LD67E                           ; DE25 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LDE28:  sta     $C04D                           ; DE28 8D 4D C0                 .M.
        lda     $9A                             ; DE2B A5 9A                    ..
        ldy     $9B                             ; DE2D A4 9B                    ..
        sta     $C052                           ; DE2F 8D 52 C0                 .R.
        sty     $C053                           ; DE32 8C 53 C0                 .S.
        lda     $9C                             ; DE35 A5 9C                    ..
        ldy     $9D                             ; DE37 A4 9D                    ..
        ldx     #$80                            ; DE39 A2 80                    ..
LDE3B:  sta     $C054                           ; DE3B 8D 54 C0                 .T.
        sty     $C055                           ; DE3E 8C 55 C0                 .U.
        stx     $C051                           ; DE41 8E 51 C0                 .Q.
        lda     #$00                            ; DE44 A9 00                    ..
        sta     $C056                           ; DE46 8D 56 C0                 .V.
        sta     $C057                           ; DE49 8D 57 C0                 .W.
LDE4C:  rts                                     ; DE4C 60                       `

; ----------------------------------------------------------------------------
CMD_CREATEW:
        jsr     LD44F                           ; DE4D 20 4F D4                  O.
        jsr     LDFDE                           ; DE50 20 DE DF                  ..
LDE53:  jsr     SEDORIC_KEYBOARD_WAIT           ; DE53 20 02 D3                  ..
        bpl     LDE53                           ; DE56 10 FB                    ..
        cmp     #$03                            ; DE58 C9 03                    ..
        beq     LDE4C                           ; DE5A F0 F0                    ..
        cmp     #$13                            ; DE5C C9 13                    ..
        bne     LDE7C                           ; DE5E D0 1C                    ..
        jsr     XCUROFF                         ; DE60 20 40 D7                  @.
        lda     #$D0                            ; DE63 A9 D0                    ..
        ldy     #$BB                            ; DE65 A0 BB                    ..
        sta     $C052                           ; DE67 8D 52 C0                 .R.
        sty     $C053                           ; DE6A 8C 53 C0                 .S.
        lda     #$B7                            ; DE6D A9 B7                    ..
        ldy     #$BF                            ; DE6F A0 BF                    ..
        ldx     #$60                            ; DE71 A2 60                    .`
        jsr     LDE00                           ; DE73 20 00 DE                  ..
        jsr     XCURON                          ; DE76 20 3E D7                  >.
        .byte   $4C                             ; DE79 4C                       L
        .byte   $53                             ; DE7A 53                       S
LDE7B:  .byte   $DE                             ; DE7B DE                       .
LDE7C:  cmp     #$17                            ; DE7C C9 17                    ..
        bne     LDE8E                           ; DE7E D0 0E                    ..
        ldy     BASIC11_Y_TEXT                  ; DE80 AC 69 02                 .i.
        lda     #$7F                            ; DE83 A9 7F                    ..
        nop                                     ; DE85 EA                       .
        nop                                     ; DE86 EA                       .
        nop                                     ; DE87 EA                       .
        sta     ($12),y                         ; DE88 91 12                    ..
        lda     #$09                            ; DE8A A9 09                    ..
        bne     LDE97                           ; DE8C D0 09                    ..
LDE8E:  cmp     #$0D                            ; DE8E C9 0D                    ..
        bne     LDE97                           ; DE90 D0 05                    ..
        jsr     XAFCAR                          ; DE92 20 2A D6                  *.
        lda     #$0A                            ; DE95 A9 0A                    ..
LDE97:  jsr     XAFCAR                          ; DE97 20 2A D6                  *.
        bne     LDE53                           ; DE9A D0 B7                    ..
LDE9C:  sei                                     ; DE9C 78                       x
        jsr     LDB2D                           ; DE9D 20 2D DB                  -.
        beq     LDF11                           ; DEA0 F0 6F                    .o
        lda     $C04D                           ; DEA2 AD 4D C0                 .M.
        beq     LDEBD                           ; DEA5 F0 16                    ..
        cmp     #$80                            ; DEA7 C9 80                    ..
        beq     LDEB8                           ; DEA9 F0 0D                    ..
        cmp     #$C0                            ; DEAB C9 C0                    ..
        beq     LDEC5                           ; DEAD F0 16                    ..
        jsr     LDB07                           ; DEAF 20 07 DB                  ..
        jmp     LDF1B                           ; DEB2 4C 1B DF                 L..

; ----------------------------------------------------------------------------
LDEB5:  ldx     #$02                            ; DEB5 A2 02                    ..
        .byte   $2C                             ; DEB7 2C                       ,
LDEB8:  ldx     #$06                            ; DEB8 A2 06                    ..
        jmp     LD67E                           ; DEBA 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LDEBD:  jsr     LE264                           ; DEBD 20 64 E2                  d.
        bcs     LDEEF                           ; DEC0 B0 2D                    .-
        jmp     LDF11                           ; DEC2 4C 11 DF                 L..

; ----------------------------------------------------------------------------
LDEC5:  ldy     #$02                            ; DEC5 A0 02                    ..
LDEC7:  lda     $C032,y                         ; DEC7 B9 32 C0                 .2.
        pha                                     ; DECA 48                       H
        dey                                     ; DECB 88                       .
        bpl     LDEC7                           ; DECC 10 F9                    ..
        ldy     #$02                            ; DECE A0 02                    ..
LDED0:  lda     $C032,y                         ; DED0 B9 32 C0                 .2.
        cmp     LCCFA,y                         ; DED3 D9 FA CC                 ...
        bne     LDEDD                           ; DED6 D0 05                    ..
        dey                                     ; DED8 88                       .
        bpl     LDED0                           ; DED9 10 F5                    ..
        bmi     LDEB5                           ; DEDB 30 D8                    0.
LDEDD:  ldx     #$03                            ; DEDD A2 03                    ..
        jsr     SEDORIC_COPY_NAME_AND_EXT_IN_BUFNOM; DEDF 20 4A D3               J.
        jsr     XTVNM                           ; DEE2 20 30 DB                  0.
        beq     LDEF1                           ; DEE5 F0 0A                    ..
        jsr     LE264                           ; DEE7 20 64 E2                  d.
        bcc     LDEF1                           ; DEEA 90 05                    ..
        pla                                     ; DEEC 68                       h
        pla                                     ; DEED 68                       h
        pla                                     ; DEEE 68                       h
LDEEF:  cli                                     ; DEEF 58                       X
        rts                                     ; DEF0 60                       `

; ----------------------------------------------------------------------------
LDEF1:  ldy     #$00                            ; DEF1 A0 00                    ..
LDEF3:  pla                                     ; DEF3 68                       h
        sta     $C032,y                         ; DEF4 99 32 C0                 .2.
        iny                                     ; DEF7 C8                       .
        cpy     #$03                            ; DEF8 C0 03                    ..
        bne     LDEF3                           ; DEFA D0 F7                    ..
        jsr     XTVNM                           ; DEFC 20 30 DB                  0.
        ldx     $C027                           ; DEFF AE 27 C0                 .'.
LDF02:  lda     LCCFA,y                         ; DF02 B9 FA CC                 ...
        sta     SEDORIC_BUF3+9,x                ; DF05 9D 09 C3                 ...
        inx                                     ; DF08 E8                       .
        iny                                     ; DF09 C8                       .
        cpy     #$03                            ; DF0A C0 03                    ..
        bne     LDF02                           ; DF0C D0 F4                    ..
        jsr     XSCAT                           ; DF0E 20 82 DA                  ..
LDF11:  ldx     #$03                            ; DF11 A2 03                    ..
        lda     #$00                            ; DF13 A9 00                    ..
LDF15:  sta     $C035,x                         ; DF15 9D 35 C0                 .5.
        dex                                     ; DF18 CA                       .
        bpl     LDF15                           ; DF19 10 FA                    ..
LDF1B:  ldx     $C050                           ; DF1B AE 50 C0                 .P.
        ldy     #$00                            ; DF1E A0 00                    ..
        inx                                     ; DF20 E8                       .
        txa                                     ; DF21 8A                       .
        bne     LDF25                           ; DF22 D0 01                    ..
        iny                                     ; DF24 C8                       .
LDF25:  jsr     XWDESC                          ; DF25 20 C0 DB                  ..
        lda     $C052                           ; DF28 AD 52 C0                 .R.
        ldy     $C053                           ; DF2B AC 53 C0                 .S.
        dey                                     ; DF2E 88                       .
        sta     SEDORIC_RWBUF                   ; DF2F 8D 03 C0                 ...
        sty     SEDORIC_RWBUF+1                 ; DF32 8C 04 C0                 ...
        ldy     #$0A                            ; DF35 A0 0A                    ..
LDF37:  inc     SEDORIC_RWBUF+1                 ; DF37 EE 04 C0                 ...
        lda     $C050                           ; DF3A AD 50 C0                 .P.
        beq     LDF56                           ; DF3D F0 17                    ..
        dec     $C050                           ; DF3F CE 50 C0                 .P.
        jsr     LE228                           ; DF42 20 28 E2                  (.
        lda     SEDORIC_BUF1,y                  ; DF45 B9 00 C1                 ...
        sta     SEDORIC_TRACK                   ; DF48 8D 01 C0                 ...
        lda     SEDORIC_BUF1+1,y                ; DF4B B9 01 C1                 ...
        sta     SEDORIC_SECTOR                  ; DF4E 8D 02 C0                 ...
        jsr     XSVSEC                          ; DF51 20 A4 DA                  ..
        beq     LDF37                           ; DF54 F0 E1                    ..
LDF56:  jsr     LE228                           ; DF56 20 28 E2                  (.
        lda     SEDORIC_BUF1,y                  ; DF59 B9 00 C1                 ...
        pha                                     ; DF5C 48                       H
        lda     SEDORIC_BUF1+1,y                ; DF5D B9 01 C1                 ...
        pha                                     ; DF60 48                       H
        jsr     LDACE                           ; DF61 20 CE DA                  ..
        lda     SEDORIC_RWBUF                   ; DF64 AD 03 C0                 ...
        ldy     SEDORIC_RWBUF+1                 ; DF67 AC 04 C0                 ...
        sta     SEDORIC_TRAV0                   ; DF6A 85 F2                    ..
        sty     SEDORIC_TRAV1                   ; DF6C 84 F3                    ..
        ldy     #$FF                            ; DF6E A0 FF                    ..
LDF70:  iny                                     ; DF70 C8                       .
        lda     (SEDORIC_TRAV0),y               ; DF71 B1 F2                    ..
        sta     SEDORIC_BUF1,y                  ; DF73 99 00 C1                 ...
        cpy     $C04F                           ; DF76 CC 4F C0                 .O.
        bne     LDF70                           ; DF79 D0 F5                    ..
        pla                                     ; DF7B 68                       h
        tay                                     ; DF7C A8                       .
        pla                                     ; DF7D 68                       h
        jsr     LDA91                           ; DF7E 20 91 DA                  ..
        clc                                     ; DF81 18                       .
        lda     $C05A                           ; DF82 AD 5A C0                 .Z.
        adc     $C05E                           ; DF85 6D 5E C0                 m^.
        bcc     LDF8D                           ; DF88 90 03                    ..
        inc     $C05B                           ; DF8A EE 5B C0                 .[.
LDF8D:  adc     $C037                           ; DF8D 6D 37 C0                 m7.
        sta     $C037                           ; DF90 8D 37 C0                 .7.
        lda     $C038                           ; DF93 AD 38 C0                 .8.
        and     #$0F                            ; DF96 29 0F                    ).
        adc     $C05B                           ; DF98 6D 5B C0                 m[.
        ora     #$40                            ; DF9B 09 40                    .@
        sta     $C038                           ; DF9D 8D 38 C0                 .8.
        lda     $C035                           ; DFA0 AD 35 C0                 .5.
        ldy     $C036                           ; DFA3 AC 36 C0                 .6.
        beq     LDFC5                           ; DFA6 F0 1D                    ..
LDFA8:  jsr     READ_SECTOR_TRACK               ; DFA8 20 5D DA                  ].
        lda     SEDORIC_BUF1                    ; DFAB AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; DFAE AC 01 C1                 ...
        bne     LDFA8                           ; DFB1 D0 F5                    ..
        lda     $C05C                           ; DFB3 AD 5C C0                 .\.
        ldy     $C05D                           ; DFB6 AC 5D C0                 .].
        sta     SEDORIC_BUF1                    ; DFB9 8D 00 C1                 ...
        sty     SEDORIC_BUF1+1                  ; DFBC 8C 01 C1                 ...
        jsr     XSVSEC                          ; DFBF 20 A4 DA                  ..
        jmp     LDFD4                           ; DFC2 4C D4 DF                 L..

; ----------------------------------------------------------------------------
LDFC5:  lda     $C05C                           ; DFC5 AD 5C C0                 .\.
        ldy     $C05D                           ; DFC8 AC 5D C0                 .].
        sta     $C035                           ; DFCB 8D 35 C0                 .5.
        sty     $C036                           ; DFCE 8C 36 C0                 .6.
        jsr     XTRVCA                          ; DFD1 20 59 DB                  Y.
LDFD4:  jsr     XSMAP                           ; DFD4 20 8A DA                  ..
        jsr     LDAEE                           ; DFD7 20 EE DA                  ..
        cli                                     ; DFDA 58                       X
        jmp     XSCAT                           ; DFDB 4C 82 DA                 L..

; ----------------------------------------------------------------------------
LDFDE:  lda     $021F                           ; DFDE AD 1F 02                 ...
        beq     LDFF3                           ; DFE1 F0 10                    ..
        jmp     SEDORIC_DISPLAY_TYPE_MISMATCH   ; DFE3 4C 6F D1                 Lo.

; ----------------------------------------------------------------------------
LDFE6:  lda     #$00                            ; DFE6 A9 00                    ..
        ldx     #$03                            ; DFE8 A2 03                    ..
LDFEA:  sta     $C04D,x                         ; DFEA 9D 4D C0                 .M.
        dex                                     ; DFED CA                       .
        bpl     LDFEA                           ; DFEE 10 FA                    ..
        stx     $C072                           ; DFF0 8E 72 C0                 .r.
LDFF3:  rts                                     ; DFF3 60                       `

; ----------------------------------------------------------------------------
LDFF4:  .byte   $4C                             ; DFF4 4C                       L
        .byte   $23                             ; DFF5 23                       #
LDFF6:  .byte   $DE                             ; DFF6 DE                       .
CMD_LOAD:
        lda     #$80                            ; DFF7 A9 80                    ..
LDFF9:  jsr     LD454                           ; DFF9 20 54 D4                  T.
        jsr     LD79E                           ; DFFC 20 9E D7                  ..
        jsr     LDFE6                           ; DFFF 20 E6 DF                  ..
LE002:  jsr     LD39E                           ; E002 20 9E D3                  ..
        beq     LE052                           ; E005 F0 4B                    .K
        bne     LE00E                           ; E007 D0 05                    ..
LE009:  jsr     LD398                           ; E009 20 98 D3                  ..
        beq     LE052                           ; E00C F0 44                    .D
LE00E:  jsr     LD22C                           ; E00E 20 2C D2                  ,.
        ldy     #$40                            ; E011 A0 40                    .@
        cmp     #$56                            ; E013 C9 56                    .V
        beq     LE01D                           ; E015 F0 06                    ..
        cmp     #$4E                            ; E017 C9 4E                    .N
        bne     LE027                           ; E019 D0 0C                    ..
        ldy     #$80                            ; E01B A0 80                    ..
LE01D:  lda     $C04D                           ; E01D AD 4D C0                 .M.
        bne     LDFF4                           ; E020 D0 D2                    ..
        sty     $C04D                           ; E022 8C 4D C0                 .M.
        beq     LE009                           ; E025 F0 E2                    ..
LE027:  cmp     #$4A                            ; E027 C9 4A                    .J
        bne     LE034                           ; E029 D0 09                    ..
        lda     $C04E                           ; E02B AD 4E C0                 .N.
        bne     LDFF4                           ; E02E D0 C4                    ..
        ldx     #$80                            ; E030 A2 80                    ..
        bmi     LE04B                           ; E032 30 17                    0.
LE034:  cmp     #$41                            ; E034 C9 41                    .A
        bne     LDFF4                           ; E036 D0 BC                    ..
        lda     $C04E                           ; E038 AD 4E C0                 .N.
        bne     LDFF4                           ; E03B D0 B7                    ..
        jsr     LD398                           ; E03D 20 98 D3                  ..
        jsr     LD2FA                           ; E040 20 FA D2                  ..
        sty     $C052                           ; E043 8C 52 C0                 .R.
        sta     $C053                           ; E046 8D 53 C0                 .S.
        ldx     #$40                            ; E049 A2 40                    .@
LE04B:  stx     $C04E                           ; E04B 8E 4E C0                 .N.
        bmi     LE009                           ; E04E 30 B9                    0.
        bpl     LE002                           ; E050 10 B0                    ..
LE052:  jsr     LE0E5                           ; E052 20 E5 E0                  ..
        bit     $C04D                           ; E055 2C 4D C0                 ,M.
        bvc     LE085                           ; E058 50 2B                    P+
        lda     $C051                           ; E05A AD 51 C0                 .Q.
        jsr     LD7E1                           ; E05D 20 E1 D7                  ..
        lda     $C052                           ; E060 AD 52 C0                 .R.
        ldy     $C053                           ; E063 AC 53 C0                 .S.
        jsr     LD7F8                           ; E066 20 F8 D7                  ..
        lda     $C056                           ; E069 AD 56 C0                 .V.
        ldy     $C057                           ; E06C AC 57 C0                 .W.
        jsr     LD7FE                           ; E06F 20 FE D7                  ..
        clc                                     ; E072 18                       .
        lda     $C052                           ; E073 AD 52 C0                 .R.
        adc     $C04F                           ; E076 6D 4F C0                 mO.
        pha                                     ; E079 48                       H
        lda     $C053                           ; E07A AD 53 C0                 .S.
        adc     $C050                           ; E07D 6D 50 C0                 mP.
        tay                                     ; E080 A8                       .
        pla                                     ; E081 68                       h
        jsr     LD7FB                           ; E082 20 FB D7                  ..
LE085:  lda     $C04D                           ; E085 AD 4D C0                 .M.
        asl     a                               ; E088 0A                       .
        bmi     LE0DB                           ; E089 30 50                    0P
        rol     a                               ; E08B 2A                       *
        eor     #$01                            ; E08C 49 01                    I.
        and     $C051                           ; E08E 2D 51 C0                 -Q.
        lsr     a                               ; E091 4A                       J
        lda     $C051                           ; E092 AD 51 C0                 .Q.
        bpl     LE0A4                           ; E095 10 0D                    ..
        php                                     ; E097 08                       .
        jsr     LE0B4                           ; E098 20 B4 E0                  ..
        plp                                     ; E09B 28                       (
        bcc     LE0A1                           ; E09C 90 03                    ..
        jmp     LD1AC                           ; E09E 4C AC D1                 L..

; ----------------------------------------------------------------------------
LE0A1:  jmp     SEDORIC_RETURN_TO_READY         ; E0A1 4C 80 D1                 L..

; ----------------------------------------------------------------------------
LE0A4:  bcc     LE0DB                           ; E0A4 90 35                    .5
        lda     $C056                           ; E0A6 AD 56 C0                 .V.
        ldy     $C057                           ; E0A9 AC 57 C0                 .W.
        .byte   $4C                             ; E0AC 4C                       L
        .byte   $6B                             ; E0AD 6B                       k
LE0AE:  .byte   $04                             ; E0AE 04                       .
CMD_OLD:ldy     #$01                            ; E0AF A0 01                    ..
        tya                                     ; E0B1 98                       .
        sta     ($9A),y                         ; E0B2 91 9A                    ..
LE0B4:  php                                     ; E0B4 08                       .
        sei                                     ; E0B5 78                       x
        jsr     LD188                           ; E0B6 20 88 D1                  ..
        ldy     $92                             ; E0B9 A4 92                    ..
        lda     $91                             ; E0BB A5 91                    ..
        clc                                     ; E0BD 18                       .
        adc     #$02                            ; E0BE 69 02                    i.
        bcc     LE0C3                           ; E0C0 90 01                    ..
        iny                                     ; E0C2 C8                       .
LE0C3:  sta     $9C                             ; E0C3 85 9C                    ..
        sty     $9D                             ; E0C5 84 9D                    ..
        sta     $9E                             ; E0C7 85 9E                    ..
        sty     $9F                             ; E0C9 84 9F                    ..
        sta     $A0                             ; E0CB 85 A0                    ..
        sty     $A1                             ; E0CD 84 A1                    ..
        lda     $A6                             ; E0CF A5 A6                    ..
        ldy     $A7                             ; E0D1 A4 A7                    ..
        sta     $A2                             ; E0D3 85 A2                    ..
        sty     $A3                             ; E0D5 84 A3                    ..
        plp                                     ; E0D7 28                       (
        jmp     LD1CC                           ; E0D8 4C CC D1                 L..

; ----------------------------------------------------------------------------
LE0DB:  cli                                     ; E0DB 58                       X
        rts                                     ; E0DC 60                       `

; ----------------------------------------------------------------------------
LE0DD:  ldx     #$00                            ; E0DD A2 00                    ..
        .byte   $2C                             ; E0DF 2C                       ,
LE0E0:  ldx     #$0C                            ; E0E0 A2 0C                    ..
        jmp     LD67E                           ; E0E2 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LE0E5:  jsr     LDB2D                           ; E0E5 20 2D DB                  -.
        beq     LE0DD                           ; E0E8 F0 F3                    ..
LE0EA:  sei                                     ; E0EA 78                       x
        sec                                     ; E0EB 38                       8
        ror     $C072                           ; E0EC 6E 72 C0                 nr.
        lda     SEDORIC_BUF3+12,x               ; E0EF BD 0C C3                 ...
        ldy     SEDORIC_BUF3+13,x               ; E0F2 BC 0D C3                 ...
LE0F5:  jsr     READ_SECTOR_TRACK               ; E0F5 20 5D DA                  ].
        ldx     #$02                            ; E0F8 A2 02                    ..
LE0FA:  lda     SEDORIC_BUF1,x                  ; E0FA BD 00 C1                 ...
        cmp     #$FF                            ; E0FD C9 FF                    ..
        beq     LE10E                           ; E0FF F0 0D                    ..
        inx                                     ; E101 E8                       .
        bne     LE0FA                           ; E102 D0 F6                    ..
        lda     SEDORIC_BUF1                    ; E104 AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; E107 AC 01 C1                 ...
        beq     LE0DB                           ; E10A F0 CF                    ..
        bne     LE0F5                           ; E10C D0 E7                    ..
LE10E:  lda     SEDORIC_BUF1+1,x                ; E10E BD 01 C1                 ...
        sta     SEDORIC_TRAV7                   ; E111 85 F9                    ..
        and     #$C0                            ; E113 29 C0                    ).
        bne     LE11C                           ; E115 D0 05                    ..
        bit     $C04D                           ; E117 2C 4D C0                 ,M.
        bvc     LE0E0                           ; E11A 50 C4                    P.
LE11C:  bit     $C04E                           ; E11C 2C 4E C0                 ,N.
        bvs     LE13A                           ; E11F 70 19                    p.
        bpl     LE12E                           ; E121 10 0B                    ..
        ldy     $9D                             ; E123 A4 9D                    ..
        lda     $9C                             ; E125 A5 9C                    ..
        sbc     #$02                            ; E127 E9 02                    ..
        bcs     LE134                           ; E129 B0 09                    ..
        dey                                     ; E12B 88                       .
        bcc     LE134                           ; E12C 90 06                    ..
LE12E:  lda     SEDORIC_BUF1+2,x                ; E12E BD 02 C1                 ...
        ldy     SEDORIC_BUF1+3,x                ; E131 BC 03 C1                 ...
LE134:  sta     $C052                           ; E134 8D 52 C0                 .R.
        sty     $C053                           ; E137 8C 53 C0                 .S.
LE13A:  sec                                     ; E13A 38                       8
        lda     SEDORIC_BUF1+4,x                ; E13B BD 04 C1                 ...
        sbc     SEDORIC_BUF1+2,x                ; E13E FD 02 C1                 ...
        sta     $C04F                           ; E141 8D 4F C0                 .O.
        lda     SEDORIC_BUF1+5,x                ; E144 BD 05 C1                 ...
        sbc     SEDORIC_BUF1+3,x                ; E147 FD 03 C1                 ...
        sta     $C050                           ; E14A 8D 50 C0                 .P.
        clc                                     ; E14D 18                       .
        lda     $C052                           ; E14E AD 52 C0                 .R.
        sta     SEDORIC_RWBUF                   ; E151 8D 03 C0                 ...
        adc     $C04F                           ; E154 6D 4F C0                 mO.
        pha                                     ; E157 48                       H
        lda     $C053                           ; E158 AD 53 C0                 .S.
        tay                                     ; E15B A8                       .
        dey                                     ; E15C 88                       .
        sty     SEDORIC_RWBUF+1                 ; E15D 8C 04 C0                 ...
        adc     $C050                           ; E160 6D 50 C0                 mP.
        tay                                     ; E163 A8                       .
        bit     $C072                           ; E164 2C 72 C0                 ,r.
        bpl     LE175                           ; E167 10 0C                    ..
        lda     SEDORIC_BUF1+6,x                ; E169 BD 06 C1                 ...
        sta     $C056                           ; E16C 8D 56 C0                 .V.
        lda     SEDORIC_BUF1+7,x                ; E16F BD 07 C1                 ...
        sta     $C057                           ; E172 8D 57 C0                 .W.
LE175:  lda     SEDORIC_BUF1+8,x                ; E175 BD 08 C1                 ...
        sta     SEDORIC_TRAV5                   ; E178 85 F7                    ..
        lda     SEDORIC_BUF1+9,x                ; E17A BD 09 C1                 ...
        sta     SEDORIC_TRAV6                   ; E17D 85 F8                    ..
        bit     $C04D                           ; E17F 2C 4D C0                 ,M.
        bvc     LE1B9                           ; E182 50 35                    P5
        lda     $C053                           ; E184 AD 53 C0                 .S.
        jsr     XAFHEX                          ; E187 20 13 D6                  ..
        lda     $C052                           ; E18A AD 52 C0                 .R.
        jsr     XAFHEX                          ; E18D 20 13 D6                  ..
        jsr     XAFCAR_DISPLAY_SPACE            ; E190 20 28 D6                  (.
        tya                                     ; E193 98                       .
        jsr     XAFHEX                          ; E194 20 13 D6                  ..
        pla                                     ; E197 68                       h
        jsr     XAFHEX                          ; E198 20 13 D6                  ..
        jsr     XAFCAR_DISPLAY_SPACE            ; E19B 20 28 D6                  (.
        lda     SEDORIC_TRAV7                   ; E19E A5 F9                    ..
        jsr     XAFHEX                          ; E1A0 20 13 D6                  ..
        jsr     XAFCAR_DISPLAY_SPACE            ; E1A3 20 28 D6                  (.
        lda     $C057                           ; E1A6 AD 57 C0                 .W.
        jsr     XAFHEX                          ; E1A9 20 13 D6                  ..
        lda     $C056                           ; E1AC AD 56 C0                 .V.
        jsr     XAFHEX                          ; E1AF 20 13 D6                  ..
        jsr     XAFCAR_DISPLAY_SPACE            ; E1B2 20 28 D6                  (.
        jsr     LD206                           ; E1B5 20 06 D2                  ..
        .byte   $24                             ; E1B8 24                       $
LE1B9:  pla                                     ; E1B9 68                       h
        txa                                     ; E1BA 8A                       .
        clc                                     ; E1BB 18                       .
        adc     #$06                            ; E1BC 69 06                    i.
        tay                                     ; E1BE A8                       .
        jsr     LE228                           ; E1BF 20 28 E2                  (.
LE1C2:  lda     SEDORIC_TRAV5                   ; E1C2 A5 F7                    ..
        bne     LE1C8                           ; E1C4 D0 02                    ..
        dec     SEDORIC_TRAV6                   ; E1C6 C6 F8                    ..
LE1C8:  dec     SEDORIC_TRAV5                   ; E1C8 C6 F7                    ..
        inc     SEDORIC_RWBUF+1                 ; E1CA EE 04 C0                 ...
        lda     SEDORIC_TRAV5                   ; E1CD A5 F7                    ..
        ora     SEDORIC_TRAV6                   ; E1CF 05 F8                    ..
        beq     LE1DC                           ; E1D1 F0 09                    ..
        jsr     LE228                           ; E1D3 20 28 E2                  (.
        jsr     LE250                           ; E1D6 20 50 E2                  P.
        jmp     LE1C2                           ; E1D9 4C C2 E1                 L..

; ----------------------------------------------------------------------------
LE1DC:  lda     SEDORIC_RWBUF                   ; E1DC AD 03 C0                 ...
        ldx     SEDORIC_RWBUF+1                 ; E1DF AE 04 C0                 ...
        sta     SEDORIC_TRAV3                   ; E1E2 85 F5                    ..
        stx     SEDORIC_TRAV4                   ; E1E4 86 F6                    ..
        jsr     LE228                           ; E1E6 20 28 E2                  (.
        tya                                     ; E1E9 98                       .
        pha                                     ; E1EA 48                       H
        lda     #$00                            ; E1EB A9 00                    ..
        ldx     #$C2                            ; E1ED A2 C2                    ..
        sta     SEDORIC_RWBUF                   ; E1EF 8D 03 C0                 ...
        stx     SEDORIC_RWBUF+1                 ; E1F2 8E 04 C0                 ...
        bit     $C04D                           ; E1F5 2C 4D C0                 ,M.
        bvs     LE20A                           ; E1F8 70 10                    p.
        jsr     LE250                           ; E1FA 20 50 E2                  P.
        ldy     #$FF                            ; E1FD A0 FF                    ..
LE1FF:  iny                                     ; E1FF C8                       .
        lda     SEDORIC_BUF2,y                  ; E200 B9 00 C2                 ...
        sta     (SEDORIC_TRAV3),y               ; E203 91 F5                    ..
        cpy     $C04F                           ; E205 CC 4F C0                 .O.
        bne     LE1FF                           ; E208 D0 F5                    ..
LE20A:  pla                                     ; E20A 68                       h
        tay                                     ; E20B A8                       .
        jsr     LE228                           ; E20C 20 28 E2                  (.
        bcs     LE24E                           ; E20F B0 3D                    .=
        tya                                     ; E211 98                       .
        tax                                     ; E212 AA                       .
        lda     $C072                           ; E213 AD 72 C0                 .r.
        bpl     LE225                           ; E216 10 0D                    ..
        lsr     $C072                           ; E218 4E 72 C0                 Nr.
        lda     #$00                            ; E21B A9 00                    ..
        sta     $C04E                           ; E21D 8D 4E C0                 .N.
        lda     SEDORIC_TRAV7                   ; E220 A5 F9                    ..
        sta     $C051                           ; E222 8D 51 C0                 .Q.
LE225:  jmp     LE0FA                           ; E225 4C FA E0                 L..

; ----------------------------------------------------------------------------
LE228:  iny                                     ; E228 C8                       .
        iny                                     ; E229 C8                       .
        bne     LE249                           ; E22A D0 1D                    ..
        lda     SEDORIC_RWBUF                   ; E22C AD 03 C0                 ...
        pha                                     ; E22F 48                       H
        lda     SEDORIC_RWBUF+1                 ; E230 AD 04 C0                 ...
        pha                                     ; E233 48                       H
        lda     SEDORIC_BUF1                    ; E234 AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; E237 AC 01 C1                 ...
        beq     LE24B                           ; E23A F0 0F                    ..
        jsr     READ_SECTOR_TRACK               ; E23C 20 5D DA                  ].
        pla                                     ; E23F 68                       h
        sta     SEDORIC_RWBUF+1                 ; E240 8D 04 C0                 ...
        pla                                     ; E243 68                       h
        sta     SEDORIC_RWBUF                   ; E244 8D 03 C0                 ...
        ldy     #$02                            ; E247 A0 02                    ..
LE249:  clc                                     ; E249 18                       .
LE24A:  rts                                     ; E24A 60                       `

; ----------------------------------------------------------------------------
LE24B:  sec                                     ; E24B 38                       8
        pla                                     ; E24C 68                       h
        pla                                     ; E24D 68                       h
LE24E:  cli                                     ; E24E 58                       X
        rts                                     ; E24F 60                       `

; ----------------------------------------------------------------------------
LE250:  lda     SEDORIC_BUF1,y                  ; E250 B9 00 C1                 ...
        sta     SEDORIC_TRACK                   ; E253 8D 01 C0                 ...
        lda     SEDORIC_BUF1+1,y                ; E256 B9 01 C1                 ...
        sta     SEDORIC_SECTOR                  ; E259 8D 02 C0                 ...
        bit     $C04D                           ; E25C 2C 4D C0                 ,M.
        bvs     LE24A                           ; E25F 70 E9                    p.
        .byte   $4C                             ; E261 4C                       L
        .byte   $73                             ; E262 73                       s
; X
SEDORIC_STR_NOT_EMPTY_DIRECTORY:
        .byte   $DA                             ; E263 DA                       .
LE264:  .byte   $18                             ; E264 18                       .
        .byte   "$"                             ; E265 24                       $
LE266:  .byte   "8"                             ; E266 38                       8
        .byte   $AE                             ; E267 AE                       .
        .byte   "'"                             ; E268 27                       '
        .byte   $C0,$BC,$0F,$C3                 ; E269 C0 BC 0F C3              ....
        .byte   "0a"                            ; E26D 30 61                    0a
        .byte   $98                             ; E26F 98                       .
        .byte   "**"                            ; E270 2A 2A                    **
        .byte   $10,$03                         ; E272 10 03                    ..
        .byte   "L"                             ; E274 4C                       L
        .byte   $F3,$E5                         ; E275 F3 E5                    ..
; ----------------------------------------------------------------------------
        jsr     LE5DC                           ; E277 20 DC E5                  ..
        lda     SEDORIC_BUF3+12,x               ; E27A BD 0C C3                 ...
        pha                                     ; E27D 48                       H
        lda     SEDORIC_BUF3+13,x               ; E27E BD 0D C3                 ...
        pha                                     ; E281 48                       H
        sec                                     ; E282 38                       8
        lda     SEDORIC_BUF3+2                  ; E283 AD 02 C3                 ...
        sbc     #$10                            ; E286 E9 10                    ..
        sta     SEDORIC_BUF3+2                  ; E288 8D 02 C3                 ...
        tay                                     ; E28B A8                       .
        lda     #$10                            ; E28C A9 10                    ..
        sta     SEDORIC_TRAV0                   ; E28E 85 F2                    ..
LE290:  lda     SEDORIC_BUF3,y                  ; E290 B9 00 C3                 ...
        stx     SEDORIC_TRAV1                   ; E293 86 F3                    ..
        cpy     SEDORIC_TRAV1                   ; E295 C4 F3                    ..
        beq     LE29C                           ; E297 F0 03                    ..
        sta     SEDORIC_BUF3,x                  ; E299 9D 00 C3                 ...
LE29C:  lda     #$00                            ; E29C A9 00                    ..
        sta     SEDORIC_BUF3,y                  ; E29E 99 00 C3                 ...
        inx                                     ; E2A1 E8                       .
        iny                                     ; E2A2 C8                       .
        dec     SEDORIC_TRAV0                   ; E2A3 C6 F2                    ..
        bne     LE290                           ; E2A5 D0 E9                    ..
        pla                                     ; E2A7 68                       h
        tay                                     ; E2A8 A8                       .
        pla                                     ; E2A9 68                       h
LE2AA:  jsr     READ_SECTOR_TRACK               ; E2AA 20 5D DA                  ].
        lda     SEDORIC_TRACK                   ; E2AD AD 01 C0                 ...
        ldy     SEDORIC_SECTOR                  ; E2B0 AC 02 C0                 ...
        jsr     XDETSE                          ; E2B3 20 15 DD                  ..
        ldx     #$02                            ; E2B6 A2 02                    ..
LE2B8:  lda     SEDORIC_BUF1,x                  ; E2B8 BD 00 C1                 ...
        cmp     #$FF                            ; E2BB C9 FF                    ..
        beq     LE2DC                           ; E2BD F0 1D                    ..
        inx                                     ; E2BF E8                       .
        bne     LE2B8                           ; E2C0 D0 F6                    ..
        lda     SEDORIC_BUF1                    ; E2C2 AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; E2C5 AC 01 C1                 ...
        bne     LE2AA                           ; E2C8 D0 E0                    ..
LE2CA:  jsr     XSMAP                           ; E2CA 20 8A DA                  ..
        jmp     XSCAT                           ; E2CD 4C 82 DA                 L..

; ----------------------------------------------------------------------------
        bcs     LE2D5                           ; E2D0 B0 03                    ..
LE2D2:  jsr     LDAB4                           ; E2D2 20 B4 DA                  ..
LE2D5:  ldx     #$09                            ; E2D5 A2 09                    ..
        jsr     LD36C                           ; E2D7 20 6C D3                  l.
        sec                                     ; E2DA 38                       8
        rts                                     ; E2DB 60                       `

; ----------------------------------------------------------------------------
LE2DC:  lda     SEDORIC_BUF1+8,x                ; E2DC BD 08 C1                 ...
        sta     SEDORIC_TRAV3                   ; E2DF 85 F5                    ..
        lda     SEDORIC_BUF1+9,x                ; E2E1 BD 09 C1                 ...
        sta     SEDORIC_TRAV4                   ; E2E4 85 F6                    ..
        txa                                     ; E2E6 8A                       .
        clc                                     ; E2E7 18                       .
        adc     #$0A                            ; E2E8 69 0A                    i.
        tax                                     ; E2EA AA                       .
LE2EB:  txa                                     ; E2EB 8A                       .
        pha                                     ; E2EC 48                       H
        lda     SEDORIC_BUF1,x                  ; E2ED BD 00 C1                 ...
        ldy     SEDORIC_BUF1+1,x                ; E2F0 BC 01 C1                 ...
        jsr     XDETSE                          ; E2F3 20 15 DD                  ..
        pla                                     ; E2F6 68                       h
        tax                                     ; E2F7 AA                       .
        inx                                     ; E2F8 E8                       .
        inx                                     ; E2F9 E8                       .
        bne     LE312                           ; E2FA D0 16                    ..
        lda     SEDORIC_BUF1                    ; E2FC AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; E2FF AC 01 C1                 ...
        beq     LE2CA                           ; E302 F0 C6                    ..
        jsr     READ_SECTOR_TRACK               ; E304 20 5D DA                  ].
        lda     SEDORIC_TRACK                   ; E307 AD 01 C0                 ...
        ldy     SEDORIC_SECTOR                  ; E30A AC 02 C0                 ...
        jsr     XDETSE                          ; E30D 20 15 DD                  ..
        ldx     #$02                            ; E310 A2 02                    ..
LE312:  ldy     SEDORIC_TRAV3                   ; E312 A4 F5                    ..
        bne     LE318                           ; E314 D0 02                    ..
        dec     SEDORIC_TRAV4                   ; E316 C6 F6                    ..
LE318:  dec     SEDORIC_TRAV3                   ; E318 C6 F5                    ..
        lda     SEDORIC_TRAV3                   ; E31A A5 F5                    ..
        ora     SEDORIC_TRAV4                   ; E31C 05 F6                    ..
        bne     LE2EB                           ; E31E D0 CB                    ..
        beq     LE2B8                           ; E320 F0 96                    ..
LE322:  jsr     LDAB4                           ; E322 20 B4 DA                  ..
        lda     #$20                            ; E325 A9 20                    . 
        sta     $C04C                           ; E327 8D 4C C0                 .L.
        ldx     $C027                           ; E32A AE 27 C0                 .'.
        lda     SEDORIC_BUF3+15,x               ; E32D BD 0F C3                 ...
        php                                     ; E330 08                       .
        and     #$0F                            ; E331 29 0F                    ).
        tay                                     ; E333 A8                       .
        lda     SEDORIC_BUF3+14,x               ; E334 BD 0E C3                 ...
        jsr     LD756                           ; E337 20 56 D7                  V.
        lda     #$20                            ; E33A A9 20                    . 
        plp                                     ; E33C 28                       (
        bpl     LE341                           ; E33D 10 02                    ..
        lda     #$50                            ; E33F A9 50                    .P
LE341:  .byte   $4C                             ; E341 4C                       L
        rol     a                               ; E342 2A                       *
LE343:  .byte   $D6                             ; E343 D6                       .
CMD_DIR:jsr     LD451                           ; E344 20 51 D4                  Q.
        php                                     ; E347 08                       .
        sei                                     ; E348 78                       x
        lda     #$14                            ; E349 A9 14                    ..
        ldy     #$01                            ; E34B A0 01                    ..
        jsr     READ_SECTOR_TRACK               ; E34D 20 5D DA                  ].
        jsr     XPMAP                           ; E350 20 4C DA                  L.
        ldx     #$05                            ; E353 A2 05                    ..
        jsr     LD36C                           ; E355 20 6C D3                  l.
        lda     SEDORIC_BUFNOM                  ; E358 AD 28 C0                 .(.
        jsr     LD60E                           ; E35B 20 0E D6                  ..
        ldx     #$06                            ; E35E A2 06                    ..
        ldy     SEDORIC_BUF2+10                 ; E360 AC 0A C2                 ...
        beq     LE377                           ; E363 F0 12                    ..
        ldx     #$11                            ; E365 A2 11                    ..
        dey                                     ; E367 88                       .
        beq     LE377                           ; E368 F0 0D                    ..
        ldx     #$12                            ; E36A A2 12                    ..
        jsr     LD36C                           ; E36C 20 6C D3                  l.
        lda     SEDORIC_BUF2+10                 ; E36F AD 0A C2                 ...
        jsr     XAFCAR                          ; E372 20 2A D6                  *.
        ldx     #$13                            ; E375 A2 13                    ..
LE377:  jsr     LD36C                           ; E377 20 6C D3                  l.
        ldy     #$EB                            ; E37A A0 EB                    ..
LE37C:  lda     SEDORIC_ERRVEC+1,y              ; E37C B9 1E C0                 ...
        jsr     XAFCAR                          ; E37F 20 2A D6                  *.
        iny                                     ; E382 C8                       .
        bne     LE37C                           ; E383 D0 F7                    ..
        jsr     LE41F                           ; E385 20 1F E4                  ..
        jsr     LD206                           ; E388 20 06 D2                  ..
        jsr     XTVNM                           ; E38B 20 30 DB                  0.
        bne     LE39B                           ; E38E D0 0B                    ..
        beq     LE3C5                           ; E390 F0 33                    .3
LE392:  sei                                     ; E392 78                       x
        jsr     LE41F                           ; E393 20 1F E4                  ..
        jsr     LDB41                           ; E396 20 41 DB                  A.
        beq     LE3C2                           ; E399 F0 27                    .'
LE39B:  jsr     LE583                           ; E39B 20 83 E5                  ..
        jsr     LDB41                           ; E39E 20 41 DB                  A.
        beq     LE3BF                           ; E3A1 F0 1C                    ..
        jsr     XAFCAR_DISPLAY_SPACE            ; E3A3 20 28 D6                  (.
        jsr     XAFCAR_DISPLAY_SPACE            ; E3A6 20 28 D6                  (.
        jsr     LE583                           ; E3A9 20 83 E5                  ..
        cli                                     ; E3AC 58                       X
        jsr     SEDORIC_KEYBOARD_WAIT           ; E3AD 20 02 D3                  ..
        bpl     LE392                           ; E3B0 10 E0                    ..
LE3B2:  jsr     SEDORIC_KEYBOARD_WAIT           ; E3B2 20 02 D3                  ..
        bpl     LE3B2                           ; E3B5 10 FB                    ..
        cmp     #$20                            ; E3B7 C9 20                    . 
        beq     LE392                           ; E3B9 F0 D7                    ..
        cmp     #$1B                            ; E3BB C9 1B                    ..
        bne     LE3B2                           ; E3BD D0 F3                    ..
LE3BF:  jsr     LD206                           ; E3BF 20 06 D2                  ..
LE3C2:  jsr     LD206                           ; E3C2 20 06 D2                  ..
LE3C5:  lda     #$20                            ; E3C5 A9 20                    . 
        sta     $C04C                           ; E3C7 8D 4C C0                 .L.
        lda     SEDORIC_BUF2+2                  ; E3CA AD 02 C2                 ...
        ldy     SEDORIC_BUF2+3                  ; E3CD AC 03 C2                 ...
        jsr     LD756                           ; E3D0 20 56 D7                  V.
        ldx     #$07                            ; E3D3 A2 07                    ..
        jsr     LD36C                           ; E3D5 20 6C D3                  l.
        lda     #$00                            ; E3D8 A9 00                    ..
        sta     $C04C                           ; E3DA 8D 4C C0                 .L.
        lda     #$44                            ; E3DD A9 44                    .D
        bit     SEDORIC_BUF2+9                  ; E3DF 2C 09 C2                 ,..
        bmi     LE3E6                           ; E3E2 30 02                    0.
        lda     #$53                            ; E3E4 A9 53                    .S
LE3E6:  jsr     XAFCAR                          ; E3E6 20 2A D6                  *.
        lda     #$2F                            ; E3E9 A9 2F                    ./
        jsr     XAFCAR                          ; E3EB 20 2A D6                  *.
        lda     SEDORIC_BUF2+6                  ; E3EE AD 06 C2                 ...
        ldx     #$01                            ; E3F1 A2 01                    ..
        jsr     LD750                           ; E3F3 20 50 D7                  P.
        lda     #$2F                            ; E3F6 A9 2F                    ./
        jsr     XAFCAR                          ; E3F8 20 2A D6                  *.
        lda     SEDORIC_BUF2+7                  ; E3FB AD 07 C2                 ...
        jsr     LD74E                           ; E3FE 20 4E D7                  N.
        lda     #$29                            ; E401 A9 29                    .)
        jsr     XAFCAR                          ; E403 20 2A D6                  *.
        nop                                     ; E406 EA                       .
        nop                                     ; E407 EA                       .
        nop                                     ; E408 EA                       .
        lda     #$20                            ; E409 A9 20                    . 
        sta     $C04C                           ; E40B 8D 4C C0                 .L.
        lda     SEDORIC_BUF2+4                  ; E40E AD 04 C2                 ...
        ldy     SEDORIC_BUF2+5                  ; E411 AC 05 C2                 ...
        ldx     #$02                            ; E414 A2 02                    ..
        jsr     LD758                           ; E416 20 58 D7                  X.
        plp                                     ; E419 28                       (
        ldx     #$08                            ; E41A A2 08                    ..
        jsr     LD36C                           ; E41C 20 6C D3                  l.
LE41F:  bit     $02F1                           ; E41F 2C F1 02                 ,..
        bmi     LE430                           ; E422 30 0C                    0.
        lda     BASIC11_FLG                     ; E424 AD 6A 02                 .j.
        and     #$20                            ; E427 29 20                    ) 
        bne     LE430                           ; E429 D0 05                    ..
        lda     SEDORIC_ATMORI                  ; E42B AD 24 C0                 .$.
        bpl     LE433                           ; E42E 10 03                    ..
LE430:  jmp     LD206                           ; E430 4C 06 D2                 L..

; ----------------------------------------------------------------------------
LE433:  rts                                     ; E433 60                       `

; ----------------------------------------------------------------------------
LE434:  .byte   $4C                             ; E434 4C                       L
        .byte   $23                             ; E435 23                       #
LE436:  .byte   $DE                             ; E436 DE                       .
CMD_DELBAK:
        jsr     LE60D                           ; E437 20 0D E6                  ..
        bne     LE434                           ; E43A D0 F8                    ..
        ldx     #$09                            ; E43C A2 09                    ..
        jsr     Garbage100                      ; E43E 20 4D D3                  M.
        sec                                     ; E441 38                       8
        .byte   $B0                             ; E442 B0                       .
LE443:  php                                     ; E443 08                       .
CMD_DESTROY:
        sec                                     ; E444 38                       8
LE445:  .byte   $24                             ; E445 24                       $
CMD_DEL:clc                                     ; E446 18                       .
        php                                     ; E447 08                       .
        jsr     LD451                           ; E448 20 51 D4                  Q.
        plp                                     ; E44B 28                       (
        ror     $C072                           ; E44C 6E 72 C0                 nr.
        jsr     LD9B0                           ; E44F 20 B0 D9                  ..
        bne     LE457                           ; E452 D0 03                    ..
        jmp     LE0DD                           ; E454 4C DD E0                 L..

; ----------------------------------------------------------------------------
LE457:  jsr     LD7A0                           ; E457 20 A0 D7                  ..
        bcc     LE473                           ; E45A 90 17                    ..
        jsr     LE264                           ; E45C 20 64 E2                  d.
        bcc     LE4A7                           ; E45F 90 46                    .F
LE461:  rts                                     ; E461 60                       `

; ----------------------------------------------------------------------------
LE462:  jsr     XAFCAR                          ; E462 20 2A D6                  *.
LE465:  jsr     LD206                           ; E465 20 06 D2                  ..
        jsr     LDB41                           ; E468 20 41 DB                  A.
LE46B:  ldx     $C027                           ; E46B AE 27 C0                 .'.
        jsr     LDB48                           ; E46E 20 48 DB                  H.
        beq     LE4A7                           ; E471 F0 34                    .4
LE473:  jsr     LDAB4                           ; E473 20 B4 DA                  ..
        bit     $C072                           ; E476 2C 72 C0                 ,r.
        bmi     LE49B                           ; E479 30 20                    0 
        ldx     #$0A                            ; E47B A2 0A                    ..
        jsr     LD36C                           ; E47D 20 6C D3                  l.
LE480:  jsr     SEDORIC_KEYBOARD_WAIT           ; E480 20 02 D3                  ..
        jsr     LD3A1                           ; E483 20 A1 D3                  ..
        cmp     #$4E                            ; E486 C9 4E                    .N
        beq     LE462                           ; E488 F0 D8                    ..
        cmp     #$1B                            ; E48A C9 1B                    ..
        beq     LE461                           ; E48C F0 D3                    ..
        cmp     #$59                            ; E48E C9 59                    .Y
        bne     LE480                           ; E490 D0 EE                    ..
        jsr     XAFCAR                          ; E492 20 2A D6                  *.
        jsr     LD206                           ; E495 20 06 D2                  ..
        jsr     LDAB4                           ; E498 20 B4 DA                  ..
LE49B:  jsr     LE266                           ; E49B 20 66 E2                  f.
        bcs     LE465                           ; E49E B0 C5                    ..
        ldx     #$0B                            ; E4A0 A2 0B                    ..
        jsr     LD36C                           ; E4A2 20 6C D3                  l.
        bmi     LE46B                           ; E4A5 30 C4                    0.
LE4A7:  lda     #$00                            ; E4A7 A9 00                    ..
        sta     SEDORIC_TRAV3                   ; E4A9 85 F5                    ..
        lda     LE7D1                           ; E4AB AD D1 E7                 ...
        ldx     LE7D2                           ; E4AE AE D2 E7                 ...
        clc                                     ; E4B1 18                       .
        .byte   $24                             ; E4B2 24                       $
LE4B3:  sec                                     ; E4B3 38                       8
        sbc     #$0F                            ; E4B4 E9 0F                    ..
        inc     SEDORIC_TRAV3                   ; E4B6 E6 F5                    ..
        bcs     LE4B3                           ; E4B8 B0 F9                    ..
        dex                                     ; E4BA CA                       .
        bpl     LE4B3                           ; E4BB 10 F6                    ..
        ldx     LE7D3                           ; E4BD AE D3 E7                 ...
        cpx     SEDORIC_TRAV3                   ; E4C0 E4 F5                    ..
        beq     LE461                           ; E4C2 F0 9D                    ..
        dex                                     ; E4C4 CA                       .
        stx     SEDORIC_TRAV3                   ; E4C5 86 F5                    ..
        jsr     CMD_REN                         ; E4C7 20 37 E5                  7.
        nop                                     ; E4CA EA                       .
LE4CB:  dec     SEDORIC_TRAV3                   ; E4CB C6 F5                    ..
        bne     LE4D5                           ; E4CD D0 06                    ..
        sta     $C05C                           ; E4CF 8D 5C C0                 .\.
        sty     $C05D                           ; E4D2 8C 5D C0                 .].
LE4D5:  jsr     READ_SECTOR_TRACK               ; E4D5 20 5D DA                  ].
        lda     SEDORIC_BUF1                    ; E4D8 AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; E4DB AC 01 C1                 ...
        bne     LE4CB                           ; E4DE D0 EB                    ..
        ldy     #$10                            ; E4E0 A0 10                    ..
        sty     SEDORIC_TRAV3                   ; E4E2 84 F5                    ..
LE4E4:  jsr     LDBA5                           ; E4E4 20 A5 DB                  ..
        ldy     SEDORIC_TRAV3                   ; E4E7 A4 F5                    ..
LE4E9:  cpy     SEDORIC_BUF1+2                  ; E4E9 CC 02 C1                 ...
        beq     LE502                           ; E4EC F0 14                    ..
        lda     SEDORIC_BUF1,y                  ; E4EE B9 00 C1                 ...
        sta     SEDORIC_BUF3,x                  ; E4F1 9D 00 C3                 ...
        iny                                     ; E4F4 C8                       .
        inx                                     ; E4F5 E8                       .
        stx     SEDORIC_BUF3+2                  ; E4F6 8E 02 C3                 ...
        bne     LE4E9                           ; E4F9 D0 EE                    ..
        sty     SEDORIC_TRAV3                   ; E4FB 84 F5                    ..
        jsr     XSCAT                           ; E4FD 20 82 DA                  ..
        beq     LE4E4                           ; E500 F0 E2                    ..
LE502:  jsr     XSCAT                           ; E502 20 82 DA                  ..
        dec     LE7D3                           ; E505 CE D3 E7                 ...
        lda     $C05C                           ; E508 AD 5C C0                 .\.
        ldy     $C05D                           ; E50B AC 5D C0                 .].
        jsr     LDA63                           ; E50E 20 63 DA                  c.
        lda     SEDORIC_BUF3                    ; E511 AD 00 C3                 ...
        pha                                     ; E514 48                       H
        lda     SEDORIC_BUF3+1                  ; E515 AD 01 C3                 ...
        pha                                     ; E518 48                       H
        lda     #$00                            ; E519 A9 00                    ..
        sta     SEDORIC_BUF3                    ; E51B 8D 00 C3                 ...
        sta     SEDORIC_BUF3+1                  ; E51E 8D 01 C3                 ...
        jsr     XSVSEC                          ; E521 20 A4 DA                  ..
        pla                                     ; E524 68                       h
        tay                                     ; E525 A8                       .
        pla                                     ; E526 68                       h
        ldx     LE7D3                           ; E527 AE D3 E7                 ...
        cpx     #$01                            ; E52A E0 01                    ..
        bcc     LE531                           ; E52C 90 03                    ..
        jsr     XDETSE                          ; E52E 20 15 DD                  ..
LE531:  jsr     XSMAP                           ; E531 20 8A DA                  ..
        jmp     LE4A7                           ; E534 4C A7 E4                 L..

; ----------------------------------------------------------------------------
CMD_REN:lda     $C027                           ; E537 AD 27 C0                 .'.
        pha                                     ; E53A 48                       H
        ldx     SEDORIC_DRIVE                   ; E53B AE 00 C0                 ...
        lda     LF638,x                         ; E53E BD 38 F6                 .8.
        ldy     LF63C,x                         ; E541 BC 3C F6                 .<.
        jsr     LE576                           ; E544 20 76 E5                  v.
        adc     #$08                            ; E547 69 08                    i.
        tay                                     ; E549 A8                       .
        ldx     #$08                            ; E54A A2 08                    ..
LE54C:  lda     SEDORIC_BUF3+3,x                ; E54C BD 03 C3                 ...
        cmp     LE6E5,y                         ; E54F D9 E5 E6                 ...
        bne     LE566                           ; E552 D0 12                    ..
        dey                                     ; E554 88                       .
        dex                                     ; E555 CA                       .
        bpl     LE54C                           ; E556 10 F4                    ..
        pla                                     ; E558 68                       h
        sta     $C027                           ; E559 8D 27 C0                 .'.
LE55C:  ldx     SEDORIC_DRIVE                   ; E55C AE 00 C0                 ...
        lda     LF638,x                         ; E55F BD 38 F6                 .8.
        ldy     LF63C,x                         ; E562 BC 3C F6                 .<.
        rts                                     ; E565 60                       `

; ----------------------------------------------------------------------------
LE566:  pla                                     ; E566 68                       h
        ldx     SEDORIC_DRIVE                   ; E567 AE 00 C0                 ...
        ldy     #$04                            ; E56A A0 04                    ..
        tya                                     ; E56C 98                       .
        sta     LF63C,x                         ; E56D 9D 3C F6                 .<.
        lda     #$14                            ; E570 A9 14                    ..
        sta     LF638,x                         ; E572 9D 38 F6                 .8.
        rts                                     ; E575 60                       `

; ----------------------------------------------------------------------------
LE576:  jsr     LDA63                           ; E576 20 63 DA                  c.
        lda     SEDORIC_DRIVE                   ; E579 AD 00 C0                 ...
        asl     a                               ; E57C 0A                       .
        asl     a                               ; E57D 0A                       .
        asl     a                               ; E57E 0A                       .
        adc     SEDORIC_DRIVE                   ; E57F 6D 00 C0                 m..
        rts                                     ; E582 60                       `

; ----------------------------------------------------------------------------
LE583:  ldx     $C027                           ; E583 AE 27 C0                 .'.
        lda     SEDORIC_BUF3+15,x               ; E586 BD 0F C3                 ...
        rol     a                               ; E589 2A                       *
        rol     a                               ; E58A 2A                       *
        bmi     LE591                           ; E58B 30 04                    0.
        jsr     LE322                           ; E58D 20 22 E3                  ".
        rts                                     ; E590 60                       `

; ----------------------------------------------------------------------------
LE591:  ldy     #$08                            ; E591 A0 08                    ..
        jsr     LDAC3                           ; E593 20 C3 DA                  ..
        lda     #$D2                            ; E596 A9 D2                    ..
        ldy     #$E5                            ; E598 A0 E5                    ..
        jsr     XAFSTR                          ; E59A 20 37 D6                  7.
        rts                                     ; E59D 60                       `

; ----------------------------------------------------------------------------
        stx     SEDORIC_TRAV7                   ; E59E 86 F9                    ..
        lda     SEDORIC_BUF3+15,x               ; E5A0 BD 0F C3                 ...
        rol     a                               ; E5A3 2A                       *
        rol     a                               ; E5A4 2A                       *
        bmi     LE5AC                           ; E5A5 30 05                    0.
        bit     $07                             ; E5A7 24 07                    $.
        jmp     LC4D7                           ; E5A9 4C D7 C4                 L..

; ----------------------------------------------------------------------------
LE5AC:  jsr     LDAB4                           ; E5AC 20 B4 DA                  ..
        lda     #$C5                            ; E5AF A9 C5                    ..
        ldy     #$E5                            ; E5B1 A0 E5                    ..
        jsr     XAFSTR                          ; E5B3 20 37 D6                  7.
        jmp     LC57A                           ; E5B6 4C 7A C5                 Lz.

; ----------------------------------------------------------------------------
LE5B9:  stx     SEDORIC_DRVDEF                  ; E5B9 8E 09 C0                 ...
        ldy     #$2E                            ; E5BC A0 2E                    ..
        jsr     LE78A                           ; E5BE 20 8A E7                  ..
        jsr     LC644                           ; E5C1 20 44 C6                  D.
        rts                                     ; E5C4 60                       `

; ----------------------------------------------------------------------------
        jsr     L4F4E                           ; E5C5 20 4E 4F                  NO
        .byte   $54                             ; E5C8 54                       T
        jsr     L4C41                           ; E5C9 20 41 4C                  AL
        jmp     L574F                           ; E5CC 4C 4F 57                 LOW

; ----------------------------------------------------------------------------
        eor     $44                             ; E5CF 45 44                    ED
        brk                                     ; E5D1 00                       .
        jsr     L2020                           ; E5D2 20 20 20                    
        jsr     L5B20                           ; E5D5 20 20 5B                   [
        rol     a                               ; E5D8 2A                       *
        eor     a:$20,x                         ; E5D9 5D 20 00                 ] .
LE5DC:  lda     LE7D1                           ; E5DC AD D1 E7                 ...
        bne     LE5E4                           ; E5DF D0 03                    ..
        dec     LE7D2                           ; E5E1 CE D2 E7                 ...
LE5E4:  dec     LE7D1                           ; E5E4 CE D1 E7                 ...
        lda     SEDORIC_BUF2+4                  ; E5E7 AD 04 C2                 ...
        bne     LE5EF                           ; E5EA D0 03                    ..
        dec     SEDORIC_BUF2+5                  ; E5EC CE 05 C2                 ...
LE5EF:  dec     SEDORIC_BUF2+4                  ; E5EF CE 04 C2                 ...
        rts                                     ; E5F2 60                       `

; ----------------------------------------------------------------------------
        lda     #$C5                            ; E5F3 A9 C5                    ..
        ldy     #$E5                            ; E5F5 A0 E5                    ..
        jsr     XAFSTR                          ; E5F7 20 37 D6                  7.
        sec                                     ; E5FA 38                       8
LE5FB:  rts                                     ; E5FB 60                       `

; ----------------------------------------------------------------------------
CMD_SEARCH:
        jsr     LD451                           ; E5FC 20 51 D4                  Q.
        jsr     LDB2D                           ; E5FF 20 2D DB                  -.
        php                                     ; E602 08                       .
        lda     #$00                            ; E603 A9 00                    ..
        plp                                     ; E605 28                       (
        beq     LE60A                           ; E606 F0 02                    ..
        lda     #$01                            ; E608 A9 01                    ..
LE60A:  jmp     LD7D5                           ; E60A 4C D5 D7                 L..

; ----------------------------------------------------------------------------
LE60D:  ldy     SEDORIC_DRVDEF                  ; E60D AC 09 C0                 ...
        jsr     LD39E                           ; E610 20 9E D3                  ..
        beq     LE622                           ; E613 F0 0D                    ..
        sbc     #$41                            ; E615 E9 41                    .A
        cmp     #$04                            ; E617 C9 04                    ..
        bcs     LE622                           ; E619 B0 07                    ..
        tay                                     ; E61B A8                       .
        jsr     LD7C0                           ; E61C 20 C0 D7                  ..
        jmp     LD398                           ; E61F 4C 98 D3                 L..

; ----------------------------------------------------------------------------
LE622:  jsr     LD7C0                           ; E622 20 C0 D7                  ..
        jmp     LD39E                           ; E625 4C 9E D3                 L..

; ----------------------------------------------------------------------------
        jmp     LE0DD                           ; E628 4C DD E0                 L..

; ----------------------------------------------------------------------------
        jmp     LE2D2                           ; E62B 4C D2 E2                 L..

; ----------------------------------------------------------------------------
LE62E:  lda     #$14                            ; E62E A9 14                    ..
        ldy     #$02                            ; E630 A0 02                    ..
        sty     $2F                             ; E632 84 2F                    ./
        rts                                     ; E634 60                       `

; ----------------------------------------------------------------------------
LE635:  ldy     #$03                            ; E635 A0 03                    ..
        jmp     LDC8B                           ; E637 4C 8B DC                 L..

; ----------------------------------------------------------------------------
LE63A:  clc                                     ; E63A 18                       .
        .byte   $24                             ; E63B 24                       $
LE63C:  sec                                     ; E63C 38                       8
        pha                                     ; E63D 48                       H
        tya                                     ; E63E 98                       .
        pha                                     ; E63F 48                       H
        lda     SEDORIC_TRACK                   ; E640 AD 01 C0                 ...
        pha                                     ; E643 48                       H
        lda     SEDORIC_SECTOR                  ; E644 AD 02 C0                 ...
        pha                                     ; E647 48                       H
        ldx     #$06                            ; E648 A2 06                    ..
LE64A:  lda     SEDORIC_BUF2+2,x                ; E64A BD 02 C2                 ...
        pha                                     ; E64D 48                       H
        dex                                     ; E64E CA                       .
        bpl     LE64A                           ; E64F 10 F9                    ..
        bcs     LE65B                           ; E651 B0 08                    ..
        jsr     LE635                           ; E653 20 35 E6                  5.
        jsr     XPMAP                           ; E656 20 4C DA                  L.
        beq     LE667                           ; E659 F0 0C                    ..
LE65B:  stx     $2F                             ; E65B 86 2F                    ./
        jsr     LDC89                           ; E65D 20 89 DC                  ..
        lda     #$14                            ; E660 A9 14                    ..
        ldy     #$03                            ; E662 A0 03                    ..
        jsr     LDA50                           ; E664 20 50 DA                  P.
LE667:  ldx     #$00                            ; E667 A2 00                    ..
LE669:  pla                                     ; E669 68                       h
        sta     SEDORIC_BUF2+2,x                ; E66A 9D 02 C2                 ...
        inx                                     ; E66D E8                       .
        cpx     #$07                            ; E66E E0 07                    ..
        bcc     LE669                           ; E670 90 F7                    ..
        pla                                     ; E672 68                       h
        sta     SEDORIC_SECTOR                  ; E673 8D 02 C0                 ...
        pla                                     ; E676 68                       h
        sta     SEDORIC_TRACK                   ; E677 8D 01 C0                 ...
        pla                                     ; E67A 68                       h
        tay                                     ; E67B A8                       .
        pla                                     ; E67C 68                       h
        sec                                     ; E67D 38                       8
        rts                                     ; E67E 60                       `

; ----------------------------------------------------------------------------
LE67F:  ldx     #$00                            ; E67F A2 00                    ..
LE681:  lda     SEDORIC_BUF2+16,x               ; E681 BD 10 C2                 ...
        bne     LE697                           ; E684 D0 11                    ..
        inx                                     ; E686 E8                       .
        cpx     #$F0                            ; E687 E0 F0                    ..
        bne     LE681                           ; E689 D0 F6                    ..
        bit     $2F                             ; E68B 24 2F                    $/
        bpl     LE692                           ; E68D 10 03                    ..
        jmp     LDC78                           ; E68F 4C 78 DC                 Lx.

; ----------------------------------------------------------------------------
LE692:  jsr     LE63C                           ; E692 20 3C E6                  <.
        bcs     LE67F                           ; E695 B0 E8                    ..
LE697:  lda     SEDORIC_BUF2+2                  ; E697 AD 02 C2                 ...
        bne     LE69F                           ; E69A D0 03                    ..
        dec     SEDORIC_BUF2+3                  ; E69C CE 03 C2                 ...
LE69F:  dec     SEDORIC_BUF2+2                  ; E69F CE 02 C2                 ...
        bit     $2F                             ; E6A2 24 2F                    $/
        bmi     LE6A9                           ; E6A4 30 03                    0.
        jmp     LDC90                           ; E6A6 4C 90 DC                 L..

; ----------------------------------------------------------------------------
LE6A9:  lda     #$60                            ; E6A9 A9 60                    .`
        sta     LDCA8                           ; E6AB 8D A8 DC                 ...
        jsr     LDC90                           ; E6AE 20 90 DC                  ..
        lda     #$A9                            ; E6B1 A9 A9                    ..
        sta     LDCA8                           ; E6B3 8D A8 DC                 ...
        txa                                     ; E6B6 8A                       .
        ldx     #$00                            ; E6B7 A2 00                    ..
        clc                                     ; E6B9 18                       .
        adc     #$F0                            ; E6BA 69 F0                    i.
        bcc     LE6BF                           ; E6BC 90 01                    ..
        inx                                     ; E6BE E8                       .
LE6BF:  stx     SEDORIC_TRAV1                   ; E6BF 86 F3                    ..
        jmp     LDCAD                           ; E6C1 4C AD DC                 L..

; ----------------------------------------------------------------------------
LE6C4:  ror     a                               ; E6C4 6A                       j
        ldx     SEDORIC_TRAV1                   ; E6C5 A6 F3                    ..
        bne     LE6CD                           ; E6C7 D0 04                    ..
        cmp     #$F0                            ; E6C9 C9 F0                    ..
        bcc     LE6DC                           ; E6CB 90 0F                    ..
LE6CD:  bit     $2F                             ; E6CD 24 2F                    $/
        bmi     LE6D4                           ; E6CF 30 03                    0.
        jsr     LE63C                           ; E6D1 20 3C E6                  <.
LE6D4:  sec                                     ; E6D4 38                       8
        sbc     #$F0                            ; E6D5 E9 F0                    ..
LE6D7:  tax                                     ; E6D7 AA                       .
        sec                                     ; E6D8 38                       8
        jmp     LDD0E                           ; E6D9 4C 0E DD                 L..

; ----------------------------------------------------------------------------
LE6DC:  bit     $2F                             ; E6DC 24 2F                    $/
        bpl     LE6D7                           ; E6DE 10 F7                    ..
        jsr     LE63A                           ; E6E0 20 3A E6                  :.
        bcs     LE6D7                           ; E6E3 B0 F2                    ..
LE6E5:  brk                                     ; E6E5 00                       .
        brk                                     ; E6E6 00                       .
        brk                                     ; E6E7 00                       .
        brk                                     ; E6E8 00                       .
        brk                                     ; E6E9 00                       .
        brk                                     ; E6EA 00                       .
        brk                                     ; E6EB 00                       .
        brk                                     ; E6EC 00                       .
        brk                                     ; E6ED 00                       .
        brk                                     ; E6EE 00                       .
        brk                                     ; E6EF 00                       .
        brk                                     ; E6F0 00                       .
        brk                                     ; E6F1 00                       .
        brk                                     ; E6F2 00                       .
        brk                                     ; E6F3 00                       .
        brk                                     ; E6F4 00                       .
        brk                                     ; E6F5 00                       .
        brk                                     ; E6F6 00                       .
        brk                                     ; E6F7 00                       .
        brk                                     ; E6F8 00                       .
        brk                                     ; E6F9 00                       .
        brk                                     ; E6FA 00                       .
        brk                                     ; E6FB 00                       .
        brk                                     ; E6FC 00                       .
        brk                                     ; E6FD 00                       .
        brk                                     ; E6FE 00                       .
        brk                                     ; E6FF 00                       .
        brk                                     ; E700 00                       .
        brk                                     ; E701 00                       .
        brk                                     ; E702 00                       .
        brk                                     ; E703 00                       .
        brk                                     ; E704 00                       .
        brk                                     ; E705 00                       .
        brk                                     ; E706 00                       .
        brk                                     ; E707 00                       .
        brk                                     ; E708 00                       .
        brk                                     ; E709 00                       .
LE70A:  brk                                     ; E70A 00                       .
CMD_KEY:jsr     LE94D                           ; E70B 20 4D E9                  M.
        bcc     LE719                           ; E70E 90 09                    ..
        lda     V1T1L+1                         ; E710 AD 07 03                 ...
        sta     V1T1+1                          ; E713 8D 05 03                 ...
        lda     #$40                            ; E716 A9 40                    .@
        .byte   $2C                             ; E718 2C                       ,
LE719:  lda     #$00                            ; E719 A9 00                    ..
        sta     V1ACR                           ; E71B 8D 0B 03                 ...
LE71E:  rts                                     ; E71E 60                       `

; ----------------------------------------------------------------------------
CMD_OUT:jsr     LD27F                           ; E71F 20 7F D2                  ..
        php                                     ; E722 08                       .
        sei                                     ; E723 78                       x
        stx     V1DRA                           ; E724 8E 01 03                 ...
        lda     V1DRB                           ; E727 AD 00 03                 ...
        and     #$EF                            ; E72A 29 EF                    ).
        sta     V1DRB                           ; E72C 8D 00 03                 ...
        ora     #$10                            ; E72F 09 10                    ..
        sta     V1DRB                           ; E731 8D 00 03                 ...
        plp                                     ; E734 28                       (
        lda     #$02                            ; E735 A9 02                    ..
LE737:  bit     V1IFR                           ; E737 2C 0D 03                 ,..
        beq     LE737                           ; E73A F0 FB                    ..
        rts                                     ; E73C 60                       `

; ----------------------------------------------------------------------------
        .byte   $4C                             ; E73D 4C                       L
        .byte   $23                             ; E73E 23                       #
LE73F:  .byte   $DE                             ; E73F DE                       .
CMD_WIDTH:
        ldy     #$03                            ; E740 A0 03                    ..
LE742:  bit     $06A0                           ; E742 2C A0 06                 ,..
LE745:  bit     $09A0                           ; E745 2C A0 09                 ,..
LE748:  bit     $0CA0                           ; E748 2C A0 0C                 ,..
LE74B:  bit     $0FA0                           ; E74B 2C A0 0F                 ,..
LE74E:  bit     $12A0                           ; E74E 2C A0 12                 ,..
        nop                                     ; E751 EA                       .
        nop                                     ; E752 EA                       .
        nop                                     ; E753 EA                       .
        nop                                     ; E754 EA                       .
        nop                                     ; E755 EA                       .
        nop                                     ; E756 EA                       .
        nop                                     ; E757 EA                       .
        nop                                     ; E758 EA                       .
        nop                                     ; E759 EA                       .
        ldx     #$65                            ; E75A A2 65                    .e
        jmp     LF15E                           ; E75C 4C 5E F1                 L^.

; ----------------------------------------------------------------------------
        nop                                     ; E75F EA                       .
        nop                                     ; E760 EA                       .
        nop                                     ; E761 EA                       .
        nop                                     ; E762 EA                       .
        nop                                     ; E763 EA                       .
        nop                                     ; E764 EA                       .
        nop                                     ; E765 EA                       .
        nop                                     ; E766 EA                       .
        nop                                     ; E767 EA                       .
        nop                                     ; E768 EA                       .
        nop                                     ; E769 EA                       .
        nop                                     ; E76A EA                       .
        nop                                     ; E76B EA                       .
        nop                                     ; E76C EA                       .
        nop                                     ; E76D EA                       .
        nop                                     ; E76E EA                       .
LE76F:  nop                                     ; E76F EA                       .
        ldy     #$03                            ; E770 A0 03                    ..
LE772:  bit     $06A0                           ; E772 2C A0 06                 ,..
LE775:  bit     $09A0                           ; E775 2C A0 09                 ,..
LE778:  bit     $0CA0                           ; E778 2C A0 0C                 ,..
        nop                                     ; E77B EA                       .
        nop                                     ; E77C EA                       .
        nop                                     ; E77D EA                       .
        nop                                     ; E77E EA                       .
        nop                                     ; E77F EA                       .
        nop                                     ; E780 EA                       .
        nop                                     ; E781 EA                       .
        nop                                     ; E782 EA                       .
        nop                                     ; E783 EA                       .
        nop                                     ; E784 EA                       .
        nop                                     ; E785 EA                       .
        nop                                     ; E786 EA                       .
        nop                                     ; E787 EA                       .
        nop                                     ; E788 EA                       .
        nop                                     ; E789 EA                       .
LE78A:  ldx     #$6A                            ; E78A A2 6A                    .j
        jmp     LF15E                           ; E78C 4C 5E F1                 L^.

; ----------------------------------------------------------------------------
        nop                                     ; E78F EA                       .
        nop                                     ; E790 EA                       .
        nop                                     ; E791 EA                       .
        nop                                     ; E792 EA                       .
        nop                                     ; E793 EA                       .
        nop                                     ; E794 EA                       .
LE795:  nop                                     ; E795 EA                       .
CMD_RANDOM:
        beq     LE79E                           ; E796 F0 06                    ..
        jsr     LD216                           ; E798 20 16 D2                  ..
LE79B:  jmp     LD2E2                           ; E79B 4C E2 D2                 L..

; ----------------------------------------------------------------------------
LE79E:  lda     V1T1                            ; E79E AD 04 03                 ...
        ldy     V1T1+1                          ; E7A1 AC 05 03                 ...
        sta     $D0                             ; E7A4 85 D0                    ..
        sty     $D1                             ; E7A6 84 D1                    ..
        lda     V1T2                            ; E7A8 AD 08 03                 ...
        ldy     V1T2+1                          ; E7AB AC 09 03                 ...
        sta     $D2                             ; E7AE 85 D2                    ..
        sty     $D3                             ; E7B0 84 D3                    ..
        jmp     LE79B                           ; E7B2 4C 9B E7                 L..

; ----------------------------------------------------------------------------
LE7B5:  .byte   $4C                             ; E7B5 4C                       L
        .byte   $23                             ; E7B6 23                       #
LE7B7:  .byte   $DE                             ; E7B7 DE                       .
CMD_RESET:
        bne     LE7B5                           ; E7B8 D0 FB                    ..
        sei                                     ; E7BA 78                       x
        lda     #$00                            ; E7BB A9 00                    ..
        .byte   $4C                             ; E7BD 4C                       L
        .byte   $AD                             ; E7BE AD                       .
LE7BF:  .byte   $04                             ; E7BF 04                       .
CMD_PR: jsr     LE94D                           ; E7C0 20 4D E9                  M.
        bcc     LE7D6                           ; E7C3 90 11                    ..
LE7C5:  ldy     SEDORIC_ATMORI                  ; E7C5 AC 24 C0                 .$.
        bne     LE7CD                           ; E7C8 D0 03                    ..
        ror     $02F1                           ; E7CA 6E F1 02                 n..
LE7CD:  jmp     LD1BC                           ; E7CD 4C BC D1                 L..

; ----------------------------------------------------------------------------
CMD_LDIR:
        brk                                     ; E7D0 00                       .
LE7D1:  brk                                     ; E7D1 00                       .
LE7D2:  brk                                     ; E7D2 00                       .
LE7D3:  brk                                     ; E7D3 00                       .
LE7D4:  brk                                     ; E7D4 00                       .
        brk                                     ; E7D5 00                       .
LE7D6:  .byte   $4C                             ; E7D6 4C                       L
        .byte   $C4                             ; E7D7 C4                       .
LE7D8:  .byte   $D1                             ; E7D8 D1                       .
CMD_RESTORE:
        php                                     ; E7D9 08                       .
        ldx     $9A                             ; E7DA A6 9A                    ..
        ldy     $9B                             ; E7DC A4 9B                    ..
        plp                                     ; E7DE 28                       (
        beq     LE7EB                           ; E7DF F0 0A                    ..
        jsr     LD2FA                           ; E7E1 20 FA D2                  ..
        jsr     LD19C                           ; E7E4 20 9C D1                  ..
        ldx     $CE                             ; E7E7 A6 CE                    ..
        ldy     $CF                             ; E7E9 A4 CF                    ..
LE7EB:  txa                                     ; E7EB 8A                       .
        bne     LE7EF                           ; E7EC D0 01                    ..
        dey                                     ; E7EE 88                       .
LE7EF:  dex                                     ; E7EF CA                       .
        stx     $B0                             ; E7F0 86 B0                    ..
        sty     $B1                             ; E7F2 84 B1                    ..
LE7F4:  rts                                     ; E7F4 60                       `

; ----------------------------------------------------------------------------
CMD_QUIT:
        bne     LE7B5                           ; E7F5 D0 BE                    ..
        lda     $043E                           ; E7F7 AD 3E 04                 .>.
        ldy     $043F                           ; E7FA AC 3F 04                 .?.
        sta     BASIC11_INTERPRETER_VECTOR      ; E7FD 85 F0                    ..
        sty     BASIC11_INTERPRETER_VECTOR+1    ; E7FF 84 F1                    ..
        php                                     ; E801 08                       .
        sei                                     ; E802 78                       x
        bit     SEDORIC_ATMORI                  ; E803 2C 24 C0                 ,$.
        bpl     LE828                           ; E806 10 20                    . 
        lda     #$22                            ; E808 A9 22                    ."
        ldy     #$EE                            ; E80A A0 EE                    ..
        sta     BASIC11_IRQ_VECTOR              ; E80C 8D 45 02                 .E.
        sty     BASIC11_IRQ_VECTOR+1            ; E80F 8C 46 02                 .F.
        lda     #$78                            ; E812 A9 78                    .x
        ldy     #$EB                            ; E814 A0 EB                    ..
        sta     BASIC11_KEYBOARD_GET_VECTOR     ; E816 8D 3C 02                 .<.
        sty     BASIC11_KEYBOARD_GET_VECTOR+1   ; E819 8C 3D 02                 .=.
        lda     #$B2                            ; E81C A9 B2                    ..
        ldy     #$F8                            ; E81E A0 F8                    ..
        sta     BASIC11_X                       ; E820 8D 48 02                 .H.
        sty     BASIC11_X+1                     ; E823 8C 49 02                 .I.
        plp                                     ; E826 28                       (
        rts                                     ; E827 60                       `

; ----------------------------------------------------------------------------
LE828:  lda     #$03                            ; E828 A9 03                    ..
        ldy     #$EC                            ; E82A A0 EC                    ..
        sta     BASIC10_IRQ_VECTOR              ; E82C 8D 29 02                 .).
        sty     BASIC10_IRQ_VECTOR+1            ; E82F 8C 2A 02                 .*.
        lda     #$30                            ; E832 A9 30                    .0
        ldy     #$F4                            ; E834 A0 F4                    ..
        sta     BASIC10_IRQ2_VECTOR             ; E836 8D 2C 02                 .,.
        sty     BASIC10_IRQ2_VECTOR+1           ; E839 8C 2D 02                 .-.
        plp                                     ; E83C 28                       (
LE83D:  rts                                     ; E83D 60                       `

; ----------------------------------------------------------------------------
        lda     $C013                           ; E83E AD 13 C0                 ...
        ldy     $C014                           ; E841 AC 14 C0                 ...
        sta     $E9                             ; E844 85 E9                    ..
        sty     $EA                             ; E846 84 EA                    ..
        lda     $C011                           ; E848 AD 11 C0                 ...
        ldy     $C012                           ; E84B AC 12 C0                 ...
        sta     $A8                             ; E84E 85 A8                    ..
        sty     $A9                             ; E850 84 A9                    ..
LE852:  rts                                     ; E852 60                       `

; ----------------------------------------------------------------------------
CMD_STRUN:
        jsr     LD25C                           ; E853 20 5C D2                  \.
        jsr     LD224                           ; E856 20 24 D2                  $.
        jsr     LD274                           ; E859 20 74 D2                  t.
        cmp     #$44                            ; E85C C9 44                    .D
        bcs     LE89A                           ; E85E B0 3A                    .:
        tax                                     ; E860 AA                       .
        tay                                     ; E861 A8                       .
        dey                                     ; E862 88                       .
LE863:  lda     ($91),y                         ; E863 B1 91                    ..
        sta     $35,y                           ; E865 99 35 00                 .5.
        dey                                     ; E868 88                       .
        bpl     LE863                           ; E869 10 F8                    ..
LE86B:  iny                                     ; E86B C8                       .
        lda     LCD10,y                         ; E86C B9 10 CD                 ...
        sta     $35,x                           ; E86F 95 35                    .5
        inx                                     ; E871 E8                       .
        cpy     #$0A                            ; E872 C0 0A                    ..
        bne     LE86B                           ; E874 D0 F5                    ..
        lda     $E9                             ; E876 A5 E9                    ..
        ldy     $EA                             ; E878 A4 EA                    ..
        sta     $C013                           ; E87A 8D 13 C0                 ...
        sty     $C014                           ; E87D 8C 14 C0                 ...
        lda     $A8                             ; E880 A5 A8                    ..
        ldy     $A9                             ; E882 A4 A9                    ..
        sta     $C011                           ; E884 8D 11 C0                 ...
        sty     $C012                           ; E887 8C 12 C0                 ...
        lda     #$34                            ; E88A A9 34                    .4
        ldy     #$00                            ; E88C A0 00                    ..
        ldx     #$3A                            ; E88E A2 3A                    .:
        sta     $E9                             ; E890 85 E9                    ..
        sty     $EA                             ; E892 84 EA                    ..
        stx     $34                             ; E894 86 34                    .4
        dey                                     ; E896 88                       .
        sty     $A9                             ; E897 84 A9                    ..
        rts                                     ; E899 60                       `

; ----------------------------------------------------------------------------
LE89A:  .byte   $4C                             ; E89A 4C                       L
        .byte   $77                             ; E89B 77                       w
LE89C:  .byte   $E9                             ; E89C E9                       .
CMD_TKEN:
        jsr     LD25C                           ; E89D 20 5C D2                  \.
        jsr     LD238                           ; E8A0 20 38 D2                  8.
        jsr     LD274                           ; E8A3 20 74 D2                  t.
        cmp     #$50                            ; E8A6 C9 50                    .P
        bcs     LE89A                           ; E8A8 B0 F0                    ..
        tax                                     ; E8AA AA                       .
        tay                                     ; E8AB A8                       .
LE8AC:  lda     ($91),y                         ; E8AC B1 91                    ..
        sta     $35,y                           ; E8AE 99 35 00                 .5.
        dey                                     ; E8B1 88                       .
        bpl     LE8AC                           ; E8B2 10 F8                    ..
        iny                                     ; E8B4 C8                       .
        sty     $35,x                           ; E8B5 94 35                    .5
        lda     $E9                             ; E8B7 A5 E9                    ..
        pha                                     ; E8B9 48                       H
        lda     #$35                            ; E8BA A9 35                    .5
        sta     $E9                             ; E8BC 85 E9                    ..
        jsr     SEDORIC_ENCODE_KEYWORD          ; E8BE 20 94 D1                  ..
        pla                                     ; E8C1 68                       h
        sta     $E9                             ; E8C2 85 E9                    ..
        tya                                     ; E8C4 98                       .
        sec                                     ; E8C5 38                       8
        sbc     #$05                            ; E8C6 E9 05                    ..
        jsr     LD264                           ; E8C8 20 64 D2                  d.
        ldy     $D0                             ; E8CB A4 D0                    ..
        nop                                     ; E8CD EA                       .
LE8CE:  lda     $35,y                           ; E8CE B9 35 00                 .5.
        sta     ($D1),y                         ; E8D1 91 D1                    ..
        dey                                     ; E8D3 88                       .
        bpl     LE8CE                           ; E8D4 10 F8                    ..
LE8D6:  ldy     #$02                            ; E8D6 A0 02                    ..
LE8D8:  lda     $D0,y                           ; E8D8 B9 D0 00                 ...
        sta     ($B6),y                         ; E8DB 91 B6                    ..
        dey                                     ; E8DD 88                       .
        bpl     LE8D8                           ; E8DE 10 F8                    ..
LE8E0:  rts                                     ; E8E0 60                       `

; ----------------------------------------------------------------------------
CMD_UNTKEN:
        jsr     LD238                           ; E8E1 20 38 D2                  8.
        jsr     LD274                           ; E8E4 20 74 D2                  t.
        tax                                     ; E8E7 AA                       .
        beq     LE8E0                           ; E8E8 F0 F6                    ..
        sta     SEDORIC_TRAV1                   ; E8EA 85 F3                    ..
        ldx     #$00                            ; E8EC A2 00                    ..
        ldy     #$00                            ; E8EE A0 00                    ..
LE8F0:  lda     #$E9                            ; E8F0 A9 E9                    ..
        sta     $16                             ; E8F2 85 16                    ..
        lda     #$C0                            ; E8F4 A9 C0                    ..
        sta     $17                             ; E8F6 85 17                    ..
        sty     SEDORIC_TRAV0                   ; E8F8 84 F2                    ..
        lda     ($91),y                         ; E8FA B1 91                    ..
        bpl     LE929                           ; E8FC 10 2B                    .+
        and     #$7F                            ; E8FE 29 7F                    ).
        beq     LE915                           ; E900 F0 13                    ..
        sta     $26                             ; E902 85 26                    .&
        ldy     #$00                            ; E904 A0 00                    ..
LE906:  inc     $16                             ; E906 E6 16                    ..
        bne     LE90C                           ; E908 D0 02                    ..
        inc     $17                             ; E90A E6 17                    ..
LE90C:  jsr     DO_EXEVEC                       ; E90C 20 53 04                  S.
        bpl     LE906                           ; E90F 10 F5                    ..
        dec     $26                             ; E911 C6 26                    .&
        bne     LE906                           ; E913 D0 F1                    ..
LE915:  ldy     #$01                            ; E915 A0 01                    ..
LE917:  inx                                     ; E917 E8                       .
        beq     LE938                           ; E918 F0 1E                    ..
        jsr     DO_EXEVEC                       ; E91A 20 53 04                  S.
        php                                     ; E91D 08                       .
        and     #$7F                            ; E91E 29 7F                    ).
        sta     $C0FF,x                         ; E920 9D FF C0                 ...
        iny                                     ; E923 C8                       .
        plp                                     ; E924 28                       (
        bpl     LE917                           ; E925 10 F0                    ..
        bmi     LE92F                           ; E927 30 06                    0.
LE929:  inx                                     ; E929 E8                       .
        beq     LE938                           ; E92A F0 0C                    ..
        sta     $C0FF,x                         ; E92C 9D FF C0                 ...
LE92F:  dec     SEDORIC_TRAV1                   ; E92F C6 F3                    ..
        beq     LE93B                           ; E931 F0 08                    ..
        ldy     SEDORIC_TRAV0                   ; E933 A4 F2                    ..
        iny                                     ; E935 C8                       .
        bne     LE8F0                           ; E936 D0 B8                    ..
LE938:  jmp     LE977                           ; E938 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
LE93B:  txa                                     ; E93B 8A                       .
        jsr     LD264                           ; E93C 20 64 D2                  d.
        ldy     $D0                             ; E93F A4 D0                    ..
LE941:  dey                                     ; E941 88                       .
        lda     SEDORIC_BUF1,y                  ; E942 B9 00 C1                 ...
        sta     ($D1),y                         ; E945 91 D1                    ..
        tya                                     ; E947 98                       .
        bne     LE941                           ; E948 D0 F7                    ..
        jmp     LE8D6                           ; E94A 4C D6 E8                 L..

; ----------------------------------------------------------------------------
LE94D:  ldy     #$02                            ; E94D A0 02                    ..
LE94F:  lda     ($E9),y                         ; E94F B1 E9                    ..
        and     #$DF                            ; E951 29 DF                    ).
        cmp     LCD2E,y                         ; E953 D9 2E CD                 ...
        bne     LE95D                           ; E956 D0 05                    ..
        dey                                     ; E958 88                       .
        bpl     LE94F                           ; E959 10 F4                    ..
        bmi     LE96C                           ; E95B 30 0F                    0.
LE95D:  ldy     #$02                            ; E95D A0 02                    ..
LE95F:  lda     ($E9),y                         ; E95F B1 E9                    ..
        and     #$DF                            ; E961 29 DF                    ).
        cmp     LCD2B,y                         ; E963 D9 2B CD                 .+.
        bne     LE974                           ; E966 D0 0C                    ..
        dey                                     ; E968 88                       .
        bpl     LE95F                           ; E969 10 F4                    ..
        clc                                     ; E96B 18                       .
LE96C:  php                                     ; E96C 08                       .
        ldy     #$03                            ; E96D A0 03                    ..
        jsr     LD1E3                           ; E96F 20 E3 D1                  ..
        plp                                     ; E972 28                       (
        rts                                     ; E973 60                       `

; ----------------------------------------------------------------------------
LE974:  jmp     LDE23                           ; E974 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
LE977:  ldx     #$12                            ; E977 A2 12                    ..
        jmp     LD67E                           ; E979 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LE97C:  .byte   $4C                             ; E97C 4C                       L
        .byte   $20                             ; E97D 20                        
LE97E:  .byte   $DE                             ; E97E DE                       .
CMD_ERR:jsr     LE94D                           ; E97F 20 4D E9                  M.
        lda     #$00                            ; E982 A9 00                    ..
        sta     $C01C                           ; E984 8D 1C C0                 ...
        sta     $C01B                           ; E987 8D 1B C0                 ...
        ror     a                               ; E98A 6A                       j
        sta     SEDORIC_FLAGERR                 ; E98B 8D 18 C0                 ...
        ldy     #$37                            ; E98E A0 37                    .7
        ldx     #$FF                            ; E990 A2 FF                    ..
        sty     $C019                           ; E992 8C 19 C0                 ...
        stx     $C01A                           ; E995 8E 1A C0                 ...
LE998:  rts                                     ; E998 60                       `

; ----------------------------------------------------------------------------
CMD_ERRGOTO:
        jsr     LD2FA                           ; E999 20 FA D2                  ..
        sta     $C01C                           ; E99C 8D 1C C0                 ...
        sty     $C01B                           ; E99F 8C 1B C0                 ...
        jsr     LD19C                           ; E9A2 20 9C D1                  ..
        ldx     $CF                             ; E9A5 A6 CF                    ..
        ldy     $CE                             ; E9A7 A4 CE                    ..
        bne     LE9AC                           ; E9A9 D0 01                    ..
        dex                                     ; E9AB CA                       .
LE9AC:  dey                                     ; E9AC 88                       .
        .byte   $4C                             ; E9AD 4C                       L
        .byte   $92                             ; E9AE 92                       .
LE9AF:  .byte   $E9                             ; E9AF E9                       .
CMD_ERROR:
        jsr     LD27F                           ; E9B0 20 7F D2                  ..
        cpx     #$32                            ; E9B3 E0 32                    .2
        bcc     LE97C                           ; E9B5 90 C5                    ..
        dex                                     ; E9B7 CA                       .
        .byte   $4C                             ; E9B8 4C                       L
        .byte   $7E                             ; E9B9 7E                       ~
LE9BA:  .byte   $D6                             ; E9BA D6                       .
CMD_RESUME:
        beq     LE9C3                           ; E9BB F0 06                    ..
        lda     #$90                            ; E9BD A9 90                    ..
        jsr     LD22E                           ; E9BF 20 2E D2                  ..
        iny                                     ; E9C2 C8                       .
LE9C3:  php                                     ; E9C3 08                       .
        lda     $C021                           ; E9C4 AD 21 C0                 .!.
        ldy     $C022                           ; E9C7 AC 22 C0                 .".
        sta     $E9                             ; E9CA 85 E9                    ..
        sty     $EA                             ; E9CC 84 EA                    ..
        lda     SEDORIC_NOLIGN                  ; E9CE AD FE 04                 ...
        ldy     SEDORIC_NOLIGN+1                ; E9D1 AC FF 04                 ...
        sta     $A8                             ; E9D4 85 A8                    ..
        sty     $A9                             ; E9D6 84 A9                    ..
        plp                                     ; E9D8 28                       (
        beq     LE9DE                           ; E9D9 F0 03                    ..
        jmp     LD1DC                           ; E9DB 4C DC D1                 L..

; ----------------------------------------------------------------------------
LE9DE:  dec     $EA                             ; E9DE C6 EA                    ..
        ldy     #$FF                            ; E9E0 A0 FF                    ..
        lda     ($E9),y                         ; E9E2 B1 E9                    ..
        cmp     #$3A                            ; E9E4 C9 3A                    .:
        beq     LE9EA                           ; E9E6 F0 02                    ..
        ldy     #$FB                            ; E9E8 A0 FB                    ..
LE9EA:  .byte   $4C                             ; E9EA 4C                       L
        .byte   $E3                             ; E9EB E3                       .
LE9EC:  .byte   $D1                             ; E9EC D1                       .
CMD_EXT:ldy     #$03                            ; E9ED A0 03                    ..
LE9EF:  .byte   $2C                             ; E9EF 2C                       ,
CMD_VISUHIRES:
        ldy     #$51                            ; E9F0 A0 51                    .Q
LE9F2:  .byte   $2C                             ; E9F2 2C                       ,
CMD_STATUS:
        ldy     #$54                            ; E9F3 A0 54                    .T
LE9F5:  .byte   $2C                             ; E9F5 2C                       ,
CMD_PROT:
        ldy     #$57                            ; E9F6 A0 57                    .W
LE9F8:  .byte   $2C                             ; E9F8 2C                       ,
CMD_UNPROT:
        ldy     #$5A                            ; E9F9 A0 5A                    .Z
LE9FB:  .byte   $2C                             ; E9FB 2C                       ,
CMD_SYSTEM:
        ldy     #$5D                            ; E9FC A0 5D                    .]
LE9FE:  .byte   $2C                             ; E9FE 2C                       ,
CMD_CHKSUM:
        ldy     #$79                            ; E9FF A0 79                    .y
        ldx     #$60                            ; EA01 A2 60                    .`
        jmp     LF15E                           ; EA03 4C 5E F1                 L^.

; ----------------------------------------------------------------------------
LEA06:  ldy     #$02                            ; EA06 A0 02                    ..
        lda     SEDORIC_DRVSYS                  ; EA08 AD 0A C0                 ...
        sta     SEDORIC_DRIVE                   ; EA0B 8D 00 C0                 ...
        lda     #$00                            ; EA0E A9 00                    ..
        jsr     LDA60                           ; EA10 20 60 DA                  `.
        ldx     SEDORIC_BUF2+22                 ; EA13 AE 16 C2                 ...
        bne     LEA1D                           ; EA16 D0 05                    ..
        ldx     SEDORIC_BUF2+218                ; EA18 AE DA C2                 ...
        cpx     #$34                            ; EA1B E0 34                    .4
LEA1D:  rts                                     ; EA1D 60                       `

; ----------------------------------------------------------------------------
LEA1E:  pha                                     ; EA1E 48                       H
        lda     #$20                            ; EA1F A9 20                    . 
        and     V1DRB                           ; EA21 2D 00 03                 -..
        sta     LEA2B                           ; EA24 8D 2B EA                 .+.
        pla                                     ; EA27 68                       h
        and     #$DF                            ; EA28 29 DF                    ).
        .byte   $09                             ; EA2A 09                       .
LEA2B:  brk                                     ; EA2B 00                       .
        sta     V1DRB                           ; EA2C 8D 00 03                 ...
        rts                                     ; EA2F 60                       `

; ----------------------------------------------------------------------------
LEA30:  inx                                     ; EA30 E8                       .
        stx     SEDORIC_TRAV0                   ; EA31 86 F2                    ..
        ldx     #$3F                            ; EA33 A2 3F                    .?
        rts                                     ; EA35 60                       `

; ----------------------------------------------------------------------------
LEA36:  stx     $30                             ; EA36 86 30                    .0
        .byte   $4C                             ; EA38 4C                       L
        .byte   $3E                             ; EA39 3E                       >
LEA3A:  .byte   $D7                             ; EA3A D7                       .
CMD_SWAP:
        jsr     LD238                           ; EA3B 20 38 D2                  8.
        sta     $B8                             ; EA3E 85 B8                    ..
        sty     $B9                             ; EA40 84 B9                    ..
        lda     $28                             ; EA42 A5 28                    .(
        pha                                     ; EA44 48                       H
        lda     $29                             ; EA45 A5 29                    .)
LEA47:  pha                                     ; EA47 48                       H
        jsr     LD22C                           ; EA48 20 2C D2                  ,.
        jsr     LD238                           ; EA4B 20 38 D2                  8.
        sta     $91                             ; EA4E 85 91                    ..
        sty     $92                             ; EA50 84 92                    ..
        pla                                     ; EA52 68                       h
        cmp     $29                             ; EA53 C5 29                    .)
        bne     LEA77                           ; EA55 D0 20                    . 
        pla                                     ; EA57 68                       h
        cmp     $28                             ; EA58 C5 28                    .(
        bne     LEA77                           ; EA5A D0 1B                    ..
        ldy     #$01                            ; EA5C A0 01                    ..
        bit     $28                             ; EA5E 24 28                    $(
        bmi     LEA68                           ; EA60 30 06                    0.
        bit     $29                             ; EA62 24 29                    $)
        bmi     LEA69                           ; EA64 30 03                    0.
        iny                                     ; EA66 C8                       .
        iny                                     ; EA67 C8                       .
LEA68:  iny                                     ; EA68 C8                       .
LEA69:  lda     ($91),y                         ; EA69 B1 91                    ..
        tax                                     ; EA6B AA                       .
        lda     ($B8),y                         ; EA6C B1 B8                    ..
        sta     ($91),y                         ; EA6E 91 91                    ..
        txa                                     ; EA70 8A                       .
        sta     ($B8),y                         ; EA71 91 B8                    ..
        dey                                     ; EA73 88                       .
        bpl     LEA69                           ; EA74 10 F3                    ..
        rts                                     ; EA76 60                       `

; ----------------------------------------------------------------------------
LEA77:  ldx     #$0B                            ; EA77 A2 0B                    ..
        jmp     LD67E                           ; EA79 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LEA7C:  .byte   $4C                             ; EA7C 4C                       L
        .byte   $20                             ; EA7D 20                        
LEA7E:  .byte   $DE                             ; EA7E DE                       .
CMD_USER:
        jsr     LD27F                           ; EA7F 20 7F D2                  ..
        txa                                     ; EA82 8A                       .
        cmp     #$04                            ; EA83 C9 04                    ..
        bcs     LEA7C                           ; EA85 B0 F5                    ..
        asl     a                               ; EA87 0A                       .
        adc     $D4                             ; EA88 65 D4                    e.
        sta     SEDORIC_TRAV4                   ; EA8A 85 F6                    ..
        tax                                     ; EA8C AA                       .
        lda     SEDORIC_USER_COMMAND_1_VECTOR+2,x; EA8D BD 68 C0                .h.
        sta     SEDORIC_TRAV5                   ; EA90 85 F7                    ..
        lda     #$00                            ; EA92 A9 00                    ..
        ldx     #$03                            ; EA94 A2 03                    ..
LEA96:  sta     SEDORIC_TRAV0,x                 ; EA96 95 F2                    ..
        dex                                     ; EA98 CA                       .
        bpl     LEA96                           ; EA99 10 FB                    ..
LEA9B:  jsr     LD39E                           ; EA9B 20 9E D3                  ..
        cmp     #$2C                            ; EA9E C9 2C                    .,
        bne     LEAE8                           ; EAA0 D0 46                    .F
        jsr     LD398                           ; EAA2 20 98 D3                  ..
        ldy     #$04                            ; EAA5 A0 04                    ..
LEAA7:  cmp     MISC2,y                         ; EAA7 D9 83 CD                 ...
        beq     LEAB1                           ; EAAA F0 05                    ..
        dey                                     ; EAAC 88                       .
        bpl     LEAA7                           ; EAAD 10 F8                    ..
        bmi     LEAE8                           ; EAAF 30 37                    07
LEAB1:  jsr     LD398                           ; EAB1 20 98 D3                  ..
        cpy     #$04                            ; EAB4 C0 04                    ..
        bne     LEADA                           ; EAB6 D0 22                    ."
        jsr     LD2FA                           ; EAB8 20 FA D2                  ..
        ldx     SEDORIC_TRAV4                   ; EABB A6 F6                    ..
        sta     SEDORIC_USER_COMMAND_1_VECTOR+1,x; EABD 9D 67 C0                .g.
        tya                                     ; EAC0 98                       .
        sta     SEDORIC_USER_COMMAND_1_VECTOR,x ; EAC1 9D 66 C0                 .f.
        jsr     LD39E                           ; EAC4 20 9E D3                  ..
        beq     LEAD3                           ; EAC7 F0 0A                    ..
        jsr     LD22C                           ; EAC9 20 2C D2                  ,.
        lda     #$4F                            ; EACC A9 4F                    .O
        jsr     LD22E                           ; EACE 20 2E D2                  ..
        ldx     #$80                            ; EAD1 A2 80                    ..
LEAD3:  txa                                     ; EAD3 8A                       .
        ldx     SEDORIC_TRAV4                   ; EAD4 A6 F6                    ..
        sta     SEDORIC_USER_COMMAND_1_VECTOR+2,x; EAD6 9D 68 C0                .h.
        rts                                     ; EAD9 60                       `

; ----------------------------------------------------------------------------
LEADA:  tya                                     ; EADA 98                       .
        pha                                     ; EADB 48                       H
        jsr     LD27F                           ; EADC 20 7F D2                  ..
        pla                                     ; EADF 68                       h
        tay                                     ; EAE0 A8                       .
        stx     SEDORIC_TRAV0,y                 ; EAE1 96 F2                    ..
        jsr     LD39E                           ; EAE3 20 9E D3                  ..
        bne     LEA9B                           ; EAE6 D0 B3                    ..
LEAE8:  ldy     SEDORIC_TRAV2                   ; EAE8 A4 F4                    ..
LEAEA:  lda     SEDORIC_TRAV3                   ; EAEA A5 F5                    ..
        pha                                     ; EAEC 48                       H
        ldx     SEDORIC_TRAV4                   ; EAED A6 F6                    ..
        lda     SEDORIC_USER_COMMAND_1_VECTOR,x ; EAEF BD 66 C0                 .f.
        sta     SEDORIC_EXEVEC+1                ; EAF2 8D F0 04                 ...
        lda     SEDORIC_USER_COMMAND_1_VECTOR+1,x; EAF5 BD 67 C0                .g.
        sta     SEDORIC_EXEVEC+2                ; EAF8 8D F1 04                 ...
        lda     SEDORIC_TRAV0                   ; EAFB A5 F2                    ..
        ldx     SEDORIC_TRAV1                   ; EAFD A6 F3                    ..
        bit     $00                             ; EAFF 24 00                    $.
        brk                                     ; EB01 00                       .
        .byte   $07                             ; EB02 07                       .
        plp                                     ; EB03 28                       (
        jsr     LEB22                           ; EB04 20 22 EB                  ".
        jmp     LEB0E                           ; EB07 4C 0E EB                 L..

; ----------------------------------------------------------------------------
        plp                                     ; EB0A 28                       (
        jsr     L0471                           ; EB0B 20 71 04                  q.
LEB0E:  pha                                     ; EB0E 48                       H
        php                                     ; EB0F 08                       .
        txa                                     ; EB10 8A                       .
        pha                                     ; EB11 48                       H
        tya                                     ; EB12 98                       .
        jsr     LD7CF                           ; EB13 20 CF D7                  ..
        pla                                     ; EB16 68                       h
        jsr     LD7CC                           ; EB17 20 CC D7                  ..
        pla                                     ; EB1A 68                       h
        jsr     LD7D2                           ; EB1B 20 D2 D7                  ..
        pla                                     ; EB1E 68                       h
        jmp     LD7C9                           ; EB1F 4C C9 D7                 L..

; ----------------------------------------------------------------------------
LEB22:  jmp     (SEDORIC_EXEVEC+1)              ; EB22 6C F0 04                 l..

; ----------------------------------------------------------------------------
CMD_NUM:inc     SEDORIC_BUF2+11                 ; EB25 EE 0B C2                 ...
        bne     LEB2D                           ; EB28 D0 03                    ..
        inc     SEDORIC_BUF2+12                 ; EB2A EE 0C C2                 ...
LEB2D:  ldy     #$F4                            ; EB2D A0 F4                    ..
LEB2F:  lda     $BF35,y                         ; EB2F B9 35 BF                 .5.
        cmp     #$3F                            ; EB32 C9 3F                    .?
        beq     LEB3B                           ; EB34 F0 05                    ..
        .byte   $DD                             ; EB36 DD                       .
        brk                                     ; EB37 00                       .
LEB38:  .byte   $C3                             ; EB38 C3                       .
        bne     LEB43                           ; EB39 D0 08                    ..
LEB3B:  inx                                     ; EB3B E8                       .
        iny                                     ; EB3C C8                       .
        bne     LEB2F                           ; EB3D D0 F0                    ..
        ldx     $C027                           ; EB3F AE 27 C0                 .'.
        rts                                     ; EB42 60                       `

; ----------------------------------------------------------------------------
LEB43:  jmp     LDB41                           ; EB43 4C 41 DB                 LA.

; ----------------------------------------------------------------------------
        iny                                     ; EB46 C8                       .
        inx                                     ; EB47 E8                       .
        cpx     #$08                            ; EB48 E0 08                    ..
        beq     LEB4E                           ; EB4A F0 02                    ..
        bne     LEB38                           ; EB4C D0 EA                    ..
LEB4E:  lda     #$3E                            ; EB4E A9 3E                    .>
        sta     LD9E2,x                         ; EB50 9D E2 D9                 ...
        inx                                     ; EB53 E8                       .
        lda     #$00                            ; EB54 A9 00                    ..
        sta     LD9E2,x                         ; EB56 9D E2 D9                 ...
        lda     #$E0                            ; EB59 A9 E0                    ..
        ldy     #$D9                            ; EB5B A0 D9                    ..
        jsr     XAFSTR                          ; EB5D 20 37 D6                  7.
        rts                                     ; EB60 60                       `

; ----------------------------------------------------------------------------
        ora     $3F0A                           ; EB61 0D 0A 3F                 ..?
        lsr     $544F                           ; EB64 4E 4F 54                 NOT
        jsr     L4D45                           ; EB67 20 45 4D                  EM
        bvc     LEBC0                           ; EB6A 50 54                    PT
        eor     $4420,y                         ; EB6C 59 20 44                 Y D
        eor     #$52                            ; EB6F 49 52                    IR
        eor     $43                             ; EB71 45 43                    EC
        .byte   $54                             ; EB73 54                       T
        .byte   $4F                             ; EB74 4F                       O
        .byte   $52                             ; EB75 52                       R
        cmp     LEAEA,y                         ; EB76 D9 EA EA                 ...
        nop                                     ; EB79 EA                       .
        nop                                     ; EB7A EA                       .
        nop                                     ; EB7B EA                       .
        nop                                     ; EB7C EA                       .
        nop                                     ; EB7D EA                       .
        nop                                     ; EB7E EA                       .
        nop                                     ; EB7F EA                       .
        nop                                     ; EB80 EA                       .
        nop                                     ; EB81 EA                       .
        nop                                     ; EB82 EA                       .
        nop                                     ; EB83 EA                       .
        nop                                     ; EB84 EA                       .
        nop                                     ; EB85 EA                       .
        nop                                     ; EB86 EA                       .
        nop                                     ; EB87 EA                       .
        nop                                     ; EB88 EA                       .
        nop                                     ; EB89 EA                       .
        nop                                     ; EB8A EA                       .
        nop                                     ; EB8B EA                       .
        nop                                     ; EB8C EA                       .
        nop                                     ; EB8D EA                       .
        nop                                     ; EB8E EA                       .
        nop                                     ; EB8F EA                       .
LEB90:  nop                                     ; EB90 EA                       .
CMD_ACCENT:
        jsr     LE94D                           ; EB91 20 4D E9                  M.
        jsr     LDFDE                           ; EB94 20 DE DF                  ..
        lda     SEDORIC_MODCLA                  ; EB97 AD 3D C0                 .=.
        and     #$80                            ; EB9A 29 80                    ).
        bcc     LEBA0                           ; EB9C 90 02                    ..
        ora     #$40                            ; EB9E 09 40                    .@
LEBA0:  sta     SEDORIC_MODCLA                  ; EBA0 8D 3D C0                 .=.
; XCHAR sélectionne le jeu de caractères correct (“normal” ou “accentué”) selon MODCLA. Suite commune aux commandes ACCENT, AZERTY, QWERTY et à la routine XSTATUS en EC17
SEDORIC_XCHAR:
        bit     SEDORIC_MODCLA                  ; EBA3 2C 3D C0                 ,=.
        bvs     LEBAD                           ; EBA6 70 05                    p.
        ldx     #$05                            ; EBA8 A2 05                    ..
        jmp     LD332                           ; EBAA 4C 32 D3                 L2.

; ----------------------------------------------------------------------------
LEBAD:  lda     #$06                            ; EBAD A9 06                    ..
        sta     SEDORIC_TRAV0                   ; EBAF 85 F2                    ..
        ldx     #$00                            ; EBB1 A2 00                    ..
LEBB3:  lda     #$08                            ; EBB3 A9 08                    ..
        sta     SEDORIC_TRAV1                   ; EBB5 85 F3                    ..
        sta     SEDORIC_TRAV3                   ; EBB7 85 F5                    ..
        lda     ACCENTED_FONT,x                 ; EBB9 BD 4D CD                 .M.
        inx                                     ; EBBC E8                       .
        asl     a                               ; EBBD 0A                       .
        asl     a                               ; EBBE 0A                       .
        .byte   $26                             ; EBBF 26                       &
LEBC0:  sbc     $0A,x                           ; EBC0 F5 0A                    ..
        rol     SEDORIC_TRAV3                   ; EBC2 26 F5                    &.
        sta     SEDORIC_TRAV2                   ; EBC4 85 F4                    ..
        lda     SEDORIC_TRAV3                   ; EBC6 A5 F5                    ..
        adc     #$94                            ; EBC8 69 94                    i.
        sta     SEDORIC_TRAV3                   ; EBCA 85 F5                    ..
        ldy     #$00                            ; EBCC A0 00                    ..
LEBCE:  lda     ACCENTED_FONT,x                 ; EBCE BD 4D CD                 .M.
        sta     (SEDORIC_TRAV2),y               ; EBD1 91 F4                    ..
        inx                                     ; EBD3 E8                       .
        iny                                     ; EBD4 C8                       .
        dec     SEDORIC_TRAV1                   ; EBD5 C6 F3                    ..
        bne     LEBCE                           ; EBD7 D0 F5                    ..
        dec     SEDORIC_TRAV0                   ; EBD9 C6 F2                    ..
        bne     LEBB3                           ; EBDB D0 D6                    ..
LEBDD:  rts                                     ; EBDD 60                       `

; ----------------------------------------------------------------------------
CMD_AZERTY:
        lda     #$C0                            ; EBDE A9 C0                    ..
LEBE0:  .byte   $2C                             ; EBE0 2C                       ,
CMD_QWERTY:
        lda     #$00                            ; EBE1 A9 00                    ..
        sta     SEDORIC_MODCLA                  ; EBE3 8D 3D C0                 .=.
        jsr     LDFDE                           ; EBE6 20 DE DF                  ..
        .byte   $4C                             ; EBE9 4C                       L
        .byte   $A3                             ; EBEA A3                       .
LEBEB:  .byte   $EB                             ; EBEB EB                       .
CMD_LCUR:
        lda     BASIC11_Y_TEXT                  ; EBEC AD 69 02                 .i.
        ldy     BASIC11_X_TEXT                  ; EBEF AC 68 02                 .h.
        .byte   $4C                             ; EBF2 4C                       L
        .byte   $FB                             ; EBF3 FB                       .
LEBF4:  .byte   $EB                             ; EBF4 EB                       .
CMD_HCUR:
        lda     $0219                           ; EBF5 AD 19 02                 ...
        ldy     $021A                           ; EBF8 AC 1A 02                 ...
        pha                                     ; EBFB 48                       H
        tya                                     ; EBFC 98                       .
        jsr     LD7E7                           ; EBFD 20 E7 D7                  ..
        pla                                     ; EC00 68                       h
        .byte   $4C                             ; EC01 4C                       L
        .byte   $E4                             ; EC02 E4                       .
LEC03:  .byte   $D7                             ; EC03 D7                       .
CMD_LBRACKET:
        php                                     ; EC04 08                       .
        pha                                     ; EC05 48                       H
        lda     $02F9                           ; EC06 AD F9 02                 ...
        ldy     $02FA                           ; EC09 AC FA 02                 ...
        sta     SEDORIC_EXEVEC+1                ; EC0C 8D F0 04                 ...
        sty     SEDORIC_EXEVEC+2                ; EC0F 8C F1 04                 ...
        pla                                     ; EC12 68                       h
        plp                                     ; EC13 28                       (
        jmp     SEDORIC_EXERAM                  ; EC14 4C EC 04                 L..

; ----------------------------------------------------------------------------
        lda     #$10                            ; EC17 A9 10                    ..
        ldy     #$07                            ; EC19 A0 07                    ..
        sta     $026B                           ; EC1B 8D 6B 02                 .k.
        sty     $026C                           ; EC1E 8C 6C 02                 .l.
        lda     #$0F                            ; EC21 A9 0F                    ..
        sta     BASIC11_FLG                     ; EC23 8D 6A 02                 .j.
        lda     #$0C                            ; EC26 A9 0C                    ..
        jsr     XAFCAR                          ; EC28 20 2A D6                  *.
        .byte   $4C                             ; EC2B 4C                       L
        .byte   $A3                             ; EC2C A3                       .
LEC2D:  .byte   $EB                             ; EC2D EB                       .
CMD_INSTR:
        jsr     LD224                           ; EC2E 20 24 D2                  $.
        jsr     LD274                           ; EC31 20 74 D2                  t.
        sta     SEDORIC_TRAV0                   ; EC34 85 F2                    ..
        tay                                     ; EC36 A8                       .
LEC37:  dey                                     ; EC37 88                       .
        lda     ($91),y                         ; EC38 B1 91                    ..
        sta     SEDORIC_BUF1,y                  ; EC3A 99 00 C1                 ...
        tya                                     ; EC3D 98                       .
        bne     LEC37                           ; EC3E D0 F7                    ..
        jsr     LD22C                           ; EC40 20 2C D2                  ,.
        jsr     LD224                           ; EC43 20 24 D2                  $.
        jsr     LD274                           ; EC46 20 74 D2                  t.
        sta     SEDORIC_TRAV1                   ; EC49 85 F3                    ..
        stx     $B8                             ; EC4B 86 B8                    ..
        sty     $B9                             ; EC4D 84 B9                    ..
        jsr     LD22C                           ; EC4F 20 2C D2                  ,.
        jsr     LD27F                           ; EC52 20 7F D2                  ..
        bne     LEC8E                           ; EC55 D0 37                    .7
        dex                                     ; EC57 CA                       .
        stx     SEDORIC_TRAV4                   ; EC58 86 F6                    ..
        cpx     SEDORIC_TRAV0                   ; EC5A E4 F2                    ..
        bcs     LEC91                           ; EC5C B0 33                    .3
        lda     SEDORIC_TRAV0                   ; EC5E A5 F2                    ..
        beq     LEC7E                           ; EC60 F0 1C                    ..
LEC62:  ldx     SEDORIC_TRAV1                   ; EC62 A6 F3                    ..
        beq     LEC7E                           ; EC64 F0 18                    ..
        lda     SEDORIC_TRAV4                   ; EC66 A5 F6                    ..
        sta     SEDORIC_TRAV5                   ; EC68 85 F7                    ..
        lda     #$C1                            ; EC6A A9 C1                    ..
        sta     SEDORIC_TRAV6                   ; EC6C 85 F8                    ..
        ldy     #$00                            ; EC6E A0 00                    ..
LEC70:  lda     (SEDORIC_TRAV5),y               ; EC70 B1 F7                    ..
        cmp     ($B8),y                         ; EC72 D1 B8                    ..
        bne     LEC84                           ; EC74 D0 0E                    ..
        iny                                     ; EC76 C8                       .
        dex                                     ; EC77 CA                       .
        bne     LEC70                           ; EC78 D0 F6                    ..
        ldy     SEDORIC_TRAV4                   ; EC7A A4 F6                    ..
        iny                                     ; EC7C C8                       .
        .byte   $2C                             ; EC7D 2C                       ,
LEC7E:  ldy     #$00                            ; EC7E A0 00                    ..
        tya                                     ; EC80 98                       .
        jmp     LD7DB                           ; EC81 4C DB D7                 L..

; ----------------------------------------------------------------------------
LEC84:  inc     SEDORIC_TRAV4                   ; EC84 E6 F6                    ..
        lda     SEDORIC_TRAV4                   ; EC86 A5 F6                    ..
        cmp     SEDORIC_TRAV0                   ; EC88 C5 F2                    ..
        beq     LEC7E                           ; EC8A F0 F2                    ..
        bne     LEC62                           ; EC8C D0 D4                    ..
LEC8E:  jmp     LDE23                           ; EC8E 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
LEC91:  .byte   $4C                             ; EC91 4C                       L
        .byte   $20                             ; EC92 20                        
LEC93:  .byte   $DE                             ; EC93 DE                       .
CMD_LINPUT:
        tax                                     ; EC94 AA                       .
        lda     BASIC11_FLG                     ; EC95 AD 6A 02                 .j.
        pha                                     ; EC98 48                       H
        cpx     #$C6                            ; EC99 E0 C6                    ..
        bne     LECBB                           ; EC9B D0 1E                    ..
        jsr     LD398                           ; EC9D 20 98 D3                  ..
        jsr     XCUROFF                         ; ECA0 20 40 D7                  @.
        jsr     LD292                           ; ECA3 20 92 D2                  ..
        ldy     $20                             ; ECA6 A4 20                    . 
        sta     $12                             ; ECA8 85 12                    ..
        sty     $13                             ; ECAA 84 13                    ..
        stx     BASIC11_X_TEXT                  ; ECAC 8E 68 02                 .h.
        ldx     $02F8                           ; ECAF AE F8 02                 ...
        stx     BASIC11_Y_TEXT                  ; ECB2 8E 69 02                 .i.
        jsr     LEA36                           ; ECB5 20 36 EA                  6.
        jsr     LD22C                           ; ECB8 20 2C D2                  ,.
LECBB:  jsr     LD224                           ; ECBB 20 24 D2                  $.
        bit     $28                             ; ECBE 24 28                    $(
        bpl     LECD7                           ; ECC0 10 15                    ..
        jsr     LD277                           ; ECC2 20 77 D2                  w.
        beq     LECCC                           ; ECC5 F0 05                    ..
        ldy     #$00                            ; ECC7 A0 00                    ..
        lda     ($91),y                         ; ECC9 B1 91                    ..
        .byte   $2C                             ; ECCB 2C                       ,
LECCC:  lda     #$2E                            ; ECCC A9 2E                    ..
        sta     SEDORIC_BACKUP_CHAR_LINPUT      ; ECCE 8D 75 C0                 .u.
        jsr     LD22C                           ; ECD1 20 2C D2                  ,.
        jsr     LD224                           ; ECD4 20 24 D2                  $.
LECD7:  jsr     LD219                           ; ECD7 20 19 D2                  ..
        jsr     LD282                           ; ECDA 20 82 D2                  ..
        txa                                     ; ECDD 8A                       .
        beq     LED2B                           ; ECDE F0 4B                    .K
        stx     SEDORIC_TRAV0                   ; ECE0 86 F2                    ..
        lda     #$3B                            ; ECE2 A9 3B                    .;
        jsr     LD22E                           ; ECE4 20 2E D2                  ..
        sty     SEDORIC_TRAV1                   ; ECE7 84 F3                    ..
        jsr     LED2E                           ; ECE9 20 2E ED                  ..
        jsr     LD21B                           ; ECEC 20 1B D2                  ..
        jsr     LD39E                           ; ECEF 20 9E D3                  ..
        beq     LED19                           ; ECF2 F0 25                    .%
LECF4:  jsr     LD22C                           ; ECF4 20 2C D2                  ,.
        jsr     LD3A1                           ; ECF7 20 A1 D3                  ..
        ldx     #$04                            ; ECFA A2 04                    ..
        stx     SEDORIC_TRAV2                   ; ECFC 86 F4                    ..
LECFE:  asl     SEDORIC_TRAV2                   ; ECFE 06 F4                    ..
        cmp     LCDBA,x                         ; ED00 DD BA CD                 ...
        beq     LED0A                           ; ED03 F0 05                    ..
        dex                                     ; ED05 CA                       .
        bpl     LECFE                           ; ED06 10 F6                    ..
        bmi     LED28                           ; ED08 30 1E                    0.
LED0A:  lda     SEDORIC_TRAV2                   ; ED0A A5 F4                    ..
        eor     SEDORIC_TRAV1                   ; ED0C 45 F3                    E.
        cmp     SEDORIC_TRAV1                   ; ED0E C5 F3                    ..
        bcc     LED28                           ; ED10 90 16                    ..
        sta     SEDORIC_TRAV1                   ; ED12 85 F3                    ..
        jsr     LD398                           ; ED14 20 98 D3                  ..
        bne     LECF4                           ; ED17 D0 DB                    ..
LED19:  jsr     LED36                           ; ED19 20 36 ED                  6.
        jsr     LEE8E                           ; ED1C 20 8E EE                  ..
        pla                                     ; ED1F 68                       h
        sta     BASIC11_FLG                     ; ED20 8D 6A 02                 .j.
        lda     SEDORIC_TRAV2                   ; ED23 A5 F4                    ..
        jmp     LD7D8                           ; ED25 4C D8 D7                 L..

; ----------------------------------------------------------------------------
LED28:  jmp     LDE23                           ; ED28 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
LED2B:  jmp     LDE20                           ; ED2B 4C 20 DE                 L .

; ----------------------------------------------------------------------------
LED2E:  jsr     LD238                           ; ED2E 20 38 D2                  8.
        sta     $B8                             ; ED31 85 B8                    ..
        sty     $B9                             ; ED33 84 B9                    ..
        rts                                     ; ED35 60                       `

; ----------------------------------------------------------------------------
LED36:  lda     SEDORIC_TRAV1                   ; ED36 A5 F3                    ..
        and     #$08                            ; ED38 29 08                    ).
        bne     LED52                           ; ED3A D0 16                    ..
LED3C:  jsr     XCUROFF                         ; ED3C 20 40 D7                  @.
        ldx     SEDORIC_TRAV0                   ; ED3F A6 F2                    ..
        lda     SEDORIC_BACKUP_CHAR_LINPUT      ; ED41 AD 75 C0                 .u.
LED44:  jsr     XAFCAR                          ; ED44 20 2A D6                  *.
        dex                                     ; ED47 CA                       .
        bne     LED44                           ; ED48 D0 FA                    ..
LED4A:  jsr     XCUROFF                         ; ED4A 20 40 D7                  @.
        ldx     SEDORIC_TRAV0                   ; ED4D A6 F2                    ..
        jsr     LEE69                           ; ED4F 20 69 EE                  i.
LED52:  jsr     XCURON                          ; ED52 20 3E D7                  >.
        ldx     #$00                            ; ED55 A2 00                    ..
        ldy     #$26                            ; ED57 A0 26                    .&
        lda     BASIC11_FLG                     ; ED59 AD 6A 02                 .j.
        and     #$20                            ; ED5C 29 20                    ) 
        beq     LED62                           ; ED5E F0 02                    ..
        ldy     #$28                            ; ED60 A0 28                    .(
LED62:  sty     SEDORIC_TRAV3                   ; ED62 84 F5                    ..
LED64:  jsr     LD843                           ; ED64 20 43 D8                  C.
        bpl     LED64                           ; ED67 10 FB                    ..
        cmp     #$14                            ; ED69 C9 14                    ..
        beq     LED90                           ; ED6B F0 23                    .#
        cmp     #$7F                            ; ED6D C9 7F                    ..
        bne     LED7F                           ; ED6F D0 0E                    ..
        txa                                     ; ED71 8A                       .
        beq     LED64                           ; ED72 F0 F0                    ..
        jsr     LEE73                           ; ED74 20 73 EE                  s.
        lda     SEDORIC_BACKUP_CHAR_LINPUT      ; ED77 AD 75 C0                 .u.
        jsr     XAFCAR                          ; ED7A 20 2A D6                  *.
        lda     #$08                            ; ED7D A9 08                    ..
LED7F:  cmp     #$0E                            ; ED7F C9 0E                    ..
        bne     LED88                           ; ED81 D0 05                    ..
        jsr     LEE69                           ; ED83 20 69 EE                  i.
        beq     LED3C                           ; ED86 F0 B4                    ..
LED88:  cmp     #$04                            ; ED88 C9 04                    ..
        beq     LED90                           ; ED8A F0 04                    ..
        cmp     #$1A                            ; ED8C C9 1A                    ..
        bne     LED95                           ; ED8E D0 05                    ..
LED90:  jsr     XAFCAR                          ; ED90 20 2A D6                  *.
LED93:  bne     LED64                           ; ED93 D0 CF                    ..
LED95:  cmp     #$20                            ; ED95 C9 20                    . 
        bcc     LEDAD                           ; ED97 90 14                    ..
        jsr     XAFCAR                          ; ED99 20 2A D6                  *.
        inx                                     ; ED9C E8                       .
        cpx     SEDORIC_TRAV0                   ; ED9D E4 F2                    ..
        bne     LED64                           ; ED9F D0 C3                    ..
        bit     SEDORIC_TRAV1                   ; EDA1 24 F3                    $.
        bvc     LED4A                           ; EDA3 50 A5                    P.
        dex                                     ; EDA5 CA                       .
        jsr     LEE73                           ; EDA6 20 73 EE                  s.
        ldy     #$06                            ; EDA9 A0 06                    ..
        bne     LEE04                           ; EDAB D0 57                    .W
LEDAD:  ldy     #$00                            ; EDAD A0 00                    ..
        cmp     #$0D                            ; EDAF C9 0D                    ..
        beq     LEDFC                           ; EDB1 F0 49                    .I
        iny                                     ; EDB3 C8                       .
        cmp     #$1B                            ; EDB4 C9 1B                    ..
        beq     LEDFC                           ; EDB6 F0 44                    .D
        iny                                     ; EDB8 C8                       .
        cmp     #$08                            ; EDB9 C9 08                    ..
        bne     SEDORIC_STR_NOT_ALLOWED         ; EDBB D0 09                    ..
        txa                                     ; EDBD 8A                       .
        beq     LEDFC                           ; EDBE F0 3C                    .<
        dex                                     ; EDC0 CA                       .
        jsr     LEE73                           ; EDC1 20 73 EE                  s.
        bne     LED64                           ; EDC4 D0 9E                    ..
; X
SEDORIC_STR_NOT_ALLOWED:
        .byte   $C8,$C9,$09,$D0,$0E,$E8,$E4,$F2 ; EDC6 C8 C9 09 D0 0E E8 E4 F2  ........
        .byte   $F0,$05                         ; EDCE F0 05                    ..
        .byte   " "                             ; EDD0 20                        
; ----------------------------------------------------------------------------
        ror     $EE,x                           ; EDD1 76 EE                    v.
        bne     LED93                           ; EDD3 D0 BE                    ..
        dex                                     ; EDD5 CA                       .
        jmp     LEDFC                           ; EDD6 4C FC ED                 L..

; ----------------------------------------------------------------------------
        iny                                     ; EDD9 C8                       .
        cmp     #$0A                            ; EDDA C9 0A                    ..
        bne     LEDED                           ; EDDC D0 0F                    ..
        clc                                     ; EDDE 18                       .
        txa                                     ; EDDF 8A                       .
LEDE0:  adc     SEDORIC_TRAV3                   ; EDE0 65 F5                    e.
        bcs     LEDFC                           ; EDE2 B0 18                    ..
        cmp     SEDORIC_TRAV0                   ; EDE4 C5 F2                    ..
        bcs     LEDFC                           ; EDE6 B0 14                    ..
        tax                                     ; EDE8 AA                       .
        lda     #$0A                            ; EDE9 A9 0A                    ..
        bne     LED90                           ; EDEB D0 A3                    ..
LEDED:  iny                                     ; EDED C8                       .
        cmp     #$0B                            ; EDEE C9 0B                    ..
        bne     LED93                           ; EDF0 D0 A1                    ..
        txa                                     ; EDF2 8A                       .
        sbc     SEDORIC_TRAV3                   ; EDF3 E5 F5                    ..
        bcc     LEDFC                           ; EDF5 90 05                    ..
        tax                                     ; EDF7 AA                       .
        lda     #$0B                            ; EDF8 A9 0B                    ..
        bne     LED90                           ; EDFA D0 94                    ..
LEDFC:  cpy     #$02                            ; EDFC C0 02                    ..
        bcc     LEE04                           ; EDFE 90 04                    ..
        lda     SEDORIC_TRAV1                   ; EE00 A5 F3                    ..
        bmi     LED93                           ; EE02 30 8F                    0.
LEE04:  sty     SEDORIC_TRAV2                   ; EE04 84 F4                    ..
        jsr     XCUROFF                         ; EE06 20 40 D7                  @.
LEE09:  inx                                     ; EE09 E8                       .
        cpx     SEDORIC_TRAV0                   ; EE0A E4 F2                    ..
        bcs     LEE13                           ; EE0C B0 05                    ..
        jsr     LEE76                           ; EE0E 20 76 EE                  v.
        bne     LEE09                           ; EE11 D0 F6                    ..
LEE13:  lda     SEDORIC_TRAV0                   ; EE13 A5 F2                    ..
        jsr     LD264                           ; EE15 20 64 D2                  d.
        ldy     SEDORIC_TRAV0                   ; EE18 A4 F2                    ..
LEE1A:  sty     SEDORIC_TRAV3                   ; EE1A 84 F5                    ..
        ldy     BASIC11_Y_TEXT                  ; EE1C AC 69 02                 .i.
        lda     ($12),y                         ; EE1F B1 12                    ..
        cmp     #$20                            ; EE21 C9 20                    . 
        bcs     LEE27                           ; EE23 B0 02                    ..
        ora     #$80                            ; EE25 09 80                    ..
LEE27:  ldy     SEDORIC_TRAV3                   ; EE27 A4 F5                    ..
        dey                                     ; EE29 88                       .
        php                                     ; EE2A 08                       .
        sta     ($D1),y                         ; EE2B 91 D1                    ..
        jsr     LEE73                           ; EE2D 20 73 EE                  s.
        plp                                     ; EE30 28                       (
        bne     LEE1A                           ; EE31 D0 E7                    ..
        ldx     SEDORIC_TRAV0                   ; EE33 A6 F2                    ..
LEE35:  jsr     LEE76                           ; EE35 20 76 EE                  v.
        dex                                     ; EE38 CA                       .
        bne     LEE35                           ; EE39 D0 FA                    ..
        asl     SEDORIC_TRAV1                   ; EE3B 06 F3                    ..
        asl     SEDORIC_TRAV1                   ; EE3D 06 F3                    ..
        ldy     SEDORIC_TRAV0                   ; EE3F A4 F2                    ..
LEE41:  dey                                     ; EE41 88                       .
        lda     ($D1),y                         ; EE42 B1 D1                    ..
        cmp     SEDORIC_BACKUP_CHAR_LINPUT      ; EE44 CD 75 C0                 .u.
        bne     LEE61                           ; EE47 D0 18                    ..
        lda     #$20                            ; EE49 A9 20                    . 
        bit     SEDORIC_TRAV1                   ; EE4B 24 F3                    $.
        bpl     LEE51                           ; EE4D 10 02                    ..
        sta     ($D1),y                         ; EE4F 91 D1                    ..
LEE51:  bvc     LEE59                           ; EE51 50 06                    P.
        jsr     XAFCAR                          ; EE53 20 2A D6                  *.
        jsr     LEE73                           ; EE56 20 73 EE                  s.
LEE59:  jsr     LEE73                           ; EE59 20 73 EE                  s.
        tya                                     ; EE5C 98                       .
        bne     LEE41                           ; EE5D D0 E2                    ..
        .byte   $24                             ; EE5F 24                       $
LEE60:  iny                                     ; EE60 C8                       .
LEE61:  jsr     LEE76                           ; EE61 20 76 EE                  v.
        cpy     SEDORIC_TRAV0                   ; EE64 C4 F2                    ..
        bne     LEE60                           ; EE66 D0 F8                    ..
        rts                                     ; EE68 60                       `

; ----------------------------------------------------------------------------
LEE69:  txa                                     ; EE69 8A                       .
        beq     LEE72                           ; EE6A F0 06                    ..
        jsr     LEE73                           ; EE6C 20 73 EE                  s.
        dex                                     ; EE6F CA                       .
        bne     LEE69                           ; EE70 D0 F7                    ..
LEE72:  rts                                     ; EE72 60                       `

; ----------------------------------------------------------------------------
LEE73:  lda     #$08                            ; EE73 A9 08                    ..
        .byte   $2C                             ; EE75 2C                       ,
LEE76:  lda     #$09                            ; EE76 A9 09                    ..
        .byte   $24                             ; EE78 24                       $
LEE79:  pla                                     ; EE79 68                       h
        pha                                     ; EE7A 48                       H
        jsr     XAFCAR                          ; EE7B 20 2A D6                  *.
        lda     BASIC11_FLG                     ; EE7E AD 6A 02                 .j.
        and     #$20                            ; EE81 29 20                    ) 
        bne     LEE8C                           ; EE83 D0 07                    ..
        lda     BASIC11_Y_TEXT                  ; EE85 AD 69 02                 .i.
        and     #$FE                            ; EE88 29 FE                    ).
        beq     LEE79                           ; EE8A F0 ED                    ..
LEE8C:  pla                                     ; EE8C 68                       h
        rts                                     ; EE8D 60                       `

; ----------------------------------------------------------------------------
LEE8E:  ldy     #$02                            ; EE8E A0 02                    ..
LEE90:  lda     $D0,y                           ; EE90 B9 D0 00                 ...
        sta     ($B8),y                         ; EE93 91 B8                    ..
        dey                                     ; EE95 88                       .
        bpl     LEE90                           ; EE96 10 F8                    ..
LEE98:  rts                                     ; EE98 60                       `

; ----------------------------------------------------------------------------
CMD_USING:
        jsr     LD216                           ; EE99 20 16 D2                  ..
        jsr     LD2D2                           ; EE9C 20 D2 D2                  ..
        jsr     LD22C                           ; EE9F 20 2C D2                  ,.
        jsr     LD224                           ; EEA2 20 24 D2                  $.
        jsr     LD274                           ; EEA5 20 74 D2                  t.
        sta     $22                             ; EEA8 85 22                    ."
        jsr     LDACE                           ; EEAA 20 CE DA                  ..
        lda     #$30                            ; EEAD A9 30                    .0
        ldy     #$2B                            ; EEAF A0 2B                    .+
        sty     $D7                             ; EEB1 84 D7                    ..
        sta     $D8                             ; EEB3 85 D8                    ..
        sta     $D9                             ; EEB5 85 D9                    ..
        sta     $C5                             ; EEB7 85 C5                    ..
        ldx     #$09                            ; EEB9 A2 09                    ..
LEEBB:  sta     $CD,x                           ; EEBB 95 CD                    ..
        dex                                     ; EEBD CA                       .
        bne     LEEBB                           ; EEBE D0 FB                    ..
        lda     STACK                           ; EEC0 AD 00 01                 ...
        cmp     #$2D                            ; EEC3 C9 2D                    .-
        beq     LEEC9                           ; EEC5 F0 02                    ..
        lda     #$2B                            ; EEC7 A9 2B                    .+
LEEC9:  sta     $C4                             ; EEC9 85 C4                    ..
        stx     SEDORIC_TRAV2                   ; EECB 86 F4                    ..
        stx     SEDORIC_TRAV3                   ; EECD 86 F5                    ..
        lda     #$20                            ; EECF A9 20                    . 
        sta     SEDORIC_TRAV4                   ; EED1 85 F6                    ..
        ldy     #$01                            ; EED3 A0 01                    ..
        sty     SEDORIC_TRAV0                   ; EED5 84 F2                    ..
        dey                                     ; EED7 88                       .
        .byte   $2C                             ; EED8 2C                       ,
LEED9:  ldx     #$09                            ; EED9 A2 09                    ..
LEEDB:  iny                                     ; EEDB C8                       .
        lda     STACK,y                         ; EEDC B9 00 01                 ...
        beq     LEF06                           ; EEDF F0 25                    .%
        cmp     #$2E                            ; EEE1 C9 2E                    ..
        beq     LEED9                           ; EEE3 F0 F4                    ..
        cmp     #$45                            ; EEE5 C9 45                    .E
        beq     LEEF4                           ; EEE7 F0 0B                    ..
        sta     $C5,x                           ; EEE9 95 C5                    ..
        cpx     #$09                            ; EEEB E0 09                    ..
        bcs     LEEF1                           ; EEED B0 02                    ..
        sty     SEDORIC_TRAV0                   ; EEEF 84 F2                    ..
LEEF1:  inx                                     ; EEF1 E8                       .
        bne     LEEDB                           ; EEF2 D0 E7                    ..
LEEF4:  lda     STACK+1,y                       ; EEF4 B9 01 01                 ...
        sta     $D7                             ; EEF7 85 D7                    ..
        lda     STACK+2,y                       ; EEF9 B9 02 01                 ...
        tax                                     ; EEFC AA                       .
        lda     STACK+3,y                       ; EEFD B9 03 01                 ...
        beq     LEF04                           ; EF00 F0 02                    ..
        sta     $D9                             ; EF02 85 D9                    ..
LEF04:  stx     $D8                             ; EF04 86 D8                    ..
LEF06:  ldx     SEDORIC_TRAV0                   ; EF06 A6 F2                    ..
        ldy     #$08                            ; EF08 A0 08                    ..
LEF0A:  lda     $C4,x                           ; EF0A B5 C4                    ..
        dex                                     ; EF0C CA                       .
        bpl     LEF11                           ; EF0D 10 02                    ..
        lda     #$20                            ; EF0F A9 20                    . 
LEF11:  sta     $C5,y                           ; EF11 99 C5 00                 ...
        dey                                     ; EF14 88                       .
        bpl     LEF0A                           ; EF15 10 F3                    ..
        .byte   $2C                             ; EF17 2C                       ,
LEF18:  sty     SEDORIC_TRAV3                   ; EF18 84 F5                    ..
LEF1A:  ldy     SEDORIC_TRAV2                   ; EF1A A4 F4                    ..
        cpy     $22                             ; EF1C C4 22                    ."
        bne     LEF48                           ; EF1E D0 28                    .(
        lda     #$00                            ; EF20 A9 00                    ..
        sta     $D7                             ; EF22 85 D7                    ..
        jsr     LD39E                           ; EF24 20 9E D3                  ..
        beq     LEF41                           ; EF27 F0 18                    ..
        lda     SEDORIC_TRAV3                   ; EF29 A5 F5                    ..
        jsr     LD264                           ; EF2B 20 64 D2                  d.
        tay                                     ; EF2E A8                       .
LEF2F:  dey                                     ; EF2F 88                       .
        lda     SEDORIC_BUF1,y                  ; EF30 B9 00 C1                 ...
        sta     ($D1),y                         ; EF33 91 D1                    ..
        tya                                     ; EF35 98                       .
        bne     LEF2F                           ; EF36 D0 F7                    ..
        jsr     LD22C                           ; EF38 20 2C D2                  ,.
        jsr     LD238                           ; EF3B 20 38 D2                  8.
        jmp     LE8D6                           ; EF3E 4C D6 E8                 L..

; ----------------------------------------------------------------------------
LEF41:  lda     #$00                            ; EF41 A9 00                    ..
        ldy     #$C1                            ; EF43 A0 C1                    ..
        jmp     XAFSTR                          ; EF45 4C 37 D6                 L7.

; ----------------------------------------------------------------------------
LEF48:  jsr     LF02B                           ; EF48 20 2B F0                  +.
        cmp     #$5E                            ; EF4B C9 5E                    .^
        bne     LEF68                           ; EF4D D0 19                    ..
; $ef4f
display_exp_scientific_notation:
        ldx     #$FD                            ; EF4F A2 FD                    ..
LEF51:  lda     LFFDA,x                         ; EF51 BD DA FF                 ...
        .byte   $2C                             ; EF54 2C                       ,
; ----------------------------------------------------------------------------
LEF55:  lda     #$20                            ; EF55 A9 20                    . 
        .byte   $2C                             ; EF57 2C                       ,
LEF58:  lda     $C4                             ; EF58 A5 C4                    ..
; $ef5a
displayCharInFinalString:
        sta     SEDORIC_BUF1,y                  ; EF5A 99 00 C1                 ...
        iny                                     ; EF5D C8                       .
        bne     LEF63                           ; EF5E D0 03                    ..
        jmp     LE977                           ; EF60 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
LEF63:  inx                                     ; EF63 E8                       .
        bne     LEF51                           ; EF64 D0 EB                    ..
        beq     LEF18                           ; EF66 F0 B0                    ..
LEF68:  cmp     #$2B                            ; EF68 C9 2B                    .+
        beq     LEF58                           ; EF6A F0 EC                    ..
        cmp     #$2D                            ; EF6C C9 2D                    .-
        bne     LEF78                           ; EF6E D0 08                    ..
        lda     STACK                           ; EF70 AD 00 01                 ...
        lsr     a                               ; EF73 4A                       J
        bcs     LEF58                           ; EF74 B0 E2                    ..
        bcc     LEF55                           ; EF76 90 DD                    ..
LEF78:  cmp     #$23                            ; EF78 C9 23                    .#
        bne     LEF83                           ; EF7A D0 07                    ..
        jsr     LEFA7                           ; EF7C 20 A7 EF                  ..
        ldx     #$09                            ; EF7F A2 09                    ..
        bne     LEF93                           ; EF81 D0 10                    ..
LEF83:  cmp     #$25                            ; EF83 C9 25                    .%
        bne     LEFB9                           ; EF85 D0 32                    .2
        jsr     LEFA7                           ; EF87 20 A7 EF                  ..
        cmp     SEDORIC_TRAV0                   ; EF8A C5 F2                    ..
        bcc     LEFB3                           ; EF8C 90 25                    .%
        lda     #$09                            ; EF8E A9 09                    ..
        sbc     SEDORIC_TRAV1                   ; EF90 E5 F3                    ..
        tax                                     ; EF92 AA                       .
LEF93:  dec     SEDORIC_TRAV1                   ; EF93 C6 F3                    ..
        bpl     LEF9A                           ; EF95 10 03                    ..
        jmp     LEF18                           ; EF97 4C 18 EF                 L..

; ----------------------------------------------------------------------------
LEF9A:  lda     $C5,x                           ; EF9A B5 C5                    ..
        and     #$7F                            ; EF9C 29 7F                    ).
        sta     SEDORIC_BUF1,y                  ; EF9E 99 00 C1                 ...
        iny                                     ; EFA1 C8                       .
        beq     LEFB6                           ; EFA2 F0 12                    ..
        inx                                     ; EFA4 E8                       .
        bne     LEF93                           ; EFA5 D0 EC                    ..
LEFA7:  jsr     LF02B                           ; EFA7 20 2B F0                  +.
        sbc     #$30                            ; EFAA E9 30                    .0
        sta     SEDORIC_TRAV1                   ; EFAC 85 F3                    ..
        cmp     #$0A                            ; EFAE C9 0A                    ..
        bcs     LEFB3                           ; EFB0 B0 01                    ..
        rts                                     ; EFB2 60                       `

; ----------------------------------------------------------------------------
LEFB3:  jmp     LDE20                           ; EFB3 4C 20 DE                 L .

; ----------------------------------------------------------------------------
LEFB6:  jmp     LE977                           ; EFB6 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
LEFB9:  cmp     #$21                            ; EFB9 C9 21                    .!
        bne     LEFFC                           ; EFBB D0 3F                    .?
        jsr     LEFA7                           ; EFBD 20 A7 EF                  ..
        sec                                     ; EFC0 38                       8
        lda     #$09                            ; EFC1 A9 09                    ..
        sbc     SEDORIC_TRAV1                   ; EFC3 E5 F3                    ..
LEFC5:  sta     SEDORIC_TRAV1                   ; EFC5 85 F3                    ..
        tax                                     ; EFC7 AA                       .
        lda     $C5,x                           ; EFC8 B5 C5                    ..
        cmp     SEDORIC_TRAV4                   ; EFCA C5 F6                    ..
        beq     LF028                           ; EFCC F0 5A                    .Z
        lda     #$30                            ; EFCE A9 30                    .0
        inx                                     ; EFD0 E8                       .
LEFD1:  inx                                     ; EFD1 E8                       .
        cpx     #$12                            ; EFD2 E0 12                    ..
        beq     LEFDA                           ; EFD4 F0 04                    ..
        sta     $C5,x                           ; EFD6 95 C5                    ..
        bne     LEFD1                           ; EFD8 D0 F7                    ..
LEFDA:  ldx     SEDORIC_TRAV1                   ; EFDA A6 F3                    ..
        inx                                     ; EFDC E8                       .
        lda     $C5,x                           ; EFDD B5 C5                    ..
        cmp     #$35                            ; EFDF C9 35                    .5
LEFE1:  lda     #$30                            ; EFE1 A9 30                    .0
LEFE3:  sta     $C5,x                           ; EFE3 95 C5                    ..
        bcc     LF028                           ; EFE5 90 41                    .A
        dex                                     ; EFE7 CA                       .
        bmi     LF028                           ; EFE8 30 3E                    0>
        lda     $C5,x                           ; EFEA B5 C5                    ..
        cmp     SEDORIC_TRAV4                   ; EFEC C5 F6                    ..
        bne     LEFF4                           ; EFEE D0 04                    ..
        inc     SEDORIC_TRAV0                   ; EFF0 E6 F2                    ..
        lda     #$30                            ; EFF2 A9 30                    .0
LEFF4:  cmp     #$39                            ; EFF4 C9 39                    .9
        beq     LEFE1                           ; EFF6 F0 E9                    ..
        adc     #$01                            ; EFF8 69 01                    i.
        bcc     LEFE3                           ; EFFA 90 E7                    ..
LEFFC:  cmp     #$40                            ; EFFC C9 40                    .@
        bne     LF007                           ; EFFE D0 07                    ..
        jsr     LEFA7                           ; F000 20 A7 EF                  ..
        adc     #$08                            ; F003 69 08                    i.
        bcc     LEFC5                           ; F005 90 BE                    ..
LF007:  cmp     #$26                            ; F007 C9 26                    .&
        beq     LF00E                           ; F009 F0 03                    ..
        jmp     displayCharInFinalString        ; F00B 4C 5A EF                 LZ.

; ----------------------------------------------------------------------------
LF00E:  jsr     LF02B                           ; F00E 20 2B F0                  +.
        cmp     #$30                            ; F011 C9 30                    .0
        bne     LF017                           ; F013 D0 02                    ..
        ora     #$80                            ; F015 09 80                    ..
LF017:  tax                                     ; F017 AA                       .
        ldy     #$00                            ; F018 A0 00                    ..
LF01A:  lda     $C5,y                           ; F01A B9 C5 00                 ...
        cmp     SEDORIC_TRAV4                   ; F01D C5 F6                    ..
        bne     LF026                           ; F01F D0 05                    ..
        stx     $C5,y                           ; F021 96 C5                    ..
        iny                                     ; F023 C8                       .
        bne     LF01A                           ; F024 D0 F4                    ..
LF026:  stx     SEDORIC_TRAV4                   ; F026 86 F6                    ..
LF028:  jmp     LEF1A                           ; F028 4C 1A EF                 L..

; ----------------------------------------------------------------------------
LF02B:  ldy     SEDORIC_TRAV2                   ; F02B A4 F4                    ..
        lda     ($91),y                         ; F02D B1 91                    ..
        inc     SEDORIC_TRAV2                   ; F02F E6 F4                    ..
        ldy     SEDORIC_TRAV3                   ; F031 A4 F5                    ..
        ldx     #$FF                            ; F033 A2 FF                    ..
LF035:  rts                                     ; F035 60                       `

; ----------------------------------------------------------------------------
CMD_LUSING:
        jsr     LE7C5                           ; F036 20 C5 E7                  ..
        jsr     CMD_USING                       ; F039 20 99 EE                  ..
        jmp     LE7D6                           ; F03C 4C D6 E7                 L..

; ----------------------------------------------------------------------------
LF03F:  ldx     #$05                            ; F03F A2 05                    ..
LF041:  lda     LCD1A,x                         ; F041 BD 1A CD                 ...
        sta     $BFDF,x                         ; F044 9D DF BF                 ...
        lda     LCD1F,x                         ; F047 BD 1F CD                 ...
        sta     $BFE9,x                         ; F04A 9D E9 BF                 ...
        dex                                     ; F04D CA                       .
        bne     LF041                           ; F04E D0 F1                    ..
        inx                                     ; F050 E8                       .
        stx     $C072                           ; F051 8E 72 C0                 .r.
        lda     #$41                            ; F054 A9 41                    .A
        ldy     #$4E                            ; F056 A0 4E                    .N
        sta     $B4                             ; F058 85 B4                    ..
        sty     $B5                             ; F05A 84 B5                    ..
        jsr     LD244                           ; F05C 20 44 D2                  D.
        jsr     LD2BA                           ; F05F 20 BA D2                  ..
        lda     #$E0                            ; F062 A9 E0                    ..
        ldy     #$BF                            ; F064 A0 BF                    ..
        jsr     LD2AA                           ; F066 20 AA D2                  ..
        ldx     #$E0                            ; F069 A2 E0                    ..
        ldy     #$BF                            ; F06B A0 BF                    ..
        jsr     LD2C2                           ; F06D 20 C2 D2                  ..
        lda     $021F                           ; F070 AD 1F 02                 ...
        bne     LF078                           ; F073 D0 03                    ..
        jmp     SEDORIC_DISPLAY_TYPE_MISMATCH   ; F075 4C 6F D1                 Lo.

; ----------------------------------------------------------------------------
LF078:  rts                                     ; F078 60                       `

; ----------------------------------------------------------------------------
CMD_LINE:
        jsr     LF03F                           ; F079 20 3F F0                  ?.
        jsr     LD216                           ; F07C 20 16 D2                  ..
LF07F:  ldx     #$E5                            ; F07F A2 E5                    ..
        ldy     #$BF                            ; F081 A0 BF                    ..
        jsr     LD2C2                           ; F083 20 C2 D2                  ..
        ldx     #$00                            ; F086 A2 00                    ..
LF088:  stx     SEDORIC_TRAV0                   ; F088 86 F2                    ..
        lda     #$E0                            ; F08A A9 E0                    ..
        ldy     #$BF                            ; F08C A0 BF                    ..
        jsr     LD2BA                           ; F08E 20 BA D2                  ..
        ldx     SEDORIC_TRAV0                   ; F091 A6 F2                    ..
        beq     LF09E                           ; F093 F0 09                    ..
        jsr     LD2F2                           ; F095 20 F2 D2                  ..
        jsr     LD2DA                           ; F098 20 DA D2                  ..
        jmp     LF0A1                           ; F09B 4C A1 F0                 L..

; ----------------------------------------------------------------------------
LF09E:  jsr     LD2EA                           ; F09E 20 EA D2                  ..
LF0A1:  lda     #$E5                            ; F0A1 A9 E5                    ..
        ldy     #$BF                            ; F0A3 A0 BF                    ..
        jsr     LD2AA                           ; F0A5 20 AA D2                  ..
        jsr     LD28A                           ; F0A8 20 8A D2                  ..
        tax                                     ; F0AB AA                       .
        beq     LF0B2                           ; F0AC F0 04                    ..
        iny                                     ; F0AE C8                       .
        bne     LF0B2                           ; F0AF D0 01                    ..
        inx                                     ; F0B1 E8                       .
LF0B2:  txa                                     ; F0B2 8A                       .
        ldx     SEDORIC_TRAV0                   ; F0B3 A6 F2                    ..
        sta     BASIC11_PARAMS+2,x              ; F0B5 9D E2 02                 ...
        tya                                     ; F0B8 98                       .
        sta     BASIC11_PARAMS+1,x              ; F0B9 9D E1 02                 ...
        inx                                     ; F0BC E8                       .
        inx                                     ; F0BD E8                       .
        cpx     #$02                            ; F0BE E0 02                    ..
        beq     LF088                           ; F0C0 F0 C6                    ..
        lsr     $C072                           ; F0C2 4E 72 C0                 Nr.
        bcc     LF0D3                           ; F0C5 90 0C                    ..
        jsr     LD22C                           ; F0C7 20 2C D2                  ,.
        jsr     LD2FA                           ; F0CA 20 FA D2                  ..
        sty     BASIC11_PARAMS+5                ; F0CD 8C E5 02                 ...
        sta     BASIC11_PARAMS+6                ; F0D0 8D E6 02                 ...
LF0D3:  jsr     LD312                           ; F0D3 20 12 D3                  ..
        lsr     BASIC11_PARAMS                  ; F0D6 4E E0 02                 N..
        bcc     LF078                           ; F0D9 90 9D                    ..
        .byte   $4C                             ; F0DB 4C                       L
        .byte   $7C                             ; F0DC 7C                       |
LF0DD:  .byte   $E9                             ; F0DD E9                       .
CMD_BOX:jsr     LF03F                           ; F0DE 20 3F F0                  ?.
        jsr     LD27F                           ; F0E1 20 7F D2                  ..
        stx     SEDORIC_TRAV1                   ; F0E4 86 F3                    ..
        jsr     LD22C                           ; F0E6 20 2C D2                  ,.
        jsr     LD27F                           ; F0E9 20 7F D2                  ..
        stx     SEDORIC_TRAV2                   ; F0EC 86 F4                    ..
        lda     #$04                            ; F0EE A9 04                    ..
        sta     SEDORIC_TRAV3                   ; F0F0 85 F5                    ..
        lda     #$00                            ; F0F2 A9 00                    ..
        sta     SEDORIC_TRAV4                   ; F0F4 85 F6                    ..
LF0F6:  ldx     SEDORIC_TRAV4                   ; F0F6 A6 F6                    ..
        txa                                     ; F0F8 8A                       .
        eor     #$01                            ; F0F9 49 01                    I.
        sta     SEDORIC_TRAV4                   ; F0FB 85 F6                    ..
        ldy     SEDORIC_TRAV1,x                 ; F0FD B4 F3                    ..
        lda     #$00                            ; F0FF A9 00                    ..
        jsr     LD2CA                           ; F101 20 CA D2                  ..
        jsr     LF07F                           ; F104 20 7F F0                  ..
        lda     #$E0                            ; F107 A9 E0                    ..
        ldy     #$BF                            ; F109 A0 BF                    ..
        jsr     LD2BA                           ; F10B 20 BA D2                  ..
        lda     #$EA                            ; F10E A9 EA                    ..
        ldy     #$BF                            ; F110 A0 BF                    ..
        jsr     LD2A2                           ; F112 20 A2 D2                  ..
        ldx     #$E0                            ; F115 A2 E0                    ..
        ldy     #$BF                            ; F117 A0 BF                    ..
        jsr     LD2C2                           ; F119 20 C2 D2                  ..
        dec     SEDORIC_TRAV3                   ; F11C C6 F5                    ..
        bne     LF0F6                           ; F11E D0 D6                    ..
LF120:  rts                                     ; F120 60                       `

; ----------------------------------------------------------------------------
CMD_VUSER:
        ldy     #$1B                            ; F121 A0 1B                    ..
LF123:  .byte   $2C                             ; F123 2C                       ,
CMD_DKEY:
        ldy     #$18                            ; F124 A0 18                    ..
LF126:  .byte   $2C                             ; F126 2C                       ,
CMD_DSYS:
        ldy     #$15                            ; F127 A0 15                    ..
LF129:  .byte   $2C                             ; F129 2C                       ,
CMD_DNUM:
        ldy     #$12                            ; F12A A0 12                    ..
LF12C:  .byte   $2C                             ; F12C 2C                       ,
CMD_INIST:
        ldy     #$0F                            ; F12D A0 0F                    ..
LF12F:  .byte   $2C                             ; F12F 2C                       ,
CMD_TRACK:
        ldy     #$0C                            ; F130 A0 0C                    ..
        ldx     #$56                            ; F132 A2 56                    .V
        .byte   $D0                             ; F134 D0                       .
LF135:  plp                                     ; F135 28                       (
CMD_MOVE:
        ldx     #$42                            ; F136 A2 42                    .B
LF138:  .byte   $2C                             ; F138 2C                       ,
CMD_DTRACK:
        ldx     #$56                            ; F139 A2 56                    .V
LF13B:  .byte   $2C                             ; F13B 2C                       ,
CMD_MERGE:
        ldx     #$4C                            ; F13C A2 4C                    .L
        ldy     #$09                            ; F13E A0 09                    ..
        .byte   $D0                             ; F140 D0                       .
LF141:  .byte   $1C                             ; F141 1C                       .
CMD_DELETE:
        ldx     #$42                            ; F142 A2 42                    .B
LF144:  .byte   $2C                             ; F144 2C                       ,
CMD_DNAME:
        ldx     #$56                            ; F145 A2 56                    .V
LF147:  .byte   $2C                             ; F147 2C                       ,
CMD_CHANGE:
        ldx     #$4C                            ; F148 A2 4C                    .L
        ldy     #$06                            ; F14A A0 06                    ..
        .byte   $D0                             ; F14C D0                       .
LF14D:  .byte   $10                             ; F14D 10                       .
CMD_RENUM:
        ldx     #$42                            ; F14E A2 42                    .B
LF150:  .byte   $2C                             ; F150 2C                       ,
CMD_BACKUP:
        ldx     #$47                            ; F151 A2 47                    .G
LF153:  .byte   $2C                             ; F153 2C                       ,
CMD_SEEK:
        ldx     #$4C                            ; F154 A2 4C                    .L
LF156:  .byte   $2C                             ; F156 2C                       ,
CMD_COPY:
        ldx     #$51                            ; F157 A2 51                    .Q
LF159:  .byte   $2C                             ; F159 2C                       ,
CMD_SYS:ldx     #$56                            ; F15A A2 56                    .V
        ldy     #$03                            ; F15C A0 03                    ..
LF15E:  lda     #$C4                            ; F15E A9 C4                    ..
        pha                                     ; F160 48                       H
        tya                                     ; F161 98                       .
        pha                                     ; F162 48                       H
        cpx     SEDORIC_EXTNB                   ; F163 EC 15 C0                 ...
        beq     LF1B9                           ; F166 F0 51                    .Q
LF168:  .byte   $2C                             ; F168 2C                       ,
CMD_INIT:
        ldx     #$5B                            ; F169 A2 5B                    .[
        txa                                     ; F16B 8A                       .
        pha                                     ; F16C 48                       H
LF16D:  jsr     LEA06                           ; F16D 20 06 EA                  ..
        beq     LF18F                           ; F170 F0 1D                    ..
        ldx     #$0C                            ; F172 A2 0C                    ..
        jsr     LD36C                           ; F174 20 6C D3                  l.
        nop                                     ; F177 EA                       .
        jsr     LD648                           ; F178 20 48 D6                  H.
        cli                                     ; F17B 58                       X
        php                                     ; F17C 08                       .
        lda     #$0B                            ; F17D A9 0B                    ..
        jsr     XAFCAR                          ; F17F 20 2A D6                  *.
        plp                                     ; F182 28                       (
        bcc     LF18F                           ; F183 90 0A                    ..
        pla                                     ; F185 68                       h
        cmp     #$5B                            ; F186 C9 5B                    .[
        beq     LF18C                           ; F188 F0 02                    ..
        pla                                     ; F18A 68                       h
        pla                                     ; F18B 68                       h
LF18C:  jmp     LD1DC                           ; F18C 4C DC D1                 L..

; ----------------------------------------------------------------------------
LF18F:  jsr     XPMAP                           ; F18F 20 4C DA                  L.
        lda     SEDORIC_BUF2+7                  ; F192 AD 07 C2                 ...
        sta     $C04B                           ; F195 8D 4B C0                 .K.
        lda     SEDORIC_BUF2+10                 ; F198 AD 0A C2                 ...
        bne     LF16D                           ; F19B D0 D0                    ..
        ldx     #$FF                            ; F19D A2 FF                    ..
        pla                                     ; F19F 68                       h
        sta     SEDORIC_EXTNB                   ; F1A0 8D 15 C0                 ...
        sec                                     ; F1A3 38                       8
LF1A4:  tay                                     ; F1A4 A8                       .
        inx                                     ; F1A5 E8                       .
        sbc     SEDORIC_BUF2+7                  ; F1A6 ED 07 C2                 ...
        beq     LF1AD                           ; F1A9 F0 02                    ..
        bcs     LF1A4                           ; F1AB B0 F7                    ..
LF1AD:  stx     SEDORIC_TRACK                   ; F1AD 8E 01 C0                 ...
        ldx     #$04                            ; F1B0 A2 04                    ..
        lda     #$C4                            ; F1B2 A9 C4                    ..
        jsr     XDLOAD                          ; F1B4 20 E5 F1                  ..
        sec                                     ; F1B7 38                       8
        .byte   $24                             ; F1B8 24                       $
LF1B9:  clc                                     ; F1B9 18                       .
        ror     $C016                           ; F1BA 6E 16 C0                 n..
        ldx     #$03                            ; F1BD A2 03                    ..
LF1BF:  lda     SEDKERN_START,x                 ; F1BF BD 00 C4                 ...
        sta     SEDORIC_EXTER,x                 ; F1C2 9D 0D C0                 ...
        dex                                     ; F1C5 CA                       .
        bpl     LF1BF                           ; F1C6 10 F7                    ..
        lda     SEDORIC_EXTNB                   ; F1C8 AD 15 C0                 ...
        cmp     #$5B                            ; F1CB C9 5B                    .[
        beq     LF1D2                           ; F1CD F0 03                    ..
        jmp     LD39E                           ; F1CF 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LF1D2:  ldx     #$7C                            ; F1D2 A2 7C                    .|
        lda     #$20                            ; F1D4 A9 20                    . 
        ldy     #$00                            ; F1D6 A0 00                    ..
        sty     SEDORIC_TRACK                   ; F1D8 8C 01 C0                 ...
        iny                                     ; F1DB C8                       .
        jsr     XDLOAD                          ; F1DC 20 E5 F1                  ..
        jsr     LD39E                           ; F1DF 20 9E D3                  ..
        jmp     LC404                           ; F1E2 4C 04 C4                 L..

; ----------------------------------------------------------------------------
XDLOAD: stx     SEDORIC_TRAV3                   ; F1E5 86 F5                    ..
        sta     SEDORIC_RWBUF+1                 ; F1E7 8D 04 C0                 ...
        lda     #$00                            ; F1EA A9 00                    ..
        sta     SEDORIC_RWBUF                   ; F1EC 8D 03 C0                 ...
        sei                                     ; F1EF 78                       x
LF1F0:  sty     SEDORIC_SECTOR                  ; F1F0 8C 02 C0                 ...
        jsr     XPRSEC                          ; F1F3 20 73 DA                  s.
        inc     SEDORIC_RWBUF+1                 ; F1F6 EE 04 C0                 ...
        ldy     SEDORIC_SECTOR                  ; F1F9 AC 02 C0                 ...
        cpy     $C04B                           ; F1FC CC 4B C0                 .K.
        bcc     LF206                           ; F1FF 90 05                    ..
        inc     SEDORIC_TRACK                   ; F201 EE 01 C0                 ...
        ldy     #$00                            ; F204 A0 00                    ..
LF206:  iny                                     ; F206 C8                       .
        dec     SEDORIC_TRAV3                   ; F207 C6 F5                    ..
        bne     LF1F0                           ; F209 D0 E5                    ..
        cli                                     ; F20B 58                       X
        rts                                     ; F20C 60                       `

; ----------------------------------------------------------------------------
LF20D:  .byte   $4C                             ; F20D 4C                       L
        .byte   $E0                             ; F20E E0                       .
LF20F:  .byte   $E0                             ; F20F E0                       .
CMD_WINDOW:
        beq     LF239                           ; F210 F0 27                    .'
        jsr     LD44F                           ; F212 20 4F D4                  O.
        jsr     LD79E                           ; F215 20 9E D7                  ..
        jsr     LDFE6                           ; F218 20 E6 DF                  ..
        lda     #$00                            ; F21B A9 00                    ..
        ldy     #$C4                            ; F21D A0 C4                    ..
        sta     $C052                           ; F21F 8D 52 C0                 .R.
        sty     $C053                           ; F222 8C 53 C0                 .S.
        lda     #$40                            ; F225 A9 40                    .@
        sta     $C04E                           ; F227 8D 4E C0                 .N.
        jsr     LE0E5                           ; F22A 20 E5 E0                  ..
        lda     $C051                           ; F22D AD 51 C0                 .Q.
        and     #$20                            ; F230 29 20                    ) 
        beq     LF20D                           ; F232 F0 D9                    ..
        lda     #$01                            ; F234 A9 01                    ..
        sta     SEDORIC_EXTNB                   ; F236 8D 15 C0                 ...
LF239:  ldy     SEDORIC_EXTNB                   ; F239 AC 15 C0                 ...
        dey                                     ; F23C 88                       .
        bne     LF20D                           ; F23D D0 CE                    ..
        lda     BASIC11_FLG                     ; F23F AD 6A 02                 .j.
        pha                                     ; F242 48                       H
        php                                     ; F243 08                       .
        jsr     LDFDE                           ; F244 20 DE DF                  ..
        lda     #$B8                            ; F247 A9 B8                    ..
        ldy     #$BB                            ; F249 A0 BB                    ..
        sta     SEDORIC_TRAV0                   ; F24B 85 F2                    ..
        sty     SEDORIC_TRAV1                   ; F24D 84 F3                    ..
        lda     #$E8                            ; F24F A9 E8                    ..
        ldy     #$C3                            ; F251 A0 C3                    ..
        sta     SEDORIC_TRAV2                   ; F253 85 F4                    ..
        sty     SEDORIC_TRAV3                   ; F255 84 F5                    ..
        ldx     #$04                            ; F257 A2 04                    ..
        ldy     #$18                            ; F259 A0 18                    ..
LF25B:  lda     (SEDORIC_TRAV2),y               ; F25B B1 F4                    ..
        sta     (SEDORIC_TRAV0),y               ; F25D 91 F2                    ..
        iny                                     ; F25F C8                       .
        bne     LF25B                           ; F260 D0 F9                    ..
        inc     SEDORIC_TRAV1                   ; F262 E6 F3                    ..
        inc     SEDORIC_TRAV3                   ; F264 E6 F5                    ..
        dex                                     ; F266 CA                       .
        bne     LF25B                           ; F267 D0 F2                    ..
        jsr     LF327                           ; F269 20 27 F3                  '.
        jsr     LF309                           ; F26C 20 09 F3                  ..
LF26F:  jsr     XCURON                          ; F26F 20 3E D7                  >.
        cli                                     ; F272 58                       X
LF273:  jsr     LD845                           ; F273 20 45 D8                  E.
        bpl     LF273                           ; F276 10 FB                    ..
        sei                                     ; F278 78                       x
        cmp     #$03                            ; F279 C9 03                    ..
        beq     LF2E5                           ; F27B F0 68                    .h
        cmp     #$7F                            ; F27D C9 7F                    ..
        bne     LF296                           ; F27F D0 15                    ..
        lda     #$08                            ; F281 A9 08                    ..
        jsr     LF2EC                           ; F283 20 EC F2                  ..
        bmi     LF26F                           ; F286 30 E7                    0.
        jsr     LF2CA                           ; F288 20 CA F2                  ..
        bne     LF2A2                           ; F28B D0 15                    ..
        lda     #$09                            ; F28D A9 09                    ..
        jsr     XAFCAR                          ; F28F 20 2A D6                  *.
        lda     #$7F                            ; F292 A9 7F                    ..
        bne     LF29A                           ; F294 D0 04                    ..
LF296:  cmp     #$20                            ; F296 C9 20                    . 
        bcc     LF2A4                           ; F298 90 0A                    ..
LF29A:  jsr     XAFCAR                          ; F29A 20 2A D6                  *.
        lda     #$08                            ; F29D A9 08                    ..
        jsr     XAFCAR                          ; F29F 20 2A D6                  *.
LF2A2:  lda     #$09                            ; F2A2 A9 09                    ..
LF2A4:  cmp     #$08                            ; F2A4 C9 08                    ..
        bcc     LF29A                           ; F2A6 90 F2                    ..
        cmp     #$0C                            ; F2A8 C9 0C                    ..
        beq     LF26F                           ; F2AA F0 C3                    ..
        bcc     LF2C0                           ; F2AC 90 12                    ..
        cmp     #$0E                            ; F2AE C9 0E                    ..
        beq     LF26F                           ; F2B0 F0 BD                    ..
        cmp     #$0D                            ; F2B2 C9 0D                    ..
        bne     LF29A                           ; F2B4 D0 E4                    ..
        lda     #$09                            ; F2B6 A9 09                    ..
LF2B8:  jsr     LF2EC                           ; F2B8 20 EC F2                  ..
        jsr     LF2CA                           ; F2BB 20 CA F2                  ..
        beq     LF2B8                           ; F2BE F0 F8                    ..
LF2C0:  jsr     LF2EC                           ; F2C0 20 EC F2                  ..
        jsr     LF2CA                           ; F2C3 20 CA F2                  ..
        bne     LF2C0                           ; F2C6 D0 F8                    ..
        beq     LF26F                           ; F2C8 F0 A5                    ..
LF2CA:  pha                                     ; F2CA 48                       H
        jsr     XCUROFF                         ; F2CB 20 40 D7                  @.
        clc                                     ; F2CE 18                       .
        lda     $12                             ; F2CF A5 12                    ..
        adc     #$30                            ; F2D1 69 30                    i0
        sta     SEDORIC_TRAV6                   ; F2D3 85 F8                    ..
        lda     $13                             ; F2D5 A5 13                    ..
        adc     #$08                            ; F2D7 69 08                    i.
        sta     SEDORIC_TRAV7                   ; F2D9 85 F9                    ..
        ldy     BASIC11_Y_TEXT                  ; F2DB AC 69 02                 .i.
        lda     (SEDORIC_TRAV6),y               ; F2DE B1 F8                    ..
        tay                                     ; F2E0 A8                       .
        pla                                     ; F2E1 68                       h
        cpy     #$7F                            ; F2E2 C0 7F                    ..
        rts                                     ; F2E4 60                       `

; ----------------------------------------------------------------------------
LF2E5:  plp                                     ; F2E5 28                       (
        jsr     LF325                           ; F2E6 20 25 F3                  %.
        jmp     LF320                           ; F2E9 4C 20 F3                 L .

; ----------------------------------------------------------------------------
LF2EC:  lsr     SEDORIC_TRAV0                   ; F2EC 46 F2                    F.
LF2EE:  jsr     XAFCAR                          ; F2EE 20 2A D6                  *.
        ldy     BASIC11_X_TEXT                  ; F2F1 AC 68 02                 .h.
        cpy     #$01                            ; F2F4 C0 01                    ..
        beq     LF2FC                           ; F2F6 F0 04                    ..
        cpy     #$1B                            ; F2F8 C0 1B                    ..
        bne     LF306                           ; F2FA D0 0A                    ..
LF2FC:  bit     SEDORIC_TRAV0                   ; F2FC 24 F2                    $.
        bmi     LF308                           ; F2FE 30 08                    0.
        ror     SEDORIC_TRAV0                   ; F300 66 F2                    f.
        eor     #$01                            ; F302 49 01                    I.
        bne     LF2EE                           ; F304 D0 E8                    ..
LF306:  bit     SEDORIC_TRAV0                   ; F306 24 F2                    $.
LF308:  rts                                     ; F308 60                       `

; ----------------------------------------------------------------------------
LF309:  lda     #$1E                            ; F309 A9 1E                    ..
        jsr     XAFCAR                          ; F30B 20 2A D6                  *.
        jsr     LD206                           ; F30E 20 06 D2                  ..
LF311:  jsr     LF2CA                           ; F311 20 CA F2                  ..
        beq     LF324                           ; F314 F0 0E                    ..
        lda     #$09                            ; F316 A9 09                    ..
        jsr     LF2EC                           ; F318 20 EC F2                  ..
        bpl     LF311                           ; F31B 10 F4                    ..
        pla                                     ; F31D 68                       h
        pla                                     ; F31E 68                       h
        plp                                     ; F31F 28                       (
LF320:  pla                                     ; F320 68                       h
        sta     BASIC11_FLG                     ; F321 8D 6A 02                 .j.
LF324:  rts                                     ; F324 60                       `

; ----------------------------------------------------------------------------
LF325:  clc                                     ; F325 18                       .
        .byte   $24                             ; F326 24                       $
LF327:  sec                                     ; F327 38                       8
        ror     $C072                           ; F328 6E 72 C0                 nr.
        jsr     LF309                           ; F32B 20 09 F3                  ..
        lda     #$57                            ; F32E A9 57                    .W
        ldy     #$C9                            ; F330 A0 C9                    ..
        sta     $B4                             ; F332 85 B4                    ..
        sty     $B5                             ; F334 84 B5                    ..
        lda     #$00                            ; F336 A9 00                    ..
        sta     SEDORIC_TRAV4                   ; F338 85 F6                    ..
        sta     SEDORIC_TRAV5                   ; F33A 85 F7                    ..
LF33C:  ldy     #$01                            ; F33C A0 01                    ..
        sty     $26                             ; F33E 84 26                    .&
        dey                                     ; F340 88                       .
        sty     $29                             ; F341 84 29                    .)
        sty     $27                             ; F343 84 27                    .'
        dey                                     ; F345 88                       .
        sty     $28                             ; F346 84 28                    .(
        ldy     SEDORIC_TRAV4                   ; F348 A4 F6                    ..
        ldx     SEDORIC_TRAV5                   ; F34A A6 F7                    ..
        inc     SEDORIC_TRAV4                   ; F34C E6 F6                    ..
        bne     LF352                           ; F34E D0 02                    ..
        inc     SEDORIC_TRAV5                   ; F350 E6 F7                    ..
LF352:  jsr     L04D1                           ; F352 20 D1 04                  ..
        ldy     #$00                            ; F355 A0 00                    ..
        lda     ($B6),y                         ; F357 B1 B6                    ..
        sta     SEDORIC_TRAV0                   ; F359 85 F2                    ..
        iny                                     ; F35B C8                       .
        lda     ($B6),y                         ; F35C B1 B6                    ..
        sta     $91                             ; F35E 85 91                    ..
        iny                                     ; F360 C8                       .
        lda     ($B6),y                         ; F361 B1 B6                    ..
        sta     $92                             ; F363 85 92                    ..
        ldx     #$00                            ; F365 A2 00                    ..
LF367:  bit     $C072                           ; F367 2C 72 C0                 ,r.
        bpl     LF380                           ; F36A 10 14                    ..
        cpx     SEDORIC_TRAV0                   ; F36C E4 F2                    ..
        txa                                     ; F36E 8A                       .
        inx                                     ; F36F E8                       .
        beq     LF3CB                           ; F370 F0 59                    .Y
        tay                                     ; F372 A8                       .
        lda     ($91),y                         ; F373 B1 91                    ..
        bcc     LF393                           ; F375 90 1C                    ..
        lda     #$7F                            ; F377 A9 7F                    ..
        ldy     BASIC11_Y_TEXT                  ; F379 AC 69 02                 .i.
        sta     ($12),y                         ; F37C 91 12                    ..
        bcs     LF391                           ; F37E B0 11                    ..
LF380:  ldy     BASIC11_Y_TEXT                  ; F380 AC 69 02                 .i.
        lda     ($12),y                         ; F383 B1 12                    ..
        cmp     #$7F                            ; F385 C9 7F                    ..
        bne     LF38B                           ; F387 D0 02                    ..
        lda     #$20                            ; F389 A9 20                    . 
LF38B:  sta     SEDORIC_BUF1,x                  ; F38B 9D 00 C1                 ...
        inx                                     ; F38E E8                       .
        beq     LF3CB                           ; F38F F0 3A                    .:
LF391:  lda     #$09                            ; F391 A9 09                    ..
LF393:  jsr     XAFCAR                          ; F393 20 2A D6                  *.
        jsr     LF2CA                           ; F396 20 CA F2                  ..
        beq     LF367                           ; F399 F0 CC                    ..
        bit     $C072                           ; F39B 2C 72 C0                 ,r.
        bmi     LF3BC                           ; F39E 30 1C                    0.
        stx     SEDORIC_TRAV0                   ; F3A0 86 F2                    ..
        txa                                     ; F3A2 8A                       .
        jsr     LD264                           ; F3A3 20 64 D2                  d.
        ldy     #$00                            ; F3A6 A0 00                    ..
LF3A8:  lda     SEDORIC_BUF1,y                  ; F3A8 B9 00 C1                 ...
        sta     ($D1),y                         ; F3AB 91 D1                    ..
        iny                                     ; F3AD C8                       .
        cpy     SEDORIC_TRAV0                   ; F3AE C4 F2                    ..
        bne     LF3A8                           ; F3B0 D0 F6                    ..
        ldy     #$02                            ; F3B2 A0 02                    ..
LF3B4:  lda     $D0,y                           ; F3B4 B9 D0 00                 ...
        sta     ($B6),y                         ; F3B7 91 B6                    ..
        dey                                     ; F3B9 88                       .
        bpl     LF3B4                           ; F3BA 10 F8                    ..
LF3BC:  lda     #$09                            ; F3BC A9 09                    ..
        jsr     LF2EC                           ; F3BE 20 EC F2                  ..
        bmi     LF3CE                           ; F3C1 30 0B                    0.
        jsr     LF2CA                           ; F3C3 20 CA F2                  ..
        bne     LF3BC                           ; F3C6 D0 F4                    ..
        jmp     LF33C                           ; F3C8 4C 3C F3                 L<.

; ----------------------------------------------------------------------------
LF3CB:  jmp     LE977                           ; F3CB 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
LF3CE:  rts                                     ; F3CE 60                       `

; ----------------------------------------------------------------------------
LF3CF:  lda     $0A                             ; F3CF A5 0A                    ..
        asl     a                               ; F3D1 0A                       .
        adc     #$08                            ; F3D2 69 08                    i.
        bne     LF3E1                           ; F3D4 D0 0B                    ..
LF3D6:  ldy     #$04                            ; F3D6 A0 04                    ..
LF3D8:  lda     ($9E),y                         ; F3D8 B1 9E                    ..
        pha                                     ; F3DA 48                       H
        iny                                     ; F3DB C8                       .
        lda     ($9E),y                         ; F3DC B1 9E                    ..
        tay                                     ; F3DE A8                       .
        pla                                     ; F3DF 68                       h
        .byte   $2C                             ; F3E0 2C                       ,
LF3E1:  ldy     #$00                            ; F3E1 A0 00                    ..
LF3E3:  clc                                     ; F3E3 18                       .
        adc     $9E                             ; F3E4 65 9E                    e.
        sta     SEDORIC_TRAV0                   ; F3E6 85 F2                    ..
        pha                                     ; F3E8 48                       H
        tya                                     ; F3E9 98                       .
        adc     $9F                             ; F3EA 65 9F                    e.
        sta     SEDORIC_TRAV1                   ; F3EC 85 F3                    ..
        tax                                     ; F3EE AA                       .
        pla                                     ; F3EF 68                       h
        ldy     #$00                            ; F3F0 A0 00                    ..
        rts                                     ; F3F2 60                       `

; ----------------------------------------------------------------------------
LF3F3:  ldy     #$00                            ; F3F3 A0 00                    ..
        lda     $9F                             ; F3F5 A5 9F                    ..
        cmp     $A1                             ; F3F7 C5 A1                    ..
        beq     LF402                           ; F3F9 F0 07                    ..
        lda     ($9E),y                         ; F3FB B1 9E                    ..
        iny                                     ; F3FD C8                       .
        and     ($9E),y                         ; F3FE 31 9E                    1.
        bmi     LF424                           ; F400 30 22                    0"
LF402:  ldx     $9E                             ; F402 A6 9E                    ..
        ldy     $9F                             ; F404 A4 9F                    ..
        lda     #$02                            ; F406 A9 02                    ..
        sta     SEDORIC_TRAV0                   ; F408 85 F2                    ..
        lda     #$88                            ; F40A A9 88                    ..
        jsr     LF456                           ; F40C 20 56 F4                  V.
        ldy     #$00                            ; F40F A0 00                    ..
        sty     $C081                           ; F411 8C 81 C0                 ...
        tya                                     ; F414 98                       .
LF415:  sta     ($9E),y                         ; F415 91 9E                    ..
        iny                                     ; F417 C8                       .
        bne     LF415                           ; F418 D0 FB                    ..
        ldy     #$05                            ; F41A A0 05                    ..
LF41C:  lda     LCD25,y                         ; F41C B9 25 CD                 .%.
        sta     ($9E),y                         ; F41F 91 9E                    ..
        dey                                     ; F421 88                       .
        bpl     LF41C                           ; F422 10 F8                    ..
LF424:  rts                                     ; F424 60                       `

; ----------------------------------------------------------------------------
LF425:  pha                                     ; F425 48                       H
        sty     SEDORIC_TRAV1                   ; F426 84 F3                    ..
        stx     SEDORIC_TRAV7                   ; F428 86 F9                    ..
        clc                                     ; F42A 18                       .
        ldy     #$86                            ; F42B A0 86                    ..
LF42D:  lda     ($9E),y                         ; F42D B1 9E                    ..
        cmp     SEDORIC_TRAV7                   ; F42F C5 F9                    ..
        iny                                     ; F431 C8                       .
        lda     ($9E),y                         ; F432 B1 9E                    ..
        sbc     SEDORIC_TRAV1                   ; F434 E5 F3                    ..
        bcc     LF447                           ; F436 90 0F                    ..
        dey                                     ; F438 88                       .
        clc                                     ; F439 18                       .
        pla                                     ; F43A 68                       h
        pha                                     ; F43B 48                       H
        adc     ($9E),y                         ; F43C 71 9E                    q.
        sta     ($9E),y                         ; F43E 91 9E                    ..
        iny                                     ; F440 C8                       .
        lda     ($9E),y                         ; F441 B1 9E                    ..
        adc     SEDORIC_TRAV0                   ; F443 65 F2                    e.
        sta     ($9E),y                         ; F445 91 9E                    ..
LF447:  dey                                     ; F447 88                       .
        dey                                     ; F448 88                       .
        dey                                     ; F449 88                       .
        bne     LF42D                           ; F44A D0 E1                    ..
        txa                                     ; F44C 8A                       .
        adc     $9E                             ; F44D 65 9E                    e.
        tax                                     ; F44F AA                       .
        lda     SEDORIC_TRAV1                   ; F450 A5 F3                    ..
        adc     $9F                             ; F452 65 9F                    e.
        tay                                     ; F454 A8                       .
        pla                                     ; F455 68                       h
LF456:  stx     $CE                             ; F456 86 CE                    ..
        sty     $CF                             ; F458 84 CF                    ..
        clc                                     ; F45A 18                       .
        adc     $A0                             ; F45B 65 A0                    e.
        sta     $C7                             ; F45D 85 C7                    ..
        pha                                     ; F45F 48                       H
        lda     $A0                             ; F460 A5 A0                    ..
        ldy     $A1                             ; F462 A4 A1                    ..
        sta     $C9                             ; F464 85 C9                    ..
        lda     $A1                             ; F466 A5 A1                    ..
        sta     $CA                             ; F468 85 CA                    ..
        adc     SEDORIC_TRAV0                   ; F46A 65 F2                    e.
        sta     $C8                             ; F46C 85 C8                    ..
        tay                                     ; F46E A8                       .
        pla                                     ; F46F 68                       h
        jmp     SEDORIC_SHIFT_BLOCK_MEMORY_UP   ; F470 4C 5C D1                 L\.

; ----------------------------------------------------------------------------
LF473:  pha                                     ; F473 48                       H
        jsr     LF3F3                           ; F474 20 F3 F3                  ..
        pla                                     ; F477 68                       h
        tax                                     ; F478 AA                       .
        clc                                     ; F479 18                       .
        php                                     ; F47A 08                       .
        bcc     LF487                           ; F47B 90 0A                    ..
LF47D:  clc                                     ; F47D 18                       .
        .byte   $24                             ; F47E 24                       $
LF47F:  sec                                     ; F47F 38                       8
        php                                     ; F480 08                       .
        jsr     LF3F3                           ; F481 20 F3 F3                  ..
        jsr     LD27F                           ; F484 20 7F D2                  ..
LF487:  cpx     #$40                            ; F487 E0 40                    .@
        bcs     LF4A5                           ; F489 B0 1A                    ..
        stx     $0A                             ; F48B 86 0A                    ..
        jsr     LF3CF                           ; F48D 20 CF F3                  ..
        iny                                     ; F490 C8                       .
        plp                                     ; F491 28                       (
        lda     (SEDORIC_TRAV0),y               ; F492 B1 F2                    ..
        bne     LF4A0                           ; F494 D0 0A                    ..
        bcs     LF4A2                           ; F496 B0 0A                    ..
        ldx     #$0D                            ; F498 A2 0D                    ..
        .byte   $2C                             ; F49A 2C                       ,
LF49B:  ldx     #$0E                            ; F49B A2 0E                    ..
        jmp     LD67E                           ; F49D 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LF4A0:  bcs     LF49B                           ; F4A0 B0 F9                    ..
LF4A2:  jmp     LD39E                           ; F4A2 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LF4A5:  jmp     LDE20                           ; F4A5 4C 20 DE                 L .

; ----------------------------------------------------------------------------
LF4A8:  lda     #$88                            ; F4A8 A9 88                    ..
        ldy     #$00                            ; F4AA A0 00                    ..
        jsr     LF3E3                           ; F4AC 20 E3 F3                  ..
        sta     $06                             ; F4AF 85 06                    ..
        stx     $07                             ; F4B1 86 07                    ..
        lda     $0A                             ; F4B3 A5 0A                    ..
        asl     a                               ; F4B5 0A                       .
        adc     #$08                            ; F4B6 69 08                    i.
        tay                                     ; F4B8 A8                       .
        jsr     LF3D8                           ; F4B9 20 D8 F3                  ..
        sta     $00                             ; F4BC 85 00                    ..
        clc                                     ; F4BE 18                       .
        adc     #$17                            ; F4BF 69 17                    i.
        sta     $02                             ; F4C1 85 02                    ..
        sta     $04                             ; F4C3 85 04                    ..
        txa                                     ; F4C5 8A                       .
        sta     $01                             ; F4C6 85 01                    ..
        adc     #$00                            ; F4C8 69 00                    i.
        sta     $03                             ; F4CA 85 03                    ..
        adc     #$01                            ; F4CC 69 01                    i.
        sta     $05                             ; F4CE 85 05                    ..
        iny                                     ; F4D0 C8                       .
        lda     ($00),y                         ; F4D1 B1 00                    ..
        sta     $C083                           ; F4D3 8D 83 C0                 ...
        dey                                     ; F4D6 88                       .
        lda     ($00),y                         ; F4D7 B1 00                    ..
        sta     $0B                             ; F4D9 85 0B                    ..
        rts                                     ; F4DB 60                       `

; ----------------------------------------------------------------------------
LF4DC:  clc                                     ; F4DC 18                       .
        adc     $02                             ; F4DD 65 02                    e.
        sta     $02                             ; F4DF 85 02                    ..
        bcc     LF4E5                           ; F4E1 90 02                    ..
        inc     $03                             ; F4E3 E6 03                    ..
LF4E5:  rts                                     ; F4E5 60                       `

; ----------------------------------------------------------------------------
LF4E6:  lda     #$80                            ; F4E6 A9 80                    ..
        .byte   $2C                             ; F4E8 2C                       ,
LF4E9:  lda     #$00                            ; F4E9 A9 00                    ..
        .byte   $2C                             ; F4EB 2C                       ,
LF4EC:  lda     #$01                            ; F4EC A9 01                    ..
        .byte   $2C                             ; F4EE 2C                       ,
LF4EF:  lda     #$40                            ; F4EF A9 40                    .@
        sta     $C082                           ; F4F1 8D 82 C0                 ...
        lda     #$06                            ; F4F4 A9 06                    ..
        jsr     LF3E1                           ; F4F6 20 E1 F3                  ..
        lda     (SEDORIC_TRAV0),y               ; F4F9 B1 F2                    ..
        sta     SEDORIC_TRAV2                   ; F4FB 85 F4                    ..
        iny                                     ; F4FD C8                       .
        lda     (SEDORIC_TRAV0),y               ; F4FE B1 F2                    ..
        sta     SEDORIC_TRAV3                   ; F500 85 F5                    ..
        jsr     LF3D6                           ; F502 20 D6 F3                  ..
LF505:  lda     SEDORIC_TRAV2                   ; F505 A5 F4                    ..
        ora     SEDORIC_TRAV3                   ; F507 05 F5                    ..
        beq     LF55F                           ; F509 F0 54                    .T
        lda     SEDORIC_TRAV2                   ; F50B A5 F4                    ..
        bne     LF511                           ; F50D D0 02                    ..
        dec     SEDORIC_TRAV3                   ; F50F C6 F5                    ..
LF511:  dec     SEDORIC_TRAV2                   ; F511 C6 F4                    ..
        ldy     #$06                            ; F513 A0 06                    ..
        bit     $C082                           ; F515 2C 82 C0                 ,..
        bpl     LF526                           ; F518 10 0C                    ..
        sec                                     ; F51A 38                       8
        lda     (SEDORIC_TRAV0),y               ; F51B B1 F2                    ..
        sbc     $0A                             ; F51D E5 0A                    ..
        bne     LF552                           ; F51F D0 31                    .1
        tay                                     ; F521 A8                       .
        sta     (SEDORIC_TRAV0),y               ; F522 91 F2                    ..
        beq     LF552                           ; F524 F0 2C                    .,
LF526:  bvc     LF54B                           ; F526 50 23                    P#
        ldy     #$00                            ; F528 A0 00                    ..
        lda     (SEDORIC_TRAV0),y               ; F52A B1 F2                    ..
        bne     LF552                           ; F52C D0 24                    .$
LF52E:  lda     SEDORIC_TRAV0                   ; F52E A5 F2                    ..
        ldy     SEDORIC_TRAV1                   ; F530 A4 F3                    ..
        sta     SEDORIC_TRAV2                   ; F532 85 F4                    ..
        sty     SEDORIC_TRAV3                   ; F534 84 F5                    ..
        rts                                     ; F536 60                       `

; ----------------------------------------------------------------------------
LF537:  ldy     #$09                            ; F537 A0 09                    ..
        lda     $C082                           ; F539 AD 82 C0                 ...
        bne     LF52E                           ; F53C D0 F0                    ..
LF53E:  lda     (SEDORIC_TRAV0),y               ; F53E B1 F2                    ..
        sta     SEDORIC_BACKUP_CHAR_LINPUT+1,y  ; F540 99 76 C0                 .v.
        dey                                     ; F543 88                       .
        bpl     LF53E                           ; F544 10 F8                    ..
        bmi     LF52E                           ; F546 30 E6                    0.
LF548:  dey                                     ; F548 88                       .
        bmi     LF537                           ; F549 30 EC                    0.
LF54B:  lda     (SEDORIC_TRAV0),y               ; F54B B1 F2                    ..
        cmp     SEDORIC_BACKUP_CHAR_LINPUT+1,y  ; F54D D9 76 C0                 .v.
        beq     LF548                           ; F550 F0 F6                    ..
LF552:  lda     #$0A                            ; F552 A9 0A                    ..
        clc                                     ; F554 18                       .
        adc     SEDORIC_TRAV0                   ; F555 65 F2                    e.
        sta     SEDORIC_TRAV0                   ; F557 85 F2                    ..
        bcc     LF505                           ; F559 90 AA                    ..
        inc     SEDORIC_TRAV1                   ; F55B E6 F3                    ..
        bcs     LF505                           ; F55D B0 A6                    ..
LF55F:  bit     $C082                           ; F55F 2C 82 C0                 ,..
        bvc     LF5AC                           ; F562 50 48                    PH
        ldy     #$04                            ; F564 A0 04                    ..
        lda     ($9E),y                         ; F566 B1 9E                    ..
        pha                                     ; F568 48                       H
        tax                                     ; F569 AA                       .
        iny                                     ; F56A C8                       .
        lda     ($9E),y                         ; F56B B1 9E                    ..
        pha                                     ; F56D 48                       H
        tay                                     ; F56E A8                       .
        txa                                     ; F56F 8A                       .
        jsr     LF3E3                           ; F570 20 E3 F3                  ..
        jsr     LF52E                           ; F573 20 2E F5                  ..
        pla                                     ; F576 68                       h
        tay                                     ; F577 A8                       .
        pla                                     ; F578 68                       h
        tax                                     ; F579 AA                       .
        lda     #$00                            ; F57A A9 00                    ..
        sta     SEDORIC_TRAV0                   ; F57C 85 F2                    ..
        lda     #$64                            ; F57E A9 64                    .d
        jsr     LF425                           ; F580 20 25 F4                  %.
        sec                                     ; F583 38                       8
LF584:  ldy     #$04                            ; F584 A0 04                    ..
        lda     ($9E),y                         ; F586 B1 9E                    ..
        sbc     #$64                            ; F588 E9 64                    .d
        sta     ($9E),y                         ; F58A 91 9E                    ..
        iny                                     ; F58C C8                       .
        lda     ($9E),y                         ; F58D B1 9E                    ..
        sbc     #$00                            ; F58F E9 00                    ..
        sta     ($9E),y                         ; F591 91 9E                    ..
        ldy     #$06                            ; F593 A0 06                    ..
        lda     #$09                            ; F595 A9 09                    ..
        adc     ($9E),y                         ; F597 71 9E                    q.
        sta     ($9E),y                         ; F599 91 9E                    ..
        iny                                     ; F59B C8                       .
        lda     ($9E),y                         ; F59C B1 9E                    ..
        adc     #$00                            ; F59E 69 00                    i.
        sta     ($9E),y                         ; F5A0 91 9E                    ..
        lda     #$00                            ; F5A2 A9 00                    ..
        ldy     #$63                            ; F5A4 A0 63                    .c
LF5A6:  sta     (SEDORIC_TRAV2),y               ; F5A6 91 F4                    ..
        dey                                     ; F5A8 88                       .
        bpl     LF5A6                           ; F5A9 10 FB                    ..
        rts                                     ; F5AB 60                       `

; ----------------------------------------------------------------------------
LF5AC:  bmi     LF5B4                           ; F5AC 30 06                    0.
        lsr     $C082                           ; F5AE 4E 82 C0                 N..
        bcc     LF5B5                           ; F5B1 90 02                    ..
        clc                                     ; F5B3 18                       .
LF5B4:  rts                                     ; F5B4 60                       `

; ----------------------------------------------------------------------------
LF5B5:  ldx     #$13                            ; F5B5 A2 13                    ..
        jmp     LD67E                           ; F5B7 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LF5BA:  jsr     LF640                           ; F5BA 20 40 F6                  @.
        jsr     LF3F3                           ; F5BD 20 F3 F3                  ..
        lda     #$D3                            ; F5C0 A9 D3                    ..
        jsr     LD22E                           ; F5C2 20 2E D2                  ..
        jsr     LED2E                           ; F5C5 20 2E ED                  ..
        jsr     LF4E9                           ; F5C8 20 E9 F4                  ..
        jsr     LF67A                           ; F5CB 20 7A F6                  z.
        lda     $C07C                           ; F5CE AD 7C C0                 .|.
        sta     $0A                             ; F5D1 85 0A                    ..
        jsr     LF4A8                           ; F5D3 20 A8 F4                  ..
        lda     $C07D                           ; F5D6 AD 7D C0                 .}.
        jsr     LF4DC                           ; F5D9 20 DC F4                  ..
LF5DC:  ldx     $0B                             ; F5DC A6 0B                    ..
        dex                                     ; F5DE CA                       .
        bne     LF5E9                           ; F5DF D0 08                    ..
        ldx     $C07F                           ; F5E1 AE 7F C0                 ...
        ldy     $C07E                           ; F5E4 AC 7E C0                 .~.
        bne     LF5F7                           ; F5E7 D0 0E                    ..
LF5E9:  ldy     #$00                            ; F5E9 A0 00                    ..
        lda     ($02),y                         ; F5EB B1 02                    ..
        iny                                     ; F5ED C8                       .
        tax                                     ; F5EE AA                       .
        lda     ($02),y                         ; F5EF B1 02                    ..
        tay                                     ; F5F1 A8                       .
        lda     #$02                            ; F5F2 A9 02                    ..
        jsr     LF4DC                           ; F5F4 20 DC F4                  ..
LF5F7:  sty     SEDORIC_TRAV3                   ; F5F7 84 F5                    ..
        txa                                     ; F5F9 8A                       .
        bmi     LF625                           ; F5FA 30 29                    0)
        bne     LF60A                           ; F5FC D0 0C                    ..
        lda     $02                             ; F5FE A5 02                    ..
        ldy     $03                             ; F600 A4 03                    ..
        jsr     LD2BA                           ; F602 20 BA D2                  ..
        jmp     LF620                           ; F605 4C 20 F6                 L .

; ----------------------------------------------------------------------------
        nop                                     ; F608 EA                       .
        nop                                     ; F609 EA                       .
LF60A:  asl     a                               ; F60A 0A                       .
        asl     a                               ; F60B 0A                       .
        ldy     #$00                            ; F60C A0 00                    ..
        lda     ($02),y                         ; F60E B1 02                    ..
        tay                                     ; F610 A8                       .
        sta     SEDORIC_TRAV0                   ; F611 85 F2                    ..
        lda     #$00                            ; F613 A9 00                    ..
        bcs     LF61D                           ; F615 B0 06                    ..
        ldy     #$01                            ; F617 A0 01                    ..
        lda     ($02),y                         ; F619 B1 02                    ..
        ldy     SEDORIC_TRAV0                   ; F61B A4 F2                    ..
LF61D:  jsr     LD254                           ; F61D 20 54 D2                  T.
LF620:  lda     $29                             ; F620 A5 29                    .)
        jmp     LD1FE                           ; F622 4C FE D1                 L..

; ----------------------------------------------------------------------------
LF625:  lda     SEDORIC_TRAV3                   ; F625 A5 F5                    ..
        jsr     LD264                           ; F627 20 64 D2                  d.
        tay                                     ; F62A A8                       .
        beq     LF635                           ; F62B F0 08                    ..
LF62D:  dey                                     ; F62D 88                       .
        lda     ($02),y                         ; F62E B1 02                    ..
        sta     ($D1),y                         ; F630 91 D1                    ..
        tya                                     ; F632 98                       .
        bne     LF62D                           ; F633 D0 F8                    ..
LF635:  jmp     LEE8E                           ; F635 4C 8E EE                 L..

; ----------------------------------------------------------------------------
LF638:  .byte   $14                             ; F638 14                       .
        .byte   $14                             ; F639 14                       .
        .byte   $14                             ; F63A 14                       .
        .byte   $14                             ; F63B 14                       .
LF63C:  .byte   $04                             ; F63C 04                       .
        .byte   $04                             ; F63D 04                       .
        .byte   $04                             ; F63E 04                       .
        .byte   $04                             ; F63F 04                       .
LF640:  ldx     #$0A                            ; F640 A2 0A                    ..
        lda     #$00                            ; F642 A9 00                    ..
LF644:  sta     SEDORIC_BACKUP_CHAR_LINPUT,x    ; F644 9D 75 C0                 .u.
        dex                                     ; F647 CA                       .
        bne     LF644                           ; F648 D0 FA                    ..
        lda     $0A                             ; F64A A5 0A                    ..
        sta     $C07C                           ; F64C 8D 7C C0                 .|.
        jsr     LD39E                           ; F64F 20 9E D3                  ..
        jmp     LF658                           ; F652 4C 58 F6                 LX.

; ----------------------------------------------------------------------------
LF655:  jsr     LD398                           ; F655 20 98 D3                  ..
LF658:  beq     LF6CC                           ; F658 F0 72                    .r
        cmp     #$80                            ; F65A C9 80                    ..
        bcs     LF6CC                           ; F65C B0 6E                    .n
        cmp     #$28                            ; F65E C9 28                    .(
        beq     LF66C                           ; F660 F0 0A                    ..
        cpx     #$05                            ; F662 E0 05                    ..
        beq     LF655                           ; F664 F0 EF                    ..
        sta     SEDORIC_BACKUP_CHAR_LINPUT+1,x  ; F666 9D 76 C0                 .v.
        inx                                     ; F669 E8                       .
        bne     LF655                           ; F66A D0 E9                    ..
LF66C:  jsr     LD398                           ; F66C 20 98 D3                  ..
        jsr     LD27F                           ; F66F 20 7F D2                  ..
        stx     $C07B                           ; F672 8E 7B C0                 .{.
        lda     #$29                            ; F675 A9 29                    .)
        jmp     LD22E                           ; F677 4C 2E D2                 L..

; ----------------------------------------------------------------------------
LF67A:  lda     $C07F                           ; F67A AD 7F C0                 ...
LF67D:  sta     $C07F                           ; F67D 8D 7F C0                 ...
        asl     a                               ; F680 0A                       .
        jmp     LD21C                           ; F681 4C 1C D2                 L..

; ----------------------------------------------------------------------------
LF684:  lda     #$00                            ; F684 A9 00                    ..
        sta     SEDORIC_TRAV0                   ; F686 85 F2                    ..
        sta     $C085                           ; F688 8D 85 C0                 ...
        sta     $08                             ; F68B 85 08                    ..
        sta     $09                             ; F68D 85 09                    ..
        lda     $C083                           ; F68F AD 83 C0                 ...
        ldx     #$08                            ; F692 A2 08                    ..
        sta     SEDORIC_TRAV1                   ; F694 85 F3                    ..
LF696:  lsr     SEDORIC_TRAV1                   ; F696 46 F3                    F.
        bcc     LF6AF                           ; F698 90 15                    ..
        clc                                     ; F69A 18                       .
        lda     $33                             ; F69B A5 33                    .3
        adc     $C085                           ; F69D 6D 85 C0                 m..
        sta     $C085                           ; F6A0 8D 85 C0                 ...
        lda     $34                             ; F6A3 A5 34                    .4
        adc     $08                             ; F6A5 65 08                    e.
        sta     $08                             ; F6A7 85 08                    ..
        lda     SEDORIC_TRAV0                   ; F6A9 A5 F2                    ..
        adc     $09                             ; F6AB 65 09                    e.
        sta     $09                             ; F6AD 85 09                    ..
LF6AF:  asl     $33                             ; F6AF 06 33                    .3
        rol     $34                             ; F6B1 26 34                    &4
        rol     SEDORIC_TRAV0                   ; F6B3 26 F2                    &.
        dex                                     ; F6B5 CA                       .
        bne     LF696                           ; F6B6 D0 DE                    ..
        jsr     LF6CD                           ; F6B8 20 CD F6                  ..
        jsr     LF4A8                           ; F6BB 20 A8 F4                  ..
        clc                                     ; F6BE 18                       .
        lda     $C085                           ; F6BF AD 85 C0                 ...
        adc     $06                             ; F6C2 65 06                    e.
        sta     $06                             ; F6C4 85 06                    ..
        bcc     LF6CA                           ; F6C6 90 02                    ..
        inc     $07                             ; F6C8 E6 07                    ..
LF6CA:  ldy     #$00                            ; F6CA A0 00                    ..
LF6CC:  rts                                     ; F6CC 60                       `

; ----------------------------------------------------------------------------
LF6CD:  jsr     LF4A8                           ; F6CD 20 A8 F4                  ..
        clc                                     ; F6D0 18                       .
        lda     $08                             ; F6D1 A5 08                    ..
        ldx     $09                             ; F6D3 A6 09                    ..
        adc     #$02                            ; F6D5 69 02                    i.
        bcc     LF6DA                           ; F6D7 90 01                    ..
        inx                                     ; F6D9 E8                       .
LF6DA:  ldy     #$0A                            ; F6DA A0 0A                    ..
        sec                                     ; F6DC 38                       8
        sbc     ($04),y                         ; F6DD F1 04                    ..
        pha                                     ; F6DF 48                       H
        iny                                     ; F6E0 C8                       .
        txa                                     ; F6E1 8A                       .
        sbc     ($04),y                         ; F6E2 F1 04                    ..
        tay                                     ; F6E4 A8                       .
        pla                                     ; F6E5 68                       h
        bcc     LF6EB                           ; F6E6 90 03                    ..
        jsr     LF75A                           ; F6E8 20 5A F7                  Z.
LF6EB:  ldx     #$FF                            ; F6EB A2 FF                    ..
        clc                                     ; F6ED 18                       .
        lda     $08                             ; F6EE A5 08                    ..
        adc     #$05                            ; F6F0 69 05                    i.
        sta     $08                             ; F6F2 85 08                    ..
        bcc     LF6F8                           ; F6F4 90 02                    ..
        inc     $09                             ; F6F6 E6 09                    ..
LF6F8:  sec                                     ; F6F8 38                       8
LF6F9:  lda     $08                             ; F6F9 A5 08                    ..
        tay                                     ; F6FB A8                       .
        sbc     #$7F                            ; F6FC E9 7F                    ..
        sta     $08                             ; F6FE 85 08                    ..
        lda     $09                             ; F700 A5 09                    ..
        sbc     #$00                            ; F702 E9 00                    ..
        sta     $09                             ; F704 85 09                    ..
        inx                                     ; F706 E8                       .
        bcs     LF6F9                           ; F707 B0 F0                    ..
        iny                                     ; F709 C8                       .
        tya                                     ; F70A 98                       .
        asl     a                               ; F70B 0A                       .
        sta     $C084                           ; F70C 8D 84 C0                 ...
        sta     SEDORIC_TRAV6                   ; F70F 85 F8                    ..
        txa                                     ; F711 8A                       .
        pha                                     ; F712 48                       H
        jsr     LF4A8                           ; F713 20 A8 F4                  ..
        pla                                     ; F716 68                       h
        clc                                     ; F717 18                       .
        adc     $05                             ; F718 65 05                    e.
        sta     $05                             ; F71A 85 05                    ..
        sta     SEDORIC_TRAV5                   ; F71C 85 F7                    ..
        ldy     $C084                           ; F71E AC 84 C0                 ...
        jsr     LF736                           ; F721 20 36 F7                  6.
        jmp     LF736                           ; F724 4C 36 F7                 L6.

; ----------------------------------------------------------------------------
LF727:  jsr     LF4A8                           ; F727 20 A8 F4                  ..
        lda     SEDORIC_TRAV5                   ; F72A A5 F7                    ..
        sta     $05                             ; F72C 85 05                    ..
        ldy     SEDORIC_TRAV6                   ; F72E A4 F8                    ..
        jsr     LF733                           ; F730 20 33 F7                  3.
LF733:  ldx     #$A8                            ; F733 A2 A8                    ..
        .byte   $2C                             ; F735 2C                       ,
LF736:  ldx     #$88                            ; F736 A2 88                    ..
        lda     ($04),y                         ; F738 B1 04                    ..
        sta     SEDORIC_TRACK                   ; F73A 8D 01 C0                 ...
        iny                                     ; F73D C8                       .
        lda     ($04),y                         ; F73E B1 04                    ..
        sta     SEDORIC_SECTOR                  ; F740 8D 02 C0                 ...
        lda     $06                             ; F743 A5 06                    ..
        sta     SEDORIC_RWBUF                   ; F745 8D 03 C0                 ...
        lda     $07                             ; F748 A5 07                    ..
        sta     SEDORIC_RWBUF+1                 ; F74A 8D 04 C0                 ...
        inc     $07                             ; F74D E6 07                    ..
        iny                                     ; F74F C8                       .
        bne     LF756                           ; F750 D0 04                    ..
        inc     $05                             ; F752 E6 05                    ..
        ldy     #$02                            ; F754 A0 02                    ..
LF756:  jmp     LDA75                           ; F756 4C 75 DA                 Lu.

; ----------------------------------------------------------------------------
LF759:  rts                                     ; F759 60                       `

; ----------------------------------------------------------------------------
LF75A:  sta     $C058                           ; F75A 8D 58 C0                 .X.
        sty     $C059                           ; F75D 8C 59 C0                 .Y.
        ora     $C059                           ; F760 0D 59 C0                 .Y.
        beq     LF759                           ; F763 F0 F4                    ..
        jsr     XPMAP                           ; F765 20 4C DA                  L.
        jsr     LF4A8                           ; F768 20 A8 F4                  ..
        ldy     #$02                            ; F76B A0 02                    ..
        lda     ($00),y                         ; F76D B1 00                    ..
        beq     LF785                           ; F76F F0 14                    ..
        clc                                     ; F771 18                       .
        adc     $05                             ; F772 65 05                    e.
        sta     $05                             ; F774 85 05                    ..
        dec     $05                             ; F776 C6 05                    ..
        ldy     #$00                            ; F778 A0 00                    ..
        lda     ($04),y                         ; F77A B1 04                    ..
        tax                                     ; F77C AA                       .
        iny                                     ; F77D C8                       .
        lda     ($04),y                         ; F77E B1 04                    ..
        iny                                     ; F780 C8                       .
        inc     $05                             ; F781 E6 05                    ..
        bne     LF78F                           ; F783 D0 0A                    ..
LF785:  ldy     #$13                            ; F785 A0 13                    ..
        lda     ($00),y                         ; F787 B1 00                    ..
        tax                                     ; F789 AA                       .
        iny                                     ; F78A C8                       .
        lda     ($00),y                         ; F78B B1 00                    ..
        ldy     #$0C                            ; F78D A0 0C                    ..
LF78F:  stx     SEDORIC_TRACK                   ; F78F 8E 01 C0                 ...
        sta     SEDORIC_SECTOR                  ; F792 8D 02 C0                 ...
        jsr     LF85F                           ; F795 20 5F F8                  _.
LF798:  iny                                     ; F798 C8                       .
        lda     ($04),y                         ; F799 B1 04                    ..
        beq     LF7A2                           ; F79B F0 05                    ..
        iny                                     ; F79D C8                       .
        bne     LF798                           ; F79E D0 F8                    ..
        beq     LF7D6                           ; F7A0 F0 34                    .4
LF7A2:  dey                                     ; F7A2 88                       .
LF7A3:  lda     $C058                           ; F7A3 AD 58 C0                 .X.
        ora     $C059                           ; F7A6 0D 59 C0                 .Y.
        beq     LF802                           ; F7A9 F0 57                    .W
        jsr     LF85F                           ; F7AB 20 5F F8                  _.
        lda     $C058                           ; F7AE AD 58 C0                 .X.
        bne     LF7B6                           ; F7B1 D0 03                    ..
        dec     $C059                           ; F7B3 CE 59 C0                 .Y.
LF7B6:  dec     $C058                           ; F7B6 CE 58 C0                 .X.
        sty     $C05F                           ; F7B9 8C 5F C0                 ._.
        jsr     LF838                           ; F7BC 20 38 F8                  8.
        sty     SEDORIC_TRAV0                   ; F7BF 84 F2                    ..
        ldy     $C05F                           ; F7C1 AC 5F C0                 ._.
        sta     ($04),y                         ; F7C4 91 04                    ..
        iny                                     ; F7C6 C8                       .
        lda     SEDORIC_TRAV0                   ; F7C7 A5 F2                    ..
        sta     ($04),y                         ; F7C9 91 04                    ..
        iny                                     ; F7CB C8                       .
        bne     LF7A3                           ; F7CC D0 D5                    ..
        lda     $C058                           ; F7CE AD 58 C0                 .X.
        ora     $C059                           ; F7D1 0D 59 C0                 .Y.
        beq     LF802                           ; F7D4 F0 2C                    .,
LF7D6:  jsr     LF84C                           ; F7D6 20 4C F8                  L.
        sta     SEDORIC_TRAV3                   ; F7D9 85 F5                    ..
        sty     SEDORIC_TRAV4                   ; F7DB 84 F6                    ..
        ldy     #$00                            ; F7DD A0 00                    ..
        sta     ($04),y                         ; F7DF 91 04                    ..
        iny                                     ; F7E1 C8                       .
        lda     SEDORIC_TRAV4                   ; F7E2 A5 F6                    ..
        sta     ($04),y                         ; F7E4 91 04                    ..
        jsr     XSVSEC                          ; F7E6 20 A4 DA                  ..
        lda     SEDORIC_TRAV3                   ; F7E9 A5 F5                    ..
        ldy     SEDORIC_TRAV4                   ; F7EB A4 F6                    ..
        sta     SEDORIC_TRACK                   ; F7ED 8D 01 C0                 ...
        sty     SEDORIC_SECTOR                  ; F7F0 8C 02 C0                 ...
        jsr     LF86A                           ; F7F3 20 6A F8                  j.
        lda     #$00                            ; F7F6 A9 00                    ..
        tay                                     ; F7F8 A8                       .
LF7F9:  sta     ($04),y                         ; F7F9 91 04                    ..
        iny                                     ; F7FB C8                       .
        bne     LF7F9                           ; F7FC D0 FB                    ..
        ldy     #$02                            ; F7FE A0 02                    ..
        bne     LF7A3                           ; F800 D0 A1                    ..
LF802:  jsr     XSVSEC                          ; F802 20 A4 DA                  ..
        ldy     #$06                            ; F805 A0 06                    ..
LF807:  lda     ($00),y                         ; F807 B1 00                    ..
        sta     $C022,y                         ; F809 99 22 C0                 .".
        iny                                     ; F80C C8                       .
        cpy     #$17                            ; F80D C0 17                    ..
        bne     LF807                           ; F80F D0 F6                    ..
        jsr     XTVNM                           ; F811 20 30 DB                  0.
        bne     LF819                           ; F814 D0 03                    ..
        jmp     LE0DD                           ; F816 4C DD E0                 L..

; ----------------------------------------------------------------------------
LF819:  jsr     LDAEE                           ; F819 20 EE DA                  ..
        jsr     XSMAP                           ; F81C 20 8A DA                  ..
        jsr     XSCAT                           ; F81F 20 82 DA                  ..
        jsr     LF4A8                           ; F822 20 A8 F4                  ..
        ldy     #$13                            ; F825 A0 13                    ..
        lda     ($00),y                         ; F827 B1 00                    ..
        sta     SEDORIC_TRACK                   ; F829 8D 01 C0                 ...
        iny                                     ; F82C C8                       .
        lda     ($00),y                         ; F82D B1 00                    ..
        sta     SEDORIC_SECTOR                  ; F82F 8D 02 C0                 ...
        jsr     LF85F                           ; F832 20 5F F8                  _.
        jmp     XSVSEC                          ; F835 4C A4 DA                 L..

; ----------------------------------------------------------------------------
LF838:  ldy     #$0A                            ; F838 A0 0A                    ..
        inc     $03                             ; F83A E6 03                    ..
        lda     ($02),y                         ; F83C B1 02                    ..
        clc                                     ; F83E 18                       .
        adc     #$01                            ; F83F 69 01                    i.
        sta     ($02),y                         ; F841 91 02                    ..
        iny                                     ; F843 C8                       .
        lda     ($02),y                         ; F844 B1 02                    ..
        adc     #$00                            ; F846 69 00                    i.
        sta     ($02),y                         ; F848 91 02                    ..
        dec     $03                             ; F84A C6 03                    ..
LF84C:  ldy     #$15                            ; F84C A0 15                    ..
        lda     ($00),y                         ; F84E B1 00                    ..
        clc                                     ; F850 18                       .
        adc     #$01                            ; F851 69 01                    i.
        sta     ($00),y                         ; F853 91 00                    ..
        iny                                     ; F855 C8                       .
        lda     ($00),y                         ; F856 B1 00                    ..
        adc     #$00                            ; F858 69 00                    i.
        sta     ($00),y                         ; F85A 91 00                    ..
        jmp     XLIBSE                          ; F85C 4C 6C DC                 Ll.

; ----------------------------------------------------------------------------
LF85F:  lda     $04                             ; F85F A5 04                    ..
        sta     SEDORIC_RWBUF                   ; F861 8D 03 C0                 ...
        lda     $05                             ; F864 A5 05                    ..
        sta     SEDORIC_RWBUF+1                 ; F866 8D 04 C0                 ...
        rts                                     ; F869 60                       `

; ----------------------------------------------------------------------------
LF86A:  inc     $05                             ; F86A E6 05                    ..
        clc                                     ; F86C 18                       .
        ldy     #$02                            ; F86D A0 02                    ..
        lda     ($00),y                         ; F86F B1 00                    ..
        adc     #$01                            ; F871 69 01                    i.
        sta     ($00),y                         ; F873 91 00                    ..
        lda     $04                             ; F875 A5 04                    ..
        ldy     $05                             ; F877 A4 05                    ..
        jsr     LF885                           ; F879 20 85 F8                  ..
        lda     #$01                            ; F87C A9 01                    ..
        sta     SEDORIC_TRAV0                   ; F87E 85 F2                    ..
        lda     #$00                            ; F880 A9 00                    ..
        jmp     LF425                           ; F882 4C 25 F4                 L%.

; ----------------------------------------------------------------------------
LF885:  sec                                     ; F885 38                       8
        sbc     $9E                             ; F886 E5 9E                    ..
        tax                                     ; F888 AA                       .
        tya                                     ; F889 98                       .
        sbc     $9F                             ; F88A E5 9F                    ..
        tay                                     ; F88C A8                       .
        rts                                     ; F88D 60                       `

; ----------------------------------------------------------------------------
        jsr     LD24C                           ; F88E 20 4C D2                  L.
        lda     $D4                             ; F891 A5 D4                    ..
        ldx     $D3                             ; F893 A6 D3                    ..
        bpl     LF8A3                           ; F895 10 0C                    ..
        eor     #$FF                            ; F897 49 FF                    I.
        clc                                     ; F899 18                       .
        adc     #$01                            ; F89A 69 01                    i.
        cpx     #$FF                            ; F89C E0 FF                    ..
        beq     LF8A7                           ; F89E F0 07                    ..
LF8A0:  jmp     LDE20                           ; F8A0 4C 20 DE                 L .

; ----------------------------------------------------------------------------
LF8A3:  cpx     #$00                            ; F8A3 E0 00                    ..
        bne     LF8A0                           ; F8A5 D0 F9                    ..
LF8A7:  jsr     LF473                           ; F8A7 20 73 F4                  s.
        jsr     LF4A8                           ; F8AA 20 A8 F4                  ..
        bmi     LF8D2                           ; F8AD 30 23                    0#
        bne     LF8CF                           ; F8AF D0 1E                    ..
        lda     $C083                           ; F8B1 AD 83 C0                 ...
        bit     $D3                             ; F8B4 24 D3                    $.
        bmi     LF8C3                           ; F8B6 30 0B                    0.
        ldy     #$04                            ; F8B8 A0 04                    ..
        lda     ($04),y                         ; F8BA B1 04                    ..
        pha                                     ; F8BC 48                       H
        iny                                     ; F8BD C8                       .
        lda     ($04),y                         ; F8BE B1 04                    ..
        tay                                     ; F8C0 A8                       .
        pla                                     ; F8C1 68                       h
        .byte   $2C                             ; F8C2 2C                       ,
LF8C3:  ldy     #$00                            ; F8C3 A0 00                    ..
        .byte   $24                             ; F8C5 24                       $
LF8C6:  tay                                     ; F8C6 A8                       .
        sta     SEDORIC_TRAV0                   ; F8C7 85 F2                    ..
        tya                                     ; F8C9 98                       .
        ldy     SEDORIC_TRAV0                   ; F8CA A4 F2                    ..
        jmp     LD254                           ; F8CC 4C 54 D2                 LT.

; ----------------------------------------------------------------------------
LF8CF:  jmp     LE0E0                           ; F8CF 4C E0 E0                 L..

; ----------------------------------------------------------------------------
LF8D2:  jsr     LFD0E                           ; F8D2 20 0E FD                  ..
        beq     LF8C6                           ; F8D5 F0 EF                    ..
        bit     $D3                             ; F8D7 24 D3                    $.
        bmi     LF8C3                           ; F8D9 30 E8                    0.
        lda     #$00                            ; F8DB A9 00                    ..
        .byte   $F0                             ; F8DD F0                       .
LF8DE:  cpx     $20                             ; F8DE E4 20                    . 
        lsr     SEDORIC_TRAV7,x                 ; F8E0 56 F9                    V.
        bne     LF8EA                           ; F8E2 D0 06                    ..
        jsr     LF96B                           ; F8E4 20 6B F9                  k.
        jmp     XPRSEC                          ; F8E7 4C 73 DA                 Ls.

; ----------------------------------------------------------------------------
LF8EA:  bcs     LF8FD                           ; F8EA B0 11                    ..
        jsr     LF91F                           ; F8EC 20 1F F9                  ..
        php                                     ; F8EF 08                       .
        sei                                     ; F8F0 78                       x
        jsr     LF684                           ; F8F1 20 84 F6                  ..
LF8F4:  lda     ($06),y                         ; F8F4 B1 06                    ..
        sta     ($02),y                         ; F8F6 91 02                    ..
        iny                                     ; F8F8 C8                       .
        bne     LF8F4                           ; F8F9 D0 F9                    ..
        plp                                     ; F8FB 28                       (
LF8FC:  rts                                     ; F8FC 60                       `

; ----------------------------------------------------------------------------
LF8FD:  jsr     LED2E                           ; F8FD 20 2E ED                  ..
        jsr     LFDD9                           ; F900 20 D9 FD                  ..
        txa                                     ; F903 8A                       .
        jsr     LF67D                           ; F904 20 7D F6                  }.
        lda     $06                             ; F907 A5 06                    ..
        ldy     $07                             ; F909 A4 07                    ..
        sta     $02                             ; F90B 85 02                    ..
        sty     $03                             ; F90D 84 03                    ..
        jsr     LF5DC                           ; F90F 20 DC F5                  ..
        jsr     LD39E                           ; F912 20 9E D3                  ..
        beq     LF8FC                           ; F915 F0 E5                    ..
        jsr     LD22C                           ; F917 20 2C D2                  ,.
        jmp     LF8FD                           ; F91A 4C FD F8                 L..

; ----------------------------------------------------------------------------
LF91D:  clc                                     ; F91D 18                       .
        .byte   $24                             ; F91E 24                       $
LF91F:  sec                                     ; F91F 38                       8
        php                                     ; F920 08                       .
        jsr     LD2FA                           ; F921 20 FA D2                  ..
        ldy     #$04                            ; F924 A0 04                    ..
        lda     ($04),y                         ; F926 B1 04                    ..
        cmp     $33                             ; F928 C5 33                    .3
        iny                                     ; F92A C8                       .
        lda     ($04),y                         ; F92B B1 04                    ..
        sbc     $34                             ; F92D E5 34                    .4
        bcs     LF939                           ; F92F B0 08                    ..
        plp                                     ; F931 28                       (
        bcc     LF93B                           ; F932 90 07                    ..
        ldx     #$10                            ; F934 A2 10                    ..
        jmp     LD67E                           ; F936 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LF939:  plp                                     ; F939 28                       (
        rts                                     ; F93A 60                       `

; ----------------------------------------------------------------------------
LF93B:  ldy     #$04                            ; F93B A0 04                    ..
        lda     $33                             ; F93D A5 33                    .3
        sta     ($04),y                         ; F93F 91 04                    ..
        iny                                     ; F941 C8                       .
        lda     $34                             ; F942 A5 34                    .4
        sta     ($04),y                         ; F944 91 04                    ..
        jsr     LF85F                           ; F946 20 5F F8                  _.
        ldy     #$13                            ; F949 A0 13                    ..
        lda     ($00),y                         ; F94B B1 00                    ..
        pha                                     ; F94D 48                       H
        iny                                     ; F94E C8                       .
        lda     ($00),y                         ; F94F B1 00                    ..
        tay                                     ; F951 A8                       .
        pla                                     ; F952 68                       h
        jmp     LDA9E                           ; F953 4C 9E DA                 L..

; ----------------------------------------------------------------------------
        jsr     LF47D                           ; F956 20 7D F4                  }.
        jsr     LD22C                           ; F959 20 2C D2                  ,.
        jsr     LF4A8                           ; F95C 20 A8 F4                  ..
        pha                                     ; F95F 48                       H
        ldy     #$06                            ; F960 A0 06                    ..
        lda     ($00),y                         ; F962 B1 00                    ..
        sta     SEDORIC_DRIVE                   ; F964 8D 00 C0                 ...
        pla                                     ; F967 68                       h
        cmp     #$01                            ; F968 C9 01                    ..
        rts                                     ; F96A 60                       `

; ----------------------------------------------------------------------------
LF96B:  jsr     LD27F                           ; F96B 20 7F D2                  ..
        stx     SEDORIC_TRACK                   ; F96E 8E 01 C0                 ...
        jsr     LD22C                           ; F971 20 2C D2                  ,.
        jsr     LD27F                           ; F974 20 7F D2                  ..
        stx     SEDORIC_SECTOR                  ; F977 8E 02 C0                 ...
        beq     LF982                           ; F97A F0 06                    ..
        jsr     LD22C                           ; F97C 20 2C D2                  ,.
        jsr     LE60D                           ; F97F 20 0D E6                  ..
LF982:  jsr     LF4A8                           ; F982 20 A8 F4                  ..
        lda     $02                             ; F985 A5 02                    ..
        ldy     $03                             ; F987 A4 03                    ..
        sta     SEDORIC_RWBUF                   ; F989 8D 03 C0                 ...
        sty     SEDORIC_RWBUF+1                 ; F98C 8C 04 C0                 ...
LF98F:  rts                                     ; F98F 60                       `

; ----------------------------------------------------------------------------
        jsr     LE60D                           ; F990 20 0D E6                  ..
        .byte   $4C                             ; F993 4C                       L
        .byte   $4C                             ; F994 4C                       L
LF995:  .byte   $DA                             ; F995 DA                       .
        jsr     LE60D                           ; F996 20 0D E6                  ..
        .byte   $4C                             ; F999 4C                       L
        txa                                     ; F99A 8A                       .
LF99B:  .byte   $DA                             ; F99B DA                       .
        jsr     LD27F                           ; F99C 20 7F D2                  ..
        txa                                     ; F99F 8A                       .
        pha                                     ; F9A0 48                       H
        and     #$7F                            ; F9A1 29 7F                    ).
        cmp     SEDORIC_BUF2+6                  ; F9A3 CD 06 C2                 ...
        bcs     LF9C8                           ; F9A6 B0 20                    . 
        jsr     LD22C                           ; F9A8 20 2C D2                  ,.
        jsr     LD27F                           ; F9AB 20 7F D2                  ..
        txa                                     ; F9AE 8A                       .
        dex                                     ; F9AF CA                       .
        bmi     LF9C8                           ; F9B0 30 16                    0.
        cpx     SEDORIC_BUF2+7                  ; F9B2 EC 07 C2                 ...
        bcs     LF9C8                           ; F9B5 B0 11                    ..
        tay                                     ; F9B7 A8                       .
        pla                                     ; F9B8 68                       h
        .byte   $4C                             ; F9B9 4C                       L
        .byte   $15                             ; F9BA 15                       .
LF9BB:  cmp     $6C20,x                         ; F9BB DD 20 6C                 . l
        .byte   $DC                             ; F9BE DC                       .
        pha                                     ; F9BF 48                       H
        tya                                     ; F9C0 98                       .
        jsr     LD7ED                           ; F9C1 20 ED D7                  ..
        pla                                     ; F9C4 68                       h
        jmp     LD7EA                           ; F9C5 4C EA D7                 L..

; ----------------------------------------------------------------------------
LF9C8:  .byte   $4C                             ; F9C8 4C                       L
        .byte   $20                             ; F9C9 20                        
LF9CA:  dec     $5620,x                         ; F9CA DE 20 56                 . V
        sbc     $06D0,y                         ; F9CD F9 D0 06                 ...
        jsr     LF96B                           ; F9D0 20 6B F9                  k.
        jmp     XSVSEC                          ; F9D3 4C A4 DA                 L..

; ----------------------------------------------------------------------------
        bcs     LF9EF                           ; F9D6 B0 17                    ..
LF9D8:  jsr     LF91D                           ; F9D8 20 1D F9                  ..
        php                                     ; F9DB 08                       .
        sei                                     ; F9DC 78                       x
        jsr     LF684                           ; F9DD 20 84 F6                  ..
LF9E0:  lda     ($02),y                         ; F9E0 B1 02                    ..
        sta     ($06),y                         ; F9E2 91 06                    ..
        iny                                     ; F9E4 C8                       .
        cpy     $C083                           ; F9E5 CC 83 C0                 ...
        bne     LF9E0                           ; F9E8 D0 F6                    ..
        jsr     LF727                           ; F9EA 20 27 F7                  '.
        plp                                     ; F9ED 28                       (
        rts                                     ; F9EE 60                       `

; ----------------------------------------------------------------------------
LF9EF:  jsr     LD224                           ; F9EF 20 24 D2                  $.
        jsr     LFD0E                           ; F9F2 20 0E FD                  ..
        bne     LFA1B                           ; F9F5 D0 24                    .$
        ldx     #$05                            ; F9F7 A2 05                    ..
        ldy     #$00                            ; F9F9 A0 00                    ..
        bit     $28                             ; F9FB 24 28                    $(
        bpl     LFA0C                           ; F9FD 10 0D                    ..
        lda     $D3                             ; F9FF A5 D3                    ..
        ldx     $D4                             ; FA01 A6 D4                    ..
        sta     $91                             ; FA03 85 91                    ..
        stx     $92                             ; FA05 86 92                    ..
        lda     ($91),y                         ; FA07 B1 91                    ..
        tax                                     ; FA09 AA                       .
        ldy     #$80                            ; FA0A A0 80                    ..
LFA0C:  sty     $C07F                           ; FA0C 8C 7F C0                 ...
        jsr     LFA39                           ; FA0F 20 39 FA                  9.
        lda     #$FF                            ; FA12 A9 FF                    ..
        jsr     LFDCC                           ; FA14 20 CC FD                  ..
        sta     ($02),y                         ; FA17 91 02                    ..
        bmi     LFA2B                           ; FA19 30 10                    0.
LFA1B:  jsr     LFDD9                           ; FA1B 20 D9 FD                  ..
        pha                                     ; FA1E 48                       H
        txa                                     ; FA1F 8A                       .
        jsr     LF67D                           ; FA20 20 7D F6                  }.
        jsr     LFD2A                           ; FA23 20 2A FD                  *.
        pla                                     ; FA26 68                       h
        tax                                     ; FA27 AA                       .
        jsr     LFA39                           ; FA28 20 39 FA                  9.
LFA2B:  jsr     LD39E                           ; FA2B 20 9E D3                  ..
        beq     LFA36                           ; FA2E F0 06                    ..
        jsr     LD22C                           ; FA30 20 2C D2                  ,.
        jmp     LF9EF                           ; FA33 4C EF F9                 L..

; ----------------------------------------------------------------------------
LFA36:  jmp     LFD46                           ; FA36 4C 46 FD                 LF.

; ----------------------------------------------------------------------------
LFA39:  stx     $C07E                           ; FA39 8E 7E C0                 .~.
        lda     $06                             ; FA3C A5 06                    ..
        ldy     $07                             ; FA3E A4 07                    ..
        sta     $02                             ; FA40 85 02                    ..
        sty     $03                             ; FA42 84 03                    ..
        clc                                     ; FA44 18                       .
        ldy     #$00                            ; FA45 A0 00                    ..
        jsr     LFC9E                           ; FA47 20 9E FC                  ..
        jsr     LF4A8                           ; FA4A 20 A8 F4                  ..
        .byte   $4C                             ; FA4D 4C                       L
        sec                                     ; FA4E 38                       8
LFA4F:  inc     $2048,x                         ; FA4F FE 48 20                 .H 
        tya                                     ; FA52 98                       .
        .byte   $D3                             ; FA53 D3                       .
        jsr     LD22C                           ; FA54 20 2C D2                  ,.
        pla                                     ; FA57 68                       h
        cmp     #$44                            ; FA58 C9 44                    .D
        bne     LFA7C                           ; FA5A D0 20                    . 
        lda     SEDORIC_DRVDEF                  ; FA5C AD 09 C0                 ...
        sta     SEDORIC_DRIVE                   ; FA5F 8D 00 C0                 ...
        jsr     LF47F                           ; FA62 20 7F F4                  ..
        beq     LFA6D                           ; FA65 F0 06                    ..
        jsr     LD22C                           ; FA67 20 2C D2                  ,.
        jsr     LE60D                           ; FA6A 20 0D E6                  ..
LFA6D:  lda     #$00                            ; FA6D A9 00                    ..
        ldy     #$01                            ; FA6F A0 01                    ..
        jsr     LFACB                           ; FA71 20 CB FA                  ..
LFA74:  ldy     #$06                            ; FA74 A0 06                    ..
        lda     SEDORIC_DRIVE                   ; FA76 AD 00 C0                 ...
        sta     ($00),y                         ; FA79 91 00                    ..
LFA7B:  rts                                     ; FA7B 60                       `

; ----------------------------------------------------------------------------
LFA7C:  cmp     #$52                            ; FA7C C9 52                    .R
        bne     LFA92                           ; FA7E D0 12                    ..
        lda     #$00                            ; FA80 A9 00                    ..
        ldy     #$08                            ; FA82 A0 08                    ..
        jsr     LFB08                           ; FA84 20 08 FB                  ..
        bne     LFA7B                           ; FA87 D0 F2                    ..
        jsr     LD22C                           ; FA89 20 2C D2                  ,.
        jmp     LF9D8                           ; FA8C 4C D8 F9                 L..

; ----------------------------------------------------------------------------
LFA8F:  jmp     LDE23                           ; FA8F 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
LFA92:  cmp     #$53                            ; FA92 C9 53                    .S
        bne     LFA8F                           ; FA94 D0 F9                    ..
        lda     #$80                            ; FA96 A9 80                    ..
        ldy     #$10                            ; FA98 A0 10                    ..
        jsr     LFB08                           ; FA9A 20 08 FB                  ..
LFA9D:  php                                     ; FA9D 08                       .
        ldy     #$03                            ; FA9E A0 03                    ..
        lda     #$0C                            ; FAA0 A9 0C                    ..
        sta     ($00),y                         ; FAA2 91 00                    ..
        iny                                     ; FAA4 C8                       .
        lda     #$00                            ; FAA5 A9 00                    ..
        sta     ($00),y                         ; FAA7 91 00                    ..
        iny                                     ; FAA9 C8                       .
        sta     ($00),y                         ; FAAA 91 00                    ..
        plp                                     ; FAAC 28                       (
        bne     LFAB8                           ; FAAD D0 09                    ..
        ldy     #$00                            ; FAAF A0 00                    ..
        lda     #$FF                            ; FAB1 A9 FF                    ..
        sta     ($02),y                         ; FAB3 91 02                    ..
        jmp     LFD46                           ; FAB5 4C 46 FD                 LF.

; ----------------------------------------------------------------------------
LFAB8:  .byte   $4C                             ; FAB8 4C                       L
        .byte   $44                             ; FAB9 44                       D
LFABA:  sbc     $C020,x                         ; FABA FD 20 C0                 . .
        .byte   $FA                             ; FABD FA                       .
        bmi     LFA9D                           ; FABE 30 DD                    0.
LFAC0:  jsr     LF47D                           ; FAC0 20 7D F4                  }.
        jsr     LF4A8                           ; FAC3 20 A8 F4                  ..
        .byte   $30                             ; FAC6 30                       0
; Sedoric copyright
SEDORIC_COPYRIGHT:
        .byte   $B3                             ; FAC7 B3                       .
        .byte   "L"                             ; FAC8 4C                       L
        .byte   $E0,$E0                         ; FAC9 E0 E0                    ..
LFACB:  .byte   "H"                             ; FACB 48                       H
        .byte   $98                             ; FACC 98                       .
        .byte   "H"                             ; FACD 48                       H
        .byte   $A0,$05,$B1,$9E,$D0,$02,$A0,$03 ; FACE A0 05 B1 9E D0 02 A0 03  ........
        .byte   $88,$B1,$9E,$AA                 ; FAD6 88 B1 9E AA              ....
        .byte   "H"                             ; FADA 48                       H
        .byte   $C8,$B1,$9E                     ; FADB C8 B1 9E                 ...
        .byte   "H"                             ; FADE 48                       H
        .byte   $A8,$A9,$01,$85,$F2,$A9         ; FADF A8 A9 01 85 F2 A9        ......
        .byte   "! %"                           ; FAE5 21 20 25                 ! %
        .byte   $F4                             ; FAE8 F4                       .
        .byte   " "                             ; FAE9 20                        
        .byte   $CF,$F3,$C8                     ; FAEA CF F3 C8                 ...
        .byte   "h"                             ; FAED 68                       h
        .byte   $91,$F2,$88                     ; FAEE 91 F2 88                 ...
        .byte   "h"                             ; FAF1 68                       h
        .byte   $91,$F2                         ; FAF2 91 F2                    ..
        .byte   " "                             ; FAF4 20                        
        .byte   $A8,$F4                         ; FAF5 A8 F4                    ..
        .byte   "h"                             ; FAF7 68                       h
        .byte   $91,$00                         ; FAF8 91 00                    ..
        .byte   "h"                             ; FAFA 68                       h
; ----------------------------------------------------------------------------
        iny                                     ; FAFB C8                       .
        sta     ($00),y                         ; FAFC 91 00                    ..
        sta     $C083                           ; FAFE 8D 83 C0                 ...
        rts                                     ; FB01 60                       `

; ----------------------------------------------------------------------------
LFB02:  jmp     LE0E0                           ; FB02 4C E0 E0                 L..

; ----------------------------------------------------------------------------
LFB05:  jmp     LDE20                           ; FB05 4C 20 DE                 L .

; ----------------------------------------------------------------------------
LFB08:  sta     $0B                             ; FB08 85 0B                    ..
        sty     SEDORIC_TRAV7                   ; FB0A 84 F9                    ..
        jsr     LD44F                           ; FB0C 20 4F D4                  O.
        jsr     LD79E                           ; FB0F 20 9E D7                  ..
        jsr     LD22C                           ; FB12 20 2C D2                  ,.
        jsr     LF47F                           ; FB15 20 7F F4                  ..
        jsr     LDB2D                           ; FB18 20 2D DB                  -.
        php                                     ; FB1B 08                       .
        bne     LFB40                           ; FB1C D0 22                    ."
        ldx     #$00                            ; FB1E A2 00                    ..
        bit     $0B                             ; FB20 24 0B                    $.
        bmi     LFB2E                           ; FB22 30 0A                    0.
        jsr     LD22C                           ; FB24 20 2C D2                  ,.
        jsr     LD27F                           ; FB27 20 7F D2                  ..
        cpx     #$03                            ; FB2A E0 03                    ..
        bcc     LFB05                           ; FB2C 90 D7                    ..
LFB2E:  lda     #$00                            ; FB2E A9 00                    ..
        sta     $C052                           ; FB30 8D 52 C0                 .R.
        sta     $C053                           ; FB33 8D 53 C0                 .S.
        tay                                     ; FB36 A8                       .
        txa                                     ; FB37 8A                       .
        ldx     SEDORIC_TRAV7                   ; FB38 A6 F9                    ..
        jsr     LDE00                           ; FB3A 20 00 DE                  ..
        jsr     XTVNM                           ; FB3D 20 30 DB                  0.
LFB40:  lda     SEDORIC_BUF3+12,x               ; FB40 BD 0C C3                 ...
        ldy     SEDORIC_BUF3+13,x               ; FB43 BC 0D C3                 ...
        jsr     READ_SECTOR_TRACK               ; FB46 20 5D DA                  ].
        lda     SEDORIC_BUF1+3                  ; FB49 AD 03 C1                 ...
        cmp     SEDORIC_TRAV7                   ; FB4C C5 F9                    ..
        bne     LFB02                           ; FB4E D0 B2                    ..
        lda     SEDORIC_BUF1+6                  ; FB50 AD 06 C1                 ...
        ldy     $0B                             ; FB53 A4 0B                    ..
        jsr     LFACB                           ; FB55 20 CB FA                  ..
        ldy     #$07                            ; FB58 A0 07                    ..
        ldx     $C027                           ; FB5A AE 27 C0                 .'.
LFB5D:  lda     SEDORIC_BUF3,x                  ; FB5D BD 00 C3                 ...
        sta     ($00),y                         ; FB60 91 00                    ..
        inx                                     ; FB62 E8                       .
        iny                                     ; FB63 C8                       .
        cpy     #$17                            ; FB64 C0 17                    ..
        bne     LFB5D                           ; FB66 D0 F5                    ..
        lda     #$FF                            ; FB68 A9 FF                    ..
        ldy     #$02                            ; FB6A A0 02                    ..
        sta     ($00),y                         ; FB6C 91 00                    ..
        dec     $05                             ; FB6E C6 05                    ..
LFB70:  jsr     LF86A                           ; FB70 20 6A F8                  j.
        jsr     LF85F                           ; FB73 20 5F F8                  _.
        jsr     XPRSEC                          ; FB76 20 73 DA                  s.
        ldy     #$00                            ; FB79 A0 00                    ..
        lda     ($04),y                         ; FB7B B1 04                    ..
        sta     SEDORIC_TRACK                   ; FB7D 8D 01 C0                 ...
        iny                                     ; FB80 C8                       .
        lda     ($04),y                         ; FB81 B1 04                    ..
        sta     SEDORIC_SECTOR                  ; FB83 8D 02 C0                 ...
        bne     LFB70                           ; FB86 D0 E8                    ..
        jsr     LFA74                           ; FB88 20 74 FA                  t.
        plp                                     ; FB8B 28                       (
LFB8C:  rts                                     ; FB8C 60                       `

; ----------------------------------------------------------------------------
        beq     LFBA0                           ; FB8D F0 11                    ..
LFB8F:  jsr     LF47D                           ; FB8F 20 7D F4                  }.
        jsr     LFBAF                           ; FB92 20 AF FB                  ..
        jsr     LD39E                           ; FB95 20 9E D3                  ..
        beq     LFBAE                           ; FB98 F0 14                    ..
        jsr     LD22C                           ; FB9A 20 2C D2                  ,.
        jmp     LFB8F                           ; FB9D 4C 8F FB                 L..

; ----------------------------------------------------------------------------
LFBA0:  jsr     LF3F3                           ; FBA0 20 F3 F3                  ..
        lda     #$3F                            ; FBA3 A9 3F                    .?
        sta     $0A                             ; FBA5 85 0A                    ..
LFBA7:  jsr     LFBAF                           ; FBA7 20 AF FB                  ..
        dec     $0A                             ; FBAA C6 0A                    ..
        bpl     LFBA7                           ; FBAC 10 F9                    ..
LFBAE:  rts                                     ; FBAE 60                       `

; ----------------------------------------------------------------------------
LFBAF:  jsr     LF3CF                           ; FBAF 20 CF F3                  ..
        tya                                     ; FBB2 98                       .
        iny                                     ; FBB3 C8                       .
        sta     (SEDORIC_TRAV0),y               ; FBB4 91 F2                    ..
        jmp     LF4E6                           ; FBB6 4C E6 F4                 L..

; ----------------------------------------------------------------------------
LFBB9:  jmp     LE0E0                           ; FBB9 4C E0 E0                 L..

; ----------------------------------------------------------------------------
LFBBC:  .byte   $4C                             ; FBBC 4C                       L
        .byte   $23                             ; FBBD 23                       #
LFBBE:  dec     $7D20,x                         ; FBBE DE 20 7D                 . }
        .byte   $F4                             ; FBC1 F4                       .
        jsr     LD22C                           ; FBC2 20 2C D2                  ,.
        jsr     LF4A8                           ; FBC5 20 A8 F4                  ..
        bmi     LFBB9                           ; FBC8 30 EF                    0.
        lda     $C080                           ; FBCA AD 80 C0                 ...
        cmp     $0A                             ; FBCD C5 0A                    ..
        beq     LFBD6                           ; FBCF F0 05                    ..
        lda     #$00                            ; FBD1 A9 00                    ..
        sta     $C081                           ; FBD3 8D 81 C0                 ...
LFBD6:  jsr     LF640                           ; FBD6 20 40 F6                  @.
        lda     #$C3                            ; FBD9 A9 C3                    ..
        jsr     LD22E                           ; FBDB 20 2E D2                  ..
        beq     LFBBC                           ; FBDE F0 DC                    ..
        pha                                     ; FBE0 48                       H
        jsr     LD398                           ; FBE1 20 98 D3                  ..
        pla                                     ; FBE4 68                       h
        ldy     #$00                            ; FBE5 A0 00                    ..
        ldx     #$05                            ; FBE7 A2 05                    ..
        cmp     #$C0                            ; FBE9 C9 C0                    ..
        beq     LFC07                           ; FBEB F0 1A                    ..
        ldx     #$02                            ; FBED A2 02                    ..
        iny                                     ; FBEF C8                       .
        cmp     #$25                            ; FBF0 C9 25                    .%
        beq     LFC07                           ; FBF2 F0 13                    ..
        dex                                     ; FBF4 CA                       .
        ldy     #$40                            ; FBF5 A0 40                    .@
        cmp     #$4F                            ; FBF7 C9 4F                    .O
        beq     LFC07                           ; FBF9 F0 0C                    ..
        cmp     #$24                            ; FBFB C9 24                    .$
        bne     LFBBC                           ; FBFD D0 BD                    ..
        jsr     LD27F                           ; FBFF 20 7F D2                  ..
        txa                                     ; FC02 8A                       .
        beq     LFC54                           ; FC03 F0 4F                    .O
        ldy     #$80                            ; FC05 A0 80                    ..
LFC07:  sty     $C07F                           ; FC07 8C 7F C0                 ...
        stx     $C07E                           ; FC0A 8E 7E C0                 .~.
        lda     $C081                           ; FC0D AD 81 C0                 ...
        ldy     $0A                             ; FC10 A4 0A                    ..
        sta     $C07D                           ; FC12 8D 7D C0                 .}.
        sty     $C07C                           ; FC15 8C 7C C0                 .|.
        clc                                     ; FC18 18                       .
        ldx     $0B                             ; FC19 A6 0B                    ..
        bne     LFC22                           ; FC1B D0 05                    ..
        adc     #$02                            ; FC1D 69 02                    i.
        jsr     LFC57                           ; FC1F 20 57 FC                  W.
LFC22:  adc     $C07E                           ; FC22 6D 7E C0                 m~.
        jsr     LFC57                           ; FC25 20 57 FC                  W.
        sta     $C081                           ; FC28 8D 81 C0                 ...
        jsr     LF4EC                           ; FC2B 20 EC F4                  ..
        bcs     LFC33                           ; FC2E B0 03                    ..
        jsr     LF4EF                           ; FC30 20 EF F4                  ..
LFC33:  ldy     #$09                            ; FC33 A0 09                    ..
LFC35:  lda     SEDORIC_BACKUP_CHAR_LINPUT+1,y  ; FC35 B9 76 C0                 .v.
        sta     (SEDORIC_TRAV2),y               ; FC38 91 F4                    ..
        dey                                     ; FC3A 88                       .
        bpl     LFC35                           ; FC3B 10 F8                    ..
        ldx     #$00                            ; FC3D A2 00                    ..
        jsr     LD39E                           ; FC3F 20 9E D3                  ..
        bne     LFC48                           ; FC42 D0 04                    ..
        stx     $C081                           ; FC44 8E 81 C0                 ...
        rts                                     ; FC47 60                       `

; ----------------------------------------------------------------------------
LFC48:  jsr     LD22C                           ; FC48 20 2C D2                  ,.
        bne     LFBD6                           ; FC4B D0 89                    ..
        lda     $0A                             ; FC4D A5 0A                    ..
        sta     $C080                           ; FC4F 8D 80 C0                 ...
LFC52:  clc                                     ; FC52 18                       .
        rts                                     ; FC53 60                       `

; ----------------------------------------------------------------------------
LFC54:  jmp     LDE20                           ; FC54 4C 20 DE                 L .

; ----------------------------------------------------------------------------
LFC57:  beq     LFC69                           ; FC57 F0 10                    ..
        bcs     LFC6E                           ; FC59 B0 13                    ..
        ldx     $C083                           ; FC5B AE 83 C0                 ...
        beq     LFC52                           ; FC5E F0 F2                    ..
        cmp     $C083                           ; FC60 CD 83 C0                 ...
        beq     LFC52                           ; FC63 F0 ED                    ..
        bcc     LFC52                           ; FC65 90 EB                    ..
        bcs     LFC6E                           ; FC67 B0 05                    ..
LFC69:  ldx     $C083                           ; FC69 AE 83 C0                 ...
        beq     LFC52                           ; FC6C F0 E4                    ..
LFC6E:  ldx     #$11                            ; FC6E A2 11                    ..
        .byte   $4C                             ; FC70 4C                       L
        .byte   $7E                             ; FC71 7E                       ~
LFC72:  dec     $18,x                           ; FC72 D6 18                    ..
LFC74:  bit     $38                             ; FC74 24 38                    $8
        php                                     ; FC76 08                       .
        jsr     LF3F3                           ; FC77 20 F3 F3                  ..
        jsr     LF640                           ; FC7A 20 40 F6                  @.
        lda     #$D5                            ; FC7D A9 D5                    ..
        jsr     LD22E                           ; FC7F 20 2E D2                  ..
        jsr     LD224                           ; FC82 20 24 D2                  $.
        jsr     LF4E9                           ; FC85 20 E9 F4                  ..
        jsr     LF67A                           ; FC88 20 7A F6                  z.
        jsr     LF4A8                           ; FC8B 20 A8 F4                  ..
        lda     $C07C                           ; FC8E AD 7C C0                 .|.
        sta     $0A                             ; FC91 85 0A                    ..
        ldy     $C07D                           ; FC93 AC 7D C0                 .}.
        ldx     $C07E                           ; FC96 AE 7E C0                 .~.
        lda     $0B                             ; FC99 A5 0B                    ..
        bne     LFCA9                           ; FC9B D0 0C                    ..
        plp                                     ; FC9D 28                       (
LFC9E:  php                                     ; FC9E 08                       .
        lda     $C07F                           ; FC9F AD 7F C0                 ...
        sta     ($02),y                         ; FCA2 91 02                    ..
        iny                                     ; FCA4 C8                       .
        txa                                     ; FCA5 8A                       .
        sta     ($02),y                         ; FCA6 91 02                    ..
        iny                                     ; FCA8 C8                       .
LFCA9:  tya                                     ; FCA9 98                       .
        jsr     LF4DC                           ; FCAA 20 DC F4                  ..
        plp                                     ; FCAD 28                       (
        ldy     #$00                            ; FCAE A0 00                    ..
        lda     $C07F                           ; FCB0 AD 7F C0                 ...
        bmi     LFCD7                           ; FCB3 30 22                    0"
        beq     LFCD0                           ; FCB5 F0 19                    ..
        jsr     LD24C                           ; FCB7 20 4C D2                  L.
        ldy     #$00                            ; FCBA A0 00                    ..
        lda     $D4                             ; FCBC A5 D4                    ..
        sta     ($02),y                         ; FCBE 91 02                    ..
        bit     $C07F                           ; FCC0 2C 7F C0                 ,..
        bvc     LFCCA                           ; FCC3 50 05                    P.
        lda     $D3                             ; FCC5 A5 D3                    ..
        bne     LFC54                           ; FCC7 D0 8B                    ..
        rts                                     ; FCC9 60                       `

; ----------------------------------------------------------------------------
LFCCA:  iny                                     ; FCCA C8                       .
        lda     $D3                             ; FCCB A5 D3                    ..
        sta     ($02),y                         ; FCCD 91 02                    ..
        rts                                     ; FCCF 60                       `

; ----------------------------------------------------------------------------
LFCD0:  ldx     $02                             ; FCD0 A6 02                    ..
        ldy     $03                             ; FCD2 A4 03                    ..
        jmp     LD2C2                           ; FCD4 4C C2 D2                 L..

; ----------------------------------------------------------------------------
LFCD7:  php                                     ; FCD7 08                       .
        jsr     LD274                           ; FCD8 20 74 D2                  t.
        sta     $D0                             ; FCDB 85 D0                    ..
        ldy     $C07E                           ; FCDD AC 7E C0                 .~.
        beq     LFCE9                           ; FCE0 F0 07                    ..
        lda     #$20                            ; FCE2 A9 20                    . 
LFCE4:  dey                                     ; FCE4 88                       .
        sta     ($02),y                         ; FCE5 91 02                    ..
        bne     LFCE4                           ; FCE7 D0 FB                    ..
LFCE9:  plp                                     ; FCE9 28                       (
        bcs     LFCFA                           ; FCEA B0 0E                    ..
        nop                                     ; FCEC EA                       .
        nop                                     ; FCED EA                       .
LFCEE:  cpy     $D0                             ; FCEE C4 D0                    ..
        bcs     LFCF9                           ; FCF0 B0 07                    ..
        lda     ($91),y                         ; FCF2 B1 91                    ..
        sta     ($02),y                         ; FCF4 91 02                    ..
        iny                                     ; FCF6 C8                       .
        bne     LFCEE                           ; FCF7 D0 F5                    ..
LFCF9:  rts                                     ; FCF9 60                       `

; ----------------------------------------------------------------------------
LFCFA:  ldy     $D0                             ; FCFA A4 D0                    ..
        beq     LFD0D                           ; FCFC F0 0F                    ..
        dey                                     ; FCFE 88                       .
        dec     $D0                             ; FCFF C6 D0                    ..
        lda     ($91),y                         ; FD01 B1 91                    ..
        dec     $C07E                           ; FD03 CE 7E C0                 .~.
        ldy     $C07E                           ; FD06 AC 7E C0                 .~.
        sta     ($02),y                         ; FD09 91 02                    ..
        bne     LFCFA                           ; FD0B D0 ED                    ..
LFD0D:  rts                                     ; FD0D 60                       `

; ----------------------------------------------------------------------------
LFD0E:  jsr     LF4A8                           ; FD0E 20 A8 F4                  ..
        ldy     #$03                            ; FD11 A0 03                    ..
        lda     ($00),y                         ; FD13 B1 00                    ..
        sta     $C086                           ; FD15 8D 86 C0                 ...
        iny                                     ; FD18 C8                       .
        lda     ($00),y                         ; FD19 B1 00                    ..
        sta     $C087                           ; FD1B 8D 87 C0                 ...
        iny                                     ; FD1E C8                       .
        lda     ($00),y                         ; FD1F B1 00                    ..
        sta     $C088                           ; FD21 8D 88 C0                 ...
        tay                                     ; FD24 A8                       .
        lda     ($02),y                         ; FD25 B1 02                    ..
        cmp     #$FF                            ; FD27 C9 FF                    ..
LFD29:  rts                                     ; FD29 60                       `

; ----------------------------------------------------------------------------
LFD2A:  jsr     LF4A8                           ; FD2A 20 A8 F4                  ..
        ldy     #$05                            ; FD2D A0 05                    ..
        lda     $C088                           ; FD2F AD 88 C0                 ...
        sta     ($00),y                         ; FD32 91 00                    ..
        dey                                     ; FD34 88                       .
        lda     $C087                           ; FD35 AD 87 C0                 ...
        sta     ($00),y                         ; FD38 91 00                    ..
        dey                                     ; FD3A 88                       .
        lda     $C086                           ; FD3B AD 86 C0                 ...
        cmp     ($00),y                         ; FD3E D1 00                    ..
        sta     ($00),y                         ; FD40 91 00                    ..
        beq     LFD29                           ; FD42 F0 E5                    ..
LFD44:  clc                                     ; FD44 18                       .
        .byte   $24                             ; FD45 24                       $
LFD46:  sec                                     ; FD46 38                       8
        php                                     ; FD47 08                       .
        jsr     LF4A8                           ; FD48 20 A8 F4                  ..
        lda     $02                             ; FD4B A5 02                    ..
        ldy     $03                             ; FD4D A4 03                    ..
        sta     SEDORIC_RWBUF                   ; FD4F 8D 03 C0                 ...
        sty     SEDORIC_RWBUF+1                 ; FD52 8C 04 C0                 ...
        ldy     #$04                            ; FD55 A0 04                    ..
        lda     ($00),y                         ; FD57 B1 00                    ..
        clc                                     ; FD59 18                       .
        adc     $05                             ; FD5A 65 05                    e.
        sta     $05                             ; FD5C 85 05                    ..
        dey                                     ; FD5E 88                       .
        lda     ($00),y                         ; FD5F B1 00                    ..
        tay                                     ; FD61 A8                       .
        lda     ($04),y                         ; FD62 B1 04                    ..
        pha                                     ; FD64 48                       H
        iny                                     ; FD65 C8                       .
        lda     ($04),y                         ; FD66 B1 04                    ..
        tay                                     ; FD68 A8                       .
        pla                                     ; FD69 68                       h
        plp                                     ; FD6A 28                       (
        bcc     LFD70                           ; FD6B 90 03                    ..
        jmp     LDA9E                           ; FD6D 4C 9E DA                 L..

; ----------------------------------------------------------------------------
LFD70:  jmp     LDA6D                           ; FD70 4C 6D DA                 Lm.

; ----------------------------------------------------------------------------
LFD73:  jsr     LFDCC                           ; FD73 20 CC FD                  ..
        sta     ($02),y                         ; FD76 91 02                    ..
        sec                                     ; FD78 38                       8
        .byte   $24                             ; FD79 24                       $
LFD7A:  clc                                     ; FD7A 18                       .
        jsr     LFDCC                           ; FD7B 20 CC FD                  ..
        iny                                     ; FD7E C8                       .
        bne     LFDC3                           ; FD7F D0 42                    .B
        bcc     LFDA4                           ; FD81 90 21                    .!
        jsr     LFD46                           ; FD83 20 46 FD                  F.
        ldy     #$02                            ; FD86 A0 02                    ..
        lda     ($00),y                         ; FD88 B1 00                    ..
        ldy     #$04                            ; FD8A A0 04                    ..
        cmp     ($00),y                         ; FD8C D1 00                    ..
        bne     LFDA4                           ; FD8E D0 14                    ..
        dey                                     ; FD90 88                       .
        lda     ($00),y                         ; FD91 B1 00                    ..
        tay                                     ; FD93 A8                       .
        iny                                     ; FD94 C8                       .
        iny                                     ; FD95 C8                       .
        beq     LFD9D                           ; FD96 F0 05                    ..
        iny                                     ; FD98 C8                       .
        lda     ($04),y                         ; FD99 B1 04                    ..
        bne     LFDA4                           ; FD9B D0 07                    ..
LFD9D:  lda     #$03                            ; FD9D A9 03                    ..
        ldy     #$00                            ; FD9F A0 00                    ..
        jsr     LF75A                           ; FDA1 20 5A F7                  Z.
LFDA4:  jsr     LF4A8                           ; FDA4 20 A8 F4                  ..
        ldy     #$03                            ; FDA7 A0 03                    ..
        lda     ($00),y                         ; FDA9 B1 00                    ..
        clc                                     ; FDAB 18                       .
        adc     #$02                            ; FDAC 69 02                    i.
        bne     LFDBA                           ; FDAE D0 0A                    ..
        ldy     #$04                            ; FDB0 A0 04                    ..
        lda     ($00),y                         ; FDB2 B1 00                    ..
        adc     #$00                            ; FDB4 69 00                    i.
        sta     ($00),y                         ; FDB6 91 00                    ..
        lda     #$02                            ; FDB8 A9 02                    ..
LFDBA:  ldy     #$03                            ; FDBA A0 03                    ..
        sta     ($00),y                         ; FDBC 91 00                    ..
        jsr     LFD44                           ; FDBE 20 44 FD                  D.
        ldy     #$00                            ; FDC1 A0 00                    ..
LFDC3:  tya                                     ; FDC3 98                       .
        ldy     #$05                            ; FDC4 A0 05                    ..
        sta     ($00),y                         ; FDC6 91 00                    ..
        tay                                     ; FDC8 A8                       .
        lda     ($02),y                         ; FDC9 B1 02                    ..
        rts                                     ; FDCB 60                       `

; ----------------------------------------------------------------------------
LFDCC:  ldy     #$05                            ; FDCC A0 05                    ..
        pha                                     ; FDCE 48                       H
        lda     ($00),y                         ; FDCF B1 00                    ..
        tay                                     ; FDD1 A8                       .
        pla                                     ; FDD2 68                       h
        rts                                     ; FDD3 60                       `

; ----------------------------------------------------------------------------
LFDD4:  ldx     #$0F                            ; FDD4 A2 0F                    ..
        jmp     LD67E                           ; FDD6 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LFDD9:  jsr     LFD0E                           ; FDD9 20 0E FD                  ..
        beq     LFDD4                           ; FDDC F0 F6                    ..
        ldy     #$00                            ; FDDE A0 00                    ..
        sta     ($06),y                         ; FDE0 91 06                    ..
        jsr     LFD7A                           ; FDE2 20 7A FD                  z.
        ldy     #$01                            ; FDE5 A0 01                    ..
        sta     ($06),y                         ; FDE7 91 06                    ..
        iny                                     ; FDE9 C8                       .
        sty     SEDORIC_TRAV3                   ; FDEA 84 F5                    ..
        sta     SEDORIC_TRAV4                   ; FDEC 85 F6                    ..
        inc     SEDORIC_TRAV4                   ; FDEE E6 F6                    ..
LFDF0:  jsr     LFD7A                           ; FDF0 20 7A FD                  z.
        ldy     SEDORIC_TRAV3                   ; FDF3 A4 F5                    ..
        inc     SEDORIC_TRAV3                   ; FDF5 E6 F5                    ..
        sta     ($06),y                         ; FDF7 91 06                    ..
        dec     SEDORIC_TRAV4                   ; FDF9 C6 F6                    ..
        bne     LFDF0                           ; FDFB D0 F3                    ..
        ldy     #$00                            ; FDFD A0 00                    ..
        lda     ($06),y                         ; FDFF B1 06                    ..
        tax                                     ; FE01 AA                       .
        iny                                     ; FE02 C8                       .
        lda     ($06),y                         ; FE03 B1 06                    ..
        rts                                     ; FE05 60                       `

; ----------------------------------------------------------------------------
LFE06:  nop                                     ; FE06 EA                       .
        jsr     LFAC0                           ; FE07 20 C0 FA                  ..
        lda     #$FF                            ; FE0A A9 FF                    ..
        sta     $33                             ; FE0C 85 33                    .3
        sta     $34                             ; FE0E 85 34                    .4
        .byte   $30                             ; FE10 30                       0
LFE11:  ora     #$20                            ; FE11 09 20                    . 
        cpy     #$FA                            ; FE13 C0 FA                    ..
        jsr     LD22C                           ; FE15 20 2C D2                  ,.
        jsr     LD2FA                           ; FE18 20 FA D2                  ..
        php                                     ; FE1B 08                       .
        sei                                     ; FE1C 78                       x
LFE1D:  lda     $33                             ; FE1D A5 33                    .3
        ora     $34                             ; FE1F 05 34                    .4
        beq     LFE36                           ; FE21 F0 13                    ..
        lda     $33                             ; FE23 A5 33                    .3
        bne     LFE29                           ; FE25 D0 02                    ..
        dec     $34                             ; FE27 C6 34                    .4
LFE29:  dec     $33                             ; FE29 C6 33                    .3
        jsr     LFD0E                           ; FE2B 20 0E FD                  ..
        beq     LFE36                           ; FE2E F0 06                    ..
        jsr     LFDD9                           ; FE30 20 D9 FD                  ..
        jmp     LFE1D                           ; FE33 4C 1D FE                 L..

; ----------------------------------------------------------------------------
LFE36:  plp                                     ; FE36 28                       (
        rts                                     ; FE37 60                       `

; ----------------------------------------------------------------------------
LFE38:  ldy     #$00                            ; FE38 A0 00                    ..
        lda     ($06),y                         ; FE3A B1 06                    ..
        jsr     LFD73                           ; FE3C 20 73 FD                  s.
        ldy     #$01                            ; FE3F A0 01                    ..
        lda     ($06),y                         ; FE41 B1 06                    ..
        iny                                     ; FE43 C8                       .
        sty     SEDORIC_TRAV5                   ; FE44 84 F7                    ..
        sta     SEDORIC_TRAV6                   ; FE46 85 F8                    ..
        inc     SEDORIC_TRAV6                   ; FE48 E6 F8                    ..
LFE4A:  jsr     LFD73                           ; FE4A 20 73 FD                  s.
        ldy     SEDORIC_TRAV5                   ; FE4D A4 F7                    ..
        lda     ($06),y                         ; FE4F B1 06                    ..
        inc     SEDORIC_TRAV5                   ; FE51 E6 F7                    ..
        dec     SEDORIC_TRAV6                   ; FE53 C6 F8                    ..
        bne     LFE4A                           ; FE55 D0 F3                    ..
        rts                                     ; FE57 60                       `

; ----------------------------------------------------------------------------
        lsr     SEDORIC_TRAV0                   ; FE58 46 F2                    F.
        lsr     SEDORIC_TRAV2                   ; FE5A 46 F4                    F.
        ldx     #$0C                            ; FE5C A2 0C                    ..
LFE5E:  dex                                     ; FE5E CA                       .
        bmi     LFE83                           ; FE5F 30 22                    0"
        lda     $C091,x                         ; FE61 BD 91 C0                 ...
        sta     $C029,x                         ; FE64 9D 29 C0                 .).
        ldy     $C09E,x                         ; FE67 BC 9E C0                 ...
        cmp     #$3F                            ; FE6A C9 3F                    .?
        beq     LFE76                           ; FE6C F0 08                    ..
        cpy     #$3F                            ; FE6E C0 3F                    .?
        bne     LFE5E                           ; FE70 D0 EC                    ..
        ror     SEDORIC_TRAV0                   ; FE72 66 F2                    f.
        bne     LFE5E                           ; FE74 D0 E8                    ..
LFE76:  ror     SEDORIC_TRAV2                   ; FE76 66 F4                    f.
        bit     $16                             ; FE78 24 16                    $.
        bvs     LFE5E                           ; FE7A 70 E2                    p.
        cpy     #$3F                            ; FE7C C0 3F                    .?
        beq     LFE5E                           ; FE7E F0 DE                    ..
LFE80:  jmp     LD5AC                           ; FE80 4C AC D5                 L..

; ----------------------------------------------------------------------------
LFE83:  bit     SEDORIC_TRAV0                   ; FE83 24 F2                    $.
        bpl     LFE93                           ; FE85 10 0C                    ..
        ldx     #$0C                            ; FE87 A2 0C                    ..
LFE89:  lda     $C09D,x                         ; FE89 BD 9D C0                 ...
        cmp     #$3F                            ; FE8C C9 3F                    .?
        bne     LFE80                           ; FE8E D0 F0                    ..
        dex                                     ; FE90 CA                       .
        bne     LFE89                           ; FE91 D0 F6                    ..
LFE93:  cli                                     ; FE93 58                       X
LFE94:  rts                                     ; FE94 60                       `

; ----------------------------------------------------------------------------
        .byte   $20                             ; FE95 20                        
        .byte   $C5                             ; FE96 C5                       .
LFE97:  .byte   $E7                             ; FE97 E7                       .
        jsr     LFAC0                           ; FE98 20 C0 FA                  ..
LFE9B:  jsr     SEDORIC_KEYBOARD_WAIT           ; FE9B 20 02 D3                  ..
        bpl     LFEAC                           ; FE9E 10 0C                    ..
LFEA0:  jsr     LFF3D                           ; FEA0 20 3D FF                  =.
        cmp     #$20                            ; FEA3 C9 20                    . 
        beq     LFEAC                           ; FEA5 F0 05                    ..
        cmp     #$03                            ; FEA7 C9 03                    ..
        bne     LFEA0                           ; FEA9 D0 F5                    ..
        rts                                     ; FEAB 60                       `

; ----------------------------------------------------------------------------
LFEAC:  jsr     LFD0E                           ; FEAC 20 0E FD                  ..
        beq     LFEC7                           ; FEAF F0 16                    ..
        jsr     LFDD9                           ; FEB1 20 D9 FD                  ..
        beq     LFE9B                           ; FEB4 F0 E5                    ..
        sta     SEDORIC_TRAV0                   ; FEB6 85 F2                    ..
        txa                                     ; FEB8 8A                       .
        bpl     LFECA                           ; FEB9 10 0F                    ..
LFEBB:  iny                                     ; FEBB C8                       .
        lda     ($06),y                         ; FEBC B1 06                    ..
        jsr     XAFCAR                          ; FEBE 20 2A D6                  *.
        dec     SEDORIC_TRAV0                   ; FEC1 C6 F2                    ..
        bne     LFEBB                           ; FEC3 D0 F6                    ..
        beq     LFE9B                           ; FEC5 F0 D4                    ..
LFEC7:  jmp     LE7D6                           ; FEC7 4C D6 E7                 L..

; ----------------------------------------------------------------------------
LFECA:  clc                                     ; FECA 18                       .
        lda     $06                             ; FECB A5 06                    ..
        ldy     $07                             ; FECD A4 07                    ..
        adc     #$02                            ; FECF 69 02                    i.
        bcc     LFED4                           ; FED1 90 01                    ..
        iny                                     ; FED3 C8                       .
LFED4:  jsr     LD2BA                           ; FED4 20 BA D2                  ..
        jsr     LD2D2                           ; FED7 20 D2 D2                  ..
        jsr     XAFSTR                          ; FEDA 20 37 D6                  7.
        .byte   $4C                             ; FEDD 4C                       L
        .byte   $9B                             ; FEDE 9B                       .
LFEDF:  inc     $0720,x                         ; FEDF FE 20 07                 . .
        inc     a:$20,x                         ; FEE2 FE 20 00                 . .
        .byte   $FF                             ; FEE5 FF                       .
LFEE6:  jsr     LFF3D                           ; FEE6 20 3D FF                  =.
        ldy     SEDORIC_TRAV0                   ; FEE9 A4 F2                    ..
        cmp     #$03                            ; FEEB C9 03                    ..
        beq     LFF37                           ; FEED F0 48                    .H
        cmp     #$0D                            ; FEEF C9 0D                    ..
        bne     LFEF8                           ; FEF1 D0 05                    ..
        jsr     LFF1B                           ; FEF3 20 1B FF                  ..
        lda     #$0A                            ; FEF6 A9 0A                    ..
LFEF8:  jsr     LFF1B                           ; FEF8 20 1B FF                  ..
        sty     SEDORIC_TRAV0                   ; FEFB 84 F2                    ..
        jmp     LFEE6                           ; FEFD 4C E6 FE                 L..

; ----------------------------------------------------------------------------
LFF00:  brk                                     ; FF00 00                       .
        brk                                     ; FF01 00                       .
        .byte   $F4                             ; FF02 F4                       .
        lda     #$80                            ; FF03 A9 80                    ..
        sta     ($06),y                         ; FF05 91 06                    ..
        iny                                     ; FF07 C8                       .
        lda     #$D8                            ; FF08 A9 D8                    ..
        sta     ($06),y                         ; FF0A 91 06                    ..
        lda     #$00                            ; FF0C A9 00                    ..
        iny                                     ; FF0E C8                       .
        sty     SEDORIC_TRAV0                   ; FF0F 84 F2                    ..
LFF11:  sta     ($06),y                         ; FF11 91 06                    ..
        iny                                     ; FF13 C8                       .
        cpy     #$DA                            ; FF14 C0 DA                    ..
        bne     LFF11                           ; FF16 D0 F9                    ..
        ldy     #$02                            ; FF18 A0 02                    ..
LFF1A:  rts                                     ; FF1A 60                       `

; ----------------------------------------------------------------------------
LFF1B:  sta     ($06),y                         ; FF1B 91 06                    ..
        jsr     XAFCAR                          ; FF1D 20 2A D6                  *.
        iny                                     ; FF20 C8                       .
        cpy     #$DA                            ; FF21 C0 DA                    ..
        bne     LFF1A                           ; FF23 D0 F5                    ..
LFF25:  jsr     LFE38                           ; FF25 20 38 FE                  8.
        lda     #$FF                            ; FF28 A9 FF                    ..
        jsr     LFDCC                           ; FF2A 20 CC FD                  ..
        sta     ($02),y                         ; FF2D 91 02                    ..
        jsr     LFD46                           ; FF2F 20 46 FD                  F.
        ldy     #$02                            ; FF32 A0 02                    ..
        jmp     LFF00                           ; FF34 4C 00 FF                 L..

; ----------------------------------------------------------------------------
LFF37:  jsr     LFF25                           ; FF37 20 25 FF                  %.
        jmp     LFD46                           ; FF3A 4C 46 FD                 LF.

; ----------------------------------------------------------------------------
LFF3D:  jsr     LD845                           ; FF3D 20 45 D8                  E.
        bpl     LFF3D                           ; FF40 10 FB                    ..
        rts                                     ; FF42 60                       `

; ----------------------------------------------------------------------------
; System Vectors
SEDORIC_VECTORS:
        jmp     LED36                           ; FF43 4C 36 ED                 L6.

; ----------------------------------------------------------------------------
        jmp     LD398                           ; FF46 4C 98 D3                 L..

; ----------------------------------------------------------------------------
        jmp     LD39E                           ; FF49 4C 9E D3                 L..

; ----------------------------------------------------------------------------
        jmp     LD44F                           ; FF4C 4C 4F D4                 LO.

; ----------------------------------------------------------------------------
        jmp     LD451                           ; FF4F 4C 51 D4                 LQ.

; ----------------------------------------------------------------------------
        jmp     LD364                           ; FF52 4C 64 D3                 Ld.

; ----------------------------------------------------------------------------
        jmp     LF3F3                           ; FF55 4C F3 F3                 L..

; ----------------------------------------------------------------------------
        jmp     LF4A8                           ; FF58 4C A8 F4                 L..

; ----------------------------------------------------------------------------
        jmp     LFDD9                           ; FF5B 4C D9 FD                 L..

; ----------------------------------------------------------------------------
        jmp     LFE38                           ; FF5E 4C 38 FE                 L8.

; ----------------------------------------------------------------------------
        jmp     LFD46                           ; FF61 4C 46 FD                 LF.

; ----------------------------------------------------------------------------
        jmp     XAFCAR                          ; FF64 4C 2A D6                 L*.

; ----------------------------------------------------------------------------
        jmp     XAFHEX                          ; FF67 4C 13 D6                 L..

; ----------------------------------------------------------------------------
        jmp     XAFSTR                          ; FF6A 4C 37 D6                 L7.

; ----------------------------------------------------------------------------
        jmp     SEDORIC_XROM                    ; FF6D 4C D8 D5                 L..

; ----------------------------------------------------------------------------
        jmp     LE0EA                           ; FF70 4C EA E0                 L..

; ----------------------------------------------------------------------------
        jmp     LE0E5                           ; FF73 4C E5 E0                 L..

; ----------------------------------------------------------------------------
        jmp     LDE28                           ; FF76 4C 28 DE                 L(.

; ----------------------------------------------------------------------------
        jmp     LDFE6                           ; FF79 4C E6 DF                 L..

; ----------------------------------------------------------------------------
        jmp     LDE9C                           ; FF7C 4C 9C DE                 L..

; ----------------------------------------------------------------------------
        jmp     LE266                           ; FF7F 4C 66 E2                 Lf.

; ----------------------------------------------------------------------------
        jmp     XCREAY                          ; FF82 4C 2D DD                 L-.

; ----------------------------------------------------------------------------
        jmp     XDETSE                          ; FF85 4C 15 DD                 L..

; ----------------------------------------------------------------------------
        jmp     XLIBSE                          ; FF88 4C 6C DC                 Ll.

; ----------------------------------------------------------------------------
        jmp     XWDESC                          ; FF8B 4C C0 DB                 L..

; ----------------------------------------------------------------------------
        jmp     XTRVCA                          ; FF8E 4C 59 DB                 LY.

; ----------------------------------------------------------------------------
        jmp     LDBA5                           ; FF91 4C A5 DB                 L..

; ----------------------------------------------------------------------------
        jmp     LDB41                           ; FF94 4C 41 DB                 LA.

; ----------------------------------------------------------------------------
        jmp     XTVNM                           ; FF97 4C 30 DB                 L0.

; ----------------------------------------------------------------------------
        jmp     LDB2D                           ; FF9A 4C 2D DB                 L-.

; ----------------------------------------------------------------------------
        jmp     LDB07                           ; FF9D 4C 07 DB                 L..

; ----------------------------------------------------------------------------
        jmp     LDAFE                           ; FFA0 4C FE DA                 L..

; ----------------------------------------------------------------------------
        jmp     LDAEE                           ; FFA3 4C EE DA                 L..

; ----------------------------------------------------------------------------
        jmp     LDACE                           ; FFA6 4C CE DA                 L..

; ----------------------------------------------------------------------------
        jmp     XSVSEC                          ; FFA9 4C A4 DA                 L..

; ----------------------------------------------------------------------------
        jmp     LDA9E                           ; FFAC 4C 9E DA                 L..

; ----------------------------------------------------------------------------
        jmp     LDA91                           ; FFAF 4C 91 DA                 L..

; ----------------------------------------------------------------------------
        jmp     XSCAT                           ; FFB2 4C 82 DA                 L..

; ----------------------------------------------------------------------------
        jmp     XSMAP                           ; FFB5 4C 8A DA                 L..

; ----------------------------------------------------------------------------
        jmp     XPRSEC                          ; FFB8 4C 73 DA                 Ls.

; ----------------------------------------------------------------------------
        jmp     LDA6D                           ; FFBB 4C 6D DA                 Lm.

; ----------------------------------------------------------------------------
        jmp     READ_SECTOR_TRACK               ; FFBE 4C 5D DA                 L].

; ----------------------------------------------------------------------------
        jmp     XPMAP                           ; FFC1 4C 4C DA                 LL.

; ----------------------------------------------------------------------------
        jmp     XRWTS                           ; FFC4 4C CD CF                 L..

; ----------------------------------------------------------------------------
COPYRIGHT_TEXT:
        .byte   "SEDORIC 1.0 par F.B"           ; FFC7 53 45 44 4F 52 49 43 20  SEDORIC 
                                                ; FFCF 31 2E 30 20 70 61 72 20  1.0 par 
                                                ; FFD7 46 2E 42                 F.B
LFFDA:  .byte   "ROCHE et D.SEBBAG(c) 1985 EUREK"; FFDA 52 4F 43 48 45 20 65 74 ROCHE et
                                                ; FFE2 20 44 2E 53 45 42 42 41   D.SEBBA
                                                ; FFEA 47 28 63 29 20 31 39 38  G(c) 198
                                                ; FFF2 35 20 45 55 52 45 4B     5 EUREK
        .byte   "A"                             ; FFF9 41                       A
; ----------------------------------------------------------------------------
NMI_VECTOR:
        .addr   LD121                           ; FFFA 21 D1                    !.
RESET_VECTOR:
        .addr   L2310                           ; FFFC 10 23                    .#
; ----------------------------------------------------------------------------
IRQ_VECTOR:
        .word   $B97B                           ; FFFE 7B B9                    {.
