JASMINC  ?= jasminc
JFLAGS   ?= -g
CC       ?= cc
CFLAGS   ?= -g
AR       ?= ar
ARFLAGS  := rcs
INCLUDES := -I AES=src
JCMD     := $(JASMINC) $(JFLAGS) $(INCLUDES)

SRC      := src/aes.jazz
CTR_SRC  := src/aes_ctr.jazz
HEADERS  := src/aes.jinc
OUT      := output

SIZES    := 8 16 32 64 128 256

VARIANTS := aes \
            $(foreach s,$(SIZES),aes_zero_loop_$(s)) \
            $(foreach s,$(SIZES),aes_zero_unrolled_$(s))

CTR_VARIANTS := aes_ctr \
                $(foreach s,$(SIZES),aes_ctr_zero_loop_$(s)) \
                $(foreach s,$(SIZES),aes_ctr_zero_unrolled_$(s))

ALL_VARIANTS := $(VARIANTS) $(CTR_VARIANTS)
ALL_S    := $(addprefix $(OUT)/,$(addsuffix .s,$(ALL_VARIANTS)))
ALL_O    := $(addprefix $(OUT)/,$(addsuffix .o,$(ALL_VARIANTS)))
ALL_A    := $(addprefix $(OUT)/lib,$(addsuffix .a,$(ALL_VARIANTS)))

TEST_BIN := test/aes_test.o
TEST_SRC := test/aes_test.c
STACK_TEST_BIN := test/aes_stack_test.o
STACK_TEST_SRC := test/aes_stack_test.c
CTR_TEST_BIN := test/aes_ctr_test.o
CTR_TEST_SRC := test/aes_ctr_test.c
HEADER   := include/aes.h

.PHONY: all libs test test-stack test-ctr clean

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

$(OUT)/aes_ctr.s: $(CTR_SRC) $(HEADERS) | $(OUT)
	$(JCMD) -o $@ $<

$(OUT)/aes_ctr_zero_loop_%.s: $(CTR_SRC) $(HEADERS) | $(OUT)
	$(JCMD) -stack-zero loop -stack-zero-size u$* -o $@ $<

$(OUT)/aes_ctr_zero_unrolled_%.s: $(CTR_SRC) $(HEADERS) | $(OUT)
	$(JCMD) -stack-zero unrolled -stack-zero-size u$* -o $@ $<

$(OUT)/%.o: $(OUT)/%.s
	$(CC) $(CFLAGS) -c -o $@ $<

$(OUT)/lib%.a: $(OUT)/%.o
	$(AR) $(ARFLAGS) $@ $<

.SECONDARY: $(ALL_O) $(ALL_S)

$(TEST_BIN): $(TEST_SRC) $(HEADER) $(OUT)/libaes.a
	$(CC) $(CFLAGS) -maes -msse2 -I include -o $@ $(TEST_SRC) $(OUT)/libaes.a

$(STACK_TEST_BIN): $(STACK_TEST_SRC) $(HEADER) $(OUT)/libaes.a
	$(CC) $(CFLAGS) -maes -msse2 -I include -o $@ $(STACK_TEST_SRC) $(OUT)/libaes.a

$(CTR_TEST_BIN): $(CTR_TEST_SRC) $(HEADER) $(OUT)/libaes_ctr.a
	$(CC) $(CFLAGS) -maes -msse2 -I include -o $@ $(CTR_TEST_SRC) $(OUT)/libaes_ctr.a

test: $(TEST_BIN)
	./$(TEST_BIN)

test-stack: $(STACK_TEST_BIN)
	./$(STACK_TEST_BIN)

test-ctr: $(CTR_TEST_BIN)
	./$(CTR_TEST_BIN)

clean:
	rm -f $(ALL_S) $(ALL_O) $(ALL_A) $(TEST_BIN) $(STACK_TEST_BIN) $(CTR_TEST_BIN)
