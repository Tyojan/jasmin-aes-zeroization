JASMINC  ?= jasminc
JFLAGS   ?=
CC       ?= cc
AR       ?= ar
ARFLAGS  := rcs
INCLUDES := -I AES=src
JCMD     := $(JASMINC) $(JFLAGS) $(INCLUDES)

SRC      := src/aes.jazz
HEADERS  := src/aes.jinc
OUT      := output

SIZES    := 8 16 32 64 128 256

VARIANTS := aes \
            $(foreach s,$(SIZES),aes_zero_loop_$(s)) \
            $(foreach s,$(SIZES),aes_zero_unrolled_$(s))

ALL_S    := $(addprefix $(OUT)/,$(addsuffix .s,$(VARIANTS)))
ALL_O    := $(addprefix $(OUT)/,$(addsuffix .o,$(VARIANTS)))
ALL_A    := $(addprefix $(OUT)/lib,$(addsuffix .a,$(VARIANTS)))

TEST_BIN := test/aes_test.o
TEST_SRC := test/aes_test.c
HEADER   := include/aes.h

.PHONY: all libs test clean

all: libs

libs: $(ALL_A)

$(OUT):
	mkdir -p $(OUT)

$(OUT)/aes.s: $(SRC) $(HEADERS) | $(OUT)
	$(JCMD) -o $@ $<

$(OUT)/aes_zero_loop_%.s: $(SRC) $(HEADERS) | $(OUT)
	$(JCMD) -stack-zero loop -stack-zero-size u$* -o $@ $<

$(OUT)/aes_zero_unrolled_%.s: $(SRC) $(HEADERS) | $(OUT)
	$(JCMD) -stack-zero unrolled -stack-zero-size u$* -o $@ $<

$(OUT)/%.o: $(OUT)/%.s
	$(CC) -c -o $@ $<

$(OUT)/lib%.a: $(OUT)/%.o
	$(AR) $(ARFLAGS) $@ $<

.SECONDARY: $(ALL_O) $(ALL_S)

$(TEST_BIN): $(TEST_SRC) $(HEADER) $(OUT)/libaes.a
	$(CC) $(CFLAGS) -maes -msse2 -I include -o $@ $(TEST_SRC) $(OUT)/libaes.a

test: $(TEST_BIN)
	./$(TEST_BIN)

clean:
	rm -f $(ALL_S) $(ALL_O) $(ALL_A) $(TEST_BIN)
