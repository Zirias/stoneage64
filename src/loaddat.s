.export get_crunched_byte

.segment "LDCODE"

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

