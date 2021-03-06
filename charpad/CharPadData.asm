
; Generated by CharPad 2. Assemble with 64TASS or similar.


; General constants:-

TRUE = 1
FALSE = 0
COLRMETH_GLOBAL = 0
COLRMETH_PERTILE = 1
COLRMETH_PERCHAR = 2


; Project constants:-

COLOURING_METHOD = COLRMETH_PERCHAR
CHAR_MULTICOLOUR_MODE = TRUE
COLR_SCREEN = 9
COLR_CHAR_DEF = 10
COLR_CHAR_MC1 = 0
COLR_CHAR_MC2 = 12
CHAR_COUNT = 15
TILE_COUNT = 5
TILE_WID = 2
TILE_HEI = 2
MAP_WID = 32
MAP_HEI = 54
MAP_WID_CHRS = 64
MAP_HEI_CHRS = 108
MAP_WID_PXLS = 512
MAP_HEI_PXLS = 864


; Data block size constants:-

SZ_CHARSET_DATA        = 120
SZ_CHARSET_ATTRIB_DATA = 15
SZ_TILESET_DATA        = 20
SZ_MAP_DATA            = 1728


; Data block address constants (dummy values):-

ADDR_CHARSET_DATA        = $1000   ; nb. label = 'charset_data'        (block size = $78).
ADDR_CHARSET_ATTRIB_DATA = $2000   ; nb. label = 'charset_attrib_data' (block size = $f).
ADDR_TILESET_DATA        = $3000   ; nb. label = 'tileset_data'        (block size = $14).
ADDR_MAP_DATA            = $5000   ; nb. label = 'map_data'            (block size = $6c0).



; * INSERT EXAMPLE PROGRAM HERE! * (Or just include this file in your project).



; CHAR SET DATA : 15 (8 byte) chars : total size is 120 ($78) bytes.

* = ADDR_CHARSET_DATA
charset_data

.byte $55,$55,$55,$55,$55,$55,$55,$55,$02,$00,$48,$00,$10,$00,$00,$20
.byte $00,$03,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$42,$10
.byte $04,$00,$00,$80,$04,$20,$00,$00,$00,$06,$0c,$17,$3b,$2a,$3b,$14
.byte $00,$00,$98,$b8,$7c,$5e,$78,$bc,$2a,$36,$0c,$1b,$0a,$15,$0a,$01
.byte $f4,$fc,$ec,$b8,$e8,$50,$a0,$00,$57,$5a,$6e,$4a,$2b,$ba,$22,$8b
.byte $d5,$b5,$ed,$b9,$fe,$eb,$be,$ee,$2a,$c8,$a2,$3b,$6a,$63,$5a,$54
.byte $ab,$aa,$2e,$8b,$ed,$89,$a5,$15,$9a,$93,$93,$93,$92,$93,$10,$55
.byte $aa,$ff,$00,$ff,$ec,$ff,$00,$55



; CHAR SET ATTRIBUTE DATA : 15 attributes : total size is 15 ($f) bytes.
; nb. Upper nybbles = Material, Lower nybbles = Colour.

* = ADDR_CHARSET_ATTRIB_DATA
charset_attrib_data

.byte $0a,$14,$1a,$10,$13,$37,$35,$37,$35,$8f,$89,$8a,$8e,$fc,$fa



; TILE SET DATA : 5 (2x2) tiles : total size is 20 ($14) bytes.

* = ADDR_TILESET_DATA
tileset_data

.byte $00,$00,$00,$00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c
.byte $0d,$0e,$0e,$0d



; MAP DATA : 1 (32x54) map : total size is 1728 ($6c0) bytes.

* = ADDR_MAP_DATA
map_data

.byte $03,$02,$01,$03,$04,$03,$00,$00,$01,$01,$04,$01,$01,$00,$01,$01
.byte $01,$01,$01,$01,$03,$01,$01,$01,$00,$00,$01,$01,$01,$01,$03,$00
.byte $03,$04,$04,$01,$04,$02,$03,$04,$04,$01,$04,$04,$03,$00,$04,$01
.byte $01,$04,$04,$01,$01,$01,$04,$04,$01,$01,$03,$01,$03,$01,$03,$00
.byte $03,$00,$00,$00,$04,$01,$01,$04,$03,$01,$04,$01,$01,$04,$01,$04
.byte $03,$04,$03,$04,$01,$04,$04,$04,$00,$01,$03,$01,$03,$01,$03,$00
.byte $01,$00,$00,$00,$04,$03,$01,$01,$04,$00,$04,$01,$01,$04,$00,$04
.byte $03,$04,$02,$04,$01,$04,$00,$00,$00,$01,$03,$01,$03,$01,$02,$00
.byte $01,$01,$03,$01,$04,$03,$01,$04,$04,$00,$04,$04,$03,$01,$04,$03
.byte $03,$04,$01,$04,$01,$01,$04,$04,$01,$01,$03,$01,$03,$01,$00,$00
.byte $01,$04,$01,$04,$04,$04,$00,$01,$01,$00,$01,$01,$01,$01,$01,$03
.byte $03,$01,$01,$01,$00,$01,$01,$01,$01,$01,$03,$03,$03,$03,$00,$00
.byte $01,$04,$01,$04,$03,$04,$04,$04,$04,$04,$04,$01,$01,$01,$01,$04
.byte $04,$04,$04,$04,$01,$01,$03,$03,$03,$01,$03,$03,$03,$03,$00,$00
.byte $00,$04,$01,$04,$03,$04,$01,$00,$01,$01,$04,$01,$03,$01,$03,$00
.byte $00,$00,$00,$00,$03,$01,$03,$03,$03,$01,$03,$03,$03,$01,$00,$00
.byte $00,$04,$02,$04,$03,$04,$01,$04,$04,$01,$04,$01,$03,$01,$04,$03
.byte $00,$00,$00,$03,$04,$01,$03,$02,$03,$01,$03,$03,$01,$00,$00,$00
.byte $00,$04,$04,$04,$03,$04,$01,$03,$04,$01,$04,$01,$03,$01,$04,$04
.byte $00,$01,$01,$04,$04,$01,$03,$03,$03,$01,$03,$01,$00,$00,$03,$00
.byte $01,$03,$03,$03,$03,$04,$00,$01,$04,$00,$04,$01,$03,$01,$01,$04
.byte $00,$01,$01,$04,$03,$01,$01,$01,$01,$01,$03,$00,$00,$03,$03,$00
.byte $03,$01,$01,$01,$03,$04,$00,$01,$04,$01,$04,$01,$03,$01,$01,$04
.byte $02,$04,$02,$04,$03,$01,$01,$01,$01,$01,$03,$00,$03,$03,$03,$00
.byte $03,$03,$03,$03,$03,$04,$03,$02,$04,$01,$01,$01,$03,$01,$01,$04
.byte $04,$04,$04,$04,$01,$01,$01,$04,$01,$01,$04,$00,$01,$01,$01,$00
.byte $04,$04,$04,$04,$03,$04,$04,$04,$04,$03,$01,$01,$01,$01,$01,$03
.byte $03,$00,$00,$03,$01,$01,$01,$04,$01,$04,$00,$00,$01,$01,$01,$00
.byte $04,$01,$01,$01,$02,$01,$01,$01,$04,$03,$01,$04,$01,$04,$01,$04
.byte $04,$04,$01,$04,$04,$01,$01,$04,$04,$00,$00,$00,$00,$00,$00,$00
.byte $04,$01,$01,$01,$01,$01,$01,$01,$04,$03,$01,$04,$01,$04,$01,$04
.byte $00,$04,$00,$04,$01,$04,$01,$04,$04,$00,$00,$00,$00,$00,$00,$00
.byte $04,$01,$01,$01,$01,$01,$01,$01,$04,$03,$01,$04,$02,$04,$01,$04
.byte $00,$04,$00,$04,$03,$04,$01,$04,$00,$04,$00,$00,$00,$00,$00,$00
.byte $04,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$04,$01,$01,$04
.byte $04,$04,$02,$04,$03,$04,$03,$04,$00,$01,$04,$02,$04,$02,$02,$00
.byte $02,$03,$01,$00,$04,$02,$01,$01,$01,$04,$01,$01,$03,$01,$01,$02
.byte $01,$01,$01,$01,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$00
.byte $01,$03,$04,$01,$04,$04,$04,$04,$03,$04,$03,$01,$02,$01,$01,$01
.byte $01,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$00,$00
.byte $01,$03,$04,$01,$03,$01,$01,$01,$01,$00,$03,$01,$01,$02,$01,$01
.byte $03,$04,$00,$00,$00,$00,$00,$00,$00,$03,$00,$00,$00,$00,$01,$00
.byte $00,$03,$04,$01,$01,$00,$03,$01,$00,$00,$03,$01,$01,$01,$01,$02
.byte $01,$04,$00,$04,$04,$04,$04,$04,$00,$04,$04,$04,$04,$04,$01,$00
.byte $01,$03,$04,$03,$00,$01,$01,$00,$00,$03,$03,$01,$01,$03,$01,$01
.byte $01,$04,$00,$00,$00,$03,$02,$04,$00,$00,$00,$00,$00,$04,$01,$00
.byte $01,$03,$04,$03,$03,$01,$00,$00,$03,$03,$01,$02,$01,$01,$01,$03
.byte $01,$04,$01,$03,$01,$02,$01,$04,$03,$00,$00,$00,$00,$04,$01,$00
.byte $01,$03,$04,$03,$01,$00,$00,$03,$03,$04,$01,$01,$01,$03,$03,$03
.byte $01,$04,$04,$04,$04,$04,$04,$04,$03,$03,$00,$03,$03,$04,$01,$00
.byte $01,$03,$04,$01,$00,$00,$03,$03,$04,$04,$03,$01,$02,$01,$03,$03
.byte $03,$04,$01,$01,$00,$00,$01,$01,$01,$03,$02,$03,$03,$04,$01,$00
.byte $02,$03,$04,$00,$00,$03,$03,$04,$04,$01,$01,$01,$01,$01,$03,$00
.byte $03,$04,$01,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$01,$00
.byte $01,$03,$04,$00,$03,$03,$04,$04,$02,$03,$01,$02,$01,$01,$01,$01
.byte $01,$04,$01,$04,$01,$01,$03,$01,$01,$03,$03,$01,$01,$01,$01,$00
.byte $01,$03,$04,$00,$03,$04,$04,$03,$02,$02,$01,$03,$01,$01,$03,$01
.byte $03,$04,$01,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$01,$00
.byte $00,$03,$04,$00,$04,$04,$02,$02,$03,$02,$03,$02,$01,$01,$01,$02
.byte $01,$04,$01,$01,$01,$04,$01,$03,$03,$04,$01,$01,$00,$04,$01,$00
.byte $00,$03,$04,$01,$04,$02,$02,$02,$02,$02,$03,$02,$01,$01,$01,$02
.byte $01,$04,$04,$04,$01,$04,$01,$01,$01,$04,$01,$04,$00,$04,$01,$00
.byte $00,$03,$04,$01,$04,$02,$03,$02,$03,$02,$02,$02,$03,$01,$02,$02
.byte $01,$04,$04,$04,$01,$04,$01,$00,$00,$04,$00,$04,$01,$04,$01,$00
.byte $00,$03,$04,$00,$04,$03,$02,$02,$02,$03,$02,$02,$02,$02,$02,$02
.byte $01,$04,$03,$03,$01,$04,$01,$04,$00,$04,$00,$04,$01,$04,$01,$00
.byte $01,$03,$04,$01,$04,$02,$02,$03,$02,$02,$02,$02,$02,$03,$02,$02
.byte $01,$04,$03,$01,$01,$01,$01,$04,$00,$04,$00,$04,$01,$04,$01,$00
.byte $01,$03,$04,$01,$04,$02,$02,$02,$02,$02,$03,$02,$02,$02,$02,$02
.byte $03,$04,$03,$00,$03,$03,$01,$04,$00,$04,$00,$04,$01,$04,$01,$00
.byte $03,$01,$01,$01,$04,$03,$02,$02,$02,$02,$02,$02,$03,$02,$03,$02
.byte $03,$04,$02,$00,$03,$03,$01,$04,$00,$00,$00,$04,$01,$01,$01,$00
.byte $02,$03,$01,$03,$03,$03,$03,$03,$01,$01,$01,$04,$04,$04,$03,$04
.byte $04,$04,$04,$02,$01,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$00
.byte $01,$03,$03,$04,$01,$03,$02,$04,$03,$03,$00,$00,$00,$00,$03,$00
.byte $00,$00,$00,$00,$01,$04,$03,$03,$03,$03,$03,$00,$00,$02,$04,$00
.byte $00,$03,$04,$01,$01,$03,$01,$01,$04,$03,$01,$04,$01,$04,$03,$04
.byte $04,$00,$04,$01,$01,$04,$03,$03,$03,$03,$01,$00,$00,$01,$04,$00
.byte $03,$01,$01,$02,$01,$03,$01,$00,$00,$01,$03,$01,$04,$04,$03,$04
.byte $04,$04,$01,$01,$01,$04,$03,$03,$03,$03,$03,$03,$03,$03,$04,$00
.byte $03,$04,$01,$04,$04,$03,$04,$04,$01,$04,$03,$01,$03,$04,$03,$04
.byte $03,$01,$01,$04,$01,$04,$04,$04,$04,$03,$04,$04,$04,$04,$04,$00
.byte $03,$04,$01,$01,$03,$03,$03,$01,$01,$04,$03,$01,$03,$04,$03,$04
.byte $03,$01,$03,$04,$01,$04,$02,$01,$01,$03,$01,$01,$01,$01,$04,$00
.byte $03,$04,$01,$03,$01,$03,$01,$03,$01,$04,$03,$01,$03,$04,$03,$04
.byte $03,$01,$01,$04,$01,$04,$04,$04,$04,$03,$04,$04,$04,$01,$04,$00
.byte $03,$04,$03,$01,$01,$03,$01,$01,$03,$04,$03,$01,$03,$04,$03,$04
.byte $03,$01,$01,$04,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$04,$00
.byte $01,$03,$01,$01,$00,$03,$01,$01,$01,$03,$01,$01,$03,$04,$03,$04
.byte $03,$03,$01,$04,$04,$04,$04,$04,$04,$01,$04,$04,$04,$04,$04,$00
.byte $04,$03,$03,$01,$01,$03,$01,$01,$03,$03,$04,$01,$03,$04,$03,$04
.byte $03,$01,$01,$01,$03,$04,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00
.byte $04,$01,$01,$03,$03,$03,$03,$03,$01,$01,$04,$01,$03,$04,$03,$04
.byte $03,$02,$01,$04,$01,$04,$01,$01,$01,$01,$01,$01,$03,$01,$03,$00
.byte $04,$04,$01,$01,$04,$04,$04,$01,$01,$04,$04,$01,$03,$04,$03,$04
.byte $03,$01,$01,$01,$01,$04,$03,$03,$01,$04,$04,$04,$04,$04,$04,$00
.byte $01,$01,$01,$03,$01,$01,$02,$01,$01,$01,$01,$01,$03,$04,$03,$04
.byte $03,$01,$01,$04,$01,$04,$03,$03,$03,$04,$03,$04,$02,$01,$03,$00
.byte $02,$03,$01,$01,$01,$03,$01,$01,$01,$01,$03,$01,$03,$04,$03,$04
.byte $03,$01,$03,$01,$01,$04,$04,$04,$04,$04,$03,$04,$04,$01,$01,$00
.byte $02,$02,$02,$03,$01,$01,$01,$03,$01,$03,$01,$01,$03,$04,$03,$04
.byte $03,$01,$01,$01,$01,$04,$04,$04,$03,$03,$03,$02,$04,$01,$03,$00
.byte $03,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$03,$04,$03,$04
.byte $03,$01,$01,$04,$01,$01,$00,$01,$01,$01,$01,$01,$04,$01,$03,$00
.byte $02,$02,$03,$02,$02,$02,$02,$01,$01,$03,$01,$01,$03,$04,$03,$04
.byte $03,$01,$01,$01,$01,$04,$04,$04,$04,$04,$04,$04,$04,$03,$01,$00
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$00,$01
.byte $01,$01,$04,$01,$01,$01,$01,$01,$00,$00,$00,$01,$01,$01,$01,$00


