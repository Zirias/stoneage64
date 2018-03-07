.include "board.inc"
.include "sp_willy.inc"
.include "vic.inc"
.include "cia.inc"

.zeropage
willy_blink:	.res	1
willy_blwait:	.res	1

.code
		lda	#$fc
		sta	CIA2_PRA
		lda	#$e5
		sta	VIC_MEMCTL
		lda	#$d3
		sta	VIC_CTL2
		lda	#$13
		sta	VIC_CTL1
		lda	#$ff
		sta	VIC_RASTER
		lda	#$9
		sta	BG_COLOR_0
		lda	#$b
		sta	BORDER_COLOR
		lda	#$0
		sta	BG_COLOR_1
		lda	#$c
		sta	BG_COLOR_2
		ldx	#<(willy0_3 >> 6)
		stx	$fbf8
		dex
		stx	$fbf9
		dex
		stx	$fbfa
		dex
		stx	$fbfb
		lda	#$0
		sta	SPRITE_X_HB
		lda	#$3b
		sta	SPRITE_0_X
		sta	SPRITE_1_X
		sta	SPRITE_2_X
		sta	SPRITE_3_X
		lda	#$da
		sta	SPRITE_0_Y
		sta	SPRITE_1_Y
		sta	SPRITE_2_Y
		sta	SPRITE_3_Y
		lda	#$2
		sta	SPRITE_MCOL_1
		lda	#$6
		sta	SPRITE_MCOL_2
		lda	#$e
		sta	SPRITE_0_COL
		lda	#$5
		sta	SPRITE_1_COL
		lda	#$1
		sta	SPRITE_2_COL
		lda	#$3
		sta	SPRITE_3_COL
		lda	#$f
		sta	SPRITE_SHOW
		lda	#$8
		sta	SPRITE_MULTI
		lda	#<isr
		sta	$fffe
		lda	#>isr
		sta	$ffff

		lda	#$0
		jsr	startlevel

		lda	#$60
		sta	willy_blwait
		lda	#$0
		sta	willy_blink
		dec	VIC_IRR
		lda	#$1
		sta	VIC_IRM

		bne	*

isr:
		sta	a_save
		dec	VIC_IRR
		lda	willy_blink
		beq	waitnext
		dec	willy_blink
		bne	isrout
		lda	#$60
		sta	willy_blwait
		lda	#<(willy0_0 >> 6)
		sta	$fbfb
		inc	SPRITE_SHOW
		bne	isrout
waitnext:	dec	willy_blwait
		bpl	isrout
		lda	#$6
		sta	willy_blink
		lda	#<(willy1_0 >> 6)
		sta	$fbfb
		dec	SPRITE_SHOW
a_save		= *+1
isrout:		lda	#$ff
		rti

