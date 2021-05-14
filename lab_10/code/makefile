SRCPATH := ./sources/
INCPATH := ./includes/

CC := gcc
CFLAGS := -std=gnu11 -O0 -w -I$(INCPATH) -masm=intel -mavx -mavx2

SRCS := $(addprefix ${SRCPATH}, $(addsuffix .c, main dot_product_asm dot_product_c measure))

.PHONY : clean

lab_10: $(SRCS)
	$(CC) $(CFLAGS) -o $@ $^
	
dis: $(SRCS)
	$(CC) $(CFLAGS) -S ${SRCPATH}dot_product_asm.c -o asm.s
	$(CC) $(CFLAGS) -S ${SRCPATH}dot_product_c.c -o c.s

clean: 
	$(RM) *.s lab_10