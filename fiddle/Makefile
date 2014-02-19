all: build

.PHONY: build test

LIB_SOURCES = $(wildcard *.dylan) \
	       fiddle.lid

build: $(LIB_SOURCES)
	mkdir -p _build/bin
	OPEN_DYLAN_TARGET_PLATFORM=x86_64-darwin dylan-compiler -build fiddle.lid

clean:
	rm -rf _build/
