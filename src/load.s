.include "exodecrunch.inc"
.include "cia.inc"

.segment "BHDR"
		.word	$0801
		.word	$080b
		.word	2018
		.byte	$9e
sysaddr:
		.byte	"2061",$0,$0,$0

.segment "LDCODE"
		lda	#$7f
		sta	CIA1_ICR
		lda	CIA1_ICR
		lda	#$30
		sta	$01
		jsr	decrunch
		lda	#$35
		sta	$01
		jsr	decrunch
		jsr	decrunch
		jmp	$8000

