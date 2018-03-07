C64SYS?=c64
C64AS?=ca65
C64LD?=ld65
EXO?=exomizer
VICE?=x64sc

C64ASFLAGS?=-t $(C64SYS) -g
C64LDFLAGS?=-Ln stoneage64.lbl -m stoneage64.map -Csrc/stoneage64.cfg

stoneage64_LDCFG:=src/stoneage64.cfg
stoneage64_OBJS:=$(addprefix obj/,ldaddr.o main.o board.o levels.o \
	tiles.o sp_willy.o sp_rock.o)
stoneage64_TARGET:=stoneage64.bin
stoneage64_PARTS:=main cs spr
stoneage64_BINS:=$(addsuffix _$(stoneage64_TARGET),$(stoneage64_PARTS))
stoneage64_EXOS:=$(stoneage64_BINS:.bin=.exo)
stoneage64_LABLES:=stoneage64.lbl
stoneage64_MAP:=stoneage64.map

sa64ld_LDCFG:=src/sa64ld.cfg
sa64ld_OBJS:=$(addprefix obj/,load.o loaddat.o exodecrunch.o)
sa64ld_BIN:=stoneage64.prg

all: $(sa64ld_BIN)

run: all
	$(VICE) -autostart $(sa64ld_BIN) -moncommands $(stoneage64_LABLES)

$(stoneage64_BINS) $(stoneage64_LABLES): $(stoneage64_OBJS)
	$(C64LD) -o $(stoneage64_TARGET) -C $(stoneage64_LDCFG) \
	       -Ln $(stoneage64_LABLES) -m $(stoneage64_MAP) $^

$(sa64ld_BIN): $(sa64ld_OBJS)
	$(C64LD) -o $@ -C $(sa64ld_LDCFG) $^

%.exo: %.bin
	$(EXO) mem -l none -c -o $@ $<

obj:
	mkdir obj

obj/loaddat.o: $(stoneage64_EXOS)

obj/%.o: src/%.s src/stoneage64.cfg Makefile | obj
	$(C64AS) $(C64ASFLAGS) -o$@ $<

clean:
	rm -fr obj *.lbl *.map *.bin *.exo

distclean: clean
	rm -f $(sa64ld_BIN)

.PHONY: all run clean distclean

