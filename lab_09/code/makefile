SRCPATH := ./sources/
INCPATH := ./includes/
OUTPATH := ./out/

CC := gcc
CFLAGS := -std=gnu11 -o0 -w -I$(INCPATH) -masm=intel -DASM


SRCS := $(addprefix ${SRCPATH}, $(addsuffix .c, measures32 measures64 measures_sin main))

.PHONY : clean


nox87: CFLAGS += -mno-80387
nox87: $(SRCS)
	$(CC) $(CFLAGS) -o $@ $^ -lm


x87: CFLAGS += -m80387 -DX87 -mfpmath=387
x87: $(SRCS) ${SRCPATH}measures80.c
	$(CC) $(CFLAGS) -o $@ $^ -lm


clean:
	@$(RM) ${OUTPATH}/* ./*.o
	@rm -rf $(OUTPATH)