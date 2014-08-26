DOCS := Install
INPUTS := $(DOCS:%=%.md)
OUTPUTS := $(DOCS:%=%.html)

.PHONY: all

all: $(OUTPUTS)

%.html: %.md
	markdown <$< >$@
