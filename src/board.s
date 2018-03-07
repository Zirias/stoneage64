.include "tiles.inc"
.include "levels.inc"

.export startlevel

.zeropage

maprow:		.res	1
mapcol:		.res	1
screenrow:	.res	1
tilepos:	.res	1
tmp:		.res	1
lvlrowptrl:	.res	2
lvlrowptrh:	.res	2

.data

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

startlevel:
		asl	a
		asl	a
		tax
		lda	lvlrowptrs,x
		sta	lvlrowptrl
		lda	lvlrowptrs+1,x
		sta	lvlrowptrl+1
		lda	lvlrowptrs+2,x
		sta	lvlrowptrh
		lda	lvlrowptrs+3,x
		sta	lvlrowptrh+1

		lda	#$27
		sta	maprow
		lda	#$18
		sta	screenrow
scinitloop:	lda	maprow
		lsr	a
		ror	tmp
		tay
		lda	(lvlrowptrl),y
		sta	tilefetchptr
		lda	(lvlrowptrh),y
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

