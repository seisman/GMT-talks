#
# Makefile for all figures in GMT_Docs
#
OUT_DIR=../figures
PDF = $(patsubst %.sh, $(OUT_DIR)/%.pdf, $(wildcard *.sh))

all: $(OUT_DIR) $(PDF) clean

%.ps: %.sh
	sh $<

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(OUT_DIR)/%.pdf: %.ps
	gmt psconvert -A -Tf -P -D$(OUT_DIR) $<

clean:
	@rm -f *.ps
