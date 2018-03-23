.include "tiles.inc"
.include "levels.inc"
.include "sp_minmap.inc"
.include "int16.inc"

.export board_init
.export board_setlevel

.zeropage

lvlptr:		.res	2
tmpptr:		.res	2

maprow:		.res	1
mapcol:		.res	1
screenrow:	.res	1
tilepos:	.res	1
tmp:		.res	1
mmrowbg:	.res	9
mmrowfg:	.res	4

.bss

board:		.res	$21 * $14
br1 = board + $21
br2 = br1 + $21
br3 = br2 + $21
br4 = br3 + $21
br5 = br4 + $21
br6 = br5 + $21
br7 = br6 + $21
br8 = br7 + $21
br9 = br8 + $21
br10 = br9 + $21
br11 = br10 + $21
br12 = br11 + $21
br13 = br12 + $21
br14 = br13 + $21
br15 = br14 + $21
br16 = br15 + $21
br17 = br16 + $21
br18 = br17 + $21
br19 = br18 + $21

.data

boardrowptrl:
.byte <board,<br1,<br2,<br3,<br4,<br5,<br6,<br7,<br8,<br9
.byte <br10,<br11,<br12,<br13,<br14,<br15,<br16,<br17,<br18,<br19

boardrowptrh:
.byte >board,>br1,>br2,>br3,>br4,>br5,>br6,>br7,>br8,>br9
.byte >br10,>br11,>br12,>br13,>br14,>br15,>br16,>br17,>br18,>br19

scrrowptrl:
.byte $00,$28,$50,$78,$a0,$c8,$f0,$18,$40,$68,$90,$b8,$e0,$08,$30,$58
.byte $80,$a8,$d0,$f8,$20,$48,$70,$98,$c0

scrrowptrh:
.byte $f8,$f8,$f8,$f8,$f8,$f8,$f8,$f9,$f9,$f9,$f9,$f9,$f9,$fa,$fa,$fa
.byte $fa,$fa,$fa,$fa,$fb,$fb,$fb,$fb,$fb

colrowptrh:
.byte $d8,$d8,$d8,$d8,$d8,$d8,$d8,$d9,$d9,$d9,$d9,$d9,$d9,$da,$da,$da
.byte $da,$da,$da,$da,$db,$db,$db,$db,$db

.code

.proc board_init
		lda	#$0
		tax
clearloop:	sta	board,x
		sta	board+$100,x
		sta	board+$194,x
		inx
		bne	clearloop
		lda	#$4
		ldx	#$20
wallloop:	sta	board,x
		sta	br19,x
		dex
		bpl	wallloop
		sta	br1
		sta	br2-1
		sta	br2
		sta	br3-1
		sta	br3
		sta	br4-1
		sta	br4
		sta	br5-1
		sta	br5
		sta	br6-1
		sta	br6
		sta	br7-1
		sta	br7
		sta	br8-1
		sta	br8
		sta	br9-1
		sta	br9
		sta	br10-1
		sta	br10
		sta	br11-1
		sta	br11
		sta	br12-1
		sta	br12
		sta	br13-1
		sta	br13
		sta	br14-1
		sta	br14
		sta	br15-1
		sta	br15
		sta	br16-1
		sta	br16
		sta	br17-1
		sta	br17
		sta	br18-1
		sta	br18
		sta	br19-1
		rts
.endproc

.proc board_setlevel
		ldx	#$40
		stx	tmpptr
		ldx	#$2
		stx	tmpptr+1
		int16_multaq lvlptr, tmpptr
		clc
		lda	#<levels
		adc	lvlptr
		sta	lvlptr
		lda	#>levels
		adc	lvlptr+1
		sta	lvlptr+1
		lda	#<(br1+1)
		sta	tmpptr
		lda	#>(br1+1)
		sta	tmpptr+1
		ldx	#$12
lvlloop:	ldy	#$1e
lvlrowloop:	lda	(lvlptr),y
		sta	(tmpptr),y
		dey
		bpl	lvlrowloop
		lda	#$21
		int16_adda tmpptr, tmpptr
		lda	#$20
		int16_adda lvlptr, lvlptr
		dex
		bne	lvlloop

		lda	#$35
		sta	screenrow
		ldy	#$12
mminitloop:	lda	boardrowptrl,y
		sta	mapfetchptr
		lda	boardrowptrh,y
		sta	mapfetchptr+1
		lda	#$0
		ldx	#$c
mmrowclr:	sta	mmrowbg,x
		dex
		bpl	mmrowclr
		ldx	#$1f
mapfetchptr	= *+1
mmrowloop:	lda	$ffff,x
		cmp	#$4
		ror	mmrowfg
		ror	mmrowfg+1
		ror	mmrowfg+2
		ror	mmrowfg+3
		ror	mmrowfg+4
		lsr	a
		ror	mmrowbg
		ror	mmrowbg+1
		ror	mmrowbg+2
		ror	mmrowbg+3
		ror	mmrowbg+4
		ror	mmrowbg+5
		ror	mmrowbg+6
		ror	mmrowbg+7
		ror	mmrowbg+8
		lsr	a
		ror	mmrowbg
		ror	mmrowbg+1
		ror	mmrowbg+2
		ror	mmrowbg+3
		ror	mmrowbg+4
		ror	mmrowbg+5
		ror	mmrowbg+6
		ror	mmrowbg+7
		ror	mmrowbg+8
mmrownext:	dex
		bne	mmrowloop
		ldx	screenrow
		lda	mmrowbg+2
		sta	mmbgleft,x
		lda	mmrowbg+5
		sta	mmbgmid,x
		lda	mmrowbg+8
		sta	mmbgright,x
		lda	mmrowfg+2
		sta	mmfgleft,x
		lda	#$0
		sta	mmfgright,x
		dex
		lda	mmrowbg+1
		sta	mmbgleft,x
		lda	mmrowbg+4
		sta	mmbgmid,x
		lda	mmrowbg+7
		sta	mmbgright,x
		lda	mmrowfg+1
		sta	mmfgleft,x
		lda	#$0
		sta	mmfgright,x
		dex
		lda	mmrowbg
		sta	mmbgleft,x
		lda	mmrowbg+3
		sta	mmbgmid,x
		lda	mmrowbg+6
		sta	mmbgright,x
		lda	mmrowfg
		sta	mmfgleft,x
		lda	mmrowfg+3
		sta	mmfgright,x
		dex
		stx	screenrow
		dey
		beq	scinit
		jmp	mminitloop

scinit:		lda	#$27
		sta	maprow
		lda	#$17
		sta	screenrow
scinitloop:	lda	maprow
		lsr	a
		ror	tmp
		tay
		lda	boardrowptrl,y
		sta	tilefetchptr
		lda	boardrowptrh,y
		sta	tilefetchptr+1
		ldx	screenrow
		lda	scrrowptrl,x
		sta	charstoreptr
		sta	charstoreptr2
		sta	colstoreptr
		sta	colstoreptr2
		lda	scrrowptrh,x
		sta	charstoreptr+1
		sta	charstoreptr2+1
		lda	colrowptrh,x
		sta	colstoreptr+1
		sta	colstoreptr2+1
		ldx	#$13
		stx	mapcol
tilerowloop:	ldx	mapcol
tilefetchptr	= *+1
		lda	$ffff,x
		asl	a
		asl	a
		tax
		bit	tmp
		bpl	readtilechars
		inx
		inx
readtilechars:	lda	mapcol
		asl	a
		tay
		lda	tiles,x
		stx	tilepos
charstoreptr	= *+1
		sta	$ffff,y
		tax
		lda	charattr,x
colstoreptr	= *+1
		sta	$ffff,y
		ldx	tilepos
		inx
		iny
		lda	tiles,x
charstoreptr2	= *+1
		sta	$ffff,y
		tax
		lda	charattr,x
colstoreptr2	= *+1
		sta	$ffff,y
		dec	mapcol
		bpl	tilerowloop
		dec	maprow
		dec	screenrow
		bpl	scinitloop
		rts
.endproc

