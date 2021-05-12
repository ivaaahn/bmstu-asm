	.file	"measures80.c"
	.intel_syntax noprefix
	.text
	.globl	calc_sum80
	.type	calc_sum80, @function
calc_sum80:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -24[rbp], 0
	jmp	.L2
.L3:
	fld	TBYTE PTR 16[rbp]
	fld	TBYTE PTR 32[rbp]
	faddp	st(1), st
	fstp	TBYTE PTR -16[rbp]
	add	QWORD PTR -24[rbp], 1
.L2:
	mov	rax, QWORD PTR -24[rbp]
	cmp	rax, QWORD PTR -40[rbp]
	jb	.L3
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	calc_sum80, .-calc_sum80
	.globl	calc_sum80_asm
	.type	calc_sum80_asm, @function
calc_sum80_asm:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	QWORD PTR -56[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -40[rbp], 0
	jmp	.L5
.L6:
#APP
# 18 "sources/measures80.c" 1
	fld TBYTE PTR 16[rbp]
fld TBYTE PTR 32[rbp]
faddp
fstp TBYTE PTR -32[rbp]

# 0 "" 2
#NO_APP
	add	QWORD PTR -40[rbp], 1
.L5:
	mov	rax, QWORD PTR -40[rbp]
	cmp	rax, QWORD PTR -56[rbp]
	jb	.L6
	nop
	mov	rax, QWORD PTR -8[rbp]
	xor	rax, QWORD PTR fs:40
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	calc_sum80_asm, .-calc_sum80_asm
	.globl	calc_mul80
	.type	calc_mul80, @function
calc_mul80:
.LFB2:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -24[rbp], 0
	jmp	.L9
.L10:
	fld	TBYTE PTR 16[rbp]
	fld	TBYTE PTR 32[rbp]
	fmulp	st(1), st
	fstp	TBYTE PTR -16[rbp]
	add	QWORD PTR -24[rbp], 1
.L9:
	mov	rax, QWORD PTR -24[rbp]
	cmp	rax, QWORD PTR -40[rbp]
	jb	.L10
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	calc_mul80, .-calc_mul80
	.globl	calc_mul80_asm
	.type	calc_mul80_asm, @function
calc_mul80_asm:
.LFB3:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	QWORD PTR -56[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -40[rbp], 0
	jmp	.L12
.L13:
#APP
# 40 "sources/measures80.c" 1
	fld TBYTE PTR 16[rbp]
fld TBYTE PTR 32[rbp]
fmulp
fstp TBYTE PTR -32[rbp]

# 0 "" 2
#NO_APP
	add	QWORD PTR -40[rbp], 1
.L12:
	mov	rax, QWORD PTR -40[rbp]
	cmp	rax, QWORD PTR -56[rbp]
	jb	.L13
	nop
	mov	rax, QWORD PTR -8[rbp]
	xor	rax, QWORD PTR fs:40
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	calc_mul80_asm, .-calc_mul80_asm
	.section	.rodata
.LC3:
	.string	"[+]     %-5.3g ns\n"
.LC4:
	.string	"[+] asm %-5.3g ns\n"
	.text
	.type	print_sum80_info, @function
print_sum80_info:
.LFB4:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	push	QWORD PTR 40[rbp]
	push	QWORD PTR 32[rbp]
	push	QWORD PTR 24[rbp]
	push	QWORD PTR 16[rbp]
	mov	edi, 1000000000
	call	calc_sum80
	add	rsp, 32
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -24[rbp], rax
	fild	QWORD PTR -24[rbp]
	fld	QWORD PTR .LC1[rip]
	fdivp	st(1), st
	fld	QWORD PTR .LC2[rip]
	fdivp	st(1), st
	fstp	QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	lea	rdi, .LC3[rip]
	mov	eax, 1
	call	printf@PLT
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	push	QWORD PTR 40[rbp]
	push	QWORD PTR 32[rbp]
	push	QWORD PTR 24[rbp]
	push	QWORD PTR 16[rbp]
	mov	edi, 1000000000
	call	calc_sum80_asm
	add	rsp, 32
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -24[rbp], rax
	fild	QWORD PTR -24[rbp]
	fld	QWORD PTR .LC1[rip]
	fdivp	st(1), st
	fld	QWORD PTR .LC2[rip]
	fdivp	st(1), st
	fstp	QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	lea	rdi, .LC4[rip]
	mov	eax, 1
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	print_sum80_info, .-print_sum80_info
	.section	.rodata
.LC5:
	.string	"[*]     %-5.3g ns\n"
.LC6:
	.string	"[*] asm %-5.3g ns\n"
	.text
	.type	print_mul80_info, @function
print_mul80_info:
.LFB5:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	push	QWORD PTR 40[rbp]
	push	QWORD PTR 32[rbp]
	push	QWORD PTR 24[rbp]
	push	QWORD PTR 16[rbp]
	mov	edi, 1000000000
	call	calc_mul80
	add	rsp, 32
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -24[rbp], rax
	fild	QWORD PTR -24[rbp]
	fld	QWORD PTR .LC1[rip]
	fdivp	st(1), st
	fld	QWORD PTR .LC2[rip]
	fdivp	st(1), st
	fstp	QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	lea	rdi, .LC5[rip]
	mov	eax, 1
	call	printf@PLT
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	push	QWORD PTR 40[rbp]
	push	QWORD PTR 32[rbp]
	push	QWORD PTR 24[rbp]
	push	QWORD PTR 16[rbp]
	mov	edi, 1000000000
	call	calc_mul80_asm
	add	rsp, 32
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -24[rbp], rax
	fild	QWORD PTR -24[rbp]
	fld	QWORD PTR .LC1[rip]
	fdivp	st(1), st
	fld	QWORD PTR .LC2[rip]
	fdivp	st(1), st
	fstp	QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	lea	rdi, .LC6[rip]
	mov	eax, 1
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	print_mul80_info, .-print_mul80_info
	.section	.rodata
.LC7:
	.string	"long double (%zu bits)\n\n"
.LC10:
	.string	"==================="
	.text
	.globl	print_measures80
	.type	print_measures80, @function
print_measures80:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	esi, 128
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	fld	TBYTE PTR .LC8[rip]
	fstp	TBYTE PTR -32[rbp]
	fld	TBYTE PTR .LC9[rip]
	fstp	TBYTE PTR -16[rbp]
	push	QWORD PTR -8[rbp]
	push	QWORD PTR -16[rbp]
	push	QWORD PTR -24[rbp]
	push	QWORD PTR -32[rbp]
	call	print_sum80_info
	add	rsp, 32
	push	QWORD PTR -8[rbp]
	push	QWORD PTR -16[rbp]
	push	QWORD PTR -24[rbp]
	push	QWORD PTR -32[rbp]
	call	print_mul80_info
	add	rsp, 32
	lea	rdi, .LC10[rip]
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_measures80, .-print_measures80
	.section	.rodata
	.align 8
.LC1:
	.long	3539053052
	.long	1062232653
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.align 16
.LC8:
	.long	3326330880
	.long	3851859888
	.long	16526
	.long	0
	.align 16
.LC9:
	.long	2210179072
	.long	3082856621
	.long	16562
	.long	0
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
