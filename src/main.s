.include "board.inc"
.include "sp_willy.inc"

.zeropage
willy_blink:	.res	1
willy_blwait:	.res	1

.code
		lda	#$fc
		sta	$dd00
		lda	#$e5
		sta	$d018
		lda	#$d3
		sta	$d016
		lda	#$13
		sta	$d011
		lda	#$ff
		sta	$d012
		lda	#$9
		sta	$d021
		lda	#$b
		sta	$d020
		lda	#$0
		sta	$d022
		lda	#$c
		sta	$d023
		ldx	#<(willy0_3 >> 6)
		stx	$fbf8
		dex
		stx	$fbf9
		dex
		stx	$fbfa
		dex
		stx	$fbfb
		lda	#$0
		sta	$d010
		lda	#$3b
		sta	$d000
		sta	$d002
		sta	$d004
		sta	$d006
		lda	#$da
		sta	$d001
		sta	$d003
		sta	$d005
		sta	$d007
		lda	#$2
		sta	$d025
		lda	#$6
		sta	$d026
		lda	#$e
		sta	$d027
		lda	#$5
		sta	$d028
		lda	#$1
		sta	$d029
		lda	#$3
		sta	$d02a
		lda	#$f
		sta	$d015
		lda	#$8
		sta	$d01c
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
		dec	$d019
		lda	#$1
		sta	$d01a

		bne	*

isr:
		sta	a_save
		dec	$d019
		lda	willy_blink
		beq	waitnext
		dec	willy_blink
		bne	isrout
		lda	#$60
		sta	willy_blwait
		lda	#<(willy0_0 >> 6)
		sta	$fbfb
		inc	$d015
		bne	isrout
waitnext:	dec	willy_blwait
		bpl	isrout
		lda	#$6
		sta	willy_blink
		lda	#<(willy1_0 >> 6)
		sta	$fbfb
		dec	$d015
a_save		= *+1
isrout:		lda	#$ff
		rti

