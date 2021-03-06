.include "board.inc"
.include "sp_willy.inc"
.include "sp_minmap.inc"
.include "spritezone.inc"
.include "vic.inc"
.include "cia.inc"

.zeropage

willy_blink:	.res	1
willy_blwait:	.res	1
framecycpos:	.res	1
cabbagewait:	.res	1

.data

framecols:	.byte	$0,$0,$0,$0,$9,$9,$9,$b,$b,$8,$8,$c,$c,$a,$a,$f
		.byte	$f,$d,$d,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1
		.byte	$1,$d,$d,$f,$f,$a,$a,$c,$c,$8,$8,$b,$b,$9,$9,$9
		.byte	$0,$0,$0,$0
framevis:	.byte	$0,$0,$0,$0,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1
		.byte	$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1
		.byte	$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1,$1
		.byte	$0,$0,$0,$0
framecyclen	= *-framevis

.code
countlines1:	lda	$d012
countlines2:	cmp	$d012
		beq	countlines2
		bmi	countlines1
		and	#$3
		tay
		cpy	#$3
		bne	vsysdetected
		ldx	#$0
countcycles:	inx
		lda	$d012
		bpl	countcycles
		cpx	#$5e
		bcc	vsysdetected
		iny
vsysdetected:	cpy	#$3
		bcs	init
		lda	#$a
		sta	firstraster
init:		ldx	#$fe
		lda	#$0
zpclr:		sta	$1,x
		dex
		bne	zpclr
		ldy	#$d8
		sty	cs1page
		ldy	#$8
		dec	$1
cs1page		= *+2
cs1clear:	sta	$ff00,x
		inx
		bne	cs1clear
		inc	cs1page
		dey
		bne	cs1clear
		inc	$1
		ldy	#$f8
		sty	scrpage
		ldy	#$4
scrpage		= *+2
scrclear:	sta	$ff00,x
		inx
		bne	scrclear
		inc	scrpage
		dey
		bne	scrclear

		ldx	#<(willy0_3 >> 6)
		stx	z1_sp_0_ptr
		dex
		stx	z1_sp_1_ptr
		dex
		stx	z1_sp_2_ptr
		dex
		stx	z1_sp_3_ptr
		lda	#$3b
		sta	z1_sp_0_x
		sta	z1_sp_1_x
		sta	z1_sp_2_x
		sta	z1_sp_3_x
		lda	#$d2
		sta	z1_sp_0_y
		sta	z1_sp_1_y
		sta	z1_sp_2_y
		sta	z1_sp_3_y
		lda	#$2
		sta	z1_sp_mcol1
		lda	#$6
		sta	z1_sp_mcol2
		lda	#$e
		sta	z1_sp_0_col
		lda	#$5
		sta	z1_sp_1_col
		lda	#$1
		sta	z1_sp_2_col
		lda	#$3
		sta	z1_sp_3_col
		lda	#$f
		sta	z1_sp_show
		lda	#$8
		sta	z1_sp_multi
		ldx	#<(mmbgleft >> 6)
		stx	z2_sp_5_ptr
		inx
		stx	z2_sp_4_ptr
		inx
		stx	z2_sp_3_ptr
		inx
		stx	z2_sp_2_ptr
		inx
		stx	z2_sp_1_ptr
		ldx	#<(mmframe >> 6)
		stx	z2_sp_0_ptr
		inx
		stx	z2_sp_6_ptr
		inx
		stx	z2_sp_7_ptr
		lda	#$f
		sta	z2_sp_0_x
		lda	#$11
		sta	z2_sp_5_x
		sta	z2_sp_2_x
		lda	#$29
		sta	z2_sp_4_x
		lda	#$41
		sta	z2_sp_3_x
		sta	z2_sp_1_x
		lda	#$d2
		sta	z2_sp_6_x
		lda	#$ea
		sta	z2_sp_7_x
		lda	#$3f
		sta	z2_sp_x_hb
		lda	#$ea
		sta	z2_sp_1_y
		sta	z2_sp_2_y
		sta	z2_sp_3_y
		sta	z2_sp_4_y
		sta	z2_sp_5_y
		lda	#$f4
		sta	z2_sp_6_y
		sta	z2_sp_7_y
		lda	#$f6
		sta	z2_sp_0_y
		lda	#$f8
		sta	z2_sp_multi
		lda	#$3f
		sta	z2_sp_dbl_y
		lda	#$7
		sta	z2_sp_dbl_x
		lda	#$ff
		sta	z2_sp_show
		lda	#$9
		sta	z2_sp_mcol1
		lda	#$c
		sta	z2_sp_mcol2
		lda	#$1
		sta	z2_sp_0_col
		lda	#$2
		sta	z2_sp_1_col
		sta	z2_sp_2_col
		lda	#$5
		sta	z2_sp_3_col
		sta	z2_sp_4_col
		sta	z2_sp_5_col
		lda	#$e
		sta	z2_sp_6_col
		sta	z2_sp_7_col
		lda	#$60
		sta	willy_blwait

		lda	#$0
		ldx	#$8
sprclrloop:	sta	mmbgleft+$36,x
		sta	mmbgmid+$36,x
		sta	mmbgright+$36,x
		sta	mmfgleft+$36,x
		sta	mmfgright+$36,x
		dex
		bpl	sprclrloop

		lda	#<isr0
		sta	$fffe
		lda	#>isr0
		sta	$ffff

		lda	#$9
		sta	BG_COLOR_0
		lda	#$0
		sta	BORDER_COLOR
		sta	BG_COLOR_1
		lda	#$c
		sta	BG_COLOR_2
		lda	#$fc
		sta	CIA2_PRA
		lda	#$e5
		sta	VIC_MEMCTL
		lda	#$1b
		sta	VIC_CTL1
		lda	#$d3
		sta	VIC_CTL2
		dec	VIC_IRR
		lda	#$ff
		sta	VIC_RASTER
		lda	#$1
		sta	VIC_IRM

		jsr	board_init
		lda	#$0
		jsr	board_setlevel

		jmp	*

isr0:
		sta	a_save_0
		stx	x_save_0
		lda	VIC_CTL1
		ora	#$8
		sta	VIC_CTL1
firstraster	= *+1
		lda	#$0
		sta	VIC_RASTER
		lda	#<isr1
		sta	$fffe
		lda	#>isr1
		sta	$ffff
		dec	VIC_IRR
		cli
		dec	framecycpos
		bpl	fcpok
		lda	#framecyclen - 1
		sta	framecycpos
fcpok:		ldx	framecycpos
		lda	framecols,x
		sta	z2_sp_0_col
		lda	z2_sp_show
		and	#$fe
		ora	framevis,x
		sta	z2_sp_show
		dec	cabbagewait
		bpl	dowillyblink
		lda	#$16
		sta	cabbagewait
		lda	#$8
		eor	z2_sp_3_col
		sta	z2_sp_3_col
		sta	z2_sp_4_col
		sta	z2_sp_5_col
dowillyblink:	lda	willy_blink
		beq	waitnext
		dec	willy_blink
		bne	isrout
		lda	#$60
		sta	willy_blwait
		lda	#<(willy0_0 >> 6)
		sta	z1_sp_3_ptr
		inc	z1_sp_show
		bne	isrout
waitnext:	dec	willy_blwait
		bpl	isrout
		lda	#$6
		sta	willy_blink
		lda	#<(willy1_0 >> 6)
		sta	z1_sp_3_ptr
		dec	z1_sp_show
a_save_0	= *+1
isrout:		lda	#$ff
x_save_0	= *+1
		ldx	#$ff
		rti

isr1:
		sta	a_save_1
		lda	#$36
		sta	VIC_RASTER
		lda	#<isr2
		sta	$fffe
		lda	#>isr2
		sta	$ffff
		dec	VIC_IRR
		spzone	0
a_save_1	= *+1
		lda	#$ff
		rti

isr2:
		sta	a_save_2
		lda	#$e4
		sta	VIC_RASTER
		lda	#<isr4
		sta	$fffe
		lda	#>isr4
		sta	$ffff
		dec	VIC_IRR
		nop
		nop
		nop
		nop
		nop
		nop
		lda	#$e5
		sta	VIC_MEMCTL
		lda	#$9
		sta	BG_COLOR_0
		spzone	1
a_save_2	= *+1
		lda	#$ff
		rti

isr4:
		sta	a_save_4
		lda	#$ea
		sta	VIC_RASTER
		lda	#<isr5
		sta	$fffe
		lda	#>isr5
		sta	$ffff
		dec	VIC_IRR
		spzone	2
a_save_4	= *+1
		lda	#$ff
		rti

isr5:
		sta	a_save_5
		lda	#$f8
		sta	VIC_RASTER
		lda	#<isr6
		sta	$fffe
		lda	#>isr6
		sta	$ffff
		dec	VIC_IRR
		lda	#$0
		sta	BG_COLOR_0
		lda	#$e7
		sta	VIC_MEMCTL
a_save_5	= *+1
		lda	#$ff
		rti

isr6:
		sta	a_save_6
		lda	VIC_CTL1
		and	#$f7
		sta	VIC_CTL1
		lda	#$ff
		sta	VIC_RASTER
		lda	#<isr0
		sta	$fffe
		lda	#>isr0
		sta	$ffff
		dec	VIC_IRR
a_save_6	= *+1
		lda	#$ff
		rti
