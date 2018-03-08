.importzp z0_sp_0_x
.importzp z0_sp_0_y
.importzp z0_sp_1_x
.importzp z0_sp_1_y
.importzp z0_sp_2_x
.importzp z0_sp_2_y
.importzp z0_sp_3_x
.importzp z0_sp_3_y
.importzp z0_sp_4_x
.importzp z0_sp_4_y
.importzp z0_sp_5_x
.importzp z0_sp_5_y
.importzp z0_sp_6_x
.importzp z0_sp_6_y
.importzp z0_sp_7_x
.importzp z0_sp_7_y
.importzp z0_sp_x_hb
.importzp z0_sp_show
.importzp z0_sp_dbl_y
.importzp z0_sp_layer
.importzp z0_sp_multi
.importzp z0_sp_dbl_x
.importzp z0_sp_mcol1
.importzp z0_sp_mcol2
.importzp z0_sp_0_col
.importzp z0_sp_1_col
.importzp z0_sp_2_col
.importzp z0_sp_3_col
.importzp z0_sp_4_col
.importzp z0_sp_5_col
.importzp z0_sp_6_col
.importzp z0_sp_7_col
.importzp z0_sp_0_ptr
.importzp z0_sp_1_ptr
.importzp z0_sp_2_ptr
.importzp z0_sp_3_ptr
.importzp z0_sp_4_ptr
.importzp z0_sp_5_ptr
.importzp z0_sp_6_ptr
.importzp z0_sp_7_ptr

.importzp z1_sp_0_x
.importzp z1_sp_0_y
.importzp z1_sp_1_x
.importzp z1_sp_1_y
.importzp z1_sp_2_x
.importzp z1_sp_2_y
.importzp z1_sp_3_x
.importzp z1_sp_3_y
.importzp z1_sp_4_x
.importzp z1_sp_4_y
.importzp z1_sp_5_x
.importzp z1_sp_5_y
.importzp z1_sp_6_x
.importzp z1_sp_6_y
.importzp z1_sp_7_x
.importzp z1_sp_7_y
.importzp z1_sp_x_hb
.importzp z1_sp_show
.importzp z1_sp_dbl_y
.importzp z1_sp_layer
.importzp z1_sp_multi
.importzp z1_sp_dbl_x
.importzp z1_sp_mcol1
.importzp z1_sp_mcol2
.importzp z1_sp_0_col
.importzp z1_sp_1_col
.importzp z1_sp_2_col
.importzp z1_sp_3_col
.importzp z1_sp_4_col
.importzp z1_sp_5_col
.importzp z1_sp_6_col
.importzp z1_sp_7_col
.importzp z1_sp_0_ptr
.importzp z1_sp_1_ptr
.importzp z1_sp_2_ptr
.importzp z1_sp_3_ptr
.importzp z1_sp_4_ptr
.importzp z1_sp_5_ptr
.importzp z1_sp_6_ptr
.importzp z1_sp_7_ptr

.importzp z2_sp_0_x
.importzp z2_sp_0_y
.importzp z2_sp_1_x
.importzp z2_sp_1_y
.importzp z2_sp_2_x
.importzp z2_sp_2_y
.importzp z2_sp_3_x
.importzp z2_sp_3_y
.importzp z2_sp_4_x
.importzp z2_sp_4_y
.importzp z2_sp_5_x
.importzp z2_sp_5_y
.importzp z2_sp_6_x
.importzp z2_sp_6_y
.importzp z2_sp_7_x
.importzp z2_sp_7_y
.importzp z2_sp_x_hb
.importzp z2_sp_show
.importzp z2_sp_dbl_y
.importzp z2_sp_layer
.importzp z2_sp_multi
.importzp z2_sp_dbl_x
.importzp z2_sp_mcol1
.importzp z2_sp_mcol2
.importzp z2_sp_0_col
.importzp z2_sp_1_col
.importzp z2_sp_2_col
.importzp z2_sp_3_col
.importzp z2_sp_4_col
.importzp z2_sp_5_col
.importzp z2_sp_6_col
.importzp z2_sp_7_col
.importzp z2_sp_0_ptr
.importzp z2_sp_1_ptr
.importzp z2_sp_2_ptr
.importzp z2_sp_3_ptr
.importzp z2_sp_4_ptr
.importzp z2_sp_5_ptr
.importzp z2_sp_6_ptr
.importzp z2_sp_7_ptr

.macro spzone num
		lda	40*num + z0_sp_0_x
		sta	SPRITE_0_X
		lda	40*num + z0_sp_0_y
		sta	SPRITE_0_Y
		lda	40*num + z0_sp_1_x
		sta	SPRITE_1_X
		lda	40*num + z0_sp_1_y
		sta	SPRITE_1_Y
		lda	40*num + z0_sp_2_x
		sta	SPRITE_2_X
		lda	40*num + z0_sp_2_y
		sta	SPRITE_2_Y
		lda	40*num + z0_sp_3_x
		sta	SPRITE_3_X
		lda	40*num + z0_sp_3_y
		sta	SPRITE_3_Y
		lda	40*num + z0_sp_4_x
		sta	SPRITE_4_X
		lda	40*num + z0_sp_4_y
		sta	SPRITE_4_Y
		lda	40*num + z0_sp_5_x
		sta	SPRITE_5_X
		lda	40*num + z0_sp_5_y
		sta	SPRITE_5_Y
		lda	40*num + z0_sp_6_x
		sta	SPRITE_6_X
		lda	40*num + z0_sp_6_y
		sta	SPRITE_6_Y
		lda	40*num + z0_sp_7_x
		sta	SPRITE_7_X
		lda	40*num + z0_sp_7_y
		sta	SPRITE_7_Y
		lda	40*num + z0_sp_x_hb
		sta	SPRITE_X_HB
		lda	40*num + z0_sp_show
		sta	SPRITE_SHOW
		lda	40*num + z0_sp_dbl_y
		sta	SPRITE_DBL_Y
		lda	40*num + z0_sp_layer
		sta	SPRITE_LAYER
		lda	40*num + z0_sp_multi
		sta	SPRITE_MULTI
		lda	40*num + z0_sp_dbl_x
		sta	SPRITE_DBL_X
		lda	40*num + z0_sp_mcol1
		sta	SPRITE_MCOL_1
		lda	40*num + z0_sp_mcol2
		sta	SPRITE_MCOL_2
		lda	40*num + z0_sp_0_col
		sta	SPRITE_0_COL
		lda	40*num + z0_sp_1_col
		sta	SPRITE_1_COL
		lda	40*num + z0_sp_2_col
		sta	SPRITE_2_COL
		lda	40*num + z0_sp_3_col
		sta	SPRITE_3_COL
		lda	40*num + z0_sp_4_col
		sta	SPRITE_4_COL
		lda	40*num + z0_sp_5_col
		sta	SPRITE_5_COL
		lda	40*num + z0_sp_6_col
		sta	SPRITE_6_COL
		lda	40*num + z0_sp_7_col
		sta	SPRITE_7_COL
		lda	40*num + z0_sp_0_ptr
		sta	$fbf8
		lda	40*num + z0_sp_1_ptr
		sta	$fbf9
		lda	40*num + z0_sp_2_ptr
		sta	$fbfa
		lda	40*num + z0_sp_3_ptr
		sta	$fbfb
		lda	40*num + z0_sp_4_ptr
		sta	$fbfc
		lda	40*num + z0_sp_5_ptr
		sta	$fbfd
		lda	40*num + z0_sp_6_ptr
		sta	$fbfe
		lda	40*num + z0_sp_7_ptr
		sta	$fbff
.endmacro

