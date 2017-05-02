; da65 V2.15
; Created:    2017-05-02 09:43:45
; Input file: B7STRA40.rom
; Page:       1


        .setcpu "6502"

; ----------------------------------------------------------------------------
L0000           := $0000
L0008           := $0008
L001A           := $001A
L0044           := $0044
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
L0228           := $0228
BASIC10_IRQ_VECTOR:= $0229                      ; Vecteur IRQ Oric -1
BASIC10_IRQ2_VECTOR:= $022C                     ; Vecteur IRQ Oric -1
BASIC11_KEYBOARD_GET_VECTOR:= $023C             ; Vecteur Prendre un caractère au clavier (EB78 ATMOS et 045B SEDORIC)
L0244           := $0244
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
L041E           := $041E
DO_EXEVEC       := $0453                        ; Exec code inside overlay
L0467           := $0467
L046B           := $046B
L0471           := $0471
DO_RAMROM       := $0477                        ; Switch from ROM to Overlay and vice-versa
L0487           := $0487
SED_IRQ         := $0488                        ; Replaces IRQ
SED_COLDSTART   := $04A8                        ; Replaces COLDSTART
L04AD           := $04AD
DO_IRQRAM       := $04B3                        ; forwards IRQ/NMI from overlay to ROM
L04B4           := $04B4
L04D1           := $04D1
L04E9           := $04E9
EXERAM          := $04EC
EXEVEC          := $04EF
RAMROM          := $04F2
IRQRAM          := $04F5
NMIRAM          := $04F8
MICRODISC_CONTROL_SHADOW:= $04FB                ; Caches the control register as it's write-only
FLAGIF          := $04FC                        ; b7=1 if inside IF
SEDORIC_IDERROR := $04FD                        ; id of Error
NOLIGN          := $04FE                        ; Line of Error
L0D21           := $0D21
L2020           := $2020
L234C           := $234C
L2A2A           := $2A2A
L3F20           := $3F20
L4142           := $4142
L4143           := $4143
L414F           := $414F
L4154           := $4154
L4157           := $4157
L4420           := $4420
L4544           := $4544
L4550           := $4550
L4645           := $4645
L4944           := $4944
L4C41           := $4C41
L4D45           := $4D45
L4F44           := $4F44
L4F46           := $4F46
L4F4E           := $4F4E
L4F53           := $4F53
L5020           := $5020
L5244           := $5244
L5246           := $5246
L52AD           := $52AD
L534F           := $534F
L54A3           := $54A3
L574F           := $574F
L5B20           := $5B20
L6C61           := $6C61
L7369           := $7369
LA0D2           := $A0D2
LB800           := $B800
LB900           := $B900
LBBDE           := $BBDE
; ----------------------------------------------------------------------------
LC000:  .byte   $AD                             ; C000 AD                       .
LC001:  .byte   $07                             ; C001 07                       .
LC002:  .byte   $C0                             ; C002 C0                       .
LC003:  lsr     a                               ; C003 4A                       J
LC004:  .byte   $A9                             ; C004 A9                       .
LC005:  brk                                     ; C005 00                       .
LC006:  ror     a                               ; C006 6A                       j
LC007:  .byte   $8D                             ; C007 8D                       .
        .byte   $24                             ; C008 24                       $
LC009:  .byte   $C0                             ; C009 C0                       .
LC00A:  .byte   $10                             ; C00A 10                       .
LC00B:  .byte   $0F                             ; C00B 0F                       .
LC00C:  .byte   $A9                             ; C00C A9                       .
LC00D:  .byte   $50                             ; C00D 50                       P
LC00E:  .byte   $8D                             ; C00E 8D                       .
LC00F:  .byte   $56                             ; C00F 56                       V
LC010:  .byte   $02                             ; C010 02                       .
LC011:  lsr     a                               ; C011 4A                       J
LC012:  .byte   $85                             ; C012 85                       .
LC013:  .byte   $31                             ; C013 31                       1
LC014:  .byte   $85                             ; C014 85                       .
LC015:  .byte   $32                             ; C015 32                       2
LC016:  .byte   $8D                             ; C016 8D                       .
LC017:  .byte   $57                             ; C017 57                       W
LC018:  .byte   $02                             ; C018 02                       .
LC019:  .byte   $D0                             ; C019 D0                       .
LC01A:  .byte   $06                             ; C01A 06                       .
LC01B:  .byte   $A9                             ; C01B A9                       .
LC01C:  .byte   $5D                             ; C01C 5D                       ]
LC01D:  .byte   $85                             ; C01D 85                       .
LC01E:  .byte   $31                             ; C01E 31                       1
LC01F:  .byte   $85                             ; C01F 85                       .
LC020:  .byte   $32                             ; C020 32                       2
LC021:  .byte   $EE                             ; C021 EE                       .
LC022:  .byte   $C1                             ; C022 C1                       .
LC023:  .byte   $02                             ; C023 02                       .
LC024:  .byte   $EE                             ; C024 EE                       .
LC025:  .byte   $C2                             ; C025 C2                       .
LC026:  .byte   $02                             ; C026 02                       .
LC027:  .byte   $A2                             ; C027 A2                       .
LC028:  brk                                     ; C028 00                       .
LC029:  lda     LC600,x                         ; C029 BD 00 C6                 ...
        bit     LC024                           ; C02C 2C 24 C0                 ,$.
        bpl     LC034                           ; C02F 10 03                    ..
        .byte   $BD                             ; C031 BD                       .
LC032:  brk                                     ; C032 00                       .
        .byte   $C7                             ; C033 C7                       .
LC034:  .byte   $9D                             ; C034 9D                       .
LC035:  brk                                     ; C035 00                       .
LC036:  .byte   $04                             ; C036 04                       .
LC037:  inx                                     ; C037 E8                       .
LC038:  .byte   $D0                             ; C038 D0                       .
LC039:  .byte   $EF                             ; C039 EF                       .
        lda     #$4C                            ; C03A A9 4C                    .L
        .byte   $A0                             ; C03C A0                       .
LC03D:  brk                                     ; C03D 00                       .
        ldx     #$04                            ; C03E A2 04                    ..
        sta     $EF                             ; C040 85 EF                    ..
LC042:  .byte   $84                             ; C042 84                       .
LC043:  .byte   $F0                             ; C043 F0                       .
LC044:  .byte   $86                             ; C044 86                       .
LC045:  .byte   $F1                             ; C045 F1                       .
LC046:  .byte   $A9                             ; C046 A9                       .
LC047:  dey                                     ; C047 88                       .
LC048:  .byte   $A0                             ; C048 A0                       .
LC049:  .byte   $C4                             ; C049 C4                       .
LC04A:  .byte   $2C                             ; C04A 2C                       ,
LC04B:  .byte   $24                             ; C04B 24                       $
LC04C:  .byte   $C0                             ; C04C C0                       .
LC04D:  .byte   $10                             ; C04D 10                       .
LC04E:  .byte   $26                             ; C04E 26                       &
LC04F:  .byte   $8D                             ; C04F 8D                       .
LC050:  .byte   $45                             ; C050 45                       E
LC051:  .byte   $02                             ; C051 02                       .
LC052:  .byte   $8E                             ; C052 8E                       .
LC053:  .byte   $46                             ; C053 46                       F
LC054:  .byte   $02                             ; C054 02                       .
LC055:  .byte   $8C                             ; C055 8C                       .
LC056:  pha                                     ; C056 48                       H
LC057:  .byte   $02                             ; C057 02                       .
LC058:  .byte   $8E                             ; C058 8E                       .
LC059:  .byte   $49                             ; C059 49                       I
LC05A:  .byte   $02                             ; C05A 02                       .
LC05B:  .byte   $A9                             ; C05B A9                       .
LC05C:  .byte   $5B                             ; C05C 5B                       [
LC05D:  .byte   $8D                             ; C05D 8D                       .
LC05E:  .byte   $3C                             ; C05E 3C                       <
LC05F:  .byte   $02                             ; C05F 02                       .
        stx     BASIC11_KEYBOARD_GET_VECTOR+1   ; C060 8E 3D 02                 .=.
        lda     #$09                            ; C063 A9 09                    ..
        .byte   $A0                             ; C065 A0                       .
LC066:  .byte   $01                             ; C066 01                       .
LC067:  .byte   $8D                             ; C067 8D                       .
LC068:  .byte   $4E                             ; C068 4E                       N
LC069:  .byte   $02                             ; C069 02                       .
LC06A:  .byte   $8C                             ; C06A 8C                       .
LC06B:  .byte   $4F                             ; C06B 4F                       O
LC06C:  .byte   $02                             ; C06C 02                       .
LC06D:  .byte   $A9                             ; C06D A9                       .
LC06E:  .byte   $0F                             ; C06E 0F                       .
LC06F:  .byte   $A2                             ; C06F A2                       .
LC070:  .byte   $70                             ; C070 70                       p
LC071:  .byte   $A0                             ; C071 A0                       .
LC072:  .byte   $D0                             ; C072 D0                       .
LC073:  bne     LC087                           ; C073 D0 12                    ..
LC075:  .byte   $8D                             ; C075 8D                       .
LC076:  and     #$02                            ; C076 29 02                    ).
        stx     BASIC10_IRQ_VECTOR+1            ; C078 8E 2A 02                 .*.
LC07B:  .byte   $8C                             ; C07B 8C                       .
LC07C:  .byte   $2C                             ; C07C 2C                       ,
LC07D:  .byte   $02                             ; C07D 02                       .
LC07E:  .byte   $8E                             ; C07E 8E                       .
LC07F:  .byte   $2D                             ; C07F 2D                       -
LC080:  .byte   $02                             ; C080 02                       .
LC081:  .byte   $A9                             ; C081 A9                       .
LC082:  .byte   $07                             ; C082 07                       .
LC083:  .byte   $A2                             ; C083 A2                       .
LC084:  .byte   $E4                             ; C084 E4                       .
LC085:  .byte   $A0                             ; C085 A0                       .
LC086:  .byte   $CF                             ; C086 CF                       .
LC087:  .byte   $8D                             ; C087 8D                       .
LC088:  ror     a                               ; C088 6A                       j
        .byte   $02                             ; C089 02                       .
        stx     $02F9                           ; C08A 8E F9 02                 ...
        sty     $02FA                           ; C08D 8C FA 02                 ...
        .byte   $A2                             ; C090 A2                       .
LC091:  .byte   $04                             ; C091 04                       .
        lda     #$9A                            ; C092 A9 9A                    ..
        ldy     #$D0                            ; C094 A0 D0                    ..
        sta     IRQ_VECTOR                      ; C096 8D FE FF                 ...
        sty     IRQ_VECTOR+1                    ; C099 8C FF FF                 ...
        .byte   $A9                             ; C09C A9                       .
LC09D:  .byte   $67                             ; C09D 67                       g
LC09E:  ldy     #$61                            ; C09E A0 61                    .a
        sta     BASIC11_BANG_VECTOR             ; C0A0 8D F5 02                 ...
        stx     BASIC11_BANG_VECTOR+1           ; C0A3 8E F6 02                 ...
        sty     BASIC11_ESPERLUETTE_VECTOR      ; C0A6 8C FC 02                 ...
LC0A9:  stx     BASIC11_ESPERLUETTE_VECTOR+1    ; C0A9 8E FD 02                 ...
        lda     #$00                            ; C0AC A9 00                    ..
        sta     LC009                           ; C0AE 8D 09 C0                 ...
        sta     LC00A                           ; C0B1 8D 0A C0                 ...
        sta     LC00B                           ; C0B4 8D 0B C0                 ...
        sta     LC00C                           ; C0B7 8D 0C C0                 ...
        sta     LC015                           ; C0BA 8D 15 C0                 ...
        sta     LC018                           ; C0BD 8D 18 C0                 ...
        sta     BASIC11_LAST_KEY_PRESSED        ; C0C0 8D DF 02                 ...
        sta     LC048                           ; C0C3 8D 48 C0                 .H.
        sta     $87                             ; C0C6 85 87                    ..
        lda     #$85                            ; C0C8 A9 85                    ..
        ldy     #$D6                            ; C0CA A0 D6                    ..
        sta     LC01D                           ; C0CC 8D 1D C0                 ...
        sty     LC01E                           ; C0CF 8C 1E C0                 ...
        lda     MICRODISC_FDC_TRACK             ; C0D2 AD 11 03                 ...
        sta     LC00C                           ; C0D5 8D 0C C0                 ...
        lda     #$23                            ; C0D8 A9 23                    .#
        ldy     #$DE                            ; C0DA A0 DE                    ..
        ldx     #$80                            ; C0DC A2 80                    ..
        sta     LC066                           ; C0DE 8D 66 C0                 .f.
        sty     LC067                           ; C0E1 8C 67 C0                 .g.
        stx     LC068                           ; C0E4 8E 68 C0                 .h.
        sta     LC069                           ; C0E7 8D 69 C0                 .i.
        sty     LC06A                           ; C0EA 8C 6A C0                 .j.
        stx     LC06B                           ; C0ED 8E 6B C0                 .k.
        sta     LC06C                           ; C0F0 8D 6C C0                 .l.
        sty     LC06D                           ; C0F3 8C 6D C0                 .m.
        stx     LC06E                           ; C0F6 8E 6E C0                 .n.
        sta     LC06F                           ; C0F9 8D 6F C0                 .o.
        sty     LC070                           ; C0FC 8C 70 C0                 .p.
LC0FF:  .byte   $8E                             ; C0FF 8E                       .
LC100:  .byte   $71                             ; C100 71                       q
LC101:  .byte   $C0                             ; C101 C0                       .
LC102:  .byte   $A9                             ; C102 A9                       .
LC103:  .byte   $2E                             ; C103 2E                       .
LC104:  .byte   $8D                             ; C104 8D                       .
LC105:  .byte   $75                             ; C105 75                       u
LC106:  .byte   $C0                             ; C106 C0                       .
LC107:  .byte   $A9                             ; C107 A9                       .
LC108:  .byte   $1A                             ; C108 1A                       .
LC109:  ldy     #$00                            ; C109 A0 00                    ..
        sta     EXEVEC+1                        ; C10B 8D F0 04                 ...
        sty     EXEVEC+2                        ; C10E 8C F1 04                 ...
        lda     L0000                           ; C111 A5 00                    ..
        beq     LC127                           ; C113 F0 12                    ..
        ldx     #$FF                            ; C115 A2 FF                    ..
LC117:  inx                                     ; C117 E8                       .
        lda     LC574,x                         ; C118 BD 74 C5                 .t.
        sta     LB900,x                         ; C11B 9D 00 B9                 ...
LC11E:  bne     LC117                           ; C11E D0 F7                    ..
        lda     #$00                            ; C120 A9 00                    ..
        ldy     #$B9                            ; C122 A0 B9                    ..
        jsr     EXERAM                          ; C124 20 EC 04                  ..
LC127:  lda     #$14                            ; C127 A9 14                    ..
        ldy     #$01                            ; C129 A0 01                    ..
        jsr     LDA5D                           ; C12B 20 5D DA                  ].
        ldx     #$08                            ; C12E A2 08                    ..
LC130:  lda     LC100,x                         ; C130 BD 00 C1                 ...
        sta     LC039,x                         ; C133 9D 39 C0                 .9.
        cpx     #$05                            ; C136 E0 05                    ..
        bcc     LC13D                           ; C138 90 03                    ..
        sta     LC03D,x                         ; C13A 9D 3D C0                 .=.
LC13D:  dex                                     ; C13D CA                       .
        bpl     LC130                           ; C13E 10 F0                    ..
        jsr     LEBA3                           ; C140 20 A3 EB                  ..
        jsr     LD5D8                           ; C143 20 D8 D5                  ..
        cpx     #$F7                            ; C146 E0 F7                    ..
        asl     SEDORIC_TRAV6,x                 ; C148 16 F8                    ..
        ldx     #$41                            ; C14A A2 41                    .A
LC14C:  lda     LC11E,x                         ; C14C BD 1E C1                 ...
        sta     $36,x                           ; C14F 95 36                    .6
        dex                                     ; C151 CA                       .
        bpl     LC14C                           ; C152 10 F8                    ..
        lda     #$3A                            ; C154 A9 3A                    .:
        sta     $35                             ; C156 85 35                    .5
        jsr     LD206                           ; C158 20 06 D2                  ..
        lda     #$BD                            ; C15B A9 BD                    ..
        ldy     #$C4                            ; C15D A0 C4                    ..
        bit     LC024                           ; C15F 2C 24 C0                 ,$.
        bmi     LC166                           ; C162 30 02                    0.
        lda     #$CD                            ; C164 A9 CD                    ..
LC166:  sta     EXEVEC+1                        ; C166 8D F0 04                 ...
        sty     EXEVEC+2                        ; C169 8C F1 04                 ...
        ldx     #$34                            ; C16C A2 34                    .4
        ldy     #$00                            ; C16E A0 00                    ..
        cli                                     ; C170 58                       X
        jmp     L0471                           ; C171 4C 71 04                 Lq.

; ----------------------------------------------------------------------------
        asl     a                               ; C174 0A                       .
        sty     $2A81                           ; C175 8C 81 2A                 ..*
        rol     a                               ; C178 2A                       *
        jsr     L4157                           ; C179 20 57 41                  WA
        .byte   $52                             ; C17C 52                       R
        lsr     $4E49                           ; C17D 4E 49 4E                 NIN
        .byte   $47                             ; C180 47                       G
        jsr     L2A2A                           ; C181 20 2A 2A                  **
        dey                                     ; C184 88                       .
        .byte   $87                             ; C185 87                       .
        .byte   $44                             ; C186 44                       D
        .byte   $4F                             ; C187 4F                       O
        .byte   $53                             ; C188 53                       S
LC189:  jsr     L7369                           ; C189 20 69 73                  is
        jsr     L6C61                           ; C18C 20 61 6C                  al
        .byte   $74                             ; C18F 74                       t
        adc     $72                             ; C190 65 72                    er
        adc     $64                             ; C192 65 64                    ed
        jsr     L0D21                           ; C194 20 21 0D                  !.
        asl     a                               ; C197 0A                       .
        brk                                     ; C198 00                       .
        jmp     LD364                           ; C199 4C 64 D3                 Ld.

; ----------------------------------------------------------------------------
        rts                                     ; C19C 60                       `

; ----------------------------------------------------------------------------
        lda     LC5AE                           ; C19D AD AE C5                 ...
        .byte   $AE                             ; C1A0 AE                       .
        .byte   $AF                             ; C1A1 AF                       .
LC1A2:  cmp     $8D                             ; C1A2 C5 8D                    ..
        ora     ($C0,x)                         ; C1A4 01 C0                    ..
        stx     LC002                           ; C1A6 8E 02 C0                 ...
        lda     LC5B0                           ; C1A9 AD B0 C5                 ...
        bne     LC189                           ; C1AC D0 DB                    ..
        .byte   $27                             ; C1AE 27                       '
        ora     #$1A                            ; C1AF 09 1A                    ..
        eor     #$4E                            ; C1B1 49 4E                    IN
        jsr     L5244                           ; C1B3 20 44 52                  DR
        eor     #$56                            ; C1B6 49 56                    IV
        eor     $A0                             ; C1B8 45 A0                    E.
        jmp     L414F                           ; C1BA 4C 4F 41                 LOA

; ----------------------------------------------------------------------------
        .byte   $44                             ; C1BD 44                       D
        jsr     L4944                           ; C1BE 20 44 49                  DI
        .byte   $53                             ; C1C1 53                       S
        .byte   $43                             ; C1C2 43                       C
        .byte   $53                             ; C1C3 53                       S
        jsr     L4F46                           ; C1C4 20 46 4F                  FO
        .byte   $52                             ; C1C7 52                       R
        jsr     L4142                           ; C1C8 20 42 41                  BA
        .byte   $43                             ; C1CB 43                       C
        .byte   $4B                             ; C1CC 4B                       K
        eor     $50,x                           ; C1CD 55 50                    UP
        jsr     L5246                           ; C1CF 20 46 52                  FR
        .byte   $4F                             ; C1D2 4F                       O
        eor     $20A0                           ; C1D3 4D A0 20                 M. 
        .byte   $54                             ; C1D6 54                       T
        .byte   $4F                             ; C1D7 4F                       O
        ldy     #$0D                            ; C1D8 A0 0D                    ..
        asl     a                               ; C1DA 0A                       .
        jmp     L414F                           ; C1DB 4C 4F 41                 LOA

; ----------------------------------------------------------------------------
        .byte   $44                             ; C1DE 44                       D
        jsr     L4F53                           ; C1DF 20 53 4F                  SO
        eor     $52,x                           ; C1E2 55 52                    UR
        .byte   $43                             ; C1E4 43                       C
        eor     $20                             ; C1E5 45 20                    E 
        .byte   $44                             ; C1E7 44                       D
        eor     #$53                            ; C1E8 49 53                    IS
        .byte   $43                             ; C1EA 43                       C
        ldy     #$0D                            ; C1EB A0 0D                    ..
        asl     a                               ; C1ED 0A                       .
        jmp     L414F                           ; C1EE 4C 4F 41                 LOA

; ----------------------------------------------------------------------------
        .byte   $44                             ; C1F1 44                       D
        jsr     L4154                           ; C1F2 20 54 41                  TA
        .byte   $52                             ; C1F5 52                       R
        .byte   $47                             ; C1F6 47                       G
        eor     $54                             ; C1F7 45 54                    ET
        jsr     L4944                           ; C1F9 20 44 49                  DI
        .byte   $53                             ; C1FC 53                       S
        .byte   $43                             ; C1FD 43                       C
        ldy     #$0D                            ; C1FE A0 0D                    ..
LC200:  cmp     #$30                            ; C200 C9 30                    .0
LC202:  .byte   $90                             ; C202 90                       .
LC203:  .byte   $04                             ; C203 04                       .
LC204:  .byte   $C9                             ; C204 C9                       .
LC205:  .byte   $3A                             ; C205 3A                       :
LC206:  .byte   $90                             ; C206 90                       .
LC207:  .byte   $35                             ; C207 35                       5
LC208:  .byte   $86                             ; C208 86                       .
LC209:  .byte   $0F                             ; C209 0F                       .
LC20A:  tax                                     ; C20A AA                       .
LC20B:  .byte   $30                             ; C20B 30                       0
LC20C:  rol     $C185                           ; C20C 2E 85 C1                 ...
        pla                                     ; C20F 68                       h
LC210:  tax                                     ; C210 AA                       .
        pla                                     ; C211 68                       h
        pha                                     ; C212 48                       H
        cpx     #$F7                            ; C213 E0 F7                    ..
        .byte   $D0                             ; C215 D0                       .
LC216:  .byte   $04                             ; C216 04                       .
        cmp     #$C8                            ; C217 C9 C8                    ..
        beq     LC224                           ; C219 F0 09                    ..
LC21B:  cpx     #$58                            ; C21B E0 58                    .X
        bne     LC237                           ; C21D D0 18                    ..
        cmp     #$CA                            ; C21F C9 CA                    ..
        bne     LC237                           ; C221 D0 14                    ..
        .byte   $24                             ; C223 24                       $
LC224:  clc                                     ; C224 18                       .
        ror     FLAGIF                          ; C225 6E FC 04                 n..
        ldy     #$FF                            ; C228 A0 FF                    ..
LC22A:  iny                                     ; C22A C8                       .
        lda     ($E9),y                         ; C22B B1 E9                    ..
        beq     LC240                           ; C22D F0 11                    ..
        cmp     #$3A                            ; C22F C9 3A                    .:
        beq     LC240                           ; C231 F0 0D                    ..
        cmp     #$D4                            ; C233 C9 D4                    ..
        bne     LC22A                           ; C235 D0 F3                    ..
LC237:  txa                                     ; C237 8A                       .
        pha                                     ; C238 48                       H
        lda     $C1                             ; C239 A5 C1                    ..
LC23B:  ldx     $0F                             ; C23B A6 0F                    ..
LC23D:  jmp     LEA41                           ; C23D 4C 41 EA                 LA.

; ----------------------------------------------------------------------------
LC240:  pla                                     ; C240 68                       h
        jsr     L04E9                           ; C241 20 E9 04                  ..
        jsr     L0467                           ; C244 20 67 04                  g.
        asl     FLAGIF                          ; C247 0E FC 04                 ...
        bcs     LC24F                           ; C24A B0 03                    ..
        jmp     LC8AD                           ; C24C 4C AD C8                 L..

; ----------------------------------------------------------------------------
LC24F:  nop                                     ; C24F EA                       .
        nop                                     ; C250 EA                       .
        nop                                     ; C251 EA                       .
        rts                                     ; C252 60                       `

; ----------------------------------------------------------------------------
        jsr     DO_RAMROM                       ; C253 20 77 04                  w.
        lda     ($16),y                         ; C256 B1 16                    ..
        jmp     DO_RAMROM                       ; C258 4C 77 04                 Lw.

; ----------------------------------------------------------------------------
        nop                                     ; C25B EA                       .
        nop                                     ; C25C EA                       .
        nop                                     ; C25D EA                       .
        nop                                     ; C25E EA                       .
        nop                                     ; C25F EA                       .
        nop                                     ; C260 EA                       .
        lda     #$8E                            ; C261 A9 8E                    ..
        ldy     #$F8                            ; C263 A0 F8                    ..
        bne     LC26B                           ; C265 D0 04                    ..
        lda     #$AE                            ; C267 A9 AE                    ..
        ldy     #$D3                            ; C269 A0 D3                    ..
LC26B:  sta     EXEVEC+1                        ; C26B 8D F0 04                 ...
        sty     EXEVEC+2                        ; C26E 8C F1 04                 ...
        jsr     DO_RAMROM                       ; C271 20 77 04                  w.
        jsr     EXEVEC                          ; C274 20 EF 04                  ..
        php                                     ; C277 08                       .
        pha                                     ; C278 48                       H
        sei                                     ; C279 78                       x
        lda     MICRODISC_CONTROL_SHADOW        ; C27A AD FB 04                 ...
        eor     #$02                            ; C27D 49 02                    I.
        sta     MICRODISC_CONTROL_SHADOW        ; C27F 8D FB 04                 ...
        sta     MICRODISC_CONTROL               ; C282 8D 14 03                 ...
        pla                                     ; C285 68                       h
        plp                                     ; C286 28                       (
        rts                                     ; C287 60                       `

; ----------------------------------------------------------------------------
        bit     V1IFR                           ; C288 2C 0D 03                 ,..
        bvc     LC29C                           ; C28B 50 0F                    P.
        pha                                     ; C28D 48                       H
        lda     #$04                            ; C28E A9 04                    ..
        and     BASIC11_FLG                     ; C290 2D 6A 02                 -j.
        beq     LC298                           ; C293 F0 03                    ..
        inc     BASIC11_BLINK_CURSOR            ; C295 EE 74 02                 .t.
LC298:  pla                                     ; C298 68                       h
        jmp     LEC03                           ; C299 4C 03 EC                 L..

; ----------------------------------------------------------------------------
LC29C:  pla                                     ; C29C 68                       h
        pla                                     ; C29D 68                       h
        sta     SEDORIC_TRAV0                   ; C29E 85 F2                    ..
        pla                                     ; C2A0 68                       h
        tax                                     ; C2A1 AA                       .
LC2A2:  lda     #$36                            ; C2A2 A9 36                    .6
        ldy     #$D1                            ; C2A4 A0 D1                    ..
        bne     LC26B                           ; C2A6 D0 C3                    ..
        .byte   $20                             ; C2A8 20                        
LC2A9:  .byte   $F2                             ; C2A9 F2                       .
        .byte   $04                             ; C2AA 04                       .
        pla                                     ; C2AB 68                       h
        rti                                     ; C2AC 40                       @

; ----------------------------------------------------------------------------
        sta     MICRODISC_CONTROL               ; C2AD 8D 14 03                 ...
        jmp     (RESET_VECTOR)                  ; C2B0 6C FC FF                 l..

; ----------------------------------------------------------------------------
        clc                                     ; C2B3 18                       .
        jsr     DO_RAMROM                       ; C2B4 20 77 04                  w.
        pha                                     ; C2B7 48                       H
        lda     #$04                            ; C2B8 A9 04                    ..
        pha                                     ; C2BA 48                       H
        lda     #$A8                            ; C2BB A9 A8                    ..
        pha                                     ; C2BD 48                       H
        php                                     ; C2BE 08                       .
        bcs     LC2C4                           ; C2BF B0 03                    ..
        jmp     L0228                           ; C2C1 4C 28 02                 L(.

; ----------------------------------------------------------------------------
LC2C4:  jsr     LF888                           ; C2C4 20 88 F8                  ..
        lda     #$17                            ; C2C7 A9 17                    ..
        ldy     #$EC                            ; C2C9 A0 EC                    ..
        jsr     L046B                           ; C2CB 20 6B 04                  k.
        jmp     LC475                           ; C2CE 4C 75 C4                 Lu.

; ----------------------------------------------------------------------------
        lda     #$04                            ; C2D1 A9 04                    ..
        pha                                     ; C2D3 48                       H
        lda     #$F1                            ; C2D4 A9 F1                    ..
        pha                                     ; C2D6 48                       H
        txa                                     ; C2D7 8A                       .
        pha                                     ; C2D8 48                       H
        tya                                     ; C2D9 98                       .
LC2DA:  pha                                     ; C2DA 48                       H
        jsr     RAMROM                          ; C2DB 20 F2 04                  ..
        jmp     LD270                           ; C2DE 4C 70 D2                 Lp.

; ----------------------------------------------------------------------------
        nop                                     ; C2E1 EA                       .
        nop                                     ; C2E2 EA                       .
        nop                                     ; C2E3 EA                       .
        nop                                     ; C2E4 EA                       .
        nop                                     ; C2E5 EA                       .
        nop                                     ; C2E6 EA                       .
        nop                                     ; C2E7 EA                       .
        nop                                     ; C2E8 EA                       .
        jmp     L0487                           ; C2E9 4C 87 04                 L..

; ----------------------------------------------------------------------------
        jmp     L0471                           ; C2EC 4C 71 04                 Lq.

; ----------------------------------------------------------------------------
        jmp     L0000                           ; C2EF 4C 00 00                 L..

; ----------------------------------------------------------------------------
        jmp     DO_RAMROM                       ; C2F2 4C 77 04                 Lw.

; ----------------------------------------------------------------------------
        jmp     DO_IRQRAM                       ; C2F5 4C B3 04                 L..

; ----------------------------------------------------------------------------
        jmp     L04B4                           ; C2F8 4C B4 04                 L..

; ----------------------------------------------------------------------------
        sty     L0000                           ; C2FB 84 00                    ..
        brk                                     ; C2FD 00                       .
        brk                                     ; C2FE 00                       .
        brk                                     ; C2FF 00                       .
LC300:  .byte   $C9                             ; C300 C9                       .
LC301:  .byte   $30                             ; C301 30                       0
LC302:  .byte   $90                             ; C302 90                       .
LC303:  .byte   $04                             ; C303 04                       .
        cmp     #$3A                            ; C304 C9 3A                    .:
        bcc     LC33D                           ; C306 90 35                    .5
LC308:  stx     $0F                             ; C308 86 0F                    ..
        tax                                     ; C30A AA                       .
        .byte   $30                             ; C30B 30                       0
LC30C:  .byte   $2E                             ; C30C 2E                       .
LC30D:  .byte   $85                             ; C30D 85                       .
LC30E:  .byte   $C1                             ; C30E C1                       .
LC30F:  pla                                     ; C30F 68                       h
        tax                                     ; C310 AA                       .
        pla                                     ; C311 68                       h
        pha                                     ; C312 48                       H
        cpx     #$0E                            ; C313 E0 0E                    ..
        bne     LC31B                           ; C315 D0 04                    ..
        cmp     #$C9                            ; C317 C9 C9                    ..
        beq     LC324                           ; C319 F0 09                    ..
LC31B:  cpx     #$8A                            ; C31B E0 8A                    ..
        bne     LC337                           ; C31D D0 18                    ..
        cmp     #$CA                            ; C31F C9 CA                    ..
        bne     LC337                           ; C321 D0 14                    ..
        .byte   $24                             ; C323 24                       $
LC324:  clc                                     ; C324 18                       .
        ror     FLAGIF                          ; C325 6E FC 04                 n..
        ldy     #$FF                            ; C328 A0 FF                    ..
LC32A:  iny                                     ; C32A C8                       .
        lda     ($E9),y                         ; C32B B1 E9                    ..
        beq     LC340                           ; C32D F0 11                    ..
        cmp     #$3A                            ; C32F C9 3A                    .:
        beq     LC340                           ; C331 F0 0D                    ..
        cmp     #$D4                            ; C333 C9 D4                    ..
        bne     LC32A                           ; C335 D0 F3                    ..
LC337:  txa                                     ; C337 8A                       .
        pha                                     ; C338 48                       H
        lda     $C1                             ; C339 A5 C1                    ..
LC33B:  ldx     $0F                             ; C33B A6 0F                    ..
LC33D:  jmp     LECB9                           ; C33D 4C B9 EC                 L..

; ----------------------------------------------------------------------------
LC340:  pla                                     ; C340 68                       h
        jsr     L04E9                           ; C341 20 E9 04                  ..
        jsr     L0467                           ; C344 20 67 04                  g.
        asl     FLAGIF                          ; C347 0E FC 04                 ...
        bcs     LC34F                           ; C34A B0 03                    ..
        jmp     LC8C1                           ; C34C 4C C1 C8                 L..

; ----------------------------------------------------------------------------
LC34F:  ror     $0252                           ; C34F 6E 52 02                 nR.
        rts                                     ; C352 60                       `

; ----------------------------------------------------------------------------
        jsr     DO_RAMROM                       ; C353 20 77 04                  w.
        lda     ($16),y                         ; C356 B1 16                    ..
        jmp     DO_RAMROM                       ; C358 4C 77 04                 Lw.

; ----------------------------------------------------------------------------
        lda     #$45                            ; C35B A9 45                    .E
        ldy     #$D8                            ; C35D A0 D8                    ..
        bne     LC36B                           ; C35F D0 0A                    ..
        lda     #$8E                            ; C361 A9 8E                    ..
        ldy     #$F8                            ; C363 A0 F8                    ..
        bne     LC36B                           ; C365 D0 04                    ..
        lda     #$AE                            ; C367 A9 AE                    ..
        ldy     #$D3                            ; C369 A0 D3                    ..
LC36B:  sta     EXEVEC+1                        ; C36B 8D F0 04                 ...
        sty     EXEVEC+2                        ; C36E 8C F1 04                 ...
        jsr     DO_RAMROM                       ; C371 20 77 04                  w.
        jsr     EXEVEC                          ; C374 20 EF 04                  ..
        php                                     ; C377 08                       .
        pha                                     ; C378 48                       H
        sei                                     ; C379 78                       x
        lda     MICRODISC_CONTROL_SHADOW        ; C37A AD FB 04                 ...
        eor     #$02                            ; C37D 49 02                    I.
        sta     MICRODISC_CONTROL_SHADOW        ; C37F 8D FB 04                 ...
        sta     MICRODISC_CONTROL               ; C382 8D 14 03                 ...
        pla                                     ; C385 68                       h
        plp                                     ; C386 28                       (
        rts                                     ; C387 60                       `

; ----------------------------------------------------------------------------
        bit     V1IFR                           ; C388 2C 0D 03                 ,..
        bvc     LC39C                           ; C38B 50 0F                    P.
        pha                                     ; C38D 48                       H
        lda     #$04                            ; C38E A9 04                    ..
        and     BASIC11_FLG                     ; C390 2D 6A 02                 -j.
        beq     LC398                           ; C393 F0 03                    ..
        inc     BASIC11_BLINK_CURSOR            ; C395 EE 74 02                 .t.
LC398:  pla                                     ; C398 68                       h
        jmp     LEE22                           ; C399 4C 22 EE                 L".

; ----------------------------------------------------------------------------
LC39C:  pla                                     ; C39C 68                       h
        pla                                     ; C39D 68                       h
        sta     SEDORIC_TRAV0                   ; C39E 85 F2                    ..
        pla                                     ; C3A0 68                       h
        tax                                     ; C3A1 AA                       .
LC3A2:  lda     #$36                            ; C3A2 A9 36                    .6
        ldy     #$D1                            ; C3A4 A0 D1                    ..
        bne     LC36B                           ; C3A6 D0 C3                    ..
        .byte   $20                             ; C3A8 20                        
LC3A9:  .byte   $F2                             ; C3A9 F2                       .
        .byte   $04                             ; C3AA 04                       .
        pla                                     ; C3AB 68                       h
        rti                                     ; C3AC 40                       @

; ----------------------------------------------------------------------------
        sta     MICRODISC_CONTROL               ; C3AD 8D 14 03                 ...
        jmp     (RESET_VECTOR)                  ; C3B0 6C FC FF                 l..

; ----------------------------------------------------------------------------
        clc                                     ; C3B3 18                       .
        jsr     DO_RAMROM                       ; C3B4 20 77 04                  w.
        pha                                     ; C3B7 48                       H
        lda     #$04                            ; C3B8 A9 04                    ..
        pha                                     ; C3BA 48                       H
        lda     #$A8                            ; C3BB A9 A8                    ..
        pha                                     ; C3BD 48                       H
        php                                     ; C3BE 08                       .
        bcs     LC3C4                           ; C3BF B0 03                    ..
        jmp     L0244                           ; C3C1 4C 44 02                 LD.

; ----------------------------------------------------------------------------
LC3C4:  .byte   $20                             ; C3C4 20                        
        clv                                     ; C3C5 B8                       .
LC3C6:  sed                                     ; C3C6 F8                       .
        lda     #$17                            ; C3C7 A9 17                    ..
        ldy     #$EC                            ; C3C9 A0 EC                    ..
        jsr     L046B                           ; C3CB 20 6B 04                  k.
        jmp     LC471                           ; C3CE 4C 71 C4                 Lq.

; ----------------------------------------------------------------------------
        lda     #$04                            ; C3D1 A9 04                    ..
        pha                                     ; C3D3 48                       H
        lda     #$F1                            ; C3D4 A9 F1                    ..
        pha                                     ; C3D6 48                       H
        txa                                     ; C3D7 8A                       .
        pha                                     ; C3D8 48                       H
        tya                                     ; C3D9 98                       .
        pha                                     ; C3DA 48                       H
        jsr     RAMROM                          ; C3DB 20 F2 04                  ..
        jmp     LD306                           ; C3DE 4C 06 D3                 L..

; ----------------------------------------------------------------------------
        nop                                     ; C3E1 EA                       .
        nop                                     ; C3E2 EA                       .
        nop                                     ; C3E3 EA                       .
        nop                                     ; C3E4 EA                       .
        nop                                     ; C3E5 EA                       .
        nop                                     ; C3E6 EA                       .
        nop                                     ; C3E7 EA                       .
        nop                                     ; C3E8 EA                       .
        jmp     L0487                           ; C3E9 4C 87 04                 L..

; ----------------------------------------------------------------------------
        jmp     L0471                           ; C3EC 4C 71 04                 Lq.

; ----------------------------------------------------------------------------
        jmp     L0000                           ; C3EF 4C 00 00                 L..

; ----------------------------------------------------------------------------
        jmp     DO_RAMROM                       ; C3F2 4C 77 04                 Lw.

; ----------------------------------------------------------------------------
        jmp     DO_IRQRAM                       ; C3F5 4C B3 04                 L..

; ----------------------------------------------------------------------------
        jmp     L04B4                           ; C3F8 4C B4 04                 L..

; ----------------------------------------------------------------------------
        sty     L0000                           ; C3FB 84 00                    ..
        brk                                     ; C3FD 00                       .
        brk                                     ; C3FE 00                       .
        brk                                     ; C3FF 00                       .
LC400:  .byte   $07                             ; C400 07                       .
        eor     $57                             ; C401 45 57                    EW
        .byte   $4B                             ; C403 4B                       K
LC404:  brk                                     ; C404 00                       .
        clc                                     ; C405 18                       .
        .byte   $07                             ; C406 07                       .
        php                                     ; C407 08                       .
        eor     $067B,y                         ; C408 59 7B 06                 Y{.
        ora     #$00                            ; C40B 09 00                    ..
        .byte   $42                             ; C40D 42                       B
        eor     ($51,x)                         ; C40E 41 51                    AQ
        ora     $67                             ; C410 05 67                    .g
        .byte   $24                             ; C412 24                       $
LC413:  brk                                     ; C413 00                       .
        brk                                     ; C414 00                       .
        .byte   $5B                             ; C415 5B                       [
        .byte   $27                             ; C416 27                       '
        brk                                     ; C417 00                       .
        .byte   $1B                             ; C418 1B                       .
        .byte   $3F                             ; C419 3F                       ?
        .byte   $04                             ; C41A 04                       .
        asl     a                               ; C41B 0A                       .
        brk                                     ; C41C 00                       .
        .byte   $5F                             ; C41D 5F                       _
        and     a:$0D,x                         ; C41E 3D 0D 00                 =..
        brk                                     ; C421 00                       .
        brk                                     ; C422 00                       .
        brk                                     ; C423 00                       .
        brk                                     ; C424 00                       .
        brk                                     ; C425 00                       .
        brk                                     ; C426 00                       .
        brk                                     ; C427 00                       .
        ora     (L0000,x)                       ; C428 01 00                    ..
        php                                     ; C42A 08                       .
        brk                                     ; C42B 00                       .
        brk                                     ; C42C 00                       .
        brk                                     ; C42D 00                       .
        and     ($FF,x)                         ; C42E 21 FF                    !.
        adc     $0263                           ; C430 6D 63 02                 mc.
        .byte   $0C                             ; C433 0C                       .
        brk                                     ; C434 00                       .
        .byte   $0F                             ; C435 0F                       .
        .byte   $72                             ; C436 72                       r
        brk                                     ; C437 00                       .
        .byte   $03                             ; C438 03                       .
        .byte   $32                             ; C439 32                       2
        and     #$00                            ; C43A 29 00                    ).
        brk                                     ; C43C 00                       .
        asl     $0B1E                           ; C43D 0E 1E 0B                 ...
        .byte   $17                             ; C440 17                       .
        .byte   $B2                             ; C441 B2                       .
        tay                                     ; C442 A8                       .
        .byte   $F1                             ; C443 F1                       .
LC444:  brk                                     ; C444 00                       .
        sty     $18A6                           ; C445 8C A6 18                 ...
        bcc     LC413                           ; C448 90 C9                    ..
        asl     $19,x                           ; C44A 16 19                    ..
        brk                                     ; C44C 00                       .
        .byte   $92                             ; C44D 92                       .
        ldx     #$BC                            ; C44E A2 BC                    ..
        ora     $9C,x                           ; C450 15 9C                    ..
        dex                                     ; C452 CA                       .
        brk                                     ; C453 00                       .
        brk                                     ; C454 00                       .
        .byte   $D2                             ; C455 D2                       .
        .byte   $9B                             ; C456 9B                       .
        bpl     LC444                           ; C457 10 EB                    ..
        sta     $1A14                           ; C459 8D 14 1A                 ...
        brk                                     ; C45C 00                       .
LC45D:  .byte   $87                             ; C45D 87                       .
        iny                                     ; C45E C8                       .
        ora     a:L0000,x                       ; C45F 1D 00 00                 ...
        brk                                     ; C462 00                       .
        brk                                     ; C463 00                       .
        brk                                     ; C464 00                       .
        brk                                     ; C465 00                       .
        brk                                     ; C466 00                       .
        brk                                     ; C467 00                       .
        ora     (L0000),y                       ; C468 11 00                    ..
        lda     L0000                           ; C46A A5 00                    ..
        brk                                     ; C46C 00                       .
        brk                                     ; C46D 00                       .
        cmp     ($FF),y                         ; C46E D1 FF                    ..
        .byte   $A4                             ; C470 A4                       .
LC471:  txs                                     ; C471 9A                       .
        .byte   $12                             ; C472 12                       .
        .byte   $1C                             ; C473 1C                       .
        brk                                     ; C474 00                       .
LC475:  .byte   $1F                             ; C475 1F                       .
        .byte   $CB                             ; C476 CB                       .
        brk                                     ; C477 00                       .
        .byte   $13                             ; C478 13                       .
        sta     ($ED),y                         ; C479 91 ED                    ..
        brk                                     ; C47B 00                       .
        brk                                     ; C47C 00                       .
        asl     $1BB5,x                         ; C47D 1E B5 1B                 ...
        jsr     L2020                           ; C480 20 20 20                    
        jsr     L2020                           ; C483 20 20 20                    
        jsr     L2020                           ; C486 20 20 20                    
        jsr     L2020                           ; C489 20 20 20                    
        jsr     L2020                           ; C48C 20 20 20                    
        ldy     #$20                            ; C48F A0 20                    . 
        jsr     L2020                           ; C491 20 20 20                    
        jsr     L4420                           ; C494 20 20 44                   D
        .byte   $4F                             ; C497 4F                       O
        .byte   $4B                             ; C498 4B                       K
        eor     $23                             ; C499 45 23                    E#
        .byte   $32                             ; C49B 32                       2
        .byte   $46                             ; C49C 46                       F
LC49D:  and     $2C,x                           ; C49D 35 2C                    5,
        .byte   $A3                             ; C49F A3                       .
        jsr     L4420                           ; C4A0 20 20 44                   D
        .byte   $4F                             ; C4A3 4F                       O
        .byte   $4B                             ; C4A4 4B                       K
LC4A5:  eor     $23                             ; C4A5 45 23                    E#
        .byte   $32                             ; C4A7 32                       2
        lsr     $35                             ; C4A8 46 35                    F5
        bit     $3423                           ; C4AA 2C 23 34                 ,#4
        rol     $37,x                           ; C4AD 36 37                    67
        sta     L2020                           ; C4AF 8D 20 20                 .  
        jsr     L2020                           ; C4B2 20 20 20                    
        jsr     L4F44                           ; C4B5 20 44 4F                  DO
        .byte   $4B                             ; C4B8 4B                       K
        eor     $23                             ; C4B9 45 23                    E#
        .byte   $32                             ; C4BB 32                       2
        lsr     $39                             ; C4BC 46 39                    F9
        bit     $20A3                           ; C4BE 2C A3 20                 ,. 
        .byte   $44                             ; C4C1 44                       D
        .byte   $4F                             ; C4C2 4F                       O
        .byte   $4B                             ; C4C3 4B                       K
        eor     $23                             ; C4C4 45 23                    E#
        .byte   $32                             ; C4C6 32                       2
        lsr     $39                             ; C4C7 46 39                    F9
        bit     $4423                           ; C4C9 2C 23 44                 ,#D
        bmi     LC505                           ; C4CC 30 37                    07
        bmi     LC45D                           ; C4CE 30 8D                    0.
        jsr     L2020                           ; C4D0 20 20 20                    
        jsr     L2020                           ; C4D3 20 20 20                    
        .byte   $44                             ; C4D6 44                       D
LC4D7:  .byte   $4F                             ; C4D7 4F                       O
        .byte   $4B                             ; C4D8 4B                       K
        eor     $23                             ; C4D9 45 23                    E#
        .byte   $32                             ; C4DB 32                       2
        lsr     $43                             ; C4DC 46 43                    FC
        bit     $20A3                           ; C4DE 2C A3 20                 ,. 
        jsr     L4F44                           ; C4E1 20 44 4F                  DO
        .byte   $4B                             ; C4E4 4B                       K
        eor     $23                             ; C4E5 45 23                    E#
        .byte   $32                             ; C4E7 32                       2
        lsr     $43                             ; C4E8 46 43                    FC
        bit     $3423                           ; C4EA 2C 23 34                 ,#4
        rol     $31,x                           ; C4ED 36 31                    61
        sta     L2020                           ; C4EF 8D 20 20                 .  
        jsr     L5020                           ; C4F2 20 20 50                   P
        eor     ($50,x)                         ; C4F5 41 50                    AP
        eor     $52                             ; C4F7 45 52                    ER
        bmi     LC535                           ; C4F9 30 3A                    0:
        eor     #$4E                            ; C4FB 49 4E                    IN
        .byte   $4B                             ; C4FD 4B                       K
        .byte   $37                             ; C4FE 37                       7
        sta     L2020                           ; C4FF 8D 20 20                 .  
        jsr     L2020                           ; C502 20 20 20                    
LC505:  jsr     L4143                           ; C505 20 43 41                  CA
        jmp     L234C                           ; C508 4C 4C 23                 LL#

; ----------------------------------------------------------------------------
        lsr     $38                             ; C50B 46 38                    F8
        .byte   $44                             ; C50D 44                       D
        bmi     LC49D                           ; C50E 30 8D                    0.
        jsr     L2020                           ; C510 20 20 20                    
        jsr     L2020                           ; C513 20 20 20                    
        jsr     L2020                           ; C516 20 20 20                    
        jsr     L2020                           ; C519 20 20 20                    
        jsr     L2020                           ; C51C 20 20 20                    
        inc     L2020,x                         ; C51F FE 20 20                 .  
        jsr     L3F20                           ; C522 20 20 3F                   ?
        pha                                     ; C525 48                       H
        eor     $58                             ; C526 45 58                    EX
        bit     $28                             ; C528 24 28                    $(
        bvc     LC571                           ; C52A 50 45                    PE
        eor     $4B                             ; C52C 45 4B                    EK
        plp                                     ; C52E 28                       (
        .byte   $A3                             ; C52F A3                       .
        jsr     L2020                           ; C530 20 20 20                    
        .byte   $20                             ; C533 20                        
        .byte   $3F                             ; C534 3F                       ?
LC535:  pha                                     ; C535 48                       H
        eor     $58                             ; C536 45 58                    EX
        bit     $28                             ; C538 24 28                    $(
        .byte   $44                             ; C53A 44                       D
        eor     $45                             ; C53B 45 45                    EE
        .byte   $4B                             ; C53D 4B                       K
        plp                                     ; C53E 28                       (
        .byte   $A3                             ; C53F A3                       .
        jsr     L2020                           ; C540 20 20 20                    
        jsr     L2020                           ; C543 20 20 20                    
        jsr     L2020                           ; C546 20 20 20                    
        jsr     L4550                           ; C549 20 50 45                  PE
        eor     $4B                             ; C54C 45 4B                    EK
        plp                                     ; C54E 28                       (
        .byte   $A3                             ; C54F A3                       .
        jsr     L2020                           ; C550 20 20 20                    
        jsr     L2020                           ; C553 20 20 20                    
        jsr     L2020                           ; C556 20 20 20                    
        jsr     L4544                           ; C559 20 44 45                  DE
        eor     $4B                             ; C55C 45 4B                    EK
        plp                                     ; C55E 28                       (
        .byte   $A3                             ; C55F A3                       .
        .byte   $20                             ; C560 20                        
LC561:  jsr     L2020                           ; C561 20 20 20                    
        jsr     L2020                           ; C564 20 20 20                    
        jsr     L2020                           ; C567 20 20 20                    
        jsr     $4F50                           ; C56A 20 50 4F                  PO
        .byte   $4B                             ; C56D 4B                       K
        eor     $A3                             ; C56E 45 A3                    E.
        .byte   $20                             ; C570 20                        
LC571:  jsr     L2020                           ; C571 20 20 20                    
LC574:  jsr     L2020                           ; C574 20 20 20                    
        jsr     L2020                           ; C577 20 20 20                    
LC57A:  jsr     L4F44                           ; C57A 20 44 4F                  DO
        .byte   $4B                             ; C57D 4B                       K
        eor     $A3                             ; C57E 45 A3                    E.
        pha                                     ; C580 48                       H
        eor     $58                             ; C581 45 58                    EX
        bit     $A8                             ; C583 24 A8                    $.
        .byte   $43                             ; C585 43                       C
        eor     ($4C,x)                         ; C586 41 4C                    AL
        jmp     L54A3                           ; C588 4C A3 54                 L.T

; ----------------------------------------------------------------------------
        eor     $58                             ; C58B 45 58                    EX
        .byte   $54                             ; C58D 54                       T
        sta     L4F46                           ; C58E 8D 46 4F                 .FO
        .byte   $52                             ; C591 52                       R
        eor     #$3D                            ; C592 49 3D                    I=
        and     ($54),y                         ; C594 31 54                    1T
        .byte   $CF                             ; C596 CF                       .
        jmp     L4645                           ; C597 4C 45 46                 LEF

; ----------------------------------------------------------------------------
        .byte   $54                             ; C59A 54                       T
        bit     $A8                             ; C59B 24 A8                    $.
        eor     $4449                           ; C59D 4D 49 44                 MID
        bit     $A8                             ; C5A0 24 A8                    $.
        .byte   $52                             ; C5A2 52                       R
        eor     #$47                            ; C5A3 49 47                    IG
        pha                                     ; C5A5 48                       H
        .byte   $54                             ; C5A6 54                       T
        bit     $A8                             ; C5A7 24 A8                    $.
        .byte   $53                             ; C5A9 53                       S
        .byte   $54                             ; C5AA 54                       T
        .byte   $52                             ; C5AB 52                       R
        bit     $A8                             ; C5AC 24 A8                    $.
LC5AE:  .byte   $55                             ; C5AE 55                       U
LC5AF:  .byte   $4E                             ; C5AF 4E                       N
LC5B0:  bvc     LC604                           ; C5B0 50 52                    PR
        .byte   $4F                             ; C5B2 4F                       O
        .byte   $54                             ; C5B3 54                       T
        sta     $55E0                           ; C5B4 8D E0 55                 ..U
        .byte   $53                             ; C5B7 53                       S
        eor     #$4E                            ; C5B8 49 4E                    IN
        .byte   $C7                             ; C5BA C7                       .
        lsr     $49,x                           ; C5BB 56 49                    VI
        .byte   $53                             ; C5BD 53                       S
        eor     $48,x                           ; C5BE 55 48                    UH
        eor     #$52                            ; C5C0 49 52                    IR
        eor     $53                             ; C5C2 45 53                    ES
        ldx     #$56                            ; C5C4 A2 56                    .V
        eor     $53,x                           ; C5C6 55 53                    US
        eor     $52                             ; C5C8 45 52                    ER
        sta     $4957                           ; C5CA 8D 57 49                 .WI
        .byte   $44                             ; C5CD 44                       D
        .byte   $54                             ; C5CE 54                       T
        iny                                     ; C5CF C8                       .
        .byte   $57                             ; C5D0 57                       W
        eor     #$4E                            ; C5D1 49 4E                    IN
        .byte   $44                             ; C5D3 44                       D
        .byte   $4F                             ; C5D4 4F                       O
        .byte   $D7                             ; C5D5 D7                       .
        and     ($52,x)                         ; C5D6 21 52                    !R
        eor     $53                             ; C5D8 45 53                    ES
        .byte   $54                             ; C5DA 54                       T
        .byte   $4F                             ; C5DB 4F                       O
        .byte   $52                             ; C5DC 52                       R
        cmp     $50                             ; C5DD C5 50                    .P
        bvc     LC561                           ; C5DF 50 80                    P.
        brk                                     ; C5E1 00                       .
        .byte   $5A                             ; C5E2 5A                       Z
        eor     $52                             ; C5E3 45 52                    ER
        .byte   $54                             ; C5E5 54                       T
        eor     $4300,y                         ; C5E6 59 00 43                 Y.C
        .byte   $43                             ; C5E9 43                       C
        eor     $4E                             ; C5EA 45 4E                    EN
        .byte   $54                             ; C5EC 54                       T
        brk                                     ; C5ED 00                       .
        .byte   $4F                             ; C5EE 4F                       O
        cli                                     ; C5EF 58                       X
        brk                                     ; C5F0 00                       .
        eor     ($43,x)                         ; C5F1 41 43                    AC
        .byte   $4B                             ; C5F3 4B                       K
        eor     $50,x                           ; C5F4 55 50                    UP
        brk                                     ; C5F6 00                       .
        eor     $49,x                           ; C5F7 55 49                    UI
        jmp     L0044                           ; C5F9 4C 44 00                 LD.

; ----------------------------------------------------------------------------
        pha                                     ; C5FC 48                       H
        .byte   $44                             ; C5FD 44                       D
        eor     #$52                            ; C5FE 49 52                    IR
LC600:  brk                                     ; C600 00                       .
        pha                                     ; C601 48                       H
        eor     ($4E,x)                         ; C602 41 4E                    AN
LC604:  .byte   $47                             ; C604 47                       G
        eor     L0000                           ; C605 45 00                    E.
        jmp     L534F                           ; C607 4C 4F 53                 LOS

; ----------------------------------------------------------------------------
        eor     L0000                           ; C60A 45 00                    E.
        .byte   $4F                             ; C60C 4F                       O
        bvc     LC668                           ; C60D 50 59                    PY
        brk                                     ; C60F 00                       .
        .byte   $52                             ; C610 52                       R
        eor     $41                             ; C611 45 41                    EA
        .byte   $54                             ; C613 54                       T
        eor     $57                             ; C614 45 57                    EW
        brk                                     ; C616 00                       .
        .byte   $52                             ; C617 52                       R
        eor     $53                             ; C618 45 53                    ES
        eor     $43                             ; C61A 45 43                    EC
        brk                                     ; C61C 00                       .
        pha                                     ; C61D 48                       H
        .byte   $4B                             ; C61E 4B                       K
        .byte   $53                             ; C61F 53                       S
        eor     $4D,x                           ; C620 55 4D                    UM
        brk                                     ; C622 00                       .
        eor     $4C                             ; C623 45 4C                    EL
        .byte   $44                             ; C625 44                       D
        eor     #$52                            ; C626 49 52                    IR
        brk                                     ; C628 00                       .
        eor     $96                             ; C629 45 96                    E.
        eor     L0000                           ; C62B 45 00                    E.
        eor     $53                             ; C62D 45 53                    ES
        .byte   $54                             ; C62F 54                       T
        .byte   $52                             ; C630 52                       R
        .byte   $4F                             ; C631 4F                       O
        eor     $4500,y                         ; C632 59 00 45                 Y.E
        jmp     L4142                           ; C635 4C 42 41                 LBA

; ----------------------------------------------------------------------------
        .byte   $4B                             ; C638 4B                       K
        brk                                     ; C639 00                       .
        eor     $4C                             ; C63A 45 4C                    EL
        brk                                     ; C63C 00                       .
        eor     #$52                            ; C63D 49 52                    IR
        brk                                     ; C63F 00                       .
        lsr     $4D55                           ; C640 4E 55 4D                 NUM
        brk                                     ; C643 00                       .
        lsr     $4D41                           ; C644 4E 41 4D                 NAM
        eor     L0000                           ; C647 45 00                    E.
        .byte   $4B                             ; C649 4B                       K
        eor     $59                             ; C64A 45 59                    EY
        brk                                     ; C64C 00                       .
        .byte   $53                             ; C64D 53                       S
        eor     $53,y                           ; C64E 59 53 00                 YS.
        .byte   $54                             ; C651 54                       T
        .byte   $52                             ; C652 52                       R
        eor     ($43,x)                         ; C653 41 43                    AC
        .byte   $4B                             ; C655 4B                       K
        brk                                     ; C656 00                       .
        .byte   $52                             ; C657 52                       R
        .byte   $52                             ; C658 52                       R
        .byte   $97                             ; C659 97                       .
        brk                                     ; C65A 00                       .
        .byte   $52                             ; C65B 52                       R
        .byte   $52                             ; C65C 52                       R
        .byte   $47                             ; C65D 47                       G
        .byte   $4F                             ; C65E 4F                       O
        .byte   $54                             ; C65F 54                       T
        .byte   $4F                             ; C660 4F                       O
        brk                                     ; C661 00                       .
        .byte   $52                             ; C662 52                       R
        .byte   $52                             ; C663 52                       R
        .byte   $4F                             ; C664 4F                       O
        .byte   $52                             ; C665 52                       R
        brk                                     ; C666 00                       .
        .byte   $52                             ; C667 52                       R
LC668:  .byte   $52                             ; C668 52                       R
        .byte   $D2                             ; C669 D2                       .
        brk                                     ; C66A 00                       .
        .byte   $52                             ; C66B 52                       R
        .byte   $52                             ; C66C 52                       R
        brk                                     ; C66D 00                       .
        .byte   $53                             ; C66E 53                       S
        eor     ($56,x)                         ; C66F 41 56                    AV
        eor     L0000                           ; C671 45 00                    E.
        cli                                     ; C673 58                       X
        .byte   $54                             ; C674 54                       T
        brk                                     ; C675 00                       .
        eor     #$45                            ; C676 49 45                    IE
        .byte   $4C                             ; C678 4C                       L
        .byte   $44                             ; C679 44                       D
LC67A:  brk                                     ; C67A 00                       .
        .byte   $52                             ; C67B 52                       R
        .byte   $53                             ; C67C 53                       S
        .byte   $45                             ; C67D 45                       E
LC67E:  .byte   $43                             ; C67E 43                       C
        brk                                     ; C67F 00                       .
        .byte   $43                             ; C680 43                       C
        eor     $52,x                           ; C681 55 52                    UR
        brk                                     ; C683 00                       .
        lsr     $5449                           ; C684 4E 49 54                 NIT
        brk                                     ; C687 00                       .
        lsr     $5453                           ; C688 4E 53 54                 NST
        .byte   $52                             ; C68B 52                       R
        brk                                     ; C68C 00                       .
        lsr     $5349                           ; C68D 4E 49 53                 NIS
        .byte   $54                             ; C690 54                       T
        brk                                     ; C691 00                       .
        eor     $4D,x                           ; C692 55 4D                    UM
        bvc     LC696                           ; C694 50 00                    P.
LC696:  eor     $59                             ; C696 45 59                    EY
        sta     $4500,y                         ; C698 99 00 45                 ..E
        eor     $4649,y                         ; C69B 59 49 46                 YIF
        brk                                     ; C69E 00                       .
        eor     $59                             ; C69F 45 59                    EY
        eor     $53,x                           ; C6A1 55 53                    US
        eor     L0000                           ; C6A3 45 00                    E.
        eor     $59                             ; C6A5 45 59                    EY
        .byte   $44                             ; C6A7 44                       D
        eor     $46                             ; C6A8 45 46                    EF
        brk                                     ; C6AA 00                       .
        eor     $59                             ; C6AB 45 59                    EY
        clv                                     ; C6AD B8                       .
        brk                                     ; C6AE 00                       .
        eor     $59                             ; C6AF 45 59                    EY
        .byte   $53                             ; C6B1 53                       S
        eor     ($56,x)                         ; C6B2 41 56                    AV
        eor     L0000                           ; C6B4 45 00                    E.
        eor     $59                             ; C6B6 45 59                    EY
        brk                                     ; C6B8 00                       .
        eor     #$4E                            ; C6B9 49 4E                    IN
        eor     L0000                           ; C6BB 45 00                    E.
        .byte   $53                             ; C6BD 53                       S
        eor     $54                             ; C6BE 45 54                    ET
        brk                                     ; C6C0 00                       .
        eor     $53,x                           ; C6C1 55 53                    US
        eor     #$4E                            ; C6C3 49 4E                    IN
        .byte   $47                             ; C6C5 47                       G
        brk                                     ; C6C6 00                       .
        eor     $E3,x                           ; C6C7 55 E3                    U.
        .byte   $47                             ; C6C9 47                       G
        brk                                     ; C6CA 00                       .
        .byte   $92                             ; C6CB 92                       .
        brk                                     ; C6CC 00                       .
        .byte   $4F                             ; C6CD 4F                       O
        eor     (L0044,x)                       ; C6CE 41 44                    AD
        brk                                     ; C6D0 00                       .
        .byte   $44                             ; C6D1 44                       D
        eor     #$52                            ; C6D2 49 52                    IR
        brk                                     ; C6D4 00                       .
        .byte   $54                             ; C6D5 54                       T
        eor     L4550,y                         ; C6D6 59 50 45                 YPE
        brk                                     ; C6D9 00                       .
        .byte   $43                             ; C6DA 43                       C
        eor     $52,x                           ; C6DB 55 52                    UR
        brk                                     ; C6DD 00                       .
        .byte   $4B                             ; C6DE 4B                       K
        .byte   $44                             ; C6DF 44                       D
        eor     #$52                            ; C6E0 49 52                    IR
        brk                                     ; C6E2 00                       .
        .byte   $4F                             ; C6E3 4F                       O
        lsr     $45,x                           ; C6E4 56 45                    VE
        brk                                     ; C6E6 00                       .
        eor     $52                             ; C6E7 45 52                    ER
        .byte   $47                             ; C6E9 47                       G
        eor     L0000                           ; C6EA 45 00                    E.
        eor     $4D,x                           ; C6EC 55 4D                    UM
        brk                                     ; C6EE 00                       .
        eor     $54,x                           ; C6EF 55 54                    UT
        brk                                     ; C6F1 00                       .
        jmp     L0044                           ; C6F2 4C 44 00                 LD.

; ----------------------------------------------------------------------------
        bvc     LC73C                           ; C6F5 50 45                    PE
        lsr     $4100                           ; C6F7 4E 00 41                 N.A
        .byte   $54                             ; C6FA 54                       T
        pha                                     ; C6FB 48                       H
        .byte   $44                             ; C6FC 44                       D
        eor     #$52                            ; C6FD 49 52                    IR
        brk                                     ; C6FF 00                       .
LC700:  eor     $54,x                           ; C700 55 54                    UT
        brk                                     ; C702 00                       .
        .byte   $52                             ; C703 52                       R
        .byte   $4F                             ; C704 4F                       O
        .byte   $54                             ; C705 54                       T
        brk                                     ; C706 00                       .
        .byte   $52                             ; C707 52                       R
        brk                                     ; C708 00                       .
        eor     $5041                           ; C709 4D 41 50                 MAP
        brk                                     ; C70C 00                       .
        eor     $49,x                           ; C70D 55 49                    UI
        .byte   $54                             ; C70F 54                       T
        brk                                     ; C710 00                       .
        .byte   $57                             ; C711 57                       W
        eor     $52                             ; C712 45 52                    ER
        .byte   $54                             ; C714 54                       T
        eor     $4500,y                         ; C715 59 00 45                 Y.E
        .byte   $53                             ; C718 53                       S
        eor     $4D,x                           ; C719 55 4D                    UM
        eor     L0000                           ; C71B 45 00                    E.
        .byte   $53                             ; C71D 53                       S
        eor     $54                             ; C71E 45 54                    ET
        brk                                     ; C720 00                       .
        eor     $57                             ; C721 45 57                    EW
        eor     #$4E                            ; C723 49 4E                    IN
        .byte   $44                             ; C725 44                       D
        brk                                     ; C726 00                       .
        eor     $4E                             ; C727 45 4E                    EN
        eor     $4D,x                           ; C729 55 4D                    UM
        brk                                     ; C72B 00                       .
        eor     $4E                             ; C72C 45 4E                    EN
        brk                                     ; C72E 00                       .
        cmp     ($4F),y                         ; C72F D1 4F                    .O
        eor     $4100                           ; C731 4D 00 41                 M.A
        lsr     L4F44                           ; C734 4E 44 4F                 NDO
        eor     $4500                           ; C737 4D 00 45                 M.E
        .byte   $53                             ; C73A 53                       S
        .byte   $45                             ; C73B 45                       E
LC73C:  .byte   $54                             ; C73C 54                       T
        brk                                     ; C73D 00                       .
        .byte   $57                             ; C73E 57                       W
        eor     ($50,x)                         ; C73F 41 50                    AP
        brk                                     ; C741 00                       .
        eor     $45                             ; C742 45 45                    EE
        .byte   $4B                             ; C744 4B                       K
        brk                                     ; C745 00                       .
        .byte   $54                             ; C746 54                       T
        .byte   $52                             ; C747 52                       R
        eor     $4E,x                           ; C748 55 4E                    UN
        brk                                     ; C74A 00                       .
        .byte   $54                             ; C74B 54                       T
        tya                                     ; C74C 98                       .
        brk                                     ; C74D 00                       .
        eor     $5453,y                         ; C74E 59 53 54                 YST
        eor     $4D                             ; C751 45 4D                    EM
        brk                                     ; C753 00                       .
        .byte   $54                             ; C754 54                       T
        eor     ($54,x)                         ; C755 41 54                    AT
        eor     $53,x                           ; C757 55 53                    US
        brk                                     ; C759 00                       .
        eor     ($56,x)                         ; C75A 41 56                    AV
        eor     $55                             ; C75C 45 55                    EU
        brk                                     ; C75E 00                       .
        eor     ($56,x)                         ; C75F 41 56                    AV
        eor     $4D                             ; C761 45 4D                    EM
        brk                                     ; C763 00                       .
        eor     ($56,x)                         ; C764 41 56                    AV
        eor     $4F                             ; C766 45 4F                    EO
        brk                                     ; C768 00                       .
        eor     ($56,x)                         ; C769 41 56                    AV
        eor     L0000                           ; C76B 45 00                    E.
        eor     $41                             ; C76D 45 41                    EA
        .byte   $52                             ; C76F 52                       R
        .byte   $43                             ; C770 43                       C
        pha                                     ; C771 48                       H
        brk                                     ; C772 00                       .
        eor     $53,y                           ; C773 59 53 00                 YS.
        eor     $5041                           ; C776 4D 41 50                 MAP
        brk                                     ; C779 00                       .
LC77A:  .byte   $4B                             ; C77A 4B                       K
        eor     $4E                             ; C77B 45 4E                    EN
        brk                                     ; C77D 00                       .
LC77E:  eor     ($4B,x)                         ; C77E 41 4B                    AK
        eor     L0000                           ; C780 45 00                    E.
        eor     L4550,y                         ; C782 59 50 45                 YPE
        brk                                     ; C785 00                       .
        .byte   $52                             ; C786 52                       R
        eor     ($43,x)                         ; C787 41 43                    AC
        .byte   $4B                             ; C789 4B                       K
        brk                                     ; C78A 00                       .
        .byte   $53                             ; C78B 53                       S
        eor     $52                             ; C78C 45 52                    ER
        brk                                     ; C78E 00                       .
        lsr     $4B54                           ; C78F 4E 54 4B                 NTK
        eor     $4E                             ; C792 45 4E                    EN
        brk                                     ; C794 00                       .
        .byte   $E3                             ; C795 E3                       .
        .byte   $47                             ; C796 47                       G
        brk                                     ; C797 00                       .
        lsr     $5250                           ; C798 4E 50 52                 NPR
        .byte   $4F                             ; C79B 4F                       O
        .byte   $54                             ; C79C 54                       T
        brk                                     ; C79D 00                       .
        eor     #$53                            ; C79E 49 53                    IS
        eor     $A2,x                           ; C7A0 55 A2                    U.
        brk                                     ; C7A2 00                       .
        eor     $53,x                           ; C7A3 55 53                    US
        eor     $52                             ; C7A5 45 52                    ER
        brk                                     ; C7A7 00                       .
        eor     #$44                            ; C7A8 49 44                    ID
        .byte   $54                             ; C7AA 54                       T
        pha                                     ; C7AB 48                       H
        brk                                     ; C7AC 00                       .
        eor     #$4E                            ; C7AD 49 4E                    IN
        .byte   $44                             ; C7AF 44                       D
        .byte   $4F                             ; C7B0 4F                       O
        .byte   $57                             ; C7B1 57                       W
        brk                                     ; C7B2 00                       .
        txs                                     ; C7B3 9A                       .
        brk                                     ; C7B4 00                       .
        eor     LFF00,x                         ; C7B5 5D 00 FF                 ]..
        brk                                     ; C7B8 00                       .
        brk                                     ; C7B9 00                       .
        brk                                     ; C7BA 00                       .
        dec     a:$C9,x                         ; C7BB DE C9 00                 ...
        .byte   $03                             ; C7BE 03                       .
        inc     $03C9                           ; C7BF EE C9 03                 ...
        .byte   $03                             ; C7C2 03                       .
        .byte   $FC                             ; C7C3 FC                       .
        cmp     #$06                            ; C7C4 C9 06                    ..
        .byte   $07                             ; C7C6 07                       .
        .byte   $23                             ; C7C7 23                       #
        dex                                     ; C7C8 CA                       .
        ora     $570B                           ; C7C9 0D 0B 57                 ..W
        dex                                     ; C7CC CA                       .
        clc                                     ; C7CD 18                       .
        .byte   $07                             ; C7CE 07                       .
        ror     $CA,x                           ; C7CF 76 CA                    v.
        .byte   $1F                             ; C7D1 1F                       .
        .byte   $02                             ; C7D2 02                       .
        cpy     $21CC                           ; C7D3 CC CC 21                 ..!
        brk                                     ; C7D6 00                       .
        .byte   $80                             ; C7D7 80                       .
        dex                                     ; C7D8 CA                       .
        and     ($01,x)                         ; C7D9 21 01                    !.
        sty     $CA                             ; C7DB 84 CA                    ..
        .byte   $22                             ; C7DD 22                       "
        .byte   $03                             ; C7DE 03                       .
        .byte   $92                             ; C7DF 92                       .
        dex                                     ; C7E0 CA                       .
        and     $01                             ; C7E1 25 01                    %.
        stx     $CA,y                           ; C7E3 96 CA                    ..
        rol     $07                             ; C7E5 26 07                    &.
        lda     $2DCA,y                         ; C7E7 B9 CA 2D                 ..-
        ora     #$DE                            ; C7EA 09 DE                    ..
        dex                                     ; C7EC CA                       .
        rol     $03,x                           ; C7ED 36 03                    6.
        cpx     $39CA                           ; C7EF EC CA 39                 ..9
        ora     ($EF,x)                         ; C7F2 01 EF                    ..
        dex                                     ; C7F4 CA                       .
        .byte   $3A                             ; C7F5 3A                       :
        .byte   $03                             ; C7F6 03                       .
        sbc     $3DCA,y                         ; C7F7 F9 CA 3D                 ..=
        ora     $0D                             ; C7FA 05 0D                    ..
        .byte   $CB                             ; C7FC CB                       .
        .byte   $42                             ; C7FD 42                       B
        .byte   $02                             ; C7FE 02                       .
        .byte   $17                             ; C7FF 17                       .
LC800:  .byte   $CB                             ; C800 CB                       .
        .byte   $44                             ; C801 44                       D
        php                                     ; C802 08                       .
        rol     $4CCB,x                         ; C803 3E CB 4C                 >.L
        ora     LCB7A                           ; C806 0D 7A CB                 .z.
        eor     $8B04,y                         ; C809 59 04 8B                 Y..
        .byte   $CB                             ; C80C CB                       .
        eor     $9E04,x                         ; C80D 5D 04 9E                 ]..
        .byte   $CB                             ; C810 CB                       .
        adc     ($02,x)                         ; C811 61 02                    a.
        tay                                     ; C813 A8                       .
        .byte   $CB                             ; C814 CB                       .
        .byte   $63                             ; C815 63                       c
        .byte   $02                             ; C816 02                       .
        cpy     $65CC                           ; C817 CC CC 65                 ..e
        brk                                     ; C81A 00                       .
        cpy     $65CC                           ; C81B CC CC 65                 ..e
        brk                                     ; C81E 00                       .
        cpy     $65CC                           ; C81F CC CC 65                 ..e
        brk                                     ; C822 00                       .
        .byte   $B3                             ; C823 B3                       .
        .byte   $CB                             ; C824 CB                       .
        adc     $03                             ; C825 65 03                    e.
        asl     $FE                             ; C827 06 FE                    ..
        cmp     $90EB,x                         ; C829 DD EB 90                 ...
        .byte   $EB                             ; C82C EB                       .
        cmp     $50F0,x                         ; C82D DD F0 50                 ..P
        sbc     ($DF),y                         ; C830 F1 DF                    ..
        inc     LE772,x                         ; C832 FE 72 E7                 .r.
        .byte   $47                             ; C835 47                       G
        sbc     ($8C),y                         ; C836 F1 8C                    ..
        .byte   $FB                             ; C838 FB                       .
        lsr     BASIC11_INTERPRETER_VECTOR+1,x  ; C839 56 F1                    V.
        jmp     LBBDE                           ; C83B 4C DE BB                 L..

; ----------------------------------------------------------------------------
        sbc     LE9FE,y                         ; C83E F9 FE E9                 ...
        adc     $E7,x                           ; C841 75 E7                    u.
        eor     (BASIC11_INTERPRETER_VECTOR+1,x); C843 41 F1                    A.
        .byte   $43                             ; C845 43                       C
        cpx     $36                             ; C846 E4 36                    .6
        cpx     $45                             ; C848 E4 45                    .E
        cpx     $43                             ; C84A E4 43                    .C
        .byte   $E3                             ; C84C E3                       .
        and     #$F1                            ; C84D 29 F1                    ).
        .byte   $44                             ; C84F 44                       D
        sbc     ($23),y                         ; C850 F1 23                    .#
        sbc     ($26),y                         ; C852 F1 26                    .&
        sbc     ($38),y                         ; C854 F1 38                    .8
        sbc     ($98),y                         ; C856 F1 98                    ..
        sbc     #$98                            ; C858 E9 98                    ..
        sbc     #$AF                            ; C85A E9 AF                    ..
        sbc     #$AF                            ; C85C E9 AF                    ..
        sbc     #$7E                            ; C85E E9 7E                    .~
        sbc     #$DF                            ; C860 E9 DF                    ..
        cmp     LE9EC,x                         ; C862 DD EC E9                 ...
        ldx     $9BFB,y                         ; C865 BE FB 9B                 ...
        sbc     LEBF4,y                         ; C868 F9 F4 EB                 ...
        pla                                     ; C86B 68                       h
        sbc     ($2D),y                         ; C86C F1 2D                    .-
        cpx     LF12C                           ; C86E EC 2C F1                 .,.
        ora     ($FE),y                         ; C871 11 FE                    ..
        .byte   $1F                             ; C873 1F                       .
        .byte   $DA                             ; C874 DA                       .
        .byte   $1F                             ; C875 1F                       .
        .byte   $DA                             ; C876 DA                       .
        .byte   $3F                             ; C877 3F                       ?
        .byte   $E7                             ; C878 E7                       .
        .byte   $42                             ; C879 42                       B
        .byte   $E7                             ; C87A E7                       .
        .byte   $42                             ; C87B 42                       B
        .byte   $E7                             ; C87C E7                       .
        cpy     $0ADD                           ; C87D CC DD 0A                 ...
        .byte   $E7                             ; C880 E7                       .
        sei                                     ; C881 78                       x
        beq     LC8F6                           ; C882 F0 72                    .r
        .byte   $FC                             ; C884 FC                       .
        and     BASIC11_INTERPRETER_VECTOR,x    ; C885 35 F0                    5.
        and     BASIC11_INTERPRETER_VECTOR,x    ; C887 35 F0                    5.
        .byte   $93                             ; C889 93                       .
        cpx     LDFF6                           ; C88A EC F6 DF                 ...
        lsr     $94E7                           ; C88D 4E E7 94                 N..
        inc     LEBEB,x                         ; C890 FE EB EB                 ...
        .byte   $6F                             ; C893 6F                       o
        .byte   $E7                             ; C894 E7                       .
        and     BASIC11_INTERPRETER_VECTOR+1,x  ; C895 35 F1                    5.
        .byte   $3B                             ; C897 3B                       ;
        sbc     ($48),y                         ; C898 F1 48                    .H
        .byte   $E7                             ; C89A E7                       .
        asl     $AEE7,x                         ; C89B 1E E7 AE                 ...
        cpx     #$4F                            ; C89E E0 4F                    .O
        .byte   $FA                             ; C8A0 FA                       .
        sei                                     ; C8A1 78                       x
LC8A2:  .byte   $E7                             ; C8A2 E7                       .
        dex                                     ; C8A3 CA                       .
        sbc     LE9F5,y                         ; C8A4 F9 F5 E9                 ...
        .byte   $BF                             ; C8A7 BF                       .
        .byte   $E7                             ; C8A8 E7                       .
        .byte   $8F                             ; C8A9 8F                       .
        sbc     LE7F4,y                         ; C8AA F9 F4 E7                 ...
LC8AD:  cpx     #$EB                            ; C8AD E0 EB                    ..
        tsx                                     ; C8AF BA                       .
        sbc     #$74                            ; C8B0 E9 74                    .t
        .byte   $FC                             ; C8B2 FC                       .
        tsx                                     ; C8B3 BA                       .
        .byte   $FA                             ; C8B4 FA                       .
        eor     $4BF1                           ; C8B5 4D F1 4B                 M.K
        .byte   $E7                             ; C8B8 E7                       .
        sta     $E7,x                           ; C8B9 95 E7                    ..
        sta     $E7,x                           ; C8BB 95 E7                    ..
        .byte   $B7                             ; C8BD B7                       .
        .byte   $E7                             ; C8BE E7                       .
        .byte   $3A                             ; C8BF 3A                       :
        nop                                     ; C8C0 EA                       .
LC8C1:  .byte   $53                             ; C8C1 53                       S
        sbc     ($52),y                         ; C8C2 F1 52                    .R
        inx                                     ; C8C4 E8                       .
        .byte   $52                             ; C8C5 52                       R
        inx                                     ; C8C6 E8                       .
        .byte   $FB                             ; C8C7 FB                       .
        sbc     #$F2                            ; C8C8 E9 F2                    ..
        sbc     #$4C                            ; C8CA E9 4C                    .L
        cmp     LDD49,x                         ; C8CC DD 49 DD                 .I.
        .byte   $52                             ; C8CF 52                       R
        .byte   $DD                             ; C8D0 DD                       .
        .byte   $4F                             ; C8D1 4F                       O
LC8D2:  cmp     $E5FB,x                         ; C8D2 DD FB E5                 ...
        eor     $95F1,y                         ; C8D5 59 F1 95                 Y..
        sbc     LE89C,y                         ; C8D8 F9 9C E8                 ...
        dec     $97F8,x                         ; C8DB DE F8 97                 ...
        inc     LF12F,x                         ; C8DE FE 2F F1                 ./.
        ror     LE0EA,x                         ; C8E1 7E EA E0                 ~..
        inx                                     ; C8E4 E8                       .
        tya                                     ; C8E5 98                       .
        inc     LE9F8                           ; C8E6 EE F8 E9                 ...
        .byte   $EF                             ; C8E9 EF                       .
        sbc     #$20                            ; C8EA E9 20                    . 
        sbc     ($45),y                         ; C8EC F1 45                    .E
        .byte   $E7                             ; C8EE E7                       .
        .byte   $0F                             ; C8EF 0F                       .
        .byte   $F2                             ; C8F0 F2                       .
        cld                                     ; C8F1 D8                       .
        .byte   $E7                             ; C8F2 E7                       .
        .byte   $03                             ; C8F3 03                       .
        .byte   $EC                             ; C8F4 EC                       .
        .byte   $3D                             ; C8F5 3D                       =
LC8F6:  inx                                     ; C8F6 E8                       .
        .byte   $43                             ; C8F7 43                       C
        .byte   $4F                             ; C8F8 4F                       O
        eor     L4142                           ; C8F9 4D 42 41                 MBA
        .byte   $4B                             ; C8FC 4B                       K
        .byte   $43                             ; C8FD 43                       C
        .byte   $4F                             ; C8FE 4F                       O
        eor     $3F3F                           ; C8FF 4D 3F 3F                 M??
        .byte   $3F                             ; C902 3F                       ?
        .byte   $3F                             ; C903 3F                       ?
        .byte   $3F                             ; C904 3F                       ?
        .byte   $3F                             ; C905 3F                       ?
        .byte   $3F                             ; C906 3F                       ?
        .byte   $3F                             ; C907 3F                       ?
        .byte   $3F                             ; C908 3F                       ?
        .byte   $42                             ; C909 42                       B
        eor     ($4B,x)                         ; C90A 41 4B                    AK
        plp                                     ; C90C 28                       (
        bvc     LC944                           ; C90D 50 35                    P5
        eor     a:L0000,x                       ; C90F 5D 00 00                 ]..
        ora     ($01,x)                         ; C912 01 01                    ..
        .byte   $FA                             ; C914 FA                       .
        .byte   $BF                             ; C915 BF                       .
        .byte   $23                             ; C916 23                       #
        .byte   $34                             ; C917 34                       4
        rol     $37,x                           ; C918 36 37                    67
        .byte   $FF                             ; C91A FF                       .
        .byte   $7B                             ; C91B 7B                       {
        asl     $35FA                           ; C91C 0E FA 35                 ..5
        bpl     LC8A2                           ; C91F 10 81                    ..
        cmp     #$0F                            ; C921 C9 0F                    ..
        .byte   $DA                             ; C923 DA                       .
        ldx     #$C6                            ; C924 A2 C6                    ..
        cmp     #$88                            ; C926 C9 88                    ..
        .byte   $02                             ; C928 02                       .
        dey                                     ; C929 88                       .
        .byte   $02                             ; C92A 02                       .
        .byte   $4F                             ; C92B 4F                       O
        lsr     $46                             ; C92C 46 46                    FF
        .byte   $53                             ; C92E 53                       S
        eor     $54                             ; C92F 45 54                    ET
        .byte   $C7                             ; C931 C7                       .
        sta     ($C2,x)                         ; C932 81 C2                    ..
        .byte   $82                             ; C934 82                       .
        eor     $D3                             ; C935 45 D3                    E.
        ror     $A5                             ; C937 66 A5                    f.
        iny                                     ; C939 C8                       .
        .byte   $A3                             ; C93A A3                       .
        .byte   $8F                             ; C93B 8F                       .
        .byte   $D2                             ; C93C D2                       .
        .byte   $42                             ; C93D 42                       B
        lda     $98,x                           ; C93E B5 98                    ..
        cpx     #$B1                            ; C940 E0 B1                    ..
        .byte   $BE                             ; C942 BE                       .
        .byte   $AE                             ; C943 AE                       .
LC944:  tax                                     ; C944 AA                       .
        .byte   $82                             ; C945 82                       .
        .byte   $93                             ; C946 93                       .
        ldx     $B1AA                           ; C947 AE AA B1                 ...
        ldx     $8293,y                         ; C94A BE 93 82                 ...
        rti                                     ; C94D 40                       @

; ----------------------------------------------------------------------------
        bpl     LC958                           ; C94E 10 08                    ..
        .byte   $1C                             ; C950 1C                       .
        .byte   $02                             ; C951 02                       .
        asl     $1E22,x                         ; C952 1E 22 1E                 .".
        brk                                     ; C955 00                       .
        .byte   $5C                             ; C956 5C                       \
        brk                                     ; C957 00                       .
LC958:  brk                                     ; C958 00                       .
        asl     L2020,x                         ; C959 1E 20 20                 .  
        jsr     L041E                           ; C95C 20 1E 04                  ..
        .byte   $7B                             ; C95F 7B                       {
        .byte   $04                             ; C960 04                       .
        php                                     ; C961 08                       .
        .byte   $1C                             ; C962 1C                       .
        .byte   $22                             ; C963 22                       "
        rol     $1E20,x                         ; C964 3E 20 1E                 > .
        brk                                     ; C967 00                       .
        .byte   $7C                             ; C968 7C                       |
        bpl     LC973                           ; C969 10 08                    ..
        .byte   $22                             ; C96B 22                       "
        .byte   $22                             ; C96C 22                       "
        .byte   $22                             ; C96D 22                       "
        rol     L001A                           ; C96E 26 1A                    &.
        brk                                     ; C970 00                       .
        .byte   $7D                             ; C971 7D                       }
        .byte   $10                             ; C972 10                       .
LC973:  php                                     ; C973 08                       .
        .byte   $1C                             ; C974 1C                       .
        .byte   $22                             ; C975 22                       "
        rol     $1E20,x                         ; C976 3E 20 1E                 > .
        brk                                     ; C979 00                       .
        ror     $221C,x                         ; C97A 7E 1C 22                 ~."
        .byte   $1C                             ; C97D 1C                       .
        .byte   $22                             ; C97E 22                       "
        rol     $1E20,x                         ; C97F 3E 20 1E                 > .
        brk                                     ; C982 00                       .
        eor     ($58,x)                         ; C983 41 58                    AX
        eor     $B850,y                         ; C985 59 50 B8                 YP.
        asl     a                               ; C988 0A                       .
        .byte   $64                             ; C989 64                       d
        inx                                     ; C98A E8                       .
        bpl     LC98D                           ; C98B 10 00                    ..
LC98D:  brk                                     ; C98D 00                       .
        .byte   $03                             ; C98E 03                       .
        .byte   $27                             ; C98F 27                       '
        sty     $A4                             ; C990 84 A4                    ..
        cpy     $E4                             ; C992 C4 E4                    ..
        eor     $4E                             ; C994 45 4E                    EN
        eor     $4C                             ; C996 45 4C                    EL
        eor     #$4E                            ; C998 49 4E                    IN
        .byte   $4F                             ; C99A 4F                       O
        eor     $4B53                           ; C99B 4D 53 4B                 MSK
        lsr     $54                             ; C99E 46 54                    FT
        eor     $4F                             ; C9A0 45 4F                    EO
        .byte   $52                             ; C9A2 52                       R
        eor     ($52,x)                         ; C9A3 41 52                    AR
        cli                                     ; C9A5 58                       X
        .byte   $52                             ; C9A6 52                       R
        eor     $5052,y                         ; C9A7 59 52 50                 YRP
        eor     $46                             ; C9AA 45 46                    EF
        .byte   $53                             ; C9AC 53                       S
        .byte   $54                             ; C9AD 54                       T
        eor     L0044                           ; C9AE 45 44                    ED
        eor     $58                             ; C9B0 45 58                    EX
        .byte   $43                             ; C9B2 43                       C
        cli                                     ; C9B3 58                       X
        .byte   $43                             ; C9B4 43                       C
        eor     $5046,y                         ; C9B5 59 46 50                 YFP
        lsr     $53                             ; C9B8 46 53                    FS
        .byte   $53                             ; C9BA 53                       S
        .byte   $43                             ; C9BB 43                       C
        lsr     a                               ; C9BC 4A                       J
        .byte   $4B                             ; C9BD 4B                       K
        .byte   $45                             ; C9BE 45                       E
SEDORIC_STR:
        .byte   "FILE NOT FOUN"                 ; C9BF 46 49 4C 45 20 4E 4F 54  FILE NOT
                                                ; C9C7 20 46 4F 55 4E            FOUN
        .byte   $C4                             ; C9CC C4                       .
        .byte   "DRIVE NOT IN LIN"              ; C9CD 44 52 49 56 45 20 4E 4F  DRIVE NO
                                                ; C9D5 54 20 49 4E 20 4C 49 4E  T IN LIN
        .byte   $C5                             ; C9DD C5                       .
        .byte   "INVALID FILE NAM"              ; C9DE 49 4E 56 41 4C 49 44 20  INVALID 
                                                ; C9E6 46 49 4C 45 20 4E 41 4D  FILE NAM
        .byte   $C5                             ; C9EE C5                       .
        .byte   "DISK I/"                       ; C9EF 44 49 53 4B 20 49 2F     DISK I/
        .byte   $CF                             ; C9F6 CF                       .
        .byte   "WRITE PROTECTE"                ; C9F7 57 52 49 54 45 20 50 52  WRITE PR
                                                ; C9FF 4F 54 45 43 54 45        OTECTE
        .byte   $C4                             ; CA05 C4                       .
        .byte   "WILDCARD(S) NOT ALLOWE"        ; CA06 57 49 4C 44 43 41 52 44  WILDCARD
                                                ; CA0E 28 53 29 20 4E 4F 54 20  (S) NOT 
                                                ; CA16 41 4C 4C 4F 57 45        ALLOWE
        .byte   $C4                             ; CA1C C4                       .
        .byte   "FILE ALREADY EXIST"            ; CA1D 46 49 4C 45 20 41 4C 52  FILE ALR
                                                ; CA25 45 41 44 59 20 45 58 49  EADY EXI
                                                ; CA2D 53 54                    ST
        .byte   $D3                             ; CA2F D3                       .
        .byte   "DISK FUL"                      ; CA30 44 49 53 4B 20 46 55 4C  DISK FUL
        .byte   $CC                             ; CA38 CC                       .
        .byte   "ILLEGAL QUANTIT"               ; CA39 49 4C 4C 45 47 41 4C 20  ILLEGAL 
                                                ; CA41 51 55 41 4E 54 49 54     QUANTIT
        .byte   $D9                             ; CA48 D9                       .
        .byte   "SYNTA"                         ; CA49 53 59 4E 54 41           SYNTA
        .byte   $D8                             ; CA4E D8                       .
        .byte   "UNKNOWN FORMA"                 ; CA4F 55 4E 4B 4E 4F 57 4E 20  UNKNOWN 
                                                ; CA57 46 4F 52 4D 41           FORMA
        .byte   $D4,$D4                         ; CA5C D4 D4                    ..
        .byte   "TYPE MISMATC"                  ; CA5E 54 59 50 45 20 4D 49 53  TYPE MIS
                                                ; CA66 4D 41 54 43              MATC
        .byte   $C8                             ; CA6A C8                       .
        .byte   "FILE TYPE MISMATC"             ; CA6B 46 49 4C 45 20 54 59 50  FILE TYP
                                                ; CA73 45 20 4D 49 53 4D 41 54  E MISMAT
                                                ; CA7B 43                       C
        .byte   $C8                             ; CA7C C8                       .
        .byte   "FILE NOT OPE"                  ; CA7D 46 49 4C 45 20 4E 4F 54  FILE NOT
                                                ; CA85 20 4F 50 45               OPE
        .byte   $CE                             ; CA89 CE                       .
        .byte   "FILE ALREADY OPE"              ; CA8A 46 49 4C 45 20 41 4C 52  FILE ALR
                                                ; CA92 45 41 44 59 20 4F 50 45  EADY OPE
        .byte   $CE                             ; CA9A CE                       .
        .byte   "END OF FIL"                    ; CA9B 45 4E 44 20 4F 46 20 46  END OF F
                                                ; CAA3 49 4C                    IL
        .byte   $C5                             ; CAA5 C5                       .
        .byte   "BAD RECORD NUMBE"              ; CAA6 42 41 44 20 52 45 43 4F  BAD RECO
                                                ; CAAE 52 44 20 4E 55 4D 42 45  RD NUMBE
        .byte   $D2                             ; CAB6 D2                       .
        .byte   "FIELD OVERFLO"                 ; CAB7 46 49 45 4C 44 20 4F 56  FIELD OV
                                                ; CABF 45 52 46 4C 4F           ERFLO
        .byte   $D7                             ; CAC4 D7                       .
        .byte   "STRING TOO LON"                ; CAC5 53 54 52 49 4E 47 20 54  STRING T
                                                ; CACD 4F 4F 20 4C 4F 4E        OO LON
        .byte   $C7                             ; CAD3 C7                       .
        .byte   "UNKNOWN FIELD NAM"             ; CAD4 55 4E 4B 4E 4F 57 4E 20  UNKNOWN 
                                                ; CADC 46 49 45 4C 44 20 4E 41  FIELD NA
                                                ; CAE4 4D                       M
        .byte   $C5,$C5,$0A,$0D                 ; CAE5 C5 C5 0A 0D              ....
        .byte   "TRACK"                         ; CAE9 54 52 41 43 4B           TRACK
        .byte   $BA                             ; CAEE BA                       .
        .byte   " SECTOR"                       ; CAEF 20 53 45 43 54 4F 52      SECTOR
        .byte   $BA                             ; CAF6 BA                       .
        .byte   " WRITE FAULT"                  ; CAF7 20 57 52 49 54 45 20 46   WRITE F
                                                ; CAFF 41 55 4C 54              AULT
        .byte   $A0                             ; CB03 A0                       .
        .byte   " READ FAULT"                   ; CB04 20 52 45 41 44 20 46 41   READ FA
                                                ; CB0C 55 4C 54                 ULT
        .byte   $A0,$0A,$0D                     ; CB0F A0 0A 0D                 ...
        .byte   " BREAK ON BYTE "               ; CB12 20 42 52 45 41 4B 20 4F   BREAK O
                                                ; CB1A 4E 20 42 59 54 45 20     N BYTE 
        .byte   $A3,$0D,$0A                     ; CB21 A3 0D 0A                 ...
        .byte   "Drive"                         ; CB24 44 72 69 76 65           Drive
        .byte   $A0                             ; CB29 A0                       .
        .byte   " V4 (Mst)"                     ; CB2A 20 56 34 20 28 4D 73 74   V4 (Mst
                                                ; CB32 29                       )
        .byte   $A0                             ; CB33 A0                       .
        .byte   " free sectors "                ; CB34 20 66 72 65 65 20 73 65   free se
                                                ; CB3C 63 74 6F 72 73 20        ctors 
        .byte   $A8                             ; CB42 A8                       .
        .byte   " Files"                        ; CB43 20 46 69 6C 65 73         Files
        .byte   $A0                             ; CB49 A0                       .
        .byte   " IS PROTECTE"                  ; CB4A 20 49 53 20 50 52 4F 54   IS PROT
                                                ; CB52 45 43 54 45              ECTE
        .byte   $C4                             ; CB56 C4                       .
        .byte   " (Y)es or (N)o"                ; CB57 20 28 59 29 65 73 20 6F   (Y)es o
                                                ; CB5F 72 20 28 4E 29 6F        r (N)o
        .byte   $BA                             ; CB65 BA                       .
        .byte   " DELETED"                      ; CB66 20 44 45 4C 45 54 45 44   DELETED
        .byte   $0D,$8A                         ; CB6E 0D 8A                    ..
        .byte   "INSERT MAS"                    ; CB70 49 4E 53 45 52 54 20 4D  INSERT M
                                                ; CB78 41 53                    AS
LCB7A:  .byte   "TER"                           ; CB7A 54 45 52                 TER
        .byte   $A0                             ; CB7D A0                       .
        .byte   "AND PRESS 'RETURN"             ; CB7E 41 4E 44 20 50 52 45 53  AND PRES
                                                ; CB86 53 20 27 52 45 54 55 52  S 'RETUR
                                                ; CB8E 4E                       N
        .byte   $A7                             ; CB8F A7                       .
        .byte   " ALREADY EXISTS"               ; CB90 20 41 4C 52 45 41 44 59   ALREADY
                                                ; CB98 20 45 58 49 53 54 53      EXISTS
        .byte   $0A,$8D                         ; CB9F 0A 8D                    ..
        .byte   " -->"                          ; CBA1 20 2D 2D 3E               -->
        .byte   $A0                             ; CBA5 A0                       .
        .byte   "USER"                          ; CBA6 55 53 45 52              USER
        .byte   $A0                             ; CBAA A0                       .
        .byte   " V4 (Slv)"                     ; CBAB 20 56 34 20 28 53 6C 76   V4 (Slv
                                                ; CBB3 29                       )
        .byte   $A0                             ; CBB4 A0                       .
        .byte   " (Type"                        ; CBB5 20 28 54 79 70 65         (Type
LCBBB:  .byte   $BD                             ; CBBB BD                       .
LCBBC:  .byte   ")"                             ; CBBC 29                       )
LCBBD:  .byte   $A0                             ; CBBD A0                       .
LCBBE:  .byte   " DISC IN DRIVE"                ; CBBE 20 44 49 53 43 20 49 4E   DISC IN
                                                ; CBC6 20 44 52 49 56 45         DRIVE
        .byte   $A0                             ; CBCC A0                       .
; ----------------------------------------------------------------------------
        php                                     ; CBCD 08                       .
        lda     V1ER                            ; CBCE AD 0E 03                 ...
        pha                                     ; CBD1 48                       H
        tya                                     ; CBD2 98                       .
        pha                                     ; CBD3 48                       H
        lda     #$40                            ; CBD4 A9 40                    .@
        sta     V1ER                            ; CBD6 8D 0E 03                 ...
        jsr     LCFE9                           ; CBD9 20 E9 CF                  ..
        pla                                     ; CBDC 68                       h
        tay                                     ; CBDD A8                       .
        pla                                     ; CBDE 68                       h
        sta     V1ER                            ; CBDF 8D 0E 03                 ...
        plp                                     ; CBE2 28                       (
        lda     #$FF                            ; CBE3 A9 FF                    ..
        bit     LC017                           ; CBE5 2C 17 C0                 ,..
        rts                                     ; CBE8 60                       `

; ----------------------------------------------------------------------------
        nop                                     ; CBE9 EA                       .
        ldy     #$03                            ; CBEA A0 03                    ..
        sty     LC006                           ; CBEC 8C 06 C0                 ...
        ldy     #$08                            ; CBEF A0 08                    ..
        sty     LC007                           ; CBF1 8C 07 C0                 ...
        pha                                     ; CBF4 48                       H
        sei                                     ; CBF5 78                       x
        stx     LC005                           ; CBF6 8E 05 C0                 ...
        ldy     LC000                           ; CBF9 AC 00 C0                 ...
        lda     LD122,y                         ; CBFC B9 22 D1                 .".
        bit     LC001                           ; CBFF 2C 01 C0                 ,..
        bpl     LCC06                           ; CC02 10 02                    ..
        ora     #$10                            ; CC04 09 10                    ..
LCC06:  sta     MICRODISC_CONTROL_SHADOW        ; CC06 8D FB 04                 ...
        lda     LD126,y                         ; CC09 B9 26 D1                 .&.
        nop                                     ; CC0C EA                       .
        nop                                     ; CC0D EA                       .
        sta     MICRODISC_FDC_TRACK             ; CC0E 8D 11 03                 ...
        lda     LC003                           ; CC11 AD 03 C0                 ...
        sta     SEDORIC_TRAV1                   ; CC14 85 F3                    ..
        lda     LC004                           ; CC16 AD 04 C0                 ...
        sta     SEDORIC_TRAV2                   ; CC19 85 F4                    ..
        lda     #$20                            ; CC1B A9 20                    . 
        bit     LC005                           ; CC1D 2C 05 C0                 ,..
        bpl     LCC4C                           ; CC20 10 2A                    .*
        bvc     LCC26                           ; CC22 50 02                    P.
        beq     LCC4C                           ; CC24 F0 26                    .&
LCC26:  .byte   $AD                             ; CC26 AD                       .
LCC27:  .byte   $01                             ; CC27 01                       .
LCC28:  cpy     #$29                            ; CC28 C0 29                    .)
        .byte   $7F                             ; CC2A 7F                       .
        nop                                     ; CC2B EA                       .
        sta     MICRODISC_FDC_DATA              ; CC2C 8D 13 03                 ...
        nop                                     ; CC2F EA                       .
        nop                                     ; CC30 EA                       .
        nop                                     ; CC31 EA                       .
        cmp     MICRODISC_FDC_TRACK             ; CC32 CD 11 03                 ...
        beq     LCC4C                           ; CC35 F0 15                    ..
        txa                                     ; CC37 8A                       .
        ldx     #$18                            ; CC38 A2 18                    ..
        jsr     LCFF4                           ; CC3A 20 F4 CF                  ..
        sta     LC005                           ; CC3D 8D 05 C0                 ...
        ldy     MICRODISC_FDC_DATA              ; CC40 AC 13 03                 ...
        ora     #$04                            ; CC43 09 04                    ..
        tax                                     ; CC45 AA                       .
        sty     MICRODISC_FDC_TRACK             ; CC46 8C 11 03                 ...
        nop                                     ; CC49 EA                       .
        nop                                     ; CC4A EA                       .
        nop                                     ; CC4B EA                       .
LCC4C:  ldy     LC002                           ; CC4C AC 02 C0                 ...
        sty     MICRODISC_FDC_SECTOR            ; CC4F 8C 12 03                 ...
        ldy     #$00                            ; CC52 A0 00                    ..
        txa                                     ; CC54 8A                       .
        bmi     LCC5A                           ; CC55 30 03                    0.
LCC57:  dey                                     ; CC57 88                       .
        bne     LCC57                           ; CC58 D0 FD                    ..
LCC5A:  lda     MICRODISC_CONTROL_SHADOW        ; CC5A AD FB 04                 ...
        stx     MICRODISC_FDC_COMMAND           ; CC5D 8E 10 03                 ...
        ora     #$01                            ; CC60 09 01                    ..
        sta     MICRODISC_CONTROL               ; CC62 8D 14 03                 ...
        txa                                     ; CC65 8A                       .
        and     #$F0                            ; CC66 29 F0                    ).
        cmp     #$E0                            ; CC68 C9 E0                    ..
        cli                                     ; CC6A 58                       X
        beq     LCC73                           ; CC6B F0 06                    ..
        and     #$20                            ; CC6D 29 20                    ) 
        bne     LCC85                           ; CC6F D0 14                    ..
        nop                                     ; CC71 EA                       .
        nop                                     ; CC72 EA                       .
LCC73:  lda     MICRODISC_DRQ                   ; CC73 AD 18 03                 ...
        bmi     LCC73                           ; CC76 30 FB                    0.
        lda     MICRODISC_FDC_DATA              ; CC78 AD 13 03                 ...
        sta     (SEDORIC_TRAV1),y               ; CC7B 91 F3                    ..
        iny                                     ; CC7D C8                       .
        bne     LCC73                           ; CC7E D0 F3                    ..
        inc     SEDORIC_TRAV2                   ; CC80 E6 F4                    ..
        jmp     LD073                           ; CC82 4C 73 D0                 Ls.

; ----------------------------------------------------------------------------
LCC85:  lda     MICRODISC_DRQ                   ; CC85 AD 18 03                 ...
        bmi     LCC85                           ; CC88 30 FB                    0.
        lda     (SEDORIC_TRAV1),y               ; CC8A B1 F3                    ..
        sta     MICRODISC_FDC_DATA              ; CC8C 8D 13 03                 ...
        iny                                     ; CC8F C8                       .
        bne     LCC85                           ; CC90 D0 F3                    ..
        inc     SEDORIC_TRAV2                   ; CC92 E6 F4                    ..
        jmp     LD085                           ; CC94 4C 85 D0                 L..

; ----------------------------------------------------------------------------
        nop                                     ; CC97 EA                       .
        nop                                     ; CC98 EA                       .
        nop                                     ; CC99 EA                       .
        bit     MICRODISC_CONTROL               ; CC9A 2C 14 03                 ,..
        bpl     LCCA2                           ; CC9D 10 03                    ..
        jmp     IRQRAM                          ; CC9F 4C F5 04                 L..

; ----------------------------------------------------------------------------
LCCA2:  pla                                     ; CCA2 68                       h
        pla                                     ; CCA3 68                       h
        pla                                     ; CCA4 68                       h
        lda     MICRODISC_CONTROL_SHADOW        ; CCA5 AD FB 04                 ...
        sta     MICRODISC_CONTROL               ; CCA8 8D 14 03                 ...
        ldy     LC000                           ; CCAB AC 00 C0                 ...
        lda     MICRODISC_FDC_TRACK             ; CCAE AD 11 03                 ...
        sta     LD126,y                         ; CCB1 99 26 D1                 .&.
        clc                                     ; CCB4 18                       .
        lda     MICRODISC_FDC_COMMAND           ; CCB5 AD 10 03                 ...
        and     #$5C                            ; CCB8 29 5C                    )\
        tay                                     ; CCBA A8                       .
        .byte   $AE                             ; CCBB AE                       .
LCCBC:  .byte   $05                             ; CCBC 05                       .
LCCBD:  cpy     #$30                            ; CCBD C0 30                    .0
        .byte   $02                             ; CCBF 02                       .
        ldy     #$00                            ; CCC0 A0 00                    ..
LCCC2:  sty     LC017                           ; CCC2 8C 17 C0                 ...
        and     #$40                            ; CCC5 29 40                    )@
        bne     LCCD8                           ; CCC7 D0 0F                    ..
        tya                                     ; CCC9 98                       .
        and     #$10                            ; CCCA 29 10                    ).
        beq     LCCDB                           ; CCCC F0 0D                    ..
        dec     LC006                           ; CCCE CE 06 C0                 ...
        beq     LCCD8                           ; CCD1 F0 05                    ..
        jsr     LD0E8                           ; CCD3 20 E8 D0                  ..
        bcc     LCCE5                           ; CCD6 90 0D                    ..
LCCD8:  sec                                     ; CCD8 38                       8
LCCD9:  pla                                     ; CCD9 68                       h
        rts                                     ; CCDA 60                       `

; ----------------------------------------------------------------------------
LCCDB:  tya                                     ; CCDB 98                       .
        and     #$0C                            ; CCDC 29 0C                    ).
        beq     LCCD9                           ; CCDE F0 F9                    ..
        dec     LC007                           ; CCE0 CE 07 C0                 ...
        beq     LCCD8                           ; CCE3 F0 F3                    ..
LCCE5:  jmp     LCFF9                           ; CCE5 4C F9 CF                 L..

; ----------------------------------------------------------------------------
        txa                                     ; CCE8 8A                       .
        pha                                     ; CCE9 48                       H
        lda     LC003                           ; CCEA AD 03 C0                 ...
        pha                                     ; CCED 48                       H
        lda     LC004                           ; CCEE AD 04 C0                 ...
        pha                                     ; CCF1 48                       H
        lda     #$60                            ; CCF2 A9 60                    .`
        ldy     #$C0                            ; CCF4 A0 C0                    ..
        .byte   $8D                             ; CCF6 8D                       .
LCCF7:  .byte   $03                             ; CCF7 03                       .
        cpy     #$8C                            ; CCF8 C0 8C                    ..
LCCFA:  .byte   $04                             ; CCFA 04                       .
        cpy     #$AD                            ; CCFB C0 AD                    ..
        asl     $C0                             ; CCFD 06 C0                    ..
        ldx     #$C0                            ; CCFF A2 C0                    ..
        ldy     #$01                            ; CD01 A0 01                    ..
        jsr     LCFEC                           ; CD03 20 EC CF                  ..
        sta     LC006                           ; CD06 8D 06 C0                 ...
        pla                                     ; CD09 68                       h
        sta     LC004                           ; CD0A 8D 04 C0                 ...
        pla                                     ; CD0D 68                       h
        .byte   $8D                             ; CD0E 8D                       .
        .byte   $03                             ; CD0F 03                       .
LCD10:  cpy     #$B0                            ; CD10 C0 B0                    ..
        ora     #$AD                            ; CD12 09 AD                    ..
        .byte   $12                             ; CD14 12                       .
        .byte   $03                             ; CD15 03                       .
        ldy     LC000                           ; CD16 AC 00 C0                 ...
        .byte   $99                             ; CD19 99                       .
LCD1A:  rol     $D1                             ; CD1A 26 D1                    &.
LCD1C:  pla                                     ; CD1C 68                       h
        tax                                     ; CD1D AA                       .
        .byte   $8E                             ; CD1E 8E                       .
LCD1F:  ora     $C0                             ; CD1F 05 C0                    ..
        rts                                     ; CD21 60                       `

; ----------------------------------------------------------------------------
        sty     $A4                             ; CD22 84 A4                    ..
        .byte   $C4                             ; CD24 C4                       .
LCD25:  cpx     $50                             ; CD25 E4 50                    .P
        bvc     $CD79                           ; CD27 50 50                    PP
        bvc     $CD7B                           ; CD29 50 50                    PP
LCD2B:  bcc     $CD32                           ; CD2B 90 05                    ..
        .byte   $A9                             ; CD2D A9                       .
LCD2E:  bne     LCCBD                           ; CD2E D0 8D                    ..
        bpl     LCD35                           ; CD30 10 03                    ..
        sec                                     ; CD32 38                       8
        .byte   $4C                             ; CD33 4C                       L
        sed                                     ; CD34 F8                       .
LCD35:  .byte   $04                             ; CD35 04                       .
        stx     SEDORIC_TRAV1                   ; CD36 86 F3                    ..
        ldx     #$04                            ; CD38 A2 04                    ..
        jsr     LD36C                           ; CD3A 20 6C D3                  l.
        sec                                     ; CD3D 38                       8
        ldx     SEDORIC_TRAV1                   ; CD3E A6 F3                    ..
        .byte   $A5                             ; CD40 A5                       .
LCD41:  .byte   $F2                             ; CD41 F2                       .
        sbc     #$02                            ; CD42 E9 02                    ..
        bcs     LCD47                           ; CD44 B0 01                    ..
        dex                                     ; CD46 CA                       .
LCD47:  pha                                     ; CD47 48                       H
        txa                                     ; CD48 8A                       .
        jsr     LD613                           ; CD49 20 13 D6                  ..
        pla                                     ; CD4C 68                       h
LCD4D:  jsr     LD613                           ; CD4D 20 13 D6                  ..
        cli                                     ; CD50 58                       X
        ldx     #$FF                            ; CD51 A2 FF                    ..
        txs                                     ; CD53 9A                       .
        jsr     LD5D8                           ; CD54 20 D8 D5                  ..
        lda     $A0C4                           ; CD57 AD C4 A0                 ...
        cpy     $60                             ; CD5A C4 60                    .`
        jsr     LD5D8                           ; CD5C 20 D8 D5                  ..
        sed                                     ; CD5F F8                       .
        .byte   $C3                             ; CD60 C3                       .
        .byte   $F4                             ; CD61 F4                       .
        .byte   $C3                             ; CD62 C3                       .
        rts                                     ; CD63 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CD64 20 D8 D5                  ..
        pha                                     ; CD67 48                       H
        cpy     L0044                           ; CD68 C4 44                    .D
        cpy     $60                             ; CD6A C4 60                    .`
        ldx     #$4D                            ; CD6C A2 4D                    .M
        bit     $A3A2                           ; CD6E 2C A2 A3                 ,..
        jsr     LD5D8                           ; CD71 20 D8 D5                  ..
        sta     $C4                             ; CD74 85 C4                    ..
        .byte   $7E                             ; CD76 7E                       ~
        .byte   $C4                             ; CD77 C4                       .
LCD78:  .byte   $20                             ; CD78 20                        
        cld                                     ; CD79 D8                       .
LCD7A:  cmp     $A3,x                           ; CD7A D5 A3                    ..
        cpy     $96                             ; CD7C C4 96                    ..
        cpy     $60                             ; CD7E C4 60                    .`
        jsr     LD5D8                           ; CD80 20 D8 D5                  ..
LCD83:  lda     $C4,x                           ; CD83 B5 C4                    ..
        tay                                     ; CD85 A8                       .
        cpy     $60                             ; CD86 C4 60                    .`
        lda     $9A                             ; CD88 A5 9A                    ..
        ldy     $9B                             ; CD8A A4 9B                    ..
LCD8C:  jsr     LD5D8                           ; CD8C 20 D8 D5                  ..
        .byte   $73                             ; CD8F 73                       s
        cmp     $63                             ; CD90 C5 63                    .c
        cmp     $60                             ; CD92 C5 60                    .`
LCD94:  .byte   $20                             ; CD94 20                        
LCD95:  cld                                     ; CD95 D8                       .
        cmp     $0A,x                           ; CD96 D5 0A                    ..
        dec     $FA                             ; CD98 C6 FA                    ..
        cmp     $60                             ; CD9A C5 60                    .`
        jsr     LD5D8                           ; CD9C 20 D8 D5                  ..
        dec     $B3C6,x                         ; CD9F DE C6 B3                 ...
        dec     $60                             ; CDA2 C6 60                    .`
        jsr     LD5D8                           ; CDA4 20 D8 D5                  ..
        inc     LC3C6                           ; CDA7 EE C6 C3                 ...
        dec     $60                             ; CDAA C6 60                    .`
        jsr     LD5D8                           ; CDAC 20 D8 D5                  ..
        adc     $C7                             ; CDAF 65 C7                    e.
        .byte   $3A                             ; CDB1 3A                       :
        .byte   $C7                             ; CDB2 C7                       .
        rts                                     ; CDB3 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CDB4 20 D8 D5                  ..
        sta     $6CC7,y                         ; CDB7 99 C7 6C                 ..l
LCDBA:  .byte   $C7                             ; CDBA C7                       .
        rts                                     ; CDBB 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CDBC 20 D8 D5                  ..
        rti                                     ; CDBF 40                       @

; ----------------------------------------------------------------------------
        iny                                     ; CDC0 C8                       .
        asl     $C8,x                           ; CDC1 16 C8                    ..
        rts                                     ; CDC3 60                       `

; ----------------------------------------------------------------------------
        .byte   $20                             ; CDC4 20                        
        cld                                     ; CDC5 D8                       .
LCDC6:  cmp     $3D,x                           ; CDC6 D5 3D                    .=
        iny                                     ; CDC8 C8                       .
        .byte   $2F                             ; CDC9 2F                       /
        iny                                     ; CDCA C8                       .
        rts                                     ; CDCB 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CDCC 20 D8 D5                  ..
        .byte   $1F                             ; CDCF 1F                       .
        cmp     #$52                            ; CDD0 C9 52                    .R
        cmp     #$60                            ; CDD2 C9 60                    .`
        jsr     LD5D8                           ; CDD4 20 D8 D5                  ..
        .byte   $F1                             ; CDD7 F1                       .
LCDD8:  cmp     #$23                            ; CDD8 C9 23                    .#
        dex                                     ; CDDA CA                       .
        rts                                     ; CDDB 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CDDC 20 D8 D5                  ..
        .byte   $1C                             ; CDDF 1C                       .
        dex                                     ; CDE0 CA                       .
        lsr     $20CA                           ; CDE1 4E CA 20                 N. 
        cld                                     ; CDE4 D8                       .
        cmp     $0D,x                           ; CDE5 D5 0D                    ..
        dex                                     ; CDE7 CA                       .
        .byte   $3F                             ; CDE8 3F                       ?
        dex                                     ; CDE9 CA                       .
        rts                                     ; CDEA 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CDEB 20 D8 D5                  ..
        eor     ($CA,x)                         ; CDEE 41 CA                    A.
        .byte   $73                             ; CDF0 73                       s
        dex                                     ; CDF1 CA                       .
        rts                                     ; CDF2 60                       `

; ----------------------------------------------------------------------------
        jsr     LD39E                           ; CDF3 20 9E D3                  ..
        jsr     LD5D8                           ; CDF6 20 D8 D5                  ..
        tya                                     ; CDF9 98                       .
        dex                                     ; CDFA CA                       .
        .byte   $E2                             ; CDFB E2                       .
        dex                                     ; CDFC CA                       .
        rts                                     ; CDFD 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CDFE 20 D8 D5                  ..
        .byte   $EF                             ; CE01 EF                       .
        dex                                     ; CE02 CA                       .
        and     $60CB,y                         ; CE03 39 CB 60                 9.`
        jsr     LD5D8                           ; CE06 20 D8 D5                  ..
        .byte   $9F                             ; CE09 9F                       .
        .byte   $CB                             ; CE0A CB                       .
        beq     LCDD8                           ; CE0B F0 CB                    ..
        rts                                     ; CE0D 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CE0E 20 D8 D5                  ..
        .byte   $12                             ; CE11 12                       .
        cpy     LCCD9                           ; CE12 CC D9 CC                 ...
        rts                                     ; CE15 60                       `

; ----------------------------------------------------------------------------
        jsr     LD224                           ; CE16 20 24 D2                  $.
        clc                                     ; CE19 18                       .
        bit     $38                             ; CE1A 24 38                    $8
        jsr     LD5D8                           ; CE1C 20 D8 D5                  ..
        adc     $09CE,x                         ; CE1F 7D CE 09                 }..
        .byte   $CF                             ; CE22 CF                       .
        rts                                     ; CE23 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CE24 20 D8 D5                  ..
        .byte   $8B                             ; CE27 8B                       .
        dec     LCF17                           ; CE28 CE 17 CF                 ...
        rts                                     ; CE2B 60                       `

; ----------------------------------------------------------------------------
        lda     #$2C                            ; CE2C A9 2C                    .,
        jsr     LD5D8                           ; CE2E 20 D8 D5                  ..
        .byte   $DB                             ; CE31 DB                       .
        .byte   $CF                             ; CE32 CF                       .
        .byte   $67                             ; CE33 67                       g
        bne     LCE82                           ; CE34 D0 4C                    .L
        lda     ($D3,x)                         ; CE36 A1 D3                    ..
        jsr     LD5D8                           ; CE38 20 D8 D5                  ..
        .byte   $FC                             ; CE3B FC                       .
        .byte   $D0                             ; CE3C D0                       .
LCE3D:  dey                                     ; CE3D 88                       .
        cmp     ($85),y                         ; CE3E D1 85                    ..
        .byte   $D3                             ; CE40 D3                       .
        sty     $D4                             ; CE41 84 D4                    ..
        rts                                     ; CE43 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CE44 20 D8 D5                  ..
        cli                                     ; CE47 58                       X
        cmp     ($E8),y                         ; CE48 D1 E8                    ..
        cmp     ($60),y                         ; CE4A D1 60                    .`
        jsr     LD5D8                           ; CE4C 20 D8 D5                  ..
        .byte   $17                             ; CE4F 17                       .
        .byte   $D2                             ; CE50 D2                       .
        lda     #$D2                            ; CE51 A9 D2                    ..
        rts                                     ; CE53 60                       `

; ----------------------------------------------------------------------------
        .byte   $20                             ; CE54 20                        
LCE55:  cld                                     ; CE55 D8                       .
        cmp     $ED,x                           ; CE56 D5 ED                    ..
        .byte   $D3                             ; CE58 D3                       .
        sta     $60D4,y                         ; CE59 99 D4 60                 ..`
        jsr     LD5D8                           ; CE5C 20 D8 D5                  ..
LCE5F:  ora     LD2D4,y                         ; CE5F 19 D4 D2                 ...
        .byte   $D4                             ; CE62 D4                       .
        rts                                     ; CE63 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CE64 20 D8 D5                  ..
        beq     LCE3D                           ; CE67 F0 D4                    ..
        .byte   $AB                             ; CE69 AB                       .
        cmp     $60,x                           ; CE6A D5 60                    .`
        jsr     LD5D8                           ; CE6C 20 D8 D5                  ..
        .byte   $C7                             ; CE6F C7                       .
        dec     $82,x                           ; CE70 D6 82                    ..
        .byte   $D7                             ; CE72 D7                       .
        rts                                     ; CE73 60                       `

; ----------------------------------------------------------------------------
        jsr     LD21B                           ; CE74 20 1B D2                  ..
        jsr     LD5D8                           ; CE77 20 D8 D5                  ..
        ora     $D7,x                           ; CE7A 15 D7                    ..
        bne     LCE55                           ; CE7C D0 D7                    ..
        rts                                     ; CE7E 60                       `

; ----------------------------------------------------------------------------
        jsr     LD216                           ; CE7F 20 16 D2                  ..
LCE82:  jsr     LD5D8                           ; CE82 20 D8 D5                  ..
        bpl     LCE5F                           ; CE85 10 D8                    ..
        .byte   $CB                             ; CE87 CB                       .
        cld                                     ; CE88 D8                       .
        rts                                     ; CE89 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CE8A 20 D8 D5                  ..
        .byte   $6B                             ; CE8D 6B                       k
        cld                                     ; CE8E D8                       .
        rol     $D9                             ; CE8F 26 D9                    &.
        rts                                     ; CE91 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CE92 20 D8 D5                  ..
        stx     $D9,y                           ; CE95 96 D9                    ..
        .byte   $22                             ; CE97 22                       "
        .byte   $DA                             ; CE98 DA                       .
        rts                                     ; CE99 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CE9A 20 D8 D5                  ..
        .byte   $80                             ; CE9D 80                       .
        .byte   $DA                             ; CE9E DA                       .
        .byte   $0B                             ; CE9F 0B                       .
        .byte   $DB                             ; CEA0 DB                       .
        rts                                     ; CEA1 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CEA2 20 D8 D5                  ..
        .byte   $97                             ; CEA5 97                       .
        .byte   $DA                             ; CEA6 DA                       .
        .byte   $22                             ; CEA7 22                       "
        .byte   $DB                             ; CEA8 DB                       .
        rts                                     ; CEA9 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CEAA 20 D8 D5                  ..
        .byte   $B7                             ; CEAD B7                       .
        .byte   $DC                             ; CEAE DC                       .
        sbc     $60DC                           ; CEAF ED DC 60                 ..`
        jsr     LD5D8                           ; CEB2 20 D8 D5                  ..
        cpx     #$DD                            ; CEB5 E0 DD                    ..
        cpx     $DD                             ; CEB7 E4 DD                    ..
        rts                                     ; CEB9 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CEBA 20 D8 D5                  ..
        .byte   $73                             ; CEBD 73                       s
        dec     LDE7B,x                         ; CEBE DE 7B DE                 .{.
        rts                                     ; CEC1 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CEC2 20 D8 D5                  ..
        lda     $DE                             ; CEC5 A5 DE                    ..
        lda     $60DE                           ; CEC7 AD DE 60                 ..`
        jsr     LD5D8                           ; CECA 20 D8 D5                  ..
        cmp     $D8,x                           ; CECD D5 D8                    ..
        rti                                     ; CECF 40                       @

; ----------------------------------------------------------------------------
        .byte   $DF                             ; CED0 DF                       .
        rts                                     ; CED1 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CED2 20 D8 D5                  ..
        cmp     ($E0),y                         ; CED5 D1 E0                    ..
        cmp     $E0,x                           ; CED7 D5 E0                    ..
        rts                                     ; CED9 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CEDA 20 D8 D5                  ..
        adc     $71E2                           ; CEDD 6D E2 71                 m.q
        .byte   $E2                             ; CEE0 E2                       .
        rts                                     ; CEE1 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CEE2 20 D8 D5                  ..
        adc     $7DE3,y                         ; CEE5 79 E3 7D                 y.}
        .byte   $E3                             ; CEE8 E3                       .
        rts                                     ; CEE9 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CEEA 20 D8 D5                  ..
        .byte   $87                             ; CEED 87                       .
        .byte   $E3                             ; CEEE E3                       .
        .byte   $8B                             ; CEEF 8B                       .
        .byte   $E3                             ; CEF0 E3                       .
        rts                                     ; CEF1 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CEF2 20 D8 D5                  ..
        stx     $92E3                           ; CEF5 8E E3 92                 ...
        .byte   $E3                             ; CEF8 E3                       .
        rts                                     ; CEF9 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CEFA 20 D8 D5                  ..
        sta     $53E7,x                         ; CEFD 9D E7 53                 ..S
        inx                                     ; CF00 E8                       .
        rts                                     ; CF01 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CF02 20 D8 D5                  ..
        ora     $E9                             ; CF05 05 E9                    ..
        sei                                     ; CF07 78                       x
        .byte   $EB                             ; CF08 EB                       .
        rts                                     ; CF09 60                       `

; ----------------------------------------------------------------------------
LCF0A:  jsr     LD5D8                           ; CF0A 20 D8 D5                  ..
        .byte   $C7                             ; CF0D C7                       .
        cpx     LEDE0                           ; CF0E EC E0 ED                 ...
        rts                                     ; CF11 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CF12 20 D8 D5                  ..
        .byte   $79                             ; CF15 79                       y
        .byte   $F0                             ; CF16 F0                       .
LCF17:  bpl     LCF0A                           ; CF17 10 F1                    ..
        rts                                     ; CF19 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CF1A 20 D8 D5                  ..
        .byte   $94                             ; CF1D 94                       .
LCF1E:  .byte   $F4                             ; CF1E F4                       .
        .byte   $EF                             ; CF1F EF                       .
        .byte   $F4                             ; CF20 F4                       .
        rts                                     ; CF21 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CF22 20 D8 D5                  ..
        and     SEDORIC_TRAV3,x                 ; CF25 35 F5                    5.
        bcc     LCF1E                           ; CF27 90 F5                    ..
        rts                                     ; CF29 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CF2A 20 D8 D5                  ..
        .byte   $CB                             ; CF2D CB                       .
        .byte   $F7                             ; CF2E F7                       .
        ora     (SEDORIC_TRAV6,x)               ; CF2F 01 F8                    ..
        rts                                     ; CF31 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CF32 20 D8 D5                  ..
        rol     $82F9,x                         ; CF35 3E F9 82                 >..
        sbc     $2060,y                         ; CF38 F9 60 20                 .` 
        cld                                     ; CF3B D8                       .
        cmp     $E2,x                           ; CF3C D5 E2                    ..
        brk                                     ; CF3E 00                       .
        .byte   $E2                             ; CF3F E2                       .
        brk                                     ; CF40 00                       .
        rts                                     ; CF41 60                       `

; ----------------------------------------------------------------------------
        jsr     LD5D8                           ; CF42 20 D8 D5                  ..
        inx                                     ; CF45 E8                       .
        brk                                     ; CF46 00                       .
        inx                                     ; CF47 E8                       .
        brk                                     ; CF48 00                       .
        rts                                     ; CF49 60                       `

; ----------------------------------------------------------------------------
        ldy     #$09                            ; CF4A A0 09                    ..
        bit     a:$A0                           ; CF4C 2C A0 00                 ,..
LCF4F:  lda     LCCF7,x                         ; CF4F BD F7 CC                 ...
        sta     LC029,y                         ; CF52 99 29 C0                 .).
        iny                                     ; CF55 C8                       .
        inx                                     ; CF56 E8                       .
        cpy     #$0C                            ; CF57 C0 0C                    ..
        bne     LCF4F                           ; CF59 D0 F4                    ..
        rts                                     ; CF5B 60                       `

; ----------------------------------------------------------------------------
        lda     LC00D                           ; CF5C AD 0D C0                 ...
        ldy     LC00E                           ; CF5F AC 0E C0                 ...
        bne     LCF76                           ; CF62 D0 12                    ..
        lda     LC00F                           ; CF64 AD 0F C0                 ...
        ldy     LC010                           ; CF67 AC 10 C0                 ...
        bne     LCF76                           ; CF6A D0 0A                    ..
        lda     #$E6                            ; CF6C A9 E6                    ..
        ldy     #$CE                            ; CF6E A0 CE                    ..
        bne     LCF76                           ; CF70 D0 04                    ..
        lda     #$BE                            ; CF72 A9 BE                    ..
        ldy     #$CD                            ; CF74 A0 CD                    ..
LCF76:  sta     $18                             ; CF76 85 18                    ..
        sty     $19                             ; CF78 84 19                    ..
        ldy     #$00                            ; CF7A A0 00                    ..
LCF7C:  dex                                     ; CF7C CA                       .
        bmi     LCF8B                           ; CF7D 30 0C                    0.
LCF7F:  inc     $18                             ; CF7F E6 18                    ..
        bne     LCF85                           ; CF81 D0 02                    ..
        inc     $19                             ; CF83 E6 19                    ..
LCF85:  lda     ($18),y                         ; CF85 B1 18                    ..
        bpl     LCF7F                           ; CF87 10 F6                    ..
        bmi     LCF7C                           ; CF89 30 F1                    0.
LCF8B:  iny                                     ; CF8B C8                       .
        lda     ($18),y                         ; CF8C B1 18                    ..
        php                                     ; CF8E 08                       .
        and     #$7F                            ; CF8F 29 7F                    ).
        jsr     LD62A                           ; CF91 20 2A D6                  *.
        plp                                     ; CF94 28                       (
        bpl     LCF8B                           ; CF95 10 F4                    ..
        rts                                     ; CF97 60                       `

; ----------------------------------------------------------------------------
        jsr     LD33A                           ; CF98 20 3A D3                  :.
        jmp     LD3A1                           ; CF9B 4C A1 D3                 L..

; ----------------------------------------------------------------------------
        jsr     LD342                           ; CF9E 20 42 D3                  B.
        php                                     ; CFA1 08                       .
        cmp     #$61                            ; CFA2 C9 61                    .a
        bcc     LCFAC                           ; CFA4 90 06                    ..
        cmp     #$7B                            ; CFA6 C9 7B                    .{
        bcs     LCFAC                           ; CFA8 B0 02                    ..
        and     #$DF                            ; CFAA 29 DF                    ).
LCFAC:  plp                                     ; CFAC 28                       (
        rts                                     ; CFAD 60                       `

; ----------------------------------------------------------------------------
        ldx     #$00                            ; CFAE A2 00                    ..
        stx     SEDORIC_IDERROR                 ; CFB0 8E FD 04                 ...
        tsx                                     ; CFB3 BA                       .
        stx     LC023                           ; CFB4 8E 23 C0                 .#.
        lda     $E9                             ; CFB7 A5 E9                    ..
        ldy     $EA                             ; CFB9 A4 EA                    ..
        sta     LC01F                           ; CFBB 8D 1F C0                 ...
        sty     LC020                           ; CFBE 8C 20 C0                 . .
        jsr     LD39E                           ; CFC1 20 9E D3                  ..
        sbc     #$41                            ; CFC4 E9 41                    .A
        ldy     #$1A                            ; CFC6 A0 1A                    ..
        bcc     LCFD2                           ; CFC8 90 08                    ..
        cmp     #$1A                            ; CFCA C9 1A                    ..
        .byte   $B0                             ; CFCC B0                       .
LCFCD:  .byte   $04                             ; CFCD 04                       .
        tay                                     ; CFCE A8                       .
        jsr     LD33A                           ; CFCF 20 3A D3                  :.
LCFD2:  tya                                     ; CFD2 98                       .
        asl     a                               ; CFD3 0A                       .
        asl     a                               ; CFD4 0A                       .
        tay                                     ; CFD5 A8                       .
        lda     LCBBB,y                         ; CFD6 B9 BB CB                 ...
        sta     $18                             ; CFD9 85 18                    ..
        lda     LCBBC,y                         ; CFDB B9 BC CB                 ...
        sta     $19                             ; CFDE 85 19                    ..
        lda     LCBBE,y                         ; CFE0 B9 BE CB                 ...
        sta     SEDORIC_TRAV0                   ; CFE3 85 F2                    ..
        ldx     LCBBD,y                         ; CFE5 BE BD CB                 ...
LCFE8:  .byte   $C6                             ; CFE8 C6                       .
LCFE9:  .byte   $F2                             ; CFE9 F2                       .
        bmi     LD028                           ; CFEA 30 3C                    0<
LCFEC:  ldy     #$FF                            ; CFEC A0 FF                    ..
LCFEE:  iny                                     ; CFEE C8                       .
        lda     ($18),y                         ; CFEF B1 18                    ..
        beq     LD017                           ; CFF1 F0 24                    .$
        .byte   $85                             ; CFF3 85                       .
LCFF4:  .byte   $F3                             ; CFF4 F3                       .
        lda     ($E9),y                         ; CFF5 B1 E9                    ..
        cmp     #$61                            ; CFF7 C9 61                    .a
LCFF9:  bcc     LD001                           ; CFF9 90 06                    ..
        cmp     #$7B                            ; CFFB C9 7B                    .{
        bcs     LD001                           ; CFFD B0 02                    ..
        and     #$DF                            ; CFFF 29 DF                    ).
LD001:  cmp     SEDORIC_TRAV1                   ; D001 C5 F3                    ..
        beq     LCFEE                           ; D003 F0 E9                    ..
LD005:  iny                                     ; D005 C8                       .
        lda     ($18),y                         ; D006 B1 18                    ..
        bne     LD005                           ; D008 D0 FB                    ..
        inx                                     ; D00A E8                       .
        sec                                     ; D00B 38                       8
        tya                                     ; D00C 98                       .
        adc     $18                             ; D00D 65 18                    e.
        sta     $18                             ; D00F 85 18                    ..
        bcc     LCFE8                           ; D011 90 D5                    ..
        inc     $19                             ; D013 E6 19                    ..
        bcs     LCFE8                           ; D015 B0 D1                    ..
LD017:  txa                                     ; D017 8A                       .
        asl     a                               ; D018 0A                       .
        tax                                     ; D019 AA                       .
        lda     LCC28,x                         ; D01A BD 28 CC                 .(.
        pha                                     ; D01D 48                       H
        lda     LCC27,x                         ; D01E BD 27 CC                 .'.
        pha                                     ; D021 48                       H
        jsr     LD1E3                           ; D022 20 E3 D1                  ..
        jmp     LD39E                           ; D025 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LD028:  lda     LC01F                           ; D028 AD 1F C0                 ...
        ldy     LC020                           ; D02B AC 20 C0                 . .
        sta     $E9                             ; D02E 85 E9                    ..
        sty     $EA                             ; D030 84 EA                    ..
        jsr     LD39E                           ; D032 20 9E D3                  ..
        beq     LD049                           ; D035 F0 12                    ..
        ldy     #$FF                            ; D037 A0 FF                    ..
LD039:  iny                                     ; D039 C8                       .
        lda     ($E9),y                         ; D03A B1 E9                    ..
        beq     LD04A                           ; D03C F0 0C                    ..
        cmp     #$3A                            ; D03E C9 3A                    .:
        beq     LD04A                           ; D040 F0 08                    ..
        cmp     #$D3                            ; D042 C9 D3                    ..
        bne     LD039                           ; D044 D0 F3                    ..
        jmp     LF5BA                           ; D046 4C BA F5                 L..

; ----------------------------------------------------------------------------
LD049:  rts                                     ; D049 60                       `

; ----------------------------------------------------------------------------
LD04A:  lda     #$00                            ; D04A A9 00                    ..
        jmp     LDFF9                           ; D04C 4C F9 DF                 L..

; ----------------------------------------------------------------------------
        sec                                     ; D04F 38                       8
        bit     $18                             ; D050 24 18                    $.
        lda     #$80                            ; D052 A9 80                    ..
        php                                     ; D054 08                       .
        sta     SEDORIC_TRAV2                   ; D055 85 F4                    ..
        lsr     SEDORIC_TRAV3                   ; D057 46 F5                    F.
        lda     LC009                           ; D059 AD 09 C0                 ...
        sta     LC028                           ; D05C 8D 28 C0                 .(.
        ldx     #$0B                            ; D05F A2 0B                    ..
        lda     #$20                            ; D061 A9 20                    . 
        sta     SEDORIC_TRAV1                   ; D063 85 F3                    ..
LD065:  sta     LC029,x                         ; D065 9D 29 C0                 .).
        dex                                     ; D068 CA                       .
        bpl     LD065                           ; D069 10 FA                    ..
        plp                                     ; D06B 28                       (
        bpl     LD0D0                           ; D06C 10 62                    .b
        bcs     LD0AB                           ; D06E B0 3B                    .;
        jsr     LD39E                           ; D070 20 9E D3                  ..
LD073:  bne     LD081                           ; D073 D0 0C                    ..
LD075:  lda     #$0C                            ; D075 A9 0C                    ..
        sta     SEDORIC_TRAV0                   ; D077 85 F2                    ..
        ldx     #$00                            ; D079 A2 00                    ..
        jsr     LD5B5                           ; D07B 20 B5 D5                  ..
        jmp     LD503                           ; D07E 4C 03 D5                 L..

; ----------------------------------------------------------------------------
LD081:  cmp     #$2C                            ; D081 C9 2C                    .,
        beq     LD075                           ; D083 F0 F0                    ..
LD085:  cmp     #$C3                            ; D085 C9 C3                    ..
        beq     LD075                           ; D087 F0 EC                    ..
        sec                                     ; D089 38                       8
        sbc     #$41                            ; D08A E9 41                    .A
        tay                                     ; D08C A8                       .
        cmp     #$04                            ; D08D C9 04                    ..
        bcs     LD0AB                           ; D08F B0 1A                    ..
        jsr     LD398                           ; D091 20 98 D3                  ..
        beq     LD09E                           ; D094 F0 08                    ..
        cmp     #$C3                            ; D096 C9 C3                    ..
        beq     LD09E                           ; D098 F0 04                    ..
        cmp     #$2C                            ; D09A C9 2C                    .,
        bne     LD0A3                           ; D09C D0 05                    ..
LD09E:  sty     LC028                           ; D09E 8C 28 C0                 .(.
        bcs     LD075                           ; D0A1 B0 D2                    ..
LD0A3:  lda     $E9                             ; D0A3 A5 E9                    ..
        bne     LD0A9                           ; D0A5 D0 02                    ..
        dec     $EA                             ; D0A7 C6 EA                    ..
LD0A9:  dec     $E9                             ; D0A9 C6 E9                    ..
LD0AB:  jsr     LD224                           ; D0AB 20 24 D2                  $.
        jsr     LD274                           ; D0AE 20 74 D2                  t.
        sta     SEDORIC_TRAV1                   ; D0B1 85 F3                    ..
        tay                                     ; D0B3 A8                       .
        dey                                     ; D0B4 88                       .
        bmi     LD132                           ; D0B5 30 7B                    0{
LD0B7:  lda     ($91),y                         ; D0B7 B1 91                    ..
        cmp     #$20                            ; D0B9 C9 20                    . 
        bne     LD0BF                           ; D0BB D0 02                    ..
        dec     SEDORIC_TRAV1                   ; D0BD C6 F3                    ..
LD0BF:  dey                                     ; D0BF 88                       .
LD0C0:  bpl     LD0B7                           ; D0C0 10 F5                    ..
        lda     $E9                             ; D0C2 A5 E9                    ..
        pha                                     ; D0C4 48                       H
        lda     $EA                             ; D0C5 A5 EA                    ..
        pha                                     ; D0C7 48                       H
        lda     $91                             ; D0C8 A5 91                    ..
        sta     $E9                             ; D0CA 85 E9                    ..
        lda     $92                             ; D0CC A5 92                    ..
        sta     $EA                             ; D0CE 85 EA                    ..
LD0D0:  jsr     LD39E                           ; D0D0 20 9E D3                  ..
        sbc     #$41                            ; D0D3 E9 41                    .A
        tax                                     ; D0D5 AA                       .
        cmp     #$04                            ; D0D6 C9 04                    ..
        bcs     LD109                           ; D0D8 B0 2F                    ./
        ldy     #$01                            ; D0DA A0 01                    ..
        lda     ($E9),y                         ; D0DC B1 E9                    ..
        cmp     #$2D                            ; D0DE C9 2D                    .-
        beq     LD0E6                           ; D0E0 F0 04                    ..
        cmp     #$CD                            ; D0E2 C9 CD                    ..
        bne     LD109                           ; D0E4 D0 23                    .#
LD0E6:  .byte   $8E                             ; D0E6 8E                       .
        plp                                     ; D0E7 28                       (
LD0E8:  cpy     #$C6                            ; D0E8 C0 C6                    ..
        .byte   $F3                             ; D0EA F3                       .
        dec     SEDORIC_TRAV1                   ; D0EB C6 F3                    ..
        beq     LD13D                           ; D0ED F0 4E                    .N
        jsr     LD398                           ; D0EF 20 98 D3                  ..
        jsr     LD398                           ; D0F2 20 98 D3                  ..
        bne     LD109                           ; D0F5 D0 12                    ..
        bit     SEDORIC_TRAV2                   ; D0F7 24 F4                    $.
        bmi     LD132                           ; D0F9 30 37                    07
        pla                                     ; D0FB 68                       h
        pla                                     ; D0FC 68                       h
        jsr     LD7BD                           ; D0FD 20 BD D7                  ..
        jsr     LE5B9                           ; D100 20 B9 E5                  ..
LD103:  jsr     LD7BD                           ; D103 20 BD D7                  ..
        jmp     LD39E                           ; D106 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LD109:  ldx     #$00                            ; D109 A2 00                    ..
        lda     #$09                            ; D10B A9 09                    ..
        sta     SEDORIC_TRAV0                   ; D10D 85 F2                    ..
        lsr     SEDORIC_TRAV4                   ; D10F 46 F6                    F.
        jsr     LD39E                           ; D111 20 9E D3                  ..
LD114:  bit     SEDORIC_TRAV4                   ; D114 24 F6                    $.
        bmi     LD12A                           ; D116 30 12                    0.
        cmp     #$2E                            ; D118 C9 2E                    ..
        bne     LD12A                           ; D11A D0 0E                    ..
        ror     SEDORIC_TRAV4                   ; D11C 66 F6                    f.
        cpx     #$0A                            ; D11E E0 0A                    ..
        bcs     LD13D                           ; D120 B0 1B                    ..
LD122:  lda     #$0C                            ; D122 A9 0C                    ..
        sta     SEDORIC_TRAV0                   ; D124 85 F2                    ..
LD126:  ldx     #$08                            ; D126 A2 08                    ..
        bne     LD13F                           ; D128 D0 15                    ..
LD12A:  cmp     #$2C                            ; D12A C9 2C                    .,
        bne     LD134                           ; D12C D0 06                    ..
        bit     SEDORIC_TRAV2                   ; D12E 24 F4                    $.
        bpl     LD159                           ; D130 10 27                    .'
LD132:  bmi     LD1AC                           ; D132 30 78                    0x
LD134:  jsr     LD567                           ; D134 20 67 D5                  g.
        sta     LC029,x                         ; D137 9D 29 C0                 .).
        tya                                     ; D13A 98                       .
        cpx     SEDORIC_TRAV0                   ; D13B E4 F2                    ..
LD13D:  bcs     LD1AC                           ; D13D B0 6D                    .m
LD13F:  dec     SEDORIC_TRAV1                   ; D13F C6 F3                    ..
        beq     LD153                           ; D141 F0 10                    ..
        inx                                     ; D143 E8                       .
        bit     SEDORIC_TRAV3                   ; D144 24 F5                    $.
        bmi     LD114                           ; D146 30 CC                    0.
        jsr     LD398                           ; D148 20 98 D3                  ..
        bne     LD114                           ; D14B D0 C7                    ..
        bit     SEDORIC_TRAV2                   ; D14D 24 F4                    $.
        bpl     LD159                           ; D14F 10 08                    ..
        bmi     LD1AC                           ; D151 30 59                    0Y
LD153:  pla                                     ; D153 68                       h
        sta     $EA                             ; D154 85 EA                    ..
        pla                                     ; D156 68                       h
        sta     $E9                             ; D157 85 E9                    ..
LD159:  lda     LC032                           ; D159 AD 32 C0                 .2.
LD15C:  cmp     #$20                            ; D15C C9 20                    . 
        bne     LD103                           ; D15E D0 A3                    ..
        ldx     #$00                            ; D160 A2 00                    ..
        jsr     LD34A                           ; D162 20 4A D3                  J.
        beq     LD103                           ; D165 F0 9C                    ..
        bit     SEDORIC_TRAV3                   ; D167 24 F5                    $.
        bmi     LD18F                           ; D169 30 24                    0$
        tay                                     ; D16B A8                       .
        bpl     LD1B1                           ; D16C 10 43                    .C
        .byte   $85                             ; D16E 85                       .
LD16F:  sbc     $29,x                           ; D16F F5 29                    .)
        .byte   $7F                             ; D171 7F                       .
        sta     $24                             ; D172 85 24                    .$
        lda     #$E9                            ; D174 A9 E9                    ..
        ldy     #$C0                            ; D176 A0 C0                    ..
LD178:  sta     $16                             ; D178 85 16                    ..
        sty     $17                             ; D17A 84 17                    ..
        ldy     #$00                            ; D17C A0 00                    ..
LD17E:  dec     $24                             ; D17E C6 24                    .$
LD180:  bmi     LD18F                           ; D180 30 0D                    0.
LD182:  inc     $16                             ; D182 E6 16                    ..
        bne     LD188                           ; D184 D0 02                    ..
        inc     $17                             ; D186 E6 17                    ..
LD188:  jsr     DO_EXEVEC                       ; D188 20 53 04                  S.
        bpl     LD182                           ; D18B 10 F5                    ..
        bmi     LD17E                           ; D18D 30 EF                    0.
LD18F:  ldy     #$00                            ; D18F A0 00                    ..
        inc     $16                             ; D191 E6 16                    ..
        .byte   $D0                             ; D193 D0                       .
LD194:  .byte   $02                             ; D194 02                       .
        inc     $17                             ; D195 E6 17                    ..
LD197:  jsr     DO_EXEVEC                       ; D197 20 53 04                  S.
        pha                                     ; D19A 48                       H
        .byte   $A0                             ; D19B A0                       .
LD19C:  ora     ($20,x)                         ; D19C 01 20                    . 
        .byte   $53                             ; D19E 53                       S
        .byte   $04                             ; D19F 04                       .
        tay                                     ; D1A0 A8                       .
        pla                                     ; D1A1 68                       h
        php                                     ; D1A2 08                       .
        and     #$7F                            ; D1A3 29 7F                    ).
        plp                                     ; D1A5 28                       (
        bpl     LD1C1                           ; D1A6 10 19                    ..
        lsr     SEDORIC_TRAV3                   ; D1A8 46 F5                    F.
        bpl     LD1C3                           ; D1AA 10 17                    ..
LD1AC:  ldx     #$02                            ; D1AC A2 02                    ..
        jmp     LD67E                           ; D1AE 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LD1B1:  cmp     #$2A                            ; D1B1 C9 2A                    .*
        bne     LD1C3                           ; D1B3 D0 0E                    ..
        lda     #$3F                            ; D1B5 A9 3F                    .?
LD1B7:  sta     LC029,x                         ; D1B7 9D 29 C0                 .).
        inx                                     ; D1BA E8                       .
        .byte   $E4                             ; D1BB E4                       .
LD1BC:  .byte   $F2                             ; D1BC F2                       .
        bne     LD1B7                           ; D1BD D0 F8                    ..
        dex                                     ; D1BF CA                       .
        rts                                     ; D1C0 60                       `

; ----------------------------------------------------------------------------
LD1C1:  inc     SEDORIC_TRAV1                   ; D1C1 E6 F3                    ..
LD1C3:  .byte   $C9                             ; D1C3 C9                       .
LD1C4:  .byte   $3F                             ; D1C4 3F                       ?
        beq     LD1D7                           ; D1C5 F0 10                    ..
        cmp     #$30                            ; D1C7 C9 30                    .0
        bcc     LD1AC                           ; D1C9 90 E1                    ..
        .byte   $C9                             ; D1CB C9                       .
LD1CC:  .byte   $3A                             ; D1CC 3A                       :
        bcc     LD1D7                           ; D1CD 90 08                    ..
        cmp     #$41                            ; D1CF C9 41                    .A
        bcc     LD1AC                           ; D1D1 90 D9                    ..
        cmp     #$5B                            ; D1D3 C9 5B                    .[
        bcs     LD1AC                           ; D1D5 B0 D5                    ..
LD1D7:  rts                                     ; D1D7 60                       `

; ----------------------------------------------------------------------------
        sta     $0C                             ; D1D8 85 0C                    ..
        sty     $0D                             ; D1DA 84 0D                    ..
LD1DC:  php                                     ; D1DC 08                       .
        pla                                     ; D1DD 68                       h
        sta     $27                             ; D1DE 85 27                    .'
        clc                                     ; D1E0 18                       .
        pla                                     ; D1E1 68                       h
        .byte   $85                             ; D1E2 85                       .
LD1E3:  asl     $0469                           ; D1E3 0E 69 04                 .i.
        tay                                     ; D1E6 A8                       .
        pla                                     ; D1E7 68                       h
        sta     $0F                             ; D1E8 85 0F                    ..
        .byte   $69                             ; D1EA 69                       i
LD1EB:  brk                                     ; D1EB 00                       .
        pha                                     ; D1EC 48                       H
        tya                                     ; D1ED 98                       .
        pha                                     ; D1EE 48                       H
        ldy     #$01                            ; D1EF A0 01                    ..
        lda     LC024                           ; D1F1 AD 24 C0                 .$.
        bpl     LD1F8                           ; D1F4 10 02                    ..
        ldy     #$03                            ; D1F6 A0 03                    ..
LD1F8:  lda     ($0E),y                         ; D1F8 B1 0E                    ..
        sta     EXEVEC+1                        ; D1FA 8D F0 04                 ...
        iny                                     ; D1FD C8                       .
LD1FE:  lda     ($0E),y                         ; D1FE B1 0E                    ..
        sta     EXEVEC+2                        ; D200 8D F1 04                 ...
        ldy     $0D                             ; D203 A4 0D                    ..
        .byte   $A5                             ; D205 A5                       .
LD206:  .byte   $27                             ; D206 27                       '
        pha                                     ; D207 48                       H
        lda     $0C                             ; D208 A5 0C                    ..
        plp                                     ; D20A 28                       (
        jmp     L0471                           ; D20B 4C 71 04                 Lq.

; ----------------------------------------------------------------------------
LD20E:  clc                                     ; D20E 18                       .
        adc     #$41                            ; D20F 69 41                    iA
        bvc     LD22A                           ; D211 50 17                    P.
        pha                                     ; D213 48                       H
        lsr     a                               ; D214 4A                       J
        lsr     a                               ; D215 4A                       J
LD216:  lsr     a                               ; D216 4A                       J
        lsr     a                               ; D217 4A                       J
        .byte   $20                             ; D218 20                        
LD219:  .byte   $1E                             ; D219 1E                       .
        .byte   $D6                             ; D21A D6                       .
LD21B:  pla                                     ; D21B 68                       h
LD21C:  and     #$0F                            ; D21C 29 0F                    ).
        cmp     #$0A                            ; D21E C9 0A                    ..
        bcc     LD224                           ; D220 90 02                    ..
        adc     #$06                            ; D222 69 06                    i.
LD224:  clc                                     ; D224 18                       .
        adc     #$30                            ; D225 69 30                    i0
        bit     $20A9                           ; D227 2C A9 20                 ,. 
LD22A:  cmp     #$0D                            ; D22A C9 0D                    ..
LD22C:  bne     LD234                           ; D22C D0 06                    ..
LD22E:  lda     #$00                            ; D22E A9 00                    ..
        sta     $30                             ; D230 85 30                    .0
        lda     #$0D                            ; D232 A9 0D                    ..
LD234:  jmp     LD20E                           ; D234 4C 0E D2                 L..

; ----------------------------------------------------------------------------
        .byte   $85                             ; D237 85                       .
LD238:  sta     ($84),y                         ; D238 91 84                    ..
        .byte   $92                             ; D23A 92                       .
        ldy     #$00                            ; D23B A0 00                    ..
LD23D:  lda     ($91),y                         ; D23D B1 91                    ..
        beq     LD247                           ; D23F F0 06                    ..
        jsr     LD62A                           ; D241 20 2A D6                  *.
LD244:  iny                                     ; D244 C8                       .
        bne     LD23D                           ; D245 D0 F6                    ..
LD247:  rts                                     ; D247 60                       `

; ----------------------------------------------------------------------------
        ldx     #$14                            ; D248 A2 14                    ..
        .byte   $20                             ; D24A 20                        
        .byte   $6C                             ; D24B 6C                       l
LD24C:  .byte   $D3                             ; D24C D3                       .
        lda     LC000                           ; D24D AD 00 C0                 ...
        jsr     LD60E                           ; D250 20 0E D6                  ..
        .byte   $20                             ; D253 20                        
LD254:  asl     $D2                             ; D254 06 D2                    ..
        ldx     #$0D                            ; D256 A2 0D                    ..
        jsr     LD36C                           ; D258 20 6C D3                  l.
        cli                                     ; D25B 58                       X
LD25C:  jsr     LD669                           ; D25C 20 69 D6                  i.
        sei                                     ; D25F 78                       x
        php                                     ; D260 08                       .
        jsr     LD206                           ; D261 20 06 D2                  ..
LD264:  jsr     LD206                           ; D264 20 06 D2                  ..
        plp                                     ; D267 28                       (
        rts                                     ; D268 60                       `

; ----------------------------------------------------------------------------
LD269:  jsr     LD302                           ; D269 20 02 D3                  ..
        cmp     #$1B                            ; D26C C9 1B                    ..
        beq     LD275                           ; D26E F0 05                    ..
LD270:  cmp     #$0D                            ; D270 C9 0D                    ..
        bne     LD269                           ; D272 D0 F5                    ..
LD274:  clc                                     ; D274 18                       .
LD275:  rts                                     ; D275 60                       `

; ----------------------------------------------------------------------------
        .byte   $20                             ; D276 20                        
LD277:  adc     #$D6                            ; D277 69 D6                    i.
        bcc     LD275                           ; D279 90 FA                    ..
        pla                                     ; D27B 68                       h
        pla                                     ; D27C 68                       h
        rts                                     ; D27D 60                       `

; ----------------------------------------------------------------------------
        inx                                     ; D27E E8                       .
LD27F:  stx     SEDORIC_IDERROR                 ; D27F 8E FD 04                 ...
LD282:  jmp     (LC01D)                         ; D282 6C 1D C0                 l..

; ----------------------------------------------------------------------------
        txa                                     ; D285 8A                       .
        jsr     LD7DE                           ; D286 20 DE D7                  ..
        .byte   $A5                             ; D289 A5                       .
LD28A:  tay                                     ; D28A A8                       .
        ldy     $A9                             ; D28B A4 A9                    ..
        cpy     #$FF                            ; D28D C0 FF                    ..
        bne     LD292                           ; D28F D0 01                    ..
        tya                                     ; D291 98                       .
LD292:  sta     NOLIGN                          ; D292 8D FE 04                 ...
        sty     NOLIGN+1                        ; D295 8C FF 04                 ...
        jsr     LD7F2                           ; D298 20 F2 D7                  ..
        jsr     LD1C4                           ; D29B 20 C4 D1                  ..
        cli                                     ; D29E 58                       X
        bit     LC018                           ; D29F 2C 18 C0                 ,..
LD2A2:  bpl     LD2C9                           ; D2A2 10 25                    .%
        ldx     LC023                           ; D2A4 AE 23 C0                 .#.
        txs                                     ; D2A7 9A                       .
        .byte   $AD                             ; D2A8 AD                       .
        .byte   $1B                             ; D2A9 1B                       .
LD2AA:  cpy     #$AC                            ; D2AA C0 AC                    ..
        .byte   $1C                             ; D2AC 1C                       .
        cpy     #$85                            ; D2AD C0 85                    ..
        tay                                     ; D2AF A8                       .
        sty     $A9                             ; D2B0 84 A9                    ..
        lda     LC019                           ; D2B2 AD 19 C0                 ...
        ldy     LC01A                           ; D2B5 AC 1A C0                 ...
        sta     $E9                             ; D2B8 85 E9                    ..
LD2BA:  sty     $EA                             ; D2BA 84 EA                    ..
        lda     LC01F                           ; D2BC AD 1F C0                 ...
        ldy     LC020                           ; D2BF AC 20 C0                 . .
LD2C2:  sta     LC021                           ; D2C2 8D 21 C0                 .!.
        sty     LC022                           ; D2C5 8C 22 C0                 .".
        rts                                     ; D2C8 60                       `

; ----------------------------------------------------------------------------
LD2C9:  .byte   $20                             ; D2C9 20                        
LD2CA:  asl     a                               ; D2CA 0A                       .
        .byte   $D3                             ; D2CB D3                       .
        ldx     SEDORIC_IDERROR                 ; D2CC AE FD 04                 ...
        cpx     #$04                            ; D2CF E0 04                    ..
        .byte   $D0                             ; D2D1 D0                       .
LD2D2:  .byte   $33                             ; D2D2 33                       3
        .byte   $A2                             ; D2D3 A2                       .
LD2D4:  brk                                     ; D2D4 00                       .
        jsr     LD36C                           ; D2D5 20 6C D3                  l.
        .byte   $AD                             ; D2D8 AD                       .
        .byte   $01                             ; D2D9 01                       .
LD2DA:  cpy     #$20                            ; D2DA C0 20                    . 
        .byte   $13                             ; D2DC 13                       .
        dec     $AD,x                           ; D2DD D6 AD                    ..
        ora     $C0                             ; D2DF 05 C0                    ..
        .byte   $29                             ; D2E1 29                       )
LD2E2:  beq     $D32D                           ; D2E2 F0 49                    .I
        beq     $D2D6                           ; D2E4 F0 F0                    ..
        .byte   $14                             ; D2E6 14                       .
        ldx     #$01                            ; D2E7 A2 01                    ..
        .byte   $20                             ; D2E9 20                        
LD2EA:  jmp     ($ADD3)                         ; D2EA 6C D3 AD                 l..

; ----------------------------------------------------------------------------
        .byte   $02                             ; D2ED 02                       .
        cpy     #$20                            ; D2EE C0 20                    . 
        .byte   $13                             ; D2F0 13                       .
        .byte   $D6                             ; D2F1 D6                       .
LD2F2:  ldx     #$03                            ; D2F2 A2 03                    ..
        lda     LC005                           ; D2F4 AD 05 C0                 ...
        and     #$20                            ; D2F7 29 20                    ) 
        .byte   $F0                             ; D2F9 F0                       .
LD2FA:  .byte   $02                             ; D2FA 02                       .
LD2FB:  ldx     #$02                            ; D2FB A2 02                    ..
LD2FD:  jsr     LD36C                           ; D2FD 20 6C D3                  l.
        .byte   $AD                             ; D300 AD                       .
        .byte   $17                             ; D301 17                       .
LD302:  cpy     #$20                            ; D302 C0 20                    . 
        .byte   $13                             ; D304 13                       .
        .byte   $D6                             ; D305 D6                       .
LD306:  ldx     SEDORIC_IDERROR                 ; D306 AE FD 04                 ...
        dex                                     ; D309 CA                       .
LD30A:  jsr     LD206                           ; D30A 20 06 D2                  ..
        lda     #$3F                            ; D30D A9 3F                    .?
        jsr     LD62A                           ; D30F 20 2A D6                  *.
LD312:  cpx     #$1A                            ; D312 E0 1A                    ..
        bcs     LD31B                           ; D314 B0 05                    ..
        jsr     LD372                           ; D316 20 72 D3                  r.
        .byte   $30                             ; D319 30                       0
LD31A:  .byte   $20                             ; D31A 20                        
LD31B:  cpx     #$32                            ; D31B E0 32                    .2
        bcc     LD334                           ; D31D 90 15                    ..
        ldx     #$10                            ; D31F A2 10                    ..
        .byte   $20                             ; D321 20                        
LD322:  jmp     ($ADD3)                         ; D322 6C D3 AD                 l..

; ----------------------------------------------------------------------------
        sbc     $A004,x                         ; D325 FD 04 A0                 ...
        brk                                     ; D328 00                       .
        sty     LC04C                           ; D329 8C 4C C0                 .L.
        ldx     #$01                            ; D32C A2 01                    ..
        jsr     LD758                           ; D32E 20 58 D7                  X.
        .byte   $4C                             ; D331 4C                       L
LD332:  .byte   $3B                             ; D332 3B                       ;
        .byte   $D7                             ; D333 D7                       .
LD334:  txa                                     ; D334 8A                       .
        sbc     #$19                            ; D335 E9 19                    ..
        tax                                     ; D337 AA                       .
        .byte   $20                             ; D338 20                        
        .byte   $5C                             ; D339 5C                       \
LD33A:  .byte   $D3                             ; D33A D3                       .
LD33B:  jmp     LD178                           ; D33B 4C 78 D1                 Lx.

; ----------------------------------------------------------------------------
        sec                                     ; D33E 38                       8
        bit     $18                             ; D33F 24 18                    $.
        php                                     ; D341 08                       .
LD342:  lsr     BASIC11_FLG                     ; D342 4E 6A 02                 Nj.
        plp                                     ; D345 28                       (
        rol     BASIC11_FLG                     ; D346 2E 6A 02                 .j.
        .byte   $A9                             ; D349 A9                       .
LD34A:  ora     ($4C,x)                         ; D34A 01 4C                    .L
        rol     a                               ; D34C 2A                       *
LD34D:  .byte   $D3                             ; D34D D3                       .
        ldx     #$00                            ; D34E A2 00                    ..
        ldy     #$00                            ; D350 A0 00                    ..
        bit     $03A2                           ; D352 2C A2 03                 ,..
        bit     $02A2                           ; D355 2C A2 02                 ,..
        sta     SEDORIC_TRAV1                   ; D358 85 F3                    ..
        sty     SEDORIC_TRAV2                   ; D35A 84 F4                    ..
        lda     #$00                            ; D35C A9 00                    ..
        sta     LC073                           ; D35E 8D 73 C0                 .s.
        lda     #$FF                            ; D361 A9 FF                    ..
        .byte   $85                             ; D363 85                       .
LD364:  .byte   $F2                             ; D364 F2                       .
LD365:  inc     SEDORIC_TRAV0                   ; D365 E6 F2                    ..
        sec                                     ; D367 38                       8
        lda     SEDORIC_TRAV1                   ; D368 A5 F3                    ..
        tay                                     ; D36A A8                       .
        .byte   $FD                             ; D36B FD                       .
LD36C:  dey                                     ; D36C 88                       .
        cmp     LF385                           ; D36D CD 85 F3                 ...
        lda     SEDORIC_TRAV2                   ; D370 A5 F4                    ..
LD372:  pha                                     ; D372 48                       H
        sbc     LCD8C,x                         ; D373 FD 8C CD                 ...
        sta     SEDORIC_TRAV2                   ; D376 85 F4                    ..
        pla                                     ; D378 68                       h
        bcs     LD365                           ; D379 B0 EA                    ..
        sty     SEDORIC_TRAV1                   ; D37B 84 F3                    ..
        sta     SEDORIC_TRAV2                   ; D37D 85 F4                    ..
        lda     SEDORIC_TRAV0                   ; D37F A5 F2                    ..
        beq     LD388                           ; D381 F0 05                    ..
        sta     LC073                           ; D383 8D 73 C0                 .s.
        bne     LD391                           ; D386 D0 09                    ..
LD388:  ldy     LC073                           ; D388 AC 73 C0                 .s.
        bne     LD391                           ; D38B D0 04                    ..
        lda     LC04C                           ; D38D AD 4C C0                 .L.
        .byte   $2C                             ; D390 2C                       ,
LD391:  ora     #$30                            ; D391 09 30                    .0
        jsr     LD62A                           ; D393 20 2A D6                  *.
        dex                                     ; D396 CA                       .
        .byte   $10                             ; D397 10                       .
LD398:  iny                                     ; D398 C8                       .
        lda     SEDORIC_TRAV1                   ; D399 A5 F3                    ..
        jmp     LD624                           ; D39B 4C 24 D6                 L$.

; ----------------------------------------------------------------------------
LD39E:  sec                                     ; D39E 38                       8
        bit     $18                             ; D39F 24 18                    $.
LD3A1:  ror     SEDORIC_TRAV0                   ; D3A1 66 F2                    f.
        ldx     #$0B                            ; D3A3 A2 0B                    ..
LD3A5:  lda     LC029,x                         ; D3A5 BD 29 C0                 .).
        cmp     #$3F                            ; D3A8 C9 3F                    .?
        beq     LD3B1                           ; D3AA F0 05                    ..
        dex                                     ; D3AC CA                       .
        bpl     LD3A5                           ; D3AD 10 F6                    ..
        sec                                     ; D3AF 38                       8
LD3B0:  rts                                     ; D3B0 60                       `

; ----------------------------------------------------------------------------
LD3B1:  rol     SEDORIC_TRAV0                   ; D3B1 26 F2                    &.
        bcc     LD3B0                           ; D3B3 90 FB                    ..
        ldx     #$05                            ; D3B5 A2 05                    ..
        .byte   $2C                             ; D3B7 2C                       ,
LD3B8:  ldx     #$01                            ; D3B8 A2 01                    ..
        jmp     LD67E                           ; D3BA 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        ldy     LC028                           ; D3BD AC 28 C0                 .(.
        sty     LC000                           ; D3C0 8C 00 C0                 ...
        lda     LC039,y                         ; D3C3 B9 39 C0                 .9.
        beq     LD3B8                           ; D3C6 F0 F0                    ..
        rts                                     ; D3C8 60                       `

; ----------------------------------------------------------------------------
        ldx     #$0E                            ; D3C9 A2 0E                    ..
        bit     $10A2                           ; D3CB 2C A2 10                 ,..
        bit     $12A2                           ; D3CE 2C A2 12                 ,..
        bit     $14A2                           ; D3D1 2C A2 14                 ,..
        bit     $16A2                           ; D3D4 2C A2 16                 ,..
        bit     $06A2                           ; D3D7 2C A2 06                 ,..
        bit     $04A2                           ; D3DA 2C A2 04                 ,..
        bit     a:$A2                           ; D3DD 2C A2 00                 ,..
        bit     $0AA2                           ; D3E0 2C A2 0A                 ,..
        bit     $1EA2                           ; D3E3 2C A2 1E                 ,..
        bit     $20A2                           ; D3E6 2C A2 20                 ,. 
        bit     $22A2                           ; D3E9 2C A2 22                 ,."
        bit     $24A2                           ; D3EC 2C A2 24                 ,.$
        ldy     #$00                            ; D3EF A0 00                    ..
        bit     $02A2                           ; D3F1 2C A2 02                 ,..
        bit     $08A2                           ; D3F4 2C A2 08                 ,..
        bit     $18A2                           ; D3F7 2C A2 18                 ,..
        bit     $1AA2                           ; D3FA 2C A2 1A                 ,..
        bit     $1CA2                           ; D3FD 2C A2 1C                 ,..
        nop                                     ; D400 EA                       .
        nop                                     ; D401 EA                       .
        nop                                     ; D402 EA                       .
        sta     SEDORIC_TRAV0                   ; D403 85 F2                    ..
        lda     LCD94,x                         ; D405 BD 94 CD                 ...
        sta     $B4                             ; D408 85 B4                    ..
        lda     LCD95,x                         ; D40A BD 95 CD                 ...
        sta     $B5                             ; D40D 85 B5                    ..
        tya                                     ; D40F 98                       .
        ldy     SEDORIC_TRAV0                   ; D410 A4 F2                    ..
        jsr     LD2CA                           ; D412 20 CA D2                  ..
        jsr     LD244                           ; D415 20 44 D2                  D.
        tax                                     ; D418 AA                       .
        jmp     LD2C2                           ; D419 4C C2 D2                 L..

; ----------------------------------------------------------------------------
        inc     $16                             ; D41C E6 16                    ..
        bne     LD422                           ; D41E D0 02                    ..
        inc     $17                             ; D420 E6 17                    ..
LD422:  ldy     #$00                            ; D422 A0 00                    ..
        bit     LC048                           ; D424 2C 48 C0                 ,H.
        bvc     LD42C                           ; D427 50 03                    P.
        jmp     DO_EXEVEC                       ; D429 4C 53 04                 LS.

; ----------------------------------------------------------------------------
LD42C:  lda     ($16),y                         ; D42C B1 16                    ..
        beq     LD46F                           ; D42E F0 3F                    .?
        bpl     LD471                           ; D430 10 3F                    .?
        bit     LC048                           ; D432 2C 48 C0                 ,H.
        bpl     LD46F                           ; D435 10 38                    .8
        and     #$7F                            ; D437 29 7F                    ).
        rts                                     ; D439 60                       `

; ----------------------------------------------------------------------------
        jsr     LEA1E                           ; D43A 20 1E EA                  ..
        lda     #$08                            ; D43D A9 08                    ..
        and     V1DRB                           ; D43F 2D 00 03                 -..
        rts                                     ; D442 60                       `

; ----------------------------------------------------------------------------
        sec                                     ; D443 38                       8
        bit     $18                             ; D444 24 18                    $.
        ror     LC04A                           ; D446 6E 4A C0                 nJ.
        jsr     LD302                           ; D449 20 02 D3                  ..
        php                                     ; D44C 08                       .
        .byte   $8D                             ; D44D 8D                       .
        .byte   $46                             ; D44E 46                       F
LD44F:  cpy     #$8E                            ; D44F C0 8E                    ..
LD451:  .byte   $47                             ; D451 47                       G
        cpy     #$2C                            ; D452 C0 2C                    .,
LD454:  eor     #$C0                            ; D454 49 C0                    I.
        bpl     LD472                           ; D456 10 1A                    ..
        bit     LC04A                           ; D458 2C 4A C0                 ,J.
        bmi     LD464                           ; D45B 30 07                    0.
        cpx     #$4E                            ; D45D E0 4E                    .N
        bcc     LD464                           ; D45F 90 03                    ..
        lsr     LC049                           ; D461 4E 49 C0                 NI.
LD464:  jsr     LD81C                           ; D464 20 1C D8                  ..
        bpl     LD46C                           ; D467 10 03                    ..
        lsr     LC049                           ; D469 4E 49 C0                 NI.
LD46C:  and     #$7F                            ; D46C 29 7F                    ).
        plp                                     ; D46E 28                       (
LD46F:  bit     $E2                             ; D46F 24 E2                    $.
LD471:  rts                                     ; D471 60                       `

; ----------------------------------------------------------------------------
LD472:  plp                                     ; D472 28                       (
        bpl     LD471                           ; D473 10 FC                    ..
        lda     #$00                            ; D475 A9 00                    ..
        sta     LC04B                           ; D477 8D 4B C0                 .K.
        sta     LC048                           ; D47A 8D 48 C0                 .H.
        lda     #$0E                            ; D47D A9 0E                    ..
        ldx     #$EF                            ; D47F A2 EF                    ..
        jsr     LD322                           ; D481 20 22 D3                  ".
        lda     #$15                            ; D484 A9 15                    ..
        jsr     LD83A                           ; D486 20 3A D8                  :.
        bne     LD4C3                           ; D489 D0 38                    .8
        lda     LC046                           ; D48B AD 46 C0                 .F.
        ldx     LC047                           ; D48E AE 47 C0                 .G.
        bit     LC03D                           ; D491 2C 3D C0                 ,=.
        bpl     LD46F                           ; D494 10 D9                    ..
        lda     BASIC11_KEYBOARD_MATRIX         ; D496 AD 08 02                 ...
        ldx     #$05                            ; D499 A2 05                    ..
LD49B:  cmp     LCD41,x                         ; D49B DD 41 CD                 .A.
        beq     LD4AC                           ; D49E F0 0C                    ..
        dex                                     ; D4A0 CA                       .
        bpl     LD49B                           ; D4A1 10 F8                    ..
        lda     LC046                           ; D4A3 AD 46 C0                 .F.
LD4A6:  ldx     LEA47                           ; D4A6 AE 47 EA                 .G.
        jmp     LD86F                           ; D4A9 4C 6F D8                 Lo.

; ----------------------------------------------------------------------------
LD4AC:  lda     BASIC11_KEYBOARD_MATRIX         ; D4AC AD 08 02                 ...
        pha                                     ; D4AF 48                       H
        lda     LCD47,x                         ; D4B0 BD 47 CD                 .G.
        sta     BASIC11_KEYBOARD_MATRIX         ; D4B3 8D 08 02                 ...
        jsr     LD31A                           ; D4B6 20 1A D3                  ..
        tax                                     ; D4B9 AA                       .
        pla                                     ; D4BA 68                       h
        sta     BASIC11_KEYBOARD_MATRIX         ; D4BB 8D 08 02                 ...
        txa                                     ; D4BE 8A                       .
        and     #$7F                            ; D4BF 29 7F                    ).
        bpl     LD4A6                           ; D4C1 10 E3                    ..
LD4C3:  lda     #$17                            ; D4C3 A9 17                    ..
        jsr     LD83A                           ; D4C5 20 3A D8                  :.
        bne     LD4D1                           ; D4C8 D0 07                    ..
        lda     #$14                            ; D4CA A9 14                    ..
        jsr     LD83A                           ; D4CC 20 3A D8                  :.
        beq     LD4D3                           ; D4CF F0 02                    ..
LD4D1:  lda     #$40                            ; D4D1 A9 40                    .@
LD4D3:  ora     BASIC11_KEYBOARD_MATRIX         ; D4D3 0D 08 02                 ...
        and     #$7F                            ; D4D6 29 7F                    ).
        tax                                     ; D4D8 AA                       .
        lda     LC800,x                         ; D4D9 BD 00 C8                 ...
        tay                                     ; D4DC A8                       .
        iny                                     ; D4DD C8                       .
        bne     LD4E3                           ; D4DE D0 03                    ..
        jmp     LD963                           ; D4E0 4C 63 D9                 Lc.

; ----------------------------------------------------------------------------
LD4E3:  iny                                     ; D4E3 C8                       .
        beq     LD552                           ; D4E4 F0 6C                    .l
        cmp     #$20                            ; D4E6 C9 20                    . 
        ror     a                               ; D4E8 6A                       j
        sta     LC048                           ; D4E9 8D 48 C0                 .H.
        rol     a                               ; D4EC 2A                       *
        bmi     LD4F3                           ; D4ED 30 04                    0.
        bcc     LD4F3                           ; D4EF 90 02                    ..
        sbc     #$20                            ; D4F1 E9 20                    . 
LD4F3:  and     #$7F                            ; D4F3 29 7F                    ).
        tax                                     ; D4F5 AA                       .
        lda     #$E9                            ; D4F6 A9 E9                    ..
        ldy     #$C0                            ; D4F8 A0 C0                    ..
        bit     LC048                           ; D4FA 2C 48 C0                 ,H.
        bvs     LD528                           ; D4FD 70 29                    p)
        bmi     LD507                           ; D4FF 30 06                    0.
        lda     #$7F                            ; D501 A9 7F                    ..
LD503:  ldy     #$C8                            ; D503 A0 C8                    ..
        bne     LD528                           ; D505 D0 21                    .!
LD507:  lda     SEDORIC_TRAV0                   ; D507 A5 F2                    ..
        pha                                     ; D509 48                       H
        jsr     LEA30                           ; D50A 20 30 EA                  0.
        ldy     #$00                            ; D50D A0 00                    ..
LD50F:  lda     LCBBD,y                         ; D50F B9 BD CB                 ...
        inx                                     ; D512 E8                       .
        iny                                     ; D513 C8                       .
        iny                                     ; D514 C8                       .
        iny                                     ; D515 C8                       .
        iny                                     ; D516 C8                       .
        cmp     SEDORIC_TRAV0                   ; D517 C5 F2                    ..
        bcc     LD50F                           ; D519 90 F4                    ..
        stx     LC04B                           ; D51B 8E 4B C0                 .K.
        ldx     SEDORIC_TRAV0                   ; D51E A6 F2                    ..
        dex                                     ; D520 CA                       .
        pla                                     ; D521 68                       h
        sta     SEDORIC_TRAV0                   ; D522 85 F2                    ..
        lda     #$DD                            ; D524 A9 DD                    ..
        ldy     #$C9                            ; D526 A0 C9                    ..
LD528:  sta     $16                             ; D528 85 16                    ..
        sty     $17                             ; D52A 84 17                    ..
LD52C:  dex                                     ; D52C CA                       .
        bmi     LD536                           ; D52D 30 07                    0.
LD52F:  jsr     LD81C                           ; D52F 20 1C D8                  ..
        bpl     LD52F                           ; D532 10 FB                    ..
        bmi     LD52C                           ; D534 30 F6                    0.
LD536:  jsr     LD81C                           ; D536 20 1C D8                  ..
        cmp     #$20                            ; D539 C9 20                    . 
        beq     LD536                           ; D53B F0 F9                    ..
        lda     $16                             ; D53D A5 16                    ..
        bne     LD543                           ; D53F D0 02                    ..
        dec     $17                             ; D541 C6 17                    ..
LD543:  dec     $16                             ; D543 C6 16                    ..
        lda     LC04B                           ; D545 AD 4B C0                 .K.
LD548:  sec                                     ; D548 38                       8
        ror     LC049                           ; D549 6E 49 C0                 nI.
LD54C:  ldx     LC047                           ; D54C AE 47 C0                 .G.
LD54F:  jmp     LD86F                           ; D54F 4C 6F D8                 Lo.

; ----------------------------------------------------------------------------
LD552:  lda     #$7F                            ; D552 A9 7F                    ..
        bit     LC04A                           ; D554 2C 4A C0                 ,J.
        bmi     LD54C                           ; D557 30 F3                    0.
        ldx     LC047                           ; D559 AE 47 C0                 .G.
        beq     LD54C                           ; D55C F0 EE                    ..
        dex                                     ; D55E CA                       .
        lda     #$08                            ; D55F A9 08                    ..
        bne     LD54F                           ; D561 D0 EC                    ..
        ldy     LC042                           ; D563 AC 42 C0                 .B.
        .byte   $AD                             ; D566 AD                       .
LD567:  .byte   $43                             ; D567 43                       C
        cpy     #$20                            ; D568 C0 20                    . 
        dex                                     ; D56A CA                       .
        .byte   $D2                             ; D56B D2                       .
        jsr     LD2D2                           ; D56C 20 D2 D2                  ..
        ldx     #$00                            ; D56F A2 00                    ..
        stx     $17                             ; D571 86 17                    ..
        dex                                     ; D573 CA                       .
        stx     $16                             ; D574 86 16                    ..
LD576:  inx                                     ; D576 E8                       .
        lda     STACK+1,x                       ; D577 BD 01 01                 ...
        bne     LD576                           ; D57A D0 FA                    ..
        sta     STACK+2,x                       ; D57C 9D 02 01                 ...
        txa                                     ; D57F 8A                       .
        pha                                     ; D580 48                       H
        lda     LC042                           ; D581 AD 42 C0                 .B.
        ldy     LC043                           ; D584 AC 43 C0                 .C.
        sta     $33                             ; D587 85 33                    .3
        sty     $34                             ; D589 84 34                    .4
        jsr     LD19C                           ; D58B 20 9C D1                  ..
        pla                                     ; D58E 68                       h
        tax                                     ; D58F AA                       .
        lda     #$20                            ; D590 A9 20                    . 
        bcc     LD596                           ; D592 90 02                    ..
        lda     #$2A                            ; D594 A9 2A                    .*
LD596:  sta     STACK+1,x                       ; D596 9D 01 01                 ...
        clc                                     ; D599 18                       .
        lda     LC044                           ; D59A AD 44 C0                 .D.
        adc     LC042                           ; D59D 6D 42 C0                 mB.
        sta     LC042                           ; D5A0 8D 42 C0                 .B.
        lda     LC045                           ; D5A3 AD 45 C0                 .E.
        adc     LC043                           ; D5A6 6D 43 C0                 mC.
        sta     LC043                           ; D5A9 8D 43 C0                 .C.
LD5AC:  lda     #$0D                            ; D5AC A9 0D                    ..
        bne     LD548                           ; D5AE D0 98                    ..
        lda     #$00                            ; D5B0 A9 00                    ..
        sta     LE7D1                           ; D5B2 8D D1 E7                 ...
LD5B5:  sta     LE7D2                           ; D5B5 8D D2 E7                 ...
        sta     LE7D3                           ; D5B8 8D D3 E7                 ...
        jsr     LE55C                           ; D5BB 20 5C E5                  \.
        jsr     LDA63                           ; D5BE 20 63 DA                  c.
        ldx     #$10                            ; D5C1 A2 10                    ..
        cpx     LC302                           ; D5C3 EC 02 C3                 ...
        beq     LD5EC                           ; D5C6 F0 24                    .$
        lda     LC302                           ; D5C8 AD 02 C3                 ...
        sec                                     ; D5CB 38                       8
        sbc     #$10                            ; D5CC E9 10                    ..
        lsr     a                               ; D5CE 4A                       J
        lsr     a                               ; D5CF 4A                       J
        lsr     a                               ; D5D0 4A                       J
        lsr     a                               ; D5D1 4A                       J
        clc                                     ; D5D2 18                       .
        adc     LE7D1                           ; D5D3 6D D1 E7                 m..
        bcc     LD5DB                           ; D5D6 90 03                    ..
LD5D8:  inc     LE7D2                           ; D5D8 EE D2 E7                 ...
LD5DB:  sta     LE7D1                           ; D5DB 8D D1 E7                 ...
        inc     LE7D3                           ; D5DE EE D3 E7                 ...
        lda     LC300                           ; D5E1 AD 00 C3                 ...
        ldy     LC301                           ; D5E4 AC 01 C3                 ...
        beq     LD5EC                           ; D5E7 F0 03                    ..
        jmp     LD9BE                           ; D5E9 4C BE D9                 L..

; ----------------------------------------------------------------------------
LD5EC:  jsr     LDB2D                           ; D5EC 20 2D DB                  -.
        rts                                     ; D5EF 60                       `

; ----------------------------------------------------------------------------
        lda     LE7D3                           ; D5F0 AD D3 E7                 ...
        sta     LC208                           ; D5F3 8D 08 C2                 ...
        lda     LE7D1                           ; D5F6 AD D1 E7                 ...
        ldx     LE7D2                           ; D5F9 AE D2 E7                 ...
        rts                                     ; D5FC 60                       `

; ----------------------------------------------------------------------------
        dec     LC208                           ; D5FD CE 08 C2                 ...
        dec     LE7D3                           ; D600 CE D3 E7                 ...
        rts                                     ; D603 60                       `

; ----------------------------------------------------------------------------
        lda     LE7D4                           ; D604 AD D4 E7                 ...
        bne     LD616                           ; D607 D0 0D                    ..
        lda     LE7D3                           ; D609 AD D3 E7                 ...
        .byte   $8D                             ; D60C 8D                       .
        php                                     ; D60D 08                       .
LD60E:  .byte   $C2                             ; D60E C2                       .
        lda     LE7D1                           ; D60F AD D1 E7                 ...
        .byte   $AE                             ; D612 AE                       .
LD613:  .byte   $D2                             ; D613 D2                       .
        .byte   $E7                             ; D614 E7                       .
        rts                                     ; D615 60                       `

; ----------------------------------------------------------------------------
LD616:  lda     LC204                           ; D616 AD 04 C2                 ...
        ldx     LC205                           ; D619 AE 05 C2                 ...
        rts                                     ; D61C 60                       `

; ----------------------------------------------------------------------------
        nop                                     ; D61D EA                       .
LD61E:  nop                                     ; D61E EA                       .
        nop                                     ; D61F EA                       .
        jsr     LD27F                           ; D620 20 7F D2                  ..
        php                                     ; D623 08                       .
LD624:  sei                                     ; D624 78                       x
        txa                                     ; D625 8A                       .
        pha                                     ; D626 48                       H
        lsr     a                               ; D627 4A                       J
LD628:  lsr     a                               ; D628 4A                       J
        lsr     a                               ; D629 4A                       J
LD62A:  and     #$07                            ; D62A 29 07                    ).
        tax                                     ; D62C AA                       .
        clc                                     ; D62D 18                       .
        lda     #$FF                            ; D62E A9 FF                    ..
LD630:  rol     a                               ; D630 2A                       *
        dex                                     ; D631 CA                       .
        bpl     LD630                           ; D632 10 FC                    ..
        tax                                     ; D634 AA                       .
        lda     #$0E                            ; D635 A9 0E                    ..
LD637:  jsr     LD322                           ; D637 20 22 D3                  ".
        pla                                     ; D63A 68                       h
        and     #$07                            ; D63B 29 07                    ).
        ora     #$B8                            ; D63D 09 B8                    ..
        jsr     LD83A                           ; D63F 20 3A D8                  :.
        sta     $D0                             ; D642 85 D0                    ..
        plp                                     ; D644 28                       (
        jsr     LD1EB                           ; D645 20 EB D1                  ..
LD648:  lsr     FLAGIF                          ; D648 4E FC 04                 N..
        rts                                     ; D64B 60                       `

; ----------------------------------------------------------------------------
        jsr     LE62E                           ; D64C 20 2E E6                  ..
        nop                                     ; D64F EA                       .
        jsr     LDA60                           ; D650 20 60 DA                  `.
        ldx     LC200                           ; D653 AE 00 C2                 ...
        inx                                     ; D656 E8                       .
        beq     LD6CD                           ; D657 F0 74                    .t
        ldx     #$0A                            ; D659 A2 0A                    ..
        bne     LD67F                           ; D65B D0 22                    ."
        ldx     #$C1                            ; D65D A2 C1                    ..
        bit     LC2A2                           ; D65F 2C A2 C2                 ,..
        bit     LC3A2                           ; D662 2C A2 C3                 ,..
        stx     LC004                           ; D665 8E 04 C0                 ...
        .byte   $A2                             ; D668 A2                       .
LD669:  brk                                     ; D669 00                       .
        stx     LC003                           ; D66A 8E 03 C0                 ...
        sta     LC001                           ; D66D 8D 01 C0                 ...
        sty     LC002                           ; D670 8C 02 C0                 ...
        ldx     #$88                            ; D673 A2 88                    ..
LD675:  jsr     LCFCD                           ; D675 20 CD CF                  ..
        beq     LD6CD                           ; D678 F0 53                    .S
        ldx     #$03                            ; D67A A2 03                    ..
        bvc     LD67F                           ; D67C 50 01                    P.
LD67E:  inx                                     ; D67E E8                       .
LD67F:  jmp     LD67E                           ; D67F 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        lda     LC025                           ; D682 AD 25 C0                 .%.
        ldy     LC026                           ; D685 AC 26 C0                 .&.
        bne     LD694                           ; D688 D0 0A                    ..
        jmp     LDC80                           ; D68A 4C 80 DC                 L..

; ----------------------------------------------------------------------------
        nop                                     ; D68D EA                       .
        ldx     #$C2                            ; D68E A2 C2                    ..
        bit     LC1A2                           ; D690 2C A2 C1                 ,..
        .byte   $2C                             ; D693 2C                       ,
LD694:  ldx     #$C3                            ; D694 A2 C3                    ..
        stx     LC004                           ; D696 8E 04 C0                 ...
        ldx     #$00                            ; D699 A2 00                    ..
        stx     LC003                           ; D69B 8E 03 C0                 ...
        sta     LC001                           ; D69E 8D 01 C0                 ...
        sty     LC002                           ; D6A1 8C 02 C0                 ...
LD6A4:  ldx     #$A8                            ; D6A4 A2 A8                    ..
        bne     LD675                           ; D6A6 D0 CD                    ..
        lda     #$00                            ; D6A8 A9 00                    ..
        ldy     #$C1                            ; D6AA A0 C1                    ..
        sta     LC003                           ; D6AC 8D 03 C0                 ...
        sty     LC004                           ; D6AF 8C 04 C0                 ...
        bne     LD6A4                           ; D6B2 D0 F0                    ..
        ldx     LC027                           ; D6B4 AE 27 C0                 .'.
        ldy     #$08                            ; D6B7 A0 08                    ..
        jsr     LDAC3                           ; D6B9 20 C3 DA                  ..
        lda     #$2E                            ; D6BC A9 2E                    ..
        jsr     LD62A                           ; D6BE 20 2A D6                  *.
        ldy     #$02                            ; D6C1 A0 02                    ..
LD6C3:  lda     LC300,x                         ; D6C3 BD 00 C3                 ...
        jsr     LD62A                           ; D6C6 20 2A D6                  *.
        inx                                     ; D6C9 E8                       .
        dey                                     ; D6CA 88                       .
        bpl     LD6C3                           ; D6CB 10 F6                    ..
LD6CD:  rts                                     ; D6CD 60                       `

; ----------------------------------------------------------------------------
        lda     #$C1                            ; D6CE A9 C1                    ..
        bit     LC2A9                           ; D6D0 2C A9 C2                 ,..
        bit     LC3A9                           ; D6D3 2C A9 C3                 ,..
        sta     $0F                             ; D6D6 85 0F                    ..
        lda     #$00                            ; D6D8 A9 00                    ..
        sta     $0E                             ; D6DA 85 0E                    ..
        ldy     #$00                            ; D6DC A0 00                    ..
        tya                                     ; D6DE 98                       .
LD6DF:  sta     ($0E),y                         ; D6DF 91 0E                    ..
        iny                                     ; D6E1 C8                       .
        bne     LD6DF                           ; D6E2 D0 FB                    ..
        rts                                     ; D6E4 60                       `

; ----------------------------------------------------------------------------
        lda     LC025                           ; D6E5 AD 25 C0                 .%.
        ldy     LC026                           ; D6E8 AC 26 C0                 .&.
        jsr     LDA63                           ; D6EB 20 63 DA                  c.
        ldx     LC027                           ; D6EE AE 27 C0                 .'.
        ldy     #$F0                            ; D6F1 A0 F0                    ..
LD6F3:  lda     $BF39,y                         ; D6F3 B9 39 BF                 .9.
        sta     LC300,x                         ; D6F6 9D 00 C3                 ...
        inx                                     ; D6F9 E8                       .
        iny                                     ; D6FA C8                       .
        bne     LD6F3                           ; D6FB D0 F6                    ..
        rts                                     ; D6FD 60                       `

; ----------------------------------------------------------------------------
        lda     LC025                           ; D6FE AD 25 C0                 .%.
        ldy     LC026                           ; D701 AC 26 C0                 .&.
        jsr     LDA63                           ; D704 20 63 DA                  c.
        ldx     LC027                           ; D707 AE 27 C0                 .'.
        ldy     #$F0                            ; D70A A0 F0                    ..
LD70C:  lda     LC300,x                         ; D70C BD 00 C3                 ...
        sta     $BF39,y                         ; D70F 99 39 BF                 .9.
        inx                                     ; D712 E8                       .
        iny                                     ; D713 C8                       .
        bne     LD70C                           ; D714 D0 F6                    ..
        rts                                     ; D716 60                       `

; ----------------------------------------------------------------------------
LD717:  ldy     #$F4                            ; D717 A0 F4                    ..
LD719:  lda     $BF35,y                         ; D719 B9 35 BF                 .5.
        cmp     #$3F                            ; D71C C9 3F                    .?
        beq     LD725                           ; D71E F0 05                    ..
        cmp     LC300,x                         ; D720 DD 00 C3                 ...
        bne     LD741                           ; D723 D0 1C                    ..
LD725:  inx                                     ; D725 E8                       .
        iny                                     ; D726 C8                       .
        bne     LD719                           ; D727 D0 F0                    ..
        ldx     LC027                           ; D729 AE 27 C0                 .'.
        rts                                     ; D72C 60                       `

; ----------------------------------------------------------------------------
        jsr     LDA4C                           ; D72D 20 4C DA                  L.
        jsr     LE537                           ; D730 20 37 E5                  7.
        nop                                     ; D733 EA                       .
LD734:  sta     LC025                           ; D734 8D 25 C0                 .%.
        sty     LC026                           ; D737 8C 26 C0                 .&.
        .byte   $20                             ; D73A 20                        
LD73B:  .byte   $63                             ; D73B 63                       c
        .byte   $DA                             ; D73C DA                       .
        .byte   $A2                             ; D73D A2                       .
LD73E:  bpl     $D710                           ; D73E 10 D0                    ..
LD740:  .byte   $07                             ; D740 07                       .
LD741:  lda     LC027                           ; D741 AD 27 C0                 .'.
        clc                                     ; D744 18                       .
        adc     #$10                            ; D745 69 10                    i.
        tax                                     ; D747 AA                       .
LD748:  stx     LC027                           ; D748 8E 27 C0                 .'.
        cpx     LC302                           ; D74B EC 02 C3                 ...
LD74E:  bne     LD717                           ; D74E D0 C7                    ..
LD750:  lda     LC300                           ; D750 AD 00 C3                 ...
        ldy     LC301                           ; D753 AC 01 C3                 ...
LD756:  bne     LD734                           ; D756 D0 DC                    ..
LD758:  rts                                     ; D758 60                       `

; ----------------------------------------------------------------------------
        jsr     LDBA5                           ; D759 20 A5 DB                  ..
        bne     LD792                           ; D75C D0 34                    .4
        jmp     LDB6F                           ; D75E 4C 6F DB                 Lo.

; ----------------------------------------------------------------------------
        dec     LC208                           ; D761 CE 08 C2                 ...
        dec     LE7D3                           ; D764 CE D3 E7                 ...
        rts                                     ; D767 60                       `

; ----------------------------------------------------------------------------
        .byte   $C2                             ; D768 C2                       .
        sta     LC208                           ; D769 8D 08 C2                 ...
        jmp     LE537                           ; D76C 4C 37 E5                 L7.

; ----------------------------------------------------------------------------
        jsr     LDC6C                           ; D76F 20 6C DC                  l.
        sta     LC300                           ; D772 8D 00 C3                 ...
        sty     LC301                           ; D775 8C 01 C3                 ...
        inc     LC208                           ; D778 EE 08 C2                 ...
        jsr     LDA8A                           ; D77B 20 8A DA                  ..
        jsr     LDA82                           ; D77E 20 82 DA                  ..
        lda     LC300                           ; D781 AD 00 C3                 ...
        ldy     LC301                           ; D784 AC 01 C3                 ...
        sta     LC025                           ; D787 8D 25 C0                 .%.
        sty     LC026                           ; D78A 8C 26 C0                 .&.
        jsr     LDAD4                           ; D78D 20 D4 DA                  ..
        ldx     #$10                            ; D790 A2 10                    ..
LD792:  txa                                     ; D792 8A                       .
        stx     LC027                           ; D793 8E 27 C0                 .'.
        clc                                     ; D796 18                       .
        adc     #$10                            ; D797 69 10                    i.
        sta     LC302                           ; D799 8D 02 C3                 ...
        .byte   $EE                             ; D79C EE                       .
        .byte   $04                             ; D79D 04                       .
LD79E:  .byte   $C2                             ; D79E C2                       .
        .byte   $D0                             ; D79F D0                       .
LD7A0:  asl     $05EE,x                         ; D7A0 1E EE 05                 ...
        .byte   $C2                             ; D7A3 C2                       .
        rts                                     ; D7A4 60                       `

; ----------------------------------------------------------------------------
        jsr     LE537                           ; D7A5 20 37 E5                  7.
        nop                                     ; D7A8 EA                       .
LD7A9:  sta     LC025                           ; D7A9 8D 25 C0                 .%.
        sty     LC026                           ; D7AC 8C 26 C0                 .&.
        jsr     LDA63                           ; D7AF 20 63 DA                  c.
        ldx     LC302                           ; D7B2 AE 02 C3                 ...
        bne     LD7BF                           ; D7B5 D0 08                    ..
        lda     LC300                           ; D7B7 AD 00 C3                 ...
        ldy     LC301                           ; D7BA AC 01 C3                 ...
LD7BD:  bne     LD7A9                           ; D7BD D0 EA                    ..
LD7BF:  rts                                     ; D7BF 60                       `

; ----------------------------------------------------------------------------
LD7C0:  sta     LC058                           ; D7C0 8D 58 C0                 .X.
        sty     LC059                           ; D7C3 8C 59 C0                 .Y.
        sta     LC05A                           ; D7C6 8D 5A C0                 .Z.
LD7C9:  sty     LC05B                           ; D7C9 8C 5B C0                 .[.
LD7CC:  jsr     LDACE                           ; D7CC 20 CE DA                  ..
LD7CF:  ldx     #$01                            ; D7CF A2 01                    ..
        .byte   $8E                             ; D7D1 8E                       .
LD7D2:  lsr     $20C0,x                         ; D7D2 5E C0 20                 ^. 
LD7D5:  jmp     ($8DDC)                         ; D7D5 6C DC 8D                 l..

; ----------------------------------------------------------------------------
LD7D8:  .byte   $5C                             ; D7D8 5C                       \
        cpy     #$8C                            ; D7D9 C0 8C                    ..
LD7DB:  eor     $8DC0,x                         ; D7DB 5D C0 8D                 ]..
LD7DE:  ora     ($C0,x)                         ; D7DE 01 C0                    ..
        .byte   $8C                             ; D7E0 8C                       .
LD7E1:  .byte   $02                             ; D7E1 02                       .
        cpy     #$A2                            ; D7E2 C0 A2                    ..
LD7E4:  php                                     ; D7E4 08                       .
LD7E5:  .byte   $BD                             ; D7E5 BD                       .
        .byte   $51                             ; D7E6 51                       Q
LD7E7:  cpy     #$9D                            ; D7E7 C0 9D                    ..
        .byte   $03                             ; D7E9 03                       .
LD7EA:  cmp     ($CA,x)                         ; D7EA C1 CA                    ..
        .byte   $10                             ; D7EC 10                       .
LD7ED:  .byte   $F7                             ; D7ED F7                       .
        stx     LC102                           ; D7EE 8E 02 C1                 ...
        .byte   $A2                             ; D7F1 A2                       .
LD7F2:  .byte   $0C                             ; D7F2 0C                       .
LD7F3:  stx     LC05F                           ; D7F3 8E 5F C0                 ._.
        .byte   $AD                             ; D7F6 AD                       .
        cli                                     ; D7F7 58                       X
LD7F8:  cpy     #$0D                            ; D7F8 C0 0D                    ..
        .byte   $59                             ; D7FA 59                       Y
LD7FB:  cpy     #$F0                            ; D7FB C0 F0                    ..
        cli                                     ; D7FD 58                       X
LD7FE:  lda     LC058                           ; D7FE AD 58 C0                 .X.
        bne     LD806                           ; D801 D0 03                    ..
        dec     LC059                           ; D803 CE 59 C0                 .Y.
LD806:  dec     LC058                           ; D806 CE 58 C0                 .X.
        jsr     LDC6C                           ; D809 20 6C DC                  l.
        ldx     LC05F                           ; D80C AE 5F C0                 ._.
        sta     LC100,x                         ; D80F 9D 00 C1                 ...
        inx                                     ; D812 E8                       .
        tya                                     ; D813 98                       .
        sta     LC100,x                         ; D814 9D 00 C1                 ...
        inx                                     ; D817 E8                       .
        bne     LD7F3                           ; D818 D0 D9                    ..
        .byte   $AD                             ; D81A AD                       .
        cli                                     ; D81B 58                       X
LD81C:  cpy     #$0D                            ; D81C C0 0D                    ..
        eor     LF0C0,y                         ; D81E 59 C0 F0                 Y..
        .byte   $34                             ; D821 34                       4
        ldy     LC101                           ; D822 AC 01 C1                 ...
        bne     LD843                           ; D825 D0 1C                    ..
        jsr     LDC6C                           ; D827 20 6C DC                  l.
        sta     LC100                           ; D82A 8D 00 C1                 ...
        pha                                     ; D82D 48                       H
        sty     LC101                           ; D82E 8C 01 C1                 ...
        tya                                     ; D831 98                       .
        pha                                     ; D832 48                       H
        jsr     LDAA8                           ; D833 20 A8 DA                  ..
        pla                                     ; D836 68                       h
        sta     LC002                           ; D837 8D 02 C0                 ...
LD83A:  pla                                     ; D83A 68                       h
        sta     LC001                           ; D83B 8D 01 C0                 ...
        inc     LC05E                           ; D83E EE 5E C0                 .^.
        bne     LD84F                           ; D841 D0 0C                    ..
LD843:  .byte   $20                             ; D843 20                        
        tay                                     ; D844 A8                       .
LD845:  .byte   $DA                             ; D845 DA                       .
        lda     LC100                           ; D846 AD 00 C1                 ...
        ldy     LC101                           ; D849 AC 01 C1                 ...
        jsr     LDA5D                           ; D84C 20 5D DA                  ].
LD84F:  jsr     LDACE                           ; D84F 20 CE DA                  ..
        ldx     #$02                            ; D852 A2 02                    ..
        bne     LD7F3                           ; D854 D0 9D                    ..
LD856:  lda     #$00                            ; D856 A9 00                    ..
        sta     LC100                           ; D858 8D 00 C1                 ...
        sta     LC101                           ; D85B 8D 01 C1                 ...
        jsr     LDAA8                           ; D85E 20 A8 DA                  ..
        lda     LC05C                           ; D861 AD 5C C0                 .\.
        ldy     LC05D                           ; D864 AC 5D C0                 .].
        jmp     LDA5D                           ; D867 4C 5D DA                 L].

; ----------------------------------------------------------------------------
        clc                                     ; D86A 18                       .
        bit     $38                             ; D86B 24 38                    $8
        .byte   $AD                             ; D86D AD                       .
        .byte   $02                             ; D86E 02                       .
LD86F:  .byte   $C2                             ; D86F C2                       .
        tax                                     ; D870 AA                       .
        ora     LC203                           ; D871 0D 03 C2                 ...
        bne     LD87D                           ; D874 D0 07                    ..
        bcc     LD8D4                           ; D876 90 5C                    .\
        ldx     #$07                            ; D878 A2 07                    ..
        jmp     LD67E                           ; D87A 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LD87D:  jmp     LE67F                           ; D87D 4C 7F E6                 L..

; ----------------------------------------------------------------------------
        bit     $2F                             ; D880 24 2F                    $/
        bpl     LD889                           ; D882 10 05                    ..
        php                                     ; D884 08                       .
        jsr     LE63A                           ; D885 20 3A E6                  :.
        plp                                     ; D888 28                       (
LD889:  ldy     #$02                            ; D889 A0 02                    ..
        lda     #$14                            ; D88B A9 14                    ..
        jmp     LDA8E                           ; D88D 4C 8E DA                 L..

; ----------------------------------------------------------------------------
        lda     #$01                            ; D890 A9 01                    ..
        ldy     #$00                            ; D892 A0 00                    ..
LD894:  pha                                     ; D894 48                       H
        and     LC210,x                         ; D895 3D 10 C2                 =..
        bne     LD89F                           ; D898 D0 05                    ..
        pla                                     ; D89A 68                       h
        asl     a                               ; D89B 0A                       .
        iny                                     ; D89C C8                       .
        bne     LD894                           ; D89D D0 F5                    ..
LD89F:  pla                                     ; D89F 68                       h
        eor     #$FF                            ; D8A0 49 FF                    I.
        and     LC210,x                         ; D8A2 3D 10 C2                 =..
        sta     LC210,x                         ; D8A5 9D 10 C2                 ...
        lda     #$00                            ; D8A8 A9 00                    ..
        sta     SEDORIC_TRAV1                   ; D8AA 85 F3                    ..
        txa                                     ; D8AC 8A                       .
        asl     a                               ; D8AD 0A                       .
        rol     SEDORIC_TRAV1                   ; D8AE 26 F3                    &.
        asl     a                               ; D8B0 0A                       .
        rol     SEDORIC_TRAV1                   ; D8B1 26 F3                    &.
        asl     a                               ; D8B3 0A                       .
        rol     SEDORIC_TRAV1                   ; D8B4 26 F3                    &.
        sta     SEDORIC_TRAV0                   ; D8B6 85 F2                    ..
        tya                                     ; D8B8 98                       .
        ora     SEDORIC_TRAV0                   ; D8B9 05 F2                    ..
        ldx     #$FF                            ; D8BB A2 FF                    ..
LD8BD:  sec                                     ; D8BD 38                       8
        inx                                     ; D8BE E8                       .
        tay                                     ; D8BF A8                       .
        sbc     LC207                           ; D8C0 ED 07 C2                 ...
        bcs     LD8BD                           ; D8C3 B0 F8                    ..
        dec     SEDORIC_TRAV1                   ; D8C5 C6 F3                    ..
        bpl     LD8BD                           ; D8C7 10 F4                    ..
        txa                                     ; D8C9 8A                       .
        cpx     LC206                           ; D8CA EC 06 C2                 ...
        bcc     LD8D4                           ; D8CD 90 05                    ..
        sbc     LC206                           ; D8CF ED 06 C2                 ...
        ora     #$80                            ; D8D2 09 80                    ..
LD8D4:  iny                                     ; D8D4 C8                       .
        rts                                     ; D8D5 60                       `

; ----------------------------------------------------------------------------
        dey                                     ; D8D6 88                       .
        tax                                     ; D8D7 AA                       .
        bpl     LD8E0                           ; D8D8 10 06                    ..
        and     #$7F                            ; D8DA 29 7F                    ).
        clc                                     ; D8DC 18                       .
        adc     LC206                           ; D8DD 6D 06 C2                 m..
LD8E0:  tax                                     ; D8E0 AA                       .
        lda     #$00                            ; D8E1 A9 00                    ..
        sta     SEDORIC_TRAV1                   ; D8E3 85 F3                    ..
        cpx     #$00                            ; D8E5 E0 00                    ..
        beq     LD8F4                           ; D8E7 F0 0B                    ..
LD8E9:  clc                                     ; D8E9 18                       .
        adc     LC207                           ; D8EA 6D 07 C2                 m..
        bcc     LD8F1                           ; D8ED 90 02                    ..
        inc     SEDORIC_TRAV1                   ; D8EF E6 F3                    ..
LD8F1:  dex                                     ; D8F1 CA                       .
        bne     LD8E9                           ; D8F2 D0 F5                    ..
LD8F4:  sta     SEDORIC_TRAV0                   ; D8F4 85 F2                    ..
        clc                                     ; D8F6 18                       .
        tya                                     ; D8F7 98                       .
        adc     SEDORIC_TRAV0                   ; D8F8 65 F2                    e.
        bcc     LD8FE                           ; D8FA 90 02                    ..
        inc     SEDORIC_TRAV1                   ; D8FC E6 F3                    ..
LD8FE:  pha                                     ; D8FE 48                       H
        and     #$07                            ; D8FF 29 07                    ).
        tay                                     ; D901 A8                       .
        pla                                     ; D902 68                       h
        lsr     SEDORIC_TRAV1                   ; D903 46 F3                    F.
        ror     a                               ; D905 6A                       j
        lsr     SEDORIC_TRAV1                   ; D906 46 F3                    F.
        ror     a                               ; D908 6A                       j
        lsr     SEDORIC_TRAV1                   ; D909 46 F3                    F.
        jmp     LE6C4                           ; D90B 4C C4 E6                 L..

; ----------------------------------------------------------------------------
        lda     #$00                            ; D90E A9 00                    ..
LD910:  rol     a                               ; D910 2A                       *
        dey                                     ; D911 88                       .
        bpl     LD910                           ; D912 10 FC                    ..
        rts                                     ; D914 60                       `

; ----------------------------------------------------------------------------
        jsr     LDCD6                           ; D915 20 D6 DC                  ..
        ora     LC210,x                         ; D918 1D 10 C2                 ...
        cmp     LC210,x                         ; D91B DD 10 C2                 ...
        beq     LD92C                           ; D91E F0 0C                    ..
        sta     LC210,x                         ; D920 9D 10 C2                 ...
        inc     LC202                           ; D923 EE 02 C2                 ...
        bne     LD92C                           ; D926 D0 04                    ..
        inc     LC203                           ; D928 EE 03 C2                 ...
        clc                                     ; D92B 18                       .
LD92C:  rts                                     ; D92C 60                       `

; ----------------------------------------------------------------------------
        jsr     LDCD6                           ; D92D 20 D6 DC                  ..
        eor     #$FF                            ; D930 49 FF                    I.
        and     LC210,x                         ; D932 3D 10 C2                 =..
        cmp     LC210,x                         ; D935 DD 10 C2                 ...
        beq     LD92C                           ; D938 F0 F2                    ..
        sta     LC210,x                         ; D93A 9D 10 C2                 ...
        lda     LC202                           ; D93D AD 02 C2                 ...
        bne     LD945                           ; D940 D0 03                    ..
        dec     LC203                           ; D942 CE 03 C2                 ...
LD945:  dec     LC202                           ; D945 CE 02 C2                 ...
        clc                                     ; D948 18                       .
        rts                                     ; D949 60                       `

; ----------------------------------------------------------------------------
        lda     #$40                            ; D94A A9 40                    .@
        bit     LC0A9                           ; D94C 2C A9 C0                 ,..
        bit     $80A9                           ; D94F 2C A9 80                 ,..
        bit     a:$A9                           ; D952 2C A9 00                 ,..
        jsr     LDE28                           ; D955 20 28 DE                  (.
        jsr     LD44F                           ; D958 20 4F D4                  O.
        jsr     LD79E                           ; D95B 20 9E D7                  ..
LD95E:  jsr     LD39E                           ; D95E 20 9E D3                  ..
        bne     LD966                           ; D961 D0 03                    ..
LD963:  jmp     LDE0B                           ; D963 4C 0B DE                 L..

; ----------------------------------------------------------------------------
LD966:  jsr     LD22C                           ; D966 20 2C D2                  ,.
        cmp     #$54                            ; D969 C9 54                    .T
        bne     LD989                           ; D96B D0 1C                    ..
        jsr     LD398                           ; D96D 20 98 D3                  ..
        jsr     LD2FA                           ; D970 20 FA D2                  ..
        sty     LC056                           ; D973 8C 56 C0                 .V.
        sta     LC057                           ; D976 8D 57 C0                 .W.
        lsr     LC051                           ; D979 4E 51 C0                 NQ.
        sec                                     ; D97C 38                       8
        rol     LC051                           ; D97D 2E 51 C0                 .Q.
        bne     LD95E                           ; D980 D0 DC                    ..
LD982:  lda     #$40                            ; D982 A9 40                    .@
        sta     LC051                           ; D984 8D 51 C0                 .Q.
        bne     LD95E                           ; D987 D0 D5                    ..
LD989:  cmp     #$41                            ; D989 C9 41                    .A
        bne     LD99B                           ; D98B D0 0E                    ..
        jsr     LD398                           ; D98D 20 98 D3                  ..
        jsr     LD2FA                           ; D990 20 FA D2                  ..
        sty     LC052                           ; D993 8C 52 C0                 .R.
        sta     LC053                           ; D996 8D 53 C0                 .S.
        bcc     LD982                           ; D999 90 E7                    ..
LD99B:  cmp     #$45                            ; D99B C9 45                    .E
        bne     LD9AD                           ; D99D D0 0E                    ..
        jsr     LD398                           ; D99F 20 98 D3                  ..
        jsr     LD2FA                           ; D9A2 20 FA D2                  ..
        sty     LC054                           ; D9A5 8C 54 C0                 .T.
        sta     LC055                           ; D9A8 8D 55 C0                 .U.
        bcc     LD982                           ; D9AB 90 D5                    ..
LD9AD:  cmp     #$C7                            ; D9AD C9 C7                    ..
        .byte   $D0                             ; D9AF D0                       .
LD9B0:  .byte   $72                             ; D9B0 72                       r
        jsr     LD398                           ; D9B1 20 98 D3                  ..
        bne     LDA23                           ; D9B4 D0 6D                    .m
        lsr     LC051                           ; D9B6 4E 51 C0                 NQ.
        sec                                     ; D9B9 38                       8
        rol     LC051                           ; D9BA 2E 51 C0                 .Q.
        .byte   $30                             ; D9BD 30                       0
LD9BE:  jmp     L52AD                           ; D9BE 4C AD 52                 L.R

; ----------------------------------------------------------------------------
        cpy     #$AC                            ; D9C1 C0 AC                    ..
        .byte   $53                             ; D9C3 53                       S
        cpy     #$8D                            ; D9C4 C0 8D                    ..
        lsr     $C0,x                           ; D9C6 56 C0                    V.
        sty     LC057                           ; D9C8 8C 57 C0                 .W.
        bcc     LDA0B                           ; D9CB 90 3E                    .>
        jsr     LD44F                           ; D9CD 20 4F D4                  O.
        lda     #$00                            ; D9D0 A9 00                    ..
        ldy     #$C8                            ; D9D2 A0 C8                    ..
        sta     LC052                           ; D9D4 8D 52 C0                 .R.
        sty     LC053                           ; D9D7 8C 53 C0                 .S.
        lda     #$DD                            ; D9DA A9 DD                    ..
        ldy     #$C9                            ; D9DC A0 C9                    ..
        bne     LD9FE                           ; D9DE D0 1E                    ..
        .byte   $20                             ; D9E0 20                        
        .byte   $4F                             ; D9E1 4F                       O
LD9E2:  .byte   $D4                             ; D9E2 D4                       .
        lda     $021F                           ; D9E3 AD 1F 02                 ...
        bne     LD9F0                           ; D9E6 D0 08                    ..
        ldx     #$80                            ; D9E8 A2 80                    ..
        ldy     #$BB                            ; D9EA A0 BB                    ..
        lda     #$DF                            ; D9EC A9 DF                    ..
        bne     LD9F6                           ; D9EE D0 06                    ..
LD9F0:  ldx     #$00                            ; D9F0 A2 00                    ..
        ldy     #$A0                            ; D9F2 A0 A0                    ..
        lda     #$3F                            ; D9F4 A9 3F                    .?
LD9F6:  stx     LC052                           ; D9F6 8E 52 C0                 .R.
        sty     LC053                           ; D9F9 8C 53 C0                 .S.
        ldy     #$BF                            ; D9FC A0 BF                    ..
LD9FE:  ldx     #$40                            ; D9FE A2 40                    .@
        jsr     LDE3B                           ; DA00 20 3B DE                  ;.
        lda     #$C0                            ; DA03 A9 C0                    ..
        sta     LC04D                           ; DA05 8D 4D C0                 .M.
        jsr     LD79E                           ; DA08 20 9E D7                  ..
LDA0B:  sec                                     ; DA0B 38                       8
        lda     LC054                           ; DA0C AD 54 C0                 .T.
        sbc     LC052                           ; DA0F ED 52 C0                 .R.
        sta     LC04F                           ; DA12 8D 4F C0                 .O.
        lda     LC055                           ; DA15 AD 55 C0                 .U.
        sbc     LC053                           ; DA18 ED 53 C0                 .S.
        sta     LC050                           ; DA1B 8D 50 C0                 .P.
        bcs     LDA9C                           ; DA1E B0 7C                    .|
        ldx     #$08                            ; DA20 A2 08                    ..
        .byte   $2C                             ; DA22 2C                       ,
LDA23:  ldx     #$09                            ; DA23 A2 09                    ..
        jmp     LD67E                           ; DA25 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        sta     LC04D                           ; DA28 8D 4D C0                 .M.
        lda     $9A                             ; DA2B A5 9A                    ..
        ldy     $9B                             ; DA2D A4 9B                    ..
        sta     LC052                           ; DA2F 8D 52 C0                 .R.
        sty     LC053                           ; DA32 8C 53 C0                 .S.
        lda     $9C                             ; DA35 A5 9C                    ..
        ldy     $9D                             ; DA37 A4 9D                    ..
        ldx     #$80                            ; DA39 A2 80                    ..
        sta     LC054                           ; DA3B 8D 54 C0                 .T.
        sty     LC055                           ; DA3E 8C 55 C0                 .U.
        stx     LC051                           ; DA41 8E 51 C0                 .Q.
        lda     #$00                            ; DA44 A9 00                    ..
        sta     LC056                           ; DA46 8D 56 C0                 .V.
        sta     LC057                           ; DA49 8D 57 C0                 .W.
LDA4C:  rts                                     ; DA4C 60                       `

; ----------------------------------------------------------------------------
        jsr     LD44F                           ; DA4D 20 4F D4                  O.
        jsr     LDFDE                           ; DA50 20 DE DF                  ..
LDA53:  jsr     LD302                           ; DA53 20 02 D3                  ..
        bpl     LDA53                           ; DA56 10 FB                    ..
        cmp     #$03                            ; DA58 C9 03                    ..
        beq     LDA4C                           ; DA5A F0 F0                    ..
        .byte   $C9                             ; DA5C C9                       .
LDA5D:  .byte   $13                             ; DA5D 13                       .
        bne     LDA7C                           ; DA5E D0 1C                    ..
LDA60:  jsr     LD740                           ; DA60 20 40 D7                  @.
LDA63:  lda     #$D0                            ; DA63 A9 D0                    ..
        ldy     #$BB                            ; DA65 A0 BB                    ..
        sta     LC052                           ; DA67 8D 52 C0                 .R.
        sty     LC053                           ; DA6A 8C 53 C0                 .S.
LDA6D:  lda     #$B7                            ; DA6D A9 B7                    ..
        ldy     #$BF                            ; DA6F A0 BF                    ..
        ldx     #$60                            ; DA71 A2 60                    .`
LDA73:  .byte   $20                             ; DA73 20                        
        brk                                     ; DA74 00                       .
LDA75:  dec     $3E20,x                         ; DA75 DE 20 3E                 . >
        .byte   $D7                             ; DA78 D7                       .
        jmp     LDE53                           ; DA79 4C 53 DE                 LS.

; ----------------------------------------------------------------------------
LDA7C:  cmp     #$17                            ; DA7C C9 17                    ..
        bne     LDA8E                           ; DA7E D0 0E                    ..
        .byte   $AC                             ; DA80 AC                       .
        .byte   $69                             ; DA81 69                       i
LDA82:  .byte   $02                             ; DA82 02                       .
        lda     #$7F                            ; DA83 A9 7F                    ..
        nop                                     ; DA85 EA                       .
        nop                                     ; DA86 EA                       .
        nop                                     ; DA87 EA                       .
        sta     ($12),y                         ; DA88 91 12                    ..
LDA8A:  lda     #$09                            ; DA8A A9 09                    ..
        bne     LDA97                           ; DA8C D0 09                    ..
LDA8E:  cmp     #$0D                            ; DA8E C9 0D                    ..
        .byte   $D0                             ; DA90 D0                       .
LDA91:  ora     $20                             ; DA91 05 20                    . 
        rol     a                               ; DA93 2A                       *
        dec     $A9,x                           ; DA94 D6 A9                    ..
        asl     a                               ; DA96 0A                       .
LDA97:  jsr     LD62A                           ; DA97 20 2A D6                  *.
        bne     LDA53                           ; DA9A D0 B7                    ..
LDA9C:  sei                                     ; DA9C 78                       x
        .byte   $20                             ; DA9D 20                        
LDA9E:  and     $F0DB                           ; DA9E 2D DB F0                 -..
        .byte   $6F                             ; DAA1 6F                       o
        .byte   $AD                             ; DAA2 AD                       .
        .byte   $4D                             ; DAA3 4D                       M
LDAA4:  cpy     #$F0                            ; DAA4 C0 F0                    ..
        asl     $C9,x                           ; DAA6 16 C9                    ..
LDAA8:  .byte   $80                             ; DAA8 80                       .
        beq     LDAB8                           ; DAA9 F0 0D                    ..
        cmp     #$C0                            ; DAAB C9 C0                    ..
        beq     LDAC5                           ; DAAD F0 16                    ..
        jsr     LDB07                           ; DAAF 20 07 DB                  ..
        .byte   $4C                             ; DAB2 4C                       L
        .byte   $1B                             ; DAB3 1B                       .
LDAB4:  .byte   $DF                             ; DAB4 DF                       .
LDAB5:  ldx     #$02                            ; DAB5 A2 02                    ..
        .byte   $2C                             ; DAB7 2C                       ,
LDAB8:  ldx     #$06                            ; DAB8 A2 06                    ..
        jmp     LD67E                           ; DABA 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LDABD:  jsr     LE264                           ; DABD 20 64 E2                  d.
        bcs     LDAEF                           ; DAC0 B0 2D                    .-
        .byte   $4C                             ; DAC2 4C                       L
LDAC3:  ora     ($DF),y                         ; DAC3 11 DF                    ..
LDAC5:  ldy     #$02                            ; DAC5 A0 02                    ..
LDAC7:  lda     LC032,y                         ; DAC7 B9 32 C0                 .2.
        pha                                     ; DACA 48                       H
        dey                                     ; DACB 88                       .
        bpl     LDAC7                           ; DACC 10 F9                    ..
LDACE:  ldy     #$02                            ; DACE A0 02                    ..
LDAD0:  lda     LC032,y                         ; DAD0 B9 32 C0                 .2.
        .byte   $D9                             ; DAD3 D9                       .
LDAD4:  .byte   $FA                             ; DAD4 FA                       .
        cpy     $05D0                           ; DAD5 CC D0 05                 ...
        dey                                     ; DAD8 88                       .
        bpl     LDAD0                           ; DAD9 10 F5                    ..
        bmi     LDAB5                           ; DADB 30 D8                    0.
        ldx     #$03                            ; DADD A2 03                    ..
        jsr     LD34A                           ; DADF 20 4A D3                  J.
        jsr     LDB30                           ; DAE2 20 30 DB                  0.
        beq     LDAF1                           ; DAE5 F0 0A                    ..
        jsr     LE264                           ; DAE7 20 64 E2                  d.
        bcc     LDAF1                           ; DAEA 90 05                    ..
        pla                                     ; DAEC 68                       h
        pla                                     ; DAED 68                       h
LDAEE:  pla                                     ; DAEE 68                       h
LDAEF:  cli                                     ; DAEF 58                       X
        rts                                     ; DAF0 60                       `

; ----------------------------------------------------------------------------
LDAF1:  ldy     #$00                            ; DAF1 A0 00                    ..
LDAF3:  pla                                     ; DAF3 68                       h
        sta     LC032,y                         ; DAF4 99 32 C0                 .2.
        iny                                     ; DAF7 C8                       .
        cpy     #$03                            ; DAF8 C0 03                    ..
        bne     LDAF3                           ; DAFA D0 F7                    ..
        jsr     LDB30                           ; DAFC 20 30 DB                  0.
        ldx     LC027                           ; DAFF AE 27 C0                 .'.
LDB02:  lda     LCCFA,y                         ; DB02 B9 FA CC                 ...
        .byte   $9D                             ; DB05 9D                       .
        .byte   $09                             ; DB06 09                       .
LDB07:  .byte   $C3                             ; DB07 C3                       .
        inx                                     ; DB08 E8                       .
        iny                                     ; DB09 C8                       .
        cpy     #$03                            ; DB0A C0 03                    ..
        bne     LDB02                           ; DB0C D0 F4                    ..
        jsr     LDA82                           ; DB0E 20 82 DA                  ..
LDB11:  ldx     #$03                            ; DB11 A2 03                    ..
        lda     #$00                            ; DB13 A9 00                    ..
LDB15:  sta     LC035,x                         ; DB15 9D 35 C0                 .5.
        dex                                     ; DB18 CA                       .
        bpl     LDB15                           ; DB19 10 FA                    ..
        ldx     LC050                           ; DB1B AE 50 C0                 .P.
        ldy     #$00                            ; DB1E A0 00                    ..
        inx                                     ; DB20 E8                       .
        txa                                     ; DB21 8A                       .
        bne     LDB25                           ; DB22 D0 01                    ..
        iny                                     ; DB24 C8                       .
LDB25:  jsr     LDBC0                           ; DB25 20 C0 DB                  ..
        lda     LC052                           ; DB28 AD 52 C0                 .R.
        .byte   $AC                             ; DB2B AC                       .
        .byte   $53                             ; DB2C 53                       S
LDB2D:  cpy     #$88                            ; DB2D C0 88                    ..
        .byte   $8D                             ; DB2F 8D                       .
LDB30:  .byte   $03                             ; DB30 03                       .
        cpy     #$8C                            ; DB31 C0 8C                    ..
        .byte   $04                             ; DB33 04                       .
        cpy     #$A0                            ; DB34 C0 A0                    ..
        asl     a                               ; DB36 0A                       .
LDB37:  inc     LC004                           ; DB37 EE 04 C0                 ...
        lda     LC050                           ; DB3A AD 50 C0                 .P.
        beq     LDB56                           ; DB3D F0 17                    ..
        .byte   $CE                             ; DB3F CE                       .
        .byte   $50                             ; DB40 50                       P
LDB41:  cpy     #$20                            ; DB41 C0 20                    . 
        plp                                     ; DB43 28                       (
        .byte   $E2                             ; DB44 E2                       .
        lda     LC100,y                         ; DB45 B9 00 C1                 ...
LDB48:  sta     LC001                           ; DB48 8D 01 C0                 ...
        lda     LC101,y                         ; DB4B B9 01 C1                 ...
        sta     LC002                           ; DB4E 8D 02 C0                 ...
        jsr     LDAA4                           ; DB51 20 A4 DA                  ..
        beq     LDB37                           ; DB54 F0 E1                    ..
LDB56:  jsr     LE228                           ; DB56 20 28 E2                  (.
LDB59:  lda     LC100,y                         ; DB59 B9 00 C1                 ...
        pha                                     ; DB5C 48                       H
        lda     LC101,y                         ; DB5D B9 01 C1                 ...
        pha                                     ; DB60 48                       H
        jsr     LDACE                           ; DB61 20 CE DA                  ..
        lda     LC003                           ; DB64 AD 03 C0                 ...
        ldy     LC004                           ; DB67 AC 04 C0                 ...
        sta     SEDORIC_TRAV0                   ; DB6A 85 F2                    ..
        sty     SEDORIC_TRAV1                   ; DB6C 84 F3                    ..
        .byte   $A0                             ; DB6E A0                       .
LDB6F:  .byte   $FF                             ; DB6F FF                       .
LDB70:  iny                                     ; DB70 C8                       .
        lda     (SEDORIC_TRAV0),y               ; DB71 B1 F2                    ..
        sta     LC100,y                         ; DB73 99 00 C1                 ...
        cpy     LC04F                           ; DB76 CC 4F C0                 .O.
        bne     LDB70                           ; DB79 D0 F5                    ..
        pla                                     ; DB7B 68                       h
        tay                                     ; DB7C A8                       .
        pla                                     ; DB7D 68                       h
        jsr     LDA91                           ; DB7E 20 91 DA                  ..
        clc                                     ; DB81 18                       .
        lda     LC05A                           ; DB82 AD 5A C0                 .Z.
        adc     LC05E                           ; DB85 6D 5E C0                 m^.
        bcc     LDB8D                           ; DB88 90 03                    ..
        inc     LC05B                           ; DB8A EE 5B C0                 .[.
LDB8D:  adc     LC037                           ; DB8D 6D 37 C0                 m7.
        sta     LC037                           ; DB90 8D 37 C0                 .7.
        lda     LC038                           ; DB93 AD 38 C0                 .8.
        and     #$0F                            ; DB96 29 0F                    ).
        adc     LC05B                           ; DB98 6D 5B C0                 m[.
        ora     #$40                            ; DB9B 09 40                    .@
        sta     LC038                           ; DB9D 8D 38 C0                 .8.
        lda     LC035                           ; DBA0 AD 35 C0                 .5.
        .byte   $AC                             ; DBA3 AC                       .
        .byte   $36                             ; DBA4 36                       6
LDBA5:  cpy     #$F0                            ; DBA5 C0 F0                    ..
        .byte   $1D                             ; DBA7 1D                       .
LDBA8:  jsr     LDA5D                           ; DBA8 20 5D DA                  ].
        lda     LC100                           ; DBAB AD 00 C1                 ...
        ldy     LC101                           ; DBAE AC 01 C1                 ...
        bne     LDBA8                           ; DBB1 D0 F5                    ..
        lda     LC05C                           ; DBB3 AD 5C C0                 .\.
        ldy     LC05D                           ; DBB6 AC 5D C0                 .].
        sta     LC100                           ; DBB9 8D 00 C1                 ...
        sty     LC101                           ; DBBC 8C 01 C1                 ...
        .byte   $20                             ; DBBF 20                        
LDBC0:  ldy     $DA                             ; DBC0 A4 DA                    ..
        jmp     LDFD4                           ; DBC2 4C D4 DF                 L..

; ----------------------------------------------------------------------------
        lda     LC05C                           ; DBC5 AD 5C C0                 .\.
        ldy     LC05D                           ; DBC8 AC 5D C0                 .].
        sta     LC035                           ; DBCB 8D 35 C0                 .5.
        sty     LC036                           ; DBCE 8C 36 C0                 .6.
        jsr     LDB59                           ; DBD1 20 59 DB                  Y.
        jsr     LDA8A                           ; DBD4 20 8A DA                  ..
        jsr     LDAEE                           ; DBD7 20 EE DA                  ..
        cli                                     ; DBDA 58                       X
        jmp     LDA82                           ; DBDB 4C 82 DA                 L..

; ----------------------------------------------------------------------------
        lda     $021F                           ; DBDE AD 1F 02                 ...
        beq     LDBF3                           ; DBE1 F0 10                    ..
        jmp     LD16F                           ; DBE3 4C 6F D1                 Lo.

; ----------------------------------------------------------------------------
        lda     #$00                            ; DBE6 A9 00                    ..
        ldx     #$03                            ; DBE8 A2 03                    ..
LDBEA:  sta     LC04D,x                         ; DBEA 9D 4D C0                 .M.
        dex                                     ; DBED CA                       .
        bpl     LDBEA                           ; DBEE 10 FA                    ..
        stx     LC072                           ; DBF0 8E 72 C0                 .r.
LDBF3:  rts                                     ; DBF3 60                       `

; ----------------------------------------------------------------------------
LDBF4:  jmp     LDE23                           ; DBF4 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        lda     #$80                            ; DBF7 A9 80                    ..
        jsr     LD454                           ; DBF9 20 54 D4                  T.
        jsr     LD79E                           ; DBFC 20 9E D7                  ..
        jsr     LDFE6                           ; DBFF 20 E6 DF                  ..
LDC02:  jsr     LD39E                           ; DC02 20 9E D3                  ..
        beq     LDC52                           ; DC05 F0 4B                    .K
        bne     LDC0E                           ; DC07 D0 05                    ..
LDC09:  jsr     LD398                           ; DC09 20 98 D3                  ..
        beq     LDC52                           ; DC0C F0 44                    .D
LDC0E:  jsr     LD22C                           ; DC0E 20 2C D2                  ,.
        ldy     #$40                            ; DC11 A0 40                    .@
        cmp     #$56                            ; DC13 C9 56                    .V
        beq     LDC1D                           ; DC15 F0 06                    ..
        cmp     #$4E                            ; DC17 C9 4E                    .N
        bne     LDC27                           ; DC19 D0 0C                    ..
        ldy     #$80                            ; DC1B A0 80                    ..
LDC1D:  lda     LC04D                           ; DC1D AD 4D C0                 .M.
        bne     LDBF4                           ; DC20 D0 D2                    ..
        sty     LC04D                           ; DC22 8C 4D C0                 .M.
        beq     LDC09                           ; DC25 F0 E2                    ..
LDC27:  cmp     #$4A                            ; DC27 C9 4A                    .J
        bne     LDC34                           ; DC29 D0 09                    ..
        lda     LC04E                           ; DC2B AD 4E C0                 .N.
        bne     LDBF4                           ; DC2E D0 C4                    ..
        ldx     #$80                            ; DC30 A2 80                    ..
        bmi     LDC4B                           ; DC32 30 17                    0.
LDC34:  cmp     #$41                            ; DC34 C9 41                    .A
        bne     LDBF4                           ; DC36 D0 BC                    ..
        lda     LC04E                           ; DC38 AD 4E C0                 .N.
        bne     LDBF4                           ; DC3B D0 B7                    ..
        jsr     LD398                           ; DC3D 20 98 D3                  ..
        jsr     LD2FA                           ; DC40 20 FA D2                  ..
        sty     LC052                           ; DC43 8C 52 C0                 .R.
        sta     LC053                           ; DC46 8D 53 C0                 .S.
        ldx     #$40                            ; DC49 A2 40                    .@
LDC4B:  stx     LC04E                           ; DC4B 8E 4E C0                 .N.
        bmi     LDC09                           ; DC4E 30 B9                    0.
        bpl     LDC02                           ; DC50 10 B0                    ..
LDC52:  jsr     LE0E5                           ; DC52 20 E5 E0                  ..
        bit     LC04D                           ; DC55 2C 4D C0                 ,M.
        bvc     LDC85                           ; DC58 50 2B                    P+
        lda     LC051                           ; DC5A AD 51 C0                 .Q.
        jsr     LD7E1                           ; DC5D 20 E1 D7                  ..
        lda     LC052                           ; DC60 AD 52 C0                 .R.
        ldy     LC053                           ; DC63 AC 53 C0                 .S.
        jsr     LD7F8                           ; DC66 20 F8 D7                  ..
        lda     LC056                           ; DC69 AD 56 C0                 .V.
LDC6C:  ldy     LC057                           ; DC6C AC 57 C0                 .W.
        jsr     LD7FE                           ; DC6F 20 FE D7                  ..
        clc                                     ; DC72 18                       .
        lda     LC052                           ; DC73 AD 52 C0                 .R.
        .byte   $6D                             ; DC76 6D                       m
        .byte   $4F                             ; DC77 4F                       O
LDC78:  cpy     #$48                            ; DC78 C0 48                    .H
        lda     LC053                           ; DC7A AD 53 C0                 .S.
        adc     LC050                           ; DC7D 6D 50 C0                 mP.
LDC80:  tay                                     ; DC80 A8                       .
        pla                                     ; DC81 68                       h
        jsr     LD7FB                           ; DC82 20 FB D7                  ..
LDC85:  lda     LC04D                           ; DC85 AD 4D C0                 .M.
        asl     a                               ; DC88 0A                       .
LDC89:  bmi     LDCDB                           ; DC89 30 50                    0P
LDC8B:  rol     a                               ; DC8B 2A                       *
        eor     #$01                            ; DC8C 49 01                    I.
        .byte   $2D                             ; DC8E 2D                       -
        .byte   $51                             ; DC8F 51                       Q
LDC90:  cpy     #$4A                            ; DC90 C0 4A                    .J
        lda     LC051                           ; DC92 AD 51 C0                 .Q.
        bpl     LDCA4                           ; DC95 10 0D                    ..
        php                                     ; DC97 08                       .
        jsr     LE0B4                           ; DC98 20 B4 E0                  ..
        plp                                     ; DC9B 28                       (
        bcc     LDCA1                           ; DC9C 90 03                    ..
        jmp     LD1AC                           ; DC9E 4C AC D1                 L..

; ----------------------------------------------------------------------------
LDCA1:  jmp     LD180                           ; DCA1 4C 80 D1                 L..

; ----------------------------------------------------------------------------
LDCA4:  bcc     LDCDB                           ; DCA4 90 35                    .5
        .byte   $AD                             ; DCA6 AD                       .
        .byte   $56                             ; DCA7 56                       V
LDCA8:  cpy     #$AC                            ; DCA8 C0 AC                    ..
        .byte   $57                             ; DCAA 57                       W
        cpy     #$4C                            ; DCAB C0 4C                    .L
LDCAD:  .byte   $6B                             ; DCAD 6B                       k
        .byte   $04                             ; DCAE 04                       .
        ldy     #$01                            ; DCAF A0 01                    ..
        tya                                     ; DCB1 98                       .
        sta     ($9A),y                         ; DCB2 91 9A                    ..
        php                                     ; DCB4 08                       .
        sei                                     ; DCB5 78                       x
        jsr     LD188                           ; DCB6 20 88 D1                  ..
        ldy     $92                             ; DCB9 A4 92                    ..
        lda     $91                             ; DCBB A5 91                    ..
        clc                                     ; DCBD 18                       .
        adc     #$02                            ; DCBE 69 02                    i.
        bcc     LDCC3                           ; DCC0 90 01                    ..
        iny                                     ; DCC2 C8                       .
LDCC3:  sta     $9C                             ; DCC3 85 9C                    ..
        sty     $9D                             ; DCC5 84 9D                    ..
        sta     $9E                             ; DCC7 85 9E                    ..
        sty     $9F                             ; DCC9 84 9F                    ..
        sta     $A0                             ; DCCB 85 A0                    ..
        sty     $A1                             ; DCCD 84 A1                    ..
        lda     $A6                             ; DCCF A5 A6                    ..
        ldy     $A7                             ; DCD1 A4 A7                    ..
        sta     $A2                             ; DCD3 85 A2                    ..
        .byte   $84                             ; DCD5 84                       .
LDCD6:  .byte   $A3                             ; DCD6 A3                       .
        plp                                     ; DCD7 28                       (
        jmp     LD1CC                           ; DCD8 4C CC D1                 L..

; ----------------------------------------------------------------------------
LDCDB:  cli                                     ; DCDB 58                       X
        rts                                     ; DCDC 60                       `

; ----------------------------------------------------------------------------
LDCDD:  ldx     #$00                            ; DCDD A2 00                    ..
        .byte   $2C                             ; DCDF 2C                       ,
LDCE0:  ldx     #$0C                            ; DCE0 A2 0C                    ..
        jmp     LD67E                           ; DCE2 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        jsr     LDB2D                           ; DCE5 20 2D DB                  -.
        beq     LDCDD                           ; DCE8 F0 F3                    ..
        sei                                     ; DCEA 78                       x
        sec                                     ; DCEB 38                       8
        ror     LC072                           ; DCEC 6E 72 C0                 nr.
        lda     LC30C,x                         ; DCEF BD 0C C3                 ...
        ldy     LC30D,x                         ; DCF2 BC 0D C3                 ...
LDCF5:  jsr     LDA5D                           ; DCF5 20 5D DA                  ].
        ldx     #$02                            ; DCF8 A2 02                    ..
LDCFA:  lda     LC100,x                         ; DCFA BD 00 C1                 ...
        cmp     #$FF                            ; DCFD C9 FF                    ..
        beq     LDD0E                           ; DCFF F0 0D                    ..
        inx                                     ; DD01 E8                       .
        bne     LDCFA                           ; DD02 D0 F6                    ..
        lda     LC100                           ; DD04 AD 00 C1                 ...
        ldy     LC101                           ; DD07 AC 01 C1                 ...
        beq     LDCDB                           ; DD0A F0 CF                    ..
        .byte   $D0                             ; DD0C D0                       .
LDD0D:  .byte   $E7                             ; DD0D E7                       .
LDD0E:  lda     LC101,x                         ; DD0E BD 01 C1                 ...
        sta     SEDORIC_TRAV7                   ; DD11 85 F9                    ..
        and     #$C0                            ; DD13 29 C0                    ).
LDD15:  bne     LDD1C                           ; DD15 D0 05                    ..
        bit     LC04D                           ; DD17 2C 4D C0                 ,M.
        bvc     LDCE0                           ; DD1A 50 C4                    P.
LDD1C:  bit     LC04E                           ; DD1C 2C 4E C0                 ,N.
        bvs     LDD3A                           ; DD1F 70 19                    p.
        bpl     LDD2E                           ; DD21 10 0B                    ..
        ldy     $9D                             ; DD23 A4 9D                    ..
        lda     $9C                             ; DD25 A5 9C                    ..
        sbc     #$02                            ; DD27 E9 02                    ..
        bcs     LDD34                           ; DD29 B0 09                    ..
        dey                                     ; DD2B 88                       .
        bcc     LDD34                           ; DD2C 90 06                    ..
LDD2E:  lda     LC102,x                         ; DD2E BD 02 C1                 ...
        ldy     LC103,x                         ; DD31 BC 03 C1                 ...
LDD34:  sta     LC052                           ; DD34 8D 52 C0                 .R.
        sty     LC053                           ; DD37 8C 53 C0                 .S.
LDD3A:  sec                                     ; DD3A 38                       8
        lda     LC104,x                         ; DD3B BD 04 C1                 ...
        sbc     LC102,x                         ; DD3E FD 02 C1                 ...
        sta     LC04F                           ; DD41 8D 4F C0                 .O.
        lda     LC105,x                         ; DD44 BD 05 C1                 ...
        .byte   $FD                             ; DD47 FD                       .
        .byte   $03                             ; DD48 03                       .
LDD49:  cmp     ($8D,x)                         ; DD49 C1 8D                    ..
        bvc     LDD0D                           ; DD4B 50 C0                    P.
        clc                                     ; DD4D 18                       .
        .byte   $AD                             ; DD4E AD                       .
LDD4F:  .byte   $52                             ; DD4F 52                       R
        cpy     #$8D                            ; DD50 C0 8D                    ..
        .byte   $03                             ; DD52 03                       .
        cpy     #$6D                            ; DD53 C0 6D                    .m
        .byte   $4F                             ; DD55 4F                       O
        cpy     #$48                            ; DD56 C0 48                    .H
        lda     LC053                           ; DD58 AD 53 C0                 .S.
        tay                                     ; DD5B A8                       .
        dey                                     ; DD5C 88                       .
        sty     LC004                           ; DD5D 8C 04 C0                 ...
        adc     LC050                           ; DD60 6D 50 C0                 mP.
        tay                                     ; DD63 A8                       .
        bit     LC072                           ; DD64 2C 72 C0                 ,r.
        bpl     LDD75                           ; DD67 10 0C                    ..
        lda     LC106,x                         ; DD69 BD 06 C1                 ...
        sta     LC056                           ; DD6C 8D 56 C0                 .V.
        lda     LC107,x                         ; DD6F BD 07 C1                 ...
        sta     LC057                           ; DD72 8D 57 C0                 .W.
LDD75:  lda     LC108,x                         ; DD75 BD 08 C1                 ...
        sta     SEDORIC_TRAV5                   ; DD78 85 F7                    ..
        lda     LC109,x                         ; DD7A BD 09 C1                 ...
        sta     SEDORIC_TRAV6                   ; DD7D 85 F8                    ..
        bit     LC04D                           ; DD7F 2C 4D C0                 ,M.
        bvc     LDDB9                           ; DD82 50 35                    P5
        lda     LC053                           ; DD84 AD 53 C0                 .S.
        jsr     LD613                           ; DD87 20 13 D6                  ..
        lda     LC052                           ; DD8A AD 52 C0                 .R.
        jsr     LD613                           ; DD8D 20 13 D6                  ..
        jsr     LD628                           ; DD90 20 28 D6                  (.
        tya                                     ; DD93 98                       .
        jsr     LD613                           ; DD94 20 13 D6                  ..
        pla                                     ; DD97 68                       h
        jsr     LD613                           ; DD98 20 13 D6                  ..
        jsr     LD628                           ; DD9B 20 28 D6                  (.
        lda     SEDORIC_TRAV7                   ; DD9E A5 F9                    ..
        jsr     LD613                           ; DDA0 20 13 D6                  ..
        jsr     LD628                           ; DDA3 20 28 D6                  (.
        lda     LC057                           ; DDA6 AD 57 C0                 .W.
        jsr     LD613                           ; DDA9 20 13 D6                  ..
        lda     LC056                           ; DDAC AD 56 C0                 .V.
        jsr     LD613                           ; DDAF 20 13 D6                  ..
        jsr     LD628                           ; DDB2 20 28 D6                  (.
        jsr     LD206                           ; DDB5 20 06 D2                  ..
        .byte   $24                             ; DDB8 24                       $
LDDB9:  pla                                     ; DDB9 68                       h
        txa                                     ; DDBA 8A                       .
        clc                                     ; DDBB 18                       .
        adc     #$06                            ; DDBC 69 06                    i.
        tay                                     ; DDBE A8                       .
        jsr     LE228                           ; DDBF 20 28 E2                  (.
        lda     SEDORIC_TRAV5                   ; DDC2 A5 F7                    ..
        bne     LDDC8                           ; DDC4 D0 02                    ..
        dec     SEDORIC_TRAV6                   ; DDC6 C6 F8                    ..
LDDC8:  dec     SEDORIC_TRAV5                   ; DDC8 C6 F7                    ..
        inc     LC004                           ; DDCA EE 04 C0                 ...
        lda     SEDORIC_TRAV5                   ; DDCD A5 F7                    ..
        ora     SEDORIC_TRAV6                   ; DDCF 05 F8                    ..
        beq     LDDDC                           ; DDD1 F0 09                    ..
        jsr     LE228                           ; DDD3 20 28 E2                  (.
        jsr     LE250                           ; DDD6 20 50 E2                  P.
        jmp     LE1C2                           ; DDD9 4C C2 E1                 L..

; ----------------------------------------------------------------------------
LDDDC:  lda     LC003                           ; DDDC AD 03 C0                 ...
        ldx     LC004                           ; DDDF AE 04 C0                 ...
        sta     SEDORIC_TRAV3                   ; DDE2 85 F5                    ..
        stx     SEDORIC_TRAV4                   ; DDE4 86 F6                    ..
        jsr     LE228                           ; DDE6 20 28 E2                  (.
        tya                                     ; DDE9 98                       .
        pha                                     ; DDEA 48                       H
        lda     #$00                            ; DDEB A9 00                    ..
        ldx     #$C2                            ; DDED A2 C2                    ..
        sta     LC003                           ; DDEF 8D 03 C0                 ...
        stx     LC004                           ; DDF2 8E 04 C0                 ...
        bit     LC04D                           ; DDF5 2C 4D C0                 ,M.
        bvs     LDE0A                           ; DDF8 70 10                    p.
        jsr     LE250                           ; DDFA 20 50 E2                  P.
        ldy     #$FF                            ; DDFD A0 FF                    ..
LDDFF:  iny                                     ; DDFF C8                       .
LDE00:  lda     LC200,y                         ; DE00 B9 00 C2                 ...
        sta     (SEDORIC_TRAV3),y               ; DE03 91 F5                    ..
        cpy     LC04F                           ; DE05 CC 4F C0                 .O.
        bne     LDDFF                           ; DE08 D0 F5                    ..
LDE0A:  pla                                     ; DE0A 68                       h
LDE0B:  tay                                     ; DE0B A8                       .
        jsr     LE228                           ; DE0C 20 28 E2                  (.
        bcs     LDE4E                           ; DE0F B0 3D                    .=
        tya                                     ; DE11 98                       .
        tax                                     ; DE12 AA                       .
        lda     LC072                           ; DE13 AD 72 C0                 .r.
        bpl     LDE25                           ; DE16 10 0D                    ..
        lsr     LC072                           ; DE18 4E 72 C0                 Nr.
        lda     #$00                            ; DE1B A9 00                    ..
        sta     LC04E                           ; DE1D 8D 4E C0                 .N.
LDE20:  lda     SEDORIC_TRAV7                   ; DE20 A5 F9                    ..
        .byte   $8D                             ; DE22 8D                       .
LDE23:  eor     ($C0),y                         ; DE23 51 C0                    Q.
LDE25:  jmp     LE0FA                           ; DE25 4C FA E0                 L..

; ----------------------------------------------------------------------------
LDE28:  iny                                     ; DE28 C8                       .
        iny                                     ; DE29 C8                       .
        bne     LDE49                           ; DE2A D0 1D                    ..
        lda     LC003                           ; DE2C AD 03 C0                 ...
        pha                                     ; DE2F 48                       H
        lda     LC004                           ; DE30 AD 04 C0                 ...
        pha                                     ; DE33 48                       H
        lda     LC100                           ; DE34 AD 00 C1                 ...
        ldy     LC101                           ; DE37 AC 01 C1                 ...
        .byte   $F0                             ; DE3A F0                       .
LDE3B:  .byte   $0F                             ; DE3B 0F                       .
        jsr     LDA5D                           ; DE3C 20 5D DA                  ].
        pla                                     ; DE3F 68                       h
        sta     LC004                           ; DE40 8D 04 C0                 ...
        pla                                     ; DE43 68                       h
        sta     LC003                           ; DE44 8D 03 C0                 ...
        ldy     #$02                            ; DE47 A0 02                    ..
LDE49:  clc                                     ; DE49 18                       .
LDE4A:  rts                                     ; DE4A 60                       `

; ----------------------------------------------------------------------------
        sec                                     ; DE4B 38                       8
        pla                                     ; DE4C 68                       h
        pla                                     ; DE4D 68                       h
LDE4E:  cli                                     ; DE4E 58                       X
        rts                                     ; DE4F 60                       `

; ----------------------------------------------------------------------------
        lda     LC100,y                         ; DE50 B9 00 C1                 ...
LDE53:  sta     LC001                           ; DE53 8D 01 C0                 ...
        lda     LC101,y                         ; DE56 B9 01 C1                 ...
        sta     LC002                           ; DE59 8D 02 C0                 ...
        bit     LC04D                           ; DE5C 2C 4D C0                 ,M.
        bvs     LDE4A                           ; DE5F 70 E9                    p.
        jmp     LDA73                           ; DE61 4C 73 DA                 Ls.

; ----------------------------------------------------------------------------
        clc                                     ; DE64 18                       .
        bit     $38                             ; DE65 24 38                    $8
        ldx     LC027                           ; DE67 AE 27 C0                 .'.
        ldy     LC30F,x                         ; DE6A BC 0F C3                 ...
        bmi     LDED0                           ; DE6D 30 61                    0a
        tya                                     ; DE6F 98                       .
        rol     a                               ; DE70 2A                       *
        rol     a                               ; DE71 2A                       *
        bpl     LDE77                           ; DE72 10 03                    ..
        jmp     LE5F3                           ; DE74 4C F3 E5                 L..

; ----------------------------------------------------------------------------
LDE77:  jsr     LE5DC                           ; DE77 20 DC E5                  ..
        .byte   $BD                             ; DE7A BD                       .
LDE7B:  .byte   $0C                             ; DE7B 0C                       .
        .byte   $C3                             ; DE7C C3                       .
        pha                                     ; DE7D 48                       H
        lda     LC30D,x                         ; DE7E BD 0D C3                 ...
        pha                                     ; DE81 48                       H
        sec                                     ; DE82 38                       8
        lda     LC302                           ; DE83 AD 02 C3                 ...
        sbc     #$10                            ; DE86 E9 10                    ..
        sta     LC302                           ; DE88 8D 02 C3                 ...
        tay                                     ; DE8B A8                       .
        lda     #$10                            ; DE8C A9 10                    ..
        sta     SEDORIC_TRAV0                   ; DE8E 85 F2                    ..
LDE90:  lda     LC300,y                         ; DE90 B9 00 C3                 ...
        stx     SEDORIC_TRAV1                   ; DE93 86 F3                    ..
        cpy     SEDORIC_TRAV1                   ; DE95 C4 F3                    ..
        beq     LDE9C                           ; DE97 F0 03                    ..
        sta     LC300,x                         ; DE99 9D 00 C3                 ...
LDE9C:  lda     #$00                            ; DE9C A9 00                    ..
        sta     LC300,y                         ; DE9E 99 00 C3                 ...
        inx                                     ; DEA1 E8                       .
        iny                                     ; DEA2 C8                       .
        dec     SEDORIC_TRAV0                   ; DEA3 C6 F2                    ..
        bne     LDE90                           ; DEA5 D0 E9                    ..
        pla                                     ; DEA7 68                       h
        tay                                     ; DEA8 A8                       .
        pla                                     ; DEA9 68                       h
LDEAA:  jsr     LDA5D                           ; DEAA 20 5D DA                  ].
        lda     LC001                           ; DEAD AD 01 C0                 ...
        ldy     LC002                           ; DEB0 AC 02 C0                 ...
        jsr     LDD15                           ; DEB3 20 15 DD                  ..
        ldx     #$02                            ; DEB6 A2 02                    ..
LDEB8:  lda     LC100,x                         ; DEB8 BD 00 C1                 ...
        cmp     #$FF                            ; DEBB C9 FF                    ..
        beq     LDEDC                           ; DEBD F0 1D                    ..
        inx                                     ; DEBF E8                       .
        bne     LDEB8                           ; DEC0 D0 F6                    ..
        lda     LC100                           ; DEC2 AD 00 C1                 ...
        ldy     LC101                           ; DEC5 AC 01 C1                 ...
        bne     LDEAA                           ; DEC8 D0 E0                    ..
LDECA:  jsr     LDA8A                           ; DECA 20 8A DA                  ..
        jmp     LDA82                           ; DECD 4C 82 DA                 L..

; ----------------------------------------------------------------------------
LDED0:  bcs     LDED5                           ; DED0 B0 03                    ..
        jsr     LDAB4                           ; DED2 20 B4 DA                  ..
LDED5:  ldx     #$09                            ; DED5 A2 09                    ..
        jsr     LD36C                           ; DED7 20 6C D3                  l.
        sec                                     ; DEDA 38                       8
        rts                                     ; DEDB 60                       `

; ----------------------------------------------------------------------------
LDEDC:  lda     LC108,x                         ; DEDC BD 08 C1                 ...
        sta     SEDORIC_TRAV3                   ; DEDF 85 F5                    ..
        lda     LC109,x                         ; DEE1 BD 09 C1                 ...
        sta     SEDORIC_TRAV4                   ; DEE4 85 F6                    ..
        txa                                     ; DEE6 8A                       .
        clc                                     ; DEE7 18                       .
        adc     #$0A                            ; DEE8 69 0A                    i.
        tax                                     ; DEEA AA                       .
        txa                                     ; DEEB 8A                       .
        pha                                     ; DEEC 48                       H
        lda     LC100,x                         ; DEED BD 00 C1                 ...
        ldy     LC101,x                         ; DEF0 BC 01 C1                 ...
        jsr     LDD15                           ; DEF3 20 15 DD                  ..
        pla                                     ; DEF6 68                       h
        tax                                     ; DEF7 AA                       .
        inx                                     ; DEF8 E8                       .
        inx                                     ; DEF9 E8                       .
        bne     LDF12                           ; DEFA D0 16                    ..
        lda     LC100                           ; DEFC AD 00 C1                 ...
        ldy     LC101                           ; DEFF AC 01 C1                 ...
        beq     LDECA                           ; DF02 F0 C6                    ..
        jsr     LDA5D                           ; DF04 20 5D DA                  ].
        lda     LC001                           ; DF07 AD 01 C0                 ...
        ldy     LC002                           ; DF0A AC 02 C0                 ...
        jsr     LDD15                           ; DF0D 20 15 DD                  ..
        ldx     #$02                            ; DF10 A2 02                    ..
LDF12:  ldy     SEDORIC_TRAV3                   ; DF12 A4 F5                    ..
        bne     LDF18                           ; DF14 D0 02                    ..
        dec     SEDORIC_TRAV4                   ; DF16 C6 F6                    ..
LDF18:  dec     SEDORIC_TRAV3                   ; DF18 C6 F5                    ..
        .byte   $A5                             ; DF1A A5                       .
LDF1B:  sbc     $05,x                           ; DF1B F5 05                    ..
        inc     $D0,x                           ; DF1D F6 D0                    ..
        .byte   $CB                             ; DF1F CB                       .
        beq     LDEB8                           ; DF20 F0 96                    ..
        jsr     LDAB4                           ; DF22 20 B4 DA                  ..
        lda     #$20                            ; DF25 A9 20                    . 
        sta     LC04C                           ; DF27 8D 4C C0                 .L.
        ldx     LC027                           ; DF2A AE 27 C0                 .'.
        lda     LC30F,x                         ; DF2D BD 0F C3                 ...
        php                                     ; DF30 08                       .
        and     #$0F                            ; DF31 29 0F                    ).
        tay                                     ; DF33 A8                       .
        lda     LC30E,x                         ; DF34 BD 0E C3                 ...
        jsr     LD756                           ; DF37 20 56 D7                  V.
        lda     #$20                            ; DF3A A9 20                    . 
        plp                                     ; DF3C 28                       (
        bpl     LDF41                           ; DF3D 10 02                    ..
        lda     #$50                            ; DF3F A9 50                    .P
LDF41:  jmp     LD62A                           ; DF41 4C 2A D6                 L*.

; ----------------------------------------------------------------------------
        jsr     LD451                           ; DF44 20 51 D4                  Q.
        php                                     ; DF47 08                       .
        sei                                     ; DF48 78                       x
        lda     #$14                            ; DF49 A9 14                    ..
        ldy     #$01                            ; DF4B A0 01                    ..
        jsr     LDA5D                           ; DF4D 20 5D DA                  ].
        jsr     LDA4C                           ; DF50 20 4C DA                  L.
        ldx     #$05                            ; DF53 A2 05                    ..
        jsr     LD36C                           ; DF55 20 6C D3                  l.
        lda     LC028                           ; DF58 AD 28 C0                 .(.
        jsr     LD60E                           ; DF5B 20 0E D6                  ..
        ldx     #$06                            ; DF5E A2 06                    ..
        ldy     LC20A                           ; DF60 AC 0A C2                 ...
        beq     LDF77                           ; DF63 F0 12                    ..
        ldx     #$11                            ; DF65 A2 11                    ..
        dey                                     ; DF67 88                       .
        beq     LDF77                           ; DF68 F0 0D                    ..
        ldx     #$12                            ; DF6A A2 12                    ..
        jsr     LD36C                           ; DF6C 20 6C D3                  l.
        lda     LC20A                           ; DF6F AD 0A C2                 ...
        jsr     LD62A                           ; DF72 20 2A D6                  *.
        ldx     #$13                            ; DF75 A2 13                    ..
LDF77:  jsr     LD36C                           ; DF77 20 6C D3                  l.
        ldy     #$EB                            ; DF7A A0 EB                    ..
LDF7C:  lda     LC01E,y                         ; DF7C B9 1E C0                 ...
        jsr     LD62A                           ; DF7F 20 2A D6                  *.
        iny                                     ; DF82 C8                       .
        bne     LDF7C                           ; DF83 D0 F7                    ..
        jsr     LE41F                           ; DF85 20 1F E4                  ..
        jsr     LD206                           ; DF88 20 06 D2                  ..
        jsr     LDB30                           ; DF8B 20 30 DB                  0.
        bne     LDF9B                           ; DF8E D0 0B                    ..
        beq     LDFC5                           ; DF90 F0 33                    .3
LDF92:  sei                                     ; DF92 78                       x
        jsr     LE41F                           ; DF93 20 1F E4                  ..
        jsr     LDB41                           ; DF96 20 41 DB                  A.
        beq     LDFC2                           ; DF99 F0 27                    .'
LDF9B:  jsr     LE583                           ; DF9B 20 83 E5                  ..
        jsr     LDB41                           ; DF9E 20 41 DB                  A.
        beq     LDFBF                           ; DFA1 F0 1C                    ..
        jsr     LD628                           ; DFA3 20 28 D6                  (.
        jsr     LD628                           ; DFA6 20 28 D6                  (.
        jsr     LE583                           ; DFA9 20 83 E5                  ..
        cli                                     ; DFAC 58                       X
        jsr     LD302                           ; DFAD 20 02 D3                  ..
        bpl     LDF92                           ; DFB0 10 E0                    ..
LDFB2:  jsr     LD302                           ; DFB2 20 02 D3                  ..
        bpl     LDFB2                           ; DFB5 10 FB                    ..
        cmp     #$20                            ; DFB7 C9 20                    . 
        beq     LDF92                           ; DFB9 F0 D7                    ..
        cmp     #$1B                            ; DFBB C9 1B                    ..
        bne     LDFB2                           ; DFBD D0 F3                    ..
LDFBF:  jsr     LD206                           ; DFBF 20 06 D2                  ..
LDFC2:  jsr     LD206                           ; DFC2 20 06 D2                  ..
LDFC5:  lda     #$20                            ; DFC5 A9 20                    . 
        sta     LC04C                           ; DFC7 8D 4C C0                 .L.
        lda     LC202                           ; DFCA AD 02 C2                 ...
        ldy     LC203                           ; DFCD AC 03 C2                 ...
        jsr     LD756                           ; DFD0 20 56 D7                  V.
        .byte   $A2                             ; DFD3 A2                       .
LDFD4:  .byte   $07                             ; DFD4 07                       .
        jsr     LD36C                           ; DFD5 20 6C D3                  l.
        lda     #$00                            ; DFD8 A9 00                    ..
        sta     LC04C                           ; DFDA 8D 4C C0                 .L.
        .byte   $A9                             ; DFDD A9                       .
LDFDE:  .byte   $44                             ; DFDE 44                       D
        bit     LC209                           ; DFDF 2C 09 C2                 ,..
        bmi     LDFE6                           ; DFE2 30 02                    0.
        lda     #$53                            ; DFE4 A9 53                    .S
LDFE6:  jsr     LD62A                           ; DFE6 20 2A D6                  *.
        lda     #$2F                            ; DFE9 A9 2F                    ./
        jsr     LD62A                           ; DFEB 20 2A D6                  *.
        lda     LC206                           ; DFEE AD 06 C2                 ...
        ldx     #$01                            ; DFF1 A2 01                    ..
        jsr     LD750                           ; DFF3 20 50 D7                  P.
LDFF6:  lda     #$2F                            ; DFF6 A9 2F                    ./
        .byte   $20                             ; DFF8 20                        
LDFF9:  rol     a                               ; DFF9 2A                       *
        dec     $AD,x                           ; DFFA D6 AD                    ..
        .byte   $07                             ; DFFC 07                       .
        .byte   $C2                             ; DFFD C2                       .
        jsr     LD74E                           ; DFFE 20 4E D7                  N.
        lda     #$29                            ; E001 A9 29                    .)
        jsr     LD62A                           ; E003 20 2A D6                  *.
        nop                                     ; E006 EA                       .
        nop                                     ; E007 EA                       .
        nop                                     ; E008 EA                       .
        lda     #$20                            ; E009 A9 20                    . 
        sta     LC04C                           ; E00B 8D 4C C0                 .L.
        lda     LC204                           ; E00E AD 04 C2                 ...
        ldy     LC205                           ; E011 AC 05 C2                 ...
        ldx     #$02                            ; E014 A2 02                    ..
        jsr     LD758                           ; E016 20 58 D7                  X.
        plp                                     ; E019 28                       (
        ldx     #$08                            ; E01A A2 08                    ..
        jsr     LD36C                           ; E01C 20 6C D3                  l.
        bit     $02F1                           ; E01F 2C F1 02                 ,..
        bmi     LE030                           ; E022 30 0C                    0.
        lda     BASIC11_FLG                     ; E024 AD 6A 02                 .j.
        and     #$20                            ; E027 29 20                    ) 
        bne     LE030                           ; E029 D0 05                    ..
        lda     LC024                           ; E02B AD 24 C0                 .$.
        bpl     LE033                           ; E02E 10 03                    ..
LE030:  jmp     LD206                           ; E030 4C 06 D2                 L..

; ----------------------------------------------------------------------------
LE033:  rts                                     ; E033 60                       `

; ----------------------------------------------------------------------------
LE034:  jmp     LDE23                           ; E034 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        jsr     LE60D                           ; E037 20 0D E6                  ..
        bne     LE034                           ; E03A D0 F8                    ..
        ldx     #$09                            ; E03C A2 09                    ..
        jsr     LD34D                           ; E03E 20 4D D3                  M.
        sec                                     ; E041 38                       8
        bcs     LE04C                           ; E042 B0 08                    ..
        sec                                     ; E044 38                       8
        bit     $18                             ; E045 24 18                    $.
        php                                     ; E047 08                       .
        jsr     LD451                           ; E048 20 51 D4                  Q.
        plp                                     ; E04B 28                       (
LE04C:  ror     LC072                           ; E04C 6E 72 C0                 nr.
        jsr     LD9B0                           ; E04F 20 B0 D9                  ..
        bne     LE057                           ; E052 D0 03                    ..
        jmp     LE0DD                           ; E054 4C DD E0                 L..

; ----------------------------------------------------------------------------
LE057:  jsr     LD7A0                           ; E057 20 A0 D7                  ..
        bcc     LE073                           ; E05A 90 17                    ..
        jsr     LE264                           ; E05C 20 64 E2                  d.
        bcc     LE0A7                           ; E05F 90 46                    .F
LE061:  rts                                     ; E061 60                       `

; ----------------------------------------------------------------------------
LE062:  jsr     LD62A                           ; E062 20 2A D6                  *.
LE065:  jsr     LD206                           ; E065 20 06 D2                  ..
        jsr     LDB41                           ; E068 20 41 DB                  A.
LE06B:  ldx     LC027                           ; E06B AE 27 C0                 .'.
        jsr     LDB48                           ; E06E 20 48 DB                  H.
        beq     LE0A7                           ; E071 F0 34                    .4
LE073:  jsr     LDAB4                           ; E073 20 B4 DA                  ..
        bit     LC072                           ; E076 2C 72 C0                 ,r.
        bmi     LE09B                           ; E079 30 20                    0 
        ldx     #$0A                            ; E07B A2 0A                    ..
        jsr     LD36C                           ; E07D 20 6C D3                  l.
LE080:  jsr     LD302                           ; E080 20 02 D3                  ..
        jsr     LD3A1                           ; E083 20 A1 D3                  ..
        cmp     #$4E                            ; E086 C9 4E                    .N
        beq     LE062                           ; E088 F0 D8                    ..
        cmp     #$1B                            ; E08A C9 1B                    ..
        beq     LE061                           ; E08C F0 D3                    ..
        cmp     #$59                            ; E08E C9 59                    .Y
        bne     LE080                           ; E090 D0 EE                    ..
        jsr     LD62A                           ; E092 20 2A D6                  *.
        jsr     LD206                           ; E095 20 06 D2                  ..
        jsr     LDAB4                           ; E098 20 B4 DA                  ..
LE09B:  jsr     LE266                           ; E09B 20 66 E2                  f.
        bcs     LE065                           ; E09E B0 C5                    ..
        ldx     #$0B                            ; E0A0 A2 0B                    ..
        jsr     LD36C                           ; E0A2 20 6C D3                  l.
        bmi     LE06B                           ; E0A5 30 C4                    0.
LE0A7:  lda     #$00                            ; E0A7 A9 00                    ..
        sta     SEDORIC_TRAV3                   ; E0A9 85 F5                    ..
        lda     LE7D1                           ; E0AB AD D1 E7                 ...
        ldx     LE7D2                           ; E0AE AE D2 E7                 ...
        clc                                     ; E0B1 18                       .
        .byte   $24                             ; E0B2 24                       $
LE0B3:  sec                                     ; E0B3 38                       8
LE0B4:  sbc     #$0F                            ; E0B4 E9 0F                    ..
        inc     SEDORIC_TRAV3                   ; E0B6 E6 F5                    ..
        bcs     LE0B3                           ; E0B8 B0 F9                    ..
        dex                                     ; E0BA CA                       .
        bpl     LE0B3                           ; E0BB 10 F6                    ..
        ldx     LE7D3                           ; E0BD AE D3 E7                 ...
        cpx     SEDORIC_TRAV3                   ; E0C0 E4 F5                    ..
        beq     LE061                           ; E0C2 F0 9D                    ..
        dex                                     ; E0C4 CA                       .
        stx     SEDORIC_TRAV3                   ; E0C5 86 F5                    ..
        jsr     LE537                           ; E0C7 20 37 E5                  7.
        nop                                     ; E0CA EA                       .
        dec     SEDORIC_TRAV3                   ; E0CB C6 F5                    ..
        bne     LE0D5                           ; E0CD D0 06                    ..
        sta     LC05C                           ; E0CF 8D 5C C0                 .\.
        sty     LC05D                           ; E0D2 8C 5D C0                 .].
LE0D5:  jsr     LDA5D                           ; E0D5 20 5D DA                  ].
        lda     LC100                           ; E0D8 AD 00 C1                 ...
        .byte   $AC                             ; E0DB AC                       .
        .byte   $01                             ; E0DC 01                       .
LE0DD:  cmp     ($D0,x)                         ; E0DD C1 D0                    ..
        .byte   $EB                             ; E0DF EB                       .
LE0E0:  ldy     #$10                            ; E0E0 A0 10                    ..
        sty     SEDORIC_TRAV3                   ; E0E2 84 F5                    ..
LE0E4:  .byte   $20                             ; E0E4 20                        
LE0E5:  lda     $DB                             ; E0E5 A5 DB                    ..
        ldy     SEDORIC_TRAV3                   ; E0E7 A4 F5                    ..
        .byte   $CC                             ; E0E9 CC                       .
LE0EA:  .byte   $02                             ; E0EA 02                       .
        cmp     (BASIC11_INTERPRETER_VECTOR,x)  ; E0EB C1 F0                    ..
        .byte   $14                             ; E0ED 14                       .
        lda     LC100,y                         ; E0EE B9 00 C1                 ...
        sta     LC300,x                         ; E0F1 9D 00 C3                 ...
        iny                                     ; E0F4 C8                       .
        inx                                     ; E0F5 E8                       .
        stx     LC302                           ; E0F6 8E 02 C3                 ...
        .byte   $D0                             ; E0F9 D0                       .
LE0FA:  inc     LF584                           ; E0FA EE 84 F5                 ...
        jsr     LDA82                           ; E0FD 20 82 DA                  ..
        beq     LE0E4                           ; E100 F0 E2                    ..
        jsr     LDA82                           ; E102 20 82 DA                  ..
        dec     LE7D3                           ; E105 CE D3 E7                 ...
        lda     LC05C                           ; E108 AD 5C C0                 .\.
        ldy     LC05D                           ; E10B AC 5D C0                 .].
        jsr     LDA63                           ; E10E 20 63 DA                  c.
        lda     LC300                           ; E111 AD 00 C3                 ...
        pha                                     ; E114 48                       H
        lda     LC301                           ; E115 AD 01 C3                 ...
        pha                                     ; E118 48                       H
        lda     #$00                            ; E119 A9 00                    ..
        sta     LC300                           ; E11B 8D 00 C3                 ...
        sta     LC301                           ; E11E 8D 01 C3                 ...
        jsr     LDAA4                           ; E121 20 A4 DA                  ..
        pla                                     ; E124 68                       h
        tay                                     ; E125 A8                       .
        pla                                     ; E126 68                       h
        ldx     LE7D3                           ; E127 AE D3 E7                 ...
        cpx     #$01                            ; E12A E0 01                    ..
        bcc     LE131                           ; E12C 90 03                    ..
        jsr     LDD15                           ; E12E 20 15 DD                  ..
LE131:  jsr     LDA8A                           ; E131 20 8A DA                  ..
        jmp     LE4A7                           ; E134 4C A7 E4                 L..

; ----------------------------------------------------------------------------
        lda     LC027                           ; E137 AD 27 C0                 .'.
        pha                                     ; E13A 48                       H
        ldx     LC000                           ; E13B AE 00 C0                 ...
        lda     LF638,x                         ; E13E BD 38 F6                 .8.
        ldy     LF63C,x                         ; E141 BC 3C F6                 .<.
        jsr     LE576                           ; E144 20 76 E5                  v.
        adc     #$08                            ; E147 69 08                    i.
        tay                                     ; E149 A8                       .
        ldx     #$08                            ; E14A A2 08                    ..
LE14C:  lda     LC303,x                         ; E14C BD 03 C3                 ...
        cmp     LE6E5,y                         ; E14F D9 E5 E6                 ...
        bne     LE166                           ; E152 D0 12                    ..
        dey                                     ; E154 88                       .
        dex                                     ; E155 CA                       .
        bpl     LE14C                           ; E156 10 F4                    ..
        pla                                     ; E158 68                       h
        sta     LC027                           ; E159 8D 27 C0                 .'.
        ldx     LC000                           ; E15C AE 00 C0                 ...
        lda     LF638,x                         ; E15F BD 38 F6                 .8.
        ldy     LF63C,x                         ; E162 BC 3C F6                 .<.
        rts                                     ; E165 60                       `

; ----------------------------------------------------------------------------
LE166:  pla                                     ; E166 68                       h
        ldx     LC000                           ; E167 AE 00 C0                 ...
        ldy     #$04                            ; E16A A0 04                    ..
        tya                                     ; E16C 98                       .
        sta     LF63C,x                         ; E16D 9D 3C F6                 .<.
        lda     #$14                            ; E170 A9 14                    ..
        sta     LF638,x                         ; E172 9D 38 F6                 .8.
        rts                                     ; E175 60                       `

; ----------------------------------------------------------------------------
        jsr     LDA63                           ; E176 20 63 DA                  c.
        lda     LC000                           ; E179 AD 00 C0                 ...
        asl     a                               ; E17C 0A                       .
        asl     a                               ; E17D 0A                       .
        asl     a                               ; E17E 0A                       .
        adc     LC000                           ; E17F 6D 00 C0                 m..
        rts                                     ; E182 60                       `

; ----------------------------------------------------------------------------
        ldx     LC027                           ; E183 AE 27 C0                 .'.
        lda     LC30F,x                         ; E186 BD 0F C3                 ...
        rol     a                               ; E189 2A                       *
        rol     a                               ; E18A 2A                       *
        bmi     LE191                           ; E18B 30 04                    0.
        jsr     LE322                           ; E18D 20 22 E3                  ".
        rts                                     ; E190 60                       `

; ----------------------------------------------------------------------------
LE191:  ldy     #$08                            ; E191 A0 08                    ..
        jsr     LDAC3                           ; E193 20 C3 DA                  ..
        lda     #$D2                            ; E196 A9 D2                    ..
        ldy     #$E5                            ; E198 A0 E5                    ..
        jsr     LD637                           ; E19A 20 37 D6                  7.
        rts                                     ; E19D 60                       `

; ----------------------------------------------------------------------------
        stx     SEDORIC_TRAV7                   ; E19E 86 F9                    ..
        lda     LC30F,x                         ; E1A0 BD 0F C3                 ...
        rol     a                               ; E1A3 2A                       *
        rol     a                               ; E1A4 2A                       *
        bmi     LE1AC                           ; E1A5 30 05                    0.
        bit     $07                             ; E1A7 24 07                    $.
        jmp     LC4D7                           ; E1A9 4C D7 C4                 L..

; ----------------------------------------------------------------------------
LE1AC:  jsr     LDAB4                           ; E1AC 20 B4 DA                  ..
        lda     #$C5                            ; E1AF A9 C5                    ..
        ldy     #$E5                            ; E1B1 A0 E5                    ..
        jsr     LD637                           ; E1B3 20 37 D6                  7.
        jmp     LC57A                           ; E1B6 4C 7A C5                 Lz.

; ----------------------------------------------------------------------------
        stx     LC009                           ; E1B9 8E 09 C0                 ...
        ldy     #$2E                            ; E1BC A0 2E                    ..
        jsr     LE78A                           ; E1BE 20 8A E7                  ..
        .byte   $20                             ; E1C1 20                        
LE1C2:  .byte   $44                             ; E1C2 44                       D
        dec     $60                             ; E1C3 C6 60                    .`
        jsr     L4F4E                           ; E1C5 20 4E 4F                  NO
        .byte   $54                             ; E1C8 54                       T
        jsr     L4C41                           ; E1C9 20 41 4C                  AL
        jmp     L574F                           ; E1CC 4C 4F 57                 LOW

; ----------------------------------------------------------------------------
        eor     L0044                           ; E1CF 45 44                    ED
        brk                                     ; E1D1 00                       .
        jsr     L2020                           ; E1D2 20 20 20                    
        jsr     L5B20                           ; E1D5 20 20 5B                   [
        rol     a                               ; E1D8 2A                       *
        eor     a:$20,x                         ; E1D9 5D 20 00                 ] .
        lda     LE7D1                           ; E1DC AD D1 E7                 ...
        bne     LE1E4                           ; E1DF D0 03                    ..
        dec     LE7D2                           ; E1E1 CE D2 E7                 ...
LE1E4:  dec     LE7D1                           ; E1E4 CE D1 E7                 ...
        lda     LC204                           ; E1E7 AD 04 C2                 ...
        bne     LE1EF                           ; E1EA D0 03                    ..
        dec     LC205                           ; E1EC CE 05 C2                 ...
LE1EF:  dec     LC204                           ; E1EF CE 04 C2                 ...
        rts                                     ; E1F2 60                       `

; ----------------------------------------------------------------------------
        lda     #$C5                            ; E1F3 A9 C5                    ..
        ldy     #$E5                            ; E1F5 A0 E5                    ..
        jsr     LD637                           ; E1F7 20 37 D6                  7.
        sec                                     ; E1FA 38                       8
        rts                                     ; E1FB 60                       `

; ----------------------------------------------------------------------------
        jsr     LD451                           ; E1FC 20 51 D4                  Q.
        jsr     LDB2D                           ; E1FF 20 2D DB                  -.
        php                                     ; E202 08                       .
        lda     #$00                            ; E203 A9 00                    ..
        plp                                     ; E205 28                       (
        beq     LE20A                           ; E206 F0 02                    ..
        lda     #$01                            ; E208 A9 01                    ..
LE20A:  jmp     LD7D5                           ; E20A 4C D5 D7                 L..

; ----------------------------------------------------------------------------
        ldy     LC009                           ; E20D AC 09 C0                 ...
        jsr     LD39E                           ; E210 20 9E D3                  ..
        beq     LE222                           ; E213 F0 0D                    ..
        sbc     #$41                            ; E215 E9 41                    .A
        cmp     #$04                            ; E217 C9 04                    ..
        bcs     LE222                           ; E219 B0 07                    ..
        tay                                     ; E21B A8                       .
        jsr     LD7C0                           ; E21C 20 C0 D7                  ..
        jmp     LD398                           ; E21F 4C 98 D3                 L..

; ----------------------------------------------------------------------------
LE222:  jsr     LD7C0                           ; E222 20 C0 D7                  ..
        jmp     LD39E                           ; E225 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LE228:  jmp     LE0DD                           ; E228 4C DD E0                 L..

; ----------------------------------------------------------------------------
        jmp     LE2D2                           ; E22B 4C D2 E2                 L..

; ----------------------------------------------------------------------------
        lda     #$14                            ; E22E A9 14                    ..
        ldy     #$02                            ; E230 A0 02                    ..
        sty     $2F                             ; E232 84 2F                    ./
        rts                                     ; E234 60                       `

; ----------------------------------------------------------------------------
        ldy     #$03                            ; E235 A0 03                    ..
        jmp     LDC8B                           ; E237 4C 8B DC                 L..

; ----------------------------------------------------------------------------
        clc                                     ; E23A 18                       .
        bit     $38                             ; E23B 24 38                    $8
        pha                                     ; E23D 48                       H
        tya                                     ; E23E 98                       .
        pha                                     ; E23F 48                       H
        lda     LC001                           ; E240 AD 01 C0                 ...
        pha                                     ; E243 48                       H
        lda     LC002                           ; E244 AD 02 C0                 ...
        pha                                     ; E247 48                       H
        ldx     #$06                            ; E248 A2 06                    ..
        lda     LC202,x                         ; E24A BD 02 C2                 ...
        pha                                     ; E24D 48                       H
        dex                                     ; E24E CA                       .
        .byte   $10                             ; E24F 10                       .
LE250:  sbc     $08B0,y                         ; E250 F9 B0 08                 ...
        jsr     LE635                           ; E253 20 35 E6                  5.
        jsr     LDA4C                           ; E256 20 4C DA                  L.
        beq     LE267                           ; E259 F0 0C                    ..
        stx     $2F                             ; E25B 86 2F                    ./
        jsr     LDC89                           ; E25D 20 89 DC                  ..
        lda     #$14                            ; E260 A9 14                    ..
        ldy     #$03                            ; E262 A0 03                    ..
LE264:  .byte   $20                             ; E264 20                        
        .byte   $50                             ; E265 50                       P
LE266:  .byte   $DA                             ; E266 DA                       .
LE267:  ldx     #$00                            ; E267 A2 00                    ..
LE269:  pla                                     ; E269 68                       h
        sta     LC202,x                         ; E26A 9D 02 C2                 ...
        inx                                     ; E26D E8                       .
        cpx     #$07                            ; E26E E0 07                    ..
        bcc     LE269                           ; E270 90 F7                    ..
        pla                                     ; E272 68                       h
        sta     LC002                           ; E273 8D 02 C0                 ...
        pla                                     ; E276 68                       h
        sta     LC001                           ; E277 8D 01 C0                 ...
        pla                                     ; E27A 68                       h
        tay                                     ; E27B A8                       .
        pla                                     ; E27C 68                       h
        sec                                     ; E27D 38                       8
        rts                                     ; E27E 60                       `

; ----------------------------------------------------------------------------
LE27F:  ldx     #$00                            ; E27F A2 00                    ..
LE281:  lda     LC210,x                         ; E281 BD 10 C2                 ...
        bne     LE297                           ; E284 D0 11                    ..
        inx                                     ; E286 E8                       .
        cpx     #$F0                            ; E287 E0 F0                    ..
        bne     LE281                           ; E289 D0 F6                    ..
        bit     $2F                             ; E28B 24 2F                    $/
        bpl     LE292                           ; E28D 10 03                    ..
        jmp     LDC78                           ; E28F 4C 78 DC                 Lx.

; ----------------------------------------------------------------------------
LE292:  jsr     LE63C                           ; E292 20 3C E6                  <.
        bcs     LE27F                           ; E295 B0 E8                    ..
LE297:  lda     LC202                           ; E297 AD 02 C2                 ...
        bne     LE29F                           ; E29A D0 03                    ..
        dec     LC203                           ; E29C CE 03 C2                 ...
LE29F:  dec     LC202                           ; E29F CE 02 C2                 ...
        bit     $2F                             ; E2A2 24 2F                    $/
        bmi     LE2A9                           ; E2A4 30 03                    0.
        jmp     LDC90                           ; E2A6 4C 90 DC                 L..

; ----------------------------------------------------------------------------
LE2A9:  lda     #$60                            ; E2A9 A9 60                    .`
        sta     LDCA8                           ; E2AB 8D A8 DC                 ...
        jsr     LDC90                           ; E2AE 20 90 DC                  ..
        lda     #$A9                            ; E2B1 A9 A9                    ..
        sta     LDCA8                           ; E2B3 8D A8 DC                 ...
        txa                                     ; E2B6 8A                       .
        ldx     #$00                            ; E2B7 A2 00                    ..
        clc                                     ; E2B9 18                       .
        adc     #$F0                            ; E2BA 69 F0                    i.
        bcc     LE2BF                           ; E2BC 90 01                    ..
        inx                                     ; E2BE E8                       .
LE2BF:  stx     SEDORIC_TRAV1                   ; E2BF 86 F3                    ..
        jmp     LDCAD                           ; E2C1 4C AD DC                 L..

; ----------------------------------------------------------------------------
        ror     a                               ; E2C4 6A                       j
        ldx     SEDORIC_TRAV1                   ; E2C5 A6 F3                    ..
        bne     LE2CD                           ; E2C7 D0 04                    ..
        cmp     #$F0                            ; E2C9 C9 F0                    ..
        bcc     LE2DC                           ; E2CB 90 0F                    ..
LE2CD:  bit     $2F                             ; E2CD 24 2F                    $/
        bmi     LE2D4                           ; E2CF 30 03                    0.
        .byte   $20                             ; E2D1 20                        
LE2D2:  .byte   $3C                             ; E2D2 3C                       <
        .byte   $E6                             ; E2D3 E6                       .
LE2D4:  sec                                     ; E2D4 38                       8
        sbc     #$F0                            ; E2D5 E9 F0                    ..
LE2D7:  tax                                     ; E2D7 AA                       .
        sec                                     ; E2D8 38                       8
        jmp     LDD0E                           ; E2D9 4C 0E DD                 L..

; ----------------------------------------------------------------------------
LE2DC:  bit     $2F                             ; E2DC 24 2F                    $/
        bpl     LE2D7                           ; E2DE 10 F7                    ..
        jsr     LE63A                           ; E2E0 20 3A E6                  :.
        bcs     LE2D7                           ; E2E3 B0 F2                    ..
        brk                                     ; E2E5 00                       .
        brk                                     ; E2E6 00                       .
        brk                                     ; E2E7 00                       .
        brk                                     ; E2E8 00                       .
        brk                                     ; E2E9 00                       .
        brk                                     ; E2EA 00                       .
        brk                                     ; E2EB 00                       .
        brk                                     ; E2EC 00                       .
        brk                                     ; E2ED 00                       .
        brk                                     ; E2EE 00                       .
        brk                                     ; E2EF 00                       .
        brk                                     ; E2F0 00                       .
        brk                                     ; E2F1 00                       .
        brk                                     ; E2F2 00                       .
        brk                                     ; E2F3 00                       .
        brk                                     ; E2F4 00                       .
        brk                                     ; E2F5 00                       .
        brk                                     ; E2F6 00                       .
        brk                                     ; E2F7 00                       .
        brk                                     ; E2F8 00                       .
        brk                                     ; E2F9 00                       .
        brk                                     ; E2FA 00                       .
        brk                                     ; E2FB 00                       .
        brk                                     ; E2FC 00                       .
        brk                                     ; E2FD 00                       .
        brk                                     ; E2FE 00                       .
        brk                                     ; E2FF 00                       .
        brk                                     ; E300 00                       .
        brk                                     ; E301 00                       .
        brk                                     ; E302 00                       .
        brk                                     ; E303 00                       .
        brk                                     ; E304 00                       .
        brk                                     ; E305 00                       .
        brk                                     ; E306 00                       .
        brk                                     ; E307 00                       .
        brk                                     ; E308 00                       .
        brk                                     ; E309 00                       .
        brk                                     ; E30A 00                       .
        jsr     LE94D                           ; E30B 20 4D E9                  M.
        bcc     LE319                           ; E30E 90 09                    ..
        lda     V1T1L+1                         ; E310 AD 07 03                 ...
        sta     V1T1+1                          ; E313 8D 05 03                 ...
        lda     #$40                            ; E316 A9 40                    .@
        .byte   $2C                             ; E318 2C                       ,
LE319:  lda     #$00                            ; E319 A9 00                    ..
        sta     V1ACR                           ; E31B 8D 0B 03                 ...
        rts                                     ; E31E 60                       `

; ----------------------------------------------------------------------------
        jsr     LD27F                           ; E31F 20 7F D2                  ..
LE322:  php                                     ; E322 08                       .
        sei                                     ; E323 78                       x
        stx     V1DRA                           ; E324 8E 01 03                 ...
        lda     V1DRB                           ; E327 AD 00 03                 ...
        and     #$EF                            ; E32A 29 EF                    ).
        sta     V1DRB                           ; E32C 8D 00 03                 ...
        ora     #$10                            ; E32F 09 10                    ..
        sta     V1DRB                           ; E331 8D 00 03                 ...
        plp                                     ; E334 28                       (
        lda     #$02                            ; E335 A9 02                    ..
LE337:  bit     V1IFR                           ; E337 2C 0D 03                 ,..
        beq     LE337                           ; E33A F0 FB                    ..
        rts                                     ; E33C 60                       `

; ----------------------------------------------------------------------------
        jmp     LDE23                           ; E33D 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        ldy     #$03                            ; E340 A0 03                    ..
        bit     $06A0                           ; E342 2C A0 06                 ,..
        bit     $09A0                           ; E345 2C A0 09                 ,..
        bit     $0CA0                           ; E348 2C A0 0C                 ,..
        bit     $0FA0                           ; E34B 2C A0 0F                 ,..
        bit     $12A0                           ; E34E 2C A0 12                 ,..
        nop                                     ; E351 EA                       .
        nop                                     ; E352 EA                       .
        nop                                     ; E353 EA                       .
        nop                                     ; E354 EA                       .
        nop                                     ; E355 EA                       .
        nop                                     ; E356 EA                       .
        nop                                     ; E357 EA                       .
        nop                                     ; E358 EA                       .
        nop                                     ; E359 EA                       .
        ldx     #$65                            ; E35A A2 65                    .e
        jmp     LF15E                           ; E35C 4C 5E F1                 L^.

; ----------------------------------------------------------------------------
        nop                                     ; E35F EA                       .
        nop                                     ; E360 EA                       .
        nop                                     ; E361 EA                       .
        nop                                     ; E362 EA                       .
        nop                                     ; E363 EA                       .
        nop                                     ; E364 EA                       .
        nop                                     ; E365 EA                       .
        nop                                     ; E366 EA                       .
        nop                                     ; E367 EA                       .
        nop                                     ; E368 EA                       .
        nop                                     ; E369 EA                       .
        nop                                     ; E36A EA                       .
        nop                                     ; E36B EA                       .
        nop                                     ; E36C EA                       .
        nop                                     ; E36D EA                       .
        nop                                     ; E36E EA                       .
        nop                                     ; E36F EA                       .
        ldy     #$03                            ; E370 A0 03                    ..
        bit     $06A0                           ; E372 2C A0 06                 ,..
        bit     $09A0                           ; E375 2C A0 09                 ,..
        bit     $0CA0                           ; E378 2C A0 0C                 ,..
        nop                                     ; E37B EA                       .
        nop                                     ; E37C EA                       .
        nop                                     ; E37D EA                       .
        nop                                     ; E37E EA                       .
        nop                                     ; E37F EA                       .
        nop                                     ; E380 EA                       .
        nop                                     ; E381 EA                       .
        nop                                     ; E382 EA                       .
        nop                                     ; E383 EA                       .
        nop                                     ; E384 EA                       .
        nop                                     ; E385 EA                       .
        nop                                     ; E386 EA                       .
        nop                                     ; E387 EA                       .
        nop                                     ; E388 EA                       .
        nop                                     ; E389 EA                       .
        ldx     #$6A                            ; E38A A2 6A                    .j
        jmp     LF15E                           ; E38C 4C 5E F1                 L^.

; ----------------------------------------------------------------------------
        nop                                     ; E38F EA                       .
        nop                                     ; E390 EA                       .
        nop                                     ; E391 EA                       .
        nop                                     ; E392 EA                       .
        nop                                     ; E393 EA                       .
        nop                                     ; E394 EA                       .
        nop                                     ; E395 EA                       .
        beq     LE39E                           ; E396 F0 06                    ..
        jsr     LD216                           ; E398 20 16 D2                  ..
        jmp     LD2E2                           ; E39B 4C E2 D2                 L..

; ----------------------------------------------------------------------------
LE39E:  lda     V1T1                            ; E39E AD 04 03                 ...
        ldy     V1T1+1                          ; E3A1 AC 05 03                 ...
        sta     $D0                             ; E3A4 85 D0                    ..
        sty     $D1                             ; E3A6 84 D1                    ..
        lda     V1T2                            ; E3A8 AD 08 03                 ...
        ldy     V1T2+1                          ; E3AB AC 09 03                 ...
        sta     $D2                             ; E3AE 85 D2                    ..
        sty     $D3                             ; E3B0 84 D3                    ..
        jmp     LE79B                           ; E3B2 4C 9B E7                 L..

; ----------------------------------------------------------------------------
LE3B5:  jmp     LDE23                           ; E3B5 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        bne     LE3B5                           ; E3B8 D0 FB                    ..
        sei                                     ; E3BA 78                       x
        lda     #$00                            ; E3BB A9 00                    ..
        jmp     L04AD                           ; E3BD 4C AD 04                 L..

; ----------------------------------------------------------------------------
        jsr     LE94D                           ; E3C0 20 4D E9                  M.
        bcc     LE3D6                           ; E3C3 90 11                    ..
        ldy     LC024                           ; E3C5 AC 24 C0                 .$.
        bne     LE3CD                           ; E3C8 D0 03                    ..
        ror     $02F1                           ; E3CA 6E F1 02                 n..
LE3CD:  jmp     LD1BC                           ; E3CD 4C BC D1                 L..

; ----------------------------------------------------------------------------
        brk                                     ; E3D0 00                       .
        brk                                     ; E3D1 00                       .
        brk                                     ; E3D2 00                       .
        brk                                     ; E3D3 00                       .
        brk                                     ; E3D4 00                       .
        brk                                     ; E3D5 00                       .
LE3D6:  jmp     LD1C4                           ; E3D6 4C C4 D1                 L..

; ----------------------------------------------------------------------------
        php                                     ; E3D9 08                       .
        ldx     $9A                             ; E3DA A6 9A                    ..
        ldy     $9B                             ; E3DC A4 9B                    ..
        plp                                     ; E3DE 28                       (
        beq     LE3EB                           ; E3DF F0 0A                    ..
        jsr     LD2FA                           ; E3E1 20 FA D2                  ..
        jsr     LD19C                           ; E3E4 20 9C D1                  ..
        ldx     $CE                             ; E3E7 A6 CE                    ..
        ldy     $CF                             ; E3E9 A4 CF                    ..
LE3EB:  txa                                     ; E3EB 8A                       .
        bne     LE3EF                           ; E3EC D0 01                    ..
        dey                                     ; E3EE 88                       .
LE3EF:  dex                                     ; E3EF CA                       .
        stx     $B0                             ; E3F0 86 B0                    ..
        sty     $B1                             ; E3F2 84 B1                    ..
        rts                                     ; E3F4 60                       `

; ----------------------------------------------------------------------------
        bne     LE3B5                           ; E3F5 D0 BE                    ..
        lda     $043E                           ; E3F7 AD 3E 04                 .>.
        ldy     $043F                           ; E3FA AC 3F 04                 .?.
        sta     BASIC11_INTERPRETER_VECTOR      ; E3FD 85 F0                    ..
        sty     BASIC11_INTERPRETER_VECTOR+1    ; E3FF 84 F1                    ..
        php                                     ; E401 08                       .
        sei                                     ; E402 78                       x
        bit     LC024                           ; E403 2C 24 C0                 ,$.
        bpl     LE428                           ; E406 10 20                    . 
        lda     #$22                            ; E408 A9 22                    ."
        ldy     #$EE                            ; E40A A0 EE                    ..
        sta     BASIC11_IRQ_VECTOR              ; E40C 8D 45 02                 .E.
        sty     BASIC11_IRQ_VECTOR+1            ; E40F 8C 46 02                 .F.
        lda     #$78                            ; E412 A9 78                    .x
        ldy     #$EB                            ; E414 A0 EB                    ..
        sta     BASIC11_KEYBOARD_GET_VECTOR     ; E416 8D 3C 02                 .<.
        sty     BASIC11_KEYBOARD_GET_VECTOR+1   ; E419 8C 3D 02                 .=.
        lda     #$B2                            ; E41C A9 B2                    ..
        .byte   $A0                             ; E41E A0                       .
LE41F:  sed                                     ; E41F F8                       .
        sta     BASIC11_X                       ; E420 8D 48 02                 .H.
        sty     BASIC11_X+1                     ; E423 8C 49 02                 .I.
        plp                                     ; E426 28                       (
        rts                                     ; E427 60                       `

; ----------------------------------------------------------------------------
LE428:  lda     #$03                            ; E428 A9 03                    ..
        ldy     #$EC                            ; E42A A0 EC                    ..
        sta     BASIC10_IRQ_VECTOR              ; E42C 8D 29 02                 .).
        sty     BASIC10_IRQ_VECTOR+1            ; E42F 8C 2A 02                 .*.
        lda     #$30                            ; E432 A9 30                    .0
        ldy     #$F4                            ; E434 A0 F4                    ..
        sta     BASIC10_IRQ2_VECTOR             ; E436 8D 2C 02                 .,.
        sty     BASIC10_IRQ2_VECTOR+1           ; E439 8C 2D 02                 .-.
        plp                                     ; E43C 28                       (
        rts                                     ; E43D 60                       `

; ----------------------------------------------------------------------------
        lda     LC013                           ; E43E AD 13 C0                 ...
        ldy     LC014                           ; E441 AC 14 C0                 ...
        sta     $E9                             ; E444 85 E9                    ..
        sty     $EA                             ; E446 84 EA                    ..
        lda     LC011                           ; E448 AD 11 C0                 ...
        ldy     LC012                           ; E44B AC 12 C0                 ...
        sta     $A8                             ; E44E 85 A8                    ..
        sty     $A9                             ; E450 84 A9                    ..
        rts                                     ; E452 60                       `

; ----------------------------------------------------------------------------
        .byte   $20                             ; E453 20                        
        .byte   $5C                             ; E454 5C                       \
LE455:  .byte   $D2                             ; E455 D2                       .
        jsr     LD224                           ; E456 20 24 D2                  $.
LE459:  jsr     LD274                           ; E459 20 74 D2                  t.
        cmp     #$44                            ; E45C C9 44                    .D
        bcs     LE49A                           ; E45E B0 3A                    .:
        tax                                     ; E460 AA                       .
        tay                                     ; E461 A8                       .
        dey                                     ; E462 88                       .
LE463:  lda     ($91),y                         ; E463 B1 91                    ..
        sta     $35,y                           ; E465 99 35 00                 .5.
        dey                                     ; E468 88                       .
        bpl     LE463                           ; E469 10 F8                    ..
LE46B:  iny                                     ; E46B C8                       .
        lda     LCD10,y                         ; E46C B9 10 CD                 ...
        sta     $35,x                           ; E46F 95 35                    .5
        inx                                     ; E471 E8                       .
        cpy     #$0A                            ; E472 C0 0A                    ..
        bne     LE46B                           ; E474 D0 F5                    ..
        lda     $E9                             ; E476 A5 E9                    ..
        ldy     $EA                             ; E478 A4 EA                    ..
        sta     LC013                           ; E47A 8D 13 C0                 ...
        sty     LC014                           ; E47D 8C 14 C0                 ...
        lda     $A8                             ; E480 A5 A8                    ..
        ldy     $A9                             ; E482 A4 A9                    ..
        sta     LC011                           ; E484 8D 11 C0                 ...
        sty     LC012                           ; E487 8C 12 C0                 ...
        lda     #$34                            ; E48A A9 34                    .4
        ldy     #$00                            ; E48C A0 00                    ..
        ldx     #$3A                            ; E48E A2 3A                    .:
        sta     $E9                             ; E490 85 E9                    ..
        sty     $EA                             ; E492 84 EA                    ..
        stx     $34                             ; E494 86 34                    .4
        dey                                     ; E496 88                       .
        sty     $A9                             ; E497 84 A9                    ..
        rts                                     ; E499 60                       `

; ----------------------------------------------------------------------------
LE49A:  jmp     LE977                           ; E49A 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
        jsr     LD25C                           ; E49D 20 5C D2                  \.
        jsr     LD238                           ; E4A0 20 38 D2                  8.
        jsr     LD274                           ; E4A3 20 74 D2                  t.
        .byte   $C9                             ; E4A6 C9                       .
LE4A7:  bvc     LE459                           ; E4A7 50 B0                    P.
        beq     LE455                           ; E4A9 F0 AA                    ..
        tay                                     ; E4AB A8                       .
LE4AC:  lda     ($91),y                         ; E4AC B1 91                    ..
        sta     $35,y                           ; E4AE 99 35 00                 .5.
        dey                                     ; E4B1 88                       .
        bpl     LE4AC                           ; E4B2 10 F8                    ..
        iny                                     ; E4B4 C8                       .
        sty     $35,x                           ; E4B5 94 35                    .5
        lda     $E9                             ; E4B7 A5 E9                    ..
        pha                                     ; E4B9 48                       H
        lda     #$35                            ; E4BA A9 35                    .5
        sta     $E9                             ; E4BC 85 E9                    ..
        jsr     LD194                           ; E4BE 20 94 D1                  ..
        pla                                     ; E4C1 68                       h
        sta     $E9                             ; E4C2 85 E9                    ..
        tya                                     ; E4C4 98                       .
        sec                                     ; E4C5 38                       8
        sbc     #$05                            ; E4C6 E9 05                    ..
        jsr     LD264                           ; E4C8 20 64 D2                  d.
        ldy     $D0                             ; E4CB A4 D0                    ..
        nop                                     ; E4CD EA                       .
LE4CE:  lda     $35,y                           ; E4CE B9 35 00                 .5.
        sta     ($D1),y                         ; E4D1 91 D1                    ..
        dey                                     ; E4D3 88                       .
        bpl     LE4CE                           ; E4D4 10 F8                    ..
        ldy     #$02                            ; E4D6 A0 02                    ..
LE4D8:  lda     $D0,y                           ; E4D8 B9 D0 00                 ...
        sta     ($B6),y                         ; E4DB 91 B6                    ..
        dey                                     ; E4DD 88                       .
        bpl     LE4D8                           ; E4DE 10 F8                    ..
LE4E0:  rts                                     ; E4E0 60                       `

; ----------------------------------------------------------------------------
        jsr     LD238                           ; E4E1 20 38 D2                  8.
        jsr     LD274                           ; E4E4 20 74 D2                  t.
        tax                                     ; E4E7 AA                       .
        beq     LE4E0                           ; E4E8 F0 F6                    ..
        sta     SEDORIC_TRAV1                   ; E4EA 85 F3                    ..
        ldx     #$00                            ; E4EC A2 00                    ..
        ldy     #$00                            ; E4EE A0 00                    ..
        lda     #$E9                            ; E4F0 A9 E9                    ..
        sta     $16                             ; E4F2 85 16                    ..
        lda     #$C0                            ; E4F4 A9 C0                    ..
        sta     $17                             ; E4F6 85 17                    ..
        sty     SEDORIC_TRAV0                   ; E4F8 84 F2                    ..
        lda     ($91),y                         ; E4FA B1 91                    ..
        bpl     LE529                           ; E4FC 10 2B                    .+
        and     #$7F                            ; E4FE 29 7F                    ).
        beq     LE515                           ; E500 F0 13                    ..
        sta     $26                             ; E502 85 26                    .&
        ldy     #$00                            ; E504 A0 00                    ..
LE506:  inc     $16                             ; E506 E6 16                    ..
        bne     LE50C                           ; E508 D0 02                    ..
        inc     $17                             ; E50A E6 17                    ..
LE50C:  jsr     DO_EXEVEC                       ; E50C 20 53 04                  S.
        bpl     LE506                           ; E50F 10 F5                    ..
        dec     $26                             ; E511 C6 26                    .&
        bne     LE506                           ; E513 D0 F1                    ..
LE515:  ldy     #$01                            ; E515 A0 01                    ..
LE517:  inx                                     ; E517 E8                       .
        beq     LE538                           ; E518 F0 1E                    ..
        jsr     DO_EXEVEC                       ; E51A 20 53 04                  S.
        php                                     ; E51D 08                       .
        and     #$7F                            ; E51E 29 7F                    ).
        sta     LC0FF,x                         ; E520 9D FF C0                 ...
        iny                                     ; E523 C8                       .
        plp                                     ; E524 28                       (
        bpl     LE517                           ; E525 10 F0                    ..
        bmi     LE52F                           ; E527 30 06                    0.
LE529:  inx                                     ; E529 E8                       .
        beq     LE538                           ; E52A F0 0C                    ..
        sta     LC0FF,x                         ; E52C 9D FF C0                 ...
LE52F:  dec     SEDORIC_TRAV1                   ; E52F C6 F3                    ..
        beq     LE53B                           ; E531 F0 08                    ..
        ldy     SEDORIC_TRAV0                   ; E533 A4 F2                    ..
        iny                                     ; E535 C8                       .
        .byte   $D0                             ; E536 D0                       .
LE537:  clv                                     ; E537 B8                       .
LE538:  jmp     LE977                           ; E538 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
LE53B:  txa                                     ; E53B 8A                       .
        jsr     LD264                           ; E53C 20 64 D2                  d.
        ldy     $D0                             ; E53F A4 D0                    ..
LE541:  dey                                     ; E541 88                       .
        lda     LC100,y                         ; E542 B9 00 C1                 ...
        sta     ($D1),y                         ; E545 91 D1                    ..
        tya                                     ; E547 98                       .
        bne     LE541                           ; E548 D0 F7                    ..
        jmp     LE8D6                           ; E54A 4C D6 E8                 L..

; ----------------------------------------------------------------------------
        ldy     #$02                            ; E54D A0 02                    ..
LE54F:  lda     ($E9),y                         ; E54F B1 E9                    ..
        and     #$DF                            ; E551 29 DF                    ).
        cmp     LCD2E,y                         ; E553 D9 2E CD                 ...
        bne     LE55D                           ; E556 D0 05                    ..
        dey                                     ; E558 88                       .
        bpl     LE54F                           ; E559 10 F4                    ..
        .byte   $30                             ; E55B 30                       0
LE55C:  .byte   $0F                             ; E55C 0F                       .
LE55D:  ldy     #$02                            ; E55D A0 02                    ..
LE55F:  lda     ($E9),y                         ; E55F B1 E9                    ..
        and     #$DF                            ; E561 29 DF                    ).
        cmp     LCD2B,y                         ; E563 D9 2B CD                 .+.
        bne     LE574                           ; E566 D0 0C                    ..
        dey                                     ; E568 88                       .
        bpl     LE55F                           ; E569 10 F4                    ..
        clc                                     ; E56B 18                       .
        php                                     ; E56C 08                       .
        ldy     #$03                            ; E56D A0 03                    ..
        jsr     LD1E3                           ; E56F 20 E3 D1                  ..
        plp                                     ; E572 28                       (
        rts                                     ; E573 60                       `

; ----------------------------------------------------------------------------
LE574:  .byte   $4C                             ; E574 4C                       L
        .byte   $23                             ; E575 23                       #
LE576:  dec     $12A2,x                         ; E576 DE A2 12                 ...
        jmp     LD67E                           ; E579 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LE57C:  jmp     LDE20                           ; E57C 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        jsr     LE94D                           ; E57F 20 4D E9                  M.
        .byte   $A9                             ; E582 A9                       .
LE583:  brk                                     ; E583 00                       .
        sta     LC01C                           ; E584 8D 1C C0                 ...
        sta     LC01B                           ; E587 8D 1B C0                 ...
        ror     a                               ; E58A 6A                       j
        sta     LC018                           ; E58B 8D 18 C0                 ...
        ldy     #$37                            ; E58E A0 37                    .7
        ldx     #$FF                            ; E590 A2 FF                    ..
        sty     LC019                           ; E592 8C 19 C0                 ...
        stx     LC01A                           ; E595 8E 1A C0                 ...
        rts                                     ; E598 60                       `

; ----------------------------------------------------------------------------
        jsr     LD2FA                           ; E599 20 FA D2                  ..
        sta     LC01C                           ; E59C 8D 1C C0                 ...
        sty     LC01B                           ; E59F 8C 1B C0                 ...
        jsr     LD19C                           ; E5A2 20 9C D1                  ..
        ldx     $CF                             ; E5A5 A6 CF                    ..
        ldy     $CE                             ; E5A7 A4 CE                    ..
        bne     LE5AC                           ; E5A9 D0 01                    ..
        dex                                     ; E5AB CA                       .
LE5AC:  dey                                     ; E5AC 88                       .
        jmp     LE992                           ; E5AD 4C 92 E9                 L..

; ----------------------------------------------------------------------------
        jsr     LD27F                           ; E5B0 20 7F D2                  ..
        cpx     #$32                            ; E5B3 E0 32                    .2
        bcc     LE57C                           ; E5B5 90 C5                    ..
        dex                                     ; E5B7 CA                       .
        .byte   $4C                             ; E5B8 4C                       L
LE5B9:  ror     LF0D6,x                         ; E5B9 7E D6 F0                 ~..
        asl     $A9                             ; E5BC 06 A9                    ..
        bcc     LE5E0                           ; E5BE 90 20                    . 
        rol     LC8D2                           ; E5C0 2E D2 C8                 ...
        php                                     ; E5C3 08                       .
        lda     LC021                           ; E5C4 AD 21 C0                 .!.
        ldy     LC022                           ; E5C7 AC 22 C0                 .".
        sta     $E9                             ; E5CA 85 E9                    ..
        sty     $EA                             ; E5CC 84 EA                    ..
        lda     NOLIGN                          ; E5CE AD FE 04                 ...
        ldy     NOLIGN+1                        ; E5D1 AC FF 04                 ...
        sta     $A8                             ; E5D4 85 A8                    ..
        sty     $A9                             ; E5D6 84 A9                    ..
        plp                                     ; E5D8 28                       (
        beq     LE5DE                           ; E5D9 F0 03                    ..
        .byte   $4C                             ; E5DB 4C                       L
LE5DC:  .byte   $DC                             ; E5DC DC                       .
        .byte   $D1                             ; E5DD D1                       .
LE5DE:  dec     $EA                             ; E5DE C6 EA                    ..
LE5E0:  ldy     #$FF                            ; E5E0 A0 FF                    ..
        lda     ($E9),y                         ; E5E2 B1 E9                    ..
        cmp     #$3A                            ; E5E4 C9 3A                    .:
        beq     LE5EA                           ; E5E6 F0 02                    ..
        ldy     #$FB                            ; E5E8 A0 FB                    ..
LE5EA:  jmp     LD1E3                           ; E5EA 4C E3 D1                 L..

; ----------------------------------------------------------------------------
        ldy     #$03                            ; E5ED A0 03                    ..
        bit     $51A0                           ; E5EF 2C A0 51                 ,.Q
        .byte   $2C                             ; E5F2 2C                       ,
LE5F3:  ldy     #$54                            ; E5F3 A0 54                    .T
        bit     $57A0                           ; E5F5 2C A0 57                 ,.W
        bit     $5AA0                           ; E5F8 2C A0 5A                 ,.Z
        bit     $5DA0                           ; E5FB 2C A0 5D                 ,.]
        bit     $79A0                           ; E5FE 2C A0 79                 ,.y
        ldx     #$60                            ; E601 A2 60                    .`
        jmp     LF15E                           ; E603 4C 5E F1                 L^.

; ----------------------------------------------------------------------------
        ldy     #$02                            ; E606 A0 02                    ..
        lda     LC00A                           ; E608 AD 0A C0                 ...
        .byte   $8D                             ; E60B 8D                       .
        brk                                     ; E60C 00                       .
LE60D:  cpy     #$A9                            ; E60D C0 A9                    ..
        brk                                     ; E60F 00                       .
        jsr     LDA60                           ; E610 20 60 DA                  `.
        ldx     LC216                           ; E613 AE 16 C2                 ...
        bne     LE61D                           ; E616 D0 05                    ..
        ldx     LC2DA                           ; E618 AE DA C2                 ...
        cpx     #$34                            ; E61B E0 34                    .4
LE61D:  rts                                     ; E61D 60                       `

; ----------------------------------------------------------------------------
        pha                                     ; E61E 48                       H
        lda     #$20                            ; E61F A9 20                    . 
        and     V1DRB                           ; E621 2D 00 03                 -..
        sta     LEA2B                           ; E624 8D 2B EA                 .+.
        pla                                     ; E627 68                       h
        and     #$DF                            ; E628 29 DF                    ).
        ora     #$00                            ; E62A 09 00                    ..
        .byte   $8D                             ; E62C 8D                       .
        brk                                     ; E62D 00                       .
LE62E:  .byte   $03                             ; E62E 03                       .
        rts                                     ; E62F 60                       `

; ----------------------------------------------------------------------------
        inx                                     ; E630 E8                       .
        stx     SEDORIC_TRAV0                   ; E631 86 F2                    ..
        ldx     #$3F                            ; E633 A2 3F                    .?
LE635:  rts                                     ; E635 60                       `

; ----------------------------------------------------------------------------
        stx     $30                             ; E636 86 30                    .0
        .byte   $4C                             ; E638 4C                       L
        .byte   $3E                             ; E639 3E                       >
LE63A:  .byte   $D7                             ; E63A D7                       .
        .byte   $20                             ; E63B 20                        
LE63C:  sec                                     ; E63C 38                       8
        .byte   $D2                             ; E63D D2                       .
        sta     $B8                             ; E63E 85 B8                    ..
        sty     $B9                             ; E640 84 B9                    ..
        lda     $28                             ; E642 A5 28                    .(
        pha                                     ; E644 48                       H
        lda     $29                             ; E645 A5 29                    .)
        pha                                     ; E647 48                       H
        jsr     LD22C                           ; E648 20 2C D2                  ,.
        jsr     LD238                           ; E64B 20 38 D2                  8.
        sta     $91                             ; E64E 85 91                    ..
        sty     $92                             ; E650 84 92                    ..
        pla                                     ; E652 68                       h
        cmp     $29                             ; E653 C5 29                    .)
        bne     LE677                           ; E655 D0 20                    . 
        pla                                     ; E657 68                       h
        cmp     $28                             ; E658 C5 28                    .(
        bne     LE677                           ; E65A D0 1B                    ..
        ldy     #$01                            ; E65C A0 01                    ..
        bit     $28                             ; E65E 24 28                    $(
        bmi     LE668                           ; E660 30 06                    0.
        bit     $29                             ; E662 24 29                    $)
        bmi     LE669                           ; E664 30 03                    0.
        iny                                     ; E666 C8                       .
        iny                                     ; E667 C8                       .
LE668:  iny                                     ; E668 C8                       .
LE669:  lda     ($91),y                         ; E669 B1 91                    ..
        tax                                     ; E66B AA                       .
        lda     ($B8),y                         ; E66C B1 B8                    ..
        sta     ($91),y                         ; E66E 91 91                    ..
        txa                                     ; E670 8A                       .
        sta     ($B8),y                         ; E671 91 B8                    ..
        dey                                     ; E673 88                       .
        bpl     LE669                           ; E674 10 F3                    ..
        rts                                     ; E676 60                       `

; ----------------------------------------------------------------------------
LE677:  ldx     #$0B                            ; E677 A2 0B                    ..
        jmp     LD67E                           ; E679 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LE67C:  jmp     LDE20                           ; E67C 4C 20 DE                 L .

; ----------------------------------------------------------------------------
LE67F:  jsr     LD27F                           ; E67F 20 7F D2                  ..
        txa                                     ; E682 8A                       .
        cmp     #$04                            ; E683 C9 04                    ..
        bcs     LE67C                           ; E685 B0 F5                    ..
        asl     a                               ; E687 0A                       .
        adc     $D4                             ; E688 65 D4                    e.
        sta     SEDORIC_TRAV4                   ; E68A 85 F6                    ..
        tax                                     ; E68C AA                       .
        lda     LC068,x                         ; E68D BD 68 C0                 .h.
        sta     SEDORIC_TRAV5                   ; E690 85 F7                    ..
        lda     #$00                            ; E692 A9 00                    ..
        ldx     #$03                            ; E694 A2 03                    ..
LE696:  sta     SEDORIC_TRAV0,x                 ; E696 95 F2                    ..
        dex                                     ; E698 CA                       .
        bpl     LE696                           ; E699 10 FB                    ..
LE69B:  jsr     LD39E                           ; E69B 20 9E D3                  ..
        cmp     #$2C                            ; E69E C9 2C                    .,
        bne     LE6E8                           ; E6A0 D0 46                    .F
        jsr     LD398                           ; E6A2 20 98 D3                  ..
        ldy     #$04                            ; E6A5 A0 04                    ..
LE6A7:  cmp     LCD83,y                         ; E6A7 D9 83 CD                 ...
        beq     LE6B1                           ; E6AA F0 05                    ..
        dey                                     ; E6AC 88                       .
        bpl     LE6A7                           ; E6AD 10 F8                    ..
        bmi     LE6E8                           ; E6AF 30 37                    07
LE6B1:  jsr     LD398                           ; E6B1 20 98 D3                  ..
        cpy     #$04                            ; E6B4 C0 04                    ..
        bne     LE6DA                           ; E6B6 D0 22                    ."
        jsr     LD2FA                           ; E6B8 20 FA D2                  ..
        ldx     SEDORIC_TRAV4                   ; E6BB A6 F6                    ..
        sta     LC067,x                         ; E6BD 9D 67 C0                 .g.
        tya                                     ; E6C0 98                       .
        sta     LC066,x                         ; E6C1 9D 66 C0                 .f.
LE6C4:  jsr     LD39E                           ; E6C4 20 9E D3                  ..
        beq     LE6D3                           ; E6C7 F0 0A                    ..
        jsr     LD22C                           ; E6C9 20 2C D2                  ,.
        lda     #$4F                            ; E6CC A9 4F                    .O
        jsr     LD22E                           ; E6CE 20 2E D2                  ..
        ldx     #$80                            ; E6D1 A2 80                    ..
LE6D3:  txa                                     ; E6D3 8A                       .
        ldx     SEDORIC_TRAV4                   ; E6D4 A6 F6                    ..
        sta     LC068,x                         ; E6D6 9D 68 C0                 .h.
        rts                                     ; E6D9 60                       `

; ----------------------------------------------------------------------------
LE6DA:  tya                                     ; E6DA 98                       .
        pha                                     ; E6DB 48                       H
        jsr     LD27F                           ; E6DC 20 7F D2                  ..
        pla                                     ; E6DF 68                       h
        tay                                     ; E6E0 A8                       .
        stx     SEDORIC_TRAV0,y                 ; E6E1 96 F2                    ..
        .byte   $20                             ; E6E3 20                        
        .byte   $9E                             ; E6E4 9E                       .
LE6E5:  .byte   $D3                             ; E6E5 D3                       .
        bne     LE69B                           ; E6E6 D0 B3                    ..
LE6E8:  ldy     SEDORIC_TRAV2                   ; E6E8 A4 F4                    ..
        lda     SEDORIC_TRAV3                   ; E6EA A5 F5                    ..
        pha                                     ; E6EC 48                       H
        ldx     SEDORIC_TRAV4                   ; E6ED A6 F6                    ..
        lda     LC066,x                         ; E6EF BD 66 C0                 .f.
        sta     EXEVEC+1                        ; E6F2 8D F0 04                 ...
        lda     LC067,x                         ; E6F5 BD 67 C0                 .g.
        sta     EXEVEC+2                        ; E6F8 8D F1 04                 ...
        lda     SEDORIC_TRAV0                   ; E6FB A5 F2                    ..
        ldx     SEDORIC_TRAV1                   ; E6FD A6 F3                    ..
        bit     L0000                           ; E6FF 24 00                    $.
        brk                                     ; E701 00                       .
        .byte   $07                             ; E702 07                       .
        plp                                     ; E703 28                       (
        jsr     LEB22                           ; E704 20 22 EB                  ".
        jmp     LEB0E                           ; E707 4C 0E EB                 L..

; ----------------------------------------------------------------------------
        plp                                     ; E70A 28                       (
        jsr     L0471                           ; E70B 20 71 04                  q.
        pha                                     ; E70E 48                       H
        php                                     ; E70F 08                       .
        txa                                     ; E710 8A                       .
        pha                                     ; E711 48                       H
        tya                                     ; E712 98                       .
        jsr     LD7CF                           ; E713 20 CF D7                  ..
        pla                                     ; E716 68                       h
        jsr     LD7CC                           ; E717 20 CC D7                  ..
        pla                                     ; E71A 68                       h
        jsr     LD7D2                           ; E71B 20 D2 D7                  ..
        pla                                     ; E71E 68                       h
        jmp     LD7C9                           ; E71F 4C C9 D7                 L..

; ----------------------------------------------------------------------------
        jmp     (EXEVEC+1)                      ; E722 6C F0 04                 l..

; ----------------------------------------------------------------------------
        inc     LC20B                           ; E725 EE 0B C2                 ...
        bne     LE72D                           ; E728 D0 03                    ..
        inc     LC20C                           ; E72A EE 0C C2                 ...
LE72D:  ldy     #$F4                            ; E72D A0 F4                    ..
LE72F:  lda     $BF35,y                         ; E72F B9 35 BF                 .5.
        cmp     #$3F                            ; E732 C9 3F                    .?
        beq     LE73B                           ; E734 F0 05                    ..
        .byte   $DD                             ; E736 DD                       .
        brk                                     ; E737 00                       .
LE738:  .byte   $C3                             ; E738 C3                       .
        bne     LE743                           ; E739 D0 08                    ..
LE73B:  inx                                     ; E73B E8                       .
        iny                                     ; E73C C8                       .
        bne     LE72F                           ; E73D D0 F0                    ..
        ldx     LC027                           ; E73F AE 27 C0                 .'.
        rts                                     ; E742 60                       `

; ----------------------------------------------------------------------------
LE743:  jmp     LDB41                           ; E743 4C 41 DB                 LA.

; ----------------------------------------------------------------------------
        iny                                     ; E746 C8                       .
        inx                                     ; E747 E8                       .
        cpx     #$08                            ; E748 E0 08                    ..
        beq     LE74E                           ; E74A F0 02                    ..
        bne     LE738                           ; E74C D0 EA                    ..
LE74E:  lda     #$3E                            ; E74E A9 3E                    .>
        sta     LD9E2,x                         ; E750 9D E2 D9                 ...
        inx                                     ; E753 E8                       .
        lda     #$00                            ; E754 A9 00                    ..
        sta     LD9E2,x                         ; E756 9D E2 D9                 ...
        lda     #$E0                            ; E759 A9 E0                    ..
        ldy     #$D9                            ; E75B A0 D9                    ..
        jsr     LD637                           ; E75D 20 37 D6                  7.
        rts                                     ; E760 60                       `

; ----------------------------------------------------------------------------
        ora     $3F0A                           ; E761 0D 0A 3F                 ..?
        lsr     $544F                           ; E764 4E 4F 54                 NOT
        jsr     L4D45                           ; E767 20 45 4D                  EM
        bvc     LE7C0                           ; E76A 50 54                    PT
        eor     L4420,y                         ; E76C 59 20 44                 Y D
        eor     #$52                            ; E76F 49 52                    IR
        .byte   $45                             ; E771 45                       E
LE772:  .byte   $43                             ; E772 43                       C
        .byte   $54                             ; E773 54                       T
        .byte   $4F                             ; E774 4F                       O
        .byte   $52                             ; E775 52                       R
        cmp     LEAEA,y                         ; E776 D9 EA EA                 ...
        nop                                     ; E779 EA                       .
        nop                                     ; E77A EA                       .
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
LE78A:  nop                                     ; E78A EA                       .
        nop                                     ; E78B EA                       .
        nop                                     ; E78C EA                       .
        nop                                     ; E78D EA                       .
        nop                                     ; E78E EA                       .
        nop                                     ; E78F EA                       .
        nop                                     ; E790 EA                       .
        jsr     LE94D                           ; E791 20 4D E9                  M.
        jsr     LDFDE                           ; E794 20 DE DF                  ..
        lda     LC03D                           ; E797 AD 3D C0                 .=.
        .byte   $29                             ; E79A 29                       )
LE79B:  .byte   $80                             ; E79B 80                       .
        bcc     LE7A0                           ; E79C 90 02                    ..
        ora     #$40                            ; E79E 09 40                    .@
LE7A0:  sta     LC03D                           ; E7A0 8D 3D C0                 .=.
        bit     LC03D                           ; E7A3 2C 3D C0                 ,=.
        bvs     LE7AD                           ; E7A6 70 05                    p.
        ldx     #$05                            ; E7A8 A2 05                    ..
        jmp     LD332                           ; E7AA 4C 32 D3                 L2.

; ----------------------------------------------------------------------------
LE7AD:  lda     #$06                            ; E7AD A9 06                    ..
        sta     SEDORIC_TRAV0                   ; E7AF 85 F2                    ..
        ldx     #$00                            ; E7B1 A2 00                    ..
LE7B3:  lda     #$08                            ; E7B3 A9 08                    ..
        sta     SEDORIC_TRAV1                   ; E7B5 85 F3                    ..
        sta     SEDORIC_TRAV3                   ; E7B7 85 F5                    ..
        lda     LCD4D,x                         ; E7B9 BD 4D CD                 .M.
        inx                                     ; E7BC E8                       .
        asl     a                               ; E7BD 0A                       .
        asl     a                               ; E7BE 0A                       .
        .byte   $26                             ; E7BF 26                       &
LE7C0:  sbc     $0A,x                           ; E7C0 F5 0A                    ..
        rol     SEDORIC_TRAV3                   ; E7C2 26 F5                    &.
        .byte   $85                             ; E7C4 85                       .
LE7C5:  .byte   $F4                             ; E7C5 F4                       .
        lda     SEDORIC_TRAV3                   ; E7C6 A5 F5                    ..
        adc     #$94                            ; E7C8 69 94                    i.
        sta     SEDORIC_TRAV3                   ; E7CA 85 F5                    ..
        ldy     #$00                            ; E7CC A0 00                    ..
LE7CE:  lda     LCD4D,x                         ; E7CE BD 4D CD                 .M.
LE7D1:  .byte   $91                             ; E7D1 91                       .
LE7D2:  .byte   $F4                             ; E7D2 F4                       .
LE7D3:  inx                                     ; E7D3 E8                       .
LE7D4:  iny                                     ; E7D4 C8                       .
        .byte   $C6                             ; E7D5 C6                       .
LE7D6:  .byte   $F3                             ; E7D6 F3                       .
        bne     LE7CE                           ; E7D7 D0 F5                    ..
        dec     SEDORIC_TRAV0                   ; E7D9 C6 F2                    ..
        bne     LE7B3                           ; E7DB D0 D6                    ..
        rts                                     ; E7DD 60                       `

; ----------------------------------------------------------------------------
        lda     #$C0                            ; E7DE A9 C0                    ..
        bit     a:$A9                           ; E7E0 2C A9 00                 ,..
        sta     LC03D                           ; E7E3 8D 3D C0                 .=.
        jsr     LDFDE                           ; E7E6 20 DE DF                  ..
        jmp     LEBA3                           ; E7E9 4C A3 EB                 L..

; ----------------------------------------------------------------------------
        lda     BASIC11_Y_TEXT                  ; E7EC AD 69 02                 .i.
        ldy     BASIC11_X_TEXT                  ; E7EF AC 68 02                 .h.
        .byte   $4C                             ; E7F2 4C                       L
        .byte   $FB                             ; E7F3 FB                       .
LE7F4:  .byte   $EB                             ; E7F4 EB                       .
        lda     $0219                           ; E7F5 AD 19 02                 ...
        ldy     $021A                           ; E7F8 AC 1A 02                 ...
        pha                                     ; E7FB 48                       H
        tya                                     ; E7FC 98                       .
        jsr     LD7E7                           ; E7FD 20 E7 D7                  ..
        pla                                     ; E800 68                       h
        jmp     LD7E4                           ; E801 4C E4 D7                 L..

; ----------------------------------------------------------------------------
        php                                     ; E804 08                       .
        pha                                     ; E805 48                       H
        lda     $02F9                           ; E806 AD F9 02                 ...
        ldy     $02FA                           ; E809 AC FA 02                 ...
        sta     EXEVEC+1                        ; E80C 8D F0 04                 ...
        sty     EXEVEC+2                        ; E80F 8C F1 04                 ...
        pla                                     ; E812 68                       h
        plp                                     ; E813 28                       (
        jmp     EXERAM                          ; E814 4C EC 04                 L..

; ----------------------------------------------------------------------------
        lda     #$10                            ; E817 A9 10                    ..
        ldy     #$07                            ; E819 A0 07                    ..
        sta     $026B                           ; E81B 8D 6B 02                 .k.
        sty     $026C                           ; E81E 8C 6C 02                 .l.
        lda     #$0F                            ; E821 A9 0F                    ..
        sta     BASIC11_FLG                     ; E823 8D 6A 02                 .j.
        lda     #$0C                            ; E826 A9 0C                    ..
        jsr     LD62A                           ; E828 20 2A D6                  *.
        jmp     LEBA3                           ; E82B 4C A3 EB                 L..

; ----------------------------------------------------------------------------
        jsr     LD224                           ; E82E 20 24 D2                  $.
        jsr     LD274                           ; E831 20 74 D2                  t.
        sta     SEDORIC_TRAV0                   ; E834 85 F2                    ..
        tay                                     ; E836 A8                       .
LE837:  dey                                     ; E837 88                       .
        lda     ($91),y                         ; E838 B1 91                    ..
        sta     LC100,y                         ; E83A 99 00 C1                 ...
        tya                                     ; E83D 98                       .
        bne     LE837                           ; E83E D0 F7                    ..
        jsr     LD22C                           ; E840 20 2C D2                  ,.
        jsr     LD224                           ; E843 20 24 D2                  $.
        jsr     LD274                           ; E846 20 74 D2                  t.
        sta     SEDORIC_TRAV1                   ; E849 85 F3                    ..
        stx     $B8                             ; E84B 86 B8                    ..
        sty     $B9                             ; E84D 84 B9                    ..
        jsr     LD22C                           ; E84F 20 2C D2                  ,.
        jsr     LD27F                           ; E852 20 7F D2                  ..
        bne     LE88E                           ; E855 D0 37                    .7
        dex                                     ; E857 CA                       .
        stx     SEDORIC_TRAV4                   ; E858 86 F6                    ..
        cpx     SEDORIC_TRAV0                   ; E85A E4 F2                    ..
        bcs     LE891                           ; E85C B0 33                    .3
        lda     SEDORIC_TRAV0                   ; E85E A5 F2                    ..
        beq     LE87E                           ; E860 F0 1C                    ..
LE862:  ldx     SEDORIC_TRAV1                   ; E862 A6 F3                    ..
        beq     LE87E                           ; E864 F0 18                    ..
        lda     SEDORIC_TRAV4                   ; E866 A5 F6                    ..
        sta     SEDORIC_TRAV5                   ; E868 85 F7                    ..
        lda     #$C1                            ; E86A A9 C1                    ..
        sta     SEDORIC_TRAV6                   ; E86C 85 F8                    ..
        ldy     #$00                            ; E86E A0 00                    ..
LE870:  lda     (SEDORIC_TRAV5),y               ; E870 B1 F7                    ..
        cmp     ($B8),y                         ; E872 D1 B8                    ..
        bne     LE884                           ; E874 D0 0E                    ..
        iny                                     ; E876 C8                       .
        dex                                     ; E877 CA                       .
        bne     LE870                           ; E878 D0 F6                    ..
        ldy     SEDORIC_TRAV4                   ; E87A A4 F6                    ..
        iny                                     ; E87C C8                       .
        .byte   $2C                             ; E87D 2C                       ,
LE87E:  ldy     #$00                            ; E87E A0 00                    ..
        tya                                     ; E880 98                       .
        jmp     LD7DB                           ; E881 4C DB D7                 L..

; ----------------------------------------------------------------------------
LE884:  inc     SEDORIC_TRAV4                   ; E884 E6 F6                    ..
        lda     SEDORIC_TRAV4                   ; E886 A5 F6                    ..
        cmp     SEDORIC_TRAV0                   ; E888 C5 F2                    ..
        beq     LE87E                           ; E88A F0 F2                    ..
        bne     LE862                           ; E88C D0 D4                    ..
LE88E:  jmp     LDE23                           ; E88E 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
LE891:  jmp     LDE20                           ; E891 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        tax                                     ; E894 AA                       .
        lda     BASIC11_FLG                     ; E895 AD 6A 02                 .j.
        pha                                     ; E898 48                       H
        cpx     #$C6                            ; E899 E0 C6                    ..
        .byte   $D0                             ; E89B D0                       .
LE89C:  asl     $9820,x                         ; E89C 1E 20 98                 . .
        .byte   $D3                             ; E89F D3                       .
        jsr     LD740                           ; E8A0 20 40 D7                  @.
        jsr     LD292                           ; E8A3 20 92 D2                  ..
        ldy     $20                             ; E8A6 A4 20                    . 
        sta     $12                             ; E8A8 85 12                    ..
        sty     $13                             ; E8AA 84 13                    ..
        stx     BASIC11_X_TEXT                  ; E8AC 8E 68 02                 .h.
        ldx     $02F8                           ; E8AF AE F8 02                 ...
        stx     BASIC11_Y_TEXT                  ; E8B2 8E 69 02                 .i.
        jsr     LEA36                           ; E8B5 20 36 EA                  6.
        jsr     LD22C                           ; E8B8 20 2C D2                  ,.
        jsr     LD224                           ; E8BB 20 24 D2                  $.
        bit     $28                             ; E8BE 24 28                    $(
        bpl     LE8D7                           ; E8C0 10 15                    ..
        jsr     LD277                           ; E8C2 20 77 D2                  w.
        beq     LE8CC                           ; E8C5 F0 05                    ..
        ldy     #$00                            ; E8C7 A0 00                    ..
        lda     ($91),y                         ; E8C9 B1 91                    ..
        .byte   $2C                             ; E8CB 2C                       ,
LE8CC:  lda     #$2E                            ; E8CC A9 2E                    ..
        sta     LC075                           ; E8CE 8D 75 C0                 .u.
        jsr     LD22C                           ; E8D1 20 2C D2                  ,.
        .byte   $20                             ; E8D4 20                        
        .byte   $24                             ; E8D5 24                       $
LE8D6:  .byte   $D2                             ; E8D6 D2                       .
LE8D7:  jsr     LD219                           ; E8D7 20 19 D2                  ..
        jsr     LD282                           ; E8DA 20 82 D2                  ..
        txa                                     ; E8DD 8A                       .
        beq     LE92B                           ; E8DE F0 4B                    .K
        stx     SEDORIC_TRAV0                   ; E8E0 86 F2                    ..
        lda     #$3B                            ; E8E2 A9 3B                    .;
        jsr     LD22E                           ; E8E4 20 2E D2                  ..
        sty     SEDORIC_TRAV1                   ; E8E7 84 F3                    ..
        jsr     LED2E                           ; E8E9 20 2E ED                  ..
        jsr     LD21B                           ; E8EC 20 1B D2                  ..
        jsr     LD39E                           ; E8EF 20 9E D3                  ..
        beq     LE919                           ; E8F2 F0 25                    .%
LE8F4:  jsr     LD22C                           ; E8F4 20 2C D2                  ,.
        jsr     LD3A1                           ; E8F7 20 A1 D3                  ..
        ldx     #$04                            ; E8FA A2 04                    ..
        stx     SEDORIC_TRAV2                   ; E8FC 86 F4                    ..
LE8FE:  asl     SEDORIC_TRAV2                   ; E8FE 06 F4                    ..
        cmp     LCDBA,x                         ; E900 DD BA CD                 ...
        beq     LE90A                           ; E903 F0 05                    ..
        dex                                     ; E905 CA                       .
        bpl     LE8FE                           ; E906 10 F6                    ..
        bmi     LE928                           ; E908 30 1E                    0.
LE90A:  lda     SEDORIC_TRAV2                   ; E90A A5 F4                    ..
        eor     SEDORIC_TRAV1                   ; E90C 45 F3                    E.
        cmp     SEDORIC_TRAV1                   ; E90E C5 F3                    ..
        bcc     LE928                           ; E910 90 16                    ..
        sta     SEDORIC_TRAV1                   ; E912 85 F3                    ..
        jsr     LD398                           ; E914 20 98 D3                  ..
        bne     LE8F4                           ; E917 D0 DB                    ..
LE919:  jsr     LED36                           ; E919 20 36 ED                  6.
        jsr     LEE8E                           ; E91C 20 8E EE                  ..
        pla                                     ; E91F 68                       h
        sta     BASIC11_FLG                     ; E920 8D 6A 02                 .j.
        lda     SEDORIC_TRAV2                   ; E923 A5 F4                    ..
        jmp     LD7D8                           ; E925 4C D8 D7                 L..

; ----------------------------------------------------------------------------
LE928:  jmp     LDE23                           ; E928 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
LE92B:  jmp     LDE20                           ; E92B 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        jsr     LD238                           ; E92E 20 38 D2                  8.
        sta     $B8                             ; E931 85 B8                    ..
        sty     $B9                             ; E933 84 B9                    ..
        rts                                     ; E935 60                       `

; ----------------------------------------------------------------------------
        lda     SEDORIC_TRAV1                   ; E936 A5 F3                    ..
        and     #$08                            ; E938 29 08                    ).
        bne     LE952                           ; E93A D0 16                    ..
LE93C:  jsr     LD740                           ; E93C 20 40 D7                  @.
        ldx     SEDORIC_TRAV0                   ; E93F A6 F2                    ..
        lda     LC075                           ; E941 AD 75 C0                 .u.
LE944:  jsr     LD62A                           ; E944 20 2A D6                  *.
        dex                                     ; E947 CA                       .
        bne     LE944                           ; E948 D0 FA                    ..
LE94A:  jsr     LD740                           ; E94A 20 40 D7                  @.
LE94D:  ldx     SEDORIC_TRAV0                   ; E94D A6 F2                    ..
        jsr     LEE69                           ; E94F 20 69 EE                  i.
LE952:  jsr     LD73E                           ; E952 20 3E D7                  >.
        ldx     #$00                            ; E955 A2 00                    ..
        ldy     #$26                            ; E957 A0 26                    .&
        lda     BASIC11_FLG                     ; E959 AD 6A 02                 .j.
        and     #$20                            ; E95C 29 20                    ) 
        beq     LE962                           ; E95E F0 02                    ..
        ldy     #$28                            ; E960 A0 28                    .(
LE962:  sty     SEDORIC_TRAV3                   ; E962 84 F5                    ..
LE964:  jsr     LD843                           ; E964 20 43 D8                  C.
        bpl     LE964                           ; E967 10 FB                    ..
        cmp     #$14                            ; E969 C9 14                    ..
        beq     LE990                           ; E96B F0 23                    .#
        cmp     #$7F                            ; E96D C9 7F                    ..
        bne     LE97F                           ; E96F D0 0E                    ..
        txa                                     ; E971 8A                       .
        beq     LE964                           ; E972 F0 F0                    ..
        jsr     LEE73                           ; E974 20 73 EE                  s.
LE977:  lda     LC075                           ; E977 AD 75 C0                 .u.
        .byte   $20                             ; E97A 20                        
        rol     a                               ; E97B 2A                       *
LE97C:  dec     $A9,x                           ; E97C D6 A9                    ..
        php                                     ; E97E 08                       .
LE97F:  cmp     #$0E                            ; E97F C9 0E                    ..
        bne     LE988                           ; E981 D0 05                    ..
        jsr     LEE69                           ; E983 20 69 EE                  i.
        beq     LE93C                           ; E986 F0 B4                    ..
LE988:  cmp     #$04                            ; E988 C9 04                    ..
        beq     LE990                           ; E98A F0 04                    ..
        cmp     #$1A                            ; E98C C9 1A                    ..
        bne     LE995                           ; E98E D0 05                    ..
LE990:  .byte   $20                             ; E990 20                        
        rol     a                               ; E991 2A                       *
LE992:  .byte   $D6                             ; E992 D6                       .
LE993:  bne     LE964                           ; E993 D0 CF                    ..
LE995:  cmp     #$20                            ; E995 C9 20                    . 
        bcc     LE9AD                           ; E997 90 14                    ..
        jsr     LD62A                           ; E999 20 2A D6                  *.
        inx                                     ; E99C E8                       .
        cpx     SEDORIC_TRAV0                   ; E99D E4 F2                    ..
        bne     LE964                           ; E99F D0 C3                    ..
        bit     SEDORIC_TRAV1                   ; E9A1 24 F3                    $.
        bvc     LE94A                           ; E9A3 50 A5                    P.
        dex                                     ; E9A5 CA                       .
        jsr     LEE73                           ; E9A6 20 73 EE                  s.
        ldy     #$06                            ; E9A9 A0 06                    ..
        bne     LEA04                           ; E9AB D0 57                    .W
LE9AD:  ldy     #$00                            ; E9AD A0 00                    ..
        cmp     #$0D                            ; E9AF C9 0D                    ..
        beq     LE9FC                           ; E9B1 F0 49                    .I
        iny                                     ; E9B3 C8                       .
        cmp     #$1B                            ; E9B4 C9 1B                    ..
        beq     LE9FC                           ; E9B6 F0 44                    .D
        iny                                     ; E9B8 C8                       .
        cmp     #$08                            ; E9B9 C9 08                    ..
        bne     LE9C6                           ; E9BB D0 09                    ..
        txa                                     ; E9BD 8A                       .
        beq     LE9FC                           ; E9BE F0 3C                    .<
        dex                                     ; E9C0 CA                       .
        jsr     LEE73                           ; E9C1 20 73 EE                  s.
        bne     LE964                           ; E9C4 D0 9E                    ..
LE9C6:  iny                                     ; E9C6 C8                       .
        cmp     #$09                            ; E9C7 C9 09                    ..
        bne     LE9D9                           ; E9C9 D0 0E                    ..
        inx                                     ; E9CB E8                       .
        cpx     SEDORIC_TRAV0                   ; E9CC E4 F2                    ..
        beq     LE9D5                           ; E9CE F0 05                    ..
        jsr     LEE76                           ; E9D0 20 76 EE                  v.
        bne     LE993                           ; E9D3 D0 BE                    ..
LE9D5:  dex                                     ; E9D5 CA                       .
        jmp     LEDFC                           ; E9D6 4C FC ED                 L..

; ----------------------------------------------------------------------------
LE9D9:  iny                                     ; E9D9 C8                       .
        cmp     #$0A                            ; E9DA C9 0A                    ..
        bne     LE9ED                           ; E9DC D0 0F                    ..
        clc                                     ; E9DE 18                       .
        txa                                     ; E9DF 8A                       .
        adc     SEDORIC_TRAV3                   ; E9E0 65 F5                    e.
        bcs     LE9FC                           ; E9E2 B0 18                    ..
        cmp     SEDORIC_TRAV0                   ; E9E4 C5 F2                    ..
        bcs     LE9FC                           ; E9E6 B0 14                    ..
        tax                                     ; E9E8 AA                       .
        lda     #$0A                            ; E9E9 A9 0A                    ..
        .byte   $D0                             ; E9EB D0                       .
LE9EC:  .byte   $A3                             ; E9EC A3                       .
LE9ED:  iny                                     ; E9ED C8                       .
        cmp     #$0B                            ; E9EE C9 0B                    ..
        bne     LE993                           ; E9F0 D0 A1                    ..
        txa                                     ; E9F2 8A                       .
        sbc     SEDORIC_TRAV3                   ; E9F3 E5 F5                    ..
LE9F5:  bcc     LE9FC                           ; E9F5 90 05                    ..
        tax                                     ; E9F7 AA                       .
LE9F8:  lda     #$0B                            ; E9F8 A9 0B                    ..
        bne     LE990                           ; E9FA D0 94                    ..
LE9FC:  cpy     #$02                            ; E9FC C0 02                    ..
LE9FE:  bcc     LEA04                           ; E9FE 90 04                    ..
        lda     SEDORIC_TRAV1                   ; EA00 A5 F3                    ..
        bmi     LE993                           ; EA02 30 8F                    0.
LEA04:  sty     SEDORIC_TRAV2                   ; EA04 84 F4                    ..
LEA06:  jsr     LD740                           ; EA06 20 40 D7                  @.
LEA09:  inx                                     ; EA09 E8                       .
        cpx     SEDORIC_TRAV0                   ; EA0A E4 F2                    ..
        bcs     LEA13                           ; EA0C B0 05                    ..
        jsr     LEE76                           ; EA0E 20 76 EE                  v.
        bne     LEA09                           ; EA11 D0 F6                    ..
LEA13:  lda     SEDORIC_TRAV0                   ; EA13 A5 F2                    ..
        jsr     LD264                           ; EA15 20 64 D2                  d.
        ldy     SEDORIC_TRAV0                   ; EA18 A4 F2                    ..
LEA1A:  sty     SEDORIC_TRAV3                   ; EA1A 84 F5                    ..
        .byte   $AC                             ; EA1C AC                       .
        .byte   $69                             ; EA1D 69                       i
LEA1E:  .byte   $02                             ; EA1E 02                       .
        lda     ($12),y                         ; EA1F B1 12                    ..
        cmp     #$20                            ; EA21 C9 20                    . 
        bcs     LEA27                           ; EA23 B0 02                    ..
        ora     #$80                            ; EA25 09 80                    ..
LEA27:  ldy     SEDORIC_TRAV3                   ; EA27 A4 F5                    ..
        dey                                     ; EA29 88                       .
        php                                     ; EA2A 08                       .
LEA2B:  sta     ($D1),y                         ; EA2B 91 D1                    ..
        jsr     LEE73                           ; EA2D 20 73 EE                  s.
LEA30:  plp                                     ; EA30 28                       (
        bne     LEA1A                           ; EA31 D0 E7                    ..
        ldx     SEDORIC_TRAV0                   ; EA33 A6 F2                    ..
LEA35:  .byte   $20                             ; EA35 20                        
LEA36:  ror     $EE,x                           ; EA36 76 EE                    v.
        dex                                     ; EA38 CA                       .
        bne     LEA35                           ; EA39 D0 FA                    ..
        asl     SEDORIC_TRAV1                   ; EA3B 06 F3                    ..
        asl     SEDORIC_TRAV1                   ; EA3D 06 F3                    ..
        ldy     SEDORIC_TRAV0                   ; EA3F A4 F2                    ..
LEA41:  dey                                     ; EA41 88                       .
        lda     ($D1),y                         ; EA42 B1 D1                    ..
        cmp     LC075                           ; EA44 CD 75 C0                 .u.
LEA47:  bne     LEA61                           ; EA47 D0 18                    ..
        lda     #$20                            ; EA49 A9 20                    . 
        bit     SEDORIC_TRAV1                   ; EA4B 24 F3                    $.
        bpl     LEA51                           ; EA4D 10 02                    ..
        sta     ($D1),y                         ; EA4F 91 D1                    ..
LEA51:  bvc     LEA59                           ; EA51 50 06                    P.
        jsr     LD62A                           ; EA53 20 2A D6                  *.
        jsr     LEE73                           ; EA56 20 73 EE                  s.
LEA59:  jsr     LEE73                           ; EA59 20 73 EE                  s.
        tya                                     ; EA5C 98                       .
        bne     LEA41                           ; EA5D D0 E2                    ..
        .byte   $24                             ; EA5F 24                       $
LEA60:  iny                                     ; EA60 C8                       .
LEA61:  jsr     LEE76                           ; EA61 20 76 EE                  v.
        cpy     SEDORIC_TRAV0                   ; EA64 C4 F2                    ..
        bne     LEA60                           ; EA66 D0 F8                    ..
        rts                                     ; EA68 60                       `

; ----------------------------------------------------------------------------
LEA69:  txa                                     ; EA69 8A                       .
        beq     LEA72                           ; EA6A F0 06                    ..
        jsr     LEE73                           ; EA6C 20 73 EE                  s.
        dex                                     ; EA6F CA                       .
        bne     LEA69                           ; EA70 D0 F7                    ..
LEA72:  rts                                     ; EA72 60                       `

; ----------------------------------------------------------------------------
        lda     #$08                            ; EA73 A9 08                    ..
        bit     $09A9                           ; EA75 2C A9 09                 ,..
        .byte   $24                             ; EA78 24                       $
LEA79:  pla                                     ; EA79 68                       h
        pha                                     ; EA7A 48                       H
        jsr     LD62A                           ; EA7B 20 2A D6                  *.
        lda     BASIC11_FLG                     ; EA7E AD 6A 02                 .j.
        and     #$20                            ; EA81 29 20                    ) 
        bne     LEA8C                           ; EA83 D0 07                    ..
        lda     BASIC11_Y_TEXT                  ; EA85 AD 69 02                 .i.
        and     #$FE                            ; EA88 29 FE                    ).
        beq     LEA79                           ; EA8A F0 ED                    ..
LEA8C:  pla                                     ; EA8C 68                       h
        rts                                     ; EA8D 60                       `

; ----------------------------------------------------------------------------
        ldy     #$02                            ; EA8E A0 02                    ..
LEA90:  lda     $D0,y                           ; EA90 B9 D0 00                 ...
        sta     ($B8),y                         ; EA93 91 B8                    ..
        dey                                     ; EA95 88                       .
        bpl     LEA90                           ; EA96 10 F8                    ..
        rts                                     ; EA98 60                       `

; ----------------------------------------------------------------------------
        jsr     LD216                           ; EA99 20 16 D2                  ..
        jsr     LD2D2                           ; EA9C 20 D2 D2                  ..
        jsr     LD22C                           ; EA9F 20 2C D2                  ,.
        jsr     LD224                           ; EAA2 20 24 D2                  $.
        jsr     LD274                           ; EAA5 20 74 D2                  t.
        sta     $22                             ; EAA8 85 22                    ."
        jsr     LDACE                           ; EAAA 20 CE DA                  ..
        lda     #$30                            ; EAAD A9 30                    .0
        ldy     #$2B                            ; EAAF A0 2B                    .+
        sty     $D7                             ; EAB1 84 D7                    ..
        sta     $D8                             ; EAB3 85 D8                    ..
        sta     $D9                             ; EAB5 85 D9                    ..
        sta     $C5                             ; EAB7 85 C5                    ..
        ldx     #$09                            ; EAB9 A2 09                    ..
LEABB:  sta     $CD,x                           ; EABB 95 CD                    ..
        dex                                     ; EABD CA                       .
        bne     LEABB                           ; EABE D0 FB                    ..
        lda     STACK                           ; EAC0 AD 00 01                 ...
        cmp     #$2D                            ; EAC3 C9 2D                    .-
        beq     LEAC9                           ; EAC5 F0 02                    ..
        lda     #$2B                            ; EAC7 A9 2B                    .+
LEAC9:  sta     $C4                             ; EAC9 85 C4                    ..
        stx     SEDORIC_TRAV2                   ; EACB 86 F4                    ..
        stx     SEDORIC_TRAV3                   ; EACD 86 F5                    ..
        lda     #$20                            ; EACF A9 20                    . 
        sta     SEDORIC_TRAV4                   ; EAD1 85 F6                    ..
        ldy     #$01                            ; EAD3 A0 01                    ..
        sty     SEDORIC_TRAV0                   ; EAD5 84 F2                    ..
        dey                                     ; EAD7 88                       .
        .byte   $2C                             ; EAD8 2C                       ,
LEAD9:  ldx     #$09                            ; EAD9 A2 09                    ..
LEADB:  iny                                     ; EADB C8                       .
        lda     STACK,y                         ; EADC B9 00 01                 ...
        beq     LEB06                           ; EADF F0 25                    .%
        cmp     #$2E                            ; EAE1 C9 2E                    ..
        beq     LEAD9                           ; EAE3 F0 F4                    ..
        cmp     #$45                            ; EAE5 C9 45                    .E
        beq     LEAF4                           ; EAE7 F0 0B                    ..
        .byte   $95                             ; EAE9 95                       .
LEAEA:  cmp     $E0                             ; EAEA C5 E0                    ..
        ora     #$B0                            ; EAEC 09 B0                    ..
        .byte   $02                             ; EAEE 02                       .
        sty     SEDORIC_TRAV0                   ; EAEF 84 F2                    ..
        inx                                     ; EAF1 E8                       .
        bne     LEADB                           ; EAF2 D0 E7                    ..
LEAF4:  lda     STACK+1,y                       ; EAF4 B9 01 01                 ...
        sta     $D7                             ; EAF7 85 D7                    ..
        lda     STACK+2,y                       ; EAF9 B9 02 01                 ...
        tax                                     ; EAFC AA                       .
        lda     STACK+3,y                       ; EAFD B9 03 01                 ...
        beq     LEB04                           ; EB00 F0 02                    ..
        sta     $D9                             ; EB02 85 D9                    ..
LEB04:  stx     $D8                             ; EB04 86 D8                    ..
LEB06:  ldx     SEDORIC_TRAV0                   ; EB06 A6 F2                    ..
        ldy     #$08                            ; EB08 A0 08                    ..
LEB0A:  lda     $C4,x                           ; EB0A B5 C4                    ..
        dex                                     ; EB0C CA                       .
        .byte   $10                             ; EB0D 10                       .
LEB0E:  .byte   $02                             ; EB0E 02                       .
        lda     #$20                            ; EB0F A9 20                    . 
        sta     $C5,y                           ; EB11 99 C5 00                 ...
        dey                                     ; EB14 88                       .
        bpl     LEB0A                           ; EB15 10 F3                    ..
        .byte   $2C                             ; EB17 2C                       ,
LEB18:  sty     SEDORIC_TRAV3                   ; EB18 84 F5                    ..
        ldy     SEDORIC_TRAV2                   ; EB1A A4 F4                    ..
        cpy     $22                             ; EB1C C4 22                    ."
        bne     LEB48                           ; EB1E D0 28                    .(
        lda     #$00                            ; EB20 A9 00                    ..
LEB22:  sta     $D7                             ; EB22 85 D7                    ..
        jsr     LD39E                           ; EB24 20 9E D3                  ..
        beq     LEB41                           ; EB27 F0 18                    ..
        lda     SEDORIC_TRAV3                   ; EB29 A5 F5                    ..
        jsr     LD264                           ; EB2B 20 64 D2                  d.
        tay                                     ; EB2E A8                       .
LEB2F:  dey                                     ; EB2F 88                       .
        lda     LC100,y                         ; EB30 B9 00 C1                 ...
        sta     ($D1),y                         ; EB33 91 D1                    ..
        tya                                     ; EB35 98                       .
        bne     LEB2F                           ; EB36 D0 F7                    ..
        jsr     LD22C                           ; EB38 20 2C D2                  ,.
        jsr     LD238                           ; EB3B 20 38 D2                  8.
        jmp     LE8D6                           ; EB3E 4C D6 E8                 L..

; ----------------------------------------------------------------------------
LEB41:  lda     #$00                            ; EB41 A9 00                    ..
        ldy     #$C1                            ; EB43 A0 C1                    ..
        jmp     LD637                           ; EB45 4C 37 D6                 L7.

; ----------------------------------------------------------------------------
LEB48:  jsr     LF02B                           ; EB48 20 2B F0                  +.
        cmp     #$5E                            ; EB4B C9 5E                    .^
        bne     LEB68                           ; EB4D D0 19                    ..
        ldx     #$FD                            ; EB4F A2 FD                    ..
LEB51:  lda     LFFDA,x                         ; EB51 BD DA FF                 ...
        .byte   $2C                             ; EB54 2C                       ,
LEB55:  lda     #$20                            ; EB55 A9 20                    . 
        .byte   $2C                             ; EB57 2C                       ,
LEB58:  lda     $C4                             ; EB58 A5 C4                    ..
        sta     LC100,y                         ; EB5A 99 00 C1                 ...
        iny                                     ; EB5D C8                       .
        bne     LEB63                           ; EB5E D0 03                    ..
        jmp     LE977                           ; EB60 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
LEB63:  inx                                     ; EB63 E8                       .
        bne     LEB51                           ; EB64 D0 EB                    ..
        beq     LEB18                           ; EB66 F0 B0                    ..
LEB68:  cmp     #$2B                            ; EB68 C9 2B                    .+
        beq     LEB58                           ; EB6A F0 EC                    ..
        cmp     #$2D                            ; EB6C C9 2D                    .-
        bne     LEB78                           ; EB6E D0 08                    ..
        lda     STACK                           ; EB70 AD 00 01                 ...
        lsr     a                               ; EB73 4A                       J
        bcs     LEB58                           ; EB74 B0 E2                    ..
        bcc     LEB55                           ; EB76 90 DD                    ..
LEB78:  cmp     #$23                            ; EB78 C9 23                    .#
        bne     LEB83                           ; EB7A D0 07                    ..
        jsr     LEFA7                           ; EB7C 20 A7 EF                  ..
        ldx     #$09                            ; EB7F A2 09                    ..
        bne     LEB93                           ; EB81 D0 10                    ..
LEB83:  cmp     #$25                            ; EB83 C9 25                    .%
        bne     LEBB9                           ; EB85 D0 32                    .2
        jsr     LEFA7                           ; EB87 20 A7 EF                  ..
        cmp     SEDORIC_TRAV0                   ; EB8A C5 F2                    ..
        bcc     LEBB3                           ; EB8C 90 25                    .%
        lda     #$09                            ; EB8E A9 09                    ..
        sbc     SEDORIC_TRAV1                   ; EB90 E5 F3                    ..
        tax                                     ; EB92 AA                       .
LEB93:  dec     SEDORIC_TRAV1                   ; EB93 C6 F3                    ..
        bpl     LEB9A                           ; EB95 10 03                    ..
        jmp     LEF18                           ; EB97 4C 18 EF                 L..

; ----------------------------------------------------------------------------
LEB9A:  lda     $C5,x                           ; EB9A B5 C5                    ..
        and     #$7F                            ; EB9C 29 7F                    ).
        sta     LC100,y                         ; EB9E 99 00 C1                 ...
        iny                                     ; EBA1 C8                       .
        .byte   $F0                             ; EBA2 F0                       .
LEBA3:  .byte   $12                             ; EBA3 12                       .
        inx                                     ; EBA4 E8                       .
        bne     LEB93                           ; EBA5 D0 EC                    ..
        jsr     LF02B                           ; EBA7 20 2B F0                  +.
        sbc     #$30                            ; EBAA E9 30                    .0
        sta     SEDORIC_TRAV1                   ; EBAC 85 F3                    ..
        cmp     #$0A                            ; EBAE C9 0A                    ..
        bcs     LEBB3                           ; EBB0 B0 01                    ..
        rts                                     ; EBB2 60                       `

; ----------------------------------------------------------------------------
LEBB3:  jmp     LDE20                           ; EBB3 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        jmp     LE977                           ; EBB6 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
LEBB9:  cmp     #$21                            ; EBB9 C9 21                    .!
        bne     LEBFC                           ; EBBB D0 3F                    .?
        jsr     LEFA7                           ; EBBD 20 A7 EF                  ..
        sec                                     ; EBC0 38                       8
        lda     #$09                            ; EBC1 A9 09                    ..
        sbc     SEDORIC_TRAV1                   ; EBC3 E5 F3                    ..
LEBC5:  sta     SEDORIC_TRAV1                   ; EBC5 85 F3                    ..
        tax                                     ; EBC7 AA                       .
        lda     $C5,x                           ; EBC8 B5 C5                    ..
        cmp     SEDORIC_TRAV4                   ; EBCA C5 F6                    ..
        beq     LEC28                           ; EBCC F0 5A                    .Z
        lda     #$30                            ; EBCE A9 30                    .0
        inx                                     ; EBD0 E8                       .
LEBD1:  inx                                     ; EBD1 E8                       .
        cpx     #$12                            ; EBD2 E0 12                    ..
        beq     LEBDA                           ; EBD4 F0 04                    ..
        sta     $C5,x                           ; EBD6 95 C5                    ..
        bne     LEBD1                           ; EBD8 D0 F7                    ..
LEBDA:  ldx     SEDORIC_TRAV1                   ; EBDA A6 F3                    ..
        inx                                     ; EBDC E8                       .
        lda     $C5,x                           ; EBDD B5 C5                    ..
        cmp     #$35                            ; EBDF C9 35                    .5
LEBE1:  lda     #$30                            ; EBE1 A9 30                    .0
LEBE3:  sta     $C5,x                           ; EBE3 95 C5                    ..
        bcc     LEC28                           ; EBE5 90 41                    .A
        dex                                     ; EBE7 CA                       .
        bmi     LEC28                           ; EBE8 30 3E                    0>
        .byte   $B5                             ; EBEA B5                       .
LEBEB:  cmp     $C5                             ; EBEB C5 C5                    ..
        inc     $D0,x                           ; EBED F6 D0                    ..
        .byte   $04                             ; EBEF 04                       .
        inc     SEDORIC_TRAV0                   ; EBF0 E6 F2                    ..
        lda     #$30                            ; EBF2 A9 30                    .0
LEBF4:  cmp     #$39                            ; EBF4 C9 39                    .9
        beq     LEBE1                           ; EBF6 F0 E9                    ..
        adc     #$01                            ; EBF8 69 01                    i.
        bcc     LEBE3                           ; EBFA 90 E7                    ..
LEBFC:  cmp     #$40                            ; EBFC C9 40                    .@
        bne     LEC07                           ; EBFE D0 07                    ..
        jsr     LEFA7                           ; EC00 20 A7 EF                  ..
LEC03:  adc     #$08                            ; EC03 69 08                    i.
        bcc     LEBC5                           ; EC05 90 BE                    ..
LEC07:  cmp     #$26                            ; EC07 C9 26                    .&
        beq     LEC0E                           ; EC09 F0 03                    ..
        jmp     LEF5A                           ; EC0B 4C 5A EF                 LZ.

; ----------------------------------------------------------------------------
LEC0E:  jsr     LF02B                           ; EC0E 20 2B F0                  +.
        cmp     #$30                            ; EC11 C9 30                    .0
        bne     LEC17                           ; EC13 D0 02                    ..
        ora     #$80                            ; EC15 09 80                    ..
LEC17:  tax                                     ; EC17 AA                       .
        ldy     #$00                            ; EC18 A0 00                    ..
LEC1A:  lda     $C5,y                           ; EC1A B9 C5 00                 ...
        cmp     SEDORIC_TRAV4                   ; EC1D C5 F6                    ..
        bne     LEC26                           ; EC1F D0 05                    ..
        stx     $C5,y                           ; EC21 96 C5                    ..
        iny                                     ; EC23 C8                       .
        bne     LEC1A                           ; EC24 D0 F4                    ..
LEC26:  stx     SEDORIC_TRAV4                   ; EC26 86 F6                    ..
LEC28:  jmp     LEF1A                           ; EC28 4C 1A EF                 L..

; ----------------------------------------------------------------------------
        ldy     SEDORIC_TRAV2                   ; EC2B A4 F4                    ..
        lda     ($91),y                         ; EC2D B1 91                    ..
        inc     SEDORIC_TRAV2                   ; EC2F E6 F4                    ..
        ldy     SEDORIC_TRAV3                   ; EC31 A4 F5                    ..
        ldx     #$FF                            ; EC33 A2 FF                    ..
        rts                                     ; EC35 60                       `

; ----------------------------------------------------------------------------
        jsr     LE7C5                           ; EC36 20 C5 E7                  ..
        jsr     LEE99                           ; EC39 20 99 EE                  ..
        jmp     LE7D6                           ; EC3C 4C D6 E7                 L..

; ----------------------------------------------------------------------------
        ldx     #$05                            ; EC3F A2 05                    ..
LEC41:  lda     LCD1A,x                         ; EC41 BD 1A CD                 ...
        sta     $BFDF,x                         ; EC44 9D DF BF                 ...
        lda     LCD1F,x                         ; EC47 BD 1F CD                 ...
        sta     $BFE9,x                         ; EC4A 9D E9 BF                 ...
        dex                                     ; EC4D CA                       .
        bne     LEC41                           ; EC4E D0 F1                    ..
        inx                                     ; EC50 E8                       .
        stx     LC072                           ; EC51 8E 72 C0                 .r.
        lda     #$41                            ; EC54 A9 41                    .A
        ldy     #$4E                            ; EC56 A0 4E                    .N
        sta     $B4                             ; EC58 85 B4                    ..
        sty     $B5                             ; EC5A 84 B5                    ..
        jsr     LD244                           ; EC5C 20 44 D2                  D.
        jsr     LD2BA                           ; EC5F 20 BA D2                  ..
        lda     #$E0                            ; EC62 A9 E0                    ..
        ldy     #$BF                            ; EC64 A0 BF                    ..
        jsr     LD2AA                           ; EC66 20 AA D2                  ..
        ldx     #$E0                            ; EC69 A2 E0                    ..
        ldy     #$BF                            ; EC6B A0 BF                    ..
        jsr     LD2C2                           ; EC6D 20 C2 D2                  ..
        lda     $021F                           ; EC70 AD 1F 02                 ...
        bne     LEC78                           ; EC73 D0 03                    ..
        jmp     LD16F                           ; EC75 4C 6F D1                 Lo.

; ----------------------------------------------------------------------------
LEC78:  rts                                     ; EC78 60                       `

; ----------------------------------------------------------------------------
        jsr     LF03F                           ; EC79 20 3F F0                  ?.
        jsr     LD216                           ; EC7C 20 16 D2                  ..
        ldx     #$E5                            ; EC7F A2 E5                    ..
        ldy     #$BF                            ; EC81 A0 BF                    ..
        jsr     LD2C2                           ; EC83 20 C2 D2                  ..
        ldx     #$00                            ; EC86 A2 00                    ..
LEC88:  stx     SEDORIC_TRAV0                   ; EC88 86 F2                    ..
        lda     #$E0                            ; EC8A A9 E0                    ..
        ldy     #$BF                            ; EC8C A0 BF                    ..
        jsr     LD2BA                           ; EC8E 20 BA D2                  ..
        ldx     SEDORIC_TRAV0                   ; EC91 A6 F2                    ..
        beq     LEC9E                           ; EC93 F0 09                    ..
        jsr     LD2F2                           ; EC95 20 F2 D2                  ..
        jsr     LD2DA                           ; EC98 20 DA D2                  ..
        jmp     LF0A1                           ; EC9B 4C A1 F0                 L..

; ----------------------------------------------------------------------------
LEC9E:  jsr     LD2EA                           ; EC9E 20 EA D2                  ..
        lda     #$E5                            ; ECA1 A9 E5                    ..
        ldy     #$BF                            ; ECA3 A0 BF                    ..
        jsr     LD2AA                           ; ECA5 20 AA D2                  ..
        jsr     LD28A                           ; ECA8 20 8A D2                  ..
        tax                                     ; ECAB AA                       .
        beq     LECB2                           ; ECAC F0 04                    ..
        iny                                     ; ECAE C8                       .
        bne     LECB2                           ; ECAF D0 01                    ..
        inx                                     ; ECB1 E8                       .
LECB2:  txa                                     ; ECB2 8A                       .
        ldx     SEDORIC_TRAV0                   ; ECB3 A6 F2                    ..
        sta     BASIC11_PARAMS+2,x              ; ECB5 9D E2 02                 ...
        tya                                     ; ECB8 98                       .
LECB9:  sta     BASIC11_PARAMS+1,x              ; ECB9 9D E1 02                 ...
        inx                                     ; ECBC E8                       .
        inx                                     ; ECBD E8                       .
        cpx     #$02                            ; ECBE E0 02                    ..
        beq     LEC88                           ; ECC0 F0 C6                    ..
        lsr     LC072                           ; ECC2 4E 72 C0                 Nr.
        bcc     LECD3                           ; ECC5 90 0C                    ..
        jsr     LD22C                           ; ECC7 20 2C D2                  ,.
        jsr     LD2FA                           ; ECCA 20 FA D2                  ..
        sty     BASIC11_PARAMS+5                ; ECCD 8C E5 02                 ...
        sta     BASIC11_PARAMS+6                ; ECD0 8D E6 02                 ...
LECD3:  jsr     LD312                           ; ECD3 20 12 D3                  ..
        lsr     BASIC11_PARAMS                  ; ECD6 4E E0 02                 N..
        bcc     LEC78                           ; ECD9 90 9D                    ..
        jmp     LE97C                           ; ECDB 4C 7C E9                 L|.

; ----------------------------------------------------------------------------
        jsr     LF03F                           ; ECDE 20 3F F0                  ?.
        jsr     LD27F                           ; ECE1 20 7F D2                  ..
        stx     SEDORIC_TRAV1                   ; ECE4 86 F3                    ..
        jsr     LD22C                           ; ECE6 20 2C D2                  ,.
        jsr     LD27F                           ; ECE9 20 7F D2                  ..
        stx     SEDORIC_TRAV2                   ; ECEC 86 F4                    ..
        lda     #$04                            ; ECEE A9 04                    ..
        sta     SEDORIC_TRAV3                   ; ECF0 85 F5                    ..
        lda     #$00                            ; ECF2 A9 00                    ..
        sta     SEDORIC_TRAV4                   ; ECF4 85 F6                    ..
LECF6:  ldx     SEDORIC_TRAV4                   ; ECF6 A6 F6                    ..
        txa                                     ; ECF8 8A                       .
        eor     #$01                            ; ECF9 49 01                    I.
        sta     SEDORIC_TRAV4                   ; ECFB 85 F6                    ..
        ldy     SEDORIC_TRAV1,x                 ; ECFD B4 F3                    ..
        lda     #$00                            ; ECFF A9 00                    ..
        jsr     LD2CA                           ; ED01 20 CA D2                  ..
        jsr     LF07F                           ; ED04 20 7F F0                  ..
        lda     #$E0                            ; ED07 A9 E0                    ..
        ldy     #$BF                            ; ED09 A0 BF                    ..
        jsr     LD2BA                           ; ED0B 20 BA D2                  ..
        lda     #$EA                            ; ED0E A9 EA                    ..
        ldy     #$BF                            ; ED10 A0 BF                    ..
        jsr     LD2A2                           ; ED12 20 A2 D2                  ..
        ldx     #$E0                            ; ED15 A2 E0                    ..
        ldy     #$BF                            ; ED17 A0 BF                    ..
        jsr     LD2C2                           ; ED19 20 C2 D2                  ..
        dec     SEDORIC_TRAV3                   ; ED1C C6 F5                    ..
        bne     LECF6                           ; ED1E D0 D6                    ..
        rts                                     ; ED20 60                       `

; ----------------------------------------------------------------------------
        ldy     #$1B                            ; ED21 A0 1B                    ..
        bit     $18A0                           ; ED23 2C A0 18                 ,..
        bit     $15A0                           ; ED26 2C A0 15                 ,..
        bit     $12A0                           ; ED29 2C A0 12                 ,..
        .byte   $2C                             ; ED2C 2C                       ,
        .byte   $A0                             ; ED2D A0                       .
LED2E:  .byte   $0F                             ; ED2E 0F                       .
        bit     $0CA0                           ; ED2F 2C A0 0C                 ,..
        ldx     #$56                            ; ED32 A2 56                    .V
        bne     LED5E                           ; ED34 D0 28                    .(
LED36:  ldx     #$42                            ; ED36 A2 42                    .B
        bit     $56A2                           ; ED38 2C A2 56                 ,.V
        bit     $4CA2                           ; ED3B 2C A2 4C                 ,.L
        ldy     #$09                            ; ED3E A0 09                    ..
        bne     LED5E                           ; ED40 D0 1C                    ..
        ldx     #$42                            ; ED42 A2 42                    .B
        bit     $56A2                           ; ED44 2C A2 56                 ,.V
        bit     $4CA2                           ; ED47 2C A2 4C                 ,.L
        ldy     #$06                            ; ED4A A0 06                    ..
        bne     LED5E                           ; ED4C D0 10                    ..
        ldx     #$42                            ; ED4E A2 42                    .B
        bit     $47A2                           ; ED50 2C A2 47                 ,.G
        bit     $4CA2                           ; ED53 2C A2 4C                 ,.L
        bit     $51A2                           ; ED56 2C A2 51                 ,.Q
        bit     $56A2                           ; ED59 2C A2 56                 ,.V
        ldy     #$03                            ; ED5C A0 03                    ..
LED5E:  lda     #$C4                            ; ED5E A9 C4                    ..
        pha                                     ; ED60 48                       H
        tya                                     ; ED61 98                       .
        pha                                     ; ED62 48                       H
        cpx     LC015                           ; ED63 EC 15 C0                 ...
        beq     LEDB9                           ; ED66 F0 51                    .Q
        bit     $5BA2                           ; ED68 2C A2 5B                 ,.[
        txa                                     ; ED6B 8A                       .
        pha                                     ; ED6C 48                       H
LED6D:  jsr     LEA06                           ; ED6D 20 06 EA                  ..
        beq     LED8F                           ; ED70 F0 1D                    ..
        ldx     #$0C                            ; ED72 A2 0C                    ..
        jsr     LD36C                           ; ED74 20 6C D3                  l.
        nop                                     ; ED77 EA                       .
        jsr     LD648                           ; ED78 20 48 D6                  H.
        cli                                     ; ED7B 58                       X
        php                                     ; ED7C 08                       .
        lda     #$0B                            ; ED7D A9 0B                    ..
        jsr     LD62A                           ; ED7F 20 2A D6                  *.
        plp                                     ; ED82 28                       (
        bcc     LED8F                           ; ED83 90 0A                    ..
        pla                                     ; ED85 68                       h
        cmp     #$5B                            ; ED86 C9 5B                    .[
        beq     LED8C                           ; ED88 F0 02                    ..
        pla                                     ; ED8A 68                       h
        pla                                     ; ED8B 68                       h
LED8C:  jmp     LD1DC                           ; ED8C 4C DC D1                 L..

; ----------------------------------------------------------------------------
LED8F:  jsr     LDA4C                           ; ED8F 20 4C DA                  L.
        lda     LC207                           ; ED92 AD 07 C2                 ...
        sta     LC04B                           ; ED95 8D 4B C0                 .K.
        lda     LC20A                           ; ED98 AD 0A C2                 ...
        bne     LED6D                           ; ED9B D0 D0                    ..
        ldx     #$FF                            ; ED9D A2 FF                    ..
        pla                                     ; ED9F 68                       h
        sta     LC015                           ; EDA0 8D 15 C0                 ...
        sec                                     ; EDA3 38                       8
LEDA4:  tay                                     ; EDA4 A8                       .
        inx                                     ; EDA5 E8                       .
        sbc     LC207                           ; EDA6 ED 07 C2                 ...
        beq     LEDAD                           ; EDA9 F0 02                    ..
        bcs     LEDA4                           ; EDAB B0 F7                    ..
LEDAD:  stx     LC001                           ; EDAD 8E 01 C0                 ...
        ldx     #$04                            ; EDB0 A2 04                    ..
        lda     #$C4                            ; EDB2 A9 C4                    ..
        jsr     LF1E5                           ; EDB4 20 E5 F1                  ..
        sec                                     ; EDB7 38                       8
        .byte   $24                             ; EDB8 24                       $
LEDB9:  clc                                     ; EDB9 18                       .
        ror     LC016                           ; EDBA 6E 16 C0                 n..
        ldx     #$03                            ; EDBD A2 03                    ..
LEDBF:  lda     LC400,x                         ; EDBF BD 00 C4                 ...
        sta     LC00D,x                         ; EDC2 9D 0D C0                 ...
        dex                                     ; EDC5 CA                       .
        bpl     LEDBF                           ; EDC6 10 F7                    ..
        lda     LC015                           ; EDC8 AD 15 C0                 ...
        cmp     #$5B                            ; EDCB C9 5B                    .[
        beq     LEDD2                           ; EDCD F0 03                    ..
        jmp     LD39E                           ; EDCF 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LEDD2:  ldx     #$7C                            ; EDD2 A2 7C                    .|
        lda     #$20                            ; EDD4 A9 20                    . 
        ldy     #$00                            ; EDD6 A0 00                    ..
        sty     LC001                           ; EDD8 8C 01 C0                 ...
        iny                                     ; EDDB C8                       .
        jsr     LF1E5                           ; EDDC 20 E5 F1                  ..
        .byte   $20                             ; EDDF 20                        
LEDE0:  .byte   $9E                             ; EDE0 9E                       .
        .byte   $D3                             ; EDE1 D3                       .
        jmp     LC404                           ; EDE2 4C 04 C4                 L..

; ----------------------------------------------------------------------------
        stx     SEDORIC_TRAV3                   ; EDE5 86 F5                    ..
        sta     LC004                           ; EDE7 8D 04 C0                 ...
        lda     #$00                            ; EDEA A9 00                    ..
        sta     LC003                           ; EDEC 8D 03 C0                 ...
        sei                                     ; EDEF 78                       x
LEDF0:  sty     LC002                           ; EDF0 8C 02 C0                 ...
        jsr     LDA73                           ; EDF3 20 73 DA                  s.
        inc     LC004                           ; EDF6 EE 04 C0                 ...
        ldy     LC002                           ; EDF9 AC 02 C0                 ...
LEDFC:  cpy     LC04B                           ; EDFC CC 4B C0                 .K.
        bcc     LEE06                           ; EDFF 90 05                    ..
        inc     LC001                           ; EE01 EE 01 C0                 ...
        ldy     #$00                            ; EE04 A0 00                    ..
LEE06:  iny                                     ; EE06 C8                       .
        dec     SEDORIC_TRAV3                   ; EE07 C6 F5                    ..
        bne     LEDF0                           ; EE09 D0 E5                    ..
        cli                                     ; EE0B 58                       X
        rts                                     ; EE0C 60                       `

; ----------------------------------------------------------------------------
LEE0D:  jmp     LE0E0                           ; EE0D 4C E0 E0                 L..

; ----------------------------------------------------------------------------
        beq     LEE39                           ; EE10 F0 27                    .'
        jsr     LD44F                           ; EE12 20 4F D4                  O.
        jsr     LD79E                           ; EE15 20 9E D7                  ..
        jsr     LDFE6                           ; EE18 20 E6 DF                  ..
        lda     #$00                            ; EE1B A9 00                    ..
        ldy     #$C4                            ; EE1D A0 C4                    ..
        sta     LC052                           ; EE1F 8D 52 C0                 .R.
LEE22:  sty     LC053                           ; EE22 8C 53 C0                 .S.
        lda     #$40                            ; EE25 A9 40                    .@
        sta     LC04E                           ; EE27 8D 4E C0                 .N.
        jsr     LE0E5                           ; EE2A 20 E5 E0                  ..
        lda     LC051                           ; EE2D AD 51 C0                 .Q.
        and     #$20                            ; EE30 29 20                    ) 
        beq     LEE0D                           ; EE32 F0 D9                    ..
        lda     #$01                            ; EE34 A9 01                    ..
        sta     LC015                           ; EE36 8D 15 C0                 ...
LEE39:  ldy     LC015                           ; EE39 AC 15 C0                 ...
        dey                                     ; EE3C 88                       .
        bne     LEE0D                           ; EE3D D0 CE                    ..
        lda     BASIC11_FLG                     ; EE3F AD 6A 02                 .j.
        pha                                     ; EE42 48                       H
        php                                     ; EE43 08                       .
        jsr     LDFDE                           ; EE44 20 DE DF                  ..
        lda     #$B8                            ; EE47 A9 B8                    ..
        ldy     #$BB                            ; EE49 A0 BB                    ..
        sta     SEDORIC_TRAV0                   ; EE4B 85 F2                    ..
        sty     SEDORIC_TRAV1                   ; EE4D 84 F3                    ..
        lda     #$E8                            ; EE4F A9 E8                    ..
        ldy     #$C3                            ; EE51 A0 C3                    ..
        sta     SEDORIC_TRAV2                   ; EE53 85 F4                    ..
        sty     SEDORIC_TRAV3                   ; EE55 84 F5                    ..
        ldx     #$04                            ; EE57 A2 04                    ..
        ldy     #$18                            ; EE59 A0 18                    ..
LEE5B:  lda     (SEDORIC_TRAV2),y               ; EE5B B1 F4                    ..
        sta     (SEDORIC_TRAV0),y               ; EE5D 91 F2                    ..
        iny                                     ; EE5F C8                       .
        bne     LEE5B                           ; EE60 D0 F9                    ..
        inc     SEDORIC_TRAV1                   ; EE62 E6 F3                    ..
        inc     SEDORIC_TRAV3                   ; EE64 E6 F5                    ..
        dex                                     ; EE66 CA                       .
        bne     LEE5B                           ; EE67 D0 F2                    ..
LEE69:  jsr     LF327                           ; EE69 20 27 F3                  '.
        jsr     LF309                           ; EE6C 20 09 F3                  ..
LEE6F:  jsr     LD73E                           ; EE6F 20 3E D7                  >.
        cli                                     ; EE72 58                       X
LEE73:  jsr     LD845                           ; EE73 20 45 D8                  E.
LEE76:  bpl     LEE73                           ; EE76 10 FB                    ..
        sei                                     ; EE78 78                       x
        cmp     #$03                            ; EE79 C9 03                    ..
        beq     LEEE5                           ; EE7B F0 68                    .h
        cmp     #$7F                            ; EE7D C9 7F                    ..
        bne     LEE96                           ; EE7F D0 15                    ..
        lda     #$08                            ; EE81 A9 08                    ..
        jsr     LF2EC                           ; EE83 20 EC F2                  ..
        bmi     LEE6F                           ; EE86 30 E7                    0.
        jsr     LF2CA                           ; EE88 20 CA F2                  ..
        bne     LEEA2                           ; EE8B D0 15                    ..
        .byte   $A9                             ; EE8D A9                       .
LEE8E:  ora     #$20                            ; EE8E 09 20                    . 
        rol     a                               ; EE90 2A                       *
        dec     $A9,x                           ; EE91 D6 A9                    ..
        .byte   $7F                             ; EE93 7F                       .
        bne     LEE9A                           ; EE94 D0 04                    ..
LEE96:  cmp     #$20                            ; EE96 C9 20                    . 
        .byte   $90                             ; EE98 90                       .
LEE99:  asl     a                               ; EE99 0A                       .
LEE9A:  jsr     LD62A                           ; EE9A 20 2A D6                  *.
        lda     #$08                            ; EE9D A9 08                    ..
        jsr     LD62A                           ; EE9F 20 2A D6                  *.
LEEA2:  lda     #$09                            ; EEA2 A9 09                    ..
        cmp     #$08                            ; EEA4 C9 08                    ..
        bcc     LEE9A                           ; EEA6 90 F2                    ..
        cmp     #$0C                            ; EEA8 C9 0C                    ..
        beq     LEE6F                           ; EEAA F0 C3                    ..
        bcc     LEEC0                           ; EEAC 90 12                    ..
        cmp     #$0E                            ; EEAE C9 0E                    ..
        beq     LEE6F                           ; EEB0 F0 BD                    ..
        cmp     #$0D                            ; EEB2 C9 0D                    ..
        bne     LEE9A                           ; EEB4 D0 E4                    ..
        lda     #$09                            ; EEB6 A9 09                    ..
LEEB8:  jsr     LF2EC                           ; EEB8 20 EC F2                  ..
        jsr     LF2CA                           ; EEBB 20 CA F2                  ..
        beq     LEEB8                           ; EEBE F0 F8                    ..
LEEC0:  jsr     LF2EC                           ; EEC0 20 EC F2                  ..
        jsr     LF2CA                           ; EEC3 20 CA F2                  ..
        bne     LEEC0                           ; EEC6 D0 F8                    ..
        beq     LEE6F                           ; EEC8 F0 A5                    ..
        pha                                     ; EECA 48                       H
        jsr     LD740                           ; EECB 20 40 D7                  @.
        clc                                     ; EECE 18                       .
        lda     $12                             ; EECF A5 12                    ..
        adc     #$30                            ; EED1 69 30                    i0
        sta     SEDORIC_TRAV6                   ; EED3 85 F8                    ..
        lda     $13                             ; EED5 A5 13                    ..
        adc     #$08                            ; EED7 69 08                    i.
        sta     SEDORIC_TRAV7                   ; EED9 85 F9                    ..
        ldy     BASIC11_Y_TEXT                  ; EEDB AC 69 02                 .i.
        lda     (SEDORIC_TRAV6),y               ; EEDE B1 F8                    ..
        tay                                     ; EEE0 A8                       .
        pla                                     ; EEE1 68                       h
        cpy     #$7F                            ; EEE2 C0 7F                    ..
        rts                                     ; EEE4 60                       `

; ----------------------------------------------------------------------------
LEEE5:  plp                                     ; EEE5 28                       (
        jsr     LF325                           ; EEE6 20 25 F3                  %.
        jmp     LF320                           ; EEE9 4C 20 F3                 L .

; ----------------------------------------------------------------------------
        lsr     SEDORIC_TRAV0                   ; EEEC 46 F2                    F.
LEEEE:  jsr     LD62A                           ; EEEE 20 2A D6                  *.
        ldy     BASIC11_X_TEXT                  ; EEF1 AC 68 02                 .h.
        cpy     #$01                            ; EEF4 C0 01                    ..
        beq     LEEFC                           ; EEF6 F0 04                    ..
        cpy     #$1B                            ; EEF8 C0 1B                    ..
        bne     LEF06                           ; EEFA D0 0A                    ..
LEEFC:  bit     SEDORIC_TRAV0                   ; EEFC 24 F2                    $.
        bmi     LEF08                           ; EEFE 30 08                    0.
        ror     SEDORIC_TRAV0                   ; EF00 66 F2                    f.
        eor     #$01                            ; EF02 49 01                    I.
        bne     LEEEE                           ; EF04 D0 E8                    ..
LEF06:  bit     SEDORIC_TRAV0                   ; EF06 24 F2                    $.
LEF08:  rts                                     ; EF08 60                       `

; ----------------------------------------------------------------------------
        lda     #$1E                            ; EF09 A9 1E                    ..
        jsr     LD62A                           ; EF0B 20 2A D6                  *.
        jsr     LD206                           ; EF0E 20 06 D2                  ..
LEF11:  jsr     LF2CA                           ; EF11 20 CA F2                  ..
        beq     LEF24                           ; EF14 F0 0E                    ..
        lda     #$09                            ; EF16 A9 09                    ..
LEF18:  .byte   $20                             ; EF18 20                        
        .byte   $EC                             ; EF19 EC                       .
LEF1A:  .byte   $F2                             ; EF1A F2                       .
        bpl     LEF11                           ; EF1B 10 F4                    ..
        pla                                     ; EF1D 68                       h
        pla                                     ; EF1E 68                       h
        plp                                     ; EF1F 28                       (
        pla                                     ; EF20 68                       h
        sta     BASIC11_FLG                     ; EF21 8D 6A 02                 .j.
LEF24:  rts                                     ; EF24 60                       `

; ----------------------------------------------------------------------------
        clc                                     ; EF25 18                       .
        bit     $38                             ; EF26 24 38                    $8
        ror     LC072                           ; EF28 6E 72 C0                 nr.
        jsr     LF309                           ; EF2B 20 09 F3                  ..
        lda     #$57                            ; EF2E A9 57                    .W
        ldy     #$C9                            ; EF30 A0 C9                    ..
        sta     $B4                             ; EF32 85 B4                    ..
        sty     $B5                             ; EF34 84 B5                    ..
        lda     #$00                            ; EF36 A9 00                    ..
        sta     SEDORIC_TRAV4                   ; EF38 85 F6                    ..
        sta     SEDORIC_TRAV5                   ; EF3A 85 F7                    ..
        ldy     #$01                            ; EF3C A0 01                    ..
        sty     $26                             ; EF3E 84 26                    .&
        dey                                     ; EF40 88                       .
        sty     $29                             ; EF41 84 29                    .)
        sty     $27                             ; EF43 84 27                    .'
        dey                                     ; EF45 88                       .
        sty     $28                             ; EF46 84 28                    .(
        ldy     SEDORIC_TRAV4                   ; EF48 A4 F6                    ..
        ldx     SEDORIC_TRAV5                   ; EF4A A6 F7                    ..
        inc     SEDORIC_TRAV4                   ; EF4C E6 F6                    ..
        bne     LEF52                           ; EF4E D0 02                    ..
        inc     SEDORIC_TRAV5                   ; EF50 E6 F7                    ..
LEF52:  jsr     L04D1                           ; EF52 20 D1 04                  ..
        ldy     #$00                            ; EF55 A0 00                    ..
        lda     ($B6),y                         ; EF57 B1 B6                    ..
        .byte   $85                             ; EF59 85                       .
LEF5A:  .byte   $F2                             ; EF5A F2                       .
        iny                                     ; EF5B C8                       .
        lda     ($B6),y                         ; EF5C B1 B6                    ..
        sta     $91                             ; EF5E 85 91                    ..
        iny                                     ; EF60 C8                       .
        lda     ($B6),y                         ; EF61 B1 B6                    ..
        sta     $92                             ; EF63 85 92                    ..
        ldx     #$00                            ; EF65 A2 00                    ..
LEF67:  bit     LC072                           ; EF67 2C 72 C0                 ,r.
        bpl     LEF80                           ; EF6A 10 14                    ..
        cpx     SEDORIC_TRAV0                   ; EF6C E4 F2                    ..
        txa                                     ; EF6E 8A                       .
        inx                                     ; EF6F E8                       .
        beq     LEFCB                           ; EF70 F0 59                    .Y
        tay                                     ; EF72 A8                       .
        lda     ($91),y                         ; EF73 B1 91                    ..
        bcc     LEF93                           ; EF75 90 1C                    ..
        lda     #$7F                            ; EF77 A9 7F                    ..
        ldy     BASIC11_Y_TEXT                  ; EF79 AC 69 02                 .i.
        sta     ($12),y                         ; EF7C 91 12                    ..
        bcs     LEF91                           ; EF7E B0 11                    ..
LEF80:  ldy     BASIC11_Y_TEXT                  ; EF80 AC 69 02                 .i.
        lda     ($12),y                         ; EF83 B1 12                    ..
        cmp     #$7F                            ; EF85 C9 7F                    ..
        bne     LEF8B                           ; EF87 D0 02                    ..
        lda     #$20                            ; EF89 A9 20                    . 
LEF8B:  sta     LC100,x                         ; EF8B 9D 00 C1                 ...
        inx                                     ; EF8E E8                       .
        beq     LEFCB                           ; EF8F F0 3A                    .:
LEF91:  lda     #$09                            ; EF91 A9 09                    ..
LEF93:  jsr     LD62A                           ; EF93 20 2A D6                  *.
        jsr     LF2CA                           ; EF96 20 CA F2                  ..
        beq     LEF67                           ; EF99 F0 CC                    ..
        bit     LC072                           ; EF9B 2C 72 C0                 ,r.
        bmi     LEFBC                           ; EF9E 30 1C                    0.
        stx     SEDORIC_TRAV0                   ; EFA0 86 F2                    ..
        txa                                     ; EFA2 8A                       .
        jsr     LD264                           ; EFA3 20 64 D2                  d.
        .byte   $A0                             ; EFA6 A0                       .
LEFA7:  brk                                     ; EFA7 00                       .
LEFA8:  lda     LC100,y                         ; EFA8 B9 00 C1                 ...
        sta     ($D1),y                         ; EFAB 91 D1                    ..
        iny                                     ; EFAD C8                       .
        cpy     SEDORIC_TRAV0                   ; EFAE C4 F2                    ..
        bne     LEFA8                           ; EFB0 D0 F6                    ..
        ldy     #$02                            ; EFB2 A0 02                    ..
LEFB4:  lda     $D0,y                           ; EFB4 B9 D0 00                 ...
        sta     ($B6),y                         ; EFB7 91 B6                    ..
        dey                                     ; EFB9 88                       .
        bpl     LEFB4                           ; EFBA 10 F8                    ..
LEFBC:  lda     #$09                            ; EFBC A9 09                    ..
        jsr     LF2EC                           ; EFBE 20 EC F2                  ..
        bmi     LEFCE                           ; EFC1 30 0B                    0.
        jsr     LF2CA                           ; EFC3 20 CA F2                  ..
        bne     LEFBC                           ; EFC6 D0 F4                    ..
        jmp     LF33C                           ; EFC8 4C 3C F3                 L<.

; ----------------------------------------------------------------------------
LEFCB:  jmp     LE977                           ; EFCB 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
LEFCE:  rts                                     ; EFCE 60                       `

; ----------------------------------------------------------------------------
        lda     $0A                             ; EFCF A5 0A                    ..
        asl     a                               ; EFD1 0A                       .
        adc     #$08                            ; EFD2 69 08                    i.
        bne     LEFE1                           ; EFD4 D0 0B                    ..
        ldy     #$04                            ; EFD6 A0 04                    ..
        lda     ($9E),y                         ; EFD8 B1 9E                    ..
        pha                                     ; EFDA 48                       H
        iny                                     ; EFDB C8                       .
        lda     ($9E),y                         ; EFDC B1 9E                    ..
        tay                                     ; EFDE A8                       .
        pla                                     ; EFDF 68                       h
        .byte   $2C                             ; EFE0 2C                       ,
LEFE1:  ldy     #$00                            ; EFE1 A0 00                    ..
        clc                                     ; EFE3 18                       .
        adc     $9E                             ; EFE4 65 9E                    e.
        sta     SEDORIC_TRAV0                   ; EFE6 85 F2                    ..
        pha                                     ; EFE8 48                       H
        tya                                     ; EFE9 98                       .
        adc     $9F                             ; EFEA 65 9F                    e.
        sta     SEDORIC_TRAV1                   ; EFEC 85 F3                    ..
        tax                                     ; EFEE AA                       .
        pla                                     ; EFEF 68                       h
        ldy     #$00                            ; EFF0 A0 00                    ..
        rts                                     ; EFF2 60                       `

; ----------------------------------------------------------------------------
        ldy     #$00                            ; EFF3 A0 00                    ..
        lda     $9F                             ; EFF5 A5 9F                    ..
        cmp     $A1                             ; EFF7 C5 A1                    ..
        beq     LF002                           ; EFF9 F0 07                    ..
        lda     ($9E),y                         ; EFFB B1 9E                    ..
        iny                                     ; EFFD C8                       .
        and     ($9E),y                         ; EFFE 31 9E                    1.
        bmi     LF024                           ; F000 30 22                    0"
LF002:  ldx     $9E                             ; F002 A6 9E                    ..
        ldy     $9F                             ; F004 A4 9F                    ..
        lda     #$02                            ; F006 A9 02                    ..
        sta     SEDORIC_TRAV0                   ; F008 85 F2                    ..
        lda     #$88                            ; F00A A9 88                    ..
        jsr     LF456                           ; F00C 20 56 F4                  V.
        ldy     #$00                            ; F00F A0 00                    ..
        sty     LC081                           ; F011 8C 81 C0                 ...
        tya                                     ; F014 98                       .
LF015:  sta     ($9E),y                         ; F015 91 9E                    ..
        iny                                     ; F017 C8                       .
        bne     LF015                           ; F018 D0 FB                    ..
        ldy     #$05                            ; F01A A0 05                    ..
LF01C:  lda     LCD25,y                         ; F01C B9 25 CD                 .%.
        sta     ($9E),y                         ; F01F 91 9E                    ..
        dey                                     ; F021 88                       .
        bpl     LF01C                           ; F022 10 F8                    ..
LF024:  rts                                     ; F024 60                       `

; ----------------------------------------------------------------------------
        pha                                     ; F025 48                       H
        sty     SEDORIC_TRAV1                   ; F026 84 F3                    ..
        stx     SEDORIC_TRAV7                   ; F028 86 F9                    ..
        clc                                     ; F02A 18                       .
LF02B:  ldy     #$86                            ; F02B A0 86                    ..
LF02D:  lda     ($9E),y                         ; F02D B1 9E                    ..
        cmp     SEDORIC_TRAV7                   ; F02F C5 F9                    ..
        iny                                     ; F031 C8                       .
        lda     ($9E),y                         ; F032 B1 9E                    ..
        sbc     SEDORIC_TRAV1                   ; F034 E5 F3                    ..
        bcc     LF047                           ; F036 90 0F                    ..
        dey                                     ; F038 88                       .
        clc                                     ; F039 18                       .
        pla                                     ; F03A 68                       h
        pha                                     ; F03B 48                       H
        adc     ($9E),y                         ; F03C 71 9E                    q.
        .byte   $91                             ; F03E 91                       .
LF03F:  .byte   $9E                             ; F03F 9E                       .
        iny                                     ; F040 C8                       .
        lda     ($9E),y                         ; F041 B1 9E                    ..
        adc     SEDORIC_TRAV0                   ; F043 65 F2                    e.
        sta     ($9E),y                         ; F045 91 9E                    ..
LF047:  dey                                     ; F047 88                       .
        dey                                     ; F048 88                       .
        dey                                     ; F049 88                       .
        bne     LF02D                           ; F04A D0 E1                    ..
        txa                                     ; F04C 8A                       .
        adc     $9E                             ; F04D 65 9E                    e.
        tax                                     ; F04F AA                       .
        lda     SEDORIC_TRAV1                   ; F050 A5 F3                    ..
        adc     $9F                             ; F052 65 9F                    e.
        tay                                     ; F054 A8                       .
        pla                                     ; F055 68                       h
        stx     $CE                             ; F056 86 CE                    ..
        sty     $CF                             ; F058 84 CF                    ..
        clc                                     ; F05A 18                       .
        adc     $A0                             ; F05B 65 A0                    e.
        sta     $C7                             ; F05D 85 C7                    ..
        pha                                     ; F05F 48                       H
        lda     $A0                             ; F060 A5 A0                    ..
        ldy     $A1                             ; F062 A4 A1                    ..
        sta     $C9                             ; F064 85 C9                    ..
        lda     $A1                             ; F066 A5 A1                    ..
        sta     $CA                             ; F068 85 CA                    ..
        adc     SEDORIC_TRAV0                   ; F06A 65 F2                    e.
        sta     $C8                             ; F06C 85 C8                    ..
        tay                                     ; F06E A8                       .
        pla                                     ; F06F 68                       h
        jmp     LD15C                           ; F070 4C 5C D1                 L\.

; ----------------------------------------------------------------------------
        pha                                     ; F073 48                       H
        jsr     LF3F3                           ; F074 20 F3 F3                  ..
        pla                                     ; F077 68                       h
        tax                                     ; F078 AA                       .
        clc                                     ; F079 18                       .
        php                                     ; F07A 08                       .
        bcc     LF087                           ; F07B 90 0A                    ..
        clc                                     ; F07D 18                       .
        .byte   $24                             ; F07E 24                       $
LF07F:  sec                                     ; F07F 38                       8
        php                                     ; F080 08                       .
        jsr     LF3F3                           ; F081 20 F3 F3                  ..
        jsr     LD27F                           ; F084 20 7F D2                  ..
LF087:  cpx     #$40                            ; F087 E0 40                    .@
        bcs     LF0A5                           ; F089 B0 1A                    ..
        stx     $0A                             ; F08B 86 0A                    ..
        jsr     LF3CF                           ; F08D 20 CF F3                  ..
        iny                                     ; F090 C8                       .
        plp                                     ; F091 28                       (
        lda     (SEDORIC_TRAV0),y               ; F092 B1 F2                    ..
        bne     LF0A0                           ; F094 D0 0A                    ..
        bcs     LF0A2                           ; F096 B0 0A                    ..
        ldx     #$0D                            ; F098 A2 0D                    ..
        bit     $0EA2                           ; F09A 2C A2 0E                 ,..
        jmp     LD67E                           ; F09D 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LF0A0:  .byte   $B0                             ; F0A0 B0                       .
LF0A1:  .byte   $F9                             ; F0A1 F9                       .
LF0A2:  jmp     LD39E                           ; F0A2 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LF0A5:  jmp     LDE20                           ; F0A5 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        lda     #$88                            ; F0A8 A9 88                    ..
        ldy     #$00                            ; F0AA A0 00                    ..
        jsr     LF3E3                           ; F0AC 20 E3 F3                  ..
        sta     $06                             ; F0AF 85 06                    ..
        stx     $07                             ; F0B1 86 07                    ..
        lda     $0A                             ; F0B3 A5 0A                    ..
        asl     a                               ; F0B5 0A                       .
        adc     #$08                            ; F0B6 69 08                    i.
        tay                                     ; F0B8 A8                       .
        jsr     LF3D8                           ; F0B9 20 D8 F3                  ..
        sta     L0000                           ; F0BC 85 00                    ..
        clc                                     ; F0BE 18                       .
        .byte   $69                             ; F0BF 69                       i
LF0C0:  .byte   $17                             ; F0C0 17                       .
        sta     $02                             ; F0C1 85 02                    ..
        sta     $04                             ; F0C3 85 04                    ..
        txa                                     ; F0C5 8A                       .
        sta     $01                             ; F0C6 85 01                    ..
        adc     #$00                            ; F0C8 69 00                    i.
        sta     $03                             ; F0CA 85 03                    ..
        adc     #$01                            ; F0CC 69 01                    i.
        sta     $05                             ; F0CE 85 05                    ..
        iny                                     ; F0D0 C8                       .
        lda     (L0000),y                       ; F0D1 B1 00                    ..
        sta     LC083                           ; F0D3 8D 83 C0                 ...
LF0D6:  dey                                     ; F0D6 88                       .
        lda     (L0000),y                       ; F0D7 B1 00                    ..
        sta     $0B                             ; F0D9 85 0B                    ..
        rts                                     ; F0DB 60                       `

; ----------------------------------------------------------------------------
        clc                                     ; F0DC 18                       .
        adc     $02                             ; F0DD 65 02                    e.
        sta     $02                             ; F0DF 85 02                    ..
        bcc     LF0E5                           ; F0E1 90 02                    ..
        inc     $03                             ; F0E3 E6 03                    ..
LF0E5:  rts                                     ; F0E5 60                       `

; ----------------------------------------------------------------------------
        lda     #$80                            ; F0E6 A9 80                    ..
        bit     a:$A9                           ; F0E8 2C A9 00                 ,..
        bit     STACK+169                       ; F0EB 2C A9 01                 ,..
        bit     $40A9                           ; F0EE 2C A9 40                 ,.@
        sta     LC082                           ; F0F1 8D 82 C0                 ...
        lda     #$06                            ; F0F4 A9 06                    ..
        jsr     LF3E1                           ; F0F6 20 E1 F3                  ..
        lda     (SEDORIC_TRAV0),y               ; F0F9 B1 F2                    ..
        sta     SEDORIC_TRAV2                   ; F0FB 85 F4                    ..
        iny                                     ; F0FD C8                       .
        lda     (SEDORIC_TRAV0),y               ; F0FE B1 F2                    ..
        sta     SEDORIC_TRAV3                   ; F100 85 F5                    ..
        jsr     LF3D6                           ; F102 20 D6 F3                  ..
LF105:  lda     SEDORIC_TRAV2                   ; F105 A5 F4                    ..
        ora     SEDORIC_TRAV3                   ; F107 05 F5                    ..
        beq     LF15F                           ; F109 F0 54                    .T
        lda     SEDORIC_TRAV2                   ; F10B A5 F4                    ..
        bne     LF111                           ; F10D D0 02                    ..
        dec     SEDORIC_TRAV3                   ; F10F C6 F5                    ..
LF111:  dec     SEDORIC_TRAV2                   ; F111 C6 F4                    ..
        ldy     #$06                            ; F113 A0 06                    ..
        bit     LC082                           ; F115 2C 82 C0                 ,..
        bpl     LF126                           ; F118 10 0C                    ..
        sec                                     ; F11A 38                       8
        lda     (SEDORIC_TRAV0),y               ; F11B B1 F2                    ..
        sbc     $0A                             ; F11D E5 0A                    ..
        bne     LF152                           ; F11F D0 31                    .1
        tay                                     ; F121 A8                       .
        sta     (SEDORIC_TRAV0),y               ; F122 91 F2                    ..
        beq     LF152                           ; F124 F0 2C                    .,
LF126:  bvc     LF14B                           ; F126 50 23                    P#
        ldy     #$00                            ; F128 A0 00                    ..
        lda     (SEDORIC_TRAV0),y               ; F12A B1 F2                    ..
LF12C:  bne     LF152                           ; F12C D0 24                    .$
LF12E:  .byte   $A5                             ; F12E A5                       .
LF12F:  .byte   $F2                             ; F12F F2                       .
        ldy     SEDORIC_TRAV1                   ; F130 A4 F3                    ..
        sta     SEDORIC_TRAV2                   ; F132 85 F4                    ..
        sty     SEDORIC_TRAV3                   ; F134 84 F5                    ..
        rts                                     ; F136 60                       `

; ----------------------------------------------------------------------------
LF137:  ldy     #$09                            ; F137 A0 09                    ..
        lda     LC082                           ; F139 AD 82 C0                 ...
        bne     LF12E                           ; F13C D0 F0                    ..
LF13E:  lda     (SEDORIC_TRAV0),y               ; F13E B1 F2                    ..
        sta     LC076,y                         ; F140 99 76 C0                 .v.
        dey                                     ; F143 88                       .
        bpl     LF13E                           ; F144 10 F8                    ..
        bmi     LF12E                           ; F146 30 E6                    0.
LF148:  dey                                     ; F148 88                       .
        bmi     LF137                           ; F149 30 EC                    0.
LF14B:  lda     (SEDORIC_TRAV0),y               ; F14B B1 F2                    ..
        cmp     LC076,y                         ; F14D D9 76 C0                 .v.
        beq     LF148                           ; F150 F0 F6                    ..
LF152:  lda     #$0A                            ; F152 A9 0A                    ..
        clc                                     ; F154 18                       .
        adc     SEDORIC_TRAV0                   ; F155 65 F2                    e.
        sta     SEDORIC_TRAV0                   ; F157 85 F2                    ..
        bcc     LF105                           ; F159 90 AA                    ..
        inc     SEDORIC_TRAV1                   ; F15B E6 F3                    ..
        .byte   $B0                             ; F15D B0                       .
LF15E:  .byte   $A6                             ; F15E A6                       .
LF15F:  bit     LC082                           ; F15F 2C 82 C0                 ,..
        bvc     LF1AC                           ; F162 50 48                    PH
        ldy     #$04                            ; F164 A0 04                    ..
        lda     ($9E),y                         ; F166 B1 9E                    ..
        pha                                     ; F168 48                       H
        tax                                     ; F169 AA                       .
        iny                                     ; F16A C8                       .
        lda     ($9E),y                         ; F16B B1 9E                    ..
        pha                                     ; F16D 48                       H
        tay                                     ; F16E A8                       .
        txa                                     ; F16F 8A                       .
        jsr     LF3E3                           ; F170 20 E3 F3                  ..
        jsr     LF52E                           ; F173 20 2E F5                  ..
        pla                                     ; F176 68                       h
        tay                                     ; F177 A8                       .
        pla                                     ; F178 68                       h
        tax                                     ; F179 AA                       .
        lda     #$00                            ; F17A A9 00                    ..
        sta     SEDORIC_TRAV0                   ; F17C 85 F2                    ..
        lda     #$64                            ; F17E A9 64                    .d
        jsr     LF425                           ; F180 20 25 F4                  %.
        sec                                     ; F183 38                       8
        ldy     #$04                            ; F184 A0 04                    ..
        lda     ($9E),y                         ; F186 B1 9E                    ..
        sbc     #$64                            ; F188 E9 64                    .d
        sta     ($9E),y                         ; F18A 91 9E                    ..
        iny                                     ; F18C C8                       .
        lda     ($9E),y                         ; F18D B1 9E                    ..
        sbc     #$00                            ; F18F E9 00                    ..
        sta     ($9E),y                         ; F191 91 9E                    ..
        ldy     #$06                            ; F193 A0 06                    ..
        lda     #$09                            ; F195 A9 09                    ..
        adc     ($9E),y                         ; F197 71 9E                    q.
        sta     ($9E),y                         ; F199 91 9E                    ..
        iny                                     ; F19B C8                       .
        lda     ($9E),y                         ; F19C B1 9E                    ..
        adc     #$00                            ; F19E 69 00                    i.
        sta     ($9E),y                         ; F1A0 91 9E                    ..
        lda     #$00                            ; F1A2 A9 00                    ..
        ldy     #$63                            ; F1A4 A0 63                    .c
LF1A6:  sta     (SEDORIC_TRAV2),y               ; F1A6 91 F4                    ..
        dey                                     ; F1A8 88                       .
        bpl     LF1A6                           ; F1A9 10 FB                    ..
        rts                                     ; F1AB 60                       `

; ----------------------------------------------------------------------------
LF1AC:  bmi     LF1B4                           ; F1AC 30 06                    0.
        lsr     LC082                           ; F1AE 4E 82 C0                 N..
        bcc     LF1B5                           ; F1B1 90 02                    ..
        clc                                     ; F1B3 18                       .
LF1B4:  rts                                     ; F1B4 60                       `

; ----------------------------------------------------------------------------
LF1B5:  ldx     #$13                            ; F1B5 A2 13                    ..
        jmp     LD67E                           ; F1B7 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        jsr     XXXX                            ; F1BA 20 40 F6                  @.
        jsr     LF3F3                           ; F1BD 20 F3 F3                  ..
        lda     #$D3                            ; F1C0 A9 D3                    ..
        jsr     LD22E                           ; F1C2 20 2E D2                  ..
        jsr     LED2E                           ; F1C5 20 2E ED                  ..
        jsr     LF4E9                           ; F1C8 20 E9 F4                  ..
        jsr     LF67A                           ; F1CB 20 7A F6                  z.
        lda     LC07C                           ; F1CE AD 7C C0                 .|.
        sta     $0A                             ; F1D1 85 0A                    ..
        jsr     LF4A8                           ; F1D3 20 A8 F4                  ..
        lda     LC07D                           ; F1D6 AD 7D C0                 .}.
        jsr     LF4DC                           ; F1D9 20 DC F4                  ..
        ldx     $0B                             ; F1DC A6 0B                    ..
        dex                                     ; F1DE CA                       .
        bne     LF1E9                           ; F1DF D0 08                    ..
        ldx     LC07F                           ; F1E1 AE 7F C0                 ...
        .byte   $AC                             ; F1E4 AC                       .
LF1E5:  ror     LD0C0,x                         ; F1E5 7E C0 D0                 ~..
        .byte   $0E                             ; F1E8 0E                       .
LF1E9:  ldy     #$00                            ; F1E9 A0 00                    ..
        lda     ($02),y                         ; F1EB B1 02                    ..
        iny                                     ; F1ED C8                       .
        tax                                     ; F1EE AA                       .
        lda     ($02),y                         ; F1EF B1 02                    ..
        tay                                     ; F1F1 A8                       .
        lda     #$02                            ; F1F2 A9 02                    ..
        jsr     LF4DC                           ; F1F4 20 DC F4                  ..
        sty     SEDORIC_TRAV3                   ; F1F7 84 F5                    ..
        txa                                     ; F1F9 8A                       .
        bmi     LF225                           ; F1FA 30 29                    0)
        bne     LF20A                           ; F1FC D0 0C                    ..
        lda     $02                             ; F1FE A5 02                    ..
        ldy     $03                             ; F200 A4 03                    ..
        jsr     LD2BA                           ; F202 20 BA D2                  ..
        jmp     LF620                           ; F205 4C 20 F6                 L .

; ----------------------------------------------------------------------------
        nop                                     ; F208 EA                       .
        nop                                     ; F209 EA                       .
LF20A:  asl     a                               ; F20A 0A                       .
        asl     a                               ; F20B 0A                       .
        ldy     #$00                            ; F20C A0 00                    ..
        lda     ($02),y                         ; F20E B1 02                    ..
        tay                                     ; F210 A8                       .
        sta     SEDORIC_TRAV0                   ; F211 85 F2                    ..
        lda     #$00                            ; F213 A9 00                    ..
        bcs     LF21D                           ; F215 B0 06                    ..
        ldy     #$01                            ; F217 A0 01                    ..
        lda     ($02),y                         ; F219 B1 02                    ..
        ldy     SEDORIC_TRAV0                   ; F21B A4 F2                    ..
LF21D:  jsr     LD254                           ; F21D 20 54 D2                  T.
        lda     $29                             ; F220 A5 29                    .)
        jmp     LD1FE                           ; F222 4C FE D1                 L..

; ----------------------------------------------------------------------------
LF225:  lda     SEDORIC_TRAV3                   ; F225 A5 F5                    ..
        jsr     LD264                           ; F227 20 64 D2                  d.
        tay                                     ; F22A A8                       .
        beq     LF235                           ; F22B F0 08                    ..
LF22D:  dey                                     ; F22D 88                       .
        lda     ($02),y                         ; F22E B1 02                    ..
        sta     ($D1),y                         ; F230 91 D1                    ..
        tya                                     ; F232 98                       .
        bne     LF22D                           ; F233 D0 F8                    ..
LF235:  jmp     LEE8E                           ; F235 4C 8E EE                 L..

; ----------------------------------------------------------------------------
        .byte   $14                             ; F238 14                       .
        .byte   $14                             ; F239 14                       .
        .byte   $14                             ; F23A 14                       .
        .byte   $14                             ; F23B 14                       .
        .byte   $04                             ; F23C 04                       .
        .byte   $04                             ; F23D 04                       .
        .byte   $04                             ; F23E 04                       .
        .byte   $04                             ; F23F 04                       .
        ldx     #$0A                            ; F240 A2 0A                    ..
        lda     #$00                            ; F242 A9 00                    ..
LF244:  sta     LC075,x                         ; F244 9D 75 C0                 .u.
        dex                                     ; F247 CA                       .
        bne     LF244                           ; F248 D0 FA                    ..
        lda     $0A                             ; F24A A5 0A                    ..
        sta     LC07C                           ; F24C 8D 7C C0                 .|.
        jsr     LD39E                           ; F24F 20 9E D3                  ..
        jmp     LF658                           ; F252 4C 58 F6                 LX.

; ----------------------------------------------------------------------------
LF255:  jsr     LD398                           ; F255 20 98 D3                  ..
        beq     LF2CC                           ; F258 F0 72                    .r
        cmp     #$80                            ; F25A C9 80                    ..
        bcs     LF2CC                           ; F25C B0 6E                    .n
        cmp     #$28                            ; F25E C9 28                    .(
        beq     LF26C                           ; F260 F0 0A                    ..
        cpx     #$05                            ; F262 E0 05                    ..
        beq     LF255                           ; F264 F0 EF                    ..
        sta     LC076,x                         ; F266 9D 76 C0                 .v.
        inx                                     ; F269 E8                       .
        bne     LF255                           ; F26A D0 E9                    ..
LF26C:  jsr     LD398                           ; F26C 20 98 D3                  ..
        jsr     LD27F                           ; F26F 20 7F D2                  ..
        stx     LC07B                           ; F272 8E 7B C0                 .{.
        lda     #$29                            ; F275 A9 29                    .)
        jmp     LD22E                           ; F277 4C 2E D2                 L..

; ----------------------------------------------------------------------------
        lda     LC07F                           ; F27A AD 7F C0                 ...
        sta     LC07F                           ; F27D 8D 7F C0                 ...
        asl     a                               ; F280 0A                       .
        jmp     LD21C                           ; F281 4C 1C D2                 L..

; ----------------------------------------------------------------------------
        lda     #$00                            ; F284 A9 00                    ..
        sta     SEDORIC_TRAV0                   ; F286 85 F2                    ..
        sta     LC085                           ; F288 8D 85 C0                 ...
        sta     L0008                           ; F28B 85 08                    ..
        sta     $09                             ; F28D 85 09                    ..
        lda     LC083                           ; F28F AD 83 C0                 ...
        ldx     #$08                            ; F292 A2 08                    ..
        sta     SEDORIC_TRAV1                   ; F294 85 F3                    ..
LF296:  lsr     SEDORIC_TRAV1                   ; F296 46 F3                    F.
        bcc     LF2AF                           ; F298 90 15                    ..
        clc                                     ; F29A 18                       .
        lda     $33                             ; F29B A5 33                    .3
        adc     LC085                           ; F29D 6D 85 C0                 m..
        sta     LC085                           ; F2A0 8D 85 C0                 ...
        lda     $34                             ; F2A3 A5 34                    .4
        adc     L0008                           ; F2A5 65 08                    e.
        sta     L0008                           ; F2A7 85 08                    ..
        lda     SEDORIC_TRAV0                   ; F2A9 A5 F2                    ..
        adc     $09                             ; F2AB 65 09                    e.
        sta     $09                             ; F2AD 85 09                    ..
LF2AF:  asl     $33                             ; F2AF 06 33                    .3
        rol     $34                             ; F2B1 26 34                    &4
        rol     SEDORIC_TRAV0                   ; F2B3 26 F2                    &.
        dex                                     ; F2B5 CA                       .
        bne     LF296                           ; F2B6 D0 DE                    ..
        jsr     LF6CD                           ; F2B8 20 CD F6                  ..
        jsr     LF4A8                           ; F2BB 20 A8 F4                  ..
        clc                                     ; F2BE 18                       .
        lda     LC085                           ; F2BF AD 85 C0                 ...
        adc     $06                             ; F2C2 65 06                    e.
        sta     $06                             ; F2C4 85 06                    ..
        bcc     LF2CA                           ; F2C6 90 02                    ..
        inc     $07                             ; F2C8 E6 07                    ..
LF2CA:  ldy     #$00                            ; F2CA A0 00                    ..
LF2CC:  rts                                     ; F2CC 60                       `

; ----------------------------------------------------------------------------
        jsr     LF4A8                           ; F2CD 20 A8 F4                  ..
        clc                                     ; F2D0 18                       .
        lda     L0008                           ; F2D1 A5 08                    ..
        ldx     $09                             ; F2D3 A6 09                    ..
        adc     #$02                            ; F2D5 69 02                    i.
        bcc     LF2DA                           ; F2D7 90 01                    ..
        inx                                     ; F2D9 E8                       .
LF2DA:  ldy     #$0A                            ; F2DA A0 0A                    ..
        sec                                     ; F2DC 38                       8
        sbc     ($04),y                         ; F2DD F1 04                    ..
        pha                                     ; F2DF 48                       H
        iny                                     ; F2E0 C8                       .
        txa                                     ; F2E1 8A                       .
        sbc     ($04),y                         ; F2E2 F1 04                    ..
        tay                                     ; F2E4 A8                       .
        pla                                     ; F2E5 68                       h
        bcc     LF2EB                           ; F2E6 90 03                    ..
        jsr     LF75A                           ; F2E8 20 5A F7                  Z.
LF2EB:  .byte   $A2                             ; F2EB A2                       .
LF2EC:  .byte   $FF                             ; F2EC FF                       .
        clc                                     ; F2ED 18                       .
        lda     L0008                           ; F2EE A5 08                    ..
        adc     #$05                            ; F2F0 69 05                    i.
        sta     L0008                           ; F2F2 85 08                    ..
        bcc     LF2F8                           ; F2F4 90 02                    ..
        inc     $09                             ; F2F6 E6 09                    ..
LF2F8:  sec                                     ; F2F8 38                       8
LF2F9:  lda     L0008                           ; F2F9 A5 08                    ..
        tay                                     ; F2FB A8                       .
        sbc     #$7F                            ; F2FC E9 7F                    ..
        sta     L0008                           ; F2FE 85 08                    ..
        lda     $09                             ; F300 A5 09                    ..
        sbc     #$00                            ; F302 E9 00                    ..
        sta     $09                             ; F304 85 09                    ..
        inx                                     ; F306 E8                       .
        bcs     LF2F9                           ; F307 B0 F0                    ..
LF309:  iny                                     ; F309 C8                       .
        tya                                     ; F30A 98                       .
        asl     a                               ; F30B 0A                       .
        sta     LC084                           ; F30C 8D 84 C0                 ...
        sta     SEDORIC_TRAV6                   ; F30F 85 F8                    ..
        txa                                     ; F311 8A                       .
        pha                                     ; F312 48                       H
        jsr     LF4A8                           ; F313 20 A8 F4                  ..
        pla                                     ; F316 68                       h
        clc                                     ; F317 18                       .
        adc     $05                             ; F318 65 05                    e.
        sta     $05                             ; F31A 85 05                    ..
        sta     SEDORIC_TRAV5                   ; F31C 85 F7                    ..
        .byte   $AC                             ; F31E AC                       .
        .byte   $84                             ; F31F 84                       .
LF320:  cpy     #$20                            ; F320 C0 20                    . 
        rol     SEDORIC_TRAV5,x                 ; F322 36 F7                    6.
        .byte   $4C                             ; F324 4C                       L
LF325:  rol     SEDORIC_TRAV5,x                 ; F325 36 F7                    6.
LF327:  jsr     LF4A8                           ; F327 20 A8 F4                  ..
        lda     SEDORIC_TRAV5                   ; F32A A5 F7                    ..
        sta     $05                             ; F32C 85 05                    ..
        ldy     SEDORIC_TRAV6                   ; F32E A4 F8                    ..
        jsr     LF733                           ; F330 20 33 F7                  3.
        ldx     #$A8                            ; F333 A2 A8                    ..
        bit     $88A2                           ; F335 2C A2 88                 ,..
        lda     ($04),y                         ; F338 B1 04                    ..
        .byte   $8D                             ; F33A 8D                       .
        .byte   $01                             ; F33B 01                       .
LF33C:  cpy     #$C8                            ; F33C C0 C8                    ..
        lda     ($04),y                         ; F33E B1 04                    ..
        sta     LC002                           ; F340 8D 02 C0                 ...
        lda     $06                             ; F343 A5 06                    ..
        sta     LC003                           ; F345 8D 03 C0                 ...
        lda     $07                             ; F348 A5 07                    ..
        sta     LC004                           ; F34A 8D 04 C0                 ...
        inc     $07                             ; F34D E6 07                    ..
        iny                                     ; F34F C8                       .
        bne     LF356                           ; F350 D0 04                    ..
        inc     $05                             ; F352 E6 05                    ..
        ldy     #$02                            ; F354 A0 02                    ..
LF356:  jmp     LDA75                           ; F356 4C 75 DA                 Lu.

; ----------------------------------------------------------------------------
LF359:  rts                                     ; F359 60                       `

; ----------------------------------------------------------------------------
        sta     LC058                           ; F35A 8D 58 C0                 .X.
        sty     LC059                           ; F35D 8C 59 C0                 .Y.
        ora     LC059                           ; F360 0D 59 C0                 .Y.
        beq     LF359                           ; F363 F0 F4                    ..
        jsr     LDA4C                           ; F365 20 4C DA                  L.
        jsr     LF4A8                           ; F368 20 A8 F4                  ..
        ldy     #$02                            ; F36B A0 02                    ..
        lda     (L0000),y                       ; F36D B1 00                    ..
        beq     LF385                           ; F36F F0 14                    ..
        clc                                     ; F371 18                       .
        adc     $05                             ; F372 65 05                    e.
        sta     $05                             ; F374 85 05                    ..
        dec     $05                             ; F376 C6 05                    ..
        ldy     #$00                            ; F378 A0 00                    ..
        lda     ($04),y                         ; F37A B1 04                    ..
        tax                                     ; F37C AA                       .
        iny                                     ; F37D C8                       .
        lda     ($04),y                         ; F37E B1 04                    ..
        iny                                     ; F380 C8                       .
        inc     $05                             ; F381 E6 05                    ..
        bne     LF38F                           ; F383 D0 0A                    ..
LF385:  ldy     #$13                            ; F385 A0 13                    ..
        lda     (L0000),y                       ; F387 B1 00                    ..
        tax                                     ; F389 AA                       .
        iny                                     ; F38A C8                       .
        lda     (L0000),y                       ; F38B B1 00                    ..
        ldy     #$0C                            ; F38D A0 0C                    ..
LF38F:  stx     LC001                           ; F38F 8E 01 C0                 ...
        sta     LC002                           ; F392 8D 02 C0                 ...
        jsr     LF85F                           ; F395 20 5F F8                  _.
LF398:  iny                                     ; F398 C8                       .
        lda     ($04),y                         ; F399 B1 04                    ..
        beq     LF3A2                           ; F39B F0 05                    ..
        iny                                     ; F39D C8                       .
        bne     LF398                           ; F39E D0 F8                    ..
        beq     LF3D6                           ; F3A0 F0 34                    .4
LF3A2:  dey                                     ; F3A2 88                       .
LF3A3:  lda     LC058                           ; F3A3 AD 58 C0                 .X.
        ora     LC059                           ; F3A6 0D 59 C0                 .Y.
        beq     LF402                           ; F3A9 F0 57                    .W
        jsr     LF85F                           ; F3AB 20 5F F8                  _.
        lda     LC058                           ; F3AE AD 58 C0                 .X.
        bne     LF3B6                           ; F3B1 D0 03                    ..
        dec     LC059                           ; F3B3 CE 59 C0                 .Y.
LF3B6:  dec     LC058                           ; F3B6 CE 58 C0                 .X.
        sty     LC05F                           ; F3B9 8C 5F C0                 ._.
        jsr     LF838                           ; F3BC 20 38 F8                  8.
        sty     SEDORIC_TRAV0                   ; F3BF 84 F2                    ..
        ldy     LC05F                           ; F3C1 AC 5F C0                 ._.
        sta     ($04),y                         ; F3C4 91 04                    ..
        iny                                     ; F3C6 C8                       .
        lda     SEDORIC_TRAV0                   ; F3C7 A5 F2                    ..
        sta     ($04),y                         ; F3C9 91 04                    ..
        iny                                     ; F3CB C8                       .
        bne     LF3A3                           ; F3CC D0 D5                    ..
        .byte   $AD                             ; F3CE AD                       .
LF3CF:  cli                                     ; F3CF 58                       X
        cpy     #$0D                            ; F3D0 C0 0D                    ..
        eor     LF0C0,y                         ; F3D2 59 C0 F0                 Y..
        .byte   $2C                             ; F3D5 2C                       ,
LF3D6:  .byte   $20                             ; F3D6 20                        
        .byte   $4C                             ; F3D7 4C                       L
LF3D8:  sed                                     ; F3D8 F8                       .
        sta     SEDORIC_TRAV3                   ; F3D9 85 F5                    ..
        sty     SEDORIC_TRAV4                   ; F3DB 84 F6                    ..
        ldy     #$00                            ; F3DD A0 00                    ..
        sta     ($04),y                         ; F3DF 91 04                    ..
LF3E1:  iny                                     ; F3E1 C8                       .
        .byte   $A5                             ; F3E2 A5                       .
LF3E3:  inc     $91,x                           ; F3E3 F6 91                    ..
        .byte   $04                             ; F3E5 04                       .
        jsr     LDAA4                           ; F3E6 20 A4 DA                  ..
        lda     SEDORIC_TRAV3                   ; F3E9 A5 F5                    ..
        ldy     SEDORIC_TRAV4                   ; F3EB A4 F6                    ..
        sta     LC001                           ; F3ED 8D 01 C0                 ...
        sty     LC002                           ; F3F0 8C 02 C0                 ...
LF3F3:  jsr     LF86A                           ; F3F3 20 6A F8                  j.
        lda     #$00                            ; F3F6 A9 00                    ..
        tay                                     ; F3F8 A8                       .
LF3F9:  sta     ($04),y                         ; F3F9 91 04                    ..
        iny                                     ; F3FB C8                       .
        bne     LF3F9                           ; F3FC D0 FB                    ..
        ldy     #$02                            ; F3FE A0 02                    ..
        bne     LF3A3                           ; F400 D0 A1                    ..
LF402:  jsr     LDAA4                           ; F402 20 A4 DA                  ..
        ldy     #$06                            ; F405 A0 06                    ..
LF407:  lda     (L0000),y                       ; F407 B1 00                    ..
        sta     LC022,y                         ; F409 99 22 C0                 .".
        iny                                     ; F40C C8                       .
        cpy     #$17                            ; F40D C0 17                    ..
        bne     LF407                           ; F40F D0 F6                    ..
        jsr     LDB30                           ; F411 20 30 DB                  0.
        bne     LF419                           ; F414 D0 03                    ..
        jmp     LE0DD                           ; F416 4C DD E0                 L..

; ----------------------------------------------------------------------------
LF419:  jsr     LDAEE                           ; F419 20 EE DA                  ..
        jsr     LDA8A                           ; F41C 20 8A DA                  ..
        jsr     LDA82                           ; F41F 20 82 DA                  ..
        jsr     LF4A8                           ; F422 20 A8 F4                  ..
LF425:  ldy     #$13                            ; F425 A0 13                    ..
        lda     (L0000),y                       ; F427 B1 00                    ..
        sta     LC001                           ; F429 8D 01 C0                 ...
        iny                                     ; F42C C8                       .
        lda     (L0000),y                       ; F42D B1 00                    ..
        sta     LC002                           ; F42F 8D 02 C0                 ...
        jsr     LF85F                           ; F432 20 5F F8                  _.
        jmp     LDAA4                           ; F435 4C A4 DA                 L..

; ----------------------------------------------------------------------------
        ldy     #$0A                            ; F438 A0 0A                    ..
        inc     $03                             ; F43A E6 03                    ..
        lda     ($02),y                         ; F43C B1 02                    ..
        clc                                     ; F43E 18                       .
        adc     #$01                            ; F43F 69 01                    i.
        sta     ($02),y                         ; F441 91 02                    ..
        iny                                     ; F443 C8                       .
        lda     ($02),y                         ; F444 B1 02                    ..
        adc     #$00                            ; F446 69 00                    i.
        sta     ($02),y                         ; F448 91 02                    ..
        dec     $03                             ; F44A C6 03                    ..
        ldy     #$15                            ; F44C A0 15                    ..
        lda     (L0000),y                       ; F44E B1 00                    ..
        clc                                     ; F450 18                       .
        adc     #$01                            ; F451 69 01                    i.
        sta     (L0000),y                       ; F453 91 00                    ..
        iny                                     ; F455 C8                       .
LF456:  lda     (L0000),y                       ; F456 B1 00                    ..
        adc     #$00                            ; F458 69 00                    i.
        sta     (L0000),y                       ; F45A 91 00                    ..
        jmp     LDC6C                           ; F45C 4C 6C DC                 Ll.

; ----------------------------------------------------------------------------
        lda     $04                             ; F45F A5 04                    ..
        sta     LC003                           ; F461 8D 03 C0                 ...
        lda     $05                             ; F464 A5 05                    ..
        sta     LC004                           ; F466 8D 04 C0                 ...
        rts                                     ; F469 60                       `

; ----------------------------------------------------------------------------
        inc     $05                             ; F46A E6 05                    ..
        clc                                     ; F46C 18                       .
        ldy     #$02                            ; F46D A0 02                    ..
        lda     (L0000),y                       ; F46F B1 00                    ..
        adc     #$01                            ; F471 69 01                    i.
        sta     (L0000),y                       ; F473 91 00                    ..
        lda     $04                             ; F475 A5 04                    ..
        ldy     $05                             ; F477 A4 05                    ..
        jsr     LF885                           ; F479 20 85 F8                  ..
        .byte   $A9                             ; F47C A9                       .
LF47D:  ora     ($85,x)                         ; F47D 01 85                    ..
        .byte   $F2                             ; F47F F2                       .
        lda     #$00                            ; F480 A9 00                    ..
        jmp     LF425                           ; F482 4C 25 F4                 L%.

; ----------------------------------------------------------------------------
        sec                                     ; F485 38                       8
        sbc     $9E                             ; F486 E5 9E                    ..
        tax                                     ; F488 AA                       .
        tya                                     ; F489 98                       .
        sbc     $9F                             ; F48A E5 9F                    ..
        tay                                     ; F48C A8                       .
        rts                                     ; F48D 60                       `

; ----------------------------------------------------------------------------
        jsr     LD24C                           ; F48E 20 4C D2                  L.
        lda     $D4                             ; F491 A5 D4                    ..
        ldx     $D3                             ; F493 A6 D3                    ..
        bpl     LF4A3                           ; F495 10 0C                    ..
        eor     #$FF                            ; F497 49 FF                    I.
        clc                                     ; F499 18                       .
        adc     #$01                            ; F49A 69 01                    i.
        cpx     #$FF                            ; F49C E0 FF                    ..
        beq     LF4A7                           ; F49E F0 07                    ..
LF4A0:  jmp     LDE20                           ; F4A0 4C 20 DE                 L .

; ----------------------------------------------------------------------------
LF4A3:  cpx     #$00                            ; F4A3 E0 00                    ..
        bne     LF4A0                           ; F4A5 D0 F9                    ..
LF4A7:  .byte   $20                             ; F4A7 20                        
LF4A8:  .byte   $73                             ; F4A8 73                       s
        .byte   $F4                             ; F4A9 F4                       .
        jsr     LF4A8                           ; F4AA 20 A8 F4                  ..
        bmi     LF4D2                           ; F4AD 30 23                    0#
        bne     LF4CF                           ; F4AF D0 1E                    ..
        lda     LC083                           ; F4B1 AD 83 C0                 ...
        bit     $D3                             ; F4B4 24 D3                    $.
        bmi     LF4C3                           ; F4B6 30 0B                    0.
        ldy     #$04                            ; F4B8 A0 04                    ..
        lda     ($04),y                         ; F4BA B1 04                    ..
        pha                                     ; F4BC 48                       H
        iny                                     ; F4BD C8                       .
        lda     ($04),y                         ; F4BE B1 04                    ..
        tay                                     ; F4C0 A8                       .
        pla                                     ; F4C1 68                       h
        .byte   $2C                             ; F4C2 2C                       ,
LF4C3:  ldy     #$00                            ; F4C3 A0 00                    ..
        .byte   $24                             ; F4C5 24                       $
LF4C6:  tay                                     ; F4C6 A8                       .
        sta     SEDORIC_TRAV0                   ; F4C7 85 F2                    ..
        tya                                     ; F4C9 98                       .
        ldy     SEDORIC_TRAV0                   ; F4CA A4 F2                    ..
        jmp     LD254                           ; F4CC 4C 54 D2                 LT.

; ----------------------------------------------------------------------------
LF4CF:  jmp     LE0E0                           ; F4CF 4C E0 E0                 L..

; ----------------------------------------------------------------------------
LF4D2:  jsr     LFD0E                           ; F4D2 20 0E FD                  ..
        beq     LF4C6                           ; F4D5 F0 EF                    ..
        bit     $D3                             ; F4D7 24 D3                    $.
        bmi     LF4C3                           ; F4D9 30 E8                    0.
        .byte   $A9                             ; F4DB A9                       .
LF4DC:  brk                                     ; F4DC 00                       .
        beq     LF4C3                           ; F4DD F0 E4                    ..
        jsr     LF956                           ; F4DF 20 56 F9                  V.
        bne     LF4EA                           ; F4E2 D0 06                    ..
        .byte   $20                             ; F4E4 20                        
        .byte   $6B                             ; F4E5 6B                       k
LF4E6:  sbc     $734C,y                         ; F4E6 F9 4C 73                 .Ls
LF4E9:  .byte   $DA                             ; F4E9 DA                       .
LF4EA:  bcs     LF4FD                           ; F4EA B0 11                    ..
LF4EC:  jsr     LF91F                           ; F4EC 20 1F F9                  ..
LF4EF:  php                                     ; F4EF 08                       .
        sei                                     ; F4F0 78                       x
        jsr     LF684                           ; F4F1 20 84 F6                  ..
LF4F4:  lda     ($06),y                         ; F4F4 B1 06                    ..
        sta     ($02),y                         ; F4F6 91 02                    ..
        iny                                     ; F4F8 C8                       .
        bne     LF4F4                           ; F4F9 D0 F9                    ..
        plp                                     ; F4FB 28                       (
LF4FC:  rts                                     ; F4FC 60                       `

; ----------------------------------------------------------------------------
LF4FD:  jsr     LED2E                           ; F4FD 20 2E ED                  ..
        jsr     LFDD9                           ; F500 20 D9 FD                  ..
        txa                                     ; F503 8A                       .
        jsr     LF67D                           ; F504 20 7D F6                  }.
        lda     $06                             ; F507 A5 06                    ..
        ldy     $07                             ; F509 A4 07                    ..
        sta     $02                             ; F50B 85 02                    ..
        sty     $03                             ; F50D 84 03                    ..
        jsr     LF5DC                           ; F50F 20 DC F5                  ..
        jsr     LD39E                           ; F512 20 9E D3                  ..
        beq     LF4FC                           ; F515 F0 E5                    ..
        jsr     LD22C                           ; F517 20 2C D2                  ,.
        jmp     LF8FD                           ; F51A 4C FD F8                 L..

; ----------------------------------------------------------------------------
        clc                                     ; F51D 18                       .
        bit     $38                             ; F51E 24 38                    $8
        php                                     ; F520 08                       .
        jsr     LD2FA                           ; F521 20 FA D2                  ..
        ldy     #$04                            ; F524 A0 04                    ..
        lda     ($04),y                         ; F526 B1 04                    ..
        cmp     $33                             ; F528 C5 33                    .3
        iny                                     ; F52A C8                       .
        lda     ($04),y                         ; F52B B1 04                    ..
        .byte   $E5                             ; F52D E5                       .
LF52E:  .byte   $34                             ; F52E 34                       4
        bcs     LF539                           ; F52F B0 08                    ..
        plp                                     ; F531 28                       (
        bcc     LF53B                           ; F532 90 07                    ..
        ldx     #$10                            ; F534 A2 10                    ..
        jmp     LD67E                           ; F536 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LF539:  plp                                     ; F539 28                       (
        rts                                     ; F53A 60                       `

; ----------------------------------------------------------------------------
LF53B:  ldy     #$04                            ; F53B A0 04                    ..
        lda     $33                             ; F53D A5 33                    .3
        sta     ($04),y                         ; F53F 91 04                    ..
        iny                                     ; F541 C8                       .
        lda     $34                             ; F542 A5 34                    .4
        sta     ($04),y                         ; F544 91 04                    ..
        jsr     LF85F                           ; F546 20 5F F8                  _.
        ldy     #$13                            ; F549 A0 13                    ..
        lda     (L0000),y                       ; F54B B1 00                    ..
        pha                                     ; F54D 48                       H
        iny                                     ; F54E C8                       .
        lda     (L0000),y                       ; F54F B1 00                    ..
        tay                                     ; F551 A8                       .
        pla                                     ; F552 68                       h
        jmp     LDA9E                           ; F553 4C 9E DA                 L..

; ----------------------------------------------------------------------------
        jsr     LF47D                           ; F556 20 7D F4                  }.
        jsr     LD22C                           ; F559 20 2C D2                  ,.
        jsr     LF4A8                           ; F55C 20 A8 F4                  ..
        pha                                     ; F55F 48                       H
        ldy     #$06                            ; F560 A0 06                    ..
        lda     (L0000),y                       ; F562 B1 00                    ..
        sta     LC000                           ; F564 8D 00 C0                 ...
        pla                                     ; F567 68                       h
        cmp     #$01                            ; F568 C9 01                    ..
        rts                                     ; F56A 60                       `

; ----------------------------------------------------------------------------
        jsr     LD27F                           ; F56B 20 7F D2                  ..
        stx     LC001                           ; F56E 8E 01 C0                 ...
        jsr     LD22C                           ; F571 20 2C D2                  ,.
        jsr     LD27F                           ; F574 20 7F D2                  ..
        stx     LC002                           ; F577 8E 02 C0                 ...
        beq     LF582                           ; F57A F0 06                    ..
        jsr     LD22C                           ; F57C 20 2C D2                  ,.
        jsr     LE60D                           ; F57F 20 0D E6                  ..
LF582:  .byte   $20                             ; F582 20                        
        tay                                     ; F583 A8                       .
LF584:  .byte   $F4                             ; F584 F4                       .
        lda     $02                             ; F585 A5 02                    ..
        ldy     $03                             ; F587 A4 03                    ..
        sta     LC003                           ; F589 8D 03 C0                 ...
        sty     LC004                           ; F58C 8C 04 C0                 ...
        rts                                     ; F58F 60                       `

; ----------------------------------------------------------------------------
        jsr     LE60D                           ; F590 20 0D E6                  ..
        jmp     LDA4C                           ; F593 4C 4C DA                 LL.

; ----------------------------------------------------------------------------
        jsr     LE60D                           ; F596 20 0D E6                  ..
        jmp     LDA8A                           ; F599 4C 8A DA                 L..

; ----------------------------------------------------------------------------
        jsr     LD27F                           ; F59C 20 7F D2                  ..
        txa                                     ; F59F 8A                       .
        pha                                     ; F5A0 48                       H
        and     #$7F                            ; F5A1 29 7F                    ).
        .byte   $CD                             ; F5A3 CD                       .
LF5A4:  asl     $C2                             ; F5A4 06 C2                    ..
        bcs     LF5C8                           ; F5A6 B0 20                    . 
        jsr     LD22C                           ; F5A8 20 2C D2                  ,.
        jsr     LD27F                           ; F5AB 20 7F D2                  ..
        txa                                     ; F5AE 8A                       .
        dex                                     ; F5AF CA                       .
        bmi     LF5C8                           ; F5B0 30 16                    0.
        cpx     LC207                           ; F5B2 EC 07 C2                 ...
        bcs     LF5C8                           ; F5B5 B0 11                    ..
        tay                                     ; F5B7 A8                       .
        pla                                     ; F5B8 68                       h
        .byte   $4C                             ; F5B9 4C                       L
LF5BA:  ora     $DD,x                           ; F5BA 15 DD                    ..
        jsr     LDC6C                           ; F5BC 20 6C DC                  l.
        pha                                     ; F5BF 48                       H
        tya                                     ; F5C0 98                       .
        jsr     LD7ED                           ; F5C1 20 ED D7                  ..
        pla                                     ; F5C4 68                       h
        jmp     LD7EA                           ; F5C5 4C EA D7                 L..

; ----------------------------------------------------------------------------
LF5C8:  jmp     LDE20                           ; F5C8 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        jsr     LF956                           ; F5CB 20 56 F9                  V.
        bne     LF5D6                           ; F5CE D0 06                    ..
        jsr     LF96B                           ; F5D0 20 6B F9                  k.
        jmp     LDAA4                           ; F5D3 4C A4 DA                 L..

; ----------------------------------------------------------------------------
LF5D6:  bcs     LF5EF                           ; F5D6 B0 17                    ..
        jsr     LF91D                           ; F5D8 20 1D F9                  ..
        php                                     ; F5DB 08                       .
LF5DC:  sei                                     ; F5DC 78                       x
        jsr     LF684                           ; F5DD 20 84 F6                  ..
LF5E0:  lda     ($02),y                         ; F5E0 B1 02                    ..
        sta     ($06),y                         ; F5E2 91 06                    ..
        iny                                     ; F5E4 C8                       .
        cpy     LC083                           ; F5E5 CC 83 C0                 ...
        bne     LF5E0                           ; F5E8 D0 F6                    ..
        jsr     LF727                           ; F5EA 20 27 F7                  '.
        plp                                     ; F5ED 28                       (
        rts                                     ; F5EE 60                       `

; ----------------------------------------------------------------------------
LF5EF:  jsr     LD224                           ; F5EF 20 24 D2                  $.
        jsr     LFD0E                           ; F5F2 20 0E FD                  ..
        bne     LF61B                           ; F5F5 D0 24                    .$
        ldx     #$05                            ; F5F7 A2 05                    ..
        ldy     #$00                            ; F5F9 A0 00                    ..
        bit     $28                             ; F5FB 24 28                    $(
        bpl     LF60C                           ; F5FD 10 0D                    ..
        lda     $D3                             ; F5FF A5 D3                    ..
        ldx     $D4                             ; F601 A6 D4                    ..
        sta     $91                             ; F603 85 91                    ..
        stx     $92                             ; F605 86 92                    ..
        lda     ($91),y                         ; F607 B1 91                    ..
        tax                                     ; F609 AA                       .
        ldy     #$80                            ; F60A A0 80                    ..
LF60C:  sty     LC07F                           ; F60C 8C 7F C0                 ...
        jsr     LFA39                           ; F60F 20 39 FA                  9.
        lda     #$FF                            ; F612 A9 FF                    ..
        jsr     LFDCC                           ; F614 20 CC FD                  ..
        sta     ($02),y                         ; F617 91 02                    ..
        bmi     LF62B                           ; F619 30 10                    0.
LF61B:  jsr     LFDD9                           ; F61B 20 D9 FD                  ..
        pha                                     ; F61E 48                       H
        txa                                     ; F61F 8A                       .
LF620:  jsr     LF67D                           ; F620 20 7D F6                  }.
        jsr     LFD2A                           ; F623 20 2A FD                  *.
        pla                                     ; F626 68                       h
        tax                                     ; F627 AA                       .
        jsr     LFA39                           ; F628 20 39 FA                  9.
LF62B:  jsr     LD39E                           ; F62B 20 9E D3                  ..
        beq     LF636                           ; F62E F0 06                    ..
        jsr     LD22C                           ; F630 20 2C D2                  ,.
        jmp     LF9EF                           ; F633 4C EF F9                 L..

; ----------------------------------------------------------------------------
LF636:  .byte   $4C                             ; F636 4C                       L
        .byte   $46                             ; F637 46                       F
LF638:  sbc     $7E8E,x                         ; F638 FD 8E 7E                 ..~
        .byte   $C0                             ; F63B C0                       .
LF63C:  lda     $06                             ; F63C A5 06                    ..
        ldy     $07                             ; F63E A4 07                    ..
; $F640
XXXX:   .byte   $85,$02,$84,$03,$18,$A0,$00,$20 ; F640 85 02 84 03 18 A0 00 20  ....... 
        .byte   $9E,$FC,$20,$A8,$F4,$4C,$38,$FE ; F648 9E FC 20 A8 F4 4C 38 FE  .. ..L8.
        .byte   $48,$20,$98,$D3,$20,$2C,$D2,$68 ; F650 48 20 98 D3 20 2C D2 68  H .. ,.h
LF658:  .byte   $C9,$44,$D0,$20,$AD,$09,$C0,$8D ; F658 C9 44 D0 20 AD 09 C0 8D  .D. ....
        .byte   $00,$C0,$20,$7F,$F4,$F0,$06,$20 ; F660 00 C0 20 7F F4 F0 06 20  .. .... 
        .byte   $2C,$D2,$20,$0D,$E6,$A9,$00,$A0 ; F668 2C D2 20 0D E6 A9 00 A0  ,. .....
        .byte   $01,$20,$CB,$FA,$A0,$06,$AD,$00 ; F670 01 20 CB FA A0 06 AD 00  . ......
        .byte   $C0,$91                         ; F678 C0 91                    ..
LF67A:  .byte   $00,$60,$C9                     ; F67A 00 60 C9                 .`.
LF67D:  .byte   $52,$D0,$12,$A9,$00,$A0,$08     ; F67D 52 D0 12 A9 00 A0 08     R......
LF684:  .byte   $20,$08,$FB,$D0,$F2,$20,$2C,$D2 ; F684 20 08 FB D0 F2 20 2C D2   .... ,.
        .byte   $4C,$D8,$F9,$4C,$23,$DE,$C9,$53 ; F68C 4C D8 F9 4C 23 DE C9 53  L..L#..S
        .byte   $D0,$F9,$A9,$80,$A0,$10,$20,$08 ; F694 D0 F9 A9 80 A0 10 20 08  ...... .
        .byte   $FB,$08,$A0,$03,$A9,$0C,$91,$00 ; F69C FB 08 A0 03 A9 0C 91 00  ........
        .byte   $C8,$A9,$00,$91,$00,$C8,$91,$00 ; F6A4 C8 A9 00 91 00 C8 91 00  ........
        .byte   $28,$D0,$09,$A0,$00,$A9,$FF,$91 ; F6AC 28 D0 09 A0 00 A9 FF 91  (.......
        .byte   $02,$4C,$46,$FD,$4C,$44,$FD,$20 ; F6B4 02 4C 46 FD 4C 44 FD 20  .LF.LD. 
        .byte   $C0,$FA,$30,$DD,$20,$7D,$F4,$20 ; F6BC C0 FA 30 DD 20 7D F4 20  ..0. }. 
        .byte   $A8,$F4,$30,$B3,$4C,$E0,$E0,$48 ; F6C4 A8 F4 30 B3 4C E0 E0 48  ..0.L..H
        .byte   $98                             ; F6CC 98                       .
LF6CD:  .byte   $48,$A0,$05,$B1,$9E,$D0,$02,$A0 ; F6CD 48 A0 05 B1 9E D0 02 A0  H.......
        .byte   $03,$88,$B1,$9E,$AA,$48,$C8,$B1 ; F6D5 03 88 B1 9E AA 48 C8 B1  .....H..
        .byte   $9E,$48,$A8,$A9,$01,$85,$F2,$A9 ; F6DD 9E 48 A8 A9 01 85 F2 A9  .H......
        .byte   $21,$20,$25,$F4,$20,$CF,$F3,$C8 ; F6E5 21 20 25 F4 20 CF F3 C8  ! %. ...
        .byte   $68,$91,$F2,$88,$68,$91,$F2,$20 ; F6ED 68 91 F2 88 68 91 F2 20  h...h.. 
        .byte   $A8,$F4,$68,$91,$00,$68,$C8,$91 ; F6F5 A8 F4 68 91 00 68 C8 91  ..h..h..
        .byte   $00,$8D,$83,$C0,$60             ; F6FD 00 8D 83 C0 60           ....`
LF702:  .byte   $4C,$E0,$E0,$4C,$20,$DE,$85,$0B ; F702 4C E0 E0 4C 20 DE 85 0B  L..L ...
        .byte   $84,$F9,$20,$4F,$D4,$20,$9E,$D7 ; F70A 84 F9 20 4F D4 20 9E D7  .. O. ..
        .byte   $20,$2C,$D2,$20,$7F,$F4,$20,$2D ; F712 20 2C D2 20 7F F4 20 2D   ,. .. -
        .byte   $DB,$08,$D0,$22,$A2,$00,$24,$0B ; F71A DB 08 D0 22 A2 00 24 0B  ..."..$.
        .byte   $30,$0A,$20,$2C,$D2             ; F722 30 0A 20 2C D2           0. ,.
LF727:  .byte   $20,$7F,$D2,$E0,$03,$90,$D7,$A9 ; F727 20 7F D2 E0 03 90 D7 A9   .......
        .byte   $00,$8D,$52,$C0                 ; F72F 00 8D 52 C0              ..R.
LF733:  .byte   $8D,$53,$C0,$A8,$8A,$A6,$F9,$20 ; F733 8D 53 C0 A8 8A A6 F9 20  .S..... 
        .byte   $00,$DE,$20,$30,$DB,$BD         ; F73B 00 DE 20 30 DB BD        .. 0..
; ----------------------------------------------------------------------------
        .byte   $0C                             ; F741 0C                       .
        .byte   $C3                             ; F742 C3                       .
        ldy     LC30D,x                         ; F743 BC 0D C3                 ...
        jsr     LDA5D                           ; F746 20 5D DA                  ].
        lda     LC103                           ; F749 AD 03 C1                 ...
        cmp     SEDORIC_TRAV7                   ; F74C C5 F9                    ..
        bne     LF702                           ; F74E D0 B2                    ..
        lda     LC106                           ; F750 AD 06 C1                 ...
        ldy     $0B                             ; F753 A4 0B                    ..
        jsr     XXXX1                           ; F755 20 CB FA                  ..
        ldy     #$07                            ; F758 A0 07                    ..
LF75A:  ldx     LC027                           ; F75A AE 27 C0                 .'.
LF75D:  lda     LC300,x                         ; F75D BD 00 C3                 ...
        sta     (L0000),y                       ; F760 91 00                    ..
        inx                                     ; F762 E8                       .
        iny                                     ; F763 C8                       .
        cpy     #$17                            ; F764 C0 17                    ..
        bne     LF75D                           ; F766 D0 F5                    ..
        lda     #$FF                            ; F768 A9 FF                    ..
        ldy     #$02                            ; F76A A0 02                    ..
        sta     (L0000),y                       ; F76C 91 00                    ..
        dec     $05                             ; F76E C6 05                    ..
LF770:  jsr     LF86A                           ; F770 20 6A F8                  j.
        jsr     LF85F                           ; F773 20 5F F8                  _.
        jsr     LDA73                           ; F776 20 73 DA                  s.
        ldy     #$00                            ; F779 A0 00                    ..
        lda     ($04),y                         ; F77B B1 04                    ..
        sta     LC001                           ; F77D 8D 01 C0                 ...
        iny                                     ; F780 C8                       .
        lda     ($04),y                         ; F781 B1 04                    ..
        sta     LC002                           ; F783 8D 02 C0                 ...
        bne     LF770                           ; F786 D0 E8                    ..
        jsr     LFA74                           ; F788 20 74 FA                  t.
        plp                                     ; F78B 28                       (
        rts                                     ; F78C 60                       `

; ----------------------------------------------------------------------------
        beq     LF7A0                           ; F78D F0 11                    ..
        jsr     LF47D                           ; F78F 20 7D F4                  }.
        jsr     LFBAF                           ; F792 20 AF FB                  ..
        jsr     LD39E                           ; F795 20 9E D3                  ..
        beq     LF7AE                           ; F798 F0 14                    ..
        jsr     LD22C                           ; F79A 20 2C D2                  ,.
        jmp     LFB8F                           ; F79D 4C 8F FB                 L..

; ----------------------------------------------------------------------------
LF7A0:  jsr     LF3F3                           ; F7A0 20 F3 F3                  ..
        lda     #$3F                            ; F7A3 A9 3F                    .?
        sta     $0A                             ; F7A5 85 0A                    ..
LF7A7:  jsr     LFBAF                           ; F7A7 20 AF FB                  ..
        dec     $0A                             ; F7AA C6 0A                    ..
        bpl     LF7A7                           ; F7AC 10 F9                    ..
LF7AE:  rts                                     ; F7AE 60                       `

; ----------------------------------------------------------------------------
        jsr     LF3CF                           ; F7AF 20 CF F3                  ..
        tya                                     ; F7B2 98                       .
        iny                                     ; F7B3 C8                       .
        sta     (SEDORIC_TRAV0),y               ; F7B4 91 F2                    ..
        jmp     LF4E6                           ; F7B6 4C E6 F4                 L..

; ----------------------------------------------------------------------------
LF7B9:  jmp     LE0E0                           ; F7B9 4C E0 E0                 L..

; ----------------------------------------------------------------------------
LF7BC:  jmp     LDE23                           ; F7BC 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        jsr     LF47D                           ; F7BF 20 7D F4                  }.
        jsr     LD22C                           ; F7C2 20 2C D2                  ,.
        jsr     LF4A8                           ; F7C5 20 A8 F4                  ..
        bmi     LF7B9                           ; F7C8 30 EF                    0.
        lda     LC080                           ; F7CA AD 80 C0                 ...
        cmp     $0A                             ; F7CD C5 0A                    ..
        beq     LF7D6                           ; F7CF F0 05                    ..
        lda     #$00                            ; F7D1 A9 00                    ..
        sta     LC081                           ; F7D3 8D 81 C0                 ...
LF7D6:  jsr     XXXX                            ; F7D6 20 40 F6                  @.
        lda     #$C3                            ; F7D9 A9 C3                    ..
        jsr     LD22E                           ; F7DB 20 2E D2                  ..
        beq     LF7BC                           ; F7DE F0 DC                    ..
        pha                                     ; F7E0 48                       H
        jsr     LD398                           ; F7E1 20 98 D3                  ..
        pla                                     ; F7E4 68                       h
        ldy     #$00                            ; F7E5 A0 00                    ..
        ldx     #$05                            ; F7E7 A2 05                    ..
        cmp     #$C0                            ; F7E9 C9 C0                    ..
        beq     LF807                           ; F7EB F0 1A                    ..
        ldx     #$02                            ; F7ED A2 02                    ..
        iny                                     ; F7EF C8                       .
        cmp     #$25                            ; F7F0 C9 25                    .%
        beq     LF807                           ; F7F2 F0 13                    ..
        dex                                     ; F7F4 CA                       .
        ldy     #$40                            ; F7F5 A0 40                    .@
        cmp     #$4F                            ; F7F7 C9 4F                    .O
        beq     LF807                           ; F7F9 F0 0C                    ..
        cmp     #$24                            ; F7FB C9 24                    .$
        bne     LF7BC                           ; F7FD D0 BD                    ..
        jsr     LD27F                           ; F7FF 20 7F D2                  ..
        txa                                     ; F802 8A                       .
        beq     LF854                           ; F803 F0 4F                    .O
        ldy     #$80                            ; F805 A0 80                    ..
LF807:  sty     LC07F                           ; F807 8C 7F C0                 ...
        stx     LC07E                           ; F80A 8E 7E C0                 .~.
        lda     LC081                           ; F80D AD 81 C0                 ...
        ldy     $0A                             ; F810 A4 0A                    ..
        sta     LC07D                           ; F812 8D 7D C0                 .}.
        sty     LC07C                           ; F815 8C 7C C0                 .|.
        clc                                     ; F818 18                       .
        ldx     $0B                             ; F819 A6 0B                    ..
        bne     LF822                           ; F81B D0 05                    ..
        adc     #$02                            ; F81D 69 02                    i.
        jsr     LFC57                           ; F81F 20 57 FC                  W.
LF822:  adc     LC07E                           ; F822 6D 7E C0                 m~.
        jsr     LFC57                           ; F825 20 57 FC                  W.
        sta     LC081                           ; F828 8D 81 C0                 ...
        jsr     LF4EC                           ; F82B 20 EC F4                  ..
        bcs     LF833                           ; F82E B0 03                    ..
        jsr     LF4EF                           ; F830 20 EF F4                  ..
LF833:  ldy     #$09                            ; F833 A0 09                    ..
LF835:  lda     LC076,y                         ; F835 B9 76 C0                 .v.
LF838:  sta     (SEDORIC_TRAV2),y               ; F838 91 F4                    ..
        dey                                     ; F83A 88                       .
        bpl     LF835                           ; F83B 10 F8                    ..
        ldx     #$00                            ; F83D A2 00                    ..
        jsr     LD39E                           ; F83F 20 9E D3                  ..
        bne     LF848                           ; F842 D0 04                    ..
        stx     LC081                           ; F844 8E 81 C0                 ...
        rts                                     ; F847 60                       `

; ----------------------------------------------------------------------------
LF848:  jsr     LD22C                           ; F848 20 2C D2                  ,.
        bne     LF7D6                           ; F84B D0 89                    ..
        lda     $0A                             ; F84D A5 0A                    ..
        sta     LC080                           ; F84F 8D 80 C0                 ...
LF852:  clc                                     ; F852 18                       .
        rts                                     ; F853 60                       `

; ----------------------------------------------------------------------------
LF854:  jmp     LDE20                           ; F854 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        beq     LF869                           ; F857 F0 10                    ..
        bcs     LF86E                           ; F859 B0 13                    ..
        .byte   $AE                             ; F85B AE                       .
        .byte   $83                             ; F85C 83                       .
LF85D:  cpy     #$F0                            ; F85D C0 F0                    ..
LF85F:  .byte   $F2                             ; F85F F2                       .
        cmp     LC083                           ; F860 CD 83 C0                 ...
        beq     LF852                           ; F863 F0 ED                    ..
        bcc     LF852                           ; F865 90 EB                    ..
        bcs     LF86E                           ; F867 B0 05                    ..
LF869:  .byte   $AE                             ; F869 AE                       .
LF86A:  .byte   $83                             ; F86A 83                       .
        cpy     #$F0                            ; F86B C0 F0                    ..
        .byte   $E4                             ; F86D E4                       .
LF86E:  ldx     #$11                            ; F86E A2 11                    ..
        jmp     LD67E                           ; F870 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        clc                                     ; F873 18                       .
        bit     $38                             ; F874 24 38                    $8
        php                                     ; F876 08                       .
        jsr     LF3F3                           ; F877 20 F3 F3                  ..
        jsr     XXXX                            ; F87A 20 40 F6                  @.
        lda     #$D5                            ; F87D A9 D5                    ..
        jsr     LD22E                           ; F87F 20 2E D2                  ..
        jsr     LD224                           ; F882 20 24 D2                  $.
LF885:  jsr     LF4E9                           ; F885 20 E9 F4                  ..
LF888:  jsr     LF67A                           ; F888 20 7A F6                  z.
        jsr     LF4A8                           ; F88B 20 A8 F4                  ..
        lda     LC07C                           ; F88E AD 7C C0                 .|.
        sta     $0A                             ; F891 85 0A                    ..
        ldy     LC07D                           ; F893 AC 7D C0                 .}.
        ldx     LC07E                           ; F896 AE 7E C0                 .~.
        lda     $0B                             ; F899 A5 0B                    ..
        bne     LF8A9                           ; F89B D0 0C                    ..
        plp                                     ; F89D 28                       (
        php                                     ; F89E 08                       .
        lda     LC07F                           ; F89F AD 7F C0                 ...
        sta     ($02),y                         ; F8A2 91 02                    ..
        iny                                     ; F8A4 C8                       .
        txa                                     ; F8A5 8A                       .
        sta     ($02),y                         ; F8A6 91 02                    ..
        iny                                     ; F8A8 C8                       .
LF8A9:  tya                                     ; F8A9 98                       .
        .byte   $20                             ; F8AA 20                        
        .byte   $DC                             ; F8AB DC                       .
LF8AC:  .byte   $F4                             ; F8AC F4                       .
        plp                                     ; F8AD 28                       (
        ldy     #$00                            ; F8AE A0 00                    ..
        lda     LC07F                           ; F8B0 AD 7F C0                 ...
        bmi     LF8D7                           ; F8B3 30 22                    0"
        beq     LF8D0                           ; F8B5 F0 19                    ..
        .byte   $20                             ; F8B7 20                        
LF8B8:  jmp     LA0D2                           ; F8B8 4C D2 A0                 L..

; ----------------------------------------------------------------------------
        brk                                     ; F8BB 00                       .
        lda     $D4                             ; F8BC A5 D4                    ..
        sta     ($02),y                         ; F8BE 91 02                    ..
        bit     LC07F                           ; F8C0 2C 7F C0                 ,..
        bvc     LF8CA                           ; F8C3 50 05                    P.
        lda     $D3                             ; F8C5 A5 D3                    ..
        bne     LF854                           ; F8C7 D0 8B                    ..
        rts                                     ; F8C9 60                       `

; ----------------------------------------------------------------------------
LF8CA:  iny                                     ; F8CA C8                       .
        lda     $D3                             ; F8CB A5 D3                    ..
        sta     ($02),y                         ; F8CD 91 02                    ..
        rts                                     ; F8CF 60                       `

; ----------------------------------------------------------------------------
LF8D0:  ldx     $02                             ; F8D0 A6 02                    ..
        ldy     $03                             ; F8D2 A4 03                    ..
        jmp     LD2C2                           ; F8D4 4C C2 D2                 L..

; ----------------------------------------------------------------------------
LF8D7:  php                                     ; F8D7 08                       .
        jsr     LD274                           ; F8D8 20 74 D2                  t.
        sta     $D0                             ; F8DB 85 D0                    ..
        ldy     LC07E                           ; F8DD AC 7E C0                 .~.
        beq     LF8E9                           ; F8E0 F0 07                    ..
        lda     #$20                            ; F8E2 A9 20                    . 
LF8E4:  dey                                     ; F8E4 88                       .
        sta     ($02),y                         ; F8E5 91 02                    ..
        bne     LF8E4                           ; F8E7 D0 FB                    ..
LF8E9:  plp                                     ; F8E9 28                       (
        bcs     LF8FA                           ; F8EA B0 0E                    ..
        nop                                     ; F8EC EA                       .
        nop                                     ; F8ED EA                       .
LF8EE:  cpy     $D0                             ; F8EE C4 D0                    ..
        bcs     LF8F9                           ; F8F0 B0 07                    ..
        lda     ($91),y                         ; F8F2 B1 91                    ..
        sta     ($02),y                         ; F8F4 91 02                    ..
        iny                                     ; F8F6 C8                       .
        bne     LF8EE                           ; F8F7 D0 F5                    ..
LF8F9:  rts                                     ; F8F9 60                       `

; ----------------------------------------------------------------------------
LF8FA:  ldy     $D0                             ; F8FA A4 D0                    ..
        .byte   $F0                             ; F8FC F0                       .
LF8FD:  .byte   $0F                             ; F8FD 0F                       .
        dey                                     ; F8FE 88                       .
        dec     $D0                             ; F8FF C6 D0                    ..
        lda     ($91),y                         ; F901 B1 91                    ..
        dec     LC07E                           ; F903 CE 7E C0                 .~.
        ldy     LC07E                           ; F906 AC 7E C0                 .~.
        sta     ($02),y                         ; F909 91 02                    ..
        bne     LF8FA                           ; F90B D0 ED                    ..
        rts                                     ; F90D 60                       `

; ----------------------------------------------------------------------------
        jsr     LF4A8                           ; F90E 20 A8 F4                  ..
        ldy     #$03                            ; F911 A0 03                    ..
        lda     (L0000),y                       ; F913 B1 00                    ..
        sta     LC086                           ; F915 8D 86 C0                 ...
        iny                                     ; F918 C8                       .
        lda     (L0000),y                       ; F919 B1 00                    ..
        .byte   $8D                             ; F91B 8D                       .
        .byte   $87                             ; F91C 87                       .
LF91D:  cpy     #$C8                            ; F91D C0 C8                    ..
LF91F:  lda     (L0000),y                       ; F91F B1 00                    ..
        sta     LC088                           ; F921 8D 88 C0                 ...
        tay                                     ; F924 A8                       .
        lda     ($02),y                         ; F925 B1 02                    ..
        cmp     #$FF                            ; F927 C9 FF                    ..
LF929:  rts                                     ; F929 60                       `

; ----------------------------------------------------------------------------
        jsr     LF4A8                           ; F92A 20 A8 F4                  ..
        ldy     #$05                            ; F92D A0 05                    ..
        lda     LC088                           ; F92F AD 88 C0                 ...
        sta     (L0000),y                       ; F932 91 00                    ..
        dey                                     ; F934 88                       .
        lda     LC087                           ; F935 AD 87 C0                 ...
        sta     (L0000),y                       ; F938 91 00                    ..
        dey                                     ; F93A 88                       .
        lda     LC086                           ; F93B AD 86 C0                 ...
        cmp     (L0000),y                       ; F93E D1 00                    ..
        sta     (L0000),y                       ; F940 91 00                    ..
        beq     LF929                           ; F942 F0 E5                    ..
        clc                                     ; F944 18                       .
        bit     $38                             ; F945 24 38                    $8
        php                                     ; F947 08                       .
        jsr     LF4A8                           ; F948 20 A8 F4                  ..
        lda     $02                             ; F94B A5 02                    ..
        ldy     $03                             ; F94D A4 03                    ..
        sta     LC003                           ; F94F 8D 03 C0                 ...
        sty     LC004                           ; F952 8C 04 C0                 ...
        .byte   $A0                             ; F955 A0                       .
LF956:  .byte   $04                             ; F956 04                       .
        lda     (L0000),y                       ; F957 B1 00                    ..
        clc                                     ; F959 18                       .
        adc     $05                             ; F95A 65 05                    e.
        sta     $05                             ; F95C 85 05                    ..
        dey                                     ; F95E 88                       .
        lda     (L0000),y                       ; F95F B1 00                    ..
        tay                                     ; F961 A8                       .
        lda     ($04),y                         ; F962 B1 04                    ..
        pha                                     ; F964 48                       H
        iny                                     ; F965 C8                       .
        lda     ($04),y                         ; F966 B1 04                    ..
        tay                                     ; F968 A8                       .
        pla                                     ; F969 68                       h
        plp                                     ; F96A 28                       (
LF96B:  bcc     LF970                           ; F96B 90 03                    ..
        jmp     LDA9E                           ; F96D 4C 9E DA                 L..

; ----------------------------------------------------------------------------
LF970:  jmp     LDA6D                           ; F970 4C 6D DA                 Lm.

; ----------------------------------------------------------------------------
        jsr     LFDCC                           ; F973 20 CC FD                  ..
        sta     ($02),y                         ; F976 91 02                    ..
        sec                                     ; F978 38                       8
        bit     $18                             ; F979 24 18                    $.
        jsr     LFDCC                           ; F97B 20 CC FD                  ..
        iny                                     ; F97E C8                       .
        bne     LF9C3                           ; F97F D0 42                    .B
        bcc     LF9A4                           ; F981 90 21                    .!
        jsr     LFD46                           ; F983 20 46 FD                  F.
        ldy     #$02                            ; F986 A0 02                    ..
        lda     (L0000),y                       ; F988 B1 00                    ..
        ldy     #$04                            ; F98A A0 04                    ..
        cmp     (L0000),y                       ; F98C D1 00                    ..
        bne     LF9A4                           ; F98E D0 14                    ..
        dey                                     ; F990 88                       .
        lda     (L0000),y                       ; F991 B1 00                    ..
        tay                                     ; F993 A8                       .
        iny                                     ; F994 C8                       .
        iny                                     ; F995 C8                       .
        beq     LF99D                           ; F996 F0 05                    ..
        iny                                     ; F998 C8                       .
        lda     ($04),y                         ; F999 B1 04                    ..
        bne     LF9A4                           ; F99B D0 07                    ..
LF99D:  lda     #$03                            ; F99D A9 03                    ..
        ldy     #$00                            ; F99F A0 00                    ..
        jsr     LF75A                           ; F9A1 20 5A F7                  Z.
LF9A4:  jsr     LF4A8                           ; F9A4 20 A8 F4                  ..
        ldy     #$03                            ; F9A7 A0 03                    ..
        lda     (L0000),y                       ; F9A9 B1 00                    ..
        clc                                     ; F9AB 18                       .
        adc     #$02                            ; F9AC 69 02                    i.
        bne     LF9BA                           ; F9AE D0 0A                    ..
        ldy     #$04                            ; F9B0 A0 04                    ..
        lda     (L0000),y                       ; F9B2 B1 00                    ..
        adc     #$00                            ; F9B4 69 00                    i.
        sta     (L0000),y                       ; F9B6 91 00                    ..
        lda     #$02                            ; F9B8 A9 02                    ..
LF9BA:  ldy     #$03                            ; F9BA A0 03                    ..
        sta     (L0000),y                       ; F9BC 91 00                    ..
        jsr     LFD44                           ; F9BE 20 44 FD                  D.
        ldy     #$00                            ; F9C1 A0 00                    ..
LF9C3:  tya                                     ; F9C3 98                       .
        ldy     #$05                            ; F9C4 A0 05                    ..
        sta     (L0000),y                       ; F9C6 91 00                    ..
        tay                                     ; F9C8 A8                       .
        lda     ($02),y                         ; F9C9 B1 02                    ..
        rts                                     ; F9CB 60                       `

; ----------------------------------------------------------------------------
        ldy     #$05                            ; F9CC A0 05                    ..
        pha                                     ; F9CE 48                       H
        lda     (L0000),y                       ; F9CF B1 00                    ..
        tay                                     ; F9D1 A8                       .
        pla                                     ; F9D2 68                       h
        rts                                     ; F9D3 60                       `

; ----------------------------------------------------------------------------
LF9D4:  ldx     #$0F                            ; F9D4 A2 0F                    ..
        jmp     LD67E                           ; F9D6 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        jsr     LFD0E                           ; F9D9 20 0E FD                  ..
        beq     LF9D4                           ; F9DC F0 F6                    ..
        ldy     #$00                            ; F9DE A0 00                    ..
        sta     ($06),y                         ; F9E0 91 06                    ..
        jsr     LFD7A                           ; F9E2 20 7A FD                  z.
        ldy     #$01                            ; F9E5 A0 01                    ..
        sta     ($06),y                         ; F9E7 91 06                    ..
        iny                                     ; F9E9 C8                       .
        sty     SEDORIC_TRAV3                   ; F9EA 84 F5                    ..
        sta     SEDORIC_TRAV4                   ; F9EC 85 F6                    ..
        .byte   $E6                             ; F9EE E6                       .
LF9EF:  .byte   $F6                             ; F9EF F6                       .
LF9F0:  jsr     LFD7A                           ; F9F0 20 7A FD                  z.
        ldy     SEDORIC_TRAV3                   ; F9F3 A4 F5                    ..
        inc     SEDORIC_TRAV3                   ; F9F5 E6 F5                    ..
        sta     ($06),y                         ; F9F7 91 06                    ..
        dec     SEDORIC_TRAV4                   ; F9F9 C6 F6                    ..
        bne     LF9F0                           ; F9FB D0 F3                    ..
        ldy     #$00                            ; F9FD A0 00                    ..
        lda     ($06),y                         ; F9FF B1 06                    ..
        tax                                     ; FA01 AA                       .
        iny                                     ; FA02 C8                       .
        lda     ($06),y                         ; FA03 B1 06                    ..
        rts                                     ; FA05 60                       `

; ----------------------------------------------------------------------------
        nop                                     ; FA06 EA                       .
        jsr     LFAC0                           ; FA07 20 C0 FA                  ..
        lda     #$FF                            ; FA0A A9 FF                    ..
        sta     $33                             ; FA0C 85 33                    .3
        sta     $34                             ; FA0E 85 34                    .4
        bmi     LFA1B                           ; FA10 30 09                    0.
        jsr     LFAC0                           ; FA12 20 C0 FA                  ..
        jsr     LD22C                           ; FA15 20 2C D2                  ,.
        jsr     LD2FA                           ; FA18 20 FA D2                  ..
LFA1B:  php                                     ; FA1B 08                       .
        sei                                     ; FA1C 78                       x
        lda     $33                             ; FA1D A5 33                    .3
        ora     $34                             ; FA1F 05 34                    .4
        beq     LFA36                           ; FA21 F0 13                    ..
        lda     $33                             ; FA23 A5 33                    .3
        bne     XXXX                            ; FA25 D0 02                    ..
        dec     $34                             ; FA27 C6 34                    .4
; $FA29
XXXX:   .byte   $C6,$33,$20,$0E,$FD,$F0,$06,$20 ; FA29 C6 33 20 0E FD F0 06 20  .3 .... 
        .byte   $D9,$FD,$4C,$1D,$FE             ; FA31 D9 FD 4C 1D FE           ..L..
LFA36:  .byte   $28,$60,$A0                     ; FA36 28 60 A0                 (`.
LFA39:  .byte   $00                             ; FA39 00                       .
; ----------------------------------------------------------------------------
        lda     ($06),y                         ; FA3A B1 06                    ..
        jsr     LFD73                           ; FA3C 20 73 FD                  s.
        ldy     #$01                            ; FA3F A0 01                    ..
        lda     ($06),y                         ; FA41 B1 06                    ..
        iny                                     ; FA43 C8                       .
        sty     SEDORIC_TRAV5                   ; FA44 84 F7                    ..
        sta     SEDORIC_TRAV6                   ; FA46 85 F8                    ..
        inc     SEDORIC_TRAV6                   ; FA48 E6 F8                    ..
LFA4A:  jsr     LFD73                           ; FA4A 20 73 FD                  s.
        ldy     SEDORIC_TRAV5                   ; FA4D A4 F7                    ..
        lda     ($06),y                         ; FA4F B1 06                    ..
        inc     SEDORIC_TRAV5                   ; FA51 E6 F7                    ..
        dec     SEDORIC_TRAV6                   ; FA53 C6 F8                    ..
        bne     LFA4A                           ; FA55 D0 F3                    ..
        rts                                     ; FA57 60                       `

; ----------------------------------------------------------------------------
        lsr     SEDORIC_TRAV0                   ; FA58 46 F2                    F.
        lsr     SEDORIC_TRAV2                   ; FA5A 46 F4                    F.
        ldx     #$0C                            ; FA5C A2 0C                    ..
LFA5E:  dex                                     ; FA5E CA                       .
        bmi     LFA83                           ; FA5F 30 22                    0"
        lda     LC091,x                         ; FA61 BD 91 C0                 ...
        sta     LC029,x                         ; FA64 9D 29 C0                 .).
        ldy     LC09E,x                         ; FA67 BC 9E C0                 ...
        cmp     #$3F                            ; FA6A C9 3F                    .?
        beq     LFA76                           ; FA6C F0 08                    ..
        cpy     #$3F                            ; FA6E C0 3F                    .?
        bne     LFA5E                           ; FA70 D0 EC                    ..
        ror     SEDORIC_TRAV0                   ; FA72 66 F2                    f.
LFA74:  bne     LFA5E                           ; FA74 D0 E8                    ..
LFA76:  ror     SEDORIC_TRAV2                   ; FA76 66 F4                    f.
        bit     $16                             ; FA78 24 16                    $.
        bvs     LFA5E                           ; FA7A 70 E2                    p.
        cpy     #$3F                            ; FA7C C0 3F                    .?
        beq     LFA5E                           ; FA7E F0 DE                    ..
LFA80:  jmp     LD5AC                           ; FA80 4C AC D5                 L..

; ----------------------------------------------------------------------------
LFA83:  bit     SEDORIC_TRAV0                   ; FA83 24 F2                    $.
        bpl     LFA93                           ; FA85 10 0C                    ..
        ldx     #$0C                            ; FA87 A2 0C                    ..
LFA89:  lda     LC09D,x                         ; FA89 BD 9D C0                 ...
        cmp     #$3F                            ; FA8C C9 3F                    .?
        bne     LFA80                           ; FA8E D0 F0                    ..
        dex                                     ; FA90 CA                       .
        bne     LFA89                           ; FA91 D0 F6                    ..
LFA93:  cli                                     ; FA93 58                       X
        rts                                     ; FA94 60                       `

; ----------------------------------------------------------------------------
        jsr     LE7C5                           ; FA95 20 C5 E7                  ..
        jsr     LFAC0                           ; FA98 20 C0 FA                  ..
LFA9B:  jsr     LD302                           ; FA9B 20 02 D3                  ..
        bpl     LFAAC                           ; FA9E 10 0C                    ..
LFAA0:  jsr     LFF3D                           ; FAA0 20 3D FF                  =.
        cmp     #$20                            ; FAA3 C9 20                    . 
        beq     LFAAC                           ; FAA5 F0 05                    ..
        cmp     #$03                            ; FAA7 C9 03                    ..
        bne     LFAA0                           ; FAA9 D0 F5                    ..
        rts                                     ; FAAB 60                       `

; ----------------------------------------------------------------------------
LFAAC:  jsr     LFD0E                           ; FAAC 20 0E FD                  ..
        beq     LFAC7                           ; FAAF F0 16                    ..
        jsr     LFDD9                           ; FAB1 20 D9 FD                  ..
        beq     LFA9B                           ; FAB4 F0 E5                    ..
        sta     SEDORIC_TRAV0                   ; FAB6 85 F2                    ..
        txa                                     ; FAB8 8A                       .
        bpl     LFACA                           ; FAB9 10 0F                    ..
LFABB:  iny                                     ; FABB C8                       .
        lda     ($06),y                         ; FABC B1 06                    ..
        .byte   $20                             ; FABE 20                        
        rol     a                               ; FABF 2A                       *
LFAC0:  dec     $C6,x                           ; FAC0 D6 C6                    ..
        .byte   $F2                             ; FAC2 F2                       .
        bne     LFABB                           ; FAC3 D0 F6                    ..
        beq     LFA9B                           ; FAC5 F0 D4                    ..
LFAC7:  jmp     LE7D6                           ; FAC7 4C D6 E7                 L..

; ----------------------------------------------------------------------------
LFACA:  clc                                     ; FACA 18                       .
; $FAD4
XXXX1:  .byte   $A5,$06,$A4,$07,$69,$02,$90,$01 ; FACB A5 06 A4 07 69 02 90 01  ....i...
        .byte   $C8,$20,$BA,$D2,$20,$D2,$D2,$20 ; FAD3 C8 20 BA D2 20 D2 D2 20  . .. .. 
        .byte   $37,$D6,$4C,$9B,$FE,$20,$07,$FE ; FADB 37 D6 4C 9B FE 20 07 FE  7.L.. ..
        .byte   $20,$00,$FF,$20,$3D,$FF,$A4,$F2 ; FAE3 20 00 FF 20 3D FF A4 F2   .. =...
        .byte   $C9,$03,$F0,$48,$C9,$0D,$D0,$05 ; FAEB C9 03 F0 48 C9 0D D0 05  ...H....
        .byte   $20,$1B,$FF,$A9,$0A,$20,$1B,$FF ; FAF3 20 1B FF A9 0A 20 1B FF   .... ..
        .byte   $84,$F2,$4C,$E6,$FE,$00,$00,$F4 ; FAFB 84 F2 4C E6 FE 00 00 F4  ..L.....
        .byte   $A9,$80,$91,$06,$C8,$A9,$D8,$91 ; FB03 A9 80 91 06 C8 A9 D8 91  ........
        .byte   $06,$A9,$00,$C8,$84,$F2,$91,$06 ; FB0B 06 A9 00 C8 84 F2 91 06  ........
        .byte   $C8,$C0,$DA,$D0,$F9,$A0,$02,$60 ; FB13 C8 C0 DA D0 F9 A0 02 60  .......`
; $FB1B
XXXX:   .byte   $91,$06,$20,$2A,$D6,$C8,$C0,$DA ; FB1B 91 06 20 2A D6 C8 C0 DA  .. *....
        .byte   $D0,$F5,$20,$38,$FE,$A9,$FF,$20 ; FB23 D0 F5 20 38 FE A9 FF 20  .. 8... 
        .byte   $CC,$FD,$91,$02,$20,$46,$FD,$A0 ; FB2B CC FD 91 02 20 46 FD A0  .... F..
        .byte   $02,$4C,$00,$FF,$20,$25,$FF,$4C ; FB33 02 4C 00 FF 20 25 FF 4C  .L.. %.L
        .byte   $46,$FD,$20,$45,$D8,$10,$FB,$60 ; FB3B 46 FD 20 45 D8 10 FB 60  F. E...`
        .byte   $4C,$36,$ED,$4C,$98,$D3,$4C,$9E ; FB43 4C 36 ED 4C 98 D3 4C 9E  L6.L..L.
        .byte   $D3,$4C,$4F,$D4,$4C,$51,$D4,$4C ; FB4B D3 4C 4F D4 4C 51 D4 4C  .LO.LQ.L
        .byte   $64,$D3,$4C,$F3,$F3,$4C,$A8,$F4 ; FB53 64 D3 4C F3 F3 4C A8 F4  d.L..L..
        .byte   $4C,$D9,$FD,$4C,$38,$FE,$4C,$46 ; FB5B 4C D9 FD 4C 38 FE 4C 46  L..L8.LF
        .byte   $FD,$4C,$2A,$D6,$4C,$13,$D6,$4C ; FB63 FD 4C 2A D6 4C 13 D6 4C  .L*.L..L
        .byte   $37,$D6,$4C,$D8,$D5,$4C,$EA,$E0 ; FB6B 37 D6 4C D8 D5 4C EA E0  7.L..L..
        .byte   $4C,$E5,$E0,$4C,$28,$DE,$4C,$E6 ; FB73 4C E5 E0 4C 28 DE 4C E6  L..L(.L.
        .byte   $DF,$4C,$9C,$DE,$4C,$66,$E2,$4C ; FB7B DF 4C 9C DE 4C 66 E2 4C  .L..Lf.L
        .byte   $2D,$DD,$4C,$15,$DD,$4C,$6C,$DC ; FB83 2D DD 4C 15 DD 4C 6C DC  -.L..Ll.
        .byte   $4C,$C0,$DB,$4C                 ; FB8B 4C C0 DB 4C              L..L
LFB8F:  .byte   $59,$DB,$4C,$A5,$DB,$4C,$41,$DB ; FB8F 59 DB 4C A5 DB 4C 41 DB  Y.L..LA.
        .byte   $4C,$30,$DB,$4C,$2D,$DB,$4C,$07 ; FB97 4C 30 DB 4C 2D DB 4C 07  L0.L-.L.
        .byte   $DB,$4C,$FE,$DA,$4C,$EE,$DA,$4C ; FB9F DB 4C FE DA 4C EE DA 4C  .L..L..L
        .byte   $CE,$DA,$4C,$A4,$DA,$4C,$9E,$DA ; FBA7 CE DA 4C A4 DA 4C 9E DA  ..L..L..
LFBAF:  .byte   $4C,$91,$DA,$4C,$82,$DA,$4C,$8A ; FBAF 4C 91 DA 4C 82 DA 4C 8A  L..L..L.
        .byte   $DA,$4C,$73,$DA,$4C,$6D,$DA,$4C ; FBB7 DA 4C 73 DA 4C 6D DA 4C  .Ls.Lm.L
        .byte   $5D,$DA,$4C,$4C,$DA,$4C,$CD,$CF ; FBBF 5D DA 4C 4C DA 4C CD CF  ].LL.L..
; ----------------------------------------------------------------------------
; XXX
str_copyright:
        .byte   "SEDORIC 1.0 par F.BROCHE et D.S"; FBC7 53 45 44 4F 52 49 43 20 SEDORIC 
                                                ; FBCF 31 2E 30 20 70 61 72 20  1.0 par 
                                                ; FBD7 46 2E 42 52 4F 43 48 45  F.BROCHE
                                                ; FBDF 20 65 74 20 44 2E 53      et D.S
        .byte   "EBBAG(c) 1985 EUREKA!"         ; FBE6 45 42 42 41 47 28 63 29  EBBAG(c)
                                                ; FBEE 20 31 39 38 35 20 45 55   1985 EU
                                                ; FBF6 52 45 4B 41 21           REKA!
; ----------------------------------------------------------------------------
        cmp     ($10),y                         ; FBFB D1 10                    ..
        .byte   $23                             ; FBFD 23                       #
        .byte   $7B                             ; FBFE 7B                       {
        .byte   $B9                             ; FBFF B9                       .
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
LFC57           := * + 2
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
LFC8D:  sty     L0000                           ; FC8D 84 00                    ..
        sta     $01                             ; FC8F 85 01                    ..
        sta     $1C                             ; FC91 85 1C                    ..
        sta     $0247                           ; FC93 8D 47 02                 .G.
        ldx     #$EF                            ; FC96 A2 EF                    ..
LFC98:  lda     COPY_CODE_TO_B800,x             ; FC98 BD CF FC                 ...
        sta     $B7FF,x                         ; FC9B 9D FF B7                 ...
        dex                                     ; FC9E CA                       .
        bne     LFC98                           ; FC9F D0 F7                    ..
        bit     L0000                           ; FCA1 24 00                    $.
        bpl     LFCB2                           ; FCA3 10 0D                    ..
        ldx     #$12                            ; FCA5 A2 12                    ..
LFCA7:  lda     ADDRESS_0X238_TABLE,x           ; FCA7 BD BF FD                 ...
        sta     $0238,x                         ; FCAA 9D 38 02                 .8.
        dex                                     ; FCAD CA                       .
        bpl     LFCA7                           ; FCAE 10 F7                    ..
        bmi     LFCBD                           ; FCB0 30 0B                    0.
LFCB2:  ldx     #$08                            ; FCB2 A2 08                    ..
LFCB4:  lda     ADDRESS_0X228_TABLE,x           ; FCB4 BD D2 FD                 ...
        sta     L0228,x                         ; FCB7 9D 28 02                 .(.
        dex                                     ; FCBA CA                       .
        bpl     LFCB4                           ; FCBB 10 F7                    ..
LFCBD:  ldy     #$00                            ; FCBD A0 00                    ..
        lda     #$C0                            ; FCBF A9 C0                    ..
        sty     $02                             ; FCC1 84 02                    ..
        sta     $03                             ; FCC3 85 03                    ..
        lda     #$C4                            ; FCC5 A9 C4                    ..
        sty     $04                             ; FCC7 84 04                    ..
        sta     $05                             ; FCC9 85 05                    ..
        ldx     #$3C                            ; FCCB A2 3C                    .<
COPY_CODE_TO_B800:= * + 2                       ; $FCCF
        jmp     LB800                           ; FCCD 4C 00 B8                 L..

; ----------------------------------------------------------------------------
LFCD0:  lda     ($02),y                         ; FCD0 B1 02                    ..
        pha                                     ; FCD2 48                       H
        lda     #$00                            ; FCD3 A9 00                    ..
        sta     V2DRA                           ; FCD5 8D 21 03                 .!.
        pla                                     ; FCD8 68                       h
        sta     ($04),y                         ; FCD9 91 04                    ..
        lda     #$07                            ; FCDB A9 07                    ..
        sta     V2DRA                           ; FCDD 8D 21 03                 .!.
        iny                                     ; FCE0 C8                       .
        bne     LFCD0                           ; FCE1 D0 ED                    ..
        inc     $03                             ; FCE3 E6 03                    ..
        inc     $05                             ; FCE5 E6 05                    ..
        dex                                     ; FCE7 CA                       .
        bne     LFCD0                           ; FCE8 D0 E6                    ..
        stx     V2DRA                           ; FCEA 8E 21 03                 .!.
        ldx     #$0A                            ; FCED A2 0A                    ..
LFCEF:  lda     $B8E4,x                         ; FCEF BD E4 B8                 ...
        sta     LC67A,x                         ; FCF2 9D 7A C6                 .z.
        sta     LC77A,x                         ; FCF5 9D 7A C7                 .z.
        dex                                     ; FCF8 CA                       .
        bpl     LFCEF                           ; FCF9 10 F4                    ..
        lda     $01                             ; FCFB A5 01                    ..
        sta     LC67E                           ; FCFD 8D 7E C6                 .~.
        sta     LC77E                           ; FD00 8D 7E C7                 .~.
        lda     L0000                           ; FD03 A5 00                    ..
        asl     a                               ; FD05 0A                       .
        rol     a                               ; FD06 2A                       *
        sta     LC007                           ; FD07 8D 07 C0                 ...
        lda     $01                             ; FD0A A5 01                    ..
LFD0E           := * + 2
        sta     V2DRA                           ; FD0C 8D 21 03                 .!.
        ldx     #$FF                            ; FD0F A2 FF                    ..
        stx     $A6                             ; FD11 86 A6                    ..
        stx     BASIC11_HIMEM_MAX_ADRESS        ; FD13 8E C1 02                 ...
        stx     BASIC11_PARAMS+1                ; FD16 8E E1 02                 ...
        bit     L0000                           ; FD19 24 00                    $.
        bpl     LFD2F                           ; FD1B 10 12                    ..
        lda     #$00                            ; FD1D A9 00                    ..
        sta     $0260                           ; FD1F 8D 60 02                 .`.
        sta     BASIC11_MEMORY_SIZE             ; FD22 8D 20 02                 . .
        ldy     #$97                            ; FD25 A0 97                    ..
        sty     $A7                             ; FD27 84 A7                    ..
LFD2A           := * + 1
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
LFD44:
LFD46           := * + 2
        jmp     (L0008)                         ; FD44 6C 08 00                 l..

; ----------------------------------------------------------------------------
LFD47:  pla                                     ; FD47 68                       h
        pla                                     ; FD48 68                       h
        pla                                     ; FD49 68                       h
        pla                                     ; FD4A 68                       h
        lda     #$22                            ; FD4B A9 22                    ."
        ldy     #$EE                            ; FD4D A0 EE                    ..
        bit     L0000                           ; FD4F 24 00                    $.
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
LFD73:  jsr     L001A                           ; FD73 20 1A 00                  ..
        lda     #$00                            ; FD76 A9 00                    ..
LFD7A           := * + 2
        sta     V2DRA                           ; FD78 8D 21 03                 .!.
        sta     LC000                           ; FD7B 8D 00 C0                 ...
        sta     L0000                           ; FD7E 85 00                    ..
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
        and     ($03,x)                         ; FDB5 21 03                    !.
        eor     #$00                            ; FDB7 49 00                    I.
        sta     V2DRA                           ; FDB9 8D 21 03                 .!.
        pla                                     ; FDBC 68                       h
        plp                                     ; FDBD 28                       (
        rts                                     ; FDBE 60                       `

; ----------------------------------------------------------------------------
; XX
ADDRESS_0X238_TABLE:
        .byte   $4C,$7C,$F7,$4C,$78,$EB,$4C,$C1 ; FDBF 4C 7C F7 4C 78 EB 4C C1  L|.Lx.L.
        .byte   $F5,$4C,$65,$F8,$4C             ; FDC7 F5 4C 65 F8 4C           .Le.L
LFDCC:  .byte   $68,$B8,$4C,$B2,$F8,$40         ; FDCC 68 B8 4C B2 F8 40        h.L..@
; XX
ADDRESS_0X228_TABLE:
        .byte   $4C,$68,$B8,$4C,$30,$F4,$01     ; FDD2 4C 68 B8 4C 30 F4 01     Lh.L0..
LFDD9:  .byte   $00,$40                         ; FDD9 00 40                    .@
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
        .byte   $FF,$FF,$FF,$00,$FC,$FF,$FF     ; FEF9 FF FF FF 00 FC FF FF     .......
LFF00:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF00 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF08 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF10 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF18 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF20 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF28 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF30 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF             ; FF38 FF FF FF FF FF           .....
LFF3D:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF3D FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF45 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF4D FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF55 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF5D FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF65 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF6D FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF75 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF7D FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF85 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF8D FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF95 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FF9D FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFA5 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFAD FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFB5 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFBD FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFC5 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFCD FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF             ; FFD5 FF FF FF FF FF           .....
LFFDA:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFDA FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFE2 FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFEA FF FF FF FF FF FF FF FF  ........
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; FFF2 FF FF FF FF FF FF FF FF  ........
; ----------------------------------------------------------------------------
NMI_VECTOR:
        .addr   IRQ_VECTOR+1                    ; FFFA FF FF                    ..
RESET_VECTOR:
        .addr   START_STRATORIC                 ; FFFC 00 FC                    ..
; ----------------------------------------------------------------------------
IRQ_VECTOR:
        .word   $FFFF                           ; FFFE FF FF                    ..
