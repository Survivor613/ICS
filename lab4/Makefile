#
# Student makefile for Cache Lab
# Note: requires a 64-bit x86-64 system
#

CC        = gcc
CFLAGS    = -g -Wall -Werror -std=c99 -m64
BUILD_DIR = build
BIN_DIR   = $(BUILD_DIR)/bin
OBJ_DIR   = $(BUILD_DIR)/obj
REF_DIR   = ref-bin

.PHONY: all clean refs

all: $(BIN_DIR)/csim $(BIN_DIR)/test-trans $(BIN_DIR)/tracegen

# build reference binaries for staff use (not required by students)
refs: $(BIN_DIR)/csim-ref $(BIN_DIR)/test-csim | $(REF_DIR)
	cp $(BIN_DIR)/csim-ref $(REF_DIR)/csim-ref
	cp $(BIN_DIR)/test-csim $(REF_DIR)/test-csim

$(BIN_DIR) $(OBJ_DIR) $(REF_DIR):
	mkdir -p $@

$(OBJ_DIR)/trans.o: trans.c cachelab.h | $(OBJ_DIR)
	$(CC) $(CFLAGS) -O0 -c trans.c -o $@

$(BIN_DIR)/csim: csim.c cachelab.c cachelab.h | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ csim.c cachelab.c -lm
	ln -sf $@ csim

$(BIN_DIR)/test-trans: test-trans.c $(OBJ_DIR)/trans.o cachelab.c cachelab.h | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ test-trans.c cachelab.c $(OBJ_DIR)/trans.o
	ln -sf $@ test-trans

$(BIN_DIR)/tracegen: tracegen.c $(OBJ_DIR)/trans.o cachelab.c | $(BIN_DIR)
	$(CC) $(CFLAGS) -O0 -o $@ tracegen.c $(OBJ_DIR)/trans.o cachelab.c
	ln -sf $@ tracegen

$(BIN_DIR)/csim-ref: ref-src/csim-ref.c cachelab.c cachelab.h | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ ref-src/csim-ref.c cachelab.c -lm

$(BIN_DIR)/test-csim: test-csim.c cachelab.c cachelab.h | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ test-csim.c cachelab.c

clean:
	rm -rf $(BUILD_DIR)
	rm -f *.tar
	rm -f trace.all trace.f* trace.tmp
	rm -f .csim_results .marker
	rm -f csim csim-ref test-csim test-trans tracegen
