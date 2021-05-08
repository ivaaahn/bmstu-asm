	.file	"measures_sin.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC1:
	.string	"\tsin(pi)"
.LC3:
	.string	"3.14\t\t:\t%g\n"
.LC5:
	.string	"3.141596\t:\t%g\n"
.LC6:
	.string	"FPU\t\t:\t%g\n"
.LC7:
	.string	"\tsin(pi / 2)"
.LC9:
	.string	"3.14 / 2\t:\t%g\n"
.LC11:
	.string	"3.141596 / 2\t:\t%g\n"
	.text
	.globl	print_measures_sin
	.type	print_measures_sin, @function
print_measures_sin:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	fldz
	fstp	QWORD PTR -16[rbp]
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	rax, QWORD PTR .LC2[rip]
	movq	xmm0, rax
	lea	rdi, .LC3[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR .LC4[rip]
	movq	xmm0, rax
	lea	rdi, .LC5[rip]
	mov	eax, 1
	call	printf@PLT
#APP
# 12 "sources/measures_sin.c" 1
	fldpi
fsin
fstp QWORD PTR -16[rbp]

# 0 "" 2
#NO_APP
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	lea	rdi, .LC6[rip]
	mov	eax, 1
	call	printf@PLT
	mov	edi, 10
	call	putchar@PLT
	lea	rdi, .LC7[rip]
	call	puts@PLT
	mov	rax, QWORD PTR .LC8[rip]
	movq	xmm0, rax
	lea	rdi, .LC9[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR .LC10[rip]
	movq	xmm0, rax
	lea	rdi, .LC11[rip]
	mov	eax, 1
	call	printf@PLT
	fld	QWORD PTR .LC12[rip]
	fstp	QWORD PTR -16[rbp]
#APP
# 24 "sources/measures_sin.c" 1
	fldpi
fld QWORD PTR -16[rbp]
fdivp
fsin
fstp QWORD PTR -16[rbp]

# 0 "" 2
#NO_APP
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	lea	rdi, .LC6[rip]
	mov	eax, 1
	call	printf@PLT
	mov	edi, 10
	call	putchar@PLT
	nop
	mov	rax, QWORD PTR -8[rbp]
	xor	rax, QWORD PTR fs:40
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	print_measures_sin, .-print_measures_sin
	.section	.rodata
	.align 8
.LC2:
	.long	204214900
	.long	1062869010
	.align 8
.LC4:
	.long	2004573403
	.long	-1093922212
	.align 8
.LC8:
	.long	1439071153
	.long	1072693247
	.align 8
.LC10:
	.long	4294954688
	.long	1072693247
	.align 8
.LC12:
	.long	0
	.long	1073741824
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
