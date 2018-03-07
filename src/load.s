.import decrunch
.export get_crunched_byte

.segment "BHDR"
		.word	$0801
		.word	$080b
		.word	2018
		.byte	$9e
sysaddr:
		.byte	"2061",$0,$0,$0

.segment "LDCODE"
		lda	#$7f
		sta	$dc0d
		lda	$dc0d
		lda	#$30
		sta	$01
		jsr	decrunch
		lda	#$35
		sta	$01
		jsr	decrunch
		jsr	decrunch
		jmp	$8000

get_crunched_byte:
		lda	_byte_lo
		bne	_byte_skip_hi
		dec	_byte_hi
_byte_skip_hi:
		dec	_byte_lo
_byte_lo = * + 1
_byte_hi = * + 2
		lda	end_of_data
		rts

.incbin "main_stoneage64.exo"
.incbin "spr_stoneage64.exo"
.incbin "cs_stoneage64.exo"
end_of_data:	.res	0

