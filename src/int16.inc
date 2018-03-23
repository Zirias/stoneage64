.importzp int16_buf0
.importzp int16_buf1

.macro int16_neg arg
.local done
		lda	#$ff
		eor	arg
		sta	arg
		lda	#$ff
		eor	arg+1
		sta	arg+1
		inc	arg
		bne	done
		inc	arg+1
done:
.endmacro

.macro int16_add result, arg1, arg2
		clc
		lda	arg1
		adc	arg2
		sta	result
		lda	arg1+1
		adc	arg2+1
		sta	result+1
.endmacro

.macro int16_adda result, arg1
		clc
		adc	arg1
		sta	result
		lda	#$0
		adc	arg1+1
		sta	result+1
.endmacro

.macro int16_mult16q result, arg1, arg2
.local bitloop
.local skipadd
		lda	#$0
		sta	result
		sta	result+1
		ldy	#$f
bitloop:	lsr	arg2+1
		ror	arg2
		bcc	skipadd
		int16_add result, result, arg1
skipadd:	asl	arg1
		rol	arg1+1
		dey
		bpl	bitloop
.endmacro

.macro int16_mult16 result, arg1, arg2
		lda	arg1
		sta	int16_buf0
		lda	arg1+1
		sta	int16_buf0+1
		lda	arg2
		sta	int16_buf1
		lda	arg2+1
		sta	int16_buf1+1
		int16_mult16q result, int16_buf0, int16_buf1
.endmacro

.macro int16_multaq result, arg1
.local bitloop
.local skipadd
		sta	int16_buf1
		lda	#$0
		sta	result
		sta	result+1
		ldy	#$7
bitloop:	lsr	int16_buf1
		bcc	skipadd
		int16_add result, result, arg1
skipadd:	asl	arg1
		rol	arg1+1
		dey
		bpl	bitloop
.endmacro

.macro int16_multa result, arg1
		ldy	arg1
		sty	int16_buf0
		ldy	arg1+1
		sty	int16_buf0+1
		int16_multaq result, int16_buf0
.endmacro

