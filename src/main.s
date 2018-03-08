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
		ldx	#$fe
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

		lda	#$fc
		sta	CIA2_PRA
		lda	#$e5
		sta	VIC_MEMCTL
		lda	#$d3
		sta	VIC_CTL2
		lda	#$1b
		sta	VIC_CTL1
		lda	#$ff
		sta	VIC_RASTER
		lda	#$9
		sta	BG_COLOR_0
		lda	#$0
		sta	BORDER_COLOR
		sta	BG_COLOR_1
		lda	#$c
		sta	BG_COLOR_2
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
		lda	#$da
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
		lda	#$e
		sta	z2_sp_0_x
		lda	#$10
		sta	z2_sp_5_x
		sta	z2_sp_2_x
		lda	#$28
		sta	z2_sp_4_x
		lda	#$40
		sta	z2_sp_3_x
		sta	z2_sp_1_x
		lda	#$d8
		sta	z2_sp_6_x
		lda	#$f0
		sta	z2_sp_7_x
		lda	#$3f
		sta	z2_sp_x_hb
		lda	#$f2
		sta	z2_sp_1_y
		sta	z2_sp_2_y
		sta	z2_sp_3_y
		sta	z2_sp_4_y
		sta	z2_sp_5_y
		lda	#$fc
		sta	z2_sp_6_y
		sta	z2_sp_7_y
		lda	#$0
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
		lda	#$0
		sta	mmbgleft+$3c
		sta	mmbgleft+$3d
		sta	mmbgleft+$3e
		sta	mmbgmid+$3c
		sta	mmbgmid+$3d
		sta	mmbgmid+$3e
		sta	mmbgright+$3c
		sta	mmbgright+$3d
		sta	mmbgright+$3e
		sta	mmfgleft+$3c
		sta	mmfgleft+$3d
		sta	mmfgleft+$3e
		sta	mmfgright+$3c
		sta	mmfgright+$3d
		sta	mmfgright+$3e
		lda	#<isr0
		sta	$fffe
		lda	#>isr0
		sta	$ffff

		lda	#$0
		jsr	startlevel

		lda	#$60
		sta	willy_blwait
		dec	VIC_IRR
		lda	#$1
		sta	VIC_IRM

		bne	*

isr0:
		sta	a_save_0
		lda	VIC_CTL1
		ora	#$8
		sta	VIC_CTL1
		lda	#$4
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
		lda	#$18
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
		lda	#$ec
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
		lda	#$f2
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
