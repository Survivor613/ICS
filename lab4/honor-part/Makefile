#
# Honor-part makefile for Cache Lab
#

CC        = gcc
CFLAGS    = -g -Wall -Werror -std=c99 -m64
BUILD_DIR = build
BIN_DIR   = $(BUILD_DIR)/bin
OBJ_DIR   = $(BUILD_DIR)/obj

.PHONY: all clean

all: $(BIN_DIR)/test-mul $(BIN_DIR)/tracegen

$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

$(OBJ_DIR)/mul.o: mul.c cachelab.h | $(OBJ_DIR)
	$(CC) $(CFLAGS) -O0 -c mul.c -o $@

$(BIN_DIR)/test-mul: test-mul.c $(OBJ_DIR)/mul.o cachelab.c cachelab.h | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ test-mul.c cachelab.c $(OBJ_DIR)/mul.o
	ln -sf $@ test-mul

$(BIN_DIR)/tracegen: tracegen.c $(OBJ_DIR)/mul.o cachelab.c | $(BIN_DIR)
	$(CC) $(CFLAGS) -O0 -o $@ tracegen.c $(OBJ_DIR)/mul.o cachelab.c
	ln -sf $@ tracegen

clean:
	rm -rf $(BUILD_DIR)
	rm -f *.tar
	rm -f trace.all trace.f* trace.tmp
	rm -f .csim_results .marker
