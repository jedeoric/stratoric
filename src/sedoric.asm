
; ----------------------------------------------------------------------------
#define BASIC11_INTERPRETER_VECTOR   $00F0
#define SEDORIC_TRAV0      $00F2
#define SEDORIC_TRAV1      $00F3
#define SEDORIC_TRAV2      $00F4
#define SEDORIC_TRAV3      $00F5
#define SEDORIC_TRAV4      $00F6
#define SEDORIC_TRAV5      $00F7
#define SEDORIC_TRAV6      $00F8
#define SEDORIC_TRAV7      $00F9
#define STACK              $0100

#define DO_EXEVEC          $0453                        ; Exec code inside overlay
#define L0471              $0471
#define DO_RAMROM          $0477                        ; Switch from ROM to Overlay and vice-versa
#define SED_IRQ            $0488                        ; Replaces IRQ
#define SED_COLDSTART      $04A8                        ; Replaces COLDSTART
#define DO_IRQRAM          $04B3                        ; forwards IRQ/NMI from overlay to ROM
#define L04D1              $04D1
#define SEDORIC_EXERAM     $04EC
#define SEDORIC_EXEVEC     $04EF
#define RAMROM             $04F2
#define IRQRAM             $04F5
#define NMIRAM             $04F8
#define MICRODISC_CONTROL_SHADOW   $04FB                ; Caches the control register as it's write-only
#define SEDORIC_FLAGIF     $04FC                        ; b7 1 if inside IF
#define SEDORIC_IDERROR    $04FD                        ; id of Error
#define SEDORIC_NOLIGN     $04FE                        ; Line of Error
#define SEDORIC_DRIVE      $C000
#define SEDORIC_TRACK      $C001
#define SEDORIC_SECTOR     $C002
#define SEDORIC_RWBUF      $C003
#define SEDORIC_TYPE_OF_ERROR   $C005                   ; b5 0 write fault if b5 1 read fault
#define SEDORIC_XRWTS_RETRY   $C006                     ; XRWTS (nombre de tentatives possibles en cas de secteur non trouvé)
#define SEDORIC_NUMBER_OF_RETRY   $C007
#define SEDORIC_DRVDEF     $C009
#define SEDORIC_DRVSYS     $C00A
#define SEDORIC_ACTIVATE_DRIVE_AND_TRACK   $C00B        ; activation drive et piste  contains $00 $0b
#define SEDORIC_EXTER      $C00D
#define SEDORIC_EXTMS      $C00F
#define SEDORIC_EXTNB      $C015
#define SEDORIC_IO_ERROR   $C017                        ; number of I/O error
#define SEDORIC_FLAGERR    $C018                        ; flag ERR (b7 à 1 si SET, à 0 si OFF)
#define SEDORIC_ERRVEC     $C01D                        ; adresse de traitement des erreurs (D685 par ex)
#define SEDORIC_ATMORI     $C024
#define SEDORIC_BUFNOM     $C028
#define SEDORIC_TABDRV     $C039                        ; TABDRV D2 D2 D2 D2 table d'activation des lecteurs (4 lecteurs double face, 82 pistes par face)
#define SEDORIC_MODCLA     $C03D                        ; mode clavier (b6 ACCENT, b7 AZERTY)
#define SEDORIC_COMMAND_TYPE_LAUNCHED   $C048           ; equal to 0. type de code de fonction  * b6 0 si commande SEDORIC (RAM overlay visée) * b6 1 si commande BASIC (ROM visée) * b7 0 si commande re-définissable ou pré-définie * b7 1 dans tous les autres cas
#define SEDORIC_USER_COMMAND_1_VECTOR   $C066           ; $23 $DE $80
#define SEDORIC_USER_COMMAND_2_VECTOR   $C069           ; $23 $DE $80
#define SEDORIC_USER_COMMAND_3_VECTOR   $C06C           ; $23 $DE $80
#define SEDORIC_USER_COMMAND_4_VECTOR   $C06F           ; $23 $DE $80
#define SEDORIC_BACKUP_CHAR_LINPUT   $C075              ; $2e sauvegarde de caractère pour LINPUT
#define SEDORIC_BUF1       $C100                        ; buffer for descriptors
#define SEDORIC_BUF2       $C200                        ; buffer for bitmap
#define SEDORIC_BUF3       $C300                        ; buffer for directory sector




#define SEDORIC_VECTOR_RAM $b900

		
#define SEDORIC_VECTORS_IO $0400

		
*=$c400
SEDKERN_START:
        lda     SEDORIC_NUMBER_OF_RETRY         ; C400 AD 07 C0                 ...
        lsr                            ; C403 4A                       J
LC404:  lda     #$00                            ; C404 A9 00                    ..
        ror                                 ; C406 6A                       j
        sta     SEDORIC_ATMORI                  ; C407 8D 24 C0                 .$.
.(		
        bpl      skip                          ; C40A 10 0F                    ..
		
        lda     #$50                            ; C40C A9 50                    .P
        sta     BASIC11_NUMBER_OF_COLUMN_FOR_PRINTER; C40E 8D 56 02             .V.
        lsr                                 ; C411 4A                       J
        sta     $31                             ; C412 85 31                    .1
        sta     $32                             ; C414 85 32                    .2
        sta     BASIC11_NUMBER_OF_LINES_FOR_PRINTER; C416 8D 57 02              .W.
        bne     skip2                           ; C419 D0 06                    ..
skip: 
		lda     #$5D                            ; C41B A9 5D                    .]
        sta     $31                             ; C41D 85 31                    .1
        sta     $32                             ; C41F 85 32                    .2
skip2:
.)
.(
		inc     BASIC11_HIMEM_MAX_ADRESS        ; C421 EE C1 02                 ...
        inc     BASIC11_HIMEM_MAX_ADRESS+1      ; C424 EE C2 02                 ...
        ldx     #$00                            ; C427 A2 00                    ..
loop:
		lda     page4_oric1,x                   ; C429 BD 00 C6                 ...
        bit     SEDORIC_ATMORI                  ; C42C 2C 24 C0                 ,$.
        bpl     skip                           ; C42F 10 03                    ..
        lda     page4_atmos,x                   ; C431 BD 00 C7                 ...
skip:
		sta     SEDORIC_VECTORS_IO,x                         ; C434 9D 00 04                 
        inx                                     ; C437 E8                       .
        bne     loop                           ; C438 D0 EF                    ..
.)		
        lda     #$4C                            ; C43A A9 4C                    .L
        ldy     #<SEDORIC_VECTORS_IO                            ; C43C A0 00                 
        ldx     #>SEDORIC_VECTORS_IO                            ; C43E A2 04                 
        sta     $EF                             ; C440 85 EF                    ..
        sty     BASIC11_INTERPRETER_VECTOR      ; C442 84 F0                    ..
        stx     BASIC11_INTERPRETER_VECTOR+1    ; C444 86 F1                    ..
        lda     #$88                            ; C446 A9 88                    .. FIXME
        ldy     #$C4                            ; C448 A0 C4                    .. FIXME
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
        lda     #$0F                            ; C46D A9 0F                    .. FIXME
        ldx     #$70                            ; C46F A2 70                    .p FIXME
        ldy     #$D0                            ; C471 A0 D0                    ..
        bne     LC487                           ; C473 D0 12                    ..
LC475:  sta     BASIC10_IRQ_VECTOR              ; C475 8D 29 02                 .).
        stx     BASIC10_IRQ_VECTOR+1            ; C478 8E 2A 02                 .*.
        sty     BASIC10_IRQ2_VECTOR             ; C47B 8C 2C 02                 .,.
        stx     BASIC10_IRQ2_VECTOR+1           ; C47E 8E 2D 02                 .-.
        lda     #$07                            ; C481 A9 07                    .. FIXME
        ldx     #$E4                            ; C483 A2 E4                    .. FIXME
        ldy     #$CF                            ; C485 A0 CF                    ..
LC487:  sta     BASIC11_FLG                     ; C487 8D 6A 02                 .j.
        stx     $02F9                           ; C48A 8E F9 02                 ...
        sty     $02FA                           ; C48D 8C FA 02                 ...
        ldx     #$04                            ; C490 A2 04                    ..
        lda     #$9A                            ; C492 A9 9A                    .. FIXME
        ldy     #$D0                            ; C494 A0 D0                    .. FIXME
        sta     IRQ_VECTOR                      ; C496 8D FE FF                 ...
        sty     IRQ_VECTOR+1                    ; C499 8C FF FF                 ...
        lda     #$67                            ; C49C A9 67                    .g
        ldy     #$61                            ; C49E A0 61                    .a
        sta     BASIC11_BANG_VECTOR             ; C4A0 8D F5 02                 ...
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
        lda     #$85                            ; C4C8 A9 85                    .. FIXME
        ldy     #$D6                            ; C4CA A0 D6                    .. FIXME
        sta     SEDORIC_ERRVEC                  ; C4CC 8D 1D C0                 ...
        sty     SEDORIC_ERRVEC+1                ; C4CF 8C 1E C0                 ...
        lda     MICRODISC_FDC_TRACK             ; C4D2 AD 11 03                 ...
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
LC517:
.(
loop
		inx                                     ; C517 E8                       .
        lda     MSG_DOS_ALTERED,x               ; C518 BD 74 C5                 .t.
        sta     SEDORIC_VECTOR_RAM,x                         ; C51B 9D 00 B9               
        bne     loop                           ; C51E D0 F7                    ..
.)
        lda     #<SEDORIC_VECTOR_RAM                            ; C520 A9 00    
        ldy     #>SEDORIC_VECTOR_RAM                            ; C522 A0 B9    
        jsr     SEDORIC_EXERAM                  ; C524 20 EC 04                  .. 

LC527:
		lda     #$14                            ; Read track 20 FIXME
        ldy     #$01                            ; first sector  FIXME
        jsr     READ_SECTOR_TRACK               ; C52B 20 5D DA                  ]. 
        ldx     #$08                            ; C52E A2 08                    ..
.(		
loop
		lda     SEDORIC_BUF1,x                  ; C530 BD 00 C1                 ...
        sta     SEDORIC_TABDRV,x                ; C533 9D 39 C0                 .9.
        cpx     #$05                            ; C536 E0 05                    ..
        bcc     skip                           ; C538 90 03                    ..
        sta     SEDORIC_MODCLA,x                ; C53A 9D 3D C0                 .=.
skip:  dex                                     ; C53D CA                       .
        bpl     loop                           ; C53E 10 F0                    ..
.)		
        jsr     SEDORIC_XCHAR                   ; C540 20 A3 EB                  ..
        jsr     SEDORIC_XROM                    ; C543 20 D8 D5                  ..
        cpx     #$F7                            ; C546 E0 F7                    ..
		
        asl     SEDORIC_TRAV6,x                 ; C548 16 F8                    ..		

        ldx     #$41                            ; C54A A2 41                    .A
LC54C
.(
loop:
		lda     SEDORIC_BUF1+30,x               ; C54C BD 1E C1                 ...
        sta     $36,x                           ; C54F 95 36                    .6
        dex                                     ; C551 CA                       .
        bpl     loop                           ; C552 10 F8                    ..
.)		
        lda     #$3A                            ; C554 A9 3A                    .:
        sta     $35                             ; C556 85 35                    .5
        jsr     LD206                           ; C558 20 06 D2                  .. FIXME
        lda     #$BD                            ; C55B A9 BD                    .. FIXME
        ldy     #$C4                            ; C55D A0 C4                    .. FIXME
        bit     SEDORIC_ATMORI                  ; C55F 2C 24 C0                 ,$.
        bmi     LC566                           ; C562 30 02                    0.

				
		lda     #$CD                            ; C564 A9 CD                    .. FIXME
LC566:  sta     SEDORIC_EXEVEC+1                ; C566 8D F0 04                 ... FIXME
        sty     SEDORIC_EXEVEC+2                ; C569 8C F1 04                 ...
        ldx     #$34                            ; C56C A2 34                    .4
        ldy     #$00                            ; C56E A0 00                    ..
        cli                                     ; C570 58                       X
        jmp     L0471                           ; C571 4C 71 04                 Lq.
/*
	

*/
MSG_DOS_ALTERED		
        .byt   $0A,$8C,$81                     ; C574 0A 8C 81                 ...
        .asc   "** WARNING **",$88,$87,"DOS is altered !"                 ; C589 20 69 73 20 61 6C 74 65   is alte
        .byt   $0D,$0A,$00                     ; C596 0D 0A 00                 ...

		
		.byt 	$4C,$64,$D3,$60,$AD,$AE,$C5 ; C198 00 4C 64 D3 60 AD AE C5  .Ld.`...
        .byte   $AE,$AF,$C5,$8D,$01,$C0,$8E,$02 ; C1A0 AE AF C5 8D 01 C0 8E 02  ........
        .byte   $C0,$AD,$B0,$C5,$D0,$DB,$27,$09 ; C1A8 C0 AD B0 C5 D0 DB 27 09  ......'.
        .byte   $1A,$49,$4E,$20,$44,$52,$49,$56 ; C1B0 1A 49 4E 20 44 52 49 56  .IN DRIV
        .byte   $45,$A0,$4C,$4F,$41,$44,$20,$44 ; C1B8 45 A0 4C 4F 41 44 20 44  E.LOAD D
        .byte   $49,$53,$43,$53,$20,$46,$4F,$52 ; C1C0 49 53 43 53 20 46 4F 52  ISCS FOR
        .byte   $20,$42,$41,$43,$4B,$55,$50,$20 ; C1C8 20 42 41 43 4B 55 50 20   BACKUP 
        .byte   $46,$52,$4F,$4D,$A0,$20,$54,$4F ; C1D0 46 52 4F 4D A0 20 54 4F  FROM. TO
        .byte   $A0,$0D,$0A,$4C,$4F,$41,$44,$20 ; C1D8 A0 0D 0A 4C 4F 41 44 20  ...LOAD 
        .byte   $53,$4F,$55,$52,$43,$45,$20,$44 ; C1E0 53 4F 55 52 43 45 20 44  SOURCE D
        .byte   $49,$53,$43,$A0,$0D,$0A,$4C,$4F ; C1E8 49 53 43 A0 0D 0A 4C 4F  ISC...LO
        .byte   $41,$44,$20,$54,$41,$52,$47,$45 ; C1F0 41 44 20 54 41 52 47 45  AD TARGE
        .byte   $54,$20,$44,$49,$53,$43,$A0,$0D ; C1F8 54 20 44 49 53 43 A0 0D  T DISC..
		
		
; XXXXXXXXXXXXX		
page4_oric1:
#include "page400_oric1.asm"
      
page4_atmos
#include "page400_atmos.asm"
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



		
		
		
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C480 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$20,$20,$20,$20,$A0 ; C488 20 20 20 20 20 20 20 A0         .
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F ; C490 20 20 20 20 20 20 44 4F        DO
        .byte   $4B,$45,$23,$32,$46,$35,$2C,$A3 ; C498 4B 45 23 32 46 35 2C A3  KE#2F5,.
        .byte   $20,$20,$44,$4F,$4B,$45,$23,$32 ; C4A0 20 20 44 4F 4B 45 23 32    DOKE#2
        .byte   $46,$35,$2C,$23,$34,$36,$37,$8D ; C4A8 46 35 2C 23 34 36 37 8D  F5,#467.
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F ; C4B0 20 20 20 20 20 20 44 4F        DO
        .byte   $4B,$45,$23,$32,$46,$39,$2C,$A3 ; C4B8 4B 45 23 32 46 39 2C A3  KE#2F9,.
        .byte   $20,$44,$4F,$4B,$45,$23,$32,$46 ; C4C0 20 44 4F 4B 45 23 32 46   DOKE#2F
        .byte   $39,$2C,$23,$44,$30,$37,$30,$8D ; C4C8 39 2C 23 44 30 37 30 8D  9,#D070.
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F ; C4D0 20 20 20 20 20 20 44 4F        DO
        .byte   $4B,$45,$23,$32,$46,$43,$2C,$A3 ; C4D8 4B 45 23 32 46 43 2C A3  KE#2FC,.
        .byte   $20,$20,$44,$4F,$4B,$45,$23,$32 ; C4E0 20 20 44 4F 4B 45 23 32    DOKE#2
        .byte   $46,$43,$2C,$23,$34,$36,$31,$8D ; C4E8 46 43 2C 23 34 36 31 8D  FC,#461.
        .byte   $20,$20,$20,$20,$50,$41,$50,$45 ; C4F0 20 20 20 20 50 41 50 45      PAPE
        .byte   $52,$30,$3A,$49,$4E,$4B,$37,$8D ; C4F8 52 30 3A 49 4E 4B 37 8D  R0 INK7.
        .byte   $20,$20,$20,$20,$20,$20,$43,$41 ; C500 20 20 20 20 20 20 43 41        CA
        .byte   $4C,$4C,$23,$46,$38,$44,$30,$8D ; C508 4C 4C 23 46 38 44 30 8D  LL#F8D0.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C510 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$20,$20,$20,$20,$FE ; C518 20 20 20 20 20 20 20 FE         .
        .byte   $20,$20,$20,$20,$3F,$48,$45,$58 ; C520 20 20 20 20 3F 48 45 58      ?HEX
        .byte   $24,$28,$50,$45,$45,$4B,$28,$A3 ; C528 24 28 50 45 45 4B 28 A3  $(PEEK(.
        .byte   $20,$20,$20,$20,$3F,$48,$45,$58 ; C530 20 20 20 20 3F 48 45 58      ?HEX
        .byte   $24,$28,$44,$45,$45,$4B,$28,$A3 ; C538 24 28 44 45 45 4B 28 A3  $(DEEK(.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C540 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$50,$45,$45,$4B,$28,$A3 ; C548 20 20 50 45 45 4B 28 A3    PEEK(.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C550 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$44,$45,$45,$4B,$28,$A3 ; C558 20 20 44 45 45 4B 28 A3    DEEK(.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C560 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$50,$4F,$4B,$45,$A3 ; C568 20 20 20 50 4F 4B 45 A3     POKE.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C570 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$44,$4F,$4B,$45,$A3 ; C578 20 20 20 44 4F 4B 45 A3     DOKE.
        .byte   $48,$45,$58,$24,$A8,$43,$41,$4C ; C580 48 45 58 24 A8 43 41 4C  HEX$.CAL
        .byte   $4C,$A3,$54,$45,$58,$54,$8D,$46 ; C588 4C A3 54 45 58 54 8D 46  L.TEXT.F
        .byte   $4F,$52,$49,$3D,$31,$54,$CF,$4C ; C590 4F 52 49 3D 31 54 CF 4C  ORI 1T.L
        .byte   $45,$46,$54,$24,$A8,$4D,$49,$44 ; C598 45 46 54 24 A8 4D 49 44  EFT$.MID
        .byte   $24,$A8,$52,$49,$47,$48,$54,$24 ; C5A0 24 A8 52 49 47 48 54 24  $.RIGHT$
        .byte   $A8,$53,$54,$52,$24,$A8,$55,$4E ; C5A8 A8 53 54 52 24 A8 55 4E  .STR$.UN
        .byte   $50,$52,$4F,$54,$8D,$E0,$55,$53 ; C5B0 50 52 4F 54 8D E0 55 53  PROT..US
        .byte   $49,$4E,$C7,$56,$49,$53,$55,$48 ; C5B8 49 4E C7 56 49 53 55 48  IN.VISUH
        .byte   $49,$52,$45,$53,$A2,$56,$55,$53 ; C5C0 49 52 45 53 A2 56 55 53  IRES.VUS
        .byte   $45,$52,$8D,$57,$49,$44,$54,$C8 ; C5C8 45 52 8D 57 49 44 54 C8  ER.WIDT.
        .byte   $57,$49,$4E,$44,$4F,$D7,$21,$52 ; C5D0 57 49 4E 44 4F D7 21 52  WINDO.!R
        .byte   $45,$53,$54,$4F,$52,$C5,$50,$50 ; C5D8 45 53 54 4F 52 C5 50 50  ESTOR.PP
        .byte   $80,$00,$5A,$45,$52,$54,$59,$00 ; C5E0 80 00 5A 45 52 54 59 00  ..ZERTY.
        .byte   $43,$43,$45,$4E,$54,$00,$4F,$58 ; C5E8 43 43 45 4E 54 00 4F 58  CCENT.OX
        .byte   $00,$41,$43,$4B,$55,$50,$00,$55 ; C5F0 00 41 43 4B 55 50 00 55  .ACKUP.U
        .byte   $49,$4C,$44,$00,$48,$44,$49,$52 ; C5F8 49 4C 44 00 48 44 49 52  ILD.HDIR
        .byte   $00,$48,$41,$4E,$47,$45,$00,$4C ; C600 00 48 41 4E 47 45 00 4C  .HANGE.L
        .byte   $4F,$53,$45,$00,$4F,$50,$59,$00 ; C608 4F 53 45 00 4F 50 59 00  OSE.OPY.
        .byte   $52,$45,$41,$54,$45,$57,$00,$52 ; C610 52 45 41 54 45 57 00 52  REATEW.R
        .byte   $45,$53,$45,$43,$00,$48,$4B,$53 ; C618 45 53 45 43 00 48 4B 53  ESEC.HKS
        .byte   $55,$4D,$00,$45,$4C,$44,$49,$52 ; C620 55 4D 00 45 4C 44 49 52  UM.ELDIR
        .byte   $00,$45,$96,$45,$00,$45,$53,$54 ; C628 00 45 96 45 00 45 53 54  .E.E.EST
        .byte   $52,$4F,$59,$00,$45,$4C,$42,$41 ; C630 52 4F 59 00 45 4C 42 41  ROY.ELBA
        .byte   $4B,$00,$45,$4C,$00,$49,$52,$00 ; C638 4B 00 45 4C 00 49 52 00  K.EL.IR.
        .byte   $4E,$55,$4D,$00,$4E,$41,$4D,$45 ; C640 4E 55 4D 00 4E 41 4D 45  NUM.NAME
        .byte   $00,$4B,$45,$59,$00,$53,$59,$53 ; C648 00 4B 45 59 00 53 59 53  .KEY.SYS
        .byte   $00,$54,$52,$41,$43,$4B,$00,$52 ; C650 00 54 52 41 43 4B 00 52  .TRACK.R
        .byte   $52,$97,$00,$52,$52,$47,$4F,$54 ; C658 52 97 00 52 52 47 4F 54  R..RRGOT
        .byte   $4F,$00,$52,$52,$4F,$52,$00,$52 ; C660 4F 00 52 52 4F 52 00 52  O.RROR.R
        .byte   $52,$D2,$00,$52,$52,$00,$53,$41 ; C668 52 D2 00 52 52 00 53 41  R..RR.SA
        .byte   $56,$45,$00,$58,$54,$00,$49,$45 ; C670 56 45 00 58 54 00 49 45  VE.XT.IE
        .byte   $4C,$44,$00,$52,$53,$45,$43,$00 ; C678 4C 44 00 52 53 45 43 00  LD.RSEC.
        .byte   $43,$55,$52,$00,$4E,$49,$54,$00 ; C680 43 55 52 00 4E 49 54 00  CUR.NIT.
        .byte   $4E,$53,$54,$52,$00,$4E,$49,$53 ; C688 4E 53 54 52 00 4E 49 53  NSTR.NIS
        .byte   $54,$00,$55,$4D,$50,$00,$45,$59 ; C690 54 00 55 4D 50 00 45 59  T.UMP.EY
        .byte   $99,$00,$45,$59,$49,$46,$00,$45 ; C698 99 00 45 59 49 46 00 45  ..EYIF.E
        .byte   $59,$55,$53,$45,$00,$45,$59,$44 ; C6A0 59 55 53 45 00 45 59 44  YUSE.EYD
        .byte   $45,$46,$00,$45,$59,$B8,$00,$45 ; C6A8 45 46 00 45 59 B8 00 45  EF.EY..E
        .byte   $59,$53,$41,$56,$45,$00,$45,$59 ; C6B0 59 53 41 56 45 00 45 59  YSAVE.EY
        .byte   $00,$49,$4E,$45,$00,$53,$45,$54 ; C6B8 00 49 4E 45 00 53 45 54  .INE.SET
        .byte   $00,$55,$53,$49,$4E,$47,$00,$55 ; C6C0 00 55 53 49 4E 47 00 55  .USING.U
        .byte   $E3,$47,$00,$92,$00,$4F,$41,$44 ; C6C8 E3 47 00 92 00 4F 41 44  .G...OAD
        .byte   $00,$44,$49,$52,$00,$54,$59,$50 ; C6D0 00 44 49 52 00 54 59 50  .DIR.TYP
        .byte   $45,$00,$43,$55,$52,$00,$4B,$44 ; C6D8 45 00 43 55 52 00 4B 44  E.CUR.KD
        .byte   $49,$52,$00,$4F,$56,$45,$00,$45 ; C6E0 49 52 00 4F 56 45 00 45  IR.OVE.E
        .byte   $52,$47,$45,$00,$55,$4D,$00,$55 ; C6E8 52 47 45 00 55 4D 00 55  RGE.UM.U
        .byte   $54,$00,$4C,$44,$00,$50,$45,$4E ; C6F0 54 00 4C 44 00 50 45 4E  T.LD.PEN
        .byte   $00,$41,$54,$48,$44,$49,$52,$00 ; C6F8 00 41 54 48 44 49 52 00  .ATHDIR.
        .byte   $55,$54,$00,$52,$4F,$54,$00,$52 ; C700 55 54 00 52 4F 54 00 52  UT.ROT.R
        .byte   $00,$4D,$41,$50,$00,$55,$49,$54 ; C708 00 4D 41 50 00 55 49 54  .MAP.UIT
        .byte   $00,$57,$45,$52,$54,$59,$00,$45 ; C710 00 57 45 52 54 59 00 45  .WERTY.E
        .byte   $53,$55,$4D,$45,$00,$53,$45,$54 ; C718 53 55 4D 45 00 53 45 54  SUME.SET
        .byte   $00,$45,$57,$49,$4E,$44,$00,$45 ; C720 00 45 57 49 4E 44 00 45  .EWIND.E
        .byte   $4E,$55,$4D,$00,$45,$4E,$00,$D1 ; C728 4E 55 4D 00 45 4E 00 D1  NUM.EN..
        .byte   $4F,$4D,$00,$41,$4E,$44,$4F,$4D ; C730 4F 4D 00 41 4E 44 4F 4D  OM.ANDOM
        .byte   $00,$45,$53,$45,$54,$00,$57,$41 ; C738 00 45 53 45 54 00 57 41  .ESET.WA
        .byte   $50,$00,$45,$45,$4B,$00,$54,$52 ; C740 50 00 45 45 4B 00 54 52  P.EEK.TR
        .byte   $55,$4E,$00,$54,$98,$00,$59,$53 ; C748 55 4E 00 54 98 00 59 53  UN.T..YS
        .byte   $54,$45,$4D,$00,$54,$41,$54,$55 ; C750 54 45 4D 00 54 41 54 55  TEM.TATU
        .byte   $53,$00,$41,$56,$45,$55,$00,$41 ; C758 53 00 41 56 45 55 00 41  S.AVEU.A
        .byte   $56,$45,$4D,$00,$41,$56,$45,$4F ; C760 56 45 4D 00 41 56 45 4F  VEM.AVEO
        .byte   $00,$41,$56,$45,$00,$45,$41,$52 ; C768 00 41 56 45 00 45 41 52  .AVE.EAR
        .byte   $43,$48,$00,$59,$53,$00,$4D,$41 ; C770 43 48 00 59 53 00 4D 41  CH.YS.MA
        .byte   $50,$00,$4B,$45,$4E,$00,$41,$4B ; C778 50 00 4B 45 4E 00 41 4B  P.KEN.AK
        .byte   $45,$00,$59,$50,$45,$00,$52,$41 ; C780 45 00 59 50 45 00 52 41  E.YPE.RA
        .byte   $43,$4B,$00,$53,$45,$52,$00,$4E ; C788 43 4B 00 53 45 52 00 4E  CK.SER.N
        .byte   $54,$4B,$45,$4E,$00,$E3,$47,$00 ; C790 54 4B 45 4E 00 E3 47 00  TKEN..G.
        .byte   $4E,$50,$52,$4F,$54,$00,$49,$53 ; C798 4E 50 52 4F 54 00 49 53  NPROT.IS
        .byte   $55,$A2,$00,$55,$53,$45,$52,$00 ; C7A0 55 A2 00 55 53 45 52 00  U..USER.
        .byte   $49,$44,$54,$48,$00,$49,$4E,$44 ; C7A8 49 44 54 48 00 49 4E 44  IDTH.IND
        .byte   $4F,$57,$00,$9A,$00,$5D,$00,$FF ; C7B0 4F 57 00 9A 00 5D 00 FF  OW...]..
        .byte   $00,$00,$00


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

		
		
		
		
		
		
		
		
		
		
		.byt  $06 ; C820 CC 65 00 B3 CB 65 03 06  .e...e..
        .byte   $FE,$DD,$EB,$90,$EB,$DD,$F0,$50 ; C828 FE DD EB 90 EB DD F0 50  .......P
        .byte   $F1,$DF,$FE,$72,$E7,$47,$F1,$8C ; C830 F1 DF FE 72 E7 47 F1 8C  ...r.G..
        .byte   $FB,$56,$F1,$4C,$DE,$BB,$F9,$FE ; C838 FB 56 F1 4C DE BB F9 FE  .V.L....
        .byte   $E9,$75,$E7,$41,$F1,$43,$E4,$36 ; C840 E9 75 E7 41 F1 43 E4 36  .u.A.C.6
        .byte   $E4,$45,$E4,$43,$E3,$29,$F1,$44 ; C848 E4 45 E4 43 E3 29 F1 44  .E.C.).D
        .byte   $F1,$23,$F1,$26,$F1,$38,$F1,$98 ; C850 F1 23 F1 26 F1 38 F1 98  .#.&.8..
        .byte   $E9,$98,$E9,$AF,$E9,$AF,$E9,$7E ; C858 E9 98 E9 AF E9 AF E9 7E  .......~
        .byte   $E9,$DF,$DD,$EC,$E9,$BE,$FB,$9B ; C860 E9 DF DD EC E9 BE FB 9B  ........
        .byte   $F9,$F4,$EB,$68,$F1,$2D,$EC,$2C ; C868 F9 F4 EB 68 F1 2D EC 2C  ...h.-.,
        .byte   $F1,$11,$FE,$1F,$DA,$1F,$DA,$3F ; C870 F1 11 FE 1F DA 1F DA 3F  .......?
        .byte   $E7,$42,$E7,$42,$E7,$CC,$DD,$0A ; C878 E7 42 E7 42 E7 CC DD 0A  .B.B....
        .byte   $E7,$78,$F0,$72,$FC,$35,$F0,$35 ; C880 E7 78 F0 72 FC 35 F0 35  .x.r.5.5
        .byte   $F0,$93,$EC,$F6,$DF,$4E,$E7,$94 ; C888 F0 93 EC F6 DF 4E E7 94  .....N..
        .byte   $FE,$EB,$EB,$6F,$E7,$35,$F1,$3B ; C890 FE EB EB 6F E7 35 F1 3B  ...o.5.;
        .byte   $F1,$48,$E7,$1E,$E7,$AE,$E0,$4F ; C898 F1 48 E7 1E E7 AE E0 4F  .H.....O
        .byte   $FA,$78,$E7,$CA,$F9,$F5,$E9,$BF ; C8A0 FA 78 E7 CA F9 F5 E9 BF  .x......
        .byte   $E7,$8F,$F9,$F4,$E7,$E0,$EB,$BA ; C8A8 E7 8F F9 F4 E7 E0 EB BA  ........
        .byte   $E9,$74,$FC,$BA,$FA,$4D,$F1,$4B ; C8B0 E9 74 FC BA FA 4D F1 4B  .t...M.K
        .byte   $E7,$95,$E7,$95,$E7,$B7,$E7,$3A ; C8B8 E7 95 E7 95 E7 B7 E7 3A  ....... 
        .byte   $EA,$53,$F1,$52,$E8,$52,$E8,$FB ; C8C0 EA 53 F1 52 E8 52 E8 FB  .S.R.R..
        .byte   $E9,$F2,$E9,$4C,$DD,$49,$DD,$52 ; C8C8 E9 F2 E9 4C DD 49 DD 52  ...L.I.R
        .byte   $DD,$4F,$DD,$FB,$E5,$59,$F1,$95 ; C8D0 DD 4F DD FB E5 59 F1 95  .O...Y..
        .byte   $F9,$9C,$E8,$DE,$F8,$97,$FE,$2F ; C8D8 F9 9C E8 DE F8 97 FE 2F  ......./
        .byte   $F1,$7E,$EA,$E0,$E8,$98,$EE,$F8 ; C8E0 F1 7E EA E0 E8 98 EE F8  .~......
        .byte   $E9,$EF,$E9,$20,$F1,$45,$E7,$0F ; C8E8 E9 EF E9 20 F1 45 E7 0F  ... .E..
        .byte   $F2,$D8,$E7,$03,$EC,$3D,$E8
COMMON_EXT_TABLE:
        .byte   "COM"                           ; CCF7 43 4F 4D                 COM		
LCCFA:  .byte   "BAKCOM?????????BAK"            ; CCFA 42 41 4B 43 4F 4D 3F 3F  BAKCOM??		
		;.byt  $42,$41,$4B,$43,$4F,$4D ; C8F8 4F 4D 42 41 4B 43 4F 4D  OMBAKCOM
        ;.byte   $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F ; C900 3F 3F 3F 3F 3F 3F 3F 3F  ????????
        ;.byte   $3F,$42,$41,$4B
		
		.byt $28,$50,$35,$5D ; C908 3F 42 41 4B 28 50 35 5D  ?BAK(P5]
        .byte   $00,$00,$01,$01,$FA,$BF,$23,$34 ; C910 00 00 01 01 FA BF 23 34  ......#4
        .byte   $36,$37,$FF,$7B,$0E,$FA,$35,$10 ; C918 36 37 FF 7B 0E FA 35 10  67.{..5.
        .byte   $81,$C9,$0F,$DA,$A2,$C6,$C9,$88 ; C920 81 C9 0F DA A2 C6 C9 88  ........
        .byte   $02,$88,$02,$4F,$46,$46,$53,$45 ; C928 02 88 02 4F 46 46 53 45  ...OFFSE
        .byte   $54,$C7,$81,$C2,$82,$45,$D3,$66 ; C930 54 C7 81 C2 82 45 D3 66  T....E.f
        .byte   $A5,$C8,$A3,$8F,$D2,$42,$B5,$98 ; C938 A5 C8 A3 8F D2 42 B5 98  .....B..
        .byte   $E0

QWAZERTY_CONV:
        .byte   $B1,$BE,$AE,$AA,$82,$93         ; CD41 B1 BE AE AA 82 93        ......
LCD47		
		.byte   $AE,$AA,$B1,$BE,$93,$82         ; CD47 AE AA B1 BE 93 82        ......		



ACCENTED_FONT:
		.byt  $40,$10,$08 ; C948 AA B1 BE 93 82 40 10 08  .....@..
        .byte   $1C,$02,$1E,$22,$1E,$00,$5C,$00 ; C950 1C 02 1E 22 1E 00 5C 00  ..."..\.
        .byte   $00,$1E,$20,$20,$20,$1E,$04,$7B ; C958 00 1E 20 20 20 1E 04 7B  ..   ..{
        .byte   $04,$08,$1C,$22,$3E,$20,$1E,$00 ; C960 04 08 1C 22 3E 20 1E 00  ..."> ..
        .byte   $7C,$10,$08,$22,$22,$22,$26,$1A ; C968 7C 10 08 22 22 22 26 1A  |.."""&.
        .byte   $00,$7D,$10,$08,$1C,$22,$3E,$20 ; C970 00 7D 10 08 1C 22 3E 20  .}..."> 
        .byte   $1E,$00,$7E,$1C,$22,$1C,$22,$3E ; C978 1E 00 7E 1C 22 1C 22 3E  ..~.".">
        .byte   $20,$1E,$00,$41,$58,$59,$50,$B8 ; C980 20 1E 00 41 58 59 50 B8   ..AXYP.
LCD88:      
		.byte   $0A,$64,$E8,$10
LCD8C:		
		.byt 	$00,$00,$03,$27 ; C988 0A 64 E8 10 00 00 03 27  .d.....'
        
		
		.byte   $84,$A4,$C4,$E4,$45,$4E,$45,$4C ; C990 84 A4 C4 E4 45 4E 45 4C  ....ENEL
        
		.byte   $49,$4E,$4F,$4D,$53,$4B,$46,$54 ; C998 49 4E 4F 4D 53 4B 46 54  INOMSKFT
        .byte   $45,$4F,$52,$41,$52,$58,$52,$59 ; C9A0 45 4F 52 41 52 58 52 59  EORARXRY
        .byte   $52,$50,$45,$46,$53,$54,$45,$44 ; C9A8 52 50 45 46 53 54 45 44  RPEFSTED
        .byte   $45,$58,$43,$58,$43,$59,$46,$50 ; C9B0 45 58 43 58 43 59 46 50  EXCXCYFP
        .byte   $46,$53,$53,$43,$4A,$4B,$45,$46 ; C9B8 46 53 53 43 4A 4B 45 46  FSSCJKEF
        .byte   $49,$4C,$45,$20,$4E,$4F,$54,$20 ; C9C0 49 4C 45 20 4E 4F 54 20  ILE NOT 
        .byte   $46,$4F,$55,$4E,$C4,$44,$52,$49 ; C9C8 46 4F 55 4E C4 44 52 49  FOUN.DRI
        .byte   $56,$45,$20,$4E,$4F,$54,$20,$49 ; C9D0 56 45 20 4E 4F 54 20 49  VE NOT I
        .byte   $4E,$20,$4C,$49,$4E,$C5,$49,$4E ; C9D8 4E 20 4C 49 4E C5 49 4E  N LIN.IN
        .byte   $56,$41,$4C,$49,$44,$20,$46,$49 ; C9E0 56 41 4C 49 44 20 46 49  VALID FI
        .byte   $4C,$45,$20,$4E,$41,$4D,$C5,$44 ; C9E8 4C 45 20 4E 41 4D C5 44  LE NAM.D
        .byte   $49,$53,$4B,$20,$49,$2F,$CF,$57 ; C9F0 49 53 4B 20 49 2F CF 57  ISK I/.W
        .byte   $52,$49,$54,$45,$20,$50,$52,$4F ; C9F8 52 49 54 45 20 50 52 4F  RITE PRO
        .byte   $54,$45,$43,$54,$45,$C4,$57,$49 ; CA00 54 45 43 54 45 C4 57 49  TECTE.WI
        .byte   $4C,$44,$43,$41,$52,$44,$28,$53 ; CA08 4C 44 43 41 52 44 28 53  LDCARD(S
        .byte   $29,$20,$4E,$4F,$54,$20,$41,$4C ; CA10 29 20 4E 4F 54 20 41 4C  ) NOT AL
        .byte   $4C,$4F,$57,$45,$C4,$46,$49,$4C ; CA18 4C 4F 57 45 C4 46 49 4C  LOWE.FIL
        .byte   $45,$20,$41,$4C,$52,$45,$41,$44 ; CA20 45 20 41 4C 52 45 41 44  E ALREAD
        .byte   $59,$20,$45,$58,$49,$53,$54,$D3 ; CA28 59 20 45 58 49 53 54 D3  Y EXIST.
        .byte   $44,$49,$53,$4B,$20,$46,$55,$4C ; CA30 44 49 53 4B 20 46 55 4C  DISK FUL
        .byte   $CC,$49,$4C,$4C,$45,$47,$41,$4C ; CA38 CC 49 4C 4C 45 47 41 4C  .ILLEGAL
        .byte   $20,$51,$55,$41,$4E,$54,$49,$54 ; CA40 20 51 55 41 4E 54 49 54   QUANTIT
        .byte   $D9,$53,$59,$4E,$54,$41,$D8,$55 ; CA48 D9 53 59 4E 54 41 D8 55  .SYNTA.U
        .byte   $4E,$4B,$4E,$4F,$57,$4E,$20,$46 ; CA50 4E 4B 4E 4F 57 4E 20 46  NKNOWN F
        .byte   $4F,$52,$4D,$41,$D4,$D4,$54,$59 ; CA58 4F 52 4D 41 D4 D4 54 59  ORMA..TY
        .byte   $50,$45,$20,$4D,$49,$53,$4D,$41 ; CA60 50 45 20 4D 49 53 4D 41  PE MISMA
        .byte   $54,$43,$C8,$46,$49,$4C,$45,$20 ; CA68 54 43 C8 46 49 4C 45 20  TC.FILE 
        .byte   $54,$59,$50,$45,$20,$4D,$49,$53 ; CA70 54 59 50 45 20 4D 49 53  TYPE MIS
        .byte   $4D,$41,$54,$43,$C8,$46,$49,$4C ; CA78 4D 41 54 43 C8 46 49 4C  MATC.FIL
        .byte   $45,$20,$4E,$4F,$54,$20,$4F,$50 ; CA80 45 20 4E 4F 54 20 4F 50  E NOT OP
        .byte   $45,$CE,$46,$49,$4C,$45,$20,$41 ; CA88 45 CE 46 49 4C 45 20 41  E.FILE A
        .byte   $4C,$52,$45,$41,$44,$59,$20,$4F ; CA90 4C 52 45 41 44 59 20 4F  LREADY O
        .byte   $50,$45,$CE,$45,$4E,$44,$20,$4F ; CA98 50 45 CE 45 4E 44 20 4F  PE.END O
        .byte   $46,$20,$46,$49,$4C,$C5,$42,$41 ; CAA0 46 20 46 49 4C C5 42 41  F FIL.BA
        .byte   $44,$20,$52,$45,$43,$4F,$52,$44 ; CAA8 44 20 52 45 43 4F 52 44  D RECORD
        .byte   $20,$4E,$55,$4D,$42,$45,$D2,$46 ; CAB0 20 4E 55 4D 42 45 D2 46   NUMBE.F
        .byte   $49,$45,$4C,$44,$20,$4F,$56,$45 ; CAB8 49 45 4C 44 20 4F 56 45  IELD OVE
        .byte   $52,$46,$4C,$4F,$D7,$53,$54,$52 ; CAC0 52 46 4C 4F D7 53 54 52  RFLO.STR
        .byte   $49,$4E,$47,$20,$54,$4F,$4F,$20 ; CAC8 49 4E 47 20 54 4F 4F 20  ING TOO 
        .byte   $4C,$4F,$4E,$C7,$55,$4E,$4B,$4E ; CAD0 4C 4F 4E C7 55 4E 4B 4E  LON.UNKN
        .byte   $4F,$57,$4E,$20,$46,$49,$45,$4C ; CAD8 4F 57 4E 20 46 49 45 4C  OWN FIEL
        .byte   $44,$20,$4E,$41,$4D,$C5,$C5,$0A ; CAE0 44 20 4E 41 4D C5 C5 0A  D NAM...
        .byte   $0D,$54,$52,$41,$43,$4B,$BA,$20 ; CAE8 0D 54 52 41 43 4B BA 20  .TRACK. 
        .byte   $53,$45,$43,$54,$4F,$52,$BA,$20 ; CAF0 53 45 43 54 4F 52 BA 20  SECTOR. 
        .byte   $57,$52,$49,$54,$45,$20,$46,$41 ; CAF8 57 52 49 54 45 20 46 41  WRITE FA
        .byte   $55,$4C,$54,$A0,$20,$52,$45,$41 ; CB00 55 4C 54 A0 20 52 45 41  ULT. REA
        .byte   $44,$20,$46,$41,$55,$4C,$54,$A0 ; CB08 44 20 46 41 55 4C 54 A0  D FAULT.
        .byte   $0A,$0D,$20,$42,$52,$45,$41,$4B ; CB10 0A 0D 20 42 52 45 41 4B  .. BREAK
        .byte   $20,$4F,$4E,$20,$42,$59,$54,$45 ; CB18 20 4F 4E 20 42 59 54 45   ON BYTE
        .byte   $20,$A3,$0D,$0A,$44,$72,$69,$76 ; CB20 20 A3 0D 0A 44 72 69 76   ...Driv
        .byte   $65,$A0,$20,$56,$34,$20,$28,$4D ; CB28 65 A0 20 56 34 20 28 4D  e. V4 (M
        .byte   $73,$74,$29,$A0,$20,$66,$72,$65 ; CB30 73 74 29 A0 20 66 72 65  st). fre
        .byte   $65,$20,$73,$65,$63,$74,$6F,$72 ; CB38 65 20 73 65 63 74 6F 72  e sector
        .byte   $73,$20,$A8,$20,$46,$69,$6C,$65 ; CB40 73 20 A8 20 46 69 6C 65  s . File
        .byte   $73,$A0,$20,$49,$53,$20,$50,$52 ; CB48 73 A0 20 49 53 20 50 52  s. IS PR
        .byte   $4F,$54,$45,$43,$54,$45,$C4,$20 ; CB50 4F 54 45 43 54 45 C4 20  OTECTE. 
        .byte   $28,$59,$29,$65,$73,$20,$6F,$72 ; CB58 28 59 29 65 73 20 6F 72  (Y)es or
        .byte   $20,$28,$4E,$29,$6F,$BA,$20,$44 ; CB60 20 28 4E 29 6F BA 20 44   (N)o. D
        .byte   $45,$4C,$45,$54,$45,$44,$0D,$8A ; CB68 45 4C 45 54 45 44 0D 8A  ELETED..
        .byte   $49,$4E,$53,$45,$52,$54,$20,$4D ; CB70 49 4E 53 45 52 54 20 4D  INSERT M
        .byte   $41,$53,$54,$45,$52,$A0,$41,$4E ; CB78 41 53 54 45 52 A0 41 4E  ASTER.AN
        .byte   $44,$20,$50,$52,$45,$53,$53,$20 ; CB80 44 20 50 52 45 53 53 20  D PRESS 
        .byte   $27,$52,$45,$54,$55,$52,$4E,$A7 ; CB88 27 52 45 54 55 52 4E A7  'RETURN.
        .byte   $20,$41,$4C,$52,$45,$41,$44,$59 ; CB90 20 41 4C 52 45 41 44 59   ALREADY
        .byte   $20,$45,$58,$49,$53,$54,$53,$0A ; CB98 20 45 58 49 53 54 53 0A   EXISTS.
        .byte   $8D,$20,$2D,$2D,$3E,$A0,$55,$53 ; CBA0 8D 20 2D 2D 3E A0 55 53  . -->.US
        .byte   $45,$52,$A0,$20,$56,$34,$20,$28 ; CBA8 45 52 A0 20 56 34 20 28  ER. V4 (
        .byte   $53,$6C,$76,$29,$A0,$20,$28,$54 ; CBB0 53 6C 76 29 A0 20 28 54  Slv). (T
        .byte   $79,$70,$65,$BD,$29,$A0,$20,$44 ; CBB8 79 70 65 BD 29 A0 20 44  ype.). D
        .byte   $49,$53,$43,$20,$49,$4E,$20,$44 ; CBC0 49 53 43 20 49 4E 20 44  ISC IN D
        .byte   $52,$49,$56,$45,$A0
	
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
        ldy     #$03                            ; CFEA A0 03                    ..
LCFEC:  sty     SEDORIC_XRWTS_RETRY             ; CFEC 8C 06 C0                 ...
        ldy     #$08                            ; CFEF A0 08                    ..
        sty     SEDORIC_NUMBER_OF_RETRY         ; CFF1 8C 07 C0                 ...
LCFF4:  pha                                     ; CFF4 48                       H
        sei                                     ; CFF5 78                       x
        stx     SEDORIC_TYPE_OF_ERROR           ; CFF6 8E 05 C0                 ...
LCFF9:  ldy     SEDORIC_DRIVE                   ; CFF9 AC 00 C0                 ...  Select Drive
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
        beq     read_data                       ; D06B F0 06                    ..
        and     #$20                            ; D06D 29 20                    ) 
        bne     write_data                      ; D06F D0 14                    ..
        nop                                     ; D071 EA                       .
        nop                                     ; D072 EA                       .
read_data:
        lda     MICRODISC_DRQ                   ; D073 AD 18 03                 ...
        bmi     read_data                       ; D076 30 FB                    0.
        lda     MICRODISC_FDC_DATA              ; D078 AD 13 03                 ...
        sta     (SEDORIC_TRAV1),y               ; D07B 91 F3                    ..
        iny                                     ; D07D C8                       .
        bne     read_data                       ; D07E D0 F3                    ..
        inc     SEDORIC_TRAV2                   ; D080 E6 F4                    ..
        jmp     read_data                       ; D082 4C 73 D0                 Ls.
	
; ----------------------------------------------------------------------------
write_data:
        lda     MICRODISC_DRQ                   ; D085 AD 18 03                 ...
        bmi     write_data                      ; D088 30 FB                    0.
        lda     (SEDORIC_TRAV1),y               ; D08A B1 F3                    ..
        sta     MICRODISC_FDC_DATA              ; D08C 8D 13 03                 ...
        iny                                     ; D08F C8                       .
        bne     write_data                      ; D090 D0 F3                    ..
        inc     SEDORIC_TRAV2                   ; D092 E6 F4                    ..
        jmp     write_data                      ; D094 4C 85 D0                 L..

		
		.byt  $EA ; CC90 D0 F3 E6 F4 4C 85 D0 EA  ....L...
        .byte   $EA,$EA,$2C,$14,$03,$10,$03,$4C ; CC98 EA EA 2C 14 03 10 03 4C  ..,....L
        .byte   $F5,$04,$68,$68,$68,$AD,$FB,$04 ; CCA0 F5 04 68 68 68 AD FB 04  ..hhh...
        .byte   $8D,$14,$03,$AC,$00,$C0,$AD,$11 ; CCA8 8D 14 03 AC 00 C0 AD 11  ........
        .byte   $03,$99,$26,$D1,$18,$AD,$10,$03 ; CCB0 03 99 26 D1 18 AD 10 03  ..&.....
        .byte   $29,$5C,$A8,$AE,$05,$C0,$30,$02 ; CCB8 29 5C A8 AE 05 C0 30 02  )\....0.
        .byte   $A0,$00,$8C,$17,$C0,$29,$40,$D0 ; CCC0 A0 00 8C 17 C0 29 40 D0  .....)@.
        .byte   $0F,$98,$29,$10,$F0,$0D,$CE,$06 ; CCC8 0F 98 29 10 F0 0D CE 06  ..).....
        .byte   $C0,$F0,$05,$20,$E8,$D0,$90,$0D ; CCD0 C0 F0 05 20 E8 D0 90 0D  ... ....
        .byte   $38,$68,$60,$98,$29,$0C,$F0,$F9 ; CCD8 38 68 60 98 29 0C F0 F9  8h`.)...
        .byte   $CE,$07,$C0,$F0,$F3,$4C,$F9,$CF ; CCE0 CE 07 C0 F0 F3 4C F9 CF  .....L..
        .byte   $8A,$48,$AD,$03,$C0,$48,$AD,$04 ; CCE8 8A 48 AD 03 C0 48 AD 04  .H...H..
        .byte   $C0,$48,$A9,$60,$A0,$C0,$8D,$03 ; CCF0 C0 48 A9 60 A0 C0 8D 03  .H.`....
        .byte   $C0,$8C,$04,$C0,$AD,$06,$C0,$A2 ; CCF8 C0 8C 04 C0 AD 06 C0 A2  ........
        .byte   $C0,$A0,$01,$20,$EC,$CF,$8D,$06 ; CD00 C0 A0 01 20 EC CF 8D 06  ... ....
        .byte   $C0,$68,$8D,$04,$C0,$68,$8D,$03 ; CD08 C0 68 8D 04 C0 68 8D 03  .h...h..
        .byte   $C0,$B0,$09,$AD,$12,$03,$AC,$00 ; CD10 C0 B0 09 AD 12 03 AC 00  ........
        .byte   $C0,$99,$26,$D1,$68,$AA,$8E,$05 ; CD18 C0 99 26 D1 68 AA 8E 05  ..&.h...
        .byte   $C0,$60


; ----------------------------------------------------------------------------

LD122
		.byt   $84,$A4
		.byt   $C4,$E4
LD126		
		.byt   $50,$50
        .byt   $50,$50
		
  
		
		
		.byt  $50,$90,$05,$A9,$D0,$8D ; CD28 50 50 50 90 05 A9 D0 8D  PPP.....
        .byte   $10,$03,$38,$4C,$F8,$04,$86,$F3 ; CD30 10 03 38 4C F8 04 86 F3  ..8L....
        .byte   $A2,$04,$20,$6C,$D3,$38,$A6,$F3 ; CD38 A2 04 20 6C D3 38 A6 F3  .. l.8..
        .byte   $A5,$F2,$E9,$02,$B0,$01,$CA,$48 ; CD40 A5 F2 E9 02 B0 01 CA 48  .......H
        .byte   $8A,$20,$13,$D6,$68,$20,$13,$D6 ; CD48 8A 20 13 D6 68 20 13 D6  . ..h ..
        .byte   $58,$A2,$FF,$9A,$20,$D8,$D5,$AD ; CD50 58 A2 FF 9A 20 D8 D5 AD  X... ...
        .byte   $C4,$A0,$C4,$60
	
			; ----------------------------------------------------------------------------
; Décale un bloc mémoire vers le haut
SEDORIC_SHIFT_BLOCK_MEMORY_UP:
        jsr     SEDORIC_XROM                    ; D15C 20 D8 D5                  ..
; adresse ROM 1.0 adresse ROM 1.1
adress_return:
        .byte   $F8,$C3,$F4,$C3                 ; D15F F8 C3 F4 C3              ....
; ----------------------------------------------------------------------------
        rts     
		
		
		.byt   $20,$D8,$D5,$48 ; CD60 C3 F4 C3 60 20 D8 D5 48  ...` ..H
        .byte   $C4,$44,$C4,$60,$A2,$4D,$2C,$A2 ; CD68 C4 44 C4 60 A2 4D 2C A2  .D.`.M,.
        .byte   $A3,$20,$D8,$D5,$85,$C4,$7E,$C4 ; CD70 A3 20 D8 D5 85 C4 7E C4  . ....~.
        .byte   $20,$D8,$D5,$A3,$C4,$96,$C4,$60 ; CD78 20 D8 D5 A3 C4 96 C4 60   ......`
        .byte   $20,$D8,$D5,$B5,$C4,$A8,$C4,$60 ; CD80 20 D8 D5 B5 C4 A8 C4 60   ......`
        .byte   $A5,$9A,$A4,$9B,$20,$D8,$D5,$73 ; CD88 A5 9A A4 9B 20 D8 D5 73  .... ..s
        .byte   $C5,$63,$C5,$60
		
		
		
		.byt   $20,$D8,$D5,$0A ; CD90 C5 63 C5 60 20 D8 D5 0A  .c.` ...
        .byte   $C6,$FA,$C5,$60
		
		
LD19C:  jsr     SEDORIC_XROM                    ; D19C 20 D8 D5                  ..
		.byt $DE,$C6,$B3,$C6
		rts



                              ; D163 60                       `
		
		
		.byt   $20,$D8,$D5,$EE ; CDA0 C6 B3 C6 60 20 D8 D5 EE  ...` ...
        .byte   $C6,$C3,$C6,$60,$20,$D8,$D5,$65 ; CDA8 C6 C3 C6 60 20 D8 D5 65  ...` ..e
        .byte   $C7,$3A,$C7,$60,$20,$D8,$D5,$99 ; CDB0 C7 3A C7 60 20 D8 D5 99  . .` ...
        .byte   $C7,$6C,$C7,$60,$20,$D8,$D5,$40 ; CDB8 C7 6C C7 60 20 D8 D5 40  .l.` ..@
        .byte   $C8,$16,$C8,$60,$20,$D8,$D5,$3D ; CDC0 C8 16 C8 60 20 D8 D5 3D  ...` .. 
        .byte   $C8,$2F,$C8,$60,$20,$D8,$D5,$1F ; CDC8 C8 2F C8 60 20 D8 D5 1F  ./.` ...
        .byte   $C9,$52,$C9,$60,$20,$D8,$D5,$F1 ; CDD0 C9 52 C9 60 20 D8 D5 F1  .R.` ...
        .byte   $C9,$23,$CA,$60,$20,$D8,$D5,$1C ; CDD8 C9 23 CA 60 20 D8 D5 1C  .#.` ...
        .byte   $CA,$4E,$CA,$20,$D8,$D5,$0D,$CA ; CDE0 CA 4E CA 20 D8 D5 0D CA  .N. ....
        .byte   $3F,$CA,$60,$20,$D8,$D5,$41,$CA ; CDE8 3F CA 60 20 D8 D5 41 CA  ?.` ..A.
        .byte   $73,$CA,$60,$20,$9E,$D3,$20,$D8 ; CDF0 73 CA 60 20 9E D3 20 D8  s.` .. .
        .byte   $D5,$98,$CA,$E2,$CA,$60,$20,$D8 ; CDF8 D5 98 CA E2 CA 60 20 D8  .....` .
        .byte   $D5,$EF,$CA,$39,$CB,$60
		


LD206:  jsr     SEDORIC_XROM                    ; D206 20 D8 D5                ..
		.byt $9F,$CB,$F0,$CB
        rts                                     ; D20D 60                       `
		
		
		
		;.byt  $20,$D8 ; CE00 D5 EF CA 39 CB 60 20 D8  ...9.` .
        ;.byte   $D5,$9F,$CB,$F0,$CB,$60
		
		
; ----------------------------------------------------------------------------
LD20E:  jsr     SEDORIC_XROM                    ; D20E 20 D8 D5                  ..
		.byt $12,$CC,$D9,$CC					; FIXME
        rts                                     ; D215 60   		

		.byt  $20,$24 ; CE10 D5 12 CC D9 CC 60 20 24  .....` $
        .byte   $D2,$18,$24,$38,$20,$D8,$D5,$7D ; CE18 D2 18 24 38 20 D8 D5 7D  ..$8 ..}
        .byte   $CE,$09,$CF,$60,$20,$D8,$D5,$8B ; CE20 CE 09 CF 60 20 D8 D5 8B  ...` ...
        .byte   $CE,$17,$CF,$60,$A9,$2C,$20,$D8 ; CE28 CE 17 CF 60 A9 2C 20 D8  ...`., .
        .byte   $D5,$DB,$CF,$67,$D0,$4C,$A1,$D3 ; CE30 D5 DB CF 67 D0 4C A1 D3  ...g.L..
        .byte   $20,$D8,$D5,$FC,$D0,$88,$D1,$85 ; CE38 20 D8 D5 FC D0 88 D1 85   .......
        .byte   $D3,$84,$D4,$60,$20,$D8,$D5,$58 ; CE40 D3 84 D4 60 20 D8 D5 58  ...` ..X
        .byte   $D1,$E8,$D1,$60,$20,$D8,$D5,$17 ; CE48 D1 E8 D1 60 20 D8 D5 17  ...` ...
        .byte   $D2,$A9,$D2,$60,$20,$D8,$D5,$ED ; CE50 D2 A9 D2 60 20 D8 D5 ED  ...` ...
        .byte   $D3,$99,$D4,$60,$20,$D8,$D5,$19 ; CE58 D3 99 D4 60 20 D8 D5 19  ...` ...
        .byte   $D4,$D2,$D4,$60


LD264:  jsr     SEDORIC_XROM                    ; D264 20 D8 D5                  ..
		.byt    $F0,$D4,$AB,$D5
		rts
		
		
		
		.byt   $20,$D8,$D5,$C7 ; CE68 D4 AB D5 60 20 D8 D5 C7  ...` ...
        .byte   $D6,$82,$D7,$60,$20,$1B,$D2,$20 ; CE70 D6 82 D7 60 20 1B D2 20  ...` .. 
        .byte   $D8,$D5,$15,$D7,$D0,$D7,$60,$20 ; CE78 D8 D5 15 D7 D0 D7 60 20  ......` 
        .byte   $16,$D2,$20,$D8,$D5,$10,$D8,$CB ; CE80 16 D2 20 D8 D5 10 D8 CB  .. .....
        .byte   $D8,$60,$20,$D8,$D5,$6B,$D8,$26 ; CE88 D8 60 20 D8 D5 6B D8 26  .` ..k.&
                             ; D321 60                       `
     

		.byte   $D9,$60
		
		.byt    $20,$D8,$D5,$96,$D9,$22 ; CE90 D9 60 20 D8 D5 96 D9 22  .` ...."
        .byte   $DA,$60,$20,$D8,$D5,$80,$DA,$0B ; CE98 DA 60 20 D8 D5 80 DA 0B  .` .....
        .byte   $DB,$60,$20,$D8,$D5,$97,$DA,$22 ; CEA0 DB 60 20 D8 D5 97 DA 22  .` ...."
        .byte   $DB,$60,$20,$D8,$D5,$B7,$DC,$ED ; CEA8 DB 60 20 D8 D5 B7 DC ED  .` .....
        .byte   $DC,$60,$20,$D8,$D5,$E0,$DD,$E4 ; CEB0 DC 60 20 D8 D5 E0 DD E4  .` .....
        .byte   $DD,$60,$20,$D8,$D5,$73,$DE,$7B ; CEB8 DD 60 20 D8 D5 73 DE 7B  .` ..s.{
        .byte   $DE,$60,$20,$D8,$D5,$A5,$DE,$AD ; CEC0 DE 60 20 D8 D5 A5 DE AD  .` .....
        .byte   $DE,$60
		

LD2CA:  jsr     SEDORIC_XROM                    ; D2CA 20 D8 D5                  ..
		.byt 	$D5,$D8,$40 ; CEC8 DE 60 20 D8 D5 D5 D8 40  .` ....@
        .byte   $DF                             ; D2D0 DF                       .
        rts                                     ; D2D1 60           		

LD2D2:
		jsr     SEDORIC_XROM                    ; D2CA 20 D8 D5                  ..
		.byte   $D1,$E0,$D5 ; CED0 DF 60 20 D8 D5 D1 E0 D5  .` .....
        .byte   $E0
		rts
		

		
		.byt  $20,$D8,$D5,$6D,$E2,$71 ; CED8 E0 60 20 D8 D5 6D E2 71  .` ..m.q
        .byte   $E2,$60,$20,$D8,$D5,$79,$E3,$7D ; CEE0 E2 60 20 D8 D5 79 E3 7D  .` ..y.}
        .byte   $E3,$60,$20,$D8,$D5,$87,$E3,$8B ; CEE8 E3 60 20 D8 D5 87 E3 8B  .` .....
        .byte   $E3,$60,$20,$D8,$D5,$8E,$E3,$92 ; CEF0 E3 60 20 D8 D5 8E E3 92  .` .....
        .byte   $E3,$60,$20,$D8,$D5,$9D,$E7,$53 ; CEF8 E3 60 20 D8 D5 9D E7 53  .` ....S
        .byte   $E8,$60



; Saisit une touche: si touche frappée alors N = 1 et A = code ASCII sinon N = 0
SEDORIC_KEYBOARD_WAIT:
        jsr     SEDORIC_XROM                    ; D302 20 D8 D5                  ..
		.byt $05,$E9,$78,$eb ; FIXME
        rts    

		.byt 	$20,$D8,$D5,$C7,$EC,$E0 ; CF08 EB 60 20 D8 D5 C7 EC E0  .` .....
        .byte   $ED,$60
		
		.byt    $20,$D8,$D5,$79,$F0,$10 ; CF10 ED 60 20 D8 D5 79 F0 10  .` ..y..
        .byte   $F1,$60



LD31A:  jsr     SEDORIC_XROM                    ; D31A 20 D8 D5                  ..
		.byt    $94,$F4,$EF,$F4
        rts        

LD322:  jsr     SEDORIC_XROM                    ; D322 20 D8 D5                  ..
		.byt    $35,$F5,$90 ; CF20 F4 60 20 D8 D5 35 F5 90  .` ..5..
        .byte   $F5
        rts                                     ; D329 60        
	
LD32A:
		jsr     SEDORIC_XROM                    ; D32A 20 D8 D5                  ..
		.byt    $CB,$F7,$01,$F8 ; FIXME
		rts
		

LD332:  jsr     SEDORIC_XROM                    ; D332 20 D8 D5                  ..

        .byte   $3E,$F9,$82,$F9
        rts                                     ; D339 60                       `

		
		

LD33A:  jsr     SEDORIC_XROM                    ; D33A 20 D8 D5                  ..
		.byt   $E2,$00,$E2 ; CF38 F9 60 20 D8 D5 E2 00 E2  .` .....
        .byte   $00
        rts    
		
	

		.byt  $20,$D8,$D5,$E8,$00,$E8 ; CF40 00 60 20 D8 D5 E8 00 E8  .` .....
        .byte   $00,$60
	

; ROUTINES SEDORIC D’USAGE GENERAL. Copie NOM et EXT de la table CCF7 dans BUFNOMSaisit une touche: si touche frappée alors N = 1 et A = code ASCII sinon N = 0
SEDORIC_COPY_NAME_AND_EXT_IN_BUFNOM:
        ldy     #$09                            ; D34A A0 09                    ..

        .byte   $2C                             ; D34C 2C                       ,
; ----------------------------------------------------------------------------
; X

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


LD36C:  lda     #$E6                            ; D36C A9 E6                    .. FIXME
        ldy     #$CE                            ; D36E A0 CE                    .. FIXME 
        bne     LD376                           ; D370 D0 04                    ..
LD372:  lda     #$BE                            ; D372 A9 BE                    .. FIXME
        ldy     #$CD                            ; D374 A0 CD                    .. FIXME
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
		
			 
		
		
	
		.byt   $20,$42 ; CF98 20 3A D3 4C A1 D3 20 42    .L.. B
        .byte   $D3
		

LD3A1:  php                                     ; D3A1 08                       .
        cmp     #$61                            ; D3A2 C9 61                    .a
        bcc     LD3AC                           ; D3A4 90 06                    ..
        cmp     #$7B                            ; D3A6 C9 7B                    .{
        bcs     LD3AC                           ; D3A8 B0 02                    ..
        and     #$DF                            ; D3AA 29 DF                    ).
LD3AC:  plp                                     ; D3AC 28                       (
        rts          
		
		.byt  $A2,$00 ; CFA8 B0 02 29 DF 28 60 A2 00  ..).(`..
        .byte   $8E,$FD,$04,$BA,$8E,$23,$C0,$A5 ; CFB0 8E FD 04 BA 8E 23 C0 A5  .....#..
        .byte   $E9,$A4,$EA,$8D,$1F,$C0,$8C,$20 ; CFB8 E9 A4 EA 8D 1F C0 8C 20  ....... 
        .byte   $C0,$20,$9E,$D3,$E9,$41,$A0,$1A ; CFC0 C0 20 9E D3 E9 41 A0 1A  . ...A..
        .byte   $90,$08,$C9,$1A,$B0,$04,$A8,$20 ; CFC8 90 08 C9 1A B0 04 A8 20  ....... 
        .byte   $3A,$D3,$98,$0A,$0A,$A8,$B9,$BB ; CFD0 3A D3 98 0A 0A A8 B9 BB   .......
        .byte   $CB,$85,$18,$B9,$BC,$CB,$85,$19 ; CFD8 CB 85 18 B9 BC CB 85 19  ........
        .byte   $B9,$BE,$CB,$85,$F2,$BE,$BD,$CB ; CFE0 B9 BE CB 85 F2 BE BD CB  ........
        .byte   $C6

		
		.byt  $F2,$30,$3C,$A0,$FF,$C8,$B1 ; CFE8 C6 F2 30 3C A0 FF C8 B1  ..0<....
        .byte   $18,$F0,$24,$85,$F3,$B1,$E9,$C9 ; CFF0 18 F0 24 85 F3 B1 E9 C9  ..$.....
        .byte   $61,$90,$06,$C9,$7B,$B0,$02,$29 ; CFF8 61 90 06 C9 7B B0 02 29  a...{..)
        .byte   $DF,$C5,$F3,$F0,$E9,$C8,$B1,$18 ; D000 DF C5 F3 F0 E9 C8 B1 18  ........
        .byte   $D0,$FB,$E8,$38,$98,$65,$18,$85 ; D008 D0 FB E8 38 98 65 18 85  ...8.e..
        .byte   $18,$90,$D5,$E6,$19,$B0,$D1,$8A ; D010 18 90 D5 E6 19 B0 D1 8A  ........
        .byte   $0A,$AA,$BD,$28,$CC,$48,$BD,$27 ; D018 0A AA BD 28 CC 48 BD 27  ...(.H.'
        .byte   $CC,$48,$20,$E3,$D1,$4C,$9E,$D3 ; D020 CC 48 20 E3 D1 4C 9E D3  .H ..L..
        .byte   $AD,$1F,$C0,$AC,$20,$C0,$85,$E9 ; D028 AD 1F C0 AC 20 C0 85 E9  .... ...
        .byte   $84,$EA,$20,$9E,$D3,$F0,$12,$A0 ; D030 84 EA 20 9E D3 F0 12 A0  .. .....
        .byte   $FF,$C8,$B1,$E9,$F0,$0C,$C9,$3A ; D038 FF C8 B1 E9 F0 0C C9 3A  ....... 
        .byte   $F0,$08,$C9,$D3,$D0,$F3,$4C,$BA ; D040 F0 08 C9 D3 D0 F3 4C BA  ......L.
        .byte   $F5,$60,$A9,$00,$4C,$F9,$DF,$38 ; D048 F5 60 A9 00 4C F9 DF 38  .`..L..8
        .byte   $24,$18,$A9,$80,$08,$85,$F4,$46 ; D050 24 18 A9 80 08 85 F4 46  $......F
        .byte   $F5,$AD,$09,$C0,$8D,$28,$C0,$A2 ; D058 F5 AD 09 C0 8D 28 C0 A2  .....(..
        .byte   $0B,$A9,$20,$85,$F3,$9D,$29,$C0 ; D060 0B A9 20 85 F3 9D 29 C0  .. ...).
        .byte   $CA,$10,$FA,$28,$10,$62,$B0,$3B ; D068 CA 10 FA 28 10 62 B0 3B  ...(.b.;
        .byte   $20,$9E,$D3,$D0,$0C,$A9,$0C,$85 ; D070 20 9E D3 D0 0C A9 0C 85   .......
        .byte   $F2,$A2,$00,$20,$B5,$D5,$4C,$03 ; D078 F2 A2 00 20 B5 D5 4C 03  ... ..L.
        .byte   $D5,$C9,$2C,$F0,$F0,$C9,$C3,$F0 ; D080 D5 C9 2C F0 F0 C9 C3 F0  ..,.....
        .byte   $EC,$38,$E9,$41,$A8,$C9,$04,$B0 ; D088 EC 38 E9 41 A8 C9 04 B0  .8.A....
        .byte   $1A,$20,$98,$D3,$F0,$08,$C9,$C3 ; D090 1A 20 98 D3 F0 08 C9 C3  . ......
        .byte   $F0,$04,$C9,$2C,$D0,$05,$8C,$28 ; D098 F0 04 C9 2C D0 05 8C 28  ...,...(
        .byte   $C0,$B0,$D2,$A5,$E9,$D0,$02,$C6 ; D0A0 C0 B0 D2 A5 E9 D0 02 C6  ........
        .byte   $EA,$C6,$E9,$20,$24,$D2,$20,$74 ; D0A8 EA C6 E9 20 24 D2 20 74  ... $. t
        .byte   $D2,$85,$F3,$A8,$88,$30,$7B,$B1 ; D0B0 D2 85 F3 A8 88 30 7B B1  .....0{.
        .byte   $91,$C9,$20,$D0,$02,$C6,$F3,$88 ; D0B8 91 C9 20 D0 02 C6 F3 88  .. .....
        .byte   $10,$F5,$A5,$E9,$48,$A5,$EA,$48 ; D0C0 10 F5 A5 E9 48 A5 EA 48  ....H..H
        .byte   $A5,$91,$85,$E9,$A5,$92,$85,$EA ; D0C8 A5 91 85 E9 A5 92 85 EA  ........
        .byte   $20,$9E,$D3,$E9,$41,$AA,$C9,$04 ; D0D0 20 9E D3 E9 41 AA C9 04   ...A...
        .byte   $B0,$2F,$A0,$01,$B1,$E9,$C9,$2D ; D0D8 B0 2F A0 01 B1 E9 C9 2D  ./.....-
        .byte   $F0,$04,$C9,$CD,$D0,$23,$8E,$28 ; D0E0 F0 04 C9 CD D0 23 8E 28  .....#.(
        .byte   $C0,$C6,$F3,$C6,$F3,$F0,$4E,$20 ; D0E8 C0 C6 F3 C6 F3 F0 4E 20  ......N 
        .byte   $98,$D3,$20,$98,$D3,$D0,$12,$24 ; D0F0 98 D3 20 98 D3 D0 12 24  .. ....$
        .byte   $F4,$30,$37,$68,$68,$20,$BD,$D7 ; D0F8 F4 30 37 68 68 20 BD D7  .07hh ..
        .byte   $20,$B9,$E5,$20,$BD,$D7,$4C,$9E ; D100 20 B9 E5 20 BD D7 4C 9E   .. ..L.
        .byte   $D3,$A2,$00,$A9,$09,$85,$F2,$46 ; D108 D3 A2 00 A9 09 85 F2 46  .......F
        .byte   $F6,$20,$9E,$D3,$24,$F6,$30,$12 ; D110 F6 20 9E D3 24 F6 30 12  . ..$.0.
        .byte   $C9,$2E,$D0,$0E,$66,$F6,$E0,$0A ; D118 C9 2E D0 0E 66 F6 E0 0A  ....f...
        .byte   $B0,$1B,$A9,$0C,$85,$F2,$A2,$08 ; D120 B0 1B A9 0C 85 F2 A2 08  ........
        .byte   $D0,$15,$C9,$2C,$D0,$06,$24,$F4 ; D128 D0 15 C9 2C D0 06 24 F4  ...,..$.
        .byte   $10,$27,$30,$78,$20,$67,$D5,$9D ; D130 10 27 30 78 20 67 D5 9D  .'0x g..
        .byte   $29,$C0,$98,$E4,$F2,$B0,$6D,$C6 ; D138 29 C0 98 E4 F2 B0 6D C6  ).....m.
        .byte   $F3,$F0,$10,$E8,$24,$F5,$30,$CC ; D140 F3 F0 10 E8 24 F5 30 CC  ....$.0.
        .byte   $20,$98,$D3,$D0,$C7,$24,$F4,$10 ; D148 20 98 D3 D0 C7 24 F4 10   ....$..
        .byte   $08,$30,$59,$68,$85,$EA,$68,$85 ; D150 08 30 59 68 85 EA 68 85  .0Yh..h.
        .byte   $E9,$AD,$32,$C0,$C9,$20,$D0,$A3 ; D158 E9 AD 32 C0 C9 20 D0 A3  ..2.. ..
        .byte   $A2,$00,$20,$4A,$D3,$F0,$9C,$24 ; D160 A2 00 20 4A D3 F0 9C 24  .. J...$
        .byte   $F5,$30,$24,$A8,$10,$43,$85,$F5 ; D168 F5 30 24 A8 10 43 85 F5  .0$..C..
        .byte   $29,$7F,$85,$24,$A9,$E9,$A0,$C0 ; D170 29 7F 85 24 A9 E9 A0 C0  )..$....
        .byte   $85,$16,$84,$17,$A0,$00,$C6,$24 ; D178 85 16 84 17 A0 00 C6 24  .......$
        .byte   $30,$0D

		
		.byt   $E6,$16,$D0,$02,$E6,$17 ; D180 30 0D E6 16 D0 02 E6 17  0.......
        .byte   $20,$53,$04,$10,$F5,$30,$EF,$A0 ; D188 20 53 04 10 F5 30 EF A0   S...0..
        .byte   $00
		
		                ; D829 4C 53 04                 LS.
		
		.byt    $E6,$16,$D0,$02,$E6,$17,$20 ; D190 00 E6 16 D0 02 E6 17 20  ....... 
        .byte   $53,$04,$48,$A0,$01,$20,$53,$04 ; D198 53 04 48 A0 01 20 53 04  S.H.. S.
        .byte   $A8,$68,$08,$29,$7F,$28,$10,$19 ; D1A0 A8 68 08 29 7F 28 10 19  .h.).(..
        .byte   $46,$F5,$10,$17,$A2,$02,$4C,$7E ; D1A8 46 F5 10 17 A2 02 4C 7E  F.....L~
        .byte   $D6,$C9,$2A,$D0,$0E,$A9,$3F,$9D ; D1B0 D6 C9 2A D0 0E A9 3F 9D  ..*...?.
        .byte   $29,$C0,$E8,$E4,$F2,$D0,$F8,$CA ; D1B8 29 C0 E8 E4 F2 D0 F8 CA  ).......
        .byte   $60,$E6,$F3,$C9,$3F,$F0,$10,$C9 ; D1C0 60 E6 F3 C9 3F F0 10 C9  `...?...
        .byte   $30,$90,$E1,$C9,$3A,$90,$08,$C9 ; D1C8 30 90 E1 C9 3A 90 08 C9  0... ...
        .byte   $41,$90,$D9,$C9,$5B,$B0,$D5,$60 ; D1D0 41 90 D9 C9 5B B0 D5 60  A...[..`
		
		
	
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


		
		.byt    $18,$69 ; D208 A5 0C 28 4C 71 04 18 69  ..(Lq..i
        .byte   $41,$50,$17
		
		

		
XAFHEX: pha                                     ; D613 48                       H
        lsr                                  ; D614 4A                       J
        lsr                                   ; D615 4A                       J
        lsr                                   ; D616 4A                       J
        lsr                                    ; D617 4A                       J
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
.(
        bne     skip                           ; D62C D0 06                    ..
        lda     #$00                            ; D62E A9 00                    ..
        sta     $30                             ; D630 85 30                    .0
        lda     #$0D                            ; D632 A9 0D                    ..
skip:  jmp     LD20E                           ; D634 4C 0E D2                 L..
.)
	

XAFSTR: sta     $91                             ; D637 85 91                    ..
        sty     $92                             ; D639 84 92                    ..
        ldy     #$00                            ; D63B A0 00                    ..
LD63D:  lda     ($91),y                         ; D63D B1 91                    ..
        beq     LD647                           ; D63F F0 06                    ..
        jsr     XAFCAR                          ; D641 20 2A D6                  *.
        iny                                     ; D644 C8                       .
        bne     LD63D                           ; D645 D0 F6                    ..
LD647:  rts   

 
		.byte   $A2,$14,$20,$6C,$D3,$AD,$00,$C0 ; D248 A2 14 20 6C D3 AD 00 C0  .. l....
        .byte   $20,$0E,$D6,$20,$06,$D2,$A2,$0D ; D250 20 0E D6 20 06 D2 A2 0D   .. ....
        .byte   $20,$6C,$D3,$58,$20,$69,$D6,$78 ; D258 20 6C D3 58 20 69 D6 78   l.X i.x
        .byte   $08,$20,$06,$D2,$20,$06,$D2,$28 ; D260 08 20 06 D2 20 06 D2 28  . .. ..(
        .byte   $60,$20,$02,$D3,$C9,$1B,$F0,$05 ; D268 60 20 02 D3 C9 1B F0 05  ` ......
        .byte   $C9,$0D,$D0,$F5,$18,$60,$20,$69 ; D270 C9 0D D0 F5 18 60 20 69  .....` i
        .byte   $D6,$90,$FA,$68,$68,$60
		
	

LD67E:  inx                                     ; D67E E8                       .
        stx     SEDORIC_IDERROR                 ; D67F 8E FD 04                 ...
        jmp     (SEDORIC_ERRVEC)                ; D682 6C 1D C0                 l..
		
  
		.byt    $8A,$20,$DE ; D280 FD 04 6C 1D C0 8A 20 DE  ..l... .
        .byte   $D7,$A5,$A8,$A4,$A9,$C0,$FF,$D0 ; D288 D7 A5 A8 A4 A9 C0 FF D0  ........
        .byte   $01,$98,$8D,$FE,$04,$8C,$FF,$04 ; D290 01 98 8D FE 04 8C FF 04  ........
        .byte   $20,$F2,$D7,$20,$C4,$D1,$58,$2C ; D298 20 F2 D7 20 C4 D1 58 2C   .. ..X,
        .byte   $18,$C0,$10,$25,$AE,$23,$C0,$9A ; D2A0 18 C0 10 25 AE 23 C0 9A  ...%.#..
        .byte   $AD,$1B,$C0,$AC,$1C,$C0,$85,$A8 ; D2A8 AD 1B C0 AC 1C C0 85 A8  ........
        .byte   $84,$A9,$AD,$19,$C0,$AC,$1A,$C0 ; D2B0 84 A9 AD 19 C0 AC 1A C0  ........
        .byte   $85,$E9,$84,$EA,$AD,$1F,$C0,$AC ; D2B8 85 E9 84 EA AD 1F C0 AC  ........
        .byte   $20,$C0,$8D,$21,$C0,$8C,$22,$C0 ; D2C0 20 C0 8D 21 C0 8C 22 C0   ..!..".
        .byte   $60,$20,$0A,$D3,$AE,$FD,$04,$E0 ; D2C8 60 20 0A D3 AE FD 04 E0  ` ......
        .byte   $04,$D0,$33,$A2,$00,$20,$6C,$D3 ; D2D0 04 D0 33 A2 00 20 6C D3  ..3.. l.
        .byte   $AD,$01,$C0,$20,$13,$D6,$AD,$05 ; D2D8 AD 01 C0 20 13 D6 AD 05  ... ....
        .byte   $C0,$29,$F0,$49,$F0,$F0,$14,$A2 ; D2E0 C0 29 F0 49 F0 F0 14 A2  .).I....
        .byte   $01,$20,$6C,$D3,$AD,$02,$C0,$20 ; D2E8 01 20 6C D3 AD 02 C0 20  . l.... 
        .byte   $13,$D6,$A2,$03,$AD,$05,$C0,$29 ; D2F0 13 D6 A2 03 AD 05 C0 29  .......)
        .byte   $20,$F0,$02,$A2,$02,$20,$6C,$D3 ; D2F8 20 F0 02 A2 02 20 6C D3   .... l.
        .byte   $AD,$17,$C0,$20,$13,$D6,$AE,$FD ; D300 AD 17 C0 20 13 D6 AE FD  ... ....
        .byte   $04,$CA,$20,$06,$D2,$A9,$3F,$20 ; D308 04 CA 20 06 D2 A9 3F 20  .. ...? 
        .byte   $2A,$D6,$E0,$1A,$B0,$05,$20,$72 ; D310 2A D6 E0 1A B0 05 20 72  *..... r
        .byte   $D3,$30,$20,$E0,$32,$90,$15,$A2 ; D318 D3 30 20 E0 32 90 15 A2  .0 .2...
        .byte   $10,$20,$6C,$D3,$AD,$FD,$04,$A0 ; D320 10 20 6C D3 AD FD 04 A0  . l.....
        .byte   $00,$8C,$4C,$C0,$A2,$01,$20,$58 ; D328 00 8C 4C C0 A2 01 20 58  ..L... X
        .byte   $D7,$4C,$3B,$D7,$8A,$E9,$19,$AA ; D330 D7 4C 3B D7 8A E9 19 AA  .L;.....
        .byte   $20,$5C,$D3,$4C,$78,$D1

XCURON: sec                                     ; D73E 38                       8
        .byte   $24                             ; D73F 24                       $
XCUROFF:clc                                     ; D740 18                       .
        php                                     ; D741 08                       .
        lsr     BASIC11_FLG                     ; D742 4E 6A 02                 Nj.
        plp                                     ; D745 28                       (
        rol     BASIC11_FLG                     ; D746 2E 6A 02                 .j.
        lda     #$01                            ; D749 A9 01                    ..
        jmp     LD32A                           ; D74B 4C 2A D3                 L*.

		
		.byt $A2,$00 ; D348 02 A9 01 4C 2A D3 A2 00  ...L*...
        .byte   $A0,$00,$2C,$A2,$03,$2C
		

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
	
		
		.byt   $38,$24 ; D398 C8 A5 F3 4C 24 D6 38 24  ...L$.8$
        .byte   $18,$66,$F2,$A2,$0B,$BD,$29,$C0 ; D3A0 18 66 F2 A2 0B BD 29 C0  .f....).
        .byte   $C9,$3F,$F0,$05,$CA,$10,$F6,$38 ; D3A8 C9 3F F0 05 CA 10 F6 38  .?.....8
        .byte   $60,$26,$F2,$90,$FB,$A2,$05,$2C ; D3B0 60 26 F2 90 FB A2 05 2C  `&.....,
        .byte   $A2,$01,$4C,$7E,$D6,$AC,$28,$C0 ; D3B8 A2 01 4C 7E D6 AC 28 C0  ..L~..(.
        .byte   $8C,$00,$C0,$B9,$39,$C0,$F0,$F0 ; D3C0 8C 00 C0 B9 39 C0 F0 F0  ....9...
        .byte   $60,$A2,$0E,$2C,$A2,$10,$2C,$A2 ; D3C8 60 A2 0E 2C A2 10 2C A2  `..,..,.
        .byte   $12,$2C,$A2,$14,$2C,$A2,$16,$2C ; D3D0 12 2C A2 14 2C A2 16 2C  .,..,..,
        .byte   $A2,$06,$2C,$A2,$04,$2C,$A2,$00 ; D3D8 A2 06 2C A2 04 2C A2 00  ..,..,..
        .byte   $2C,$A2,$0A,$2C,$A2,$1E,$2C,$A2 ; D3E0 2C A2 0A 2C A2 1E 2C A2  ,..,..,.
        .byte   $20,$2C,$A2,$22,$2C,$A2,$24,$A0 ; D3E8 20 2C A2 22 2C A2 24 A0   ,.",.$.
        .byte   $00,$2C,$A2,$02,$2C,$A2,$08,$2C ; D3F0 00 2C A2 02 2C A2 08 2C  .,..,..,
        .byte   $A2,$18,$2C,$A2,$1A,$2C,$A2,$1C ; D3F8 A2 18 2C A2 1A 2C A2 1C  ..,..,..
        .byte   $EA,$EA,$EA,$85,$F2,$BD,$94,$CD ; D400 EA EA EA 85 F2 BD 94 CD  ........
        .byte   $85,$B4,$BD,$95,$CD,$85,$B5,$98 ; D408 85 B4 BD 95 CD 85 B5 98  ........
        .byte   $A4,$F2,$20,$CA,$D2,$20,$44,$D2 ; D410 A4 F2 20 CA D2 20 44 D2  .. .. D.
        .byte   $AA,$4C,$C2,$D2

		; ----------------------------------------------------------------------------
	
LD81C:  inc     $16                             ; D81C E6 16                    ..
        bne     LD822                           ; D81E D0 02                    ..
        inc     $17                             ; D820 E6 17                    ..
LD822:  ldy     #$00                            ; D822 A0 00                    ..
        bit     SEDORIC_COMMAND_TYPE_LAUNCHED   ; D824 2C 48 C0                 ,H.
        bvc     LD82C                           ; D827 50 03                    P.
        jmp     DO_EXEVEC 

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
        ;.byt $10,$1A 
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

LD8A6: 		
		
		
	
		ldx     LEA47                           ; D8A6 AE 47 EA                 .G. 

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
		bne     LD8E3                           ; D8DE D0 03                    
        jmp     LD963                           ; D8E0 4C 63 D9                 Lc. 

; ----------------------------------------------------------------------------
LD8E3:  iny                                     ; D8E3 C8                       .
        beq     LD952                           ; D8E4 F0 6C                    .l 
        cmp     #$20                            ; D8E6 C9 20                    . 
        ror                                 ; D8E8 6A                       j
        sta     SEDORIC_COMMAND_TYPE_LAUNCHED   ; D8E9 8D 48 C0                 .H.
        rol                                    ; D8EC 2A                       *
        bmi     LD8F3                           ; D8ED 30 04                    0.
        bcc     LD8F3                           ; D8EF 90 02                    ..
        sbc     #$20                            ; D8F1 E9 20                    . 
LD8F3:  and     #$7F                            ; D8F3 29 7F                    ).
        tax                                     ; D8F5 AA                       .
        lda     #$E9                            ; D8F6 A9 E9                    .. FIXME
        ldy     #$C0                            ; D8F8 A0 C0                    .. FIXME
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
LD90F:  lda     LCBBD,y                         ; D90F B9 BD CB                 ...FIXME 
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
        lda     #$DD                            ; D924 A9 DD                    .. FIXME
        ldy     #$C9                            ; D926 A0 C9                    .. FIXME
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
	    jsr     LD19C                           ; D98B 20 9C D1                  .. ^
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
        lsr                                  ; D9CE 4A                       J
        lsr                                    ; D9CF 4A                       J
        lsr                                    ; D9D0 4A                       J
        lsr                                    ; D9D1 4A                       J
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


; LD9EC 

; ----------------------------------------------------------------------------

LD9EC:  jsr     LDB2D                           ; D9EC 20 2D DB                  -.
        rts                                     ; D9EF 60                       `

		
        .byte   $AD,$D3,$E7,$8D,$08,$C2,$AD,$D1 ; D5F0 AD D3 E7 8D 08 C2 AD D1  ........
        .byte   $E7,$AE,$D2,$E7,$60,$CE,$08,$C2 ; D5F8 E7 AE D2 E7 60 CE 08 C2  ....`...
        .byte   $CE,$D3,$E7,$60,$AD,$D4,$E7,$D0 ; D600 CE D3 E7 60 AD D4 E7 D0  ...`....
        .byte   $0D,$AD,$D3,$E7,$8D,$08,$C2,$AD ; D608 0D AD D3 E7 8D 08 C2 AD  ........
        .byte   $D1,$E7,$AE,$D2,$E7,$60,$AD,$04 ; D610 D1 E7 AE D2 E7 60 AD 04  .....`..
        .byte   $C2,$AE,$05,$C2,$60,$EA,$EA,$EA ; D618 C2 AE 05 C2 60 EA EA EA  ....`...		
	
        .byte   $20,$7F,$D2,$08,$78,$8A,$48,$4A ; D620 20 7F D2 08 78 8A 48 4A   ...x.HJ
        .byte   $4A,$4A,$29,$07,$AA,$18,$A9,$FF ; D628 4A 4A 29 07 AA 18 A9 FF  JJ).....
        .byte   $2A,$CA,$10,$FC,$AA,$A9,$0E,$20 ; D630 2A CA 10 FC AA A9 0E 20  *...... 
        .byte   $22,$D3,$68,$29,$07,$09,$B8,$20 ; D638 22 D3 68 29 07 09 B8 20  ".h)... 
        .byte   $3A,$D8,$85,$D0,$28,$20,$EB,$D1 ; D640 3A D8 85 D0 28 20 EB D1   ...( ..
        .byte   $4E,$FC,$04,$60
		
		

XPMAP:  jsr     LE62E                           ; DA4C 20 2E E6                  .. 
        nop                                     ; DA4F EA                       .
LDA50:  jsr     LDA60                           ; DA50 20 60 DA                  `.
        ldx     SEDORIC_BUF2                    ; DA53 AE 00 C2                 ...
        inx                                     ; DA56 E8                       .
        beq     LDACD                           ; DA57 F0 74                    .t
        ldx     #$0A                            ; DA59 A2 0A                    ..
        bne     LDA7F                           ; DA5B D0 22                    ."

		
READ_SECTOR_TRACK:		
        ldx     #$C1                            ; DA5D A2 C1                    ..
		.byt	$2c
LDA60		
		ldx		#$c2
		.byt 	$2c
LDA63
		ldx 	#$c3
        stx     SEDORIC_RWBUF+1                 ; DA65 8E 04 C0                 ...
        ldx     #$00                            ; DA68 A2 00                    ..
        stx     SEDORIC_RWBUF                   ; DA6A 8E 03 C0                 ...
LDA6D:  sta     SEDORIC_TRACK                   ; DA6D 8D 01 C0                 ...
        sty     SEDORIC_SECTOR                  ; DA70 8C 02 C0                 ...
XPRSEC
LDA73		
		ldx     #$88                            ; DA73 A2 88                    ..
LDA75:  jsr     XRWTS                           ; DA75 20 CD CF                  .. 
        beq     LDACD                           ; DA78 F0 53                    .S 
		ldx     #$03                            ; DA7A A2 03                    ..
		bvc     LDA7F                           ; DA7C 50 01                    P.
        inx                                     ; DA7E E8                       .
LDA7F:  jmp     LD67E                           ; DA7F 4C 7E D6                 L~. 
	


XSCAT:  lda     $C025                           ; DA82 AD 25 C0                 .%.
        ldy     $C026                           ; DA85 AC 26 C0                 .&. 
        bne     LDA94                           ; DA88 D0 0A                    .. 
XSMAP:  jmp     LDC80                           ; DA8A 4C 80 DC                 L.. 

        
		


		
		nop                                     ; DA8D EA                       .
LDA8E:  ldx     #$C2                            ; DA8E A2 C2                    .. FIXME
        .byte   $2C                             ; DA90 2C                       ,
LDA91:  ldx     #$C1                            ; DA91 A2 C1                    .. FIXME
        .byte   $2C                             ; DA93 2C                       ,
LDA94:  ldx     #$C3                            ; DA94 A2 C3                    .. FIXME
        stx     SEDORIC_RWBUF+1                 ; DA96 8E 04 C0                 ...
        ldx     #$00                            ; DA99 A2 00                    ..
        stx     SEDORIC_RWBUF                   ; DA9B 8E 03 C0                 ...
LDA9E:  sta     SEDORIC_TRACK                   ; DA9E 8D 01 C0                 ...
        sty     SEDORIC_SECTOR                  ; DAA1 8C 02 C0                 ...
XSVSEC: ldx     #$A8                            ; DAA4 A2 A8                    ..
        bne     LDA75                           ; DAA6 D0 CD                    ..
LDAA8:  lda     #<SEDORIC_BUF1                            ; DAA8 A9 00                    .. FIXME
        ldy     #>SEDORIC_BUF1                            ; DAAA A0 C1                    .. FIXME
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
LDACE:  lda     #$C1                            ; DACE A9 C1                    .. FIXME
		.byt $2c
		lda #$c2  ;FIXME
        .byte   $2C                             ; DAD3 2C                       ,
LDAD4:  lda     #$C3                            ; DAD4 A9 C3                    .. ;FIXME
        sta     $0F                             ; DAD6 85 0F                    ..
        lda     #$00                            ; DAD8 A9 00                    ..
        sta     $0E                             ; DADA 85 0E                    ..
        ldy     #$00                            ; DADC A0 00                    ..
        tya                                     ; DADE 98                       .
LDADF:  sta     ($0E),y                         ; DADF 91 0E                    ..
        iny                                     ; DAE1 C8                       .
        bne     LDADF                           ; DAE2 D0 FB                    ..
        rts                                     ; DAE4 60                       `

		.byt  $AD,$25,$C0 ; D6E0 0E C8 D0 FB 60 AD 25 C0  ....`.%.
        .byte   $AC,$26,$C0,$20,$63,$DA
		
LDAEE:  ldx     $C027                           ; DAEE AE 27 C0                 .'.
        ldy     #$F0                            ; DAF1 A0 F0                    ..
LDAF3:  lda     $BF39,y                         ; DAF3 B9 39 BF                 .9.
        sta     SEDORIC_BUF3,x                  ; DAF6 9D 00 C3                 ...
        inx                                     ; DAF9 E8                       .
        iny                                     ; DAFA C8                       .
        bne     LDAF3                           ; DAFB D0 F6                    ..
        rts  
		
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
        rts     

LDB17:  ldy     #$F4                            ; DB17 A0 F4                    ..
LDB19:  lda     $BF35,y                         ; DB19 B9 35 BF                 .5. FIXME
        cmp     #$3F                            ; DB1C C9 3F                    .?
        beq     LDB25                           ; DB1E F0 05                    ..
        cmp     SEDORIC_BUF3,x                  ; DB20 DD 00 C3                 ...
        bne     LDB41                           ; DB23 D0 1C                    ..
LDB25:  inx                                     ; DB25 E8                       .
        iny                                     ; DB26 C8                       .
        bne     LDB19                           ; DB27 D0 F0                    ..
        ldx     $C027                           ; DB29 AE 27 C0                 .'.
        rts                                     ; DB2C 60                       `

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
	

	
	/*
		.byt   $20,$A5,$DB,$D0,$34,$4C,$6F ; D758 60 20 A5 DB D0 34 4C 6F  ` ...4Lo
        .byte   $DB
*/
		
		
		.byt  $CE,$08,$C2,$CE,$D3,$E7,$60 ; D760 DB CE 08 C2 CE D3 E7 60  .......`
        .byte   $C2,$8D,$08,$C2,$4C,$37,$E5

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
LDBBF:  rts   



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

	

.byt  $18,$24	
		
XLIBSE: sec                                     ; DC6C 38                       8
        lda     SEDORIC_BUF2+2                  ; DC6D AD 02 C2                 ...
        tax                                     ; DC70 AA                       .
        ora     SEDORIC_BUF2+3                  ; DC71 0D 03 C2                 ...
        bne     LDC7D                           ; DC74 D0 07                    .. 
        bcc     LDCD4                           ; DC76 90 5C                    .\
LDC78:  ldx     #$07                            ; DC78 A2 07                    ..
        jmp     LD67E                           ; DC7A 4C 7E D6                 L~.
	
LDC7D:  jmp     LE67F                           ; DC7D 4C 7F E6                 L..		


	 
LDC80:  bit     $2F                             ; DC80 24 2F                    $/
        bpl     LDC89                           ; DC82 10 05                    ..
        php                                     ; DC84 08                       .
        jsr     LE63A                           ; DC85 20 3A E6                  :. 
		
        plp                                     ; DC88 28                       (
LDC89:  ldy     #$02                            ; DC89 A0 02                    ..
LDC8B:  lda     #$14                            ; DC8B A9 14                    ..
        jmp     LDA8E                           ; DC8D 4C 8E DA                 L.. 
	
LDC90:  lda     #$01                            ; DC90 A9 01                    ..
        ldy     #$00                            ; DC92 A0 00                    ..
LDC94:  pha                                     ; DC94 48                       H
        and     SEDORIC_BUF2+16,x               ; DC95 3D 10 C2                 =..
        bne     LDC9F                           ; DC98 D0 05                    ..
        pla                                     ; DC9A 68                       h
        asl                                  ; DC9B 0A                       .
        iny                                     ; DC9C C8                       .
        bne     LDC94                           ; DC9D D0 F5                    ..
LDC9F:  pla                                     ; DC9F 68                       h
        eor     #$FF                            ; DCA0 49 FF                    I.
        and     SEDORIC_BUF2+16,x               ; DCA2 3D 10 C2                 =..
        sta     SEDORIC_BUF2+16,x               ; DCA5 9D 10 C2                 ...
__modify2		
LDCA8:  lda     #$00                            ; DCA8 A9 00                    ..
        sta     SEDORIC_TRAV1                   ; DCAA 85 F3                    ..
        txa                                     ; DCAC 8A                       .
LDCAD:  asl                                  ; DCAD 0A                       .
        rol     SEDORIC_TRAV1                   ; DCAE 26 F3                    &.
        asl                                   ; DCB0 0A                       .
        rol     SEDORIC_TRAV1                   ; DCB1 26 F3                    &.
        asl                                   ; DCB3 0A                       .
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
        ror                                   ; DD05 6A                       j
        lsr     SEDORIC_TRAV1                   ; DD06 46 F3                    F.
        ror                                   ; DD08 6A                       j
        lsr     SEDORIC_TRAV1                   ; DD09 46 F3                    F.
        jmp     LE6C4                           ; DD0B 4C C4 E6                 L..



	; ----------------------------------------------------------------------------
LDD0E:  lda     #$00                            ; DD0E A9 00                    ..
LDD10:  rol                                   ; DD10 2A                       *
        dey                                     ; DD11 88                       .
        bpl     LDD10                           ; DD12 10 FC                    ..
        rts                                     ; DD14 60                       `

XDETSE: jsr     LDCD6                           ; DD15 20 D6 DC                  .. 
        ora     SEDORIC_BUF2+16,x               ; DD18 1D 10 C2                 ...
        cmp     SEDORIC_BUF2+16,x               ; DD1B DD 10 C2                 ...
        beq     LDD2C                           ; DD1E F0 0C                    ..
        sta     SEDORIC_BUF2+16,x               ; DD20 9D 10 C2                 ...
        inc     SEDORIC_BUF2+2                  ; DD23 EE 02 C2                 ...
        bne     LDD2C                           ; DD26 D0 04                    ..
        inc     SEDORIC_BUF2+3                  ; DD28 EE 03 C2                 ...
        clc                                     ; DD2B 18                       .
LDD2C:  rts  
	

	
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
LDD49:  rts    

	.byt $A9,$40,$2C,$A9,$C0,$2C ; D948 18 60 A9 40 2C A9 C0 2C  .`.@,..,
        .byte   $A9,$80,$2C,$A9,$00,$20,$28,$DE ; D950 A9 80 2C A9 00 20 28 DE  ..,.. (.
        .byte   $20,$4F,$D4,$20,$9E,$D7,$20,$9E ; D958 20 4F D4 20 9E D7 20 9E   O. .. .
        .byte   $D3,$D0,$03,$4C,$0B,$DE,$20,$2C ; D960 D3 D0 03 4C 0B DE 20 2C  ...L.. ,
        .byte   $D2,$C9,$54,$D0,$1C,$20,$98,$D3 ; D968 D2 C9 54 D0 1C 20 98 D3  ..T.. ..
        .byte   $20,$FA,$D2,$8C,$56,$C0,$8D,$57 ; D970 20 FA D2 8C 56 C0 8D 57   ...V..W
        .byte   $C0,$4E,$51,$C0,$38,$2E,$51,$C0 ; D978 C0 4E 51 C0 38 2E 51 C0  .NQ.8.Q.
        .byte   $D0,$DC,$A9,$40,$8D,$51,$C0,$D0 ; D980 D0 DC A9 40 8D 51 C0 D0  ...@.Q..
        .byte   $D5,$C9,$41,$D0,$0E,$20,$98,$D3 ; D988 D5 C9 41 D0 0E 20 98 D3  ..A.. ..
        .byte   $20,$FA,$D2,$8C,$52,$C0,$8D,$53 ; D990 20 FA D2 8C 52 C0 8D 53   ...R..S
        .byte   $C0,$90,$E7,$C9,$45,$D0,$0E,$20 ; D998 C0 90 E7 C9 45 D0 0E 20  ....E.. 
        .byte   $98,$D3,$20,$FA,$D2,$8C,$54,$C0 ; D9A0 98 D3 20 FA D2 8C 54 C0  .. ...T.
        .byte   $8D,$55,$C0,$90,$D5,$C9,$C7,$D0 ; D9A8 8D 55 C0 90 D5 C9 C7 D0  .U......
        .byte   $72,$20,$98,$D3,$D0,$6D,$4E,$51 ; D9B0 72 20 98 D3 D0 6D 4E 51  r ...mNQ
        .byte   $C0,$38,$2E,$51,$C0,$30,$4C,$AD ; D9B8 C0 38 2E 51 C0 30 4C AD  .8.Q.0L.
        .byte   $52,$C0,$AC,$53,$C0,$8D,$56,$C0 ; D9C0 52 C0 AC 53 C0 8D 56 C0  R..S..V.
        .byte   $8C,$57,$C0,$90,$3E,$20,$4F,$D4 ; D9C8 8C 57 C0 90 3E 20 4F D4  .W..> O.
        .byte   $A9,$00,$A0,$C8,$8D,$52,$C0,$8C ; D9D0 A9 00 A0 C8 8D 52 C0 8C  .....R..
        .byte   $53,$C0,$A9,$DD,$A0,$C9,$D0,$1E ; D9D8 53 C0 A9 DD A0 C9 D0 1E  S.......
        .byte   $20,$4F,$D4,$AD,$1F,$02,$D0,$08 ; D9E0 20 4F D4 AD 1F 02 D0 08   O......
        .byte   $A2,$80,$A0,$BB,$A9,$DF,$D0,$06 ; D9E8 A2 80 A0 BB A9 DF D0 06  ........
        .byte   $A2,$00,$A0,$A0,$A9,$3F,$8E,$52 ; D9F0 A2 00 A0 A0 A9 3F 8E 52  .....?.R
        .byte   $C0,$8C,$53,$C0,$A0,$BF,$A2,$40 ; D9F8 C0 8C 53 C0 A0 BF A2 40  ..S....@
        .byte   $20,$3B,$DE,$A9,$C0,$8D,$4D,$C0 ; DA00 20 3B DE A9 C0 8D 4D C0   ;....M.
        .byte   $20,$9E,$D7,$38,$AD,$54,$C0,$ED ; DA08 20 9E D7 38 AD 54 C0 ED   ..8.T..
        .byte   $52,$C0,$8D,$4F,$C0,$AD,$55,$C0 ; DA10 52 C0 8D 4F C0 AD 55 C0  R..O..U.
        .byte   $ED,$53,$C0,$8D,$50,$C0,$B0,$7C ; DA18 ED 53 C0 8D 50 C0 B0 7C  .S..P..|
        .byte   $A2,$08,$2C,$A2,$09,$4C,$7E,$D6 ; DA20 A2 08 2C A2 09 4C 7E D6  ..,..L~.
        .byte   $8D,$4D,$C0,$A5,$9A,$A4,$9B,$8D ; DA28 8D 4D C0 A5 9A A4 9B 8D  .M......
        .byte   $52,$C0,$8C,$53,$C0,$A5,$9C,$A4 ; DA30 52 C0 8C 53 C0 A5 9C A4  R..S....
        .byte   $9D,$A2,$80,$8D,$54,$C0,$8C,$55 ; DA38 9D A2 80 8D 54 C0 8C 55  ....T..U
        .byte   $C0,$8E,$51,$C0,$A9,$00,$8D,$56 ; DA40 C0 8E 51 C0 A9 00 8D 56  ..Q....V
        .byte   $C0,$8D,$57,$C0,$60,$20,$4F,$D4 ; DA48 C0 8D 57 C0 60 20 4F D4  ..W.` O.
        .byte   $20,$DE,$DF,$20,$02,$D3,$10,$FB ; DA50 20 DE DF 20 02 D3 10 FB   .. ....
        .byte   $C9,$03,$F0,$F0,$C9,$13,$D0,$1C ; DA58 C9 03 F0 F0 C9 13 D0 1C  ........
        .byte   $20,$40,$D7,$A9,$D0,$A0,$BB,$8D ; DA60 20 40 D7 A9 D0 A0 BB 8D   @......
        .byte   $52,$C0,$8C,$53,$C0,$A9,$B7,$A0 ; DA68 52 C0 8C 53 C0 A9 B7 A0  R..S....
        .byte   $BF,$A2,$60,$20,$00,$DE,$20,$3E ; DA70 BF A2 60 20 00 DE 20 3E  ..` .. >
        .byte   $D7,$4C,$53

		.byt   $DE,$C9,$17,$D0,$0E ; DA78 D7 4C 53 DE C9 17 D0 0E  .LS.....
        .byte   $AC,$69,$02,$A9,$7F,$EA,$EA,$EA ; DA80 AC 69 02 A9 7F EA EA EA  .i......
        .byte   $91,$12,$A9,$09,$D0,$09,$C9,$0D ; DA88 91 12 A9 09 D0 09 C9 0D  ........
        .byte   $D0,$05,$20,$2A,$D6,$A9,$0A,$20 ; DA90 D0 05 20 2A D6 A9 0A 20  .. *... 
        .byte   $2A,$D6,$D0,$B7
		

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



LDEC5:  ldy     #$02                            ; DEC5 A0 02                    ..
LDEC7:  lda     $C032,y                         ; DEC7 B9 32 C0                 .2.
        pha                                     ; DECA 48                       H
        dey                                     ; DECB 88                       .
        bpl     LDEC7                           ; DECC 10 F9                    ..
        ldy     #$02                            ; DECE A0 02                    ..
LDED0:  lda     $C032,y                         ; DED0 B9 32 C0                 .2.
        cmp     LCCFA,y                         ; DED3 D9 FA CC                 ... 
        bne     LDEDD                           ; DED6 D0 05                    
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
;
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
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		.byt  $AD,$1F ; DBD8 EE DA 58 4C 82 DA AD 1F  ..XL....
        .byte   $02,$F0,$10,$4C,$6F,$D1,$A9,$00 ; DBE0 02 F0 10 4C 6F D1 A9 00  ...Lo...
        .byte   $A2,$03,$9D,$4D,$C0,$CA,$10,$FA ; DBE8 A2 03 9D 4D C0 CA 10 FA  ...M....
        .byte   $8E,$72,$C0,$60,$4C,$23,$DE,$A9 ; DBF0 8E 72 C0 60 4C 23 DE A9  .r.`L#..
        .byte   $80,$20,$54,$D4,$20,$9E,$D7,$20 ; DBF8 80 20 54 D4 20 9E D7 20  . T. .. 
        .byte   $E6,$DF,$20,$9E,$D3,$F0,$4B,$D0 ; DC00 E6 DF 20 9E D3 F0 4B D0  .. ...K.
        .byte   $05,$20,$98,$D3,$F0,$44,$20,$2C ; DC08 05 20 98 D3 F0 44 20 2C  . ...D ,
        .byte   $D2,$A0,$40,$C9,$56,$F0,$06,$C9 ; DC10 D2 A0 40 C9 56 F0 06 C9  ..@.V...
        .byte   $4E,$D0,$0C,$A0,$80,$AD,$4D,$C0 ; DC18 4E D0 0C A0 80 AD 4D C0  N.....M.
        .byte   $D0,$D2,$8C,$4D,$C0,$F0,$E2,$C9 ; DC20 D0 D2 8C 4D C0 F0 E2 C9  ...M....
        .byte   $4A,$D0,$09,$AD,$4E,$C0,$D0,$C4 ; DC28 4A D0 09 AD 4E C0 D0 C4  J...N...
        .byte   $A2,$80,$30,$17,$C9,$41,$D0,$BC ; DC30 A2 80 30 17 C9 41 D0 BC  ..0..A..
        .byte   $AD,$4E,$C0,$D0,$B7,$20,$98,$D3 ; DC38 AD 4E C0 D0 B7 20 98 D3  .N... ..
        .byte   $20,$FA,$D2,$8C,$52,$C0,$8D,$53 ; DC40 20 FA D2 8C 52 C0 8D 53   ...R..S
        .byte   $C0,$A2,$40,$8E,$4E,$C0,$30,$B9 ; DC48 C0 A2 40 8E 4E C0 30 B9  ..@.N.0.
        .byte   $10,$B0,$20,$E5,$E0,$2C,$4D,$C0 ; DC50 10 B0 20 E5 E0 2C 4D C0  .. ..,M.
        .byte   $50,$2B,$AD,$51,$C0,$20,$E1,$D7 ; DC58 50 2B AD 51 C0 20 E1 D7  P+.Q. ..
        .byte   $AD,$52,$C0,$AC,$53,$C0,$20,$F8 ; DC60 AD 52 C0 AC 53 C0 20 F8  .R..S. .
        .byte   $D7,$AD,$56,$C0,$AC,$57,$C0,$20 ; DC68 D7 AD 56 C0 AC 57 C0 20  ..V..W. 
        .byte   $FE,$D7,$18,$AD,$52,$C0,$6D,$4F ; DC70 FE D7 18 AD 52 C0 6D 4F  ....R.mO
        .byte   $C0,$48,$AD,$53,$C0,$6D,$50,$C0 ; DC78 C0 48 AD 53 C0 6D 50 C0  .H.S.mP.
        .byte   $A8,$68,$20,$FB,$D7,$AD,$4D,$C0 ; DC80 A8 68 20 FB D7 AD 4D C0  .h ...M.
        .byte   $0A,$30,$50,$2A,$49,$01,$2D,$51 ; DC88 0A 30 50 2A 49 01 2D 51  .0P*I.-Q
        .byte   $C0,$4A,$AD,$51,$C0,$10,$0D,$08 ; DC90 C0 4A AD 51 C0 10 0D 08  .J.Q....
        .byte   $20,$B4,$E0,$28,$90,$03,$4C,$AC ; DC98 20 B4 E0 28 90 03 4C AC   ..(..L.
        .byte   $D1,$4C,$80,$D1,$90,$35,$AD,$56 ; DCA0 D1 4C 80 D1 90 35 AD 56  .L...5.V
        .byte   $C0,$AC,$57,$C0,$4C,$6B,$04,$A0 ; DCA8 C0 AC 57 C0 4C 6B 04 A0  ..W.Lk..
        .byte   $01,$98,$91,$9A,$08,$78,$20,$88 ; DCB0 01 98 91 9A 08 78 20 88  .....x .
        .byte   $D1,$A4,$92,$A5,$91,$18,$69,$02 ; DCB8 D1 A4 92 A5 91 18 69 02  ......i.
        .byte   $90,$01,$C8,$85,$9C,$84,$9D,$85 ; DCC0 90 01 C8 85 9C 84 9D 85  ........
        .byte   $9E,$84,$9F,$85,$A0,$84,$A1,$A5 ; DCC8 9E 84 9F 85 A0 84 A1 A5  ........
        .byte   $A6,$A4,$A7,$85,$A2,$84,$A3,$28 ; DCD0 A6 A4 A7 85 A2 84 A3 28  .......(
        .byte   $4C,$CC,$D1

		; ----------------------------------------------------------------------------
LE0DB:  cli                                     ; E0DB 58                       X
        rts                                     ; E0DC 60                       `
; ----------------------------------------------------------------------------
LE0DD:  ldx     #$00                            ; E0DD A2 00                    ..
        .byte   $2C                             ; E0DF 2C                       ,
LE0E0:  ldx     #$0C                            ; E0E0 A2 0C                    ..
        jmp     LD67E                           ; E0E2 4C 7E D6                 L~.

		.byte  $20,$2D,$DB ; DCE0 A2 0C 4C 7E D6 20 2D DB  ..L~. -.
        .byte   $F0,$F3

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
        beq     LE1DC                           ; E1D1 F0 09                    .. popme
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
        lda     #$00                            ; E1EB A9 00                    .. FIXME
        ldx     #$C2                            ; E1ED A2 C2                    .. FIXME
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
LE24A:  rts                                     ; E24A 60       

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
        jmp     XPRSEC                          ; E261 4C 73 DA                 Ls.

	
LE264:  clc                                     ; E264 18                       .
        .byte   $24                             ; E265 24                       $		
LE266:  sec                                     ; E266 38                       8
        ldx     $C027                           ; E267 AE 27 C0                 .'.
        ldy     SEDORIC_BUF3+15,x               ; E26A BC 0F C3                 ...
        bmi     LE2D0                           ; E26D 30 61                    0a 
        tya                                     ; E26F 98                       .
        rol                                  ; E270 2A                       *
        rol                                    ; E271 2A                       *
        bpl     LE277                           ; E272 10 03                    .. 
        jmp     LE5F3                           ; E274 4C F3 E5                 L..		 

; ----------------------------------------------------------------------------
LE277:  jsr     LE5DC                           ; E277 20 DC E5                  .. 
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
LE2D0:  bcs     LE2D5                           ; E2D0 B0 03                    ..
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
LE341
		jmp 	XAFCAR 

		

	

		
		.byt  $20,$51,$D4,$08 ; DF40 50 4C 2A D6 20 51 D4 08  PL*. Q..
        .byte   $78,$A9,$14,$A0,$01,$20,$5D,$DA ; DF48 78 A9 14 A0 01 20 5D DA  x.... ].
        .byte   $20,$4C,$DA,$A2,$05,$20,$6C,$D3 ; DF50 20 4C DA A2 05 20 6C D3   L... l.
        .byte   $AD,$28,$C0,$20,$0E,$D6,$A2,$06 ; DF58 AD 28 C0 20 0E D6 A2 06  .(. ....
        .byte   $AC,$0A,$C2,$F0,$12,$A2,$11,$88 ; DF60 AC 0A C2 F0 12 A2 11 88  ........
        .byte   $F0,$0D,$A2,$12,$20,$6C,$D3,$AD ; DF68 F0 0D A2 12 20 6C D3 AD  .... l..
        .byte   $0A,$C2,$20,$2A,$D6,$A2,$13,$20 ; DF70 0A C2 20 2A D6 A2 13 20  .. *... 
        .byte   $6C,$D3,$A0,$EB,$B9,$1E,$C0,$20 ; DF78 6C D3 A0 EB B9 1E C0 20  l...... 
        .byte   $2A,$D6,$C8,$D0,$F7,$20,$1F,$E4 ; DF80 2A D6 C8 D0 F7 20 1F E4  *.... ..
        .byte   $20,$06,$D2,$20,$30,$DB,$D0,$0B ; DF88 20 06 D2 20 30 DB D0 0B   .. 0...
        .byte   $F0,$33,$78,$20,$1F,$E4,$20,$41 ; DF90 F0 33 78 20 1F E4 20 41  .3x .. A
        .byte   $DB,$F0,$27,$20,$83,$E5,$20,$41 ; DF98 DB F0 27 20 83 E5 20 41  ..' .. A
        .byte   $DB,$F0,$1C,$20,$28,$D6,$20,$28 ; DFA0 DB F0 1C 20 28 D6 20 28  ... (. (
        .byte   $D6,$20,$83,$E5,$58,$20,$02,$D3 ; DFA8 D6 20 83 E5 58 20 02 D3  . ..X ..
        .byte   $10,$E0,$20,$02,$D3,$10,$FB,$C9 ; DFB0 10 E0 20 02 D3 10 FB C9  .. .....
        .byte   $20,$F0,$D7,$C9,$1B,$D0,$F3,$20 ; DFB8 20 F0 D7 C9 1B D0 F3 20   ...... 
        .byte   $06,$D2,$20,$06,$D2,$A9,$20,$8D ; DFC0 06 D2 20 06 D2 A9 20 8D  .. ... .
        .byte   $4C,$C0,$AD,$02,$C2,$AC,$03,$C2 ; DFC8 4C C0 AD 02 C2 AC 03 C2  L.......
        .byte   $20,$56,$D7,$A2,$07,$20,$6C,$D3 ; DFD0 20 56 D7 A2 07 20 6C D3   V... l.
        .byte   $A9,$00,$8D,$4C,$C0,$A9,$44,$2C ; DFD8 A9 00 8D 4C C0 A9 44 2C  ...L..D,
        .byte   $09,$C2,$30,$02,$A9,$53,$20,$2A ; DFE0 09 C2 30 02 A9 53 20 2A  ..0..S *
        .byte   $D6,$A9,$2F,$20,$2A,$D6,$AD,$06 ; DFE8 D6 A9 2F 20 2A D6 AD 06  ../ *...
        .byte   $C2,$A2,$01,$20,$50,$D7,$A9,$2F ; DFF0 C2 A2 01 20 50 D7 A9 2F  ... P../
        .byte   $20,$2A,$D6,$AD,$07,$C2,$20,$4E ; DFF8 20 2A D6 AD 07 C2 20 4E   *.... N
        .byte   $D7,$A9,$29,$20,$2A,$D6,$EA,$EA ; E000 D7 A9 29 20 2A D6 EA EA  ..) *...
        .byte   $EA,$A9,$20,$8D,$4C,$C0,$AD,$04 ; E008 EA A9 20 8D 4C C0 AD 04  .. .L...
        .byte   $C2,$AC,$05,$C2,$A2,$02,$20,$58 ; E010 C2 AC 05 C2 A2 02 20 58  ...... X
        .byte   $D7,$28,$A2,$08,$20,$6C,$D3,$2C ; E018 D7 28 A2 08 20 6C D3 2C  .(.. l.,
        .byte   $F1,$02,$30,$0C,$AD,$6A,$02,$29 ; E020 F1 02 30 0C AD 6A 02 29  ..0..j.)
        .byte   $20,$D0,$05,$AD,$24,$C0,$10,$03 ; E028 20 D0 05 AD 24 C0 10 03   ...$...
        .byte   $4C,$06,$D2,$60,$4C,$23,$DE,$20 ; E030 4C 06 D2 60 4C 23 DE 20  L..`L#. 
        .byte   $0D,$E6,$D0,$F8,$A2,$09,$20,$4D ; E038 0D E6 D0 F8 A2 09 20 4D  ...... M
        .byte   $D3,$38,$B0,$08,$38,$24,$18,$08 ; E040 D3 38 B0 08 38 24 18 08  .8..8$..
        .byte   $20,$51,$D4,$28,$6E,$72,$C0,$20 ; E048 20 51 D4 28 6E 72 C0 20   Q.(nr. 
        .byte   $B0,$D9,$D0,$03,$4C,$DD,$E0,$20 ; E050 B0 D9 D0 03 4C DD E0 20  ....L.. 
        .byte   $A0,$D7,$90,$17,$20,$64,$E2,$90 ; E058 A0 D7 90 17 20 64 E2 90  .... d..
        .byte   $46,$60,$20,$2A,$D6,$20,$06,$D2 ; E060 46 60 20 2A D6 20 06 D2  F` *. ..
		
        .byte   $20,$41,$DB,$AE,$27,$C0,$20,$48 ; E068 20 41 DB AE 27 C0 20 48   A..'. H
        .byte   $DB,$F0,$34,$20,$B4,$DA,$2C,$72 ; E070 DB F0 34 20 B4 DA 2C 72  ..4 ..,r
        .byte   $C0,$30,$20,$A2,$0A,$20,$6C,$D3 ; E078 C0 30 20 A2 0A 20 6C D3  .0 .. l.
        .byte   $20,$02,$D3,$20,$A1,$D3,$C9,$4E ; E080 20 02 D3 20 A1 D3 C9 4E   .. ...N
        .byte   $F0,$D8,$C9,$1B,$F0,$D3,$C9,$59 ; E088 F0 D8 C9 1B F0 D3 C9 59  .......Y
        .byte   $D0,$EE,$20,$2A,$D6,$20,$06,$D2 ; E090 D0 EE 20 2A D6 20 06 D2  .. *. ..
        .byte   $20,$B4,$DA,$20,$66,$E2,$B0,$C5 ; E098 20 B4 DA 20 66 E2 B0 C5   .. f...
        .byte   $A2,$0B,$20,$6C,$D3,$30,$C4,$A9 ; E0A0 A2 0B 20 6C D3 30 C4 A9  .. l.0..
        .byte   $00,$85,$F5,$AD,$D1,$E7,$AE,$D2 ; E0A8 00 85 F5 AD D1 E7 AE D2  ........
        .byte   $E7,$18,$24,$38,$E9,$0F,$E6,$F5 ; E0B0 E7 18 24 38 E9 0F E6 F5  ..$8....
        .byte   $B0,$F9,$CA,$10,$F6,$AE,$D3,$E7 ; E0B8 B0 F9 CA 10 F6 AE D3 E7  ........
        .byte   $E4,$F5,$F0,$9D,$CA,$86,$F5,$20 ; E0C0 E4 F5 F0 9D CA 86 F5 20  ....... 
        .byte   $37,$E5,$EA,$C6,$F5,$D0,$06,$8D ; E0C8 37 E5 EA C6 F5 D0 06 8D  7.......
        .byte   $5C,$C0,$8C,$5D,$C0,$20,$5D,$DA ; E0D0 5C C0 8C 5D C0 20 5D DA  \..]. ].
        .byte   $AD,$00,$C1,$AC,$01,$C1,$D0,$EB ; E0D8 AD 00 C1 AC 01 C1 D0 EB  ........
        .byte   $A0,$10,$84,$F5,$20,$A5,$DB,$A4 ; E0E0 A0 10 84 F5 20 A5 DB A4  .... ...
        .byte   $F5,$CC,$02,$C1,$F0,$14,$B9,$00 ; E0E8 F5 CC 02 C1 F0 14 B9 00  ........
        .byte   $C1,$9D,$00,$C3,$C8,$E8,$8E,$02 ; E0F0 C1 9D 00 C3 C8 E8 8E 02  ........
        .byte   $C3,$D0,$EE,$84,$F5,$20,$82,$DA ; E0F8 C3 D0 EE 84 F5 20 82 DA  ..... ..
        .byte   $F0,$E2,$20,$82,$DA,$CE,$D3,$E7 ; E100 F0 E2 20 82 DA CE D3 E7  .. .....
        .byte   $AD,$5C,$C0,$AC,$5D,$C0,$20,$63 ; E108 AD 5C C0 AC 5D C0 20 63  .\..]. c
        .byte   $DA,$AD,$00,$C3,$48,$AD,$01,$C3 ; E110 DA AD 00 C3 48 AD 01 C3  ....H...
        .byte   $48,$A9,$00,$8D,$00,$C3,$8D,$01 ; E118 48 A9 00 8D 00 C3 8D 01  H.......
        .byte   $C3,$20,$A4,$DA,$68,$A8,$68,$AE ; E120 C3 20 A4 DA 68 A8 68 AE  . ..h.h.
        .byte   $D3,$E7,$E0,$01,$90,$03,$20,$15 ; E128 D3 E7 E0 01 90 03 20 15  ...... .
        .byte   $DD,$20,$8A,$DA,$4C,$A7,$E4

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


LE566:  pla                                     ; E566 68                       h
        ldx     SEDORIC_DRIVE                   ; E567 AE 00 C0                 ...
        ldy     #$04                            ; E56A A0 04                    ..
        tya                                     ; E56C 98                       .
        sta     LF63C,x                         ; E56D 9D 3C F6                 .<.
        lda     #$14                            ; E570 A9 14                    ..
        sta     LF638,x                         ; E572 9D 38 F6                 .8.
        rts                                     ; E575 60                       `



LE576:  jsr     LDA63                           ; E576 20 63 DA                  c. 
        lda     SEDORIC_DRIVE                   ; E579 AD 00 C0                 ...
        asl                                 ; E57C 0A                       .
        asl                                   ; E57D 0A                       .
        asl                              ; E57E 0A                       .
        adc     SEDORIC_DRIVE                   ; E57F 6D 00 C0                 m..
        rts      

		.byt  $AE,$27,$C0,$BD,$0F ; E180 00 C0 60 AE 27 C0 BD 0F  ..`.'...
        .byte   $C3,$2A,$2A,$30,$04,$20,$22,$E3 ; E188 C3 2A 2A 30 04 20 22 E3  .**0. ".
        .byte   $60,$A0,$08,$20,$C3,$DA,$A9,$D2 ; E190 60 A0 08 20 C3 DA A9 D2  `.. ....
        .byte   $A0,$E5,$20,$37,$D6,$60,$86,$F9 ; E198 A0 E5 20 37 D6 60 86 F9  .. 7.`..
        .byte   $BD,$0F,$C3,$2A,$2A,$30,$05,$24 ; E1A0 BD 0F C3 2A 2A 30 05 24  ...**0.$
        .byte   $07,$4C,$D7,$C4,$20,$B4,$DA,$A9 ; E1A8 07 4C D7 C4 20 B4 DA A9  .L.. ...
        .byte   $C5,$A0,$E5,$20,$37,$D6,$4C,$7A ; E1B0 C5 A0 E5 20 37 D6 4C 7A  ... 7.Lz
        .byte   $C5,$8E,$09,$C0,$A0,$2E,$20,$8A ; E1B8 C5 8E 09 C0 A0 2E 20 8A  ...... .
        .byte   $E7,$20,$44,$C6,$60
		; Not allowed
		.byt    $20,$4E,$4F ; E1C0 E7 20 44 C6 60 20 4E 4F  . D.` NO
        .byte   $54,$20,$41,$4C,$4C,$4F,$57,$45 ; E1C8 54 20 41 4C 4C 4F 57 45  T ALLOWE
        .byte   $44,$00,$20,$20,$20,$20,$20,$5B ; E1D0 44 00 20 20 20 20 20 5B  D.     [
        .byte   $2A,$5D,$20,$00
	

LE5DC:  lda     LE7D1                           ; E5DC AD D1 E7                 ...
        bne     LE5E4                           ; E5DF D0 03                    ..
        dec     LE7D2                           ; E5E1 CE D2 E7                 ...
LE5E4:  dec     LE7D1                           ; E5E4 CE D1 E7                 ...
        lda     SEDORIC_BUF2+4                  ; E5E7 AD 04 C2                 ...
        bne     LE5EF                           ; E5EA D0 03                    ..
        dec     SEDORIC_BUF2+5                  ; E5EC CE 05 C2                 ...
LE5EF:  dec     SEDORIC_BUF2+4                  ; E5EF CE 04 C2                 ...
        rts                                     ; E5F2 60                       `			

LE5F3:  lda     #$C5                            ; E5F3 A9 C5                    .. FIXME
        ldy     #$E5                            ; E5F5 A0 E5                    .. FIXME
        jsr     XAFSTR                          ; E5F7 20 37 D6                  7. ; 
        sec                                     ; E5FA 38                       8
LE5FB:  rts  



		
		.byt  $20,$51,$D4,$20 ; E1F8 37 D6 38 60 20 51 D4 20  7.8` Q. 
        .byte   $2D,$DB,$08,$A9,$00,$28,$F0,$02 ; E200 2D DB 08 A9 00 28 F0 02  -....(..
        .byte   $A9,$01,$4C,$D5,$D7,$AC,$09,$C0 ; E208 A9 01 4C D5 D7 AC 09 C0  ..L.....
        .byte   $20,$9E,$D3,$F0,$0D,$E9,$41,$C9 ; E210 20 9E D3 F0 0D E9 41 C9   .....A.
        .byte   $04,$B0,$07,$A8,$20,$C0,$D7,$4C ; E218 04 B0 07 A8 20 C0 D7 4C  .... ..L
        .byte   $98,$D3,$20,$C0,$D7,$4C,$9E,$D3 ; E220 98 D3 20 C0 D7 4C 9E D3  .. ..L..
        .byte   $4C,$DD,$E0,$4C,$D2,$E2
		
LE62E:  lda     #$14                            ; E62E A9 14                    ..
        ldy     #$02                            ; E630 A0 02                    ..
        sty     $2F                             ; E632 84 2F                    ./
        rts        		

		; ----------------------------------------------------------------------------
LE635:  ldy     #$03                            ; E635 A0 03                    ..
        jmp     LDC8B                           ; E637 4C 8B DC                 L.. 

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
        sta     LDCA8                           ; E6AB 8D A8 DC                 ... write rts in $DC90 routine
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
LE6C4:  ror                                 ; E6C4 6A                       j
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

LE6E5
		
		.byt    $00,$00,$00 ; E2E0 20 3A E6 B0 F2 00 00 00    ......
        .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; E2E8 00 00 00 00 00 00 00 00  ........
        .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; E2F0 00 00 00 00 00 00 00 00  ........
        .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; E2F8 00 00 00 00 00 00 00 00  ........
        .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; E300 00 00 00 00 00 00 00 00  ........
        .byte   $00,$00,$00,$20,$4D,$E9,$90,$09 ; E308 00 00 00 20 4D E9 90 09  ... M...
        .byte   $AD,$07,$03,$8D,$05,$03,$A9,$40 ; E310 AD 07 03 8D 05 03 A9 40  .......@
        .byte   $2C,$A9,$00,$8D,$0B,$03,$60,$20 ; E318 2C A9 00 8D 0B 03 60 20  ,.....` 
        .byte   $7F,$D2,$08,$78,$8E,$01,$03,$AD ; E320 7F D2 08 78 8E 01 03 AD  ...x....
        .byte   $00,$03,$29,$EF,$8D,$00,$03,$09 ; E328 00 03 29 EF 8D 00 03 09  ..).....
        .byte   $10,$8D,$00,$03,$28,$A9,$02,$2C ; E330 10 8D 00 03 28 A9 02 2C  ....(..,
        .byte   $0D,$03,$F0,$FB,$60,$4C,$23,$DE ; E338 0D 03 F0 FB 60 4C 23 DE  ....`L#.
        .byte   $A0,$03,$2C,$A0,$06,$2C,$A0,$09 ; E340 A0 03 2C A0 06 2C A0 09  ..,..,..
        .byte   $2C,$A0,$0C,$2C,$A0,$0F,$2C,$A0 ; E348 2C A0 0C 2C A0 0F 2C A0  ,..,..,.
        .byte   $12,$EA,$EA,$EA,$EA,$EA,$EA,$EA ; E350 12 EA EA EA EA EA EA EA  ........
        .byte   $EA,$EA,$A2,$65,$4C,$5E,$F1,$EA ; E358 EA EA A2 65 4C 5E F1 EA  ...eL^..
        .byte   $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA ; E360 EA EA EA EA EA EA EA EA  ........
        .byte   $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA ; E368 EA EA EA EA EA EA EA EA  ........
        .byte   $A0,$03,$2C,$A0,$06,$2C,$A0,$09 ; E370 A0 03 2C A0 06 2C A0 09  ..,..,..
        .byte   $2C,$A0,$0C,$EA,$EA,$EA,$EA,$EA ; E378 2C A0 0C EA EA EA EA EA  ,.......
        .byte   $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA ; E380 EA EA EA EA EA EA EA EA  ........
        .byte   $EA,$EA,$A2,$6A,$4C,$5E,$F1,$EA ; E388 EA EA A2 6A 4C 5E F1 EA  ...jL^..
        .byte   $EA,$EA,$EA,$EA,$EA,$EA,$F0,$06 ; E390 EA EA EA EA EA EA F0 06  ........
        .byte   $20,$16,$D2,$4C,$E2,$D2,$AD,$04 ; E398 20 16 D2 4C E2 D2 AD 04   ..L....
        .byte   $03,$AC,$05,$03,$85,$D0,$84,$D1 ; E3A0 03 AC 05 03 85 D0 84 D1  ........
        .byte   $AD,$08,$03,$AC,$09,$03,$85,$D2 ; E3A8 AD 08 03 AC 09 03 85 D2  ........
        .byte   $84,$D3,$4C,$9B,$E7,$4C,$23,$DE ; E3B0 84 D3 4C 9B E7 4C 23 DE  ..L..L#.
        .byte   $D0,$FB,$78,$A9,$00,$4C,$AD,$04 ; E3B8 D0 FB 78 A9 00 4C AD 04  ..x..L..
        .byte   $20,$4D,$E9,$90,$11,$AC,$24,$C0 ; E3C0 20 4D E9 90 11 AC 24 C0   M....$.
        .byte   $D0,$03,$6E,$F1,$02,$4C,$BC,$D1 ; E3C8 D0 03 6E F1 02 4C BC D1  ..n..L..
		.byte   $00		
LE7D1: 
	.byt 0
LE7D2:
	.byt 0
LE7D3:  
	.byt 0
LE7D4:
	.byt 0
		
        .byt $00,$4C,$C4 ; E3D0 00 00 00 00 00 00 4C C4  ......L.
        .byte   $D1,$08,$A6,$9A,$A4,$9B,$28,$F0 ; E3D8 D1 08 A6 9A A4 9B 28 F0  ......(.
        .byte   $0A,$20,$FA,$D2,$20,$9C,$D1,$A6 ; E3E0 0A 20 FA D2 20 9C D1 A6  . .. ...
        .byte   $CE,$A4,$CF,$8A,$D0,$01,$88,$CA ; E3E8 CE A4 CF 8A D0 01 88 CA  ........
        .byte   $86,$B0,$84,$B1,$60,$D0,$BE,$AD ; E3F0 86 B0 84 B1 60 D0 BE AD  ....`...
        .byte   $3E,$04,$AC,$3F,$04,$85,$F0,$84 ; E3F8 3E 04 AC 3F 04 85 F0 84  >..?....
        .byte   $F1,$08,$78,$2C,$24,$C0,$10,$20 ; E400 F1 08 78 2C 24 C0 10 20  ..x,$.. 
        .byte   $A9,$22,$A0,$EE,$8D,$45,$02,$8C ; E408 A9 22 A0 EE 8D 45 02 8C  ."...E..
        .byte   $46,$02,$A9,$78,$A0,$EB,$8D,$3C ; E410 46 02 A9 78 A0 EB 8D 3C  F..x...<
        .byte   $02,$8C,$3D,$02,$A9,$B2,$A0,$F8 ; E418 02 8C 3D 02 A9 B2 A0 F8  .. .....
        .byte   $8D,$48,$02,$8C,$49,$02,$28,$60 ; E420 8D 48 02 8C 49 02 28 60  .H..I.(`
        .byte   $A9,$03,$A0,$EC,$8D,$29,$02,$8C ; E428 A9 03 A0 EC 8D 29 02 8C  .....)..
        .byte   $2A,$02,$A9,$30,$A0,$F4,$8D,$2C ; E430 2A 02 A9 30 A0 F4 8D 2C  *..0...,
        .byte   $02,$8C,$2D,$02,$28,$60,$AD,$13 ; E438 02 8C 2D 02 28 60 AD 13  ..-.(`..
        .byte   $C0,$AC,$14,$C0,$85,$E9,$84,$EA ; E440 C0 AC 14 C0 85 E9 84 EA  ........
        .byte   $AD,$11,$C0,$AC,$12,$C0,$85,$A8 ; E448 AD 11 C0 AC 12 C0 85 A8  ........
        .byte   $84,$A9,$60,$20,$5C,$D2,$20,$24 ; E450 84 A9 60 20 5C D2 20 24  ..` \. $
        .byte   $D2,$20,$74,$D2,$C9,$44,$B0,$3A ; E458 D2 20 74 D2 C9 44 B0 3A  . t..D. 
        .byte   $AA,$A8,$88,$B1,$91,$99,$35,$00 ; E460 AA A8 88 B1 91 99 35 00  ......5.
        .byte   $88,$10,$F8,$C8,$B9,$10,$CD,$95 ; E468 88 10 F8 C8 B9 10 CD 95  ........
        .byte   $35,$E8,$C0,$0A,$D0,$F5,$A5,$E9 ; E470 35 E8 C0 0A D0 F5 A5 E9  5.......
        .byte   $A4,$EA,$8D,$13,$C0,$8C,$14,$C0 ; E478 A4 EA 8D 13 C0 8C 14 C0  ........
        .byte   $A5,$A8,$A4,$A9,$8D,$11,$C0,$8C ; E480 A5 A8 A4 A9 8D 11 C0 8C  ........
        .byte   $12,$C0,$A9,$34,$A0,$00,$A2,$3A ; E488 12 C0 A9 34 A0 00 A2 3A  ...4... 
        .byte   $85,$E9,$84,$EA,$86,$34,$88,$84 ; E490 85 E9 84 EA 86 34 88 84  .....4..
        .byte   $A9,$60,$4C,$77,$E9,$20,$5C,$D2 ; E498 A9 60 4C 77 E9 20 5C D2  .`Lw. \.
        .byte   $20,$38,$D2,$20,$74,$D2,$C9,$50 ; E4A0 20 38 D2 20 74 D2 C9 50   8. t..P
        .byte   $B0,$F0,$AA,$A8,$B1,$91,$99,$35 ; E4A8 B0 F0 AA A8 B1 91 99 35  .......5
        .byte   $00,$88,$10,$F8,$C8,$94,$35,$A5 ; E4B0 00 88 10 F8 C8 94 35 A5  ......5.
        .byte   $E9,$48,$A9,$35,$85,$E9,$20,$94 ; E4B8 E9 48 A9 35 85 E9 20 94  .H.5.. .
        .byte   $D1,$68,$85,$E9,$98,$38,$E9,$05 ; E4C0 D1 68 85 E9 98 38 E9 05  .h...8..
        .byte   $20,$64,$D2,$A4,$D0,$EA,$B9,$35 ; E4C8 20 64 D2 A4 D0 EA B9 35   d.....5
        .byte   $00,$91,$D1,$88,$10,$F8,$A0,$02 ; E4D0 00 91 D1 88 10 F8 A0 02  ........
        .byte   $B9,$D0,$00,$91,$B6,$88,$10,$F8 ; E4D8 B9 D0 00 91 B6 88 10 F8  ........
        .byte   $60,$20,$38,$D2,$20,$74,$D2,$AA ; E4E0 60 20 38 D2 20 74 D2 AA  ` 8. t..
        .byte   $F0,$F6,$85,$F3,$A2,$00,$A0,$00 ; E4E8 F0 F6 85 F3 A2 00 A0 00  ........
        .byte   $A9,$E9,$85,$16,$A9,$C0,$85,$17 ; E4F0 A9 E9 85 16 A9 C0 85 17  ........
        .byte   $84,$F2,$B1,$91,$10,$2B,$29,$7F ; E4F8 84 F2 B1 91 10 2B 29 7F  .....+).
        .byte   $F0,$13,$85,$26,$A0,$00,$E6,$16 ; E500 F0 13 85 26 A0 00 E6 16  ...&....
        .byte   $D0,$02,$E6,$17,$20,$53,$04,$10 ; E508 D0 02 E6 17 20 53 04 10  .... S..
        .byte   $F5,$C6,$26,$D0,$F1,$A0,$01,$E8 ; E510 F5 C6 26 D0 F1 A0 01 E8  ..&.....
        .byte   $F0,$1E,$20,$53,$04,$08,$29,$7F ; E518 F0 1E 20 53 04 08 29 7F  .. S..).
        .byte   $9D,$FF,$C0,$C8,$28,$10,$F0,$30 ; E520 9D FF C0 C8 28 10 F0 30  ....(..0
        .byte   $06,$E8,$F0,$0C,$9D,$FF,$C0,$C6 ; E528 06 E8 F0 0C 9D FF C0 C6  ........
        .byte   $F3,$F0,$08,$A4,$F2,$C8,$D0,$B8 ; E530 F3 F0 08 A4 F2 C8 D0 B8  ........
        .byte   $4C,$77,$E9,$8A,$20,$64,$D2,$A4 ; E538 4C 77 E9 8A 20 64 D2 A4  Lw.. d..
        .byte   $D0,$88,$B9,$00,$C1,$91,$D1,$98 ; E540 D0 88 B9 00 C1 91 D1 98  ........
        .byte   $D0,$F7,$4C,$D6,$E8,$A0,$02,$B1 ; E548 D0 F7 4C D6 E8 A0 02 B1  ..L.....
        .byte   $E9,$29,$DF,$D9,$2E,$CD,$D0,$05 ; E550 E9 29 DF D9 2E CD D0 05  .)......
        .byte   $88,$10,$F4,$30,$0F,$A0,$02,$B1 ; E558 88 10 F4 30 0F A0 02 B1  ...0....
        .byte   $E9,$29,$DF,$D9,$2B,$CD,$D0,$0C ; E560 E9 29 DF D9 2B CD D0 0C  .)..+...
        .byte   $88,$10,$F4,$18,$08,$A0,$03,$20 ; E568 88 10 F4 18 08 A0 03 20  ....... 
        .byte   $E3,$D1,$28,$60,$4C,$23,$DE,$A2 ; E570 E3 D1 28 60 4C 23 DE A2  ..(`L#..
        .byte   $12,$4C,$7E,$D6,$4C,$20,$DE,$20 ; E578 12 4C 7E D6 4C 20 DE 20  .L~.L . 
        .byte   $4D,$E9,$A9,$00,$8D,$1C,$C0,$8D ; E580 4D E9 A9 00 8D 1C C0 8D  M.......
        .byte   $1B,$C0,$6A,$8D,$18,$C0,$A0,$37 ; E588 1B C0 6A 8D 18 C0 A0 37  ..j....7
        .byte   $A2,$FF,$8C,$19,$C0,$8E,$1A,$C0 ; E590 A2 FF 8C 19 C0 8E 1A C0  ........
        .byte   $60,$20,$FA,$D2,$8D,$1C,$C0,$8C ; E598 60 20 FA D2 8D 1C C0 8C  ` ......
        .byte   $1B,$C0,$20,$9C,$D1,$A6,$CF,$A4 ; E5A0 1B C0 20 9C D1 A6 CF A4  .. .....
        .byte   $CE,$D0,$01,$CA,$88,$4C,$92,$E9 ; E5A8 CE D0 01 CA 88 4C 92 E9  .....L..
        .byte   $20,$7F,$D2,$E0,$32,$90,$C5,$CA ; E5B0 20 7F D2 E0 32 90 C5 CA   ...2...
        .byte   $4C,$7E,$D6,$F0,$06,$A9,$90,$20 ; E5B8 4C 7E D6 F0 06 A9 90 20  L~..... 
        .byte   $2E,$D2,$C8,$08,$AD,$21,$C0,$AC ; E5C0 2E D2 C8 08 AD 21 C0 AC  .....!..
        .byte   $22,$C0,$85,$E9,$84,$EA,$AD,$FE ; E5C8 22 C0 85 E9 84 EA AD FE  ".......
        .byte   $04,$AC,$FF,$04,$85,$A8,$84,$A9 ; E5D0 04 AC FF 04 85 A8 84 A9  ........
        .byte   $28,$F0,$03,$4C,$DC,$D1,$C6,$EA ; E5D8 28 F0 03 4C DC D1 C6 EA  (..L....
        .byte   $A0,$FF,$B1,$E9,$C9,$3A,$F0,$02 ; E5E0 A0 FF B1 E9 C9 3A F0 02  ..... ..
        .byte   $A0,$FB,$4C,$E3,$D1,$A0,$03,$2C ; E5E8 A0 FB 4C E3 D1 A0 03 2C  ..L....,
        .byte   $A0,$51,$2C,$A0,$54,$2C,$A0,$57 ; E5F0 A0 51 2C A0 54 2C A0 57  .Q,.T,.W
        .byte   $2C,$A0,$5A,$2C,$A0,$5D,$2C,$A0 ; E5F8 2C A0 5A 2C A0 5D 2C A0  ,.Z,.],.
        .byte   $79,$A2,$60,$4C,$5E,$F1,$A0,$02 ; E600 79 A2 60 4C 5E F1 A0 02  y.`L^...
        .byte   $AD,$0A,$C0,$8D,$00,$C0,$A9,$00 ; E608 AD 0A C0 8D 00 C0 A9 00  ........
		
.byte   $20,$60,$DA,$AE,$16,$C2,$D0,$05 ; E610 20 60 DA AE 16 C2 D0 05   `......
        .byte   $AE,$DA,$C2,$E0,$34,$60		
        
LEA1E:  pha                                     ; EA1E 48                       H
        lda     #$20                            ; EA1F A9 20                    . 
        and     V1DRB                           ; EA21 2D 00 03                 -..
        sta     __modify+1                           ; EA24 8D 2B EA                 .+.
        pla                                     ; EA27 68                       h
        and     #$DF                            ; EA28 29 DF                    ).
__modify		
        .byte   $09,$00                              ; EA2A 09                       FIXME
        ; EA2B 00                       .
        sta     V1DRB                           ; EA2C 8D 00 03                 ...
        rts                                     
		
		; ----------------------------------------------------------------------------
LEA30:  inx                                     ; EA30 E8                       .
        stx     SEDORIC_TRAV0                   ; EA31 86 F2                    ..
        ldx     #$3F                            ; EA33 A2 3F                    .?
        rts                                     ; EA35 60                       `		
		
		
     
		
		.byt  $86,$30 ; E630 E8 86 F2 A2 3F 60 86 30  ....?`.0
        .byte   $4C,$3E,$D7,$20,$38,$D2,$85,$B8 ; E638 4C 3E D7 20 38 D2 85 B8  L>. 8...
        .byte   $84,$B9,$A5,$28
	

	
		
		.byt  $48,$A5,$29
LEA47		
		.byt  $48 ; E640 84 B9 A5 28 48 A5 29 48  ...(H.)H
        .byte   $20,$2C,$D2,$20,$38,$D2,$85,$91 ; E648 20 2C D2 20 38 D2 85 91   ,. 8...
        .byte   $84,$92,$68,$C5,$29,$D0,$20,$68 ; E650 84 92 68 C5 29 D0 20 68  ..h.). h
        .byte   $C5,$28,$D0,$1B,$A0,$01,$24,$28 ; E658 C5 28 D0 1B A0 01 24 28  .(....$(
        .byte   $30,$06,$24,$29,$30,$03,$C8,$C8 ; E660 30 06 24 29 30 03 C8 C8  0.$)0...
        .byte   $C8,$B1,$91,$AA,$B1,$B8,$91,$91 ; E668 C8 B1 91 AA B1 B8 91 91  ........
        .byte   $8A,$91,$B8,$88,$10,$F3,$60,$A2 ; E670 8A 91 B8 88 10 F3 60 A2  ......`.
        .byte   $0B,$4C,$7E,$D6,$4C,$20,$DE,$20 ; E678 0B 4C 7E D6 4C 20 DE 20  .L~.L . 
        .byte   $7F,$D2,$8A,$C9,$04,$B0,$F5,$0A ; E680 7F D2 8A C9 04 B0 F5 0A  ........
        .byte   $65,$D4,$85,$F6,$AA,$BD,$68,$C0 ; E688 65 D4 85 F6 AA BD 68 C0  e.....h.
        .byte   $85,$F7,$A9,$00,$A2,$03,$95,$F2 ; E690 85 F7 A9 00 A2 03 95 F2  ........
        .byte   $CA,$10,$FB,$20,$9E,$D3,$C9,$2C ; E698 CA 10 FB 20 9E D3 C9 2C  ... ...,
        .byte   $D0,$46,$20,$98,$D3,$A0,$04,$D9 ; E6A0 D0 46 20 98 D3 A0 04 D9  .F .....
        .byte   $83,$CD,$F0,$05,$88,$10,$F8,$30 ; E6A8 83 CD F0 05 88 10 F8 30  .......0
        .byte   $37,$20,$98,$D3,$C0,$04,$D0,$22 ; E6B0 37 20 98 D3 C0 04 D0 22  7 ....."
        .byte   $20,$FA,$D2,$A6,$F6,$9D,$67,$C0 ; E6B8 20 FA D2 A6 F6 9D 67 C0   .....g.
        .byte   $98,$9D,$66,$C0,$20,$9E,$D3,$F0 ; E6C0 98 9D 66 C0 20 9E D3 F0  ..f. ...
        .byte   $0A,$20,$2C,$D2,$A9,$4F,$20,$2E ; E6C8 0A 20 2C D2 A9 4F 20 2E  . ,..O .
        .byte   $D2,$A2,$80,$8A,$A6,$F6,$9D,$68 ; E6D0 D2 A2 80 8A A6 F6 9D 68  .......h
        .byte   $C0,$60,$98,$48,$20,$7F,$D2,$68 ; E6D8 C0 60 98 48 20 7F D2 68  .`.H ..h
        .byte   $A8,$96,$F2,$20,$9E,$D3,$D0,$B3 ; E6E0 A8 96 F2 20 9E D3 D0 B3  ... ....
        .byte   $A4,$F4,$A5,$F5,$48,$A6,$F6,$BD ; E6E8 A4 F4 A5 F5 48 A6 F6 BD  ....H...
        .byte   $66,$C0,$8D,$F0,$04,$BD,$67,$C0 ; E6F0 66 C0 8D F0 04 BD 67 C0  f.....g.
        .byte   $8D,$F1,$04,$A5,$F2,$A6,$F3,$24 ; E6F8 8D F1 04 A5 F2 A6 F3 24  .......$
        .byte   $00,$00,$07,$28,$20,$22,$EB,$4C ; E700 00 00 07 28 20 22 EB 4C  ...( ".L
        .byte   $0E,$EB,$28,$20,$71,$04,$48,$08 ; E708 0E EB 28 20 71 04 48 08  ..( q.H.
        .byte   $8A,$48,$98,$20,$CF,$D7,$68,$20 ; E710 8A 48 98 20 CF D7 68 20  .H. ..h 
        .byte   $CC,$D7,$68,$20,$D2,$D7,$68,$4C ; E718 CC D7 68 20 D2 D7 68 4C  ..h ..hL
        .byte   $C9,$D7,$6C,$F0,$04,$EE,$0B,$C2 ; E720 C9 D7 6C F0 04 EE 0B C2  ..l.....
        .byte   $D0,$03,$EE,$0C,$C2,$A0,$F4,$B9 ; E728 D0 03 EE 0C C2 A0 F4 B9  ........
        .byte   $35,$BF,$C9,$3F,$F0,$05,$DD,$00 ; E730 35 BF C9 3F F0 05 DD 00  5..?....
        .byte   $C3,$D0,$08,$E8,$C8,$D0,$F0,$AE ; E738 C3 D0 08 E8 C8 D0 F0 AE  ........
        .byte   $27,$C0,$60,$4C,$41,$DB,$C8,$E8 ; E740 27 C0 60 4C 41 DB C8 E8  '.`LA...
        .byte   $E0,$08,$F0,$02,$D0,$EA,$A9,$3E ; E748 E0 08 F0 02 D0 EA A9 3E  .......>
        .byte   $9D,$E2,$D9,$E8,$A9,$00,$9D,$E2 ; E750 9D E2 D9 E8 A9 00 9D E2  ........
        .byte   $D9,$A9,$E0,$A0,$D9,$20,$37,$D6 ; E758 D9 A9 E0 A0 D9 20 37 D6  ..... 7.
        .byte   $60,$0D,$0A,$3F,$4E,$4F,$54,$20 ; E760 60 0D 0A 3F 4E 4F 54 20  `..?NOT 
        .byte   $45,$4D,$50,$54,$59,$20,$44,$49 ; E768 45 4D 50 54 59 20 44 49  EMPTY DI
        .byte   $52,$45,$43,$54,$4F,$52,$D9,$EA ; E770 52 45 43 54 4F 52 D9 EA  RECTOR..
        .byte   $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA ; E778 EA EA EA EA EA EA EA EA  ........
        .byte   $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA ; E780 EA EA EA EA EA EA EA EA  ........
        .byte   $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA ; E788 EA EA EA EA EA EA EA EA  ........
        .byte   $EA,$20,$4D,$E9,$20,$DE,$DF,$AD ; E790 EA 20 4D E9 20 DE DF AD  . M. ...
        .byte   $3D,$C0,$29,$80,$90,$02,$09,$40 ; E798 3D C0 29 80 90 02 09 40   .)....@
        .byte   $8D,$3D,$C0
		


; XCHAR sélectionne le jeu de caractères correct (“normal” ou “accentué”) selon MODCLA. Suite commune aux commandes ACCENT, AZERTY, QWERTY et à la routine XSTATUS en EC17
SEDORIC_XCHAR:
        bit     SEDORIC_MODCLA                  ; EBA3 2C 3D C0                 ,=.
        bvs     LEBAD                           ; EBA6 70 05                    p. 
        ldx     #$05                            ; EBA8 A2 05                    ..
        jmp     LD332                           ; EBAA 4C 32 D3                 L2. popme

			
		


		
; ----------------------------------------------------------------------------
LEBAD:  lda     #$06                            ; EBAD A9 06                    ..
        sta     SEDORIC_TRAV0                   ; EBAF 85 F2                    ..
        ldx     #$00                            ; EBB1 A2 00                    ..
LEBB3:  lda     #$08                            ; EBB3 A9 08                    ..
        sta     SEDORIC_TRAV1                   ; EBB5 85 F3                    ..
        sta     SEDORIC_TRAV3                   ; EBB7 85 F5                    ..
        lda     ACCENTED_FONT,x                 ; EBB9 BD 4D CD                 .M.
        inx                                     ; EBBC E8                       .
        asl                                    ; EBBD 0A                       .
        asl                                    ; EBBE 0A                       .
        rol     SEDORIC_TRAV3                   ; EBBF 26 F5                    &.
        asl                                    ; EBC1 0A                       .
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

		.byt    $A9,$C0 ; E7D8 F5 C6 F2 D0 D6 60 A9 C0  .....`..
        .byte   $2C,$A9,$00,$8D,$3D,$C0,$20,$DE ; E7E0 2C A9 00 8D 3D C0 20 DE  ,... . .
        .byte   $DF,$4C,$A3,$EB,$AD,$69,$02,$AC ; E7E8 DF 4C A3 EB AD 69 02 AC  .L...i..
        .byte   $68,$02,$4C,$FB,$EB,$AD,$19,$02 ; E7F0 68 02 4C FB EB AD 19 02  h.L.....
        .byte   $AC,$1A,$02,$48,$98,$20,$E7,$D7 ; E7F8 AC 1A 02 48 98 20 E7 D7  ...H. ..
        .byte   $68,$4C,$E4,$D7,$08,$48,$AD,$F9 ; E800 68 4C E4 D7 08 48 AD F9  hL...H..
        .byte   $02,$AC,$FA,$02,$8D,$F0,$04,$8C ; E808 02 AC FA 02 8D F0 04 8C  ........
        .byte   $F1,$04,$68,$28,$4C,$EC,$04,$A9 ; E810 F1 04 68 28 4C EC 04 A9  ..h(L...
        .byte   $10,$A0,$07,$8D,$6B,$02,$8C,$6C ; E818 10 A0 07 8D 6B 02 8C 6C  ....k..l
        .byte   $02,$A9,$0F,$8D,$6A,$02,$A9,$0C ; E820 02 A9 0F 8D 6A 02 A9 0C  ....j...
        .byte   $20,$2A,$D6,$4C,$A3,$EB,$20,$24 ; E828 20 2A D6 4C A3 EB 20 24   *.L.. $
        .byte   $D2,$20,$74,$D2,$85,$F2,$A8,$88 ; E830 D2 20 74 D2 85 F2 A8 88  . t.....
        .byte   $B1,$91,$99,$00,$C1,$98,$D0,$F7 ; E838 B1 91 99 00 C1 98 D0 F7  ........
        .byte   $20,$2C,$D2,$20,$24,$D2,$20,$74 ; E840 20 2C D2 20 24 D2 20 74   ,. $. t
        .byte   $D2,$85,$F3,$86,$B8,$84,$B9,$20 ; E848 D2 85 F3 86 B8 84 B9 20  ....... 
        .byte   $2C,$D2,$20,$7F,$D2,$D0,$37,$CA ; E850 2C D2 20 7F D2 D0 37 CA  ,. ...7.
        .byte   $86,$F6,$E4,$F2,$B0,$33,$A5,$F2 ; E858 86 F6 E4 F2 B0 33 A5 F2  .....3..
        .byte   $F0,$1C,$A6,$F3,$F0,$18,$A5,$F6 ; E860 F0 1C A6 F3 F0 18 A5 F6  ........
        .byte   $85,$F7,$A9,$C1,$85,$F8,$A0,$00 ; E868 85 F7 A9 C1 85 F8 A0 00  ........
        .byte   $B1,$F7,$D1,$B8,$D0,$0E,$C8,$CA ; E870 B1 F7 D1 B8 D0 0E C8 CA  ........
        .byte   $D0,$F6,$A4,$F6,$C8,$2C,$A0,$00 ; E878 D0 F6 A4 F6 C8 2C A0 00  .....,..
        .byte   $98,$4C,$DB,$D7,$E6,$F6,$A5,$F6 ; E880 98 4C DB D7 E6 F6 A5 F6  .L......
        .byte   $C5,$F2,$F0,$F2,$D0,$D4,$4C,$23 ; E888 C5 F2 F0 F2 D0 D4 4C 23  ......L#
        .byte   $DE,$4C,$20,$DE,$AA,$AD,$6A,$02 ; E890 DE 4C 20 DE AA AD 6A 02  .L ...j.
        .byte   $48,$E0,$C6,$D0,$1E,$20,$98,$D3 ; E898 48 E0 C6 D0 1E 20 98 D3  H.... ..
        .byte   $20,$40,$D7,$20,$92,$D2,$A4,$20 ; E8A0 20 40 D7 20 92 D2 A4 20   @. ... 
        .byte   $85,$12,$84,$13,$8E,$68,$02,$AE ; E8A8 85 12 84 13 8E 68 02 AE  .....h..
        .byte   $F8,$02,$8E,$69,$02,$20,$36,$EA ; E8B0 F8 02 8E 69 02 20 36 EA  ...i. 6.
        .byte   $20,$2C,$D2,$20,$24,$D2,$24,$28 ; E8B8 20 2C D2 20 24 D2 24 28   ,. $.$(
        .byte   $10,$15,$20,$77,$D2,$F0,$05,$A0 ; E8C0 10 15 20 77 D2 F0 05 A0  .. w....
        .byte   $00,$B1,$91,$2C,$A9,$2E,$8D,$75 ; E8C8 00 B1 91 2C A9 2E 8D 75  ...,...u
        .byte   $C0,$20,$2C,$D2,$20,$24,$D2,$20 ; E8D0 C0 20 2C D2 20 24 D2 20  . ,. $. 
        .byte   $19,$D2,$20,$82,$D2,$8A,$F0,$4B ; E8D8 19 D2 20 82 D2 8A F0 4B  .. ....K
        .byte   $86,$F2,$A9,$3B,$20,$2E,$D2,$84 ; E8E0 86 F2 A9 3B 20 2E D2 84  ...; ...
        .byte   $F3,$20,$2E,$ED,$20,$1B,$D2,$20 ; E8E8 F3 20 2E ED 20 1B D2 20  . .. .. 
        .byte   $9E,$D3,$F0,$25,$20,$2C,$D2,$20 ; E8F0 9E D3 F0 25 20 2C D2 20  ...% ,. 
        .byte   $A1,$D3,$A2,$04,$86,$F4,$06,$F4 ; E8F8 A1 D3 A2 04 86 F4 06 F4  ........
        .byte   $DD,$BA,$CD,$F0,$05,$CA,$10,$F6 ; E900 DD BA CD F0 05 CA 10 F6  ........
        .byte   $30,$1E,$A5,$F4,$45,$F3,$C5,$F3 ; E908 30 1E A5 F4 45 F3 C5 F3  0...E...
        .byte   $90,$16,$85,$F3,$20,$98,$D3,$D0 ; E910 90 16 85 F3 20 98 D3 D0  .... ...
        .byte   $DB,$20,$36,$ED,$20,$8E,$EE,$68 ; E918 DB 20 36 ED 20 8E EE 68  . 6. ..h
        .byte   $8D,$6A,$02,$A5,$F4,$4C,$D8,$D7 ; E920 8D 6A 02 A5 F4 4C D8 D7  .j...L..
        .byte   $4C,$23,$DE,$4C,$20,$DE,$20,$38 ; E928 4C 23 DE 4C 20 DE 20 38  L#.L . 8
        .byte   $D2,$85,$B8,$84,$B9,$60
		
; ***********************************************************************************************************
LED36:


		lda     SEDORIC_TRAV1                   ; ED36 A5 F3                    ..
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
LED52:  
		jsr     XCURON                          ; ED52 20 3E D7                  >.
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
LED90:  jsr     XAFCAR                          ; ED90 20 2A D6                  *
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
        bne     LEDC6         ; EDBB D0 09                    ..
        txa                                     ; EDBD 8A                       .
        beq     LEDFC                           ; EDBE F0 3C                    .<
        dex                                     ; EDC0 CA                       .
        jsr     LEE73                           ; EDC1 20 73 EE                  s.
        bne     LED64                           ; EDC4 D0 9E                    ..
	


; ***********************************************************************************************************		


		
LEDC6:  iny                                     ; EDC6 C8                       .
        cmp     #$09                            ; EDC7 C9 09                    ..
        bne     LEDD9                           ; EDC9 D0 0E                    ..
        inx                                     ; EDCB E8                       .
        cpx     SEDORIC_TRAV0                   ; EDCC E4 F2                    ..
        beq     LEDD5                           ; EDCE F0 05                    ..
        jsr     LEE76                           ; EDD0 20 76 EE                  v.
        bne     LED93                           ; EDD3 D0 BE                    ..
LEDD5:  dex                                     ; EDD5 CA                       .
        jmp     LEDFC                           ; EDD6 4C FC ED                 L..


LEDD9:  iny                                     ; EDD9 C8                       .
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
		
		
LEE04	

		sty     SEDORIC_TRAV2                   ; EE04 84 F4                    ..
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
        rts    		

		
	
		

		
		.byt $A0,$02 ; EA88 29 FE F0 ED 68 60 A0 02  )...h`..
        .byte   $B9,$D0,$00,$91,$B8,$88,$10,$F8 ; EA90 B9 D0 00 91 B8 88 10 F8  ........
        .byte   $60,$20,$16,$D2,$20,$D2,$D2,$20 ; EA98 60 20 16 D2 20 D2 D2 20  ` .. .. 
        .byte   $2C,$D2,$20,$24,$D2,$20,$74,$D2 ; EAA0 2C D2 20 24 D2 20 74 D2  ,. $. t.
        .byte   $85,$22,$20,$CE,$DA,$A9,$30,$A0 ; EAA8 85 22 20 CE DA A9 30 A0  ." ...0.
        .byte   $2B,$84,$D7,$85,$D8,$85,$D9,$85 ; EAB0 2B 84 D7 85 D8 85 D9 85  +.......
        .byte   $C5,$A2,$09,$95,$CD,$CA,$D0,$FB ; EAB8 C5 A2 09 95 CD CA D0 FB  ........
        .byte   $AD,$00,$01,$C9,$2D,$F0,$02,$A9 ; EAC0 AD 00 01 C9 2D F0 02 A9  ....-...
        .byte   $2B,$85,$C4,$86,$F4,$86,$F5,$A9 ; EAC8 2B 85 C4 86 F4 86 F5 A9  +.......
        .byte   $20,$85,$F6,$A0,$01,$84,$F2,$88 ; EAD0 20 85 F6 A0 01 84 F2 88   .......
        .byte   $2C,$A2,$09,$C8,$B9,$00,$01,$F0 ; EAD8 2C A2 09 C8 B9 00 01 F0  ,.......
        .byte   $25,$C9,$2E,$F0,$F4,$C9,$45,$F0 ; EAE0 25 C9 2E F0 F4 C9 45 F0  %.....E.
        .byte   $0B,$95,$C5,$E0,$09,$B0,$02,$84 ; EAE8 0B 95 C5 E0 09 B0 02 84  ........
        .byte   $F2,$E8,$D0,$E7,$B9,$01,$01,$85 ; EAF0 F2 E8 D0 E7 B9 01 01 85  ........
        .byte   $D7,$B9,$02,$01,$AA,$B9,$03,$01 ; EAF8 D7 B9 02 01 AA B9 03 01  ........
        .byte   $F0,$02,$85,$D9,$86,$D8,$A6,$F2 ; EB00 F0 02 85 D9 86 D8 A6 F2  ........
        .byte   $A0,$08,$B5,$C4,$CA,$10,$02,$A9 ; EB08 A0 08 B5 C4 CA 10 02 A9  ........
        .byte   $20,$99,$C5,$00,$88,$10,$F3,$2C ; EB10 20 99 C5 00 88 10 F3 2C   ......,
        .byte   $84,$F5,$A4,$F4,$C4,$22,$D0,$28 ; EB18 84 F5 A4 F4 C4 22 D0 28  .....".(
        .byte   $A9,$00,$85,$D7,$20,$9E,$D3,$F0 ; EB20 A9 00 85 D7 20 9E D3 F0  .... ...
        .byte   $18,$A5,$F5,$20,$64,$D2,$A8,$88 ; EB28 18 A5 F5 20 64 D2 A8 88  ... d...
        .byte   $B9,$00,$C1,$91,$D1,$98,$D0,$F7 ; EB30 B9 00 C1 91 D1 98 D0 F7  ........
        .byte   $20,$2C,$D2,$20,$38,$D2,$4C,$D6 ; EB38 20 2C D2 20 38 D2 4C D6   ,. 8.L.
        .byte   $E8,$A9,$00,$A0,$C1,$4C,$37,$D6 ; EB40 E8 A9 00 A0 C1 4C 37 D6  .....L7.
        .byte   $20,$2B,$F0,$C9,$5E,$D0,$19,$A2 ; EB48 20 2B F0 C9 5E D0 19 A2   +..^...
        .byte   $FD,$BD,$DA,$FF,$2C,$A9,$20,$2C ; EB50 FD BD DA FF 2C A9 20 2C  ....,. ,
        .byte   $A5,$C4,$99,$00,$C1,$C8,$D0,$03 ; EB58 A5 C4 99 00 C1 C8 D0 03  ........
        .byte   $4C,$77,$E9,$E8,$D0,$EB,$F0,$B0 ; EB60 4C 77 E9 E8 D0 EB F0 B0  Lw......
        .byte   $C9,$2B,$F0,$EC,$C9,$2D,$D0,$08 ; EB68 C9 2B F0 EC C9 2D D0 08  .+...-..
        .byte   $AD,$00,$01,$4A,$B0,$E2,$90,$DD ; EB70 AD 00 01 4A B0 E2 90 DD  ...J....
        .byte   $C9,$23,$D0,$07,$20,$A7,$EF,$A2 ; EB78 C9 23 D0 07 20 A7 EF A2  .#.. ...
        .byte   $09,$D0,$10,$C9,$25,$D0,$32,$20 ; EB80 09 D0 10 C9 25 D0 32 20  ....%.2 
        .byte   $A7,$EF,$C5,$F2,$90,$25,$A9,$09 ; EB88 A7 EF C5 F2 90 25 A9 09  .....%..
        .byte   $E5,$F3,$AA,$C6,$F3,$10,$03,$4C ; EB90 E5 F3 AA C6 F3 10 03 4C  .......L
        .byte   $18,$EF,$B5,$C5,$29,$7F,$99,$00 ; EB98 18 EF B5 C5 29 7F 99 00  ....)...
        .byte   $C1,$C8,$F0,$12,$E8,$D0,$EC,$20 ; EBA0 C1 C8 F0 12 E8 D0 EC 20  ....... 
        .byte   $2B,$F0,$E9,$30,$85,$F3,$C9,$0A ; EBA8 2B F0 E9 30 85 F3 C9 0A  +..0....
        .byte   $B0,$01,$60,$4C,$20,$DE,$4C,$77 ; EBB0 B0 01 60 4C 20 DE 4C 77  ..`L .Lw
        .byte   $E9,$C9,$21,$D0,$3F,$20,$A7,$EF ; EBB8 E9 C9 21 D0 3F 20 A7 EF  ..!.? ..
        .byte   $38,$A9,$09,$E5,$F3,$85,$F3,$AA ; EBC0 38 A9 09 E5 F3 85 F3 AA  8.......
        .byte   $B5,$C5,$C5,$F6,$F0,$5A,$A9,$30 ; EBC8 B5 C5 C5 F6 F0 5A A9 30  .....Z.0
        .byte   $E8,$E8,$E0,$12,$F0,$04,$95,$C5 ; EBD0 E8 E8 E0 12 F0 04 95 C5  ........
        .byte   $D0,$F7,$A6,$F3,$E8,$B5,$C5,$C9 ; EBD8 D0 F7 A6 F3 E8 B5 C5 C9  ........
        .byte   $35,$A9,$30,$95,$C5,$90,$41,$CA ; EBE0 35 A9 30 95 C5 90 41 CA  5.0...A.
        .byte   $30,$3E,$B5,$C5,$C5,$F6,$D0,$04 ; EBE8 30 3E B5 C5 C5 F6 D0 04  0>......
        .byte   $E6,$F2,$A9,$30,$C9,$39,$F0,$E9 ; EBF0 E6 F2 A9 30 C9 39 F0 E9  ...0.9..
        .byte   $69,$01,$90,$E7,$C9,$40,$D0,$07 ; EBF8 69 01 90 E7 C9 40 D0 07  i....@..
        .byte   $20,$A7,$EF,$69,$08,$90,$BE,$C9 ; EC00 20 A7 EF 69 08 90 BE C9   ..i....
        .byte   $26,$F0,$03,$4C,$5A,$EF,$20,$2B ; EC08 26 F0 03 4C 5A EF 20 2B  &..LZ. +
        .byte   $F0,$C9,$30,$D0,$02,$09,$80,$AA ; EC10 F0 C9 30 D0 02 09 80 AA  ..0.....
        .byte   $A0,$00,$B9,$C5,$00,$C5,$F6,$D0 ; EC18 A0 00 B9 C5 00 C5 F6 D0  ........
        .byte   $05,$96,$C5,$C8,$D0,$F4,$86,$F6 ; EC20 05 96 C5 C8 D0 F4 86 F6  ........
        .byte   $4C,$1A,$EF,$A4,$F4,$B1,$91,$E6 ; EC28 4C 1A EF A4 F4 B1 91 E6  L.......
        .byte   $F4,$A4,$F5,$A2,$FF,$60,$20,$C5 ; EC30 F4 A4 F5 A2 FF 60 20 C5  .....` .
        .byte   $E7,$20,$99,$EE,$4C,$D6,$E7,$A2 ; EC38 E7 20 99 EE 4C D6 E7 A2  . ..L...
        .byte   $05,$BD,$1A,$CD,$9D,$DF,$BF,$BD ; EC40 05 BD 1A CD 9D DF BF BD  ........
        .byte   $1F,$CD,$9D,$E9,$BF,$CA,$D0,$F1 ; EC48 1F CD 9D E9 BF CA D0 F1  ........
        .byte   $E8,$8E,$72,$C0,$A9,$41,$A0,$4E ; EC50 E8 8E 72 C0 A9 41 A0 4E  ..r..A.N
        .byte   $85,$B4,$84,$B5,$20,$44,$D2,$20 ; EC58 85 B4 84 B5 20 44 D2 20  .... D. 
        .byte   $BA,$D2,$A9,$E0,$A0,$BF,$20,$AA ; EC60 BA D2 A9 E0 A0 BF 20 AA  ...... .
        .byte   $D2,$A2,$E0,$A0,$BF,$20,$C2,$D2 ; EC68 D2 A2 E0 A0 BF 20 C2 D2  ..... ..
        .byte   $AD,$1F,$02,$D0,$03,$4C,$6F,$D1 ; EC70 AD 1F 02 D0 03 4C 6F D1  .....Lo.
        .byte   $60,$20,$3F,$F0,$20,$16,$D2,$A2 ; EC78 60 20 3F F0 20 16 D2 A2  ` ?. ...
        .byte   $E5,$A0,$BF,$20,$C2,$D2,$A2,$00 ; EC80 E5 A0 BF 20 C2 D2 A2 00  ... ....
        .byte   $86,$F2,$A9,$E0,$A0,$BF,$20,$BA ; EC88 86 F2 A9 E0 A0 BF 20 BA  ...... .
        .byte   $D2,$A6,$F2,$F0,$09,$20,$F2,$D2 ; EC90 D2 A6 F2 F0 09 20 F2 D2  ..... ..
        .byte   $20,$DA,$D2,$4C,$A1,$F0,$20,$EA ; EC98 20 DA D2 4C A1 F0 20 EA   ..L.. .
        .byte   $D2,$A9,$E5,$A0,$BF,$20,$AA,$D2 ; ECA0 D2 A9 E5 A0 BF 20 AA D2  ..... ..
        .byte   $20,$8A,$D2,$AA,$F0,$04,$C8,$D0 ; ECA8 20 8A D2 AA F0 04 C8 D0   .......
        .byte   $01,$E8,$8A,$A6,$F2,$9D,$E2,$02 ; ECB0 01 E8 8A A6 F2 9D E2 02  ........
        .byte   $98,$9D,$E1,$02,$E8,$E8,$E0,$02 ; ECB8 98 9D E1 02 E8 E8 E0 02  ........
        .byte   $F0,$C6,$4E,$72,$C0,$90,$0C,$20 ; ECC0 F0 C6 4E 72 C0 90 0C 20  ..Nr... 
        .byte   $2C,$D2,$20,$FA,$D2,$8C,$E5,$02 ; ECC8 2C D2 20 FA D2 8C E5 02  ,. .....
        .byte   $8D,$E6,$02,$20,$12,$D3,$4E,$E0 ; ECD0 8D E6 02 20 12 D3 4E E0  ... ..N.
        .byte   $02,$90,$9D,$4C,$7C,$E9,$20,$3F ; ECD8 02 90 9D 4C 7C E9 20 3F  ...L|. ?
        .byte   $F0,$20,$7F,$D2,$86,$F3,$20,$2C ; ECE0 F0 20 7F D2 86 F3 20 2C  . .... ,
        .byte   $D2,$20,$7F,$D2,$86,$F4,$A9,$04 ; ECE8 D2 20 7F D2 86 F4 A9 04  . ......
        .byte   $85,$F5,$A9,$00,$85,$F6,$A6,$F6 ; ECF0 85 F5 A9 00 85 F6 A6 F6  ........
        .byte   $8A,$49,$01,$85,$F6,$B4,$F3,$A9 ; ECF8 8A 49 01 85 F6 B4 F3 A9  .I......
        .byte   $00,$20,$CA,$D2,$20,$7F,$F0,$A9 ; ED00 00 20 CA D2 20 7F F0 A9  . .. ...
        .byte   $E0,$A0,$BF,$20,$BA,$D2,$A9,$EA ; ED08 E0 A0 BF 20 BA D2 A9 EA  ... ....
        .byte   $A0,$BF,$20,$A2,$D2,$A2,$E0,$A0 ; ED10 A0 BF 20 A2 D2 A2 E0 A0  .. .....
        .byte   $BF,$20,$C2,$D2,$C6,$F5,$D0,$D6 ; ED18 BF 20 C2 D2 C6 F5 D0 D6  . ......
        .byte   $60,$A0,$1B,$2C,$A0,$18,$2C,$A0 ; ED20 60 A0 1B 2C A0 18 2C A0  `..,..,.
        .byte   $15,$2C,$A0,$12,$2C,$A0,$0F,$2C ; ED28 15 2C A0 12 2C A0 0F 2C  .,..,..,
        .byte   $A0,$0C,$A2,$56,$D0,$28,$A2,$42 ; ED30 A0 0C A2 56 D0 28 A2 42  ...V.(.B
        .byte   $2C,$A2,$56,$2C,$A2,$4C,$A0,$09 ; ED38 2C A2 56 2C A2 4C A0 09  ,.V,.L..
        .byte   $D0,$1C,$A2,$42,$2C,$A2,$56,$2C ; ED40 D0 1C A2 42 2C A2 56 2C  ...B,.V,
        .byte   $A2,$4C,$A0,$06,$D0,$10,$A2,$42 ; ED48 A2 4C A0 06 D0 10 A2 42  .L.....B
        .byte   $2C,$A2,$47,$2C,$A2,$4C,$2C,$A2 ; ED50 2C A2 47 2C A2 4C 2C A2  ,.G,.L,.
        .byte   $51,$2C,$A2,$56,$A0,$03,$A9,$C4 ; ED58 51 2C A2 56 A0 03 A9 C4  Q,.V....
        .byte   $48,$98,$48,$EC,$15,$C0,$F0,$51 ; ED60 48 98 48 EC 15 C0 F0 51  H.H....Q
        .byte   $2C,$A2,$5B,$8A,$48,$20,$06,$EA ; ED68 2C A2 5B 8A 48 20 06 EA  ,.[.H ..
        .byte   $F0,$1D,$A2,$0C,$20,$6C,$D3,$EA ; ED70 F0 1D A2 0C 20 6C D3 EA  .... l..
        .byte   $20,$48,$D6,$58,$08,$A9,$0B,$20 ; ED78 20 48 D6 58 08 A9 0B 20   H.X... 
        .byte   $2A,$D6,$28,$90,$0A,$68,$C9,$5B ; ED80 2A D6 28 90 0A 68 C9 5B  *.(..h.[
        .byte   $F0,$02,$68,$68,$4C,$DC,$D1,$20 ; ED88 F0 02 68 68 4C DC D1 20  ..hhL.. 
        .byte   $4C,$DA,$AD,$07,$C2,$8D,$4B,$C0 ; ED90 4C DA AD 07 C2 8D 4B C0  L.....K.
        .byte   $AD,$0A,$C2,$D0,$D0,$A2,$FF,$68 ; ED98 AD 0A C2 D0 D0 A2 FF 68  .......h
        .byte   $8D,$15,$C0,$38,$A8,$E8,$ED,$07 ; EDA0 8D 15 C0 38 A8 E8 ED 07  ...8....
        .byte   $C2,$F0,$02,$B0,$F7,$8E,$01,$C0 ; EDA8 C2 F0 02 B0 F7 8E 01 C0  ........
        .byte   $A2,$04,$A9,$C4,$20,$E5,$F1,$38 ; EDB0 A2 04 A9 C4 20 E5 F1 38  .... ..8
        .byte   $24,$18,$6E,$16,$C0,$A2,$03,$BD ; EDB8 24 18 6E 16 C0 A2 03 BD  $.n.....
        .byte   $00,$C4,$9D,$0D,$C0,$CA,$10,$F7 ; EDC0 00 C4 9D 0D C0 CA 10 F7  ........
        .byte   $AD,$15,$C0,$C9,$5B,$F0,$03,$4C ; EDC8 AD 15 C0 C9 5B F0 03 4C  ....[..L
        .byte   $9E,$D3,$A2,$7C,$A9,$20,$A0,$00 ; EDD0 9E D3 A2 7C A9 20 A0 00  ...|. ..
        .byte   $8C,$01,$C0,$C8,$20,$E5,$F1,$20 ; EDD8 8C 01 C0 C8 20 E5 F1 20  .... .. 
        .byte   $9E,$D3,$4C,$04,$C4,$86,$F5,$8D ; EDE0 9E D3 4C 04 C4 86 F5 8D  ..L.....
        .byte   $04,$C0,$A9,$00,$8D,$03,$C0,$78 ; EDE8 04 C0 A9 00 8D 03 C0 78  .......x
        .byte   $8C,$02,$C0,$20,$73,$DA,$EE,$04 ; EDF0 8C 02 C0 20 73 DA EE 04  ... s...
        .byte   $C0,$AC,$02,$C0,$CC,$4B,$C0,$90 ; EDF8 C0 AC 02 C0 CC 4B C0 90  .....K..
        .byte   $05,$EE,$01,$C0,$A0,$00,$C8,$C6 ; EE00 05 EE 01 C0 A0 00 C8 C6  ........
        .byte   $F5,$D0,$E5,$58,$60,$4C,$E0,$E0 ; EE08 F5 D0 E5 58 60 4C E0 E0  ...X`L..
        .byte   $F0,$27,$20,$4F,$D4,$20,$9E,$D7 ; EE10 F0 27 20 4F D4 20 9E D7  .' O. ..
        .byte   $20,$E6,$DF,$A9,$00,$A0,$C4,$8D ; EE18 20 E6 DF A9 00 A0 C4 8D   .......
        .byte   $52,$C0,$8C,$53,$C0,$A9,$40,$8D ; EE20 52 C0 8C 53 C0 A9 40 8D  R..S..@.
        .byte   $4E,$C0,$20,$E5,$E0,$AD,$51,$C0 ; EE28 4E C0 20 E5 E0 AD 51 C0  N. ...Q.
        .byte   $29,$20,$F0,$D9,$A9,$01,$8D,$15 ; EE30 29 20 F0 D9 A9 01 8D 15  ) ......
        .byte   $C0,$AC,$15,$C0,$88,$D0,$CE,$AD ; EE38 C0 AC 15 C0 88 D0 CE AD  ........
        .byte   $6A,$02,$48,$08,$20,$DE,$DF,$A9 ; EE40 6A 02 48 08 20 DE DF A9  j.H. ...
        .byte   $B8,$A0,$BB,$85,$F2,$84,$F3,$A9 ; EE48 B8 A0 BB 85 F2 84 F3 A9  ........
        .byte   $E8,$A0,$C3,$85,$F4,$84,$F5,$A2 ; EE50 E8 A0 C3 85 F4 84 F5 A2  ........
        .byte   $04,$A0,$18,$B1,$F4,$91,$F2,$C8 ; EE58 04 A0 18 B1 F4 91 F2 C8  ........
        .byte   $D0,$F9,$E6,$F3,$E6,$F5,$CA,$D0 ; EE60 D0 F9 E6 F3 E6 F5 CA D0  ........
        .byte   $F2,$20,$27,$F3,$20,$09,$F3,$20 ; EE68 F2 20 27 F3 20 09 F3 20  . '. .. 
        .byte   $3E,$D7,$58,$20,$45,$D8,$10,$FB ; EE70 3E D7 58 20 45 D8 10 FB  >.X E...
        .byte   $78,$C9,$03,$F0,$68,$C9,$7F,$D0 ; EE78 78 C9 03 F0 68 C9 7F D0  x...h...
        .byte   $15,$A9,$08,$20,$EC,$F2,$30,$E7 ; EE80 15 A9 08 20 EC F2 30 E7  ... ..0.
        .byte   $20,$CA,$F2,$D0,$15,$A9,$09,$20 ; EE88 20 CA F2 D0 15 A9 09 20   ...... 
        .byte   $2A,$D6,$A9,$7F,$D0,$04,$C9,$20 ; EE90 2A D6 A9 7F D0 04 C9 20  *...... 
        .byte   $90,$0A,$20,$2A,$D6,$A9,$08,$20 ; EE98 90 0A 20 2A D6 A9 08 20  .. *... 
        .byte   $2A,$D6,$A9,$09,$C9,$08,$90,$F2 ; EEA0 2A D6 A9 09 C9 08 90 F2  *.......
        .byte   $C9,$0C,$F0,$C3,$90,$12,$C9,$0E ; EEA8 C9 0C F0 C3 90 12 C9 0E  ........
        .byte   $F0,$BD,$C9,$0D,$D0,$E4,$A9,$09 ; EEB0 F0 BD C9 0D D0 E4 A9 09  ........
        .byte   $20,$EC,$F2,$20,$CA,$F2,$F0,$F8 ; EEB8 20 EC F2 20 CA F2 F0 F8   .. ....
        .byte   $20,$EC,$F2,$20,$CA,$F2,$D0,$F8 ; EEC0 20 EC F2 20 CA F2 D0 F8   .. ....
        .byte   $F0,$A5,$48,$20,$40,$D7,$18,$A5 ; EEC8 F0 A5 48 20 40 D7 18 A5  ..H @...
        .byte   $12,$69,$30,$85,$F8,$A5,$13,$69 ; EED0 12 69 30 85 F8 A5 13 69  .i0....i
        .byte   $08,$85,$F9,$AC,$69,$02,$B1,$F8 ; EED8 08 85 F9 AC 69 02 B1 F8  ....i...
        .byte   $A8,$68,$C0,$7F,$60,$28,$20,$25 ; EEE0 A8 68 C0 7F 60 28 20 25  .h..`( %
        .byte   $F3,$4C,$20,$F3,$46,$F2,$20,$2A ; EEE8 F3 4C 20 F3 46 F2 20 2A  .L .F. *
        .byte   $D6,$AC,$68,$02,$C0,$01,$F0,$04 ; EEF0 D6 AC 68 02 C0 01 F0 04  ..h.....
        .byte   $C0,$1B,$D0,$0A,$24,$F2,$30,$08 ; EEF8 C0 1B D0 0A 24 F2 30 08  ....$.0.
        .byte   $66,$F2,$49,$01,$D0,$E8,$24,$F2 ; EF00 66 F2 49 01 D0 E8 24 F2  f.I...$.
        .byte   $60,$A9,$1E,$20,$2A,$D6,$20,$06 ; EF08 60 A9 1E 20 2A D6 20 06  `.. *. .
        .byte   $D2,$20,$CA,$F2,$F0,$0E,$A9,$09 ; EF10 D2 20 CA F2 F0 0E A9 09  . ......
        .byte   $20,$EC,$F2,$10,$F4,$68,$68,$28 ; EF18 20 EC F2 10 F4 68 68 28   ....hh(
        .byte   $68,$8D,$6A,$02,$60,$18,$24,$38 ; EF20 68 8D 6A 02 60 18 24 38  h.j.`.$8
        .byte   $6E,$72,$C0,$20,$09,$F3,$A9,$57 ; EF28 6E 72 C0 20 09 F3 A9 57  nr. ...W
        .byte   $A0,$C9,$85,$B4,$84,$B5,$A9,$00 ; EF30 A0 C9 85 B4 84 B5 A9 00  ........
        .byte   $85,$F6,$85,$F7,$A0,$01,$84,$26 ; EF38 85 F6 85 F7 A0 01 84 26  .......&
        .byte   $88,$84,$29,$84,$27,$88,$84,$28 ; EF40 88 84 29 84 27 88 84 28  ..).'..(
        .byte   $A4,$F6,$A6,$F7,$E6,$F6,$D0,$02 ; EF48 A4 F6 A6 F7 E6 F6 D0 02  ........
        .byte   $E6,$F7,$20,$D1,$04,$A0,$00,$B1 ; EF50 E6 F7 20 D1 04 A0 00 B1  .. .....
        .byte   $B6,$85,$F2,$C8,$B1,$B6,$85,$91 ; EF58 B6 85 F2 C8 B1 B6 85 91  ........
        .byte   $C8,$B1,$B6,$85,$92,$A2,$00,$2C ; EF60 C8 B1 B6 85 92 A2 00 2C  .......,
        .byte   $72,$C0,$10,$14,$E4,$F2,$8A,$E8 ; EF68 72 C0 10 14 E4 F2 8A E8  r.......
        .byte   $F0,$59,$A8,$B1,$91,$90,$1C,$A9 ; EF70 F0 59 A8 B1 91 90 1C A9  .Y......
        .byte   $7F,$AC,$69,$02,$91,$12,$B0,$11 ; EF78 7F AC 69 02 91 12 B0 11  ..i.....
        .byte   $AC,$69,$02,$B1,$12,$C9,$7F,$D0 ; EF80 AC 69 02 B1 12 C9 7F D0  .i......
        .byte   $02,$A9,$20,$9D,$00,$C1,$E8,$F0 ; EF88 02 A9 20 9D 00 C1 E8 F0  .. .....
        .byte   $3A,$A9,$09,$20,$2A,$D6,$20,$CA ; EF90 3A A9 09 20 2A D6 20 CA   .. *. .
        .byte   $F2,$F0,$CC,$2C,$72,$C0,$30,$1C ; EF98 F2 F0 CC 2C 72 C0 30 1C  ...,r.0.
        .byte   $86,$F2,$8A,$20,$64,$D2,$A0,$00 ; EFA0 86 F2 8A 20 64 D2 A0 00  ... d...
        .byte   $B9,$00,$C1,$91,$D1,$C8,$C4,$F2 ; EFA8 B9 00 C1 91 D1 C8 C4 F2  ........
        .byte   $D0,$F6,$A0,$02,$B9,$D0,$00,$91 ; EFB0 D0 F6 A0 02 B9 D0 00 91  ........
        .byte   $B6,$88,$10,$F8,$A9,$09,$20,$EC ; EFB8 B6 88 10 F8 A9 09 20 EC  ...... .
        .byte   $F2,$30,$0B,$20,$CA,$F2,$D0,$F4 ; EFC0 F2 30 0B 20 CA F2 D0 F4  .0. ....
        .byte   $4C,$3C,$F3,$4C,$77,$E9,$60,$A5 ; EFC8 4C 3C F3 4C 77 E9 60 A5  L<.Lw.`.
        .byte   $0A,$0A,$69,$08,$D0,$0B,$A0,$04 ; EFD0 0A 0A 69 08 D0 0B A0 04  ..i.....
   

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

		

		
		.byt  $A0,$00,$A5,$9F,$C5 ; EFF0 A0 00 60 A0 00 A5 9F C5  ..`.....
        .byte   $A1,$F0,$07,$B1,$9E,$C8,$31,$9E ; EFF8 A1 F0 07 B1 9E C8 31 9E  ......1.
        .byte   $30,$22,$A6,$9E,$A4,$9F,$A9,$02 ; F000 30 22 A6 9E A4 9F A9 02  0"......
        .byte   $85,$F2
		
		
		
		.byt   $A9,$88,$20,$56,$F4,$A0 ; F008 85 F2 A9 88 20 56 F4 A0  .... V..
        .byte   $00,$8C,$81,$C0,$98,$91,$9E,$C8 ; F010 00 8C 81 C0 98 91 9E C8  ........
        .byte   $D0,$FB,$A0,$05,$B9,$25,$CD,$91 ; F018 D0 FB A0 05 B9 25 CD 91  .....%..
        .byte   $9E,$88,$10,$F8,$60
		
		
		
		


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

		.byt   $48,$20,$F3,$F3,$68 ; F070 4C 5C D1 48 20 F3 F3 68  L\.H ..h
        .byte   $AA,$18,$08,$90,$0A,$18,$24,$38 ; F078 AA 18 08 90 0A 18 24 38  ......$8
        .byte   $08,$20,$F3,$F3,$20,$7F,$D2,$E0 ; F080 08 20 F3 F3 20 7F D2 E0  . .. ...
        .byte   $40,$B0,$1A,$86,$0A,$20,$CF,$F3 ; F088 40 B0 1A 86 0A 20 CF F3  @.... ..
        .byte   $C8,$28,$B1,$F2,$D0,$0A,$B0,$0A ; F090 C8 28 B1 F2 D0 0A B0 0A  .(......
        .byte   $A2,$0D,$2C,$A2,$0E,$4C,$7E,$D6 ; F098 A2 0D 2C A2 0E 4C 7E D6  ..,..L~.
        .byte   $B0,$F9,$4C,$9E,$D3,$4C,$20,$DE ; F0A0 B0 F9 4C 9E D3 4C 20 DE  ..L..L .
     


LF4A8:  lda     #$88                            ; F4A8 A9 88                    ..
        ldy     #$00                            ; F4AA A0 00                    ..
        jsr     LF3E3                           ; F4AC 20 E3 F3                  .. 
        sta     $06                             ; F4AF 85 06                    ..
        stx     $07                             ; F4B1 86 07                    ..
        lda     $0A                             ; F4B3 A5 0A                    ..
        asl                                    ; F4B5 0A                       .
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


	
		
		
		.byt   $18,$65,$02,$85 ; F0D8 00 85 0B 60 18 65 02 85  ...`.e..
        .byte   $02,$90,$02,$E6,$03,$60,$A9,$80 ; F0E0 02 90 02 E6 03 60 A9 80  .....`..
        .byte   $2C,$A9,$00,$2C,$A9,$01,$2C,$A9 ; F0E8 2C A9 00 2C A9 01 2C A9  ,..,..,.
        .byte   $40,$8D,$82,$C0,$A9,$06,$20,$E1 ; F0F0 40 8D 82 C0 A9 06 20 E1  @..... .
        .byte   $F3,$B1,$F2,$85,$F4,$C8,$B1,$F2 ; F0F8 F3 B1 F2 85 F4 C8 B1 F2  ........
        .byte   $85,$F5,$20,$D6,$F3,$A5,$F4,$05 ; F100 85 F5 20 D6 F3 A5 F4 05  .. .....
        .byte   $F5,$F0,$54,$A5,$F4,$D0,$02,$C6 ; F108 F5 F0 54 A5 F4 D0 02 C6  ..T.....
        .byte   $F5,$C6,$F4,$A0,$06,$2C,$82,$C0 ; F110 F5 C6 F4 A0 06 2C 82 C0  .....,..
        .byte   $10,$0C,$38,$B1,$F2,$E5,$0A,$D0 ; F118 10 0C 38 B1 F2 E5 0A D0  ..8.....
        .byte   $31,$A8,$91,$F2,$F0,$2C,$50,$23 ; F120 31 A8 91 F2 F0 2C 50 23  1....,P#
        .byte   $A0,$00,$B1,$F2,$D0,$24,$A5,$F2 ; F128 A0 00 B1 F2 D0 24 A5 F2  .....$..
        .byte   $A4,$F3,$85,$F4,$84,$F5,$60,$A0 ; F130 A4 F3 85 F4 84 F5 60 A0  ......`.
        .byte   $09,$AD,$82,$C0,$D0,$F0,$B1,$F2 ; F138 09 AD 82 C0 D0 F0 B1 F2  ........
        .byte   $99,$76,$C0,$88,$10,$F8,$30,$E6 ; F140 99 76 C0 88 10 F8 30 E6  .v....0.
        .byte   $88,$30,$EC,$B1,$F2,$D9,$76,$C0 ; F148 88 30 EC B1 F2 D9 76 C0  .0....v.
        .byte   $F0,$F6,$A9,$0A,$18,$65,$F2,$85 ; F150 F0 F6 A9 0A 18 65 F2 85  .....e..
        .byte   $F2,$90,$AA,$E6,$F3,$B0,$A6,$2C ; F158 F2 90 AA E6 F3 B0 A6 2C  .......,
        .byte   $82,$C0,$50,$48,$A0,$04,$B1,$9E ; F160 82 C0 50 48 A0 04 B1 9E  ..PH....
        .byte   $48,$AA,$C8,$B1,$9E,$48,$A8,$8A ; F168 48 AA C8 B1 9E 48 A8 8A  H....H..
        .byte   $20,$E3,$F3,$20,$2E,$F5,$68,$A8 ; F170 20 E3 F3 20 2E F5 68 A8   .. ..h.
        .byte   $68,$AA,$A9,$00,$85,$F2,$A9,$64 ; F178 68 AA A9 00 85 F2 A9 64  h......d
        .byte   $20,$25,$F4,$38,$A0,$04,$B1,$9E ; F180 20 25 F4 38 A0 04 B1 9E   %.8....
        .byte   $E9,$64,$91,$9E,$C8,$B1,$9E,$E9 ; F188 E9 64 91 9E C8 B1 9E E9  .d......
        .byte   $00,$91,$9E,$A0,$06,$A9,$09,$71 ; F190 00 91 9E A0 06 A9 09 71  .......q
        .byte   $9E,$91,$9E,$C8,$B1,$9E,$69,$00 ; F198 9E 91 9E C8 B1 9E 69 00  ......i.
        .byte   $91,$9E,$A9,$00,$A0,$63,$91,$F4 ; F1A0 91 9E A9 00 A0 63 91 F4  .....c..
        .byte   $88,$10,$FB,$60,$30,$06,$4E,$82 ; F1A8 88 10 FB 60 30 06 4E 82  ...`0.N.
        .byte   $C0,$90,$02,$18,$60,$A2,$13,$4C ; F1B0 C0 90 02 18 60 A2 13 4C  ....`..L
        .byte   $7E,$D6,$20,$40,$F6,$20,$F3,$F3 ; F1B8 7E D6 20 40 F6 20 F3 F3  ~. @. ..
        .byte   $A9,$D3,$20,$2E,$D2,$20,$2E,$ED ; F1C0 A9 D3 20 2E D2 20 2E ED  .. .. ..
        .byte   $20,$E9,$F4,$20,$7A,$F6,$AD,$7C ; F1C8 20 E9 F4 20 7A F6 AD 7C   .. z..|
        .byte   $C0,$85,$0A,$20,$A8,$F4,$AD,$7D ; F1D0 C0 85 0A 20 A8 F4 AD 7D  ... ...}
        .byte   $C0,$20,$DC,$F4,$A6,$0B,$CA,$D0 ; F1D8 C0 20 DC F4 A6 0B CA D0  . ......
        .byte   $08,$AE,$7F,$C0,$AC,$7E,$C0,$D0 ; F1E0 08 AE 7F C0 AC 7E C0 D0  .....~..
        .byte   $0E,$A0,$00,$B1,$02,$C8,$AA,$B1 ; F1E8 0E A0 00 B1 02 C8 AA B1  ........
        .byte   $02,$A8,$A9,$02,$20,$DC,$F4,$84 ; F1F0 02 A8 A9 02 20 DC F4 84  .... ...
        .byte   $F5,$8A,$30,$29,$D0,$0C,$A5,$02 ; F1F8 F5 8A 30 29 D0 0C A5 02  ..0)....
        .byte   $A4,$03,$20,$BA,$D2,$4C,$20,$F6 ; F200 A4 03 20 BA D2 4C 20 F6  .. ..L .
        .byte   $EA,$EA,$0A,$0A,$A0,$00,$B1,$02 ; F208 EA EA 0A 0A A0 00 B1 02  ........
        .byte   $A8,$85,$F2,$A9,$00,$B0,$06,$A0 ; F210 A8 85 F2 A9 00 B0 06 A0  ........
        .byte   $01,$B1,$02,$A4,$F2,$20,$54,$D2 ; F218 01 B1 02 A4 F2 20 54 D2  ..... T.
        .byte   $A5,$29,$4C,$FE,$D1,$A5,$F5,$20 ; F220 A5 29 4C FE D1 A5 F5 20  .)L.... 
        .byte   $64,$D2,$A8,$F0,$08,$88,$B1,$02 ; F228 64 D2 A8 F0 08 88 B1 02  d.......
        .byte   $91,$D1,$98,$D0,$F8,$4C,$8E,$EE ; F230 91 D1 98 D0 F8 4C 8E EE  .....L..
		
		
LF638:  .byte   $14                             ; F638 14                       .
        .byte   $14                             ; F639 14                       .
        .byte   $14                             ; F63A 14                       .
        .byte   $14                             ; F63B 14                       .
LF63C:  .byte   $04                             ; F63C 04                       .
        .byte   $04                             ; F63D 04                       .
        .byte   $04                             ; F63E 04                       .
        .byte   $04                             ; F63F 04                       .		
	
        .byte   $A2,$0A,$A9,$00,$9D,$75,$C0,$CA ; F240 A2 0A A9 00 9D 75 C0 CA  .....u..
        .byte   $D0,$FA,$A5,$0A,$8D,$7C,$C0,$20 ; F248 D0 FA A5 0A 8D 7C C0 20  .....|. 
        .byte   $9E,$D3,$4C,$58,$F6,$20,$98,$D3 ; F250 9E D3 4C 58 F6 20 98 D3  ..LX. ..
        .byte   $F0,$72,$C9,$80,$B0,$6E,$C9,$28 ; F258 F0 72 C9 80 B0 6E C9 28  .r...n.(
        .byte   $F0,$0A,$E0,$05,$F0,$EF,$9D,$76 ; F260 F0 0A E0 05 F0 EF 9D 76  .......v
        .byte   $C0,$E8,$D0,$E9,$20,$98,$D3,$20 ; F268 C0 E8 D0 E9 20 98 D3 20  .... .. 
        .byte   $7F,$D2,$8E,$7B,$C0,$A9,$29,$4C ; F270 7F D2 8E 7B C0 A9 29 4C  ...{..)L
        .byte   $2E,$D2,$AD,$7F,$C0,$8D,$7F,$C0 ; F278 2E D2 AD 7F C0 8D 7F C0  ........
        .byte   $0A,$4C,$1C,$D2,$A9,$00,$85,$F2 ; F280 0A 4C 1C D2 A9 00 85 F2  .L......
        .byte   $8D,$85,$C0,$85,$08,$85,$09,$AD ; F288 8D 85 C0 85 08 85 09 AD  ........
        .byte   $83,$C0,$A2,$08,$85,$F3,$46,$F3 ; F290 83 C0 A2 08 85 F3 46 F3  ......F.
        .byte   $90,$15,$18,$A5,$33,$6D,$85,$C0 ; F298 90 15 18 A5 33 6D 85 C0  ....3m..
        .byte   $8D,$85,$C0,$A5,$34,$65,$08,$85 ; F2A0 8D 85 C0 A5 34 65 08 85  ....4e..
        .byte   $08,$A5,$F2,$65,$09,$85,$09,$06 ; F2A8 08 A5 F2 65 09 85 09 06  ...e....
        .byte   $33,$26,$34,$26,$F2,$CA,$D0,$DE ; F2B0 33 26 34 26 F2 CA D0 DE  3&4&....
        .byte   $20,$CD,$F6,$20,$A8,$F4,$18,$AD ; F2B8 20 CD F6 20 A8 F4 18 AD   .. ....
        .byte   $85,$C0,$65,$06,$85,$06,$90,$02 ; F2C0 85 C0 65 06 85 06 90 02  ..e.....
        .byte   $E6,$07,$A0,$00,$60,$20,$A8,$F4 ; F2C8 E6 07 A0 00 60 20 A8 F4  ....` ..
        .byte   $18,$A5,$08,$A6,$09,$69,$02,$90 ; F2D0 18 A5 08 A6 09 69 02 90  .....i..
        .byte   $01,$E8,$A0,$0A,$38,$F1,$04,$48 ; F2D8 01 E8 A0 0A 38 F1 04 48  ....8..H
        .byte   $C8,$8A,$F1,$04,$A8,$68,$90,$03 ; F2E0 C8 8A F1 04 A8 68 90 03  .....h..
        .byte   $20,$5A,$F7,$A2,$FF,$18,$A5,$08 ; F2E8 20 5A F7 A2 FF 18 A5 08   Z......
        .byte   $69,$05,$85,$08,$90,$02,$E6,$09 ; F2F0 69 05 85 08 90 02 E6 09  i.......
        .byte   $38,$A5,$08,$A8,$E9,$7F,$85,$08 ; F2F8 38 A5 08 A8 E9 7F 85 08  8.......
        .byte   $A5,$09,$E9,$00,$85,$09,$E8,$B0 ; F300 A5 09 E9 00 85 09 E8 B0  ........
        .byte   $F0,$C8,$98,$0A,$8D,$84,$C0,$85 ; F308 F0 C8 98 0A 8D 84 C0 85  ........
        .byte   $F8,$8A,$48,$20,$A8,$F4,$68,$18 ; F310 F8 8A 48 20 A8 F4 68 18  ..H ..h.
        .byte   $65,$05,$85,$05,$85,$F7,$AC,$84 ; F318 65 05 85 05 85 F7 AC 84  e.......
        .byte   $C0,$20,$36,$F7,$4C,$36,$F7,$20 ; F320 C0 20 36 F7 4C 36 F7 20  . 6.L6. 
        .byte   $A8,$F4,$A5,$F7,$85,$05,$A4,$F8 ; F328 A8 F4 A5 F7 85 05 A4 F8  ........
        .byte   $20,$33,$F7,$A2,$A8,$2C,$A2,$88 ; F330 20 33 F7 A2 A8 2C A2 88   3...,..
        .byte   $B1,$04,$8D,$01,$C0,$C8,$B1,$04 ; F338 B1 04 8D 01 C0 C8 B1 04  ........
        .byte   $8D,$02,$C0,$A5,$06,$8D,$03,$C0 ; F340 8D 02 C0 A5 06 8D 03 C0  ........
        .byte   $A5,$07,$8D,$04,$C0,$E6,$07,$C8 ; F348 A5 07 8D 04 C0 E6 07 C8  ........
        .byte   $D0,$04,$E6,$05,$A0,$02,$4C,$75 ; F350 D0 04 E6 05 A0 02 4C 75  ......Lu
        .byte   $DA
	
; ----------------------------------------------------------------------------
LF759:  rts                                     ; F759 60    
	

		
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
        bne     LF819                           ; F814 D0 03                    .. popme
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
		
		.byt $20,$4C ; F488 AA 98 E5 9F A8 60 20 4C  .....` L
        .byte   $D2,$A5,$D4,$A6,$D3,$10,$0C,$49 ; F490 D2 A5 D4 A6 D3 10 0C 49  .......I
        .byte   $FF,$18,$69,$01,$E0,$FF,$F0,$07 ; F498 FF 18 69 01 E0 FF F0 07  ..i.....
        .byte   $4C,$20,$DE,$E0,$00,$D0,$F9,$20 ; F4A0 4C 20 DE E0 00 D0 F9 20  L ..... 
        .byte   $73,$F4,$20,$A8,$F4,$30,$23,$D0 ; F4A8 73 F4 20 A8 F4 30 23 D0  s. ..0#.
        .byte   $1E,$AD,$83,$C0,$24,$D3,$30,$0B ; F4B0 1E AD 83 C0 24 D3 30 0B  ....$.0.
        .byte   $A0,$04,$B1,$04,$48,$C8,$B1,$04 ; F4B8 A0 04 B1 04 48 C8 B1 04  ....H...
        .byte   $A8,$68,$2C,$A0,$00,$24,$A8,$85 ; F4C0 A8 68 2C A0 00 24 A8 85  .h,..$..
        .byte   $F2,$98,$A4,$F2,$4C,$54,$D2,$4C ; F4C8 F2 98 A4 F2 4C 54 D2 4C  ....LT.L
        .byte   $E0,$E0,$20,$0E,$FD,$F0,$EF,$24 ; F4D0 E0 E0 20 0E FD F0 EF 24  .. ....$
        .byte   $D3,$30,$E8,$A9,$00,$F0,$E4,$20 ; F4D8 D3 30 E8 A9 00 F0 E4 20  .0..... 
        .byte   $56,$F9,$D0,$06,$20,$6B,$F9,$4C ; F4E0 56 F9 D0 06 20 6B F9 4C  V... k.L
        .byte   $73,$DA,$B0,$11,$20,$1F,$F9,$08 ; F4E8 73 DA B0 11 20 1F F9 08  s... ...
        .byte   $78,$20,$84,$F6,$B1,$06,$91,$02 ; F4F0 78 20 84 F6 B1 06 91 02  x ......
        .byte   $C8,$D0,$F9,$28,$60,$20,$2E,$ED ; F4F8 C8 D0 F9 28 60 20 2E ED  ...(` ..
        .byte   $20,$D9,$FD,$8A,$20,$7D,$F6,$A5 ; F500 20 D9 FD 8A 20 7D F6 A5   ... }..
        .byte   $06,$A4,$07,$85,$02,$84,$03,$20 ; F508 06 A4 07 85 02 84 03 20  ....... 
        .byte   $DC,$F5,$20,$9E,$D3,$F0,$E5,$20 ; F510 DC F5 20 9E D3 F0 E5 20  .. .... 
        .byte   $2C,$D2,$4C,$FD,$F8,$18,$24,$38 ; F518 2C D2 4C FD F8 18 24 38  ,.L...$8
        .byte   $08,$20,$FA,$D2,$A0,$04,$B1,$04 ; F520 08 20 FA D2 A0 04 B1 04  . ......
        .byte   $C5,$33,$C8,$B1,$04,$E5,$34,$B0 ; F528 C5 33 C8 B1 04 E5 34 B0  .3....4.
        .byte   $08,$28,$90,$07,$A2,$10,$4C,$7E ; F530 08 28 90 07 A2 10 4C 7E  .(....L~
        .byte   $D6,$28,$60,$A0,$04,$A5,$33,$91 ; F538 D6 28 60 A0 04 A5 33 91  .(`...3.
        .byte   $04,$C8,$A5,$34,$91,$04,$20,$5F ; F540 04 C8 A5 34 91 04 20 5F  ...4.. _
        .byte   $F8,$A0,$13,$B1,$00,$48,$C8,$B1 ; F548 F8 A0 13 B1 00 48 C8 B1  .....H..
        .byte   $00,$A8,$68,$4C,$9E,$DA
		
		.byt    $20,$7D ; F550 00 A8 68 4C 9E DA 20 7D  ..hL.. }
        .byte   $F4,$20,$2C,$D2,$20,$A8,$F4,$48 ; F558 F4 20 2C D2 20 A8 F4 48  . ,. ..H
        .byte   $A0,$06,$B1,$00,$8D,$00,$C0,$68 ; F560 A0 06 B1 00 8D 00 C0 68  .......h
        .byte   $C9,$01,$60,$20,$7F,$D2,$8E,$01 ; F568 C9 01 60 20 7F D2 8E 01  ..` ....
        .byte   $C0,$20,$2C,$D2,$20,$7F,$D2,$8E ; F570 C0 20 2C D2 20 7F D2 8E  . ,. ...
        .byte   $02,$C0,$F0,$06,$20,$2C,$D2,$20 ; F578 02 C0 F0 06 20 2C D2 20  .... ,. 
        .byte   $0D,$E6,$20,$A8,$F4,$A5,$02,$A4 ; F580 0D E6 20 A8 F4 A5 02 A4  .. .....
        .byte   $03,$8D,$03,$C0,$8C,$04,$C0,$60 ; F588 03 8D 03 C0 8C 04 C0 60  .......`
        .byte   $20,$0D,$E6,$4C,$4C,$DA,$20,$0D ; F590 20 0D E6 4C 4C DA 20 0D   ..LL. .
        .byte   $E6,$4C,$8A,$DA,$20,$7F,$D2,$8A ; F598 E6 4C 8A DA 20 7F D2 8A  .L.. ...
        .byte   $48,$29,$7F,$CD,$06,$C2,$B0,$20 ; F5A0 48 29 7F CD 06 C2 B0 20  H)..... 
        .byte   $20,$2C,$D2,$20,$7F,$D2,$8A,$CA ; F5A8 20 2C D2 20 7F D2 8A CA   ,. ....
        .byte   $30,$16,$EC,$07,$C2,$B0,$11,$A8 ; F5B0 30 16 EC 07 C2 B0 11 A8  0.......
        .byte   $68,$4C,$15,$DD,$20,$6C,$DC,$48 ; F5B8 68 4C 15 DD 20 6C DC 48  hL.. l.H
        .byte   $98,$20,$ED,$D7,$68,$4C,$EA,$D7 ; F5C0 98 20 ED D7 68 4C EA D7  . ..hL..
        .byte   $4C,$20,$DE,$20,$56,$F9,$D0,$06 ; F5C8 4C 20 DE 20 56 F9 D0 06  L . V...
        .byte   $20,$6B,$F9,$4C,$A4,$DA,$B0,$17 ; F5D0 20 6B F9 4C A4 DA B0 17   k.L....
        .byte   $20,$1D,$F9,$08,$78,$20,$84,$F6 ; F5D8 20 1D F9 08 78 20 84 F6   ...x ..
        .byte   $B1,$02,$91,$06,$C8,$CC,$83,$C0 ; F5E0 B1 02 91 06 C8 CC 83 C0  ........
        .byte   $D0,$F6,$20,$27,$F7,$28,$60,$20 ; F5E8 D0 F6 20 27 F7 28 60 20  .. '.(` 
        .byte   $24,$D2,$20,$0E,$FD,$D0,$24,$A2 ; F5F0 24 D2 20 0E FD D0 24 A2  $. ...$.
        .byte   $05,$A0,$00,$24,$28,$10,$0D,$A5 ; F5F8 05 A0 00 24 28 10 0D A5  ...$(...
        .byte   $D3,$A6,$D4,$85,$91,$86,$92,$B1 ; F600 D3 A6 D4 85 91 86 92 B1  ........
        .byte   $91,$AA,$A0,$80,$8C,$7F,$C0,$20 ; F608 91 AA A0 80 8C 7F C0 20  ....... 
        .byte   $39,$FA,$A9,$FF,$20,$CC,$FD,$91 ; F610 39 FA A9 FF 20 CC FD 91  9... ...
        .byte   $02,$30,$10,$20,$D9,$FD,$48,$8A ; F618 02 30 10 20 D9 FD 48 8A  .0. ..H.
        .byte   $20,$7D,$F6,$20,$2A,$FD,$68,$AA ; F620 20 7D F6 20 2A FD 68 AA   }. *.h.
        .byte   $20,$39,$FA,$20,$9E,$D3,$F0,$06 ; F628 20 39 FA 20 9E D3 F0 06   9. ....
        .byte   $20,$2C,$D2,$4C,$EF,$F9,$4C,$46 ; F630 20 2C D2 4C EF F9 4C 46   ,.L..LF
        .byte   $FD,$8E,$7E,$C0,$A5,$06,$A4,$07 ; F638 FD 8E 7E C0 A5 06 A4 07  ..~.....
        .byte   $85,$02,$84,$03,$18,$A0,$00,$20 ; F640 85 02 84 03 18 A0 00 20  ....... 
        .byte   $9E,$FC,$20,$A8,$F4,$4C,$38,$FE ; F648 9E FC 20 A8 F4 4C 38 FE  .. ..L8.
        .byte   $48,$20,$98,$D3,$20,$2C,$D2,$68 ; F650 48 20 98 D3 20 2C D2 68  H .. ,.h
        .byte   $C9,$44,$D0,$20,$AD,$09,$C0,$8D ; F658 C9 44 D0 20 AD 09 C0 8D  .D. ....
        .byte   $00,$C0,$20,$7F,$F4,$F0,$06,$20 ; F660 00 C0 20 7F F4 F0 06 20  .. .... 
        .byte   $2C,$D2,$20,$0D,$E6,$A9,$00,$A0 ; F668 2C D2 20 0D E6 A9 00 A0  ,. .....
        .byte   $01,$20,$CB,$FA,$A0,$06,$AD,$00 ; F670 01 20 CB FA A0 06 AD 00  . ......
        .byte   $C0,$91,$00,$60,$C9,$52,$D0,$12 ; F678 C0 91 00 60 C9 52 D0 12  ...`.R..
        .byte   $A9,$00,$A0,$08,$20,$08,$FB,$D0 ; F680 A9 00 A0 08 20 08 FB D0  .... ...
        .byte   $F2,$20,$2C,$D2,$4C,$D8,$F9,$4C ; F688 F2 20 2C D2 4C D8 F9 4C  . ,.L..L
        .byte   $23,$DE,$C9,$53,$D0,$F9,$A9,$80 ; F690 23 DE C9 53 D0 F9 A9 80  #..S....
        .byte   $A0,$10,$20,$08,$FB,$08,$A0,$03 ; F698 A0 10 20 08 FB 08 A0 03  .. .....
        .byte   $A9,$0C,$91,$00,$C8,$A9,$00,$91 ; F6A0 A9 0C 91 00 C8 A9 00 91  ........
        .byte   $00,$C8,$91,$00,$28,$D0,$09,$A0 ; F6A8 00 C8 91 00 28 D0 09 A0  ....(...
        .byte   $00,$A9,$FF,$91,$02,$4C,$46,$FD ; F6B0 00 A9 FF 91 02 4C 46 FD  .....LF.
        .byte   $4C,$44,$FD,$20,$C0,$FA,$30,$DD ; F6B8 4C 44 FD 20 C0 FA 30 DD  LD. ..0.
        .byte   $20,$7D,$F4,$20,$A8,$F4,$30,$B3 ; F6C0 20 7D F4 20 A8 F4 30 B3   }. ..0.
        .byte   $4C,$E0,$E0,$48,$98,$48,$A0,$05 ; F6C8 4C E0 E0 48 98 48 A0 05  L..H.H..
		
		
		
		
        .byte   $B1,$9E,$D0,$02,$A0,$03,$88,$B1 ; F6D0 B1 9E D0 02 A0 03 88 B1  ........
        .byte   $9E,$AA,$48,$C8,$B1,$9E,$48,$A8 ; F6D8 9E AA 48 C8 B1 9E 48 A8  ..H...H.
        .byte   $A9,$01,$85,$F2,$A9,$21,$20,$25 ; F6E0 A9 01 85 F2 A9 21 20 25  .....! %
        .byte   $F4,$20,$CF,$F3,$C8,$68,$91,$F2 ; F6E8 F4 20 CF F3 C8 68 91 F2  . ...h..
        .byte   $88,$68,$91,$F2,$20,$A8,$F4,$68 ; F6F0 88 68 91 F2 20 A8 F4 68  .h.. ..h
        .byte   $91,$00,$68,$C8,$91,$00,$8D,$83 ; F6F8 91 00 68 C8 91 00 8D 83  ..h.....
        .byte   $C0,$60,$4C,$E0,$E0,$4C,$20,$DE ; F700 C0 60 4C E0 E0 4C 20 DE  .`L..L .
        .byte   $85,$0B,$84,$F9,$20,$4F,$D4,$20 ; F708 85 0B 84 F9 20 4F D4 20  .... O. 
        .byte   $9E,$D7,$20,$2C,$D2,$20,$7F,$F4 ; F710 9E D7 20 2C D2 20 7F F4  .. ,. ..
        .byte   $20,$2D,$DB,$08,$D0,$22,$A2,$00 ; F718 20 2D DB 08 D0 22 A2 00   -..."..
        .byte   $24,$0B,$30,$0A,$20,$2C,$D2,$20 ; F720 24 0B 30 0A 20 2C D2 20  $.0. ,. 
        .byte   $7F,$D2,$E0,$03,$90,$D7,$A9,$00 ; F728 7F D2 E0 03 90 D7 A9 00  ........
        .byte   $8D,$52,$C0,$8D,$53,$C0,$A8,$8A ; F730 8D 52 C0 8D 53 C0 A8 8A  .R..S...
        .byte   $A6,$F9,$20,$00,$DE,$20,$30,$DB ; F738 A6 F9 20 00 DE 20 30 DB  .. .. 0.
        .byte   $BD,$0C,$C3,$BC,$0D,$C3,$20,$5D ; F740 BD 0C C3 BC 0D C3 20 5D  ...... ]
        .byte   $DA,$AD,$03,$C1,$C5,$F9,$D0,$B2 ; F748 DA AD 03 C1 C5 F9 D0 B2  ........
        .byte   $AD,$06,$C1,$A4,$0B,$20,$CB,$FA ; F750 AD 06 C1 A4 0B 20 CB FA  ..... ..
        .byte   $A0,$07,$AE,$27,$C0,$BD,$00,$C3 ; F758 A0 07 AE 27 C0 BD 00 C3  ...'....
        .byte   $91,$00,$E8,$C8,$C0,$17,$D0,$F5 ; F760 91 00 E8 C8 C0 17 D0 F5  ........
        .byte   $A9,$FF,$A0,$02,$91,$00,$C6,$05 ; F768 A9 FF A0 02 91 00 C6 05  ........
        .byte   $20,$6A,$F8,$20,$5F,$F8,$20,$73 ; F770 20 6A F8 20 5F F8 20 73   j. _. s
        .byte   $DA,$A0,$00,$B1,$04,$8D,$01,$C0 ; F778 DA A0 00 B1 04 8D 01 C0  ........
        .byte   $C8,$B1,$04,$8D,$02,$C0,$D0,$E8 ; F780 C8 B1 04 8D 02 C0 D0 E8  ........
        .byte   $20,$74,$FA,$28,$60,$F0,$11,$20 ; F788 20 74 FA 28 60 F0 11 20   t.(`.. 
        .byte   $7D,$F4,$20,$AF,$FB,$20,$9E,$D3 ; F790 7D F4 20 AF FB 20 9E D3  }. .. ..
        .byte   $F0,$14,$20,$2C,$D2,$4C,$8F,$FB ; F798 F0 14 20 2C D2 4C 8F FB  .. ,.L..
        .byte   $20,$F3,$F3,$A9,$3F,$85,$0A,$20 ; F7A0 20 F3 F3 A9 3F 85 0A 20   ...?.. 
        .byte   $AF,$FB,$C6,$0A,$10,$F9,$60,$20 ; F7A8 AF FB C6 0A 10 F9 60 20  ......` 
        .byte   $CF,$F3,$98,$C8,$91,$F2,$4C,$E6 ; F7B0 CF F3 98 C8 91 F2 4C E6  ......L.
        .byte   $F4,$4C,$E0,$E0,$4C,$23,$DE,$20 ; F7B8 F4 4C E0 E0 4C 23 DE 20  .L..L#. 
        .byte   $7D,$F4,$20,$2C,$D2,$20,$A8,$F4 ; F7C0 7D F4 20 2C D2 20 A8 F4  }. ,. ..
        .byte   $30,$EF,$AD,$80,$C0,$C5,$0A,$F0 ; F7C8 30 EF AD 80 C0 C5 0A F0  0.......
        .byte   $05,$A9,$00,$8D,$81,$C0,$20,$40 ; F7D0 05 A9 00 8D 81 C0 20 40  ...... @
        .byte   $F6,$A9,$C3,$20,$2E,$D2,$F0,$DC ; F7D8 F6 A9 C3 20 2E D2 F0 DC  ... ....
        .byte   $48,$20,$98,$D3,$68,$A0,$00,$A2 ; F7E0 48 20 98 D3 68 A0 00 A2  H ..h...
        .byte   $05,$C9,$C0,$F0,$1A,$A2,$02,$C8 ; F7E8 05 C9 C0 F0 1A A2 02 C8  ........
        .byte   $C9,$25,$F0,$13,$CA,$A0,$40,$C9 ; F7F0 C9 25 F0 13 CA A0 40 C9  .%....@.
        .byte   $4F,$F0,$0C,$C9,$24,$D0,$BD,$20 ; F7F8 4F F0 0C C9 24 D0 BD 20  O...$.. 
        .byte   $7F,$D2,$8A,$F0,$4F,$A0,$80,$8C ; F800 7F D2 8A F0 4F A0 80 8C  ....O...
        .byte   $7F,$C0,$8E,$7E,$C0,$AD,$81,$C0 ; F808 7F C0 8E 7E C0 AD 81 C0  ...~....
        .byte   $A4,$0A,$8D,$7D,$C0,$8C,$7C,$C0 ; F810 A4 0A 8D 7D C0 8C 7C C0  ...}..|.
        .byte   $18,$A6,$0B,$D0,$05,$69,$02,$20 ; F818 18 A6 0B D0 05 69 02 20  .....i. 
        .byte   $57,$FC,$6D,$7E,$C0,$20,$57,$FC ; F820 57 FC 6D 7E C0 20 57 FC  W.m~. W.
        .byte   $8D,$81,$C0,$20,$EC,$F4,$B0,$03 ; F828 8D 81 C0 20 EC F4 B0 03  ... ....
        .byte   $20,$EF,$F4,$A0,$09,$B9,$76,$C0 ; F830 20 EF F4 A0 09 B9 76 C0   .....v.
        .byte   $91,$F4,$88,$10,$F8,$A2,$00,$20 ; F838 91 F4 88 10 F8 A2 00 20  ....... 
        .byte   $9E,$D3,$D0,$04,$8E,$81,$C0,$60 ; F840 9E D3 D0 04 8E 81 C0 60  .......`
        .byte   $20,$2C,$D2,$D0,$89,$A5,$0A,$8D ; F848 20 2C D2 D0 89 A5 0A 8D   ,......
        .byte   $80,$C0,$18,$60,$4C,$20,$DE,$F0 ; F850 80 C0 18 60 4C 20 DE F0  ...`L ..
        .byte   $10,$B0,$13,$AE,$83,$C0,$F0,$F2 ; F858 10 B0 13 AE 83 C0 F0 F2  ........
        .byte   $CD,$83,$C0,$F0,$ED,$90,$EB,$B0 ; F860 CD 83 C0 F0 ED 90 EB B0  ........
        .byte   $05,$AE,$83,$C0,$F0,$E4,$A2,$11 ; F868 05 AE 83 C0 F0 E4 A2 11  ........
        .byte   $4C,$7E,$D6,$18,$24,$38,$08,$20 ; F870 4C 7E D6 18 24 38 08 20  L~..$8. 
        .byte   $F3,$F3,$20,$40,$F6,$A9,$D5,$20 ; F878 F3 F3 20 40 F6 A9 D5 20  .. @... 
  

  .byte   $2E,$D2,$20,$24,$D2,$20,$E9,$F4 ; F880 2E D2 20 24 D2 20 E9 F4  .. $. ..
        .byte   $20,$7A,$F6,$20,$A8,$F4,$AD,$7C ; F888 20 7A F6 20 A8 F4 AD 7C   z. ...|
        .byte   $C0,$85,$0A,$AC,$7D,$C0,$AE,$7E ; F890 C0 85 0A AC 7D C0 AE 7E  ....}..~
        .byte   $C0,$A5,$0B,$D0,$0C,$28,$08,$AD ; F898 C0 A5 0B D0 0C 28 08 AD  .....(..
        .byte   $7F,$C0,$91,$02,$C8,$8A,$91,$02 ; F8A0 7F C0 91 02 C8 8A 91 02  ........
        .byte   $C8,$98,$20,$DC,$F4,$28,$A0,$00 ; F8A8 C8 98 20 DC F4 28 A0 00  .. ..(..
        .byte   $AD,$7F,$C0,$30,$22,$F0,$19,$20 ; F8B0 AD 7F C0 30 22 F0 19 20  ...0".. 
        .byte   $4C,$D2,$A0,$00,$A5,$D4,$91,$02 ; F8B8 4C D2 A0 00 A5 D4 91 02  L.......
        .byte   $2C,$7F,$C0,$50,$05,$A5,$D3,$D0 ; F8C0 2C 7F C0 50 05 A5 D3 D0  ,..P....
        .byte   $8B,$60,$C8,$A5,$D3,$91,$02,$60 ; F8C8 8B 60 C8 A5 D3 91 02 60  .`.....`
        .byte   $A6,$02,$A4,$03,$4C,$C2,$D2,$08 ; F8D0 A6 02 A4 03 4C C2 D2 08  ....L...
        .byte   $20,$74,$D2,$85,$D0,$AC,$7E,$C0 ; F8D8 20 74 D2 85 D0 AC 7E C0   t....~.
        .byte   $F0,$07,$A9,$20,$88,$91,$02,$D0 ; F8E0 F0 07 A9 20 88 91 02 D0  ... ....
        .byte   $FB,$28,$B0,$0E,$EA,$EA,$C4,$D0 ; F8E8 FB 28 B0 0E EA EA C4 D0  .(......
        .byte   $B0,$07,$B1,$91,$91,$02,$C8,$D0 ; F8F0 B0 07 B1 91 91 02 C8 D0  ........
        .byte   $F5,$60,$A4,$D0,$F0,$0F,$88,$C6 ; F8F8 F5 60 A4 D0 F0 0F 88 C6  .`......
        .byte   $D0,$B1,$91,$CE,$7E,$C0,$AC,$7E ; F900 D0 B1 91 CE 7E C0 AC 7E  ....~..~
        .byte   $C0,$91,$02,$D0,$ED,$60,$20,$A8 ; F908 C0 91 02 D0 ED 60 20 A8  .....` .
        .byte   $F4,$A0,$03,$B1,$00,$8D,$86,$C0 ; F910 F4 A0 03 B1 00 8D 86 C0  ........
        .byte   $C8,$B1,$00,$8D,$87,$C0,$C8,$B1 ; F918 C8 B1 00 8D 87 C0 C8 B1  ........
        .byte   $00,$8D,$88,$C0,$A8,$B1,$02,$C9 ; F920 00 8D 88 C0 A8 B1 02 C9  ........
        .byte   $FF,$60,$20,$A8,$F4,$A0,$05,$AD ; F928 FF 60 20 A8 F4 A0 05 AD  .` .....
        .byte   $88,$C0,$91,$00,$88,$AD,$87,$C0 ; F930 88 C0 91 00 88 AD 87 C0  ........
        .byte   $91,$00,$88,$AD,$86,$C0,$D1,$00 ; F938 91 00 88 AD 86 C0 D1 00  ........
        .byte   $91,$00,$F0,$E5
		
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
        rts   
		
		.byt $A2,$0F,$4C,$7E ; F9D0 00 A8 68 60 A2 0F 4C 7E  ..h`..L~
        .byte   $D6,$20,$0E,$FD,$F0,$F6,$A0,$00 ; F9D8 D6 20 0E FD F0 F6 A0 00  . ......
        .byte   $91,$06,$20,$7A,$FD,$A0,$01,$91 ; F9E0 91 06 20 7A FD A0 01 91  .. z....
        .byte   $06,$C8,$84,$F5,$85,$F6,$E6,$F6 ; F9E8 06 C8 84 F5 85 F6 E6 F6  ........
        .byte   $20,$7A,$FD,$A4,$F5,$E6,$F5,$91 ; F9F0 20 7A FD A4 F5 E6 F5 91   z......
        .byte   $06,$C6,$F6,$D0,$F3

	
		
		.byt   $A0,$00,$B1 ; F9F8 06 C6 F6 D0 F3 A0 00 B1  ........
        .byte   $06,$AA,$C8,$B1,$06,$60,$EA,$20 ; FA00 06 AA C8 B1 06 60 EA 20  .....`. 
        .byte   $C0,$FA,$A9,$FF,$85,$33,$85,$34 ; FA08 C0 FA A9 FF 85 33 85 34  .....3.4
        .byte   $30,$09,$20,$C0,$FA,$20,$2C,$D2 ; FA10 30 09 20 C0 FA 20 2C D2  0. .. ,.
        .byte   $20,$FA,$D2,$08,$78,$A5,$33,$05 ; FA18 20 FA D2 08 78 A5 33 05   ...x.3.
        .byte   $34,$F0,$13,$A5,$33,$D0,$02,$C6 ; FA20 34 F0 13 A5 33 D0 02 C6  4...3...
        .byte   $34,$C6,$33,$20,$0E,$FD,$F0,$06 ; FA28 34 C6 33 20 0E FD F0 06  4.3 ....
        .byte   $20,$D9,$FD,$4C,$1D,$FE,$28,$60 ; FA30 20 D9 FD 4C 1D FE 28 60   ..L..(`
     

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



    .byte   $46,$F2,$46,$F4,$A2,$0C,$CA,$30 ; FA58 46 F2 46 F4 A2 0C CA 30  F.F....0
        .byte   $22,$BD,$91,$C0,$9D,$29,$C0,$BC ; FA60 22 BD 91 C0 9D 29 C0 BC  "....)..
        .byte   $9E,$C0,$C9,$3F,$F0,$08,$C0,$3F ; FA68 9E C0 C9 3F F0 08 C0 3F  ...?...?
        .byte   $D0,$EC,$66,$F2,$D0,$E8,$66,$F4 ; FA70 D0 EC 66 F2 D0 E8 66 F4  ..f...f.
        .byte   $24,$16,$70,$E2,$C0,$3F,$F0,$DE ; FA78 24 16 70 E2 C0 3F F0 DE  $.p..?..
        .byte   $4C,$AC,$D5,$24,$F2,$10,$0C,$A2 ; FA80 4C AC D5 24 F2 10 0C A2  L..$....
        .byte   $0C,$BD,$9D,$C0,$C9,$3F,$D0,$F0 ; FA88 0C BD 9D C0 C9 3F D0 F0  .....?..
        .byte   $CA,$D0,$F6,$58,$60,$20,$C5,$E7 ; FA90 CA D0 F6 58 60 20 C5 E7  ...X` ..
        .byte   $20,$C0,$FA,$20,$02,$D3,$10,$0C ; FA98 20 C0 FA 20 02 D3 10 0C   .. ....
        .byte   $20,$3D,$FF,$C9,$20,$F0,$05,$C9 ; FAA0 20 3D FF C9 20 F0 05 C9    .. ...
        .byte   $03,$D0,$F5,$60,$20,$0E,$FD,$F0 ; FAA8 03 D0 F5 60 20 0E FD F0  ...` ...
        .byte   $16,$20,$D9,$FD,$F0,$E5,$85,$F2 ; FAB0 16 20 D9 FD F0 E5 85 F2  . ......
        .byte   $8A,$10,$0F,$C8,$B1,$06,$20,$2A ; FAB8 8A 10 0F C8 B1 06 20 2A  ...... *
        .byte   $D6,$C6,$F2,$D0,$F6,$F0,$D4,$4C ; FAC0 D6 C6 F2 D0 F6 F0 D4 4C  .......L
        .byte   $D6,$E7,$18,$A5,$06,$A4,$07,$69 ; FAC8 D6 E7 18 A5 06 A4 07 69  .......i
        .byte   $02,$90,$01,$C8,$20,$BA,$D2,$20 ; FAD0 02 90 01 C8 20 BA D2 20  .... .. 
        .byte   $D2,$D2,$20,$37,$D6,$4C,$9B,$FE ; FAD8 D2 D2 20 37 D6 4C 9B FE  .. 7.L..
        .byte   $20,$07,$FE,$20,$00,$FF,$20,$3D ; FAE0 20 07 FE 20 00 FF 20 3D   .. ..  
        .byte   $FF,$A4,$F2,$C9,$03,$F0,$48,$C9 ; FAE8 FF A4 F2 C9 03 F0 48 C9  ......H.
        .byte   $0D,$D0,$05,$20,$1B,$FF,$A9,$0A ; FAF0 0D D0 05 20 1B FF A9 0A  ... ....
        .byte   $20,$1B,$FF,$84,$F2,$4C,$E6,$FE ; FAF8 20 1B FF 84 F2 4C E6 FE   ....L..
        .byte   $00,$00,$F4,$A9,$80,$91,$06,$C8 ; FB00 00 00 F4 A9 80 91 06 C8  ........
        .byte   $A9,$D8,$91,$06,$A9,$00,$C8,$84 ; FB08 A9 D8 91 06 A9 00 C8 84  ........
        .byte   $F2,$91,$06,$C8,$C0,$DA,$D0,$F9 ; FB10 F2 91 06 C8 C0 DA D0 F9  ........
        .byte   $A0,$02,$60,$91,$06,$20,$2A,$D6 ; FB18 A0 02 60 91 06 20 2A D6  ..`.. *.
        .byte   $C8,$C0,$DA,$D0,$F5,$20,$38,$FE ; FB20 C8 C0 DA D0 F5 20 38 FE  ..... 8.
        .byte   $A9,$FF,$20,$CC,$FD,$91,$02,$20 ; FB28 A9 FF 20 CC FD 91 02 20  .. .... 
        .byte   $46,$FD,$A0,$02,$4C,$00,$FF,$20 ; FB30 46 FD A0 02 4C 00 FF 20  F...L.. 
        .byte   $25,$FF,$4C,$46,$FD,$20,$45,$D8 ; FB38 25 FF 4C 46 FD 20 45 D8  %.LF. E.
        .byte   $10,$FB,$60
		
	



SEDORIC_VECTORS:

        jmp     LED36                           ; FF43 4C 36 ED                 L6.

; ----------------------------------------------------------------------------
        jmp     LD398                           ; FF46 4C 98 D3                 L..

	
		
		.byt $4C,$9E,$D3,$4C,$4F,$D4,$4C ; FB48 D3 4C 9E D3 4C 4F D4 4C  .L..LO.L
        .byte   $51,$D4
       
	
/*		

; ----------------------------------------------------------------------------
        jmp     LD39E                           ; FF49 4C 9E D3                 L..

; ----------------------------------------------------------------------------
        jmp     LD44F                           ; FF4C 4C 4F D4                 LO.

; ----------------------------------------------------------------------------
        jmp     LD451                           ; FF4F 4C 51 D4                 LQ.
*/
; ----------------------------------------------------------------------------
        jmp     LD364                           ; FF52 4C 64 D3                 Ld.

.byt $4C,$F3,$F3 ; FB50 51 D4 4C 64 D3 4C F3 F3  Q.Ld.L..		
/*
; ----------------------------------------------------------------------------
        jmp     LF3F3                           ; FF55 4C F3 F3                 L..
*/
; ----------------------------------------------------------------------------
        jmp     LF4A8                           ; FF58 4C A8 F4                 L..

 .byte   $4C,$D9,$FD		
		
/*
; ----------------------------------------------------------------------------
        jmp     LFDD9                           ; FF5B 4C D9 FD                 L..
*/
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
/*
; ----------------------------------------------------------------------------
        jmp     LE0E5                           ; FF73 4C E5 E0                 L..

; ----------------------------------------------------------------------------
        jmp     LDE28                           ; FF76 4C 28 DE                 L(.

; ----------------------------------------------------------------------------
        jmp     LDFE6                           ; FF79 4C E6 DF                 L..
*/
.byte  $4C,$E5,$E0,$4C,$28 ; FB70 4C EA E0 4C E5 E0 4C 28  L..L..L(
        .byte   $DE,$4C,$E6,$DF

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

		
SEDORIC_COPYRIGHT_TEXT 
        .asc   "SEDORIC 1.0 par F.BROCHE et D.SEBBAG(c) 1985 EUREKA"
; ----------------------------------------------------------------------------
SEDORIC_NMI_VECTOR 
        .word   $D121                           ; FFFA 21 D1                    !.
SEDORIC_RESET_VECTOR 
        .word   $2310                           ; FFFC 10 23                    .#
; ----------------------------------------------------------------------------
SEDORIC_IRQ_VECTOR 
        .word   $B97B                           ; FFFE 7B B9                    {.

		
		
