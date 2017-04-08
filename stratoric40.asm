; da65 V2.15
; Created:    2017-04-06 21:24:26
; Input file: B7STRA40.rom
; Page:       1


        .setcpu "6502"

L0000           := $0000
L0008           := $0008
L001A           := $001A
L0228           := $0228
L0244           := $0244
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
L0453           := $0453
L0467           := $0467
L046B           := $046B
L0471           := $0471
L0477           := $0477
L0487           := $0487
L04AD           := $04AD
L04B3           := $04B3
L04B4           := $04B4
L04D1           := $04D1
L04E9           := $04E9
L04EC           := $04EC
L04EF           := $04EF
L04F0           := $04F0
L04F2           := $04F2
L04F5           := $04F5
L2020           := $2020
L2044           := $2044
L2045           := $2045
L20A8           := $20A8
L2976           := $2976
L2F49           := $2F49
L3456           := $3456
L4146           := $4146
L414D           := $414D
L414F           := $414F
L4154           := $4154
L42C5           := $42C5
L4449           := $4449
L4544           := $4544
L454C           := $454C
L4552           := $4552
L4553           := $4553
L464F           := $464F
L4944           := $4944
L4946           := $4946
L494C           := $494C
L494D           := $494D
L49CC           := $49CC
L4C41           := $4C41
L4D28           := $4D28
L4D45           := $4D45
L4E28           := $4E28
L4E49           := $4E49
L4E4F           := $4E4F
L4F46           := $4F46
L4F4C           := $4F4C
L4F4E           := $4F4E
L4F54           := $4F54
L504F           := $504F
L5227           := $5227
L5244           := $5244
L5250           := $5250
L5257           := $5257
L52AD           := $52AD
L5328           := $5328
L5445           := $5445
L5546           := $5546
L554E           := $554E
L5551           := $5551
L564F           := $564F
L574F           := $574F
L5928           := $5928
L5942           := $5942
L5B20           := $5B20
L6573           := $6573
L7266           := $7266
L726F           := $726F
L7365           := $7365
LA0D2           := $A0D2
LB800           := $B800
LB900           := $B900
LBBDE           := $BBDE
; X
garbage1:
        .byte   $AD
LC001:  .byte   $07
LC002:  .byte   $C0
LC003:  .byte   $4A
LC004:  .byte   $A9
LC005:  .byte   $00
LC006:  .byte   $6A
LC007:  .byte   $8D,$24
LC009:  .byte   $C0
LC00A:  .byte   $10,$0F,$A9
LC00D:  .byte   $50
LC00E:  .byte   $8D
LC00F:  .byte   $56
LC010:  .byte   $02
LC011:  .byte   $4A
LC012:  .byte   $85
LC013:  .byte   $31
LC014:  .byte   $85
LC015:  .byte   $32
LC016:  .byte   $8D
LC017:  .byte   $57
LC018:  .byte   $02
LC019:  .byte   $D0
LC01A:  .byte   $06
LC01B:  .byte   $A9
LC01C:  .byte   $5D
LC01D:  .byte   $85
LC01E:  .byte   $31
LC01F:  .byte   $85
LC020:  .byte   $32
LC021:  .byte   $EE
LC022:  .byte   $C1
LC023:  .byte   $02
LC024:  .byte   $EE
LC025:  .byte   $C2
LC026:  .byte   $02
LC027:  .byte   $A2
LC028:  .byte   $00
LC029:  .byte   $BD,$00,$C6,$2C,$24,$C0,$10,$03
        .byte   $BD
LC032:  .byte   $00,$C7,$9D
LC035:  .byte   $00
LC036:  .byte   $04
LC037:  .byte   $E8
LC038:  .byte   $D0
LC039:  .byte   $EF,$A9,$4C,$A0
LC03D:  .byte   $00,$A2,$04,$85,$EF
LC042:  .byte   $84
LC043:  .byte   $F0
LC044:  .byte   $86
LC045:  .byte   $F1
LC046:  .byte   $A9
LC047:  .byte   $88
LC048:  .byte   $A0
LC049:  .byte   $C4
LC04A:  .byte   $2C
LC04B:  .byte   $24
LC04C:  .byte   $C0
LC04D:  .byte   $10
LC04E:  .byte   $26
LC04F:  .byte   $8D
LC050:  .byte   $45
LC051:  .byte   $02
LC052:  .byte   $8E
LC053:  .byte   $46
LC054:  .byte   $02
LC055:  .byte   $8C
LC056:  .byte   $48
LC057:  .byte   $02
LC058:  .byte   $8E
LC059:  .byte   $49
LC05A:  .byte   $02
LC05B:  .byte   $A9
LC05C:  .byte   $5B
LC05D:  .byte   $8D
LC05E:  .byte   $3C
LC05F:  .byte   $02,$8E,$3D,$02,$A9,$09,$A0
LC066:  .byte   $01
LC067:  .byte   $8D
LC068:  .byte   $4E,$02,$8C,$4F,$02,$A9,$0F,$A2
        .byte   $70,$A0
LC072:  .byte   $D0
LC073:  .byte   $D0,$12
LC075:  .byte   $8D
LC076:  .byte   $29,$02,$8E,$2A,$02
LC07B:  .byte   $8C
LC07C:  .byte   $2C
LC07D:  .byte   $02
LC07E:  .byte   $8E
LC07F:  .byte   $2D
LC080:  .byte   $02
LC081:  .byte   $A9
LC082:  .byte   $07
LC083:  .byte   $A2
LC084:  .byte   $E4
LC085:  .byte   $A0
LC086:  .byte   $CF
LC087:  .byte   $8D
LC088:  .byte   $6A,$02,$8E,$F9,$02,$8C,$FA,$02
        .byte   $A2
LC091:  .byte   $04,$A9,$9A,$A0,$D0,$8D,$FE,$FF
        .byte   $8C,$FF,$FF,$A9
LC09D:  .byte   $67
LC09E:  .byte   $A0,$61,$8D,$F5,$02,$8E,$F6,$02
        .byte   $8C,$FC,$02
LC0A9:  .byte   $8E,$FD,$02,$A9,$00,$8D,$09,$C0
        .byte   $8D,$0A,$C0,$8D,$0B,$C0,$8D,$0C
        .byte   $C0,$8D,$15,$C0,$8D,$18,$C0,$8D
        .byte   $DF,$02,$8D,$48,$C0,$85,$87,$A9
        .byte   $85,$A0,$D6,$8D,$1D,$C0,$8C,$1E
        .byte   $C0,$AD,$11,$03,$8D,$0C,$C0,$A9
        .byte   $23,$A0,$DE,$A2,$80,$8D,$66,$C0
        .byte   $8C,$67,$C0,$8E,$68,$C0,$8D,$69
        .byte   $C0,$8C,$6A,$C0,$8E,$6B,$C0,$8D
        .byte   $6C,$C0,$8C,$6D,$C0,$8E,$6E,$C0
        .byte   $8D,$6F,$C0,$8C,$70,$C0
LC0FF:  .byte   $8E
LC100:  .byte   $71
LC101:  .byte   $C0
LC102:  .byte   $A9
LC103:  .byte   $2E
LC104:  .byte   $8D
LC105:  .byte   $75
LC106:  .byte   $C0
LC107:  .byte   $A9
LC108:  .byte   $1A
LC109:  .byte   $A0,$00,$8D,$F0,$04,$8C,$F1,$04
        .byte   $A5,$00,$F0,$12,$A2,$FF,$E8,$BD
        .byte   $74,$C5,$9D,$00,$B9,$D0,$F7,$A9
        .byte   $00,$A0,$B9,$20,$EC,$04,$A9,$14
        .byte   $A0,$01,$20,$5D,$DA,$A2,$08,$BD
        .byte   $00,$C1,$9D,$39,$C0,$E0,$05,$90
        .byte   $03,$9D,$3D,$C0,$CA,$10,$F0,$20
        .byte   $A3,$EB,$20,$D8,$D5,$E0,$F7,$16
        .byte   $F8,$A2,$41,$BD,$1E,$C1,$95,$36
        .byte   $CA,$10,$F8,$A9,$3A,$85,$35,$20
        .byte   $06,$D2,$A9,$BD,$A0,$C4,$2C,$24
        .byte   $C0,$30,$02,$A9,$CD,$8D,$F0,$04
        .byte   $8C,$F1,$04,$A2,$34,$A0,$00,$58
        .byte   $4C,$71,$04,$0A,$8C,$81,$2A,$2A
        .byte   $20
; X
str_WARNING:
        .byte   "WARNING **"

        .byte   $88
        .byte   $87
; X
str_DOS_ALTERED:
        .byte   "DOS"
LC189:  .byte   " is altered !"

        .byte   $0D,$0A,$00
        .byte   "L"
        .byte   $64
        .byte   $D3
        rts

        lda     LC5AE
        .byte   $AE
        .byte   $AF
LC1A2:  cmp     $8D
        ora     ($C0,x)
        stx     LC002
        lda     LC5B0
        bne     LC189
        .byte   $27
        ora     #$1A
; X
str_IN_DRIVE:
        .byte   "IN DRIVE"
        .byte   $A0
        .byte   "LOAD DISCS FOR BACKUP FROM"



        .byte   $A0
        .byte   " TO"
        .byte   $A0,$0D
        asl     a
; X
str_LOAD:
        .byte   "LOAD SOURCE DISC"

        ldy     #$0D
        asl     a
        jmp     L414F

        .byte   $44
        jsr     L4154
        .byte   $52
        .byte   $47
        eor     $54
        jsr     L4944
        .byte   $53
        .byte   $43
        ldy     #$0D
LC200:  cmp     #$30
LC202:  .byte   $90
LC203:  .byte   $04
LC204:  .byte   $C9
LC205:  .byte   $3A
LC206:  .byte   $90
LC207:  .byte   $35
LC208:  .byte   $86
LC209:  .byte   $0F
LC20A:  tax
LC20B:  .byte   $30
LC20C:  rol     $C185
        pla
LC210:  tax
        pla
        pha
        cpx     #$F7
        .byte   $D0
LC216:  .byte   $04
        cmp     #$C8
        beq     LC224
LC21B:  cpx     #$58
        bne     LC237
        cmp     #$CA
        bne     LC237
        .byte   $24
LC224:  clc
        ror     $04FC
        ldy     #$FF
LC22A:  iny
        lda     ($E9),y
        beq     LC240
        cmp     #$3A
        beq     LC240
        cmp     #$D4
        bne     LC22A
LC237:  txa
        pha
        lda     $C1
LC23B:  ldx     $0F
LC23D:  jmp     LEA41

LC240:  pla
        jsr     L04E9
        jsr     L0467
        asl     $04FC
        bcs     LC24F
        jmp     LC8AD

LC24F:  nop
        nop
        nop
        rts

        jsr     L0477
        lda     ($16),y
        jmp     L0477

        nop
        nop
        nop
        nop
        nop
        nop
        lda     #$8E
        ldy     #$F8
        bne     LC26B
        lda     #$AE
        ldy     #$D3
LC26B:  sta     L04F0
        sty     $04F1
        jsr     L0477
        jsr     L04EF
        php
        pha
        sei
        lda     $04FB
        eor     #$02
        sta     $04FB
        sta     $0314
        pla
        plp
        rts

        bit     V1IFR
        bvc     LC29C
        pha
        lda     #$04
        and     $026A
        beq     LC298
        inc     $0274
LC298:  pla
        jmp     LEC03

LC29C:  pla
        pla
        sta     $F2
        pla
        tax
LC2A2:  lda     #$36
        ldy     #$D1
        bne     LC26B
        .byte   $20
LC2A9:  .byte   $F2
        .byte   $04
        pla
        rti

        sta     $0314
        jmp     (LFFFC)

        clc
        jsr     L0477
        pha
        lda     #$04
        pha
        lda     #$A8
        pha
        php
        bcs     LC2C4
        jmp     L0228

LC2C4:  jsr     LF888
        lda     #$17
        ldy     #$EC
        jsr     L046B
        jmp     LC475

        lda     #$04
        pha
        lda     #$F1
        pha
        txa
        pha
        tya
LC2DA:  pha
        jsr     L04F2
        jmp     LD270

        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        jmp     L0487

        jmp     L0471

        jmp     L0000

        jmp     L0477

        jmp     L04B3

        jmp     L04B4

        sty     L0000
        brk
        brk
        brk
LC300:  .byte   $C9
LC301:  .byte   $30
LC302:  .byte   $90
LC303:  .byte   $04
        cmp     #$3A
        bcc     LC33D
LC308:  stx     $0F
        tax
        .byte   $30
LC30C:  .byte   $2E
LC30D:  .byte   $85
LC30E:  .byte   $C1
LC30F:  pla
        tax
        pla
        pha
        cpx     #$0E
        bne     LC31B
        cmp     #$C9
        beq     LC324
LC31B:  cpx     #$8A
        bne     LC337
        cmp     #$CA
        bne     LC337
        .byte   $24
LC324:  clc
        ror     $04FC
        ldy     #$FF
LC32A:  iny
        lda     ($E9),y
        beq     LC340
        cmp     #$3A
        beq     LC340
        cmp     #$D4
        bne     LC32A
LC337:  txa
        pha
        lda     $C1
LC33B:  ldx     $0F
LC33D:  jmp     LECB9

LC340:  pla
        jsr     L04E9
        jsr     L0467
        asl     $04FC
        bcs     LC34F
        jmp     LC8C1

LC34F:  ror     $0252
        rts

        jsr     L0477
        lda     ($16),y
        jmp     L0477

        lda     #$45
        ldy     #$D8
        bne     LC36B
        lda     #$8E
        ldy     #$F8
        bne     LC36B
        lda     #$AE
        ldy     #$D3
LC36B:  sta     L04F0
        sty     $04F1
        jsr     L0477
        jsr     L04EF
        php
        pha
        sei
        lda     $04FB
        eor     #$02
        sta     $04FB
        sta     $0314
        pla
        plp
        rts

        bit     V1IFR
        bvc     LC39C
        pha
        lda     #$04
        and     $026A
        beq     LC398
        inc     $0274
LC398:  pla
        jmp     LEE22

LC39C:  pla
        pla
        sta     $F2
        pla
        tax
LC3A2:  lda     #$36
        ldy     #$D1
        bne     LC36B
        .byte   $20
LC3A9:  .byte   $F2
        .byte   $04
        pla
        rti

        sta     $0314
        jmp     (LFFFC)

        clc
        jsr     L0477
        pha
        lda     #$04
        pha
        lda     #$A8
        pha
        php
        bcs     LC3C4
        jmp     L0244

LC3C4:  .byte   $20
        clv
LC3C6:  sed
        lda     #$17
        ldy     #$EC
        jsr     L046B
        jmp     LC471

        lda     #$04
        pha
        lda     #$F1
        pha
        txa
        pha
        tya
        pha
        jsr     L04F2
        jmp     LD306

        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        jmp     L0487

        jmp     L0471

        jmp     L0000

        jmp     L0477

        jmp     L04B3

        jmp     L04B4

        sty     L0000
        brk
        brk
        brk
LC400:  .byte   $07
        eor     $57
        .byte   $4B
LC404:  brk
        clc
        .byte   $07
        php
        eor     $067B,y
        ora     #$00
        .byte   $42
        eor     ($51,x)
        ora     $67
        .byte   $24
LC413:  brk
        brk
        .byte   $5B
        .byte   $27
        brk
        .byte   $1B
        .byte   $3F
        .byte   $04
        asl     a
        brk
        .byte   $5F
        and     a:$0D,x
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        ora     (L0000,x)
        php
        brk
        brk
        brk
        and     ($FF,x)
        adc     $0263
        .byte   $0C
        brk
        .byte   $0F
        .byte   $72
        brk
        .byte   $03
        .byte   $32
        and     #$00
        brk
        asl     $0B1E
        .byte   $17
        .byte   $B2
        tay
        .byte   $F1
LC444:  brk
        sty     $18A6
        bcc     LC413
        asl     $19,x
        brk
        .byte   $92
        ldx     #$BC
        ora     $9C,x
        dex
        brk
        brk
        .byte   $D2
        .byte   $9B
        bpl     LC444
        sta     $1A14
        brk
        .byte   $87
        iny
        ora     a:L0000,x
        brk
        brk
        brk
        brk
        brk
        brk
        ora     (L0000),y
        lda     L0000
        brk
        brk
        cmp     ($FF),y
        .byte   $A4
LC471:  txs
        .byte   $12
        .byte   $1C
        brk
LC475:  .byte   $1F
        .byte   $CB
        brk
        .byte   $13
        sta     ($ED),y
        brk
        brk
        asl     $1BB5,x
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        ldy     #$20
        jsr     L2020
        .byte   $20
        .byte   $20
; X
str_BASIC:
        .byte   "DOKE#2F5,"

        .byte   $A3
        .byte   "  DOK"
LC4A5:  .byte   "E#2F5,#467"

        .byte   $8D
        .byte   "      DOKE#2F9,"

        .byte   $A3
        .byte   " DOKE#2F9,#D070"

        .byte   $8D
        .byte   "      D"
LC4D7:  .byte   "OKE#2FC,"
        .byte   $A3
        .byte   "  DOKE#2FC,#461"

        .byte   $8D
        .byte   "    PAPER0:INK7"

        .byte   $8D
        .byte   "      CALL#F8D0"

        .byte   $8D
        .byte   "               "

        .byte   $FE
        .byte   "    ?HEX$(PEEK("

        .byte   $A3
        .byte   "    ?HEX$(DEEK("

        .byte   $A3
        .byte   "          PEEK("

        .byte   $A3
        .byte   "          DEEK("

        .byte   $A3
        .byte   "           POKE"

        .byte   $A3
        .byte   "          "

LC57A:  .byte   " DOKE"
        .byte   $A3
        .byte   "HEX$"
        .byte   $A8
        .byte   "CALL"
        .byte   $A3
        .byte   "TEXT"
        .byte   $8D
        .byte   "FORI=1T"
        .byte   $CF
        .byte   "LEFT$"
        .byte   $A8
        .byte   "MID$"
        .byte   $A8
        .byte   "RIGHT$"
        .byte   $A8
        .byte   "STR$"
        .byte   $A8
LC5AE:  .byte   "U"
LC5AF:  .byte   "N"
LC5B0:  .byte   "PROT"
        .byte   $8D,$E0
        .byte   "USIN"
        .byte   $C7
        .byte   "VISUHIRES"

        .byte   $A2
        .byte   "VUSER"
        .byte   $8D
        .byte   "WIDT"
        .byte   $C8
        .byte   "WINDO"
        .byte   $D7
        .byte   "!RESTOR"
        .byte   $C5
        .byte   "PP"
        .byte   $80,$00
        .byte   "ZERTY"
        .byte   $00
        .byte   "CCENT"
        .byte   $00
        .byte   "OX"
        .byte   $00
        .byte   "ACKUP"
        .byte   $00
        .byte   "UILD"
        .byte   $00
        .byte   "HDIR"
        .byte   $00
        .byte   "HANGE"
        .byte   $00
        .byte   "LOSE"
        .byte   $00
        .byte   "OPY"
        .byte   $00
        .byte   "REATEW"
        .byte   $00
        .byte   "RESEC"
        .byte   $00
        .byte   "HKSUM"
        .byte   $00
        .byte   "ELDIR"
        .byte   $00
        .byte   "E"
        .byte   $96
        .byte   "E"
        .byte   $00
        .byte   "ESTROY"
        .byte   $00
        .byte   "ELBAK"
        .byte   $00
        .byte   "EL"
        .byte   $00
        .byte   "IR"
        .byte   $00
        .byte   "NUM"
        .byte   $00
        .byte   "NAME"
        .byte   $00
        .byte   "KEY"
        .byte   $00
        .byte   "SYS"
        .byte   $00
        .byte   "TRACK"
        .byte   $00
        .byte   "RR"
        .byte   $97,$00
        .byte   "RRGOTO"
        .byte   $00
        .byte   "RROR"
        .byte   $00
        .byte   "RR"
        .byte   $D2,$00
        .byte   "RR"
        .byte   $00
        .byte   "SAVE"
        .byte   $00
        .byte   "XT"
        .byte   $00
        .byte   "IELD"
LC67A:  .byte   $00
        .byte   "RSE"
LC67E:  .byte   "C"
        .byte   $00
        .byte   "CUR"
        .byte   $00
        .byte   "NIT"
        .byte   $00
        .byte   "NSTR"
        .byte   $00
        .byte   "NIST"
        .byte   $00
        .byte   "UMP"
        .byte   $00
        .byte   "EY"
        .byte   $99,$00
        .byte   "EYIF"
        .byte   $00
        .byte   "EYUSE"
        .byte   $00
        .byte   "EYDEF"
        .byte   $00
        .byte   "EY"
        .byte   $B8,$00
        .byte   "EYSAVE"
        .byte   $00
        .byte   "EY"
        .byte   $00
        .byte   "INE"
        .byte   $00
        .byte   "SET"
        .byte   $00
        .byte   "USING"
        .byte   $00
        .byte   "U"
        .byte   $E3
        .byte   "G"
        .byte   $00,$92,$00
        .byte   "OAD"
        .byte   $00
        .byte   "DIR"
        .byte   $00
        .byte   "TYPE"
        .byte   $00
        .byte   "CUR"
        .byte   $00
        .byte   "KDIR"
        .byte   $00
        .byte   "OVE"
        .byte   $00
        .byte   "ERGE"
        .byte   $00
        .byte   "UM"
        .byte   $00
        .byte   "UT"
        .byte   $00
        .byte   "LD"
        .byte   $00
        .byte   "PEN"
        .byte   $00
        .byte   "ATHDIR"
        .byte   $00
        .byte   "UT"
        .byte   $00
        .byte   "ROT"
        .byte   $00
        .byte   "R"
        .byte   $00
        .byte   "MAP"
        .byte   $00
        .byte   "UIT"
        .byte   $00
        .byte   "WERTY"
        .byte   $00
        .byte   "ESUME"
        .byte   $00
        .byte   "SET"
        .byte   $00
        .byte   "EWIND"
        .byte   $00
        .byte   "ENUM"
        .byte   $00
        .byte   "EN"
        .byte   $00,$D1
        .byte   "OM"
        .byte   $00
        .byte   "ANDOM"
        .byte   $00
        .byte   "ESET"
        .byte   $00
        .byte   "WAP"
        .byte   $00
        .byte   "EEK"
        .byte   $00
        .byte   "TRUN"
        .byte   $00
        .byte   "T"
        .byte   $98,$00
        .byte   "YSTEM"
        .byte   $00
        .byte   "TATUS"
        .byte   $00
        .byte   "AVEU"
        .byte   $00
        .byte   "AVEM"
        .byte   $00
        .byte   "AVEO"
        .byte   $00
        .byte   "AVE"
        .byte   $00
        .byte   "EARCH"
        .byte   $00
        .byte   "YS"
        .byte   $00
        .byte   "MAP"
        .byte   $00
LC77A:  .byte   "KEN"
        .byte   $00
LC77E:  .byte   "AKE"
        .byte   $00
        .byte   "YPE"
        .byte   $00
        .byte   "RACK"
        .byte   $00
        .byte   "SER"
        .byte   $00
        .byte   "NTKEN"
        .byte   $00,$E3
        .byte   "G"
        .byte   $00
        .byte   "NPROT"
        .byte   $00
        .byte   "ISU"
        .byte   $A2,$00
        .byte   "USER"
        .byte   $00
        .byte   "IDTH"
        .byte   $00
        .byte   "INDO"
        .byte   $57
        brk
        txs
        brk
        eor     LFF00,x
        brk
        brk
        brk
        dec     a:$C9,x
        .byte   $03
        inc     $03C9
        .byte   $03
        .byte   $FC
        cmp     #$06
        .byte   $07
        .byte   $23
        dex
        ora     $570B
        dex
        clc
        .byte   $07
        ror     $CA,x
        .byte   $1F
        .byte   $02
        cpy     $21CC
        brk
        .byte   $80
        dex
        and     ($01,x)
        sty     $CA
        .byte   $22
        .byte   $03
        .byte   $92
        dex
        and     $01
        stx     $CA,y
        rol     $07
        lda     $2DCA,y
        ora     #$DE
        dex
        rol     $03,x
        cpx     $39CA
        ora     ($EF,x)
        dex
        .byte   $3A
        .byte   $03
        sbc     $3DCA,y
        ora     $0D
        .byte   $CB
        .byte   $42
        .byte   $02
        .byte   $17
LC800:  .byte   $CB
        .byte   $44
        php
        rol     $4CCB,x
        ora     LCB7A
        eor     $8B04,y
        .byte   $CB
        eor     $9E04,x
        .byte   $CB
        adc     ($02,x)
        tay
        .byte   $CB
        .byte   $63
        .byte   $02
        cpy     $65CC
        brk
        cpy     $65CC
        brk
        cpy     $65CC
        brk
        .byte   $B3
        .byte   $CB
        adc     $03
        asl     $FE
        cmp     $90EB,x
        .byte   $EB
        cmp     $50F0,x
        sbc     ($DF),y
        inc     LE772,x
        .byte   $47
        sbc     ($8C),y
        .byte   $FB
        lsr     $F1,x
        jmp     LBBDE

        sbc     LE9FE,y
        adc     $E7,x
        eor     ($F1,x)
        .byte   $43
        cpx     $36
        cpx     $45
        cpx     $43
        .byte   $E3
        and     #$F1
        .byte   $44
        sbc     ($23),y
        sbc     ($26),y
        sbc     ($38),y
        sbc     ($98),y
        sbc     #$98
        sbc     #$AF
        sbc     #$AF
        sbc     #$7E
        sbc     #$DF
        cmp     LE9EC,x
        ldx     $9BFB,y
        sbc     LEBF4,y
        pla
        sbc     ($2D),y
        cpx     LF12C
        ora     ($FE),y
        .byte   $1F
        .byte   $DA
        .byte   $1F
        .byte   $DA
        .byte   $3F
        .byte   $E7
        .byte   $42
        .byte   $E7
        .byte   $42
        .byte   $E7
        cpy     $0ADD
        .byte   $E7
        sei
        beq     LC8F6
        .byte   $FC
        and     $F0,x
        and     $F0,x
        .byte   $93
        cpx     LDFF6
        lsr     $94E7
        inc     LEBEB,x
        .byte   $6F
        .byte   $E7
        and     $F1,x
        .byte   $3B
        sbc     ($48),y
        .byte   $E7
        asl     $AEE7,x
        cpx     #$4F
        .byte   $FA
        sei
LC8A2:  .byte   $E7
        dex
        sbc     LE9F5,y
        .byte   $BF
        .byte   $E7
        .byte   $8F
        sbc     LE7F4,y
LC8AD:  cpx     #$EB
        tsx
        sbc     #$74
        .byte   $FC
        tsx
        .byte   $FA
        eor     $4BF1
        .byte   $E7
        sta     $E7,x
        sta     $E7,x
        .byte   $B7
        .byte   $E7
        .byte   $3A
        nop
LC8C1:  .byte   $53
        sbc     ($52),y
        inx
        .byte   $52
        inx
        .byte   $FB
        sbc     #$F2
        sbc     #$4C
        cmp     LDD49,x
        .byte   $52
        .byte   $DD
        .byte   $4F
LC8D2:  cmp     $E5FB,x
        eor     $95F1,y
        sbc     LE89C,y
        dec     $97F8,x
        inc     LF12F,x
        ror     LE0EA,x
        inx
        tya
        inc     LE9F8
        .byte   $EF
        sbc     #$20
        sbc     ($45),y
        .byte   $E7
        .byte   $0F
        .byte   $F2
        cld
        .byte   $E7
        .byte   $03
        .byte   $EC
        .byte   $3D
LC8F6:  inx
        .byte   $43
        .byte   $4F
        eor     $4142
        .byte   $4B
        .byte   $43
        .byte   $4F
        eor     $3F3F
        .byte   $3F
        .byte   $3F
        .byte   $3F
        .byte   $3F
        .byte   $3F
        .byte   $3F
        .byte   $3F
        .byte   $42
        eor     ($4B,x)
        plp
        bvc     LC944
        eor     a:L0000,x
        ora     ($01,x)
        .byte   $FA
        .byte   $BF
        .byte   $23
        .byte   $34
        rol     $37,x
        .byte   $FF
        .byte   $7B
        asl     $35FA
        bpl     LC8A2
        cmp     #$0F
        .byte   $DA
        ldx     #$C6
        cmp     #$88
        .byte   $02
        dey
        .byte   $02
        .byte   $4F
        lsr     $46
        .byte   $53
        eor     $54
        .byte   $C7
        sta     ($C2,x)
        .byte   $82
        eor     $D3
        ror     $A5
        iny
        .byte   $A3
        .byte   $8F
        .byte   $D2
        .byte   $42
        lda     $98,x
        cpx     #$B1
        .byte   $BE
        .byte   $AE
LC944:  tax
        .byte   $82
        .byte   $93
        ldx     $B1AA
        ldx     $8293,y
        rti

        bpl     LC958
        .byte   $1C
        .byte   $02
        asl     $1E22,x
        brk
        .byte   $5C
        brk
LC958:  brk
        asl     L2020,x
        jsr     L041E
        .byte   $7B
        .byte   $04
        php
        .byte   $1C
        .byte   $22
        rol     $1E20,x
        brk
        .byte   $7C
        bpl     LC973
        .byte   $22
        .byte   $22
        .byte   $22
        rol     L001A
        brk
        .byte   $7D
        .byte   $10
LC973:  php
        .byte   $1C
        .byte   $22
        rol     $1E20,x
        brk
        ror     $221C,x
        .byte   $1C
        .byte   $22
        rol     $1E20,x
        brk
        eor     ($58,x)
        eor     $B850,y
        asl     a
        .byte   $64
        inx
        bpl     LC98D
LC98D:  brk
        .byte   $03
        .byte   $27
        sty     $A4
        cpy     $E4
        eor     $4E
        eor     $4C
        eor     #$4E
        .byte   $4F
        eor     $4B53
        lsr     $54
        eor     $4F
        .byte   $52
        eor     ($52,x)
        cli
        .byte   $52
        eor     $5052,y
        eor     $46
        .byte   $53
        .byte   $54
        eor     $44
        eor     $58
        .byte   $43
        cli
        .byte   $43
        eor     $5046,y
        lsr     $53
        .byte   $53
        .byte   $43
        lsr     a
        .byte   $4B
        eor     $46
        eor     #$4C
        eor     $20
        lsr     $544F
        jsr     L4F46
        eor     $4E,x
        cpy     $44
        .byte   $52
        eor     #$56
        eor     $20
        lsr     $544F
        jsr     L4E49
        jsr     L494C
        lsr     $49C5
        lsr     $4156
        jmp     L4449

        jsr     L4946
        jmp     L2045

        lsr     $4D41
        cmp     $44
        eor     #$53
        .byte   $4B
        jsr     L2F49
        .byte   $CF
        .byte   $57
        .byte   $52
        eor     #$54
        eor     $20
        bvc     LCA51
        .byte   $4F
        .byte   $54
        eor     $43
        .byte   $54
        eor     $C4
        .byte   $57
        eor     #$4C
        .byte   $44
        .byte   $43
        eor     ($52,x)
        .byte   $44
        plp
        .byte   $53
        and     #$20
        lsr     $544F
        jsr     L4C41
        jmp     L574F

        eor     $C4
        lsr     $49
        jmp     L2045

        eor     ($4C,x)
        .byte   $52
        eor     $41
        .byte   $44
        eor     $4520,y
        cli
        eor     #$53
        .byte   $54
        .byte   $D3
        .byte   $44
        eor     #$53
        .byte   $4B
        jsr     L5546
        jmp     L49CC

        jmp     L454C

        .byte   $47
        eor     ($4C,x)
        jsr     L5551
        eor     ($4E,x)
        .byte   $54
        eor     #$54
        cmp     $5953,y
        lsr     L4154
        cld
        eor     $4E,x
LCA51:  .byte   $4B
        lsr     L574F
        lsr     $4620
        .byte   $4F
        .byte   $52
        eor     LD441
        .byte   $D4
        .byte   $54
        eor     $4550,y
        jsr     L494D
        .byte   $53
        eor     $5441
        .byte   $43
        iny
        lsr     $49
        jmp     L2045

        .byte   $54
        eor     $4550,y
        jsr     L494D
        .byte   $53
        eor     $5441
        .byte   $43
        iny
        lsr     $49
        jmp     L2045

        lsr     $544F
        jsr     L504F
        eor     $CE
        lsr     $49
        jmp     L2045

        eor     ($4C,x)
        .byte   $52
        eor     $41
        .byte   $44
        eor     $4F20,y
        bvc     LCADF
        dec     $4E45
        .byte   $44
        jsr     L464F
        jsr     L4946
        jmp     L42C5

        eor     ($44,x)
        jsr     L4552
        .byte   $43
        .byte   $4F
        .byte   $52
        .byte   $44
        jsr     L554E
        eor     $4542
        .byte   $D2
        lsr     $49
        eor     $4C
        .byte   $44
        jsr     L564F
        eor     $52
        lsr     $4C
        .byte   $4F
        .byte   $D7
        .byte   $53
        .byte   $54
        .byte   $52
        eor     #$4E
        .byte   $47
        jsr     L4F54
        .byte   $4F
        jsr     L4F4C
        lsr     $55C7
        lsr     $4E4B
        .byte   $4F
        .byte   $57
        lsr     $4620
        eor     #$45
LCADF:  jmp     L2044

        lsr     $4D41
        cmp     $C5
        asl     a
        ora     $5254
        eor     ($43,x)
        .byte   $4B
        tsx
        jsr     L4553
        .byte   $43
        .byte   $54
        .byte   $4F
        .byte   $52
        tsx
        jsr     L5257
        eor     #$54
        eor     $20
        lsr     $41
        eor     $4C,x
        .byte   $54
        ldy     #$20
        .byte   $52
        eor     $41
        .byte   $44
        jsr     L4146
        eor     $4C,x
        .byte   $54
        ldy     #$0A
        ora     $4220
        .byte   $52
        eor     $41
        .byte   $4B
        jsr     L4E4F
        jsr     L5942
        .byte   $54
        eor     $20
        .byte   $A3
        ora     $440A
        .byte   $72
        adc     #$76
        adc     $A0
        jsr     L3456
        jsr     L4D28
        .byte   $73
        .byte   $74
        and     #$A0
        jsr     L7266
        adc     $65
        jsr     L6573
        .byte   $63
        .byte   $74
        .byte   $6F
        .byte   $72
        .byte   $73
        jsr     L20A8
        lsr     $69
        jmp     (L7365)

        ldy     #$20
        eor     #$53
        jsr     L5250
        .byte   $4F
        .byte   $54
        eor     $43
        .byte   $54
        eor     $C4
        jsr     L5928
        and     #$65
        .byte   $73
        jsr     L726F
        jsr     L4E28
        and     #$6F
        tsx
        jsr     L4544
        jmp     L5445

        eor     $44
        ora     $498A
        lsr     L4553
        .byte   $52
        .byte   $54
        jsr     L414D
        .byte   $53
LCB7A:  .byte   $54
        eor     $52
        ldy     #$41
        lsr     L2044
        bvc     LCBD6
        eor     $53
        .byte   $53
        jsr     L5227
        eor     $54
        eor     $52,x
        lsr     $20A7
        eor     ($4C,x)
        .byte   $52
        eor     $41
        .byte   $44
        eor     $4520,y
        cli
        eor     #$53
        .byte   $54
        .byte   $53
        asl     a
        sta     $2D20
        and     $A03E
        eor     $53,x
        eor     $52
        ldy     #$20
        lsr     $34,x
        jsr     L5328
        jmp     (L2976)

        ldy     #$20
        plp
        .byte   $54
        adc     $6570,y
LCBBB:  .byte   $BD
LCBBC:  .byte   $29
LCBBD:  .byte   $A0
LCBBE:  jsr     L4944
        .byte   $53
        .byte   $43
        jsr     L4E49
        jsr     L5244
        eor     #$56
        eor     $A0
        php
        lda     V1ER
        pha
        tya
        pha
        lda     #$40
LCBD6:  sta     V1ER
        jsr     LCFE9
        pla
        tay
        pla
        sta     V1ER
        plp
        lda     #$FF
        bit     LC017
        rts

        nop
        ldy     #$03
        sty     LC006
        ldy     #$08
        sty     LC007
        pha
        sei
        stx     LC005
        ldy     garbage1
        lda     LD122,y
        bit     LC001
        bpl     LCC06
        ora     #$10
LCC06:  sta     $04FB
        lda     LD126,y
        nop
        nop
        sta     $0311
        lda     LC003
        sta     $F3
        lda     LC004
        sta     $F4
        lda     #$20
        bit     LC005
        bpl     LCC4C
        bvc     LCC26
        beq     LCC4C
LCC26:  .byte   $AD
LCC27:  .byte   $01
LCC28:  cpy     #$29
        .byte   $7F
        nop
        sta     $0313
        nop
        nop
        nop
        cmp     $0311
        beq     LCC4C
        txa
        ldx     #$18
        jsr     LCFF4
        sta     LC005
        ldy     $0313
        ora     #$04
        tax
        sty     $0311
        nop
        nop
        nop
LCC4C:  ldy     LC002
        sty     $0312
        ldy     #$00
        txa
        bmi     LCC5A
LCC57:  dey
        bne     LCC57
LCC5A:  lda     $04FB
        stx     $0310
        ora     #$01
        sta     $0314
        txa
        and     #$F0
        cmp     #$E0
        cli
        beq     LCC73
        and     #$20
        bne     LCC85
        nop
        nop
LCC73:  lda     $0318
        bmi     LCC73
        lda     $0313
        sta     ($F3),y
        iny
        bne     LCC73
        inc     $F4
        jmp     LD073

LCC85:  lda     $0318
        bmi     LCC85
        lda     ($F3),y
        sta     $0313
        iny
        bne     LCC85
        inc     $F4
        jmp     LD085

        nop
        nop
        nop
        bit     $0314
        bpl     LCCA2
        jmp     L04F5

LCCA2:  pla
        pla
        pla
        lda     $04FB
        sta     $0314
        ldy     garbage1
        lda     $0311
        sta     LD126,y
        clc
        lda     $0310
        and     #$5C
        tay
        .byte   $AE
LCCBC:  .byte   $05
LCCBD:  cpy     #$30
        .byte   $02
        ldy     #$00
LCCC2:  sty     LC017
        and     #$40
        bne     LCCD8
        tya
        and     #$10
        beq     LCCDB
        dec     LC006
        beq     LCCD8
        jsr     LD0E8
        bcc     LCCE5
LCCD8:  sec
LCCD9:  pla
        rts

LCCDB:  tya
        and     #$0C
        beq     LCCD9
        dec     LC007
        beq     LCCD8
LCCE5:  jmp     LCFF9

        txa
        pha
        lda     LC003
        pha
        lda     LC004
        pha
        lda     #$60
        ldy     #$C0
        .byte   $8D
LCCF7:  .byte   $03
        cpy     #$8C
LCCFA:  .byte   $04
        cpy     #$AD
        asl     $C0
        ldx     #$C0
        ldy     #$01
        jsr     LCFEC
        sta     LC006
        pla
        sta     LC004
        pla
        .byte   $8D
        .byte   $03
LCD10:  cpy     #$B0
        ora     #$AD
        .byte   $12
        .byte   $03
        ldy     garbage1
        .byte   $99
LCD1A:  rol     $D1
LCD1C:  pla
        tax
        .byte   $8E
LCD1F:  ora     $C0
        rts

        sty     $A4
        .byte   $C4
LCD25:  cpx     $50
        bvc     $CD79
        bvc     $CD7B
LCD2B:  bcc     $CD32
        .byte   $A9
LCD2E:  bne     LCCBD
        bpl     LCD35
        sec
        .byte   $4C
        sed
LCD35:  .byte   $04
        stx     $F3
        ldx     #$04
        jsr     LD36C
        sec
        ldx     $F3
        .byte   $A5
LCD41:  .byte   $F2
        sbc     #$02
        bcs     LCD47
        dex
LCD47:  pha
        txa
        jsr     LD613
        pla
LCD4D:  jsr     LD613
        cli
        ldx     #$FF
        txs
        jsr     LD5D8
        lda     $A0C4
        cpy     $60
        jsr     LD5D8
        sed
        .byte   $C3
        .byte   $F4
        .byte   $C3
        rts

        jsr     LD5D8
        pha
        cpy     $44
        cpy     $60
        ldx     #$4D
        bit     $A3A2
        jsr     LD5D8
        sta     $C4
        .byte   $7E
        .byte   $C4
LCD78:  .byte   $20
        cld
LCD7A:  cmp     $A3,x
        cpy     $96
        cpy     $60
        jsr     LD5D8
LCD83:  lda     $C4,x
        tay
        cpy     $60
        lda     $9A
        ldy     $9B
LCD8C:  jsr     LD5D8
        .byte   $73
        cmp     $63
        cmp     $60
LCD94:  .byte   $20
LCD95:  cld
        cmp     $0A,x
        dec     $FA
        cmp     $60
        jsr     LD5D8
        dec     $B3C6,x
        dec     $60
        jsr     LD5D8
        inc     LC3C6
        dec     $60
        jsr     LD5D8
        adc     $C7
        .byte   $3A
        .byte   $C7
        rts

        jsr     LD5D8
        sta     $6CC7,y
LCDBA:  .byte   $C7
        rts

        jsr     LD5D8
        rti

        iny
        asl     $C8,x
        rts

        .byte   $20
        cld
LCDC6:  cmp     $3D,x
        iny
        .byte   $2F
        iny
        rts

        jsr     LD5D8
        .byte   $1F
        cmp     #$52
        cmp     #$60
        jsr     LD5D8
        .byte   $F1
LCDD8:  cmp     #$23
        dex
        rts

        jsr     LD5D8
        .byte   $1C
        dex
        lsr     $20CA
        cld
        cmp     $0D,x
        dex
        .byte   $3F
        dex
        rts

        jsr     LD5D8
        eor     ($CA,x)
        .byte   $73
        dex
        rts

        jsr     LD39E
        jsr     LD5D8
        tya
        dex
        .byte   $E2
        dex
        rts

        jsr     LD5D8
        .byte   $EF
        dex
        and     $60CB,y
        jsr     LD5D8
        .byte   $9F
        .byte   $CB
        beq     LCDD8
        rts

        jsr     LD5D8
        .byte   $12
        cpy     LCCD9
        rts

        jsr     LD224
        clc
        bit     $38
        jsr     LD5D8
        adc     $09CE,x
        .byte   $CF
        rts

        jsr     LD5D8
        .byte   $8B
        dec     LCF17
        rts

        lda     #$2C
        jsr     LD5D8
        .byte   $DB
        .byte   $CF
        .byte   $67
        bne     LCE82
        lda     ($D3,x)
        jsr     LD5D8
        .byte   $FC
        .byte   $D0
LCE3D:  dey
        cmp     ($85),y
        .byte   $D3
        sty     $D4
        rts

        jsr     LD5D8
        cli
        cmp     ($E8),y
        cmp     ($60),y
        jsr     LD5D8
        .byte   $17
        .byte   $D2
        lda     #$D2
        rts

        .byte   $20
LCE55:  cld
        cmp     $ED,x
        .byte   $D3
        sta     $60D4,y
        jsr     LD5D8
LCE5F:  ora     LD2D4,y
        .byte   $D4
        rts

        jsr     LD5D8
        beq     LCE3D
        .byte   $AB
        cmp     $60,x
        jsr     LD5D8
        .byte   $C7
        dec     $82,x
        .byte   $D7
        rts

        jsr     LD21B
        jsr     LD5D8
        ora     $D7,x
        bne     LCE55
        rts

        jsr     LD216
LCE82:  jsr     LD5D8
        bpl     LCE5F
        .byte   $CB
        cld
        rts

        jsr     LD5D8
        .byte   $6B
        cld
        rol     $D9
        rts

        jsr     LD5D8
        stx     $D9,y
        .byte   $22
        .byte   $DA
        rts

        jsr     LD5D8
        .byte   $80
        .byte   $DA
        .byte   $0B
        .byte   $DB
        rts

        jsr     LD5D8
        .byte   $97
        .byte   $DA
        .byte   $22
        .byte   $DB
        rts

        jsr     LD5D8
        .byte   $B7
        .byte   $DC
        sbc     $60DC
        jsr     LD5D8
        cpx     #$DD
        cpx     $DD
        rts

        jsr     LD5D8
        .byte   $73
        dec     LDE7B,x
        rts

        jsr     LD5D8
        lda     $DE
        lda     $60DE
        jsr     LD5D8
        cmp     $D8,x
        rti

        .byte   $DF
        rts

        jsr     LD5D8
        cmp     ($E0),y
        cmp     $E0,x
        rts

        jsr     LD5D8
        adc     $71E2
        .byte   $E2
        rts

        jsr     LD5D8
        adc     $7DE3,y
        .byte   $E3
        rts

        jsr     LD5D8
        .byte   $87
        .byte   $E3
        .byte   $8B
        .byte   $E3
        rts

        jsr     LD5D8
        stx     $92E3
        .byte   $E3
        rts

        jsr     LD5D8
        sta     $53E7,x
        inx
        rts

        jsr     LD5D8
        ora     $E9
        sei
        .byte   $EB
        rts

LCF0A:  jsr     LD5D8
        .byte   $C7
        cpx     LEDE0
        rts

        jsr     LD5D8
        .byte   $79
        .byte   $F0
LCF17:  bpl     LCF0A
        rts

        jsr     LD5D8
        .byte   $94
LCF1E:  .byte   $F4
        .byte   $EF
        .byte   $F4
        rts

        jsr     LD5D8
        and     $F5,x
        bcc     LCF1E
        rts

        jsr     LD5D8
        .byte   $CB
        .byte   $F7
        ora     ($F8,x)
        rts

        jsr     LD5D8
        rol     $82F9,x
        sbc     $2060,y
        cld
        cmp     $E2,x
        brk
        .byte   $E2
        brk
        rts

        jsr     LD5D8
        inx
        brk
        inx
        brk
        rts

        ldy     #$09
        bit     a:$A0
LCF4F:  lda     LCCF7,x
        sta     LC029,y
        iny
        inx
        cpy     #$0C
        bne     LCF4F
        rts

        lda     LC00D
        ldy     LC00E
        bne     LCF76
        lda     LC00F
        ldy     LC010
        bne     LCF76
        lda     #$E6
        ldy     #$CE
        bne     LCF76
        lda     #$BE
        ldy     #$CD
LCF76:  sta     $18
        sty     $19
        ldy     #$00
LCF7C:  dex
        bmi     LCF8B
LCF7F:  inc     $18
        bne     LCF85
        inc     $19
LCF85:  lda     ($18),y
        bpl     LCF7F
        bmi     LCF7C
LCF8B:  iny
        lda     ($18),y
        php
        and     #$7F
        jsr     LD62A
        plp
        bpl     LCF8B
        rts

        jsr     LD33A
        jmp     LD3A1

        jsr     LD342
        php
        cmp     #$61
        bcc     LCFAC
        cmp     #$7B
        bcs     LCFAC
        and     #$DF
LCFAC:  plp
        rts

        ldx     #$00
        stx     $04FD
        tsx
        stx     LC023
        lda     $E9
        ldy     $EA
        sta     LC01F
        sty     LC020
        jsr     LD39E
        sbc     #$41
        ldy     #$1A
        bcc     LCFD2
        cmp     #$1A
        .byte   $B0
LCFCD:  .byte   $04
        tay
        jsr     LD33A
LCFD2:  tya
        asl     a
        asl     a
        tay
        lda     LCBBB,y
        sta     $18
        lda     LCBBC,y
        sta     $19
        lda     LCBBE,y
        sta     $F2
        ldx     LCBBD,y
LCFE8:  .byte   $C6
LCFE9:  .byte   $F2
        bmi     LD028
LCFEC:  ldy     #$FF
LCFEE:  iny
        lda     ($18),y
        beq     LD017
        .byte   $85
LCFF4:  .byte   $F3
        lda     ($E9),y
        cmp     #$61
LCFF9:  bcc     LD001
        cmp     #$7B
        bcs     LD001
        and     #$DF
LD001:  cmp     $F3
        beq     LCFEE
LD005:  iny
        lda     ($18),y
        bne     LD005
        inx
        sec
        tya
        adc     $18
        sta     $18
        bcc     LCFE8
        inc     $19
        bcs     LCFE8
LD017:  txa
        asl     a
        tax
        lda     LCC28,x
        pha
        lda     LCC27,x
        pha
        jsr     LD1E3
        jmp     LD39E

LD028:  lda     LC01F
        ldy     LC020
        sta     $E9
        sty     $EA
        jsr     LD39E
        beq     LD049
        ldy     #$FF
LD039:  iny
        lda     ($E9),y
        beq     LD04A
        cmp     #$3A
        beq     LD04A
        cmp     #$D3
        bne     LD039
        jmp     LF5BA

LD049:  rts

LD04A:  lda     #$00
        jmp     LDFF9

        sec
        bit     $18
        lda     #$80
        php
        sta     $F4
        lsr     $F5
        lda     LC009
        sta     LC028
        ldx     #$0B
        lda     #$20
        sta     $F3
LD065:  sta     LC029,x
        dex
        bpl     LD065
        plp
        bpl     LD0D0
        bcs     LD0AB
        jsr     LD39E
LD073:  bne     LD081
LD075:  lda     #$0C
        sta     $F2
        ldx     #$00
        jsr     LD5B5
        jmp     LD503

LD081:  cmp     #$2C
        beq     LD075
LD085:  cmp     #$C3
        beq     LD075
        sec
        sbc     #$41
        tay
        cmp     #$04
        bcs     LD0AB
        jsr     LD398
        beq     LD09E
        cmp     #$C3
        beq     LD09E
        cmp     #$2C
        bne     LD0A3
LD09E:  sty     LC028
        bcs     LD075
LD0A3:  lda     $E9
        bne     LD0A9
        dec     $EA
LD0A9:  dec     $E9
LD0AB:  jsr     LD224
        jsr     LD274
        sta     $F3
        tay
        dey
        bmi     LD132
LD0B7:  lda     ($91),y
        cmp     #$20
        bne     LD0BF
        dec     $F3
LD0BF:  dey
LD0C0:  bpl     LD0B7
        lda     $E9
        pha
        lda     $EA
        pha
        lda     $91
        sta     $E9
        lda     $92
        sta     $EA
LD0D0:  jsr     LD39E
        sbc     #$41
        tax
        cmp     #$04
        bcs     LD109
        ldy     #$01
        lda     ($E9),y
        cmp     #$2D
        beq     LD0E6
        cmp     #$CD
        bne     LD109
LD0E6:  .byte   $8E
        plp
LD0E8:  cpy     #$C6
        .byte   $F3
        dec     $F3
        beq     LD13D
        jsr     LD398
        jsr     LD398
        bne     LD109
        bit     $F4
        bmi     LD132
        pla
        pla
        jsr     LD7BD
        jsr     LE5B9
LD103:  jsr     LD7BD
        jmp     LD39E

LD109:  ldx     #$00
        lda     #$09
        sta     $F2
        lsr     $F6
        jsr     LD39E
LD114:  bit     $F6
        bmi     LD12A
        cmp     #$2E
        bne     LD12A
        ror     $F6
        cpx     #$0A
        bcs     LD13D
LD122:  lda     #$0C
        sta     $F2
LD126:  ldx     #$08
        bne     LD13F
LD12A:  cmp     #$2C
        bne     LD134
        bit     $F4
        bpl     LD159
LD132:  bmi     LD1AC
LD134:  jsr     LD567
        sta     LC029,x
        tya
        cpx     $F2
LD13D:  bcs     LD1AC
LD13F:  dec     $F3
        beq     LD153
        inx
        bit     $F5
        bmi     LD114
        jsr     LD398
        bne     LD114
        bit     $F4
        bpl     LD159
        bmi     LD1AC
LD153:  pla
        sta     $EA
        pla
        sta     $E9
LD159:  lda     LC032
LD15C:  cmp     #$20
        bne     LD103
        ldx     #$00
        jsr     LD34A
        beq     LD103
        bit     $F5
        bmi     LD18F
        tay
        bpl     LD1B1
        .byte   $85
LD16F:  sbc     $29,x
        .byte   $7F
        sta     $24
        lda     #$E9
        ldy     #$C0
LD178:  sta     $16
        sty     $17
        ldy     #$00
LD17E:  dec     $24
LD180:  bmi     LD18F
LD182:  inc     $16
        bne     LD188
        inc     $17
LD188:  jsr     L0453
        bpl     LD182
        bmi     LD17E
LD18F:  ldy     #$00
        inc     $16
        .byte   $D0
LD194:  .byte   $02
        inc     $17
LD197:  jsr     L0453
        pha
        .byte   $A0
LD19C:  ora     ($20,x)
        .byte   $53
        .byte   $04
        tay
        pla
        php
        and     #$7F
        plp
        bpl     LD1C1
        lsr     $F5
        bpl     LD1C3
LD1AC:  ldx     #$02
        jmp     LD67E

LD1B1:  cmp     #$2A
        bne     LD1C3
        lda     #$3F
LD1B7:  sta     LC029,x
        inx
        .byte   $E4
LD1BC:  .byte   $F2
        bne     LD1B7
        dex
        rts

LD1C1:  inc     $F3
LD1C3:  .byte   $C9
LD1C4:  .byte   $3F
        beq     LD1D7
        cmp     #$30
        bcc     LD1AC
        .byte   $C9
LD1CC:  .byte   $3A
        bcc     LD1D7
        cmp     #$41
        bcc     LD1AC
        cmp     #$5B
        bcs     LD1AC
LD1D7:  rts

        sta     $0C
        sty     $0D
LD1DC:  php
        pla
        sta     $27
        clc
        pla
        .byte   $85
LD1E3:  asl     $0469
        tay
        pla
        sta     $0F
        .byte   $69
LD1EB:  brk
        pha
        tya
        pha
        ldy     #$01
        lda     LC024
        bpl     LD1F8
        ldy     #$03
LD1F8:  lda     ($0E),y
        sta     L04F0
        iny
LD1FE:  lda     ($0E),y
        sta     $04F1
        ldy     $0D
        .byte   $A5
LD206:  .byte   $27
        pha
        lda     $0C
        plp
        jmp     L0471

LD20E:  clc
        adc     #$41
        bvc     LD22A
        pha
        lsr     a
        lsr     a
LD216:  lsr     a
        lsr     a
        .byte   $20
LD219:  .byte   $1E
        .byte   $D6
LD21B:  pla
LD21C:  and     #$0F
        cmp     #$0A
        bcc     LD224
        adc     #$06
LD224:  clc
        adc     #$30
        bit     $20A9
LD22A:  cmp     #$0D
LD22C:  bne     LD234
LD22E:  lda     #$00
        sta     $30
        lda     #$0D
LD234:  jmp     LD20E

        .byte   $85
LD238:  sta     ($84),y
        .byte   $92
        ldy     #$00
LD23D:  lda     ($91),y
        beq     LD247
        jsr     LD62A
LD244:  iny
        bne     LD23D
LD247:  rts

        ldx     #$14
        .byte   $20
        .byte   $6C
LD24C:  .byte   $D3
        lda     garbage1
        jsr     LD60E
        .byte   $20
LD254:  asl     $D2
        ldx     #$0D
        jsr     LD36C
        cli
LD25C:  jsr     LD669
        sei
        php
        jsr     LD206
LD264:  jsr     LD206
        plp
        rts

LD269:  jsr     LD302
        cmp     #$1B
        beq     LD275
LD270:  cmp     #$0D
        bne     LD269
LD274:  clc
LD275:  rts

        .byte   $20
LD277:  adc     #$D6
        bcc     LD275
        pla
        pla
        rts

        inx
LD27F:  stx     $04FD
LD282:  jmp     (LC01D)

        txa
        jsr     LD7DE
        .byte   $A5
LD28A:  tay
        ldy     $A9
        cpy     #$FF
        bne     LD292
        tya
LD292:  sta     $04FE
        sty     $04FF
        jsr     LD7F2
        jsr     LD1C4
        cli
        bit     LC018
LD2A2:  bpl     LD2C9
        ldx     LC023
        txs
        .byte   $AD
        .byte   $1B
LD2AA:  cpy     #$AC
        .byte   $1C
        cpy     #$85
        tay
        sty     $A9
        lda     LC019
        ldy     LC01A
        sta     $E9
LD2BA:  sty     $EA
        lda     LC01F
        ldy     LC020
LD2C2:  sta     LC021
        sty     LC022
        rts

LD2C9:  .byte   $20
LD2CA:  asl     a
        .byte   $D3
        ldx     $04FD
        cpx     #$04
        .byte   $D0
LD2D2:  .byte   $33
        .byte   $A2
LD2D4:  brk
        jsr     LD36C
        .byte   $AD
        .byte   $01
LD2DA:  cpy     #$20
        .byte   $13
        dec     $AD,x
        ora     $C0
        .byte   $29
LD2E2:  beq     $D32D
        beq     $D2D6
        .byte   $14
        ldx     #$01
        .byte   $20
LD2EA:  jmp     ($ADD3)

        .byte   $02
        cpy     #$20
        .byte   $13
        .byte   $D6
LD2F2:  ldx     #$03
        lda     LC005
        and     #$20
        .byte   $F0
LD2FA:  .byte   $02
LD2FB:  ldx     #$02
LD2FD:  jsr     LD36C
        .byte   $AD
        .byte   $17
LD302:  cpy     #$20
        .byte   $13
        .byte   $D6
LD306:  ldx     $04FD
        dex
LD30A:  jsr     LD206
        lda     #$3F
        jsr     LD62A
LD312:  cpx     #$1A
        bcs     LD31B
        jsr     LD372
        .byte   $30
LD31A:  .byte   $20
LD31B:  cpx     #$32
        bcc     LD334
        ldx     #$10
        .byte   $20
LD322:  jmp     ($ADD3)

        sbc     $A004,x
        brk
        sty     LC04C
        ldx     #$01
        jsr     LD758
        .byte   $4C
LD332:  .byte   $3B
        .byte   $D7
LD334:  txa
        sbc     #$19
        tax
        .byte   $20
        .byte   $5C
LD33A:  .byte   $D3
LD33B:  jmp     LD178

        sec
        bit     $18
        php
LD342:  lsr     $026A
        plp
        rol     $026A
        .byte   $A9
LD34A:  ora     ($4C,x)
        rol     a
LD34D:  .byte   $D3
        ldx     #$00
        ldy     #$00
        bit     $03A2
        bit     $02A2
        sta     $F3
        sty     $F4
        lda     #$00
        sta     LC073
        lda     #$FF
        .byte   $85
LD364:  .byte   $F2
LD365:  inc     $F2
        sec
        lda     $F3
        tay
        .byte   $FD
LD36C:  dey
        cmp     LF385
        lda     $F4
LD372:  pha
        sbc     LCD8C,x
        sta     $F4
        pla
        bcs     LD365
        sty     $F3
        sta     $F4
        lda     $F2
        beq     LD388
        sta     LC073
        bne     LD391
LD388:  ldy     LC073
        bne     LD391
        lda     LC04C
        .byte   $2C
LD391:  ora     #$30
        jsr     LD62A
        dex
        .byte   $10
LD398:  iny
        lda     $F3
        jmp     LD624

LD39E:  sec
        bit     $18
LD3A1:  ror     $F2
        ldx     #$0B
LD3A5:  lda     LC029,x
        cmp     #$3F
        beq     LD3B1
        dex
        bpl     LD3A5
        sec
LD3B0:  rts

LD3B1:  rol     $F2
        bcc     LD3B0
        ldx     #$05
        .byte   $2C
LD3B8:  ldx     #$01
        jmp     LD67E

        ldy     LC028
        sty     garbage1
        lda     LC039,y
        beq     LD3B8
        rts

        ldx     #$0E
        bit     $10A2
        bit     $12A2
        bit     $14A2
        bit     $16A2
        bit     $06A2
        bit     $04A2
        bit     a:$A2
        bit     $0AA2
        bit     $1EA2
        bit     $20A2
        bit     $22A2
        bit     $24A2
        ldy     #$00
        bit     $02A2
        bit     $08A2
        bit     $18A2
        bit     $1AA2
        bit     $1CA2
        nop
        nop
        nop
        sta     $F2
        lda     LCD94,x
        sta     $B4
        lda     LCD95,x
        sta     $B5
        tya
        ldy     $F2
        jsr     LD2CA
        jsr     LD244
        tax
        jmp     LD2C2

        inc     $16
        bne     LD422
        inc     $17
LD422:  ldy     #$00
        bit     LC048
        bvc     LD42C
        jmp     L0453

LD42C:  lda     ($16),y
        beq     LD46F
        bpl     LD471
        bit     LC048
        bpl     LD46F
        and     #$7F
        rts

        jsr     LEA1E
        lda     #$08
        .byte   $2D
        brk
LD441:  .byte   $03
        rts

        sec
        bit     $18
        ror     LC04A
        jsr     LD302
        php
        .byte   $8D
        .byte   $46
LD44F:  cpy     #$8E
LD451:  .byte   $47
        cpy     #$2C
LD454:  eor     #$C0
        bpl     LD472
        bit     LC04A
        bmi     LD464
        cpx     #$4E
        bcc     LD464
        lsr     LC049
LD464:  jsr     LD81C
        bpl     LD46C
        lsr     LC049
LD46C:  and     #$7F
        plp
LD46F:  bit     $E2
LD471:  rts

LD472:  plp
        bpl     LD471
        lda     #$00
        sta     LC04B
        sta     LC048
        lda     #$0E
        ldx     #$EF
        jsr     LD322
        lda     #$15
        jsr     LD83A
        bne     LD4C3
        lda     LC046
        ldx     LC047
        bit     LC03D
        bpl     LD46F
        lda     $0208
        ldx     #$05
LD49B:  cmp     LCD41,x
        beq     LD4AC
        dex
        bpl     LD49B
        lda     LC046
LD4A6:  ldx     LEA47
        jmp     LD86F

LD4AC:  lda     $0208
        pha
        lda     LCD47,x
        sta     $0208
        jsr     LD31A
        tax
        pla
        sta     $0208
        txa
        and     #$7F
        bpl     LD4A6
LD4C3:  lda     #$17
        jsr     LD83A
        bne     LD4D1
        lda     #$14
        jsr     LD83A
        beq     LD4D3
LD4D1:  lda     #$40
LD4D3:  ora     $0208
        and     #$7F
        tax
        lda     LC800,x
        tay
        iny
        bne     LD4E3
        jmp     LD963

LD4E3:  iny
        beq     LD552
        cmp     #$20
        ror     a
        sta     LC048
        rol     a
        bmi     LD4F3
        bcc     LD4F3
        sbc     #$20
LD4F3:  and     #$7F
        tax
        lda     #$E9
        ldy     #$C0
        bit     LC048
        bvs     LD528
        bmi     LD507
        lda     #$7F
LD503:  ldy     #$C8
        bne     LD528
LD507:  lda     $F2
        pha
        jsr     LEA30
        ldy     #$00
LD50F:  lda     LCBBD,y
        inx
        iny
        iny
        iny
        iny
        cmp     $F2
        bcc     LD50F
        stx     LC04B
        ldx     $F2
        dex
        pla
        sta     $F2
        lda     #$DD
        ldy     #$C9
LD528:  sta     $16
        sty     $17
LD52C:  dex
        bmi     LD536
LD52F:  jsr     LD81C
        bpl     LD52F
        bmi     LD52C
LD536:  jsr     LD81C
        cmp     #$20
        beq     LD536
        lda     $16
        bne     LD543
        dec     $17
LD543:  dec     $16
        lda     LC04B
LD548:  sec
        ror     LC049
LD54C:  ldx     LC047
LD54F:  jmp     LD86F

LD552:  lda     #$7F
        bit     LC04A
        bmi     LD54C
        ldx     LC047
        beq     LD54C
        dex
        lda     #$08
        bne     LD54F
        ldy     LC042
        .byte   $AD
LD567:  .byte   $43
        cpy     #$20
        dex
        .byte   $D2
        jsr     LD2D2
        ldx     #$00
        stx     $17
        dex
        stx     $16
LD576:  inx
        lda     $0101,x
        bne     LD576
        sta     $0102,x
        txa
        pha
        lda     LC042
        ldy     LC043
        sta     $33
        sty     $34
        jsr     LD19C
        pla
        tax
        lda     #$20
        bcc     LD596
        lda     #$2A
LD596:  sta     $0101,x
        clc
        lda     LC044
        adc     LC042
        sta     LC042
        lda     LC045
        adc     LC043
        sta     LC043
LD5AC:  lda     #$0D
        bne     LD548
        lda     #$00
        sta     LE7D1
LD5B5:  sta     LE7D2
        sta     LE7D3
        jsr     LE55C
        jsr     LDA63
        ldx     #$10
        cpx     LC302
        beq     LD5EC
        lda     LC302
        sec
        sbc     #$10
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        clc
        adc     LE7D1
        bcc     LD5DB
LD5D8:  inc     LE7D2
LD5DB:  sta     LE7D1
        inc     LE7D3
        lda     LC300
        ldy     LC301
        beq     LD5EC
        jmp     LD9BE

LD5EC:  jsr     LDB2D
        rts

        lda     LE7D3
        sta     LC208
        lda     LE7D1
        ldx     LE7D2
        rts

        dec     LC208
        dec     LE7D3
        rts

        lda     LE7D4
        bne     LD616
        lda     LE7D3
        .byte   $8D
        php
LD60E:  .byte   $C2
        lda     LE7D1
        .byte   $AE
LD613:  .byte   $D2
        .byte   $E7
        rts

LD616:  lda     LC204
        ldx     LC205
        rts

        nop
LD61E:  nop
        nop
        jsr     LD27F
        php
LD624:  sei
        txa
        pha
        lsr     a
LD628:  lsr     a
        lsr     a
LD62A:  and     #$07
        tax
        clc
        lda     #$FF
LD630:  rol     a
        dex
        bpl     LD630
        tax
        lda     #$0E
LD637:  jsr     LD322
        pla
        and     #$07
        ora     #$B8
        jsr     LD83A
        sta     $D0
        plp
        jsr     LD1EB
LD648:  lsr     $04FC
        rts

        jsr     LE62E
        nop
        jsr     LDA60
        ldx     LC200
        inx
        beq     LD6CD
        ldx     #$0A
        bne     LD67F
        ldx     #$C1
        bit     LC2A2
        bit     LC3A2
        stx     LC004
        .byte   $A2
LD669:  brk
        stx     LC003
        sta     LC001
        sty     LC002
        ldx     #$88
LD675:  jsr     LCFCD
        beq     LD6CD
        ldx     #$03
        bvc     LD67F
LD67E:  inx
LD67F:  jmp     LD67E

        lda     LC025
        ldy     LC026
        bne     LD694
        jmp     LDC80

        nop
        ldx     #$C2
        bit     LC1A2
        .byte   $2C
LD694:  ldx     #$C3
        stx     LC004
        ldx     #$00
        stx     LC003
        sta     LC001
        sty     LC002
LD6A4:  ldx     #$A8
        bne     LD675
        lda     #$00
        ldy     #$C1
        sta     LC003
        sty     LC004
        bne     LD6A4
        ldx     LC027
        ldy     #$08
        jsr     LDAC3
        lda     #$2E
        jsr     LD62A
        ldy     #$02
LD6C3:  lda     LC300,x
        jsr     LD62A
        inx
        dey
        bpl     LD6C3
LD6CD:  rts

        lda     #$C1
        bit     LC2A9
        bit     LC3A9
        sta     $0F
        lda     #$00
        sta     $0E
        ldy     #$00
        tya
LD6DF:  sta     ($0E),y
        iny
        bne     LD6DF
        rts

        lda     LC025
        ldy     LC026
        jsr     LDA63
        ldx     LC027
        ldy     #$F0
LD6F3:  lda     $BF39,y
        sta     LC300,x
        inx
        iny
        bne     LD6F3
        rts

        lda     LC025
        ldy     LC026
        jsr     LDA63
        ldx     LC027
        ldy     #$F0
LD70C:  lda     LC300,x
        sta     $BF39,y
        inx
        iny
        bne     LD70C
        rts

LD717:  ldy     #$F4
LD719:  lda     $BF35,y
        cmp     #$3F
        beq     LD725
        cmp     LC300,x
        bne     LD741
LD725:  inx
        iny
        bne     LD719
        ldx     LC027
        rts

        jsr     LDA4C
        jsr     LE537
        nop
LD734:  sta     LC025
        sty     LC026
        .byte   $20
LD73B:  .byte   $63
        .byte   $DA
        .byte   $A2
LD73E:  bpl     $D710
LD740:  .byte   $07
LD741:  lda     LC027
        clc
        adc     #$10
        tax
LD748:  stx     LC027
        cpx     LC302
LD74E:  bne     LD717
LD750:  lda     LC300
        ldy     LC301
LD756:  bne     LD734
LD758:  rts

        jsr     LDBA5
        bne     LD792
        jmp     LDB6F

        dec     LC208
        dec     LE7D3
        rts

        .byte   $C2
        sta     LC208
        jmp     LE537

        jsr     LDC6C
        sta     LC300
        sty     LC301
        inc     LC208
        jsr     LDA8A
        jsr     LDA82
        lda     LC300
        ldy     LC301
        sta     LC025
        sty     LC026
        jsr     LDAD4
        ldx     #$10
LD792:  txa
        stx     LC027
        clc
        adc     #$10
        sta     LC302
        .byte   $EE
        .byte   $04
LD79E:  .byte   $C2
        .byte   $D0
LD7A0:  asl     $05EE,x
        .byte   $C2
        rts

        jsr     LE537
        nop
LD7A9:  sta     LC025
        sty     LC026
        jsr     LDA63
        ldx     LC302
        bne     LD7BF
        lda     LC300
        ldy     LC301
LD7BD:  bne     LD7A9
LD7BF:  rts

LD7C0:  sta     LC058
        sty     LC059
        sta     LC05A
LD7C9:  sty     LC05B
LD7CC:  jsr     LDACE
LD7CF:  ldx     #$01
        .byte   $8E
LD7D2:  lsr     $20C0,x
LD7D5:  jmp     ($8DDC)

LD7D8:  .byte   $5C
        cpy     #$8C
LD7DB:  eor     $8DC0,x
LD7DE:  ora     ($C0,x)
        .byte   $8C
LD7E1:  .byte   $02
        cpy     #$A2
LD7E4:  php
LD7E5:  .byte   $BD
        .byte   $51
LD7E7:  cpy     #$9D
        .byte   $03
LD7EA:  cmp     ($CA,x)
        .byte   $10
LD7ED:  .byte   $F7
        stx     LC102
        .byte   $A2
LD7F2:  .byte   $0C
LD7F3:  stx     LC05F
        .byte   $AD
        cli
LD7F8:  cpy     #$0D
        .byte   $59
LD7FB:  cpy     #$F0
        cli
LD7FE:  lda     LC058
        bne     LD806
        dec     LC059
LD806:  dec     LC058
        jsr     LDC6C
        ldx     LC05F
        sta     LC100,x
        inx
        tya
        sta     LC100,x
        inx
        bne     LD7F3
        .byte   $AD
        cli
LD81C:  cpy     #$0D
        eor     LF0C0,y
        .byte   $34
        ldy     LC101
        bne     LD843
        jsr     LDC6C
        sta     LC100
        pha
        sty     LC101
        tya
        pha
        jsr     LDAA8
        pla
        sta     LC002
LD83A:  pla
        sta     LC001
        inc     LC05E
        bne     LD84F
LD843:  .byte   $20
        tay
LD845:  .byte   $DA
        lda     LC100
        ldy     LC101
        jsr     LDA5D
LD84F:  jsr     LDACE
        ldx     #$02
        bne     LD7F3
LD856:  lda     #$00
        sta     LC100
        sta     LC101
        jsr     LDAA8
        lda     LC05C
        ldy     LC05D
        jmp     LDA5D

        clc
        bit     $38
        .byte   $AD
        .byte   $02
LD86F:  .byte   $C2
        tax
        ora     LC203
        bne     LD87D
        bcc     LD8D4
        ldx     #$07
        jmp     LD67E

LD87D:  jmp     LE67F

        bit     $2F
        bpl     LD889
        php
        jsr     LE63A
        plp
LD889:  ldy     #$02
        lda     #$14
        jmp     LDA8E

        lda     #$01
        ldy     #$00
LD894:  pha
        and     LC210,x
        bne     LD89F
        pla
        asl     a
        iny
        bne     LD894
LD89F:  pla
        eor     #$FF
        and     LC210,x
        sta     LC210,x
        lda     #$00
        sta     $F3
        txa
        asl     a
        rol     $F3
        asl     a
        rol     $F3
        asl     a
        rol     $F3
        sta     $F2
        tya
        ora     $F2
        ldx     #$FF
LD8BD:  sec
        inx
        tay
        sbc     LC207
        bcs     LD8BD
        dec     $F3
        bpl     LD8BD
        txa
        cpx     LC206
        bcc     LD8D4
        sbc     LC206
        ora     #$80
LD8D4:  iny
        rts

        dey
        tax
        bpl     LD8E0
        and     #$7F
        clc
        adc     LC206
LD8E0:  tax
        lda     #$00
        sta     $F3
        cpx     #$00
        beq     LD8F4
LD8E9:  clc
        adc     LC207
        bcc     LD8F1
        inc     $F3
LD8F1:  dex
        bne     LD8E9
LD8F4:  sta     $F2
        clc
        tya
        adc     $F2
        bcc     LD8FE
        inc     $F3
LD8FE:  pha
        and     #$07
        tay
        pla
        lsr     $F3
        ror     a
        lsr     $F3
        ror     a
        lsr     $F3
        jmp     LE6C4

        lda     #$00
LD910:  rol     a
        dey
        bpl     LD910
        rts

        jsr     LDCD6
        ora     LC210,x
        cmp     LC210,x
        beq     LD92C
        sta     LC210,x
        inc     LC202
        bne     LD92C
        inc     LC203
        clc
LD92C:  rts

        jsr     LDCD6
        eor     #$FF
        and     LC210,x
        cmp     LC210,x
        beq     LD92C
        sta     LC210,x
        lda     LC202
        bne     LD945
        dec     LC203
LD945:  dec     LC202
        clc
        rts

        lda     #$40
        bit     LC0A9
        bit     $80A9
        bit     a:$A9
        jsr     LDE28
        jsr     LD44F
        jsr     LD79E
LD95E:  jsr     LD39E
        bne     LD966
LD963:  jmp     LDE0B

LD966:  jsr     LD22C
        cmp     #$54
        bne     LD989
        jsr     LD398
        jsr     LD2FA
        sty     LC056
        sta     LC057
        lsr     LC051
        sec
        rol     LC051
        bne     LD95E
LD982:  lda     #$40
        sta     LC051
        bne     LD95E
LD989:  cmp     #$41
        bne     LD99B
        jsr     LD398
        jsr     LD2FA
        sty     LC052
        sta     LC053
        bcc     LD982
LD99B:  cmp     #$45
        bne     LD9AD
        jsr     LD398
        jsr     LD2FA
        sty     LC054
        sta     LC055
        bcc     LD982
LD9AD:  cmp     #$C7
        .byte   $D0
LD9B0:  .byte   $72
        jsr     LD398
        bne     LDA23
        lsr     LC051
        sec
        rol     LC051
        .byte   $30
LD9BE:  jmp     L52AD

        cpy     #$AC
        .byte   $53
        cpy     #$8D
        lsr     $C0,x
        sty     LC057
        bcc     LDA0B
        jsr     LD44F
        lda     #$00
        ldy     #$C8
        sta     LC052
        sty     LC053
        lda     #$DD
        ldy     #$C9
        bne     LD9FE
        .byte   $20
        .byte   $4F
LD9E2:  .byte   $D4
        lda     $021F
        bne     LD9F0
        ldx     #$80
        ldy     #$BB
        lda     #$DF
        bne     LD9F6
LD9F0:  ldx     #$00
        ldy     #$A0
        lda     #$3F
LD9F6:  stx     LC052
        sty     LC053
        ldy     #$BF
LD9FE:  ldx     #$40
        jsr     LDE3B
        lda     #$C0
        sta     LC04D
        jsr     LD79E
LDA0B:  sec
        lda     LC054
        sbc     LC052
        sta     LC04F
        lda     LC055
        sbc     LC053
        sta     LC050
        bcs     LDA9C
        ldx     #$08
        .byte   $2C
LDA23:  ldx     #$09
        jmp     LD67E

        sta     LC04D
        lda     $9A
        ldy     $9B
        sta     LC052
        sty     LC053
        lda     $9C
        ldy     $9D
        ldx     #$80
        sta     LC054
        sty     LC055
        stx     LC051
        lda     #$00
        sta     LC056
        sta     LC057
LDA4C:  rts

        jsr     LD44F
        jsr     LDFDE
LDA53:  jsr     LD302
        bpl     LDA53
        cmp     #$03
        beq     LDA4C
        .byte   $C9
LDA5D:  .byte   $13
        bne     LDA7C
LDA60:  jsr     LD740
LDA63:  lda     #$D0
        ldy     #$BB
        sta     LC052
        sty     LC053
LDA6D:  lda     #$B7
        ldy     #$BF
        ldx     #$60
LDA73:  .byte   $20
        brk
LDA75:  dec     $3E20,x
        .byte   $D7
        jmp     LDE53

LDA7C:  cmp     #$17
        bne     LDA8E
        .byte   $AC
        .byte   $69
LDA82:  .byte   $02
        lda     #$7F
        nop
        nop
        nop
        sta     ($12),y
LDA8A:  lda     #$09
        bne     LDA97
LDA8E:  cmp     #$0D
        .byte   $D0
LDA91:  ora     $20
        rol     a
        dec     $A9,x
        asl     a
LDA97:  jsr     LD62A
        bne     LDA53
LDA9C:  sei
        .byte   $20
LDA9E:  and     $F0DB
        .byte   $6F
        .byte   $AD
        .byte   $4D
LDAA4:  cpy     #$F0
        asl     $C9,x
LDAA8:  .byte   $80
        beq     LDAB8
        cmp     #$C0
        beq     LDAC5
        jsr     LDB07
        .byte   $4C
        .byte   $1B
LDAB4:  .byte   $DF
LDAB5:  ldx     #$02
        .byte   $2C
LDAB8:  ldx     #$06
        jmp     LD67E

LDABD:  jsr     LE264
        bcs     LDAEF
        .byte   $4C
LDAC3:  ora     ($DF),y
LDAC5:  ldy     #$02
LDAC7:  lda     LC032,y
        pha
        dey
        bpl     LDAC7
LDACE:  ldy     #$02
LDAD0:  lda     LC032,y
        .byte   $D9
LDAD4:  .byte   $FA
        cpy     $05D0
        dey
        bpl     LDAD0
        bmi     LDAB5
        ldx     #$03
        jsr     LD34A
        jsr     LDB30
        beq     LDAF1
        jsr     LE264
        bcc     LDAF1
        pla
        pla
LDAEE:  pla
LDAEF:  cli
        rts

LDAF1:  ldy     #$00
LDAF3:  pla
        sta     LC032,y
        iny
        cpy     #$03
        bne     LDAF3
        .byte   $20
        .byte   $30
LDAFE:  .byte   $DB
        ldx     LC027
LDB02:  lda     LCCFA,y
        .byte   $9D
        .byte   $09
LDB07:  .byte   $C3
        inx
        iny
        cpy     #$03
        bne     LDB02
        jsr     LDA82
LDB11:  ldx     #$03
        lda     #$00
LDB15:  sta     LC035,x
        dex
        bpl     LDB15
        ldx     LC050
        ldy     #$00
        inx
        txa
        bne     LDB25
        iny
LDB25:  jsr     LDBC0
        lda     LC052
        .byte   $AC
        .byte   $53
LDB2D:  cpy     #$88
        .byte   $8D
LDB30:  .byte   $03
        cpy     #$8C
        .byte   $04
        cpy     #$A0
        asl     a
LDB37:  inc     LC004
        lda     LC050
        beq     LDB56
        .byte   $CE
        .byte   $50
LDB41:  cpy     #$20
        plp
        .byte   $E2
        lda     LC100,y
LDB48:  sta     LC001
        lda     LC101,y
        sta     LC002
        jsr     LDAA4
        beq     LDB37
LDB56:  jsr     LE228
LDB59:  lda     LC100,y
        pha
        lda     LC101,y
        pha
        jsr     LDACE
        lda     LC003
        ldy     LC004
        sta     $F2
        sty     $F3
        .byte   $A0
LDB6F:  .byte   $FF
LDB70:  iny
        lda     ($F2),y
        sta     LC100,y
        cpy     LC04F
        bne     LDB70
        pla
        tay
        pla
        jsr     LDA91
        clc
        lda     LC05A
        adc     LC05E
        bcc     LDB8D
        inc     LC05B
LDB8D:  adc     LC037
        sta     LC037
        lda     LC038
        and     #$0F
        adc     LC05B
        ora     #$40
        sta     LC038
        lda     LC035
        .byte   $AC
        .byte   $36
LDBA5:  cpy     #$F0
        .byte   $1D
LDBA8:  jsr     LDA5D
        lda     LC100
        ldy     LC101
        bne     LDBA8
        lda     LC05C
        ldy     LC05D
        sta     LC100
        sty     LC101
        .byte   $20
LDBC0:  ldy     $DA
        jmp     LDFD4

        lda     LC05C
        ldy     LC05D
        sta     LC035
        sty     LC036
        jsr     LDB59
        jsr     LDA8A
        jsr     LDAEE
        cli
        jmp     LDA82

        lda     $021F
        beq     LDBF3
        jmp     LD16F

        lda     #$00
        ldx     #$03
LDBEA:  sta     LC04D,x
        dex
        bpl     LDBEA
        stx     LC072
LDBF3:  rts

LDBF4:  jmp     LDE23

        lda     #$80
        jsr     LD454
        jsr     LD79E
        jsr     LDFE6
LDC02:  jsr     LD39E
        beq     LDC52
        bne     LDC0E
LDC09:  jsr     LD398
        beq     LDC52
LDC0E:  jsr     LD22C
        ldy     #$40
        cmp     #$56
        beq     LDC1D
        cmp     #$4E
        bne     LDC27
        ldy     #$80
LDC1D:  lda     LC04D
        bne     LDBF4
        sty     LC04D
        beq     LDC09
LDC27:  cmp     #$4A
        bne     LDC34
        lda     LC04E
        bne     LDBF4
        ldx     #$80
        bmi     LDC4B
LDC34:  cmp     #$41
        bne     LDBF4
        lda     LC04E
        bne     LDBF4
        jsr     LD398
        jsr     LD2FA
        sty     LC052
        sta     LC053
        ldx     #$40
LDC4B:  stx     LC04E
        bmi     LDC09
        bpl     LDC02
LDC52:  jsr     LE0E5
        bit     LC04D
        bvc     LDC85
        lda     LC051
        jsr     LD7E1
        lda     LC052
        ldy     LC053
        jsr     LD7F8
        lda     LC056
LDC6C:  ldy     LC057
        jsr     LD7FE
        clc
        lda     LC052
        .byte   $6D
        .byte   $4F
LDC78:  cpy     #$48
        lda     LC053
        adc     LC050
LDC80:  tay
        pla
        jsr     LD7FB
LDC85:  lda     LC04D
        asl     a
LDC89:  bmi     LDCDB
LDC8B:  rol     a
        eor     #$01
        .byte   $2D
        .byte   $51
LDC90:  cpy     #$4A
        lda     LC051
        bpl     LDCA4
        php
        jsr     LE0B4
        plp
        bcc     LDCA1
        jmp     LD1AC

LDCA1:  jmp     LD180

LDCA4:  bcc     LDCDB
        .byte   $AD
        .byte   $56
LDCA8:  cpy     #$AC
        .byte   $57
        cpy     #$4C
LDCAD:  .byte   $6B
        .byte   $04
        ldy     #$01
        tya
        sta     ($9A),y
        php
        sei
        jsr     LD188
        ldy     $92
        lda     $91
        clc
        adc     #$02
        bcc     LDCC3
        iny
LDCC3:  sta     $9C
        sty     $9D
        sta     $9E
        sty     $9F
        sta     $A0
        sty     $A1
        lda     $A6
        ldy     $A7
        sta     $A2
        .byte   $84
LDCD6:  .byte   $A3
        plp
        jmp     LD1CC

LDCDB:  cli
        rts

LDCDD:  ldx     #$00
        .byte   $2C
LDCE0:  ldx     #$0C
        jmp     LD67E

        jsr     LDB2D
        beq     LDCDD
        sei
        sec
        ror     LC072
        lda     LC30C,x
        ldy     LC30D,x
LDCF5:  jsr     LDA5D
        ldx     #$02
LDCFA:  lda     LC100,x
        cmp     #$FF
        beq     LDD0E
        inx
        bne     LDCFA
        lda     LC100
        ldy     LC101
        beq     LDCDB
        .byte   $D0
LDD0D:  .byte   $E7
LDD0E:  lda     LC101,x
        sta     $F9
        and     #$C0
LDD15:  bne     LDD1C
        bit     LC04D
        bvc     LDCE0
LDD1C:  bit     LC04E
        bvs     LDD3A
        bpl     LDD2E
        ldy     $9D
        lda     $9C
        sbc     #$02
        bcs     LDD34
        dey
        .byte   $90
LDD2D:  .byte   $06
LDD2E:  lda     LC102,x
        ldy     LC103,x
LDD34:  sta     LC052
        sty     LC053
LDD3A:  sec
        lda     LC104,x
        sbc     LC102,x
        sta     LC04F
        lda     LC105,x
        .byte   $FD
        .byte   $03
LDD49:  cmp     ($8D,x)
        bvc     LDD0D
        clc
        .byte   $AD
LDD4F:  .byte   $52
        cpy     #$8D
        .byte   $03
        cpy     #$6D
        .byte   $4F
        cpy     #$48
        lda     LC053
        tay
        dey
        sty     LC004
        adc     LC050
        tay
        bit     LC072
        bpl     LDD75
        lda     LC106,x
        sta     LC056
        lda     LC107,x
        sta     LC057
LDD75:  lda     LC108,x
        sta     $F7
        lda     LC109,x
        sta     $F8
        bit     LC04D
        bvc     LDDB9
        lda     LC053
        jsr     LD613
        lda     LC052
        jsr     LD613
        jsr     LD628
        tya
        jsr     LD613
        pla
        jsr     LD613
        jsr     LD628
        lda     $F9
        jsr     LD613
        jsr     LD628
        lda     LC057
        jsr     LD613
        lda     LC056
        jsr     LD613
        jsr     LD628
        jsr     LD206
        .byte   $24
LDDB9:  pla
        txa
        clc
        adc     #$06
        tay
        jsr     LE228
        lda     $F7
        bne     LDDC8
        dec     $F8
LDDC8:  dec     $F7
        inc     LC004
        lda     $F7
        ora     $F8
        beq     LDDDC
        jsr     LE228
        jsr     LE250
        jmp     LE1C2

LDDDC:  lda     LC003
        ldx     LC004
        sta     $F5
        stx     $F6
        jsr     LE228
        tya
        pha
        lda     #$00
        ldx     #$C2
        sta     LC003
        stx     LC004
        bit     LC04D
        bvs     LDE0A
        jsr     LE250
        ldy     #$FF
LDDFF:  iny
LDE00:  lda     LC200,y
        sta     ($F5),y
        cpy     LC04F
        bne     LDDFF
LDE0A:  pla
LDE0B:  tay
        jsr     LE228
        bcs     LDE4E
        tya
        tax
        lda     LC072
        bpl     LDE25
        lsr     LC072
        lda     #$00
        sta     LC04E
LDE20:  lda     $F9
        .byte   $8D
LDE23:  eor     ($C0),y
LDE25:  jmp     LE0FA

LDE28:  iny
        iny
        bne     LDE49
        lda     LC003
        pha
        lda     LC004
        pha
        lda     LC100
        ldy     LC101
        .byte   $F0
LDE3B:  .byte   $0F
        jsr     LDA5D
        pla
        sta     LC004
        pla
        sta     LC003
        ldy     #$02
LDE49:  clc
LDE4A:  rts

        sec
        pla
        pla
LDE4E:  cli
        rts

        lda     LC100,y
LDE53:  sta     LC001
        lda     LC101,y
        sta     LC002
        bit     LC04D
        bvs     LDE4A
        jmp     LDA73

        clc
        bit     $38
        ldx     LC027
        ldy     LC30F,x
        bmi     LDED0
        tya
        rol     a
        rol     a
        bpl     LDE77
        jmp     LE5F3

LDE77:  jsr     LE5DC
        .byte   $BD
LDE7B:  .byte   $0C
        .byte   $C3
        pha
        lda     LC30D,x
        pha
        sec
        lda     LC302
        sbc     #$10
        sta     LC302
        tay
        lda     #$10
        sta     $F2
LDE90:  lda     LC300,y
        stx     $F3
        cpy     $F3
        beq     LDE9C
        sta     LC300,x
LDE9C:  lda     #$00
        sta     LC300,y
        inx
        iny
        dec     $F2
        bne     LDE90
        pla
        tay
        pla
LDEAA:  jsr     LDA5D
        lda     LC001
        ldy     LC002
        jsr     LDD15
        ldx     #$02
LDEB8:  lda     LC100,x
        cmp     #$FF
        beq     LDEDC
        inx
        bne     LDEB8
        lda     LC100
        ldy     LC101
        bne     LDEAA
LDECA:  jsr     LDA8A
        jmp     LDA82

LDED0:  bcs     LDED5
        jsr     LDAB4
LDED5:  ldx     #$09
        jsr     LD36C
        sec
        rts

LDEDC:  lda     LC108,x
        sta     $F5
        lda     LC109,x
        sta     $F6
        txa
        clc
        adc     #$0A
        tax
        txa
        pha
        lda     LC100,x
        ldy     LC101,x
        jsr     LDD15
        pla
        tax
        inx
        inx
        bne     LDF12
        lda     LC100
        ldy     LC101
        beq     LDECA
        jsr     LDA5D
        lda     LC001
        ldy     LC002
        jsr     LDD15
        ldx     #$02
LDF12:  ldy     $F5
        bne     LDF18
        dec     $F6
LDF18:  dec     $F5
        .byte   $A5
LDF1B:  sbc     $05,x
        inc     $D0,x
        .byte   $CB
        beq     LDEB8
        jsr     LDAB4
        lda     #$20
        sta     LC04C
        ldx     LC027
        lda     LC30F,x
        php
        and     #$0F
        tay
        lda     LC30E,x
        jsr     LD756
        lda     #$20
        plp
        bpl     LDF41
        lda     #$50
LDF41:  jmp     LD62A

        jsr     LD451
        php
        sei
        lda     #$14
        ldy     #$01
        jsr     LDA5D
        jsr     LDA4C
        ldx     #$05
        jsr     LD36C
        lda     LC028
        jsr     LD60E
        ldx     #$06
        ldy     LC20A
        beq     LDF77
        ldx     #$11
        dey
        beq     LDF77
        ldx     #$12
        jsr     LD36C
        lda     LC20A
        jsr     LD62A
        ldx     #$13
LDF77:  jsr     LD36C
        ldy     #$EB
LDF7C:  lda     LC01E,y
        jsr     LD62A
        iny
        bne     LDF7C
        jsr     LE41F
        jsr     LD206
        jsr     LDB30
        bne     LDF9B
        beq     LDFC5
LDF92:  sei
        jsr     LE41F
        jsr     LDB41
        beq     LDFC2
LDF9B:  jsr     LE583
        jsr     LDB41
        beq     LDFBF
        jsr     LD628
        jsr     LD628
        jsr     LE583
        cli
        jsr     LD302
        bpl     LDF92
LDFB2:  jsr     LD302
        bpl     LDFB2
        cmp     #$20
        beq     LDF92
        cmp     #$1B
        bne     LDFB2
LDFBF:  jsr     LD206
LDFC2:  jsr     LD206
LDFC5:  lda     #$20
        sta     LC04C
        lda     LC202
        ldy     LC203
        jsr     LD756
        .byte   $A2
LDFD4:  .byte   $07
        jsr     LD36C
        lda     #$00
        sta     LC04C
        .byte   $A9
LDFDE:  .byte   $44
        bit     LC209
        bmi     LDFE6
        lda     #$53
LDFE6:  jsr     LD62A
        lda     #$2F
        jsr     LD62A
        lda     LC206
        ldx     #$01
        jsr     LD750
LDFF6:  lda     #$2F
        .byte   $20
LDFF9:  rol     a
        dec     $AD,x
        .byte   $07
        .byte   $C2
        jsr     LD74E
        lda     #$29
        jsr     LD62A
        nop
        nop
        nop
        lda     #$20
        sta     LC04C
        lda     LC204
        ldy     LC205
        ldx     #$02
        jsr     LD758
        plp
        ldx     #$08
        jsr     LD36C
        bit     $02F1
        bmi     LE030
        lda     $026A
        and     #$20
        bne     LE030
        lda     LC024
        bpl     LE033
LE030:  jmp     LD206

LE033:  rts

LE034:  jmp     LDE23

        jsr     LE60D
        bne     LE034
        ldx     #$09
        jsr     LD34D
        sec
        bcs     LE04C
        sec
        bit     $18
        php
        jsr     LD451
        plp
LE04C:  ror     LC072
        jsr     LD9B0
        bne     LE057
        jmp     LE0DD

LE057:  jsr     LD7A0
        bcc     LE073
        jsr     LE264
        bcc     LE0A7
LE061:  rts

LE062:  jsr     LD62A
LE065:  jsr     LD206
        jsr     LDB41
LE06B:  ldx     LC027
        jsr     LDB48
        beq     LE0A7
LE073:  jsr     LDAB4
        bit     LC072
        bmi     LE09B
        ldx     #$0A
        jsr     LD36C
LE080:  jsr     LD302
        jsr     LD3A1
        cmp     #$4E
        beq     LE062
        cmp     #$1B
        beq     LE061
        cmp     #$59
        bne     LE080
        jsr     LD62A
        jsr     LD206
        jsr     LDAB4
LE09B:  jsr     LE266
        bcs     LE065
        ldx     #$0B
        jsr     LD36C
        bmi     LE06B
LE0A7:  lda     #$00
        sta     $F5
        lda     LE7D1
        ldx     LE7D2
        clc
        .byte   $24
LE0B3:  sec
LE0B4:  sbc     #$0F
        inc     $F5
        bcs     LE0B3
        dex
        bpl     LE0B3
        ldx     LE7D3
        cpx     $F5
        beq     LE061
        dex
        stx     $F5
        jsr     LE537
        nop
        dec     $F5
        bne     LE0D5
        sta     LC05C
        sty     LC05D
LE0D5:  jsr     LDA5D
        lda     LC100
        .byte   $AC
        .byte   $01
LE0DD:  cmp     ($D0,x)
        .byte   $EB
LE0E0:  ldy     #$10
        sty     $F5
LE0E4:  .byte   $20
LE0E5:  lda     $DB
        ldy     $F5
        .byte   $CC
LE0EA:  .byte   $02
        cmp     ($F0,x)
        .byte   $14
        lda     LC100,y
        sta     LC300,x
        iny
        inx
        stx     LC302
        .byte   $D0
LE0FA:  inc     LF584
        jsr     LDA82
        beq     LE0E4
        jsr     LDA82
        dec     LE7D3
        lda     LC05C
        ldy     LC05D
        jsr     LDA63
        lda     LC300
        pha
        lda     LC301
        pha
        lda     #$00
        sta     LC300
        sta     LC301
        jsr     LDAA4
        pla
        tay
        pla
        ldx     LE7D3
        cpx     #$01
        bcc     LE131
        jsr     LDD15
LE131:  jsr     LDA8A
        jmp     LE4A7

        lda     LC027
        pha
        ldx     garbage1
        lda     LF638,x
        ldy     LF63C,x
        jsr     LE576
        adc     #$08
        tay
        ldx     #$08
LE14C:  lda     LC303,x
        cmp     LE6E5,y
        bne     LE166
        dey
        dex
        bpl     LE14C
        pla
        sta     LC027
        ldx     garbage1
        lda     LF638,x
        ldy     LF63C,x
        rts

LE166:  pla
        ldx     garbage1
        ldy     #$04
        tya
        sta     LF63C,x
        lda     #$14
        sta     LF638,x
        rts

        jsr     LDA63
        lda     garbage1
        asl     a
        asl     a
        asl     a
        adc     garbage1
        rts

        ldx     LC027
        lda     LC30F,x
        rol     a
        rol     a
        bmi     LE191
        jsr     LE322
        rts

LE191:  ldy     #$08
        jsr     LDAC3
        lda     #$D2
        ldy     #$E5
        jsr     LD637
        rts

        stx     $F9
        lda     LC30F,x
        rol     a
        rol     a
        bmi     LE1AC
        bit     $07
        jmp     LC4D7

LE1AC:  jsr     LDAB4
        lda     #$C5
        ldy     #$E5
        jsr     LD637
        jmp     LC57A

        stx     LC009
        ldy     #$2E
        jsr     LE78A
        .byte   $20
LE1C2:  .byte   $44
        dec     $60
        jsr     L4F4E
        .byte   $54
        jsr     L4C41
        jmp     L574F

        eor     $44
        brk
        jsr     L2020
        jsr     L5B20
        rol     a
        eor     a:$20,x
        lda     LE7D1
        bne     LE1E4
        dec     LE7D2
LE1E4:  dec     LE7D1
        lda     LC204
        bne     LE1EF
        dec     LC205
LE1EF:  dec     LC204
        rts

        lda     #$C5
        ldy     #$E5
        jsr     LD637
        sec
        rts

        jsr     LD451
        jsr     LDB2D
        php
        lda     #$00
        plp
        beq     LE20A
        lda     #$01
LE20A:  jmp     LD7D5

        ldy     LC009
        jsr     LD39E
        beq     LE222
        sbc     #$41
        cmp     #$04
        bcs     LE222
        tay
        jsr     LD7C0
        jmp     LD398

LE222:  jsr     LD7C0
        jmp     LD39E

LE228:  jmp     LE0DD

        jmp     LE2D2

        lda     #$14
        ldy     #$02
        sty     $2F
        rts

        ldy     #$03
        jmp     LDC8B

        clc
        bit     $38
        pha
        tya
        pha
        lda     LC001
        pha
        lda     LC002
        pha
        ldx     #$06
        lda     LC202,x
        pha
        dex
        .byte   $10
LE250:  sbc     $08B0,y
        jsr     LE635
        jsr     LDA4C
        beq     LE267
        stx     $2F
        jsr     LDC89
        lda     #$14
        ldy     #$03
LE264:  .byte   $20
        .byte   $50
LE266:  .byte   $DA
LE267:  ldx     #$00
LE269:  pla
        sta     LC202,x
        inx
        cpx     #$07
        bcc     LE269
        pla
        sta     LC002
        pla
        sta     LC001
        pla
        tay
        pla
        sec
        rts

LE27F:  ldx     #$00
LE281:  lda     LC210,x
        bne     LE297
        inx
        cpx     #$F0
        bne     LE281
        bit     $2F
        bpl     LE292
        jmp     LDC78

LE292:  jsr     LE63C
        bcs     LE27F
LE297:  lda     LC202
        bne     LE29F
        dec     LC203
LE29F:  dec     LC202
        bit     $2F
        bmi     LE2A9
        jmp     LDC90

LE2A9:  lda     #$60
        sta     LDCA8
        jsr     LDC90
        lda     #$A9
        sta     LDCA8
        txa
        ldx     #$00
        clc
        adc     #$F0
        bcc     LE2BF
        inx
LE2BF:  stx     $F3
        jmp     LDCAD

        ror     a
        ldx     $F3
        bne     LE2CD
        cmp     #$F0
        bcc     LE2DC
LE2CD:  bit     $2F
        bmi     LE2D4
        .byte   $20
LE2D2:  .byte   $3C
        .byte   $E6
LE2D4:  sec
        sbc     #$F0
LE2D7:  tax
        sec
        jmp     LDD0E

LE2DC:  bit     $2F
        bpl     LE2D7
        jsr     LE63A
        bcs     LE2D7
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        jsr     LE94D
        bcc     LE319
        lda     V1T1L+1
        sta     V1T1+1
        lda     #$40
        .byte   $2C
LE319:  lda     #$00
        sta     V1ACR
        rts

        jsr     LD27F
LE322:  php
        sei
        stx     V1DRA
        lda     V1DRB
        and     #$EF
        sta     V1DRB
        ora     #$10
        sta     V1DRB
        plp
        lda     #$02
LE337:  bit     V1IFR
        beq     LE337
        rts

        jmp     LDE23

        ldy     #$03
        bit     $06A0
        bit     $09A0
        bit     $0CA0
        bit     $0FA0
        bit     $12A0
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        ldx     #$65
        jmp     LF15E

        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        ldy     #$03
        bit     $06A0
        bit     $09A0
        bit     $0CA0
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        ldx     #$6A
        jmp     LF15E

        nop
        nop
        nop
        nop
        nop
        nop
        nop
        beq     LE39E
        jsr     LD216
        jmp     LD2E2

LE39E:  lda     V1T1
        ldy     V1T1+1
        sta     $D0
        sty     $D1
        lda     V1T2
        ldy     V1T2+1
        sta     $D2
        sty     $D3
        jmp     LE79B

LE3B5:  jmp     LDE23

        bne     LE3B5
        sei
        lda     #$00
        jmp     L04AD

        jsr     LE94D
        bcc     LE3D6
        ldy     LC024
        bne     LE3CD
        ror     $02F1
LE3CD:  jmp     LD1BC

        brk
        brk
        brk
        brk
        brk
        brk
LE3D6:  jmp     LD1C4

        php
        ldx     $9A
        ldy     $9B
        plp
        beq     LE3EB
        jsr     LD2FA
        jsr     LD19C
        ldx     $CE
        ldy     $CF
LE3EB:  txa
        bne     LE3EF
        dey
LE3EF:  dex
        stx     $B0
        sty     $B1
        rts

        bne     LE3B5
        lda     $043E
        ldy     $043F
        sta     $F0
        sty     $F1
        php
        sei
        bit     LC024
        bpl     LE428
        lda     #$22
        ldy     #$EE
        sta     $0245
        sty     $0246
        lda     #$78
        ldy     #$EB
        sta     $023C
        sty     $023D
        lda     #$B2
        .byte   $A0
LE41F:  sed
        sta     $0248
        sty     $0249
        plp
        rts

LE428:  lda     #$03
        ldy     #$EC
        sta     $0229
        sty     $022A
        lda     #$30
        ldy     #$F4
        sta     $022C
        sty     $022D
        plp
        rts

        lda     LC013
        ldy     LC014
        sta     $E9
        sty     $EA
        lda     LC011
        ldy     LC012
        sta     $A8
        sty     $A9
        rts

        .byte   $20
        .byte   $5C
LE455:  .byte   $D2
        jsr     LD224
LE459:  jsr     LD274
        cmp     #$44
        bcs     LE49A
        tax
        tay
        dey
LE463:  lda     ($91),y
        sta     $35,y
        dey
        bpl     LE463
LE46B:  iny
        lda     LCD10,y
        sta     $35,x
        inx
        cpy     #$0A
        bne     LE46B
        lda     $E9
        ldy     $EA
        sta     LC013
        sty     LC014
        lda     $A8
        ldy     $A9
        sta     LC011
        sty     LC012
        lda     #$34
        ldy     #$00
        ldx     #$3A
        sta     $E9
        sty     $EA
        stx     $34
        dey
        sty     $A9
        rts

LE49A:  jmp     LE977

        jsr     LD25C
        jsr     LD238
        jsr     LD274
        .byte   $C9
LE4A7:  bvc     LE459
        beq     LE455
        tay
LE4AC:  lda     ($91),y
        sta     $35,y
        dey
        bpl     LE4AC
        iny
        sty     $35,x
        lda     $E9
        pha
        lda     #$35
        sta     $E9
        jsr     LD194
        pla
        sta     $E9
        tya
        sec
        sbc     #$05
        jsr     LD264
        ldy     $D0
        nop
LE4CE:  lda     $35,y
        sta     ($D1),y
        dey
        bpl     LE4CE
        ldy     #$02
LE4D8:  lda     $D0,y
        sta     ($B6),y
        dey
        bpl     LE4D8
LE4E0:  rts

        jsr     LD238
        jsr     LD274
        tax
        beq     LE4E0
        sta     $F3
        ldx     #$00
        ldy     #$00
        lda     #$E9
        sta     $16
        lda     #$C0
        sta     $17
        sty     $F2
        lda     ($91),y
        bpl     LE529
        and     #$7F
        beq     LE515
        sta     $26
        ldy     #$00
LE506:  inc     $16
        bne     LE50C
        inc     $17
LE50C:  jsr     L0453
        bpl     LE506
        dec     $26
        bne     LE506
LE515:  ldy     #$01
LE517:  inx
        beq     LE538
        jsr     L0453
        php
        and     #$7F
        sta     LC0FF,x
        iny
        plp
        bpl     LE517
        bmi     LE52F
LE529:  inx
        beq     LE538
        sta     LC0FF,x
LE52F:  dec     $F3
        beq     LE53B
        ldy     $F2
        iny
        .byte   $D0
LE537:  clv
LE538:  jmp     LE977

LE53B:  txa
        jsr     LD264
        ldy     $D0
LE541:  dey
        lda     LC100,y
        sta     ($D1),y
        tya
        bne     LE541
        jmp     LE8D6

        ldy     #$02
LE54F:  lda     ($E9),y
        and     #$DF
        cmp     LCD2E,y
        bne     LE55D
        dey
        bpl     LE54F
        .byte   $30
LE55C:  .byte   $0F
LE55D:  ldy     #$02
LE55F:  lda     ($E9),y
        and     #$DF
        cmp     LCD2B,y
        bne     LE574
        dey
        bpl     LE55F
        clc
        php
        ldy     #$03
        jsr     LD1E3
        plp
        rts

LE574:  .byte   $4C
        .byte   $23
LE576:  dec     $12A2,x
        jmp     LD67E

LE57C:  jmp     LDE20

        jsr     LE94D
        .byte   $A9
LE583:  brk
        sta     LC01C
        sta     LC01B
        ror     a
        sta     LC018
        ldy     #$37
        ldx     #$FF
        sty     LC019
        stx     LC01A
        rts

        jsr     LD2FA
        sta     LC01C
        sty     LC01B
        jsr     LD19C
        ldx     $CF
        ldy     $CE
        bne     LE5AC
        dex
LE5AC:  dey
        jmp     LE992

        jsr     LD27F
        cpx     #$32
        bcc     LE57C
        dex
        .byte   $4C
LE5B9:  ror     LF0D6,x
        asl     $A9
        bcc     LE5E0
        rol     LC8D2
        php
        lda     LC021
        ldy     LC022
        sta     $E9
        sty     $EA
        lda     $04FE
        ldy     $04FF
        sta     $A8
        sty     $A9
        plp
        beq     LE5DE
        .byte   $4C
LE5DC:  .byte   $DC
        .byte   $D1
LE5DE:  dec     $EA
LE5E0:  ldy     #$FF
        lda     ($E9),y
        cmp     #$3A
        beq     LE5EA
        ldy     #$FB
LE5EA:  jmp     LD1E3

        ldy     #$03
        bit     $51A0
        .byte   $2C
LE5F3:  ldy     #$54
        bit     $57A0
        bit     $5AA0
        bit     $5DA0
        bit     $79A0
        ldx     #$60
        jmp     LF15E

        ldy     #$02
        lda     LC00A
        .byte   $8D
        brk
LE60D:  cpy     #$A9
        brk
        jsr     LDA60
        ldx     LC216
        bne     LE61D
        ldx     LC2DA
        cpx     #$34
LE61D:  rts

        pha
        lda     #$20
        and     V1DRB
        sta     LEA2B
        pla
        and     #$DF
        ora     #$00
        .byte   $8D
        brk
LE62E:  .byte   $03
        rts

        inx
        stx     $F2
        ldx     #$3F
LE635:  rts

        stx     $30
        .byte   $4C
        .byte   $3E
LE63A:  .byte   $D7
        .byte   $20
LE63C:  sec
        .byte   $D2
        sta     $B8
        sty     $B9
        lda     $28
        pha
        lda     $29
        pha
        jsr     LD22C
        jsr     LD238
        sta     $91
        sty     $92
        pla
        cmp     $29
        bne     LE677
        pla
        cmp     $28
        bne     LE677
        ldy     #$01
        bit     $28
        bmi     LE668
        bit     $29
        bmi     LE669
        iny
        iny
LE668:  iny
LE669:  lda     ($91),y
        tax
        lda     ($B8),y
        sta     ($91),y
        txa
        sta     ($B8),y
        dey
        bpl     LE669
        rts

LE677:  ldx     #$0B
        jmp     LD67E

LE67C:  jmp     LDE20

LE67F:  jsr     LD27F
        txa
        cmp     #$04
        bcs     LE67C
        asl     a
        adc     $D4
        sta     $F6
        tax
        lda     LC068,x
        sta     $F7
        lda     #$00
        ldx     #$03
LE696:  sta     $F2,x
        dex
        bpl     LE696
LE69B:  jsr     LD39E
        cmp     #$2C
        bne     LE6E8
        jsr     LD398
        ldy     #$04
LE6A7:  cmp     LCD83,y
        beq     LE6B1
        dey
        bpl     LE6A7
        bmi     LE6E8
LE6B1:  jsr     LD398
        cpy     #$04
        bne     LE6DA
        jsr     LD2FA
        ldx     $F6
        sta     LC067,x
        tya
        sta     LC066,x
LE6C4:  jsr     LD39E
        beq     LE6D3
        jsr     LD22C
        lda     #$4F
        jsr     LD22E
        ldx     #$80
LE6D3:  txa
        ldx     $F6
        sta     LC068,x
        rts

LE6DA:  tya
        pha
        jsr     LD27F
        pla
        tay
        stx     $F2,y
        .byte   $20
        .byte   $9E
LE6E5:  .byte   $D3
        bne     LE69B
LE6E8:  ldy     $F4
        lda     $F5
        pha
        ldx     $F6
        lda     LC066,x
        sta     L04F0
        lda     LC067,x
        sta     $04F1
        lda     $F2
        ldx     $F3
        bit     L0000
        brk
        .byte   $07
        plp
        jsr     LEB22
        jmp     LEB0E

        plp
        jsr     L0471
        pha
        php
        txa
        pha
        tya
        jsr     LD7CF
        pla
        jsr     LD7CC
        pla
        jsr     LD7D2
        pla
        jmp     LD7C9

        jmp     (L04F0)

        inc     LC20B
        bne     LE72D
        inc     LC20C
LE72D:  ldy     #$F4
LE72F:  lda     $BF35,y
        cmp     #$3F
        beq     LE73B
        .byte   $DD
        brk
LE738:  .byte   $C3
        bne     LE743
LE73B:  inx
        iny
        bne     LE72F
        ldx     LC027
        rts

LE743:  jmp     LDB41

        iny
        inx
        cpx     #$08
        beq     LE74E
        bne     LE738
LE74E:  lda     #$3E
        sta     LD9E2,x
        inx
        lda     #$00
        sta     LD9E2,x
        lda     #$E0
        ldy     #$D9
        jsr     LD637
        rts

        ora     $3F0A
        lsr     $544F
        jsr     L4D45
        bvc     LE7C0
        eor     $4420,y
        eor     #$52
        .byte   $45
LE772:  .byte   $43
        .byte   $54
        .byte   $4F
        .byte   $52
        cmp     LEAEA,y
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
LE78A:  nop
        nop
        nop
        nop
        nop
        nop
        nop
        jsr     LE94D
        jsr     LDFDE
        lda     LC03D
        .byte   $29
LE79B:  .byte   $80
        bcc     LE7A0
        ora     #$40
LE7A0:  sta     LC03D
        bit     LC03D
        bvs     LE7AD
        ldx     #$05
        jmp     LD332

LE7AD:  lda     #$06
        sta     $F2
        ldx     #$00
LE7B3:  lda     #$08
        sta     $F3
        sta     $F5
        lda     LCD4D,x
        inx
        asl     a
        asl     a
        .byte   $26
LE7C0:  sbc     $0A,x
        rol     $F5
        .byte   $85
LE7C5:  .byte   $F4
        lda     $F5
        adc     #$94
        sta     $F5
        ldy     #$00
LE7CE:  lda     LCD4D,x
LE7D1:  .byte   $91
LE7D2:  .byte   $F4
LE7D3:  inx
LE7D4:  iny
        .byte   $C6
LE7D6:  .byte   $F3
        bne     LE7CE
        dec     $F2
        bne     LE7B3
        rts

        lda     #$C0
        bit     a:$A9
        sta     LC03D
        jsr     LDFDE
        jmp     LEBA3

        lda     $0269
        ldy     $0268
        .byte   $4C
        .byte   $FB
LE7F4:  .byte   $EB
        lda     $0219
        ldy     $021A
        pha
        tya
        jsr     LD7E7
        pla
        jmp     LD7E4

        php
        pha
        lda     $02F9
        ldy     $02FA
        sta     L04F0
        sty     $04F1
        pla
        plp
        jmp     L04EC

        lda     #$10
        ldy     #$07
        sta     $026B
        sty     $026C
        lda     #$0F
        sta     $026A
        lda     #$0C
        jsr     LD62A
        jmp     LEBA3

        jsr     LD224
        jsr     LD274
        sta     $F2
        tay
LE837:  dey
        lda     ($91),y
        sta     LC100,y
        tya
        bne     LE837
        jsr     LD22C
        jsr     LD224
        jsr     LD274
        sta     $F3
        stx     $B8
        sty     $B9
        jsr     LD22C
        jsr     LD27F
        bne     LE88E
        dex
        stx     $F6
        cpx     $F2
        bcs     LE891
        lda     $F2
        beq     LE87E
LE862:  ldx     $F3
        beq     LE87E
        lda     $F6
        sta     $F7
        lda     #$C1
        sta     $F8
        ldy     #$00
LE870:  lda     ($F7),y
        cmp     ($B8),y
        bne     LE884
        iny
        dex
        bne     LE870
        ldy     $F6
        iny
        .byte   $2C
LE87E:  ldy     #$00
        tya
        jmp     LD7DB

LE884:  inc     $F6
        lda     $F6
        cmp     $F2
        beq     LE87E
        bne     LE862
LE88E:  jmp     LDE23

LE891:  jmp     LDE20

        tax
        lda     $026A
        pha
        cpx     #$C6
        .byte   $D0
LE89C:  asl     $9820,x
        .byte   $D3
        jsr     LD740
        jsr     LD292
        ldy     $20
        sta     $12
        sty     $13
        stx     $0268
        ldx     $02F8
        stx     $0269
        jsr     LEA36
        jsr     LD22C
        jsr     LD224
        bit     $28
        bpl     LE8D7
        jsr     LD277
        beq     LE8CC
        ldy     #$00
        lda     ($91),y
        .byte   $2C
LE8CC:  lda     #$2E
        sta     LC075
        jsr     LD22C
        .byte   $20
        .byte   $24
LE8D6:  .byte   $D2
LE8D7:  jsr     LD219
        jsr     LD282
        txa
        beq     LE92B
        stx     $F2
        lda     #$3B
        jsr     LD22E
        sty     $F3
        jsr     LED2E
        jsr     LD21B
        jsr     LD39E
        beq     LE919
LE8F4:  jsr     LD22C
        jsr     LD3A1
        ldx     #$04
        stx     $F4
LE8FE:  asl     $F4
        cmp     LCDBA,x
        beq     LE90A
        dex
        bpl     LE8FE
        bmi     LE928
LE90A:  lda     $F4
        eor     $F3
        cmp     $F3
        bcc     LE928
        sta     $F3
        jsr     LD398
        bne     LE8F4
LE919:  jsr     LED36
        jsr     LEE8E
        pla
        sta     $026A
        lda     $F4
        jmp     LD7D8

LE928:  jmp     LDE23

LE92B:  jmp     LDE20

        jsr     LD238
        sta     $B8
        sty     $B9
        rts

        lda     $F3
        and     #$08
        bne     LE952
LE93C:  jsr     LD740
        ldx     $F2
        lda     LC075
LE944:  jsr     LD62A
        dex
        bne     LE944
LE94A:  jsr     LD740
LE94D:  ldx     $F2
        jsr     LEE69
LE952:  jsr     LD73E
        ldx     #$00
        ldy     #$26
        lda     $026A
        and     #$20
        beq     LE962
        ldy     #$28
LE962:  sty     $F5
LE964:  jsr     LD843
        bpl     LE964
        cmp     #$14
        beq     LE990
        cmp     #$7F
        bne     LE97F
        txa
        beq     LE964
        jsr     LEE73
LE977:  lda     LC075
        .byte   $20
        rol     a
LE97C:  dec     $A9,x
        php
LE97F:  cmp     #$0E
        bne     LE988
        jsr     LEE69
        beq     LE93C
LE988:  cmp     #$04
        beq     LE990
        cmp     #$1A
        bne     LE995
LE990:  .byte   $20
        rol     a
LE992:  .byte   $D6
LE993:  bne     LE964
LE995:  cmp     #$20
        bcc     LE9AD
        jsr     LD62A
        inx
        cpx     $F2
        bne     LE964
        bit     $F3
        bvc     LE94A
        dex
        jsr     LEE73
        ldy     #$06
        bne     LEA04
LE9AD:  ldy     #$00
        cmp     #$0D
        beq     LE9FC
        iny
        cmp     #$1B
        beq     LE9FC
        iny
        cmp     #$08
        bne     LE9C6
        txa
        beq     LE9FC
        dex
        jsr     LEE73
        bne     LE964
LE9C6:  iny
        cmp     #$09
        bne     LE9D9
        inx
        cpx     $F2
        beq     LE9D5
        jsr     LEE76
        bne     LE993
LE9D5:  dex
        jmp     LEDFC

LE9D9:  iny
        cmp     #$0A
        bne     LE9ED
        clc
        txa
        adc     $F5
        bcs     LE9FC
        cmp     $F2
        bcs     LE9FC
        tax
        lda     #$0A
        .byte   $D0
LE9EC:  .byte   $A3
LE9ED:  iny
        cmp     #$0B
        bne     LE993
        txa
        sbc     $F5
LE9F5:  bcc     LE9FC
        tax
LE9F8:  lda     #$0B
        bne     LE990
LE9FC:  cpy     #$02
LE9FE:  bcc     LEA04
        lda     $F3
        bmi     LE993
LEA04:  sty     $F4
LEA06:  jsr     LD740
LEA09:  inx
        cpx     $F2
        bcs     LEA13
        jsr     LEE76
        bne     LEA09
LEA13:  lda     $F2
        jsr     LD264
        ldy     $F2
LEA1A:  sty     $F5
        .byte   $AC
        .byte   $69
LEA1E:  .byte   $02
        lda     ($12),y
        cmp     #$20
        bcs     LEA27
        ora     #$80
LEA27:  ldy     $F5
        dey
        php
LEA2B:  sta     ($D1),y
        jsr     LEE73
LEA30:  plp
        bne     LEA1A
        ldx     $F2
LEA35:  .byte   $20
LEA36:  ror     $EE,x
        dex
        bne     LEA35
        asl     $F3
        asl     $F3
        ldy     $F2
LEA41:  dey
        lda     ($D1),y
        cmp     LC075
LEA47:  bne     LEA61
        lda     #$20
        bit     $F3
        bpl     LEA51
        sta     ($D1),y
LEA51:  bvc     LEA59
        jsr     LD62A
        jsr     LEE73
LEA59:  jsr     LEE73
        tya
        bne     LEA41
        .byte   $24
LEA60:  iny
LEA61:  jsr     LEE76
        cpy     $F2
        bne     LEA60
        rts

LEA69:  txa
        beq     LEA72
        jsr     LEE73
        dex
        bne     LEA69
LEA72:  rts

        lda     #$08
        bit     $09A9
        .byte   $24
LEA79:  pla
        pha
        jsr     LD62A
        lda     $026A
        and     #$20
        bne     LEA8C
        lda     $0269
        and     #$FE
        beq     LEA79
LEA8C:  pla
        rts

        ldy     #$02
LEA90:  lda     $D0,y
        sta     ($B8),y
        dey
        bpl     LEA90
        rts

        jsr     LD216
        jsr     LD2D2
        jsr     LD22C
        jsr     LD224
        jsr     LD274
        sta     $22
        jsr     LDACE
        lda     #$30
        ldy     #$2B
        sty     $D7
        sta     $D8
        sta     $D9
        sta     $C5
        ldx     #$09
LEABB:  sta     $CD,x
        dex
        bne     LEABB
        lda     $0100
        cmp     #$2D
        beq     LEAC9
        lda     #$2B
LEAC9:  sta     $C4
        stx     $F4
        stx     $F5
        lda     #$20
        sta     $F6
        ldy     #$01
        sty     $F2
        dey
        .byte   $2C
LEAD9:  ldx     #$09
LEADB:  iny
        lda     $0100,y
        beq     LEB06
        cmp     #$2E
        beq     LEAD9
        cmp     #$45
        beq     LEAF4
        .byte   $95
LEAEA:  cmp     $E0
        ora     #$B0
        .byte   $02
        sty     $F2
        inx
        bne     LEADB
LEAF4:  lda     $0101,y
        sta     $D7
        lda     $0102,y
        tax
        lda     $0103,y
        beq     LEB04
        sta     $D9
LEB04:  stx     $D8
LEB06:  ldx     $F2
        ldy     #$08
LEB0A:  lda     $C4,x
        dex
        .byte   $10
LEB0E:  .byte   $02
        lda     #$20
        sta     $C5,y
        dey
        bpl     LEB0A
        .byte   $2C
LEB18:  sty     $F5
        ldy     $F4
        cpy     $22
        bne     LEB48
        lda     #$00
LEB22:  sta     $D7
        jsr     LD39E
        beq     LEB41
        lda     $F5
        jsr     LD264
        tay
LEB2F:  dey
        lda     LC100,y
        sta     ($D1),y
        tya
        bne     LEB2F
        jsr     LD22C
        jsr     LD238
        jmp     LE8D6

LEB41:  lda     #$00
        ldy     #$C1
        jmp     LD637

LEB48:  jsr     LF02B
        cmp     #$5E
        bne     LEB68
        ldx     #$FD
LEB51:  lda     LFFDA,x
        .byte   $2C
LEB55:  lda     #$20
        .byte   $2C
LEB58:  lda     $C4
        sta     LC100,y
        iny
        bne     LEB63
        jmp     LE977

LEB63:  inx
        bne     LEB51
        beq     LEB18
LEB68:  cmp     #$2B
        beq     LEB58
        cmp     #$2D
        bne     LEB78
        lda     $0100
        lsr     a
        bcs     LEB58
        bcc     LEB55
LEB78:  cmp     #$23
        bne     LEB83
        jsr     LEFA7
        ldx     #$09
        bne     LEB93
LEB83:  cmp     #$25
        bne     LEBB9
        jsr     LEFA7
        cmp     $F2
        bcc     LEBB3
        lda     #$09
        sbc     $F3
        tax
LEB93:  dec     $F3
        bpl     LEB9A
        jmp     LEF18

LEB9A:  lda     $C5,x
        and     #$7F
        sta     LC100,y
        iny
        .byte   $F0
LEBA3:  .byte   $12
        inx
        bne     LEB93
        jsr     LF02B
        sbc     #$30
        sta     $F3
        cmp     #$0A
        bcs     LEBB3
        rts

LEBB3:  jmp     LDE20

        jmp     LE977

LEBB9:  cmp     #$21
        bne     LEBFC
        jsr     LEFA7
        sec
        lda     #$09
        sbc     $F3
LEBC5:  sta     $F3
        tax
        lda     $C5,x
        cmp     $F6
        beq     LEC28
        lda     #$30
        inx
LEBD1:  inx
        cpx     #$12
        beq     LEBDA
        sta     $C5,x
        bne     LEBD1
LEBDA:  ldx     $F3
        inx
        lda     $C5,x
        cmp     #$35
LEBE1:  lda     #$30
LEBE3:  sta     $C5,x
        bcc     LEC28
        dex
        bmi     LEC28
        .byte   $B5
LEBEB:  cmp     $C5
        inc     $D0,x
        .byte   $04
        inc     $F2
        lda     #$30
LEBF4:  cmp     #$39
        beq     LEBE1
        adc     #$01
        bcc     LEBE3
LEBFC:  cmp     #$40
        bne     LEC07
        jsr     LEFA7
LEC03:  adc     #$08
        bcc     LEBC5
LEC07:  cmp     #$26
        beq     LEC0E
        jmp     LEF5A

LEC0E:  jsr     LF02B
        cmp     #$30
        bne     LEC17
        ora     #$80
LEC17:  tax
        ldy     #$00
LEC1A:  lda     $C5,y
        cmp     $F6
        bne     LEC26
        stx     $C5,y
        iny
        bne     LEC1A
LEC26:  stx     $F6
LEC28:  jmp     LEF1A

        ldy     $F4
        lda     ($91),y
        inc     $F4
        ldy     $F5
        ldx     #$FF
        rts

        jsr     LE7C5
        jsr     LEE99
        jmp     LE7D6

        ldx     #$05
LEC41:  lda     LCD1A,x
        sta     $BFDF,x
        lda     LCD1F,x
        sta     $BFE9,x
        dex
        bne     LEC41
        inx
        stx     LC072
        lda     #$41
        ldy     #$4E
        sta     $B4
        sty     $B5
        jsr     LD244
        jsr     LD2BA
        lda     #$E0
        ldy     #$BF
        jsr     LD2AA
        ldx     #$E0
        ldy     #$BF
        jsr     LD2C2
        lda     $021F
        bne     LEC78
        jmp     LD16F

LEC78:  rts

        jsr     LF03F
        jsr     LD216
        ldx     #$E5
        ldy     #$BF
        jsr     LD2C2
        ldx     #$00
LEC88:  stx     $F2
        lda     #$E0
        ldy     #$BF
        jsr     LD2BA
        ldx     $F2
        beq     LEC9E
        jsr     LD2F2
        jsr     LD2DA
        jmp     LF0A1

LEC9E:  jsr     LD2EA
        lda     #$E5
        ldy     #$BF
        jsr     LD2AA
        jsr     LD28A
        tax
        beq     LECB2
        iny
        bne     LECB2
        inx
LECB2:  txa
        ldx     $F2
        sta     $02E2,x
        tya
LECB9:  sta     $02E1,x
        inx
        inx
        cpx     #$02
        beq     LEC88
        lsr     LC072
        bcc     LECD3
        jsr     LD22C
        jsr     LD2FA
        sty     $02E5
        sta     $02E6
LECD3:  jsr     LD312
        lsr     $02E0
        bcc     LEC78
        jmp     LE97C

        jsr     LF03F
        jsr     LD27F
        stx     $F3
        jsr     LD22C
        jsr     LD27F
        stx     $F4
        lda     #$04
        sta     $F5
        lda     #$00
        sta     $F6
LECF6:  ldx     $F6
        txa
        eor     #$01
        sta     $F6
        ldy     $F3,x
        lda     #$00
        jsr     LD2CA
        jsr     LF07F
        lda     #$E0
        ldy     #$BF
        jsr     LD2BA
        lda     #$EA
        ldy     #$BF
        jsr     LD2A2
        ldx     #$E0
        ldy     #$BF
        jsr     LD2C2
        dec     $F5
        bne     LECF6
        rts

        ldy     #$1B
        bit     $18A0
        bit     $15A0
        bit     $12A0
        .byte   $2C
        .byte   $A0
LED2E:  .byte   $0F
        bit     $0CA0
        ldx     #$56
        bne     LED5E
LED36:  ldx     #$42
        bit     $56A2
        bit     $4CA2
        ldy     #$09
        bne     LED5E
        ldx     #$42
        bit     $56A2
        bit     $4CA2
        ldy     #$06
        bne     LED5E
        ldx     #$42
        bit     $47A2
        bit     $4CA2
        bit     $51A2
        bit     $56A2
        ldy     #$03
LED5E:  lda     #$C4
        pha
        tya
        pha
        cpx     LC015
        beq     LEDB9
        bit     $5BA2
        txa
        pha
LED6D:  jsr     LEA06
        beq     LED8F
        ldx     #$0C
        jsr     LD36C
        nop
        jsr     LD648
        cli
        php
        lda     #$0B
        jsr     LD62A
        plp
        bcc     LED8F
        pla
        cmp     #$5B
        beq     LED8C
        pla
        pla
LED8C:  jmp     LD1DC

LED8F:  jsr     LDA4C
        lda     LC207
        sta     LC04B
        lda     LC20A
        bne     LED6D
        ldx     #$FF
        pla
        sta     LC015
        sec
LEDA4:  tay
        inx
        sbc     LC207
        beq     LEDAD
        bcs     LEDA4
LEDAD:  stx     LC001
        ldx     #$04
        lda     #$C4
        jsr     LF1E5
        sec
        .byte   $24
LEDB9:  clc
        ror     LC016
        ldx     #$03
LEDBF:  lda     LC400,x
        sta     LC00D,x
        dex
        bpl     LEDBF
        lda     LC015
        cmp     #$5B
        beq     LEDD2
        jmp     LD39E

LEDD2:  ldx     #$7C
        lda     #$20
        ldy     #$00
        sty     LC001
        iny
        jsr     LF1E5
        .byte   $20
LEDE0:  .byte   $9E
        .byte   $D3
        jmp     LC404

        stx     $F5
        sta     LC004
        lda     #$00
        sta     LC003
        sei
LEDF0:  sty     LC002
        jsr     LDA73
        inc     LC004
        ldy     LC002
LEDFC:  cpy     LC04B
        bcc     LEE06
        inc     LC001
        ldy     #$00
LEE06:  iny
        dec     $F5
        bne     LEDF0
        cli
        rts

LEE0D:  jmp     LE0E0

        beq     LEE39
        jsr     LD44F
        jsr     LD79E
        jsr     LDFE6
        lda     #$00
        ldy     #$C4
        sta     LC052
LEE22:  sty     LC053
        lda     #$40
        sta     LC04E
        jsr     LE0E5
        lda     LC051
        and     #$20
        beq     LEE0D
        lda     #$01
        sta     LC015
LEE39:  ldy     LC015
        dey
        bne     LEE0D
        lda     $026A
        pha
        php
        jsr     LDFDE
        lda     #$B8
        ldy     #$BB
        sta     $F2
        sty     $F3
        lda     #$E8
        ldy     #$C3
        sta     $F4
        sty     $F5
        ldx     #$04
        ldy     #$18
LEE5B:  lda     ($F4),y
        sta     ($F2),y
        iny
        bne     LEE5B
        inc     $F3
        inc     $F5
        dex
        bne     LEE5B
LEE69:  jsr     LF327
        jsr     LF309
LEE6F:  jsr     LD73E
        cli
LEE73:  jsr     LD845
LEE76:  bpl     LEE73
        sei
        cmp     #$03
        beq     LEEE5
        cmp     #$7F
        bne     LEE96
        lda     #$08
        jsr     LF2EC
        bmi     LEE6F
        jsr     LF2CA
        bne     LEEA2
        .byte   $A9
LEE8E:  ora     #$20
        rol     a
        dec     $A9,x
        .byte   $7F
        bne     LEE9A
LEE96:  cmp     #$20
        .byte   $90
LEE99:  asl     a
LEE9A:  jsr     LD62A
        lda     #$08
        jsr     LD62A
LEEA2:  lda     #$09
        cmp     #$08
        bcc     LEE9A
        cmp     #$0C
        beq     LEE6F
        bcc     LEEC0
        cmp     #$0E
        beq     LEE6F
        cmp     #$0D
        bne     LEE9A
        lda     #$09
LEEB8:  jsr     LF2EC
        jsr     LF2CA
        beq     LEEB8
LEEC0:  jsr     LF2EC
        jsr     LF2CA
        bne     LEEC0
        beq     LEE6F
        pha
        jsr     LD740
        clc
        lda     $12
        adc     #$30
        sta     $F8
        lda     $13
        adc     #$08
        sta     $F9
        ldy     $0269
        lda     ($F8),y
        tay
        pla
        cpy     #$7F
        rts

LEEE5:  plp
        jsr     LF325
        jmp     LF320

        lsr     $F2
LEEEE:  jsr     LD62A
        ldy     $0268
        cpy     #$01
        beq     LEEFC
        cpy     #$1B
        bne     LEF06
LEEFC:  bit     $F2
        bmi     LEF08
        ror     $F2
        eor     #$01
        bne     LEEEE
LEF06:  bit     $F2
LEF08:  rts

        lda     #$1E
        jsr     LD62A
        jsr     LD206
LEF11:  jsr     LF2CA
        beq     LEF24
        lda     #$09
LEF18:  .byte   $20
        .byte   $EC
LEF1A:  .byte   $F2
        bpl     LEF11
        pla
        pla
        plp
        pla
        sta     $026A
LEF24:  rts

        clc
        bit     $38
        ror     LC072
        jsr     LF309
        lda     #$57
        ldy     #$C9
        sta     $B4
        sty     $B5
        lda     #$00
        sta     $F6
        sta     $F7
        ldy     #$01
        sty     $26
        dey
        sty     $29
        sty     $27
        dey
        sty     $28
        ldy     $F6
        ldx     $F7
        inc     $F6
        bne     LEF52
        inc     $F7
LEF52:  jsr     L04D1
        ldy     #$00
        lda     ($B6),y
        .byte   $85
LEF5A:  .byte   $F2
        iny
        lda     ($B6),y
        sta     $91
        iny
        lda     ($B6),y
        sta     $92
        ldx     #$00
LEF67:  bit     LC072
        bpl     LEF80
        cpx     $F2
        txa
        inx
        beq     LEFCB
        tay
        lda     ($91),y
        bcc     LEF93
        lda     #$7F
        ldy     $0269
        sta     ($12),y
        bcs     LEF91
LEF80:  ldy     $0269
        lda     ($12),y
        cmp     #$7F
        bne     LEF8B
        lda     #$20
LEF8B:  sta     LC100,x
        inx
        beq     LEFCB
LEF91:  lda     #$09
LEF93:  jsr     LD62A
        jsr     LF2CA
        beq     LEF67
        bit     LC072
        bmi     LEFBC
        stx     $F2
        txa
        jsr     LD264
        .byte   $A0
LEFA7:  brk
LEFA8:  lda     LC100,y
        sta     ($D1),y
        iny
        cpy     $F2
        bne     LEFA8
        ldy     #$02
LEFB4:  lda     $D0,y
        sta     ($B6),y
        dey
        bpl     LEFB4
LEFBC:  lda     #$09
        jsr     LF2EC
        bmi     LEFCE
        jsr     LF2CA
        bne     LEFBC
        jmp     LF33C

LEFCB:  jmp     LE977

LEFCE:  rts

        lda     $0A
        asl     a
        adc     #$08
        bne     LEFE1
        ldy     #$04
        lda     ($9E),y
        pha
        iny
        lda     ($9E),y
        tay
        pla
        .byte   $2C
LEFE1:  ldy     #$00
        clc
        adc     $9E
        sta     $F2
        pha
        tya
        adc     $9F
        sta     $F3
        tax
        pla
        ldy     #$00
        rts

        ldy     #$00
        lda     $9F
        cmp     $A1
        beq     LF002
        lda     ($9E),y
        iny
        and     ($9E),y
        bmi     LF024
LF002:  ldx     $9E
        ldy     $9F
        lda     #$02
        sta     $F2
        lda     #$88
        jsr     LF456
        ldy     #$00
        sty     LC081
        tya
LF015:  sta     ($9E),y
        iny
        bne     LF015
        ldy     #$05
LF01C:  lda     LCD25,y
        sta     ($9E),y
        dey
        bpl     LF01C
LF024:  rts

        pha
        sty     $F3
        stx     $F9
        clc
LF02B:  ldy     #$86
LF02D:  lda     ($9E),y
        cmp     $F9
        iny
        lda     ($9E),y
        sbc     $F3
        bcc     LF047
        dey
        clc
        pla
        pha
        adc     ($9E),y
        .byte   $91
LF03F:  .byte   $9E
        iny
        lda     ($9E),y
        adc     $F2
        sta     ($9E),y
LF047:  dey
        dey
        dey
        bne     LF02D
        txa
        adc     $9E
        tax
        lda     $F3
        adc     $9F
        tay
        pla
        stx     $CE
        sty     $CF
        clc
        adc     $A0
        sta     $C7
        pha
        lda     $A0
        ldy     $A1
        sta     $C9
        lda     $A1
        sta     $CA
        adc     $F2
        sta     $C8
        tay
        pla
        jmp     LD15C

        pha
        jsr     LF3F3
        pla
        tax
        clc
        php
        bcc     LF087
        clc
        .byte   $24
LF07F:  sec
        php
        jsr     LF3F3
        jsr     LD27F
LF087:  cpx     #$40
        bcs     LF0A5
        stx     $0A
        jsr     LF3CF
        iny
        plp
        lda     ($F2),y
        bne     LF0A0
        bcs     LF0A2
        ldx     #$0D
        bit     $0EA2
        jmp     LD67E

LF0A0:  .byte   $B0
LF0A1:  .byte   $F9
LF0A2:  jmp     LD39E

LF0A5:  jmp     LDE20

        lda     #$88
        ldy     #$00
        jsr     LF3E3
        sta     $06
        stx     $07
        lda     $0A
        asl     a
        adc     #$08
        tay
        jsr     LF3D8
        sta     L0000
        clc
        .byte   $69
LF0C0:  .byte   $17
        sta     $02
        sta     $04
        txa
        sta     $01
        adc     #$00
        sta     $03
        adc     #$01
        sta     $05
        iny
        lda     (L0000),y
        sta     LC083
LF0D6:  dey
        lda     (L0000),y
        sta     $0B
        rts

        clc
        adc     $02
        sta     $02
        bcc     LF0E5
        inc     $03
LF0E5:  rts

        lda     #$80
        bit     a:$A9
        bit     $01A9
        bit     $40A9
        sta     LC082
        lda     #$06
        jsr     LF3E1
        lda     ($F2),y
        sta     $F4
LF0FD:  iny
        lda     ($F2),y
        sta     $F5
        jsr     LF3D6
LF105:  lda     $F4
        ora     $F5
        beq     LF15F
        lda     $F4
        bne     LF111
        dec     $F5
LF111:  dec     $F4
        ldy     #$06
        bit     LC082
        bpl     LF126
        sec
        lda     ($F2),y
        sbc     $0A
        bne     LF152
        tay
        sta     ($F2),y
        beq     LF152
LF126:  bvc     LF14B
        ldy     #$00
        lda     ($F2),y
LF12C:  bne     LF152
LF12E:  .byte   $A5
LF12F:  .byte   $F2
        ldy     $F3
        sta     $F4
        sty     $F5
        rts

LF137:  ldy     #$09
        lda     LC082
        bne     LF12E
LF13E:  lda     ($F2),y
        sta     LC076,y
        dey
        bpl     LF13E
        bmi     LF12E
LF148:  dey
        bmi     LF137
LF14B:  lda     ($F2),y
        cmp     LC076,y
        beq     LF148
LF152:  lda     #$0A
        clc
        adc     $F2
        sta     $F2
        bcc     LF105
        inc     $F3
        .byte   $B0
LF15E:  .byte   $A6
LF15F:  bit     LC082
        bvc     LF1AC
        ldy     #$04
        lda     ($9E),y
        pha
        tax
        iny
        lda     ($9E),y
        pha
        tay
        txa
        jsr     LF3E3
        jsr     LF52E
        pla
        tay
        pla
        tax
        lda     #$00
        sta     $F2
        lda     #$64
        jsr     LF425
        sec
        ldy     #$04
        lda     ($9E),y
        sbc     #$64
        sta     ($9E),y
        iny
        lda     ($9E),y
        sbc     #$00
        sta     ($9E),y
        ldy     #$06
        lda     #$09
        adc     ($9E),y
        sta     ($9E),y
        iny
        lda     ($9E),y
        adc     #$00
        sta     ($9E),y
        lda     #$00
        ldy     #$63
LF1A6:  sta     ($F4),y
        dey
        bpl     LF1A6
        rts

LF1AC:  bmi     LF1B4
        lsr     LC082
        bcc     LF1B5
        clc
LF1B4:  rts

LF1B5:  ldx     #$13
        jmp     LD67E

        jsr     LF640
        jsr     LF3F3
        lda     #$D3
        jsr     LD22E
        jsr     LED2E
        jsr     LF4E9
        jsr     LF67A
        lda     LC07C
        sta     $0A
        jsr     LF4A8
        lda     LC07D
        jsr     LF4DC
        ldx     $0B
        dex
        bne     LF1E9
        ldx     LC07F
        .byte   $AC
LF1E5:  ror     LD0C0,x
        .byte   $0E
LF1E9:  ldy     #$00
        lda     ($02),y
        iny
        tax
        lda     ($02),y
        tay
        lda     #$02
        jsr     LF4DC
        sty     $F5
        txa
        bmi     LF225
        bne     LF20A
        lda     $02
        ldy     $03
        jsr     LD2BA
        jmp     LF620

        nop
        nop
LF20A:  asl     a
        asl     a
        ldy     #$00
        lda     ($02),y
        tay
        sta     $F2
        lda     #$00
        bcs     LF21D
        ldy     #$01
        lda     ($02),y
        ldy     $F2
LF21D:  jsr     LD254
        lda     $29
        jmp     LD1FE

LF225:  lda     $F5
        jsr     LD264
        tay
        beq     LF235
LF22D:  dey
        lda     ($02),y
        sta     ($D1),y
        tya
        bne     LF22D
LF235:  jmp     LEE8E

        .byte   $14
        .byte   $14
        .byte   $14
        .byte   $14
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        ldx     #$0A
        lda     #$00
LF244:  sta     LC075,x
        dex
        bne     LF244
        lda     $0A
        sta     LC07C
        jsr     LD39E
        jmp     LF658

LF255:  jsr     LD398
        beq     LF2CC
        cmp     #$80
        bcs     LF2CC
        cmp     #$28
        beq     LF26C
        cpx     #$05
        beq     LF255
        sta     LC076,x
        inx
        bne     LF255
LF26C:  jsr     LD398
        jsr     LD27F
        stx     LC07B
        lda     #$29
        jmp     LD22E

        lda     LC07F
        sta     LC07F
        asl     a
        jmp     LD21C

        lda     #$00
        sta     $F2
        sta     LC085
        sta     L0008
        sta     $09
        lda     LC083
        ldx     #$08
        sta     $F3
LF296:  lsr     $F3
        bcc     LF2AF
        clc
        lda     $33
        adc     LC085
        sta     LC085
        lda     $34
        adc     L0008
        sta     L0008
        lda     $F2
        adc     $09
        sta     $09
LF2AF:  asl     $33
        rol     $34
        rol     $F2
        dex
        bne     LF296
        jsr     LF6CD
        jsr     LF4A8
        clc
        lda     LC085
        adc     $06
        sta     $06
        bcc     LF2CA
        inc     $07
LF2CA:  ldy     #$00
LF2CC:  rts

        jsr     LF4A8
        clc
        lda     L0008
        ldx     $09
        adc     #$02
        bcc     LF2DA
        inx
LF2DA:  ldy     #$0A
        sec
        sbc     ($04),y
        pha
        iny
        txa
        sbc     ($04),y
        tay
        pla
        bcc     LF2EB
        jsr     LF75A
LF2EB:  .byte   $A2
LF2EC:  .byte   $FF
        clc
        lda     L0008
        adc     #$05
        sta     L0008
        bcc     LF2F8
        inc     $09
LF2F8:  sec
LF2F9:  lda     L0008
        tay
        sbc     #$7F
        sta     L0008
        lda     $09
        sbc     #$00
        sta     $09
        inx
        bcs     LF2F9
LF309:  iny
        tya
        asl     a
        sta     LC084
        sta     $F8
        txa
        pha
        jsr     LF4A8
        pla
        clc
        adc     $05
        sta     $05
        sta     $F7
        .byte   $AC
        .byte   $84
LF320:  cpy     #$20
        rol     $F7,x
        .byte   $4C
LF325:  rol     $F7,x
LF327:  jsr     LF4A8
        lda     $F7
        sta     $05
        ldy     $F8
        jsr     LF733
        ldx     #$A8
        bit     $88A2
        lda     ($04),y
        .byte   $8D
        .byte   $01
LF33C:  cpy     #$C8
        lda     ($04),y
        sta     LC002
        lda     $06
        sta     LC003
        lda     $07
        sta     LC004
        inc     $07
        iny
        bne     LF356
        inc     $05
        ldy     #$02
LF356:  jmp     LDA75

LF359:  rts

        sta     LC058
        sty     LC059
        ora     LC059
        beq     LF359
        jsr     LDA4C
        jsr     LF4A8
        ldy     #$02
        lda     (L0000),y
        beq     LF385
        clc
        adc     $05
        sta     $05
        dec     $05
        ldy     #$00
        lda     ($04),y
        tax
        iny
        lda     ($04),y
        iny
        inc     $05
        bne     LF38F
LF385:  ldy     #$13
        lda     (L0000),y
        tax
        iny
        lda     (L0000),y
        ldy     #$0C
LF38F:  stx     LC001
        sta     LC002
        jsr     LF85F
LF398:  iny
        lda     ($04),y
        beq     LF3A2
        iny
        bne     LF398
        beq     LF3D6
LF3A2:  dey
LF3A3:  lda     LC058
        ora     LC059
        beq     LF402
        jsr     LF85F
        lda     LC058
        bne     LF3B6
        dec     LC059
LF3B6:  dec     LC058
        sty     LC05F
        jsr     LF838
        sty     $F2
        ldy     LC05F
        sta     ($04),y
        iny
        lda     $F2
        sta     ($04),y
        iny
        bne     LF3A3
        .byte   $AD
LF3CF:  cli
        cpy     #$0D
        eor     LF0C0,y
        .byte   $2C
LF3D6:  .byte   $20
        .byte   $4C
LF3D8:  sed
        sta     $F5
        sty     $F6
        ldy     #$00
        sta     ($04),y
LF3E1:  iny
        .byte   $A5
LF3E3:  inc     $91,x
        .byte   $04
        jsr     LDAA4
        lda     $F5
        ldy     $F6
        sta     LC001
        sty     LC002
LF3F3:  jsr     LF86A
        lda     #$00
        tay
LF3F9:  sta     ($04),y
        iny
        bne     LF3F9
        ldy     #$02
        bne     LF3A3
LF402:  jsr     LDAA4
        ldy     #$06
LF407:  lda     (L0000),y
        sta     LC022,y
        iny
        cpy     #$17
        bne     LF407
        jsr     LDB30
        bne     LF419
        jmp     LE0DD

LF419:  jsr     LDAEE
        jsr     LDA8A
        jsr     LDA82
        jsr     LF4A8
LF425:  ldy     #$13
        lda     (L0000),y
        sta     LC001
        iny
        lda     (L0000),y
        sta     LC002
        jsr     LF85F
        jmp     LDAA4

        ldy     #$0A
        inc     $03
        lda     ($02),y
        clc
        adc     #$01
        sta     ($02),y
        iny
        lda     ($02),y
        adc     #$00
        sta     ($02),y
        dec     $03
        ldy     #$15
        lda     (L0000),y
        clc
        adc     #$01
        sta     (L0000),y
        iny
LF456:  lda     (L0000),y
        adc     #$00
        sta     (L0000),y
        jmp     LDC6C

        lda     $04
        sta     LC003
        lda     $05
        sta     LC004
        rts

        inc     $05
        clc
        ldy     #$02
        lda     (L0000),y
        adc     #$01
        sta     (L0000),y
        lda     $04
        ldy     $05
        jsr     LF885
        .byte   $A9
LF47D:  ora     ($85,x)
LF47F:  .byte   $F2
        lda     #$00
        jmp     LF425

        sec
        sbc     $9E
        tax
        tya
        sbc     $9F
        tay
        rts

        jsr     LD24C
        lda     $D4
        ldx     $D3
        bpl     LF4A3
        eor     #$FF
        clc
        adc     #$01
        cpx     #$FF
        beq     LF4A7
LF4A0:  jmp     LDE20

LF4A3:  cpx     #$00
        bne     LF4A0
LF4A7:  .byte   $20
LF4A8:  .byte   $73
        .byte   $F4
        jsr     LF4A8
        bmi     LF4D2
        bne     LF4CF
        lda     LC083
        bit     $D3
        bmi     LF4C3
        ldy     #$04
        lda     ($04),y
        pha
        iny
        lda     ($04),y
        tay
        pla
        .byte   $2C
LF4C3:  ldy     #$00
        .byte   $24
LF4C6:  tay
        sta     $F2
        tya
        ldy     $F2
        jmp     LD254

LF4CF:  jmp     LE0E0

LF4D2:  jsr     LFD0E
        beq     LF4C6
        bit     $D3
        bmi     LF4C3
        .byte   $A9
LF4DC:  brk
        beq     LF4C3
        jsr     LF956
        bne     LF4EA
        .byte   $20
        .byte   $6B
LF4E6:  sbc     $734C,y
LF4E9:  .byte   $DA
LF4EA:  bcs     LF4FD
LF4EC:  jsr     LF91F
LF4EF:  php
        sei
        jsr     LF684
LF4F4:  lda     ($06),y
        sta     ($02),y
        iny
        bne     LF4F4
        plp
LF4FC:  rts

LF4FD:  jsr     LED2E
        jsr     LFDD9
        txa
        jsr     LF67D
        lda     $06
        ldy     $07
        sta     $02
        sty     $03
        jsr     LF5DC
        jsr     LD39E
        beq     LF4FC
        jsr     LD22C
        jmp     LF8FD

        clc
        bit     $38
        php
        jsr     LD2FA
        ldy     #$04
        lda     ($04),y
        cmp     $33
        iny
        lda     ($04),y
        .byte   $E5
LF52E:  .byte   $34
        bcs     LF539
        plp
        bcc     LF53B
        ldx     #$10
        jmp     LD67E

LF539:  plp
        rts

LF53B:  ldy     #$04
        lda     $33
        sta     ($04),y
        iny
        lda     $34
        sta     ($04),y
        jsr     LF85F
        ldy     #$13
        lda     (L0000),y
        pha
        iny
        lda     (L0000),y
        tay
        pla
        jmp     LDA9E

        jsr     LF47D
        jsr     LD22C
        jsr     LF4A8
        pha
        ldy     #$06
        lda     (L0000),y
        sta     garbage1
        pla
        cmp     #$01
        rts

        jsr     LD27F
        stx     LC001
        jsr     LD22C
        jsr     LD27F
        stx     LC002
        beq     LF582
        jsr     LD22C
        jsr     LE60D
LF582:  .byte   $20
        tay
LF584:  .byte   $F4
        lda     $02
        ldy     $03
        sta     LC003
        sty     LC004
        rts

        jsr     LE60D
        jmp     LDA4C

        jsr     LE60D
        jmp     LDA8A

        jsr     LD27F
        txa
        pha
        and     #$7F
        .byte   $CD
LF5A4:  asl     $C2
        bcs     LF5C8
        jsr     LD22C
        jsr     LD27F
        txa
        dex
        bmi     LF5C8
        cpx     LC207
        bcs     LF5C8
        tay
        pla
        .byte   $4C
LF5BA:  ora     $DD,x
        jsr     LDC6C
        pha
        tya
        jsr     LD7ED
        pla
        jmp     LD7EA

LF5C8:  jmp     LDE20

        jsr     LF956
        bne     LF5D6
        jsr     LF96B
        jmp     LDAA4

LF5D6:  bcs     LF5EF
        jsr     LF91D
        php
LF5DC:  sei
        jsr     LF684
LF5E0:  lda     ($02),y
        sta     ($06),y
        iny
        cpy     LC083
        bne     LF5E0
        jsr     LF727
        plp
        rts

LF5EF:  jsr     LD224
        jsr     LFD0E
        bne     LF61B
        ldx     #$05
        ldy     #$00
        bit     $28
        bpl     LF60C
        lda     $D3
        ldx     $D4
        sta     $91
        stx     $92
        lda     ($91),y
        tax
        ldy     #$80
LF60C:  sty     LC07F
        jsr     LFA39
        lda     #$FF
        jsr     LFDCC
        sta     ($02),y
        bmi     LF62B
LF61B:  jsr     LFDD9
        pha
        txa
LF620:  jsr     LF67D
        jsr     LFD2A
        pla
        tax
        jsr     LFA39
LF62B:  jsr     LD39E
        beq     LF636
        jsr     LD22C
        jmp     LF9EF

LF636:  .byte   $4C
        .byte   $46
LF638:  sbc     $7E8E,x
        .byte   $C0
LF63C:  lda     $06
        ldy     $07
LF640:  sta     $02
        sty     $03
        clc
        ldy     #$00
        jsr     LFC9E
        jsr     LF4A8
        jmp     LFE38

        pha
        jsr     LD398
        jsr     LD22C
        pla
LF658:  cmp     #$44
        bne     LF67C
        lda     LC009
        sta     garbage1
        jsr     LF47F
        beq     LF66D
        jsr     LD22C
        jsr     LE60D
LF66D:  lda     #$00
        ldy     #$01
        jsr     LFACB
        ldy     #$06
        lda     garbage1
        .byte   $91
LF67A:  brk
LF67B:  rts

LF67C:  .byte   $C9
LF67D:  .byte   $52
        bne     LF692
        lda     #$00
        ldy     #$08
LF684:  jsr     LFB08
        bne     LF67B
        jsr     LD22C
        jmp     LF9D8

LF68F:  jmp     LDE23

LF692:  cmp     #$53
        bne     LF68F
        lda     #$80
        ldy     #$10
        jsr     LFB08
LF69D:  php
        ldy     #$03
        lda     #$0C
        sta     (L0000),y
        iny
        lda     #$00
        sta     (L0000),y
        iny
        sta     (L0000),y
        plp
        bne     LF6B8
        ldy     #$00
        lda     #$FF
        sta     ($02),y
        jmp     LFD46

LF6B8:  jmp     LFD44

        jsr     LFAC0
        bmi     LF69D
        jsr     LF47D
        jsr     LF4A8
        bmi     LF67B
        jmp     LE0E0

        pha
        tya
LF6CD:  pha
        ldy     #$05
        lda     ($9E),y
        bne     LF6D6
        ldy     #$03
LF6D6:  dey
        lda     ($9E),y
        tax
        pha
        iny
        lda     ($9E),y
        pha
        tay
        lda     #$01
        sta     $F2
        lda     #$21
        jsr     LF425
        jsr     LF3CF
        iny
        pla
        sta     ($F2),y
        dey
        pla
        sta     ($F2),y
        jsr     LF4A8
        pla
        sta     (L0000),y
        pla
        iny
        sta     (L0000),y
        sta     LC083
        rts

LF702:  jmp     LE0E0

LF705:  jmp     LDE20

        sta     $0B
        sty     $F9
        jsr     LD44F
        jsr     LD79E
        jsr     LD22C
        jsr     LF47F
        jsr     LDB2D
        php
        bne     LF740
        ldx     #$00
        bit     $0B
        bmi     LF72E
        jsr     LD22C
LF727:  jsr     LD27F
        cpx     #$03
        bcc     LF705
LF72E:  lda     #$00
        sta     LC052
LF733:  sta     LC053
        tay
        txa
        ldx     $F9
        jsr     LDE00
        jsr     LDB30
LF740:  lda     LC30C,x
        ldy     LC30D,x
        jsr     LDA5D
        lda     LC103
        cmp     $F9
        bne     LF702
        lda     LC106
        ldy     $0B
        jsr     LFACB
        ldy     #$07
LF75A:  ldx     LC027
LF75D:  lda     LC300,x
        sta     (L0000),y
        inx
        iny
        cpy     #$17
        bne     LF75D
        lda     #$FF
        ldy     #$02
        sta     (L0000),y
        dec     $05
LF770:  jsr     LF86A
        jsr     LF85F
        jsr     LDA73
        ldy     #$00
        lda     ($04),y
        sta     LC001
        iny
        lda     ($04),y
        sta     LC002
        bne     LF770
        jsr     LFA74
        plp
        rts

        beq     LF7A0
        jsr     LF47D
        jsr     LFBAF
        jsr     LD39E
        beq     LF7AE
        jsr     LD22C
        jmp     LFB8F

LF7A0:  jsr     LF3F3
        lda     #$3F
        sta     $0A
LF7A7:  jsr     LFBAF
        dec     $0A
        bpl     LF7A7
LF7AE:  rts

        jsr     LF3CF
        tya
        iny
        sta     ($F2),y
        jmp     LF4E6

LF7B9:  jmp     LE0E0

LF7BC:  jmp     LDE23

        jsr     LF47D
        jsr     LD22C
        jsr     LF4A8
        bmi     LF7B9
        lda     LC080
        cmp     $0A
        beq     LF7D6
        lda     #$00
        sta     LC081
LF7D6:  jsr     LF640
        lda     #$C3
        jsr     LD22E
        beq     LF7BC
        pha
        jsr     LD398
        pla
        ldy     #$00
        ldx     #$05
        cmp     #$C0
        beq     LF807
        ldx     #$02
        iny
        cmp     #$25
        beq     LF807
        dex
        ldy     #$40
        cmp     #$4F
        beq     LF807
        cmp     #$24
        bne     LF7BC
        jsr     LD27F
        txa
        beq     LF854
        ldy     #$80
LF807:  sty     LC07F
        stx     LC07E
        lda     LC081
        ldy     $0A
        sta     LC07D
        sty     LC07C
        clc
        ldx     $0B
        bne     LF822
        adc     #$02
        jsr     LFC57
LF822:  adc     LC07E
        jsr     LFC57
        sta     LC081
        jsr     LF4EC
        bcs     LF833
        jsr     LF4EF
LF833:  ldy     #$09
LF835:  lda     LC076,y
LF838:  sta     ($F4),y
        dey
        bpl     LF835
        ldx     #$00
        jsr     LD39E
        bne     LF848
        stx     LC081
        rts

LF848:  jsr     LD22C
        bne     LF7D6
        lda     $0A
        sta     LC080
LF852:  clc
        rts

LF854:  jmp     LDE20

        beq     LF869
        bcs     LF86E
        .byte   $AE
        .byte   $83
LF85D:  cpy     #$F0
LF85F:  .byte   $F2
        cmp     LC083
        beq     LF852
        bcc     LF852
        bcs     LF86E
LF869:  .byte   $AE
LF86A:  .byte   $83
        cpy     #$F0
        .byte   $E4
LF86E:  ldx     #$11
        jmp     LD67E

        clc
        bit     $38
        php
        jsr     LF3F3
        jsr     LF640
        lda     #$D5
        jsr     LD22E
        jsr     LD224
LF885:  jsr     LF4E9
LF888:  jsr     LF67A
        jsr     LF4A8
        lda     LC07C
        sta     $0A
        ldy     LC07D
        ldx     LC07E
        lda     $0B
        bne     LF8A9
        plp
        php
        lda     LC07F
        sta     ($02),y
        iny
        txa
        sta     ($02),y
        iny
LF8A9:  tya
        .byte   $20
        .byte   $DC
LF8AC:  .byte   $F4
        plp
        ldy     #$00
        lda     LC07F
        bmi     LF8D7
        beq     LF8D0
        .byte   $20
LF8B8:  jmp     LA0D2

        brk
        lda     $D4
        sta     ($02),y
        bit     LC07F
        bvc     LF8CA
        lda     $D3
        bne     LF854
        rts

LF8CA:  iny
        lda     $D3
        sta     ($02),y
        rts

LF8D0:  ldx     $02
        ldy     $03
        jmp     LD2C2

LF8D7:  php
        jsr     LD274
        sta     $D0
        ldy     LC07E
        beq     LF8E9
        lda     #$20
LF8E4:  dey
        sta     ($02),y
        bne     LF8E4
LF8E9:  plp
        bcs     LF8FA
        nop
        nop
LF8EE:  cpy     $D0
        bcs     LF8F9
        lda     ($91),y
        sta     ($02),y
        iny
        bne     LF8EE
LF8F9:  rts

LF8FA:  ldy     $D0
        .byte   $F0
LF8FD:  .byte   $0F
        dey
        dec     $D0
        lda     ($91),y
        dec     LC07E
        ldy     LC07E
        sta     ($02),y
        bne     LF8FA
        rts

        jsr     LF4A8
        ldy     #$03
        lda     (L0000),y
        sta     LC086
        iny
        lda     (L0000),y
        .byte   $8D
        .byte   $87
LF91D:  cpy     #$C8
LF91F:  lda     (L0000),y
        sta     LC088
        tay
        lda     ($02),y
        cmp     #$FF
LF929:  rts

        jsr     LF4A8
        ldy     #$05
        lda     LC088
        sta     (L0000),y
        dey
        lda     LC087
        sta     (L0000),y
        dey
        lda     LC086
        cmp     (L0000),y
        sta     (L0000),y
        beq     LF929
        clc
        bit     $38
        php
        jsr     LF4A8
        lda     $02
        ldy     $03
        sta     LC003
        sty     LC004
        .byte   $A0
LF956:  .byte   $04
        lda     (L0000),y
        clc
        adc     $05
        sta     $05
        dey
        lda     (L0000),y
        tay
        lda     ($04),y
        pha
        iny
        lda     ($04),y
        tay
        pla
        plp
LF96B:  bcc     LF970
        jmp     LDA9E

LF970:  jmp     LDA6D

        jsr     LFDCC
        sta     ($02),y
        sec
        bit     $18
        jsr     LFDCC
        iny
        bne     LF9C3
        bcc     LF9A4
        jsr     LFD46
        ldy     #$02
        lda     (L0000),y
        ldy     #$04
        cmp     (L0000),y
        bne     LF9A4
        dey
        lda     (L0000),y
        tay
        iny
        iny
        beq     LF99D
        iny
        lda     ($04),y
        bne     LF9A4
LF99D:  lda     #$03
        ldy     #$00
        jsr     LF75A
LF9A4:  jsr     LF4A8
        ldy     #$03
        lda     (L0000),y
        clc
        adc     #$02
        bne     LF9BA
        ldy     #$04
        lda     (L0000),y
        adc     #$00
        sta     (L0000),y
        lda     #$02
LF9BA:  ldy     #$03
        sta     (L0000),y
        jsr     LFD44
        ldy     #$00
LF9C3:  tya
        ldy     #$05
        sta     (L0000),y
        tay
        lda     ($02),y
        rts

        ldy     #$05
        pha
        lda     (L0000),y
        tay
        pla
        rts

        ldx     #$0F
        .byte   $4C
        .byte   $7E
LF9D8:  dec     $20,x
        asl     LF0FD
        inc     $A0,x
        brk
        sta     ($06),y
        jsr     LFD7A
        ldy     #$01
        sta     ($06),y
        iny
        sty     $F5
        sta     $F6
        .byte   $E6
LF9EF:  .byte   $F6
LF9F0:  jsr     LFD7A
        ldy     $F5
        inc     $F5
        sta     ($06),y
        dec     $F6
        bne     LF9F0
        ldy     #$00
        lda     ($06),y
        tax
        iny
        lda     ($06),y
        rts

        nop
        jsr     LFAC0
        lda     #$FF
        sta     $33
        sta     $34
        bmi     LFA1B
        jsr     LFAC0
        jsr     LD22C
        jsr     LD2FA
LFA1B:  php
        sei
        lda     $33
        ora     $34
        beq     LFA36
        lda     $33
        bne     LFA29
        dec     $34
LFA29:  dec     $33
        jsr     LFD0E
        beq     LFA36
        jsr     LFDD9
        jmp     LFE1D

LFA36:  plp
        rts

        .byte   $A0
LFA39:  brk
        lda     ($06),y
        jsr     LFD73
        ldy     #$01
        lda     ($06),y
        iny
        sty     $F7
        sta     $F8
        inc     $F8
LFA4A:  jsr     LFD73
        ldy     $F7
        lda     ($06),y
        inc     $F7
        dec     $F8
        bne     LFA4A
        rts

        lsr     $F2
        lsr     $F4
        ldx     #$0C
LFA5E:  dex
        bmi     LFA83
        lda     LC091,x
        sta     LC029,x
        ldy     LC09E,x
        cmp     #$3F
        beq     LFA76
        cpy     #$3F
        bne     LFA5E
        ror     $F2
LFA74:  bne     LFA5E
LFA76:  ror     $F4
        bit     $16
        bvs     LFA5E
        cpy     #$3F
        beq     LFA5E
LFA80:  jmp     LD5AC

LFA83:  bit     $F2
        bpl     LFA93
        ldx     #$0C
LFA89:  lda     LC09D,x
        cmp     #$3F
        bne     LFA80
        dex
        bne     LFA89
LFA93:  cli
        rts

        jsr     LE7C5
        jsr     LFAC0
LFA9B:  jsr     LD302
        bpl     LFAAC
LFAA0:  jsr     LFF3D
        cmp     #$20
        beq     LFAAC
        cmp     #$03
        bne     LFAA0
        rts

LFAAC:  jsr     LFD0E
        beq     LFAC7
        jsr     LFDD9
        beq     LFA9B
        sta     $F2
        txa
        bpl     LFACA
LFABB:  iny
        lda     ($06),y
        .byte   $20
        rol     a
LFAC0:  dec     $C6,x
        .byte   $F2
        bne     LFABB
        beq     LFA9B
LFAC7:  jmp     LE7D6

LFACA:  clc
LFACB:  lda     $06
        ldy     $07
        adc     #$02
        bcc     LFAD4
        iny
LFAD4:  jsr     LD2BA
        jsr     LD2D2
        jsr     LD637
        jmp     LFE9B

        jsr     LFE07
        jsr     LFF00
        jsr     LFF3D
        ldy     $F2
        cmp     #$03
        beq     LFB37
        cmp     #$0D
        bne     LFAF8
        jsr     LFF1B
        lda     #$0A
LFAF8:  jsr     LFF1B
        sty     $F2
        jmp     LFEE6

        brk
        brk
        .byte   $F4
        lda     #$80
        sta     ($06),y
        iny
LFB08:  lda     #$D8
        sta     ($06),y
        lda     #$00
        iny
        sty     $F2
LFB11:  sta     ($06),y
        iny
        cpy     #$DA
        bne     LFB11
        ldy     #$02
LFB1A:  rts

        sta     ($06),y
        jsr     LD62A
        iny
        cpy     #$DA
        bne     LFB1A
        jsr     LFE38
        lda     #$FF
        jsr     LFDCC
        sta     ($02),y
        jsr     LFD46
        ldy     #$02
        jmp     LFF00

LFB37:  jsr     LFF25
        jmp     LFD46

LFB3D:  jsr     LD845
        bpl     LFB3D
        rts

        jmp     LED36

        jmp     LD398

        jmp     LD39E

        jmp     LD44F

        jmp     LD451

        jmp     LD364

        jmp     LF3F3

        jmp     LF4A8

        jmp     LFDD9

        jmp     LFE38

        jmp     LFD46

        jmp     LD62A

        jmp     LD613

        jmp     LD637

        jmp     LD5D8

        jmp     LE0EA

        jmp     LE0E5

        jmp     LDE28

        jmp     LDFE6

        jmp     LDE9C

        jmp     LE266

        jmp     LDD2D

        jmp     LDD15

        jmp     LDC6C

        jmp     LDBC0

        .byte   $4C
LFB8F:  eor     $4CDB,y
        lda     $DB
        jmp     LDB41

        jmp     LDB30

        jmp     LDB2D

        jmp     LDB07

        jmp     LDAFE

        jmp     LDAEE

        jmp     LDACE

        jmp     LDAA4

        jmp     LDA9E

LFBAF:  jmp     LDA91

        jmp     LDA82

        jmp     LDA8A

        jmp     LDA73

        jmp     LDA6D

        jmp     LDA5D

        jmp     LDA4C

        jmp     LCFCD

; XXX
str_copyright:
        .byte   "SEDORIC 1.0 par F.BROCHE et D.S"



        .byte   "EBBAG(c) 1985 EUREKA!"


        cmp     ($10),y
        .byte   $23
        .byte   $7B
        .byte   $B9
; $FC00
START_STRATORIC:
        sei
        cld
        ldx     #$FF
        txs
        lda     #$FF
        sta     V1DDRA
        lda     #$F7
        sta     V1DDRB
        lda     #$17
        sta     V2DRA
        sta     V2DDRA
        lda     #$7F
        sta     V2IFR
        sta     V1IFR
        lda     #$02
        sta     $031E
        lda     #$07
        ldx     #$40
        jsr     INIT_VIA1
        lda     $0247
        cmp     #$4C
        beq     LFC39
        lda     $022B
        cmp     #$4C
        bne     skip
LFC39:  jsr     FIXME1
        bne     skip
        ldy     #$06
        lda     #$47
        ldx     $0247
        cpx     #$4C
        beq     skip2
        ldy     #$05
        lda     #$2B
skip2:  ldx     #$02
        sta     $B904
        stx     $B905
LFC57           := * + 2
        lda     LFC6B
        sta     $B903
        lda     LFD5A
        sta     LB900
        lda     #$21
        ldx     #$03
        sta     $B901
        stx     $B902
LFC6B:  jmp     LB900

skip:   jsr     FIXME2
        beq     LFC81
        lda     #$03
        ldy     #$EC
        sta     L0008
        sty     $09
        lda     #$05
        ldy     #$00
        beq     LFC8D
LFC81:  lda     #$22
        ldy     #$EE
        sta     L0008
        sty     $09
        lda     #$06
        ldy     #$80
LFC8D:  sty     L0000
        sta     $01
        sta     $1C
        sta     $0247
        ldx     #$EF
LFC98:  lda     LFCCF,x
        sta     $B7FF,x
LFC9E:  dex
        bne     LFC98
        bit     L0000
        bpl     LFCB2
        ldx     #$12
LFCA7:  lda     ADDRESS_0X238_TABLE,x
        sta     $0238,x
        dex
        bpl     LFCA7
        bmi     LFCBD
LFCB2:  ldx     #$08
LFCB4:  lda     ADDRESS_0X228_TABLE,x
        sta     L0228,x
        dex
        bpl     LFCB4
LFCBD:  ldy     #$00
        lda     #$C0
        sty     $02
        sta     $03
        lda     #$C4
        sty     $04
        sta     $05
        ldx     #$3C
LFCCF           := * + 2
        jmp     LB800

LFCD0:  lda     ($02),y
        pha
        lda     #$00
        sta     V2DRA
        pla
        sta     ($04),y
        lda     #$07
        sta     V2DRA
        iny
        bne     LFCD0
        inc     $03
        inc     $05
        dex
        bne     LFCD0
        stx     V2DRA
        ldx     #$0A
LFCEF:  lda     $B8E4,x
        sta     LC67A,x
        sta     LC77A,x
        dex
        bpl     LFCEF
        lda     $01
        sta     LC67E
        sta     LC77E
        lda     L0000
        asl     a
        rol     a
        sta     LC007
        lda     $01
LFD0E           := * + 2
        sta     V2DRA
        ldx     #$FF
        stx     $A6
        stx     $02C1
        stx     $02E1
        bit     L0000
        bpl     LFD2F
        lda     #$00
        sta     $0260
        sta     $0220
        ldy     #$97
        sty     $A7
LFD2A           := * + 1
        sty     $02C2
        jmp     LF8AC

LFD2F:  ldy     #$BF
        sty     $02E2
        inx
        jmp     LF85D

        pha
        lda     $1C
        cmp     #$CC
        beq     LFD47
        cmp     #$CB
        beq     LFD47
        pla
LFD44:
LFD46           := * + 2
        jmp     (L0008)

LFD47:  pla
        pla
        pla
        pla
        lda     #$22
        ldy     #$EE
        bit     L0000
        bmi     LFD5F
        lda     #$03
        ldy     #$EC
        sta     $0229
LFD5A:  sty     $022A
        bne     LFD65
LFD5F:  sta     $0245
        sty     $0246
LFD65:  lda     #$10
        ldy     #$07
        sta     $026B
        sty     $026C
        lda     #$B3
        ldy     #$B8
LFD73:  jsr     L001A
        lda     #$00
LFD7A           := * + 2
        sta     V2DRA
        sta     garbage1
        sta     L0000
        jmp     LC400

        .byte   $0C
        asl     a
str_STRATORIC   := * + 1                        ; $FD86
        sty     $53,x
        .byte   "TRATORIC V4.0 "

        .byte   $90,$0D,$0A
        .byte   "` 1987 ORIC International"



        .byte   $0D,$0A,$00,$AD
        and     ($03,x)
        eor     #$00
        sta     V2DRA
        pla
        plp
        rts

; XX
ADDRESS_0X238_TABLE:
        .byte   $4C,$7C,$F7,$4C,$78,$EB,$4C,$C1
        .byte   $F5,$4C,$65,$F8,$4C
LFDCC:  .byte   $68,$B8,$4C,$B2,$F8,$40
; XX
ADDRESS_0X228_TABLE:
        .byte   $4C,$68,$B8,$4C,$30,$F4,$01
LFDD9:  .byte   $00,$40
; $FDDB
FIXME1: ldx     #$DF
        lda     #$0E
        jsr     INIT_VIA1
        lda     #$05
        jmp     LFDF3

; $FDE7
FIXME2: ldx     #$DF
        lda     #$0E
        jsr     INIT_VIA1
        lda     #$00
        jmp     LFDF3

LFDF3:  sta     V1DRB
        lda     #$08
        and     V1DRB
        rts

; $FDFC
INIT_VIA1:
        sta     V1DRA
        lda     #$EE
        sta     V1PCR
        lda     #$CC
LFE07           := * + 1
        sta     V1PCR
        stx     V1DRAB
        lda     #$EC
        sta     V1PCR
        lda     #$CC
        sta     V1PCR
        rts

        .byte   $FF
        .byte   $FF
        .byte   $FF,$FF,$FF,$FF
LFE1D:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF
LFE38:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF
LFE9B:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF
LFEE6:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$00,$FC
        .byte   $FF,$FF
LFF00:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF
LFF1B:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF
LFF25:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LFF3D:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF
LFFDA:  .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .byte   $FF,$FF
LFFFC:  .byte   $00
        .byte   $FC
        .byte   $FF
        .byte   $FF
