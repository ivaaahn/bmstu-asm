	.file	"measures32.c"
	.intel_syntax noprefix
	.text
	.globl	calc_sum32
	.type	calc_sum32, @function
calc_sum32:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	movss	DWORD PTR -20[rbp], xmm0
	movss	DWORD PTR -24[rbp], xmm1
	mov	QWORD PTR -32[rbp], rdi
	mov	QWORD PTR -8[rbp], 0
	jmp	.L2
.L3:
	fld	DWORD PTR -20[rbp]
	fadd	DWORD PTR -24[rbp]
	fstp	DWORD PTR -12[rbp]
	add	QWORD PTR -8[rbp], 1
.L2:
	mov	rax, QWORD PTR -8[rbp]
	cmp	rax, QWORD PTR -32[rbp]
	jb	.L3
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	calc_sum32, .-calc_sum32
	.globl	calc_sum32_asm
	.type	calc_sum32_asm, @function
calc_sum32_asm:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	movss	DWORD PTR -36[rbp], xmm0
	movss	DWORD PTR -40[rbp], xmm1
	mov	QWORD PTR -48[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -16[rbp], 0
	jmp	.L5
.L6:
#APP
# 18 "sources/measures32.c" 1
	fld DWORD PTR -36[rbp]
fld DWORD PTR -40[rbp]
faddp
fstp DWORD PTR -20[rbp]

# 0 "" 2
#NO_APP
	add	QWORD PTR -16[rbp], 1
.L5:
	mov	rax, QWORD PTR -16[rbp]
	cmp	rax, QWORD PTR -48[rbp]
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
	.size	calc_sum32_asm, .-calc_sum32_asm
	.globl	calc_mul32
	.type	calc_mul32, @function
calc_mul32:
.LFB2:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	movss	DWORD PTR -20[rbp], xmm0
	movss	DWORD PTR -24[rbp], xmm1
	mov	QWORD PTR -32[rbp], rdi
	mov	QWORD PTR -8[rbp], 0
	jmp	.L9
.L10:
	fld	DWORD PTR -20[rbp]
	fmul	DWORD PTR -24[rbp]
	fstp	DWORD PTR -12[rbp]
	add	QWORD PTR -8[rbp], 1
.L9:
	mov	rax, QWORD PTR -8[rbp]
	cmp	rax, QWORD PTR -32[rbp]
	jb	.L10
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	calc_mul32, .-calc_mul32
	.globl	calc_mul32_asm
	.type	calc_mul32_asm, @function
calc_mul32_asm:
.LFB3:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	movss	DWORD PTR -36[rbp], xmm0
	movss	DWORD PTR -40[rbp], xmm1
	mov	QWORD PTR -48[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -16[rbp], 0
	jmp	.L12
.L13:
#APP
# 40 "sources/measures32.c" 1
	fld DWORD PTR -36[rbp]
fld DWORD PTR -40[rbp]
fmulp
fstp DWORD PTR -20[rbp]

# 0 "" 2
#NO_APP
	add	QWORD PTR -16[rbp], 1
.L12:
	mov	rax, QWORD PTR -16[rbp]
	cmp	rax, QWORD PTR -48[rbp]
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
	.size	calc_mul32_asm, .-calc_mul32_asm
	.section	.rodata
.LC3:
	.string	"[+]     %-5.3g ns\n"
.LC4:
	.string	"[+] asm %-5.3g ns\n"
	.text
	.type	print_sum32_info, @function
print_sum32_info:
.LFB4:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	movss	DWORD PTR -20[rbp], xmm0
	movss	DWORD PTR -24[rbp], xmm1
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	movss	xmm0, DWORD PTR -24[rbp]
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, 1000000000
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	calc_sum32
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -32[rbp], rax
	fild	QWORD PTR -32[rbp]
	fld	QWORD PTR .LC1[rip]
	fdivp	st(1), st
	fld	QWORD PTR .LC2[rip]
	fdivp	st(1), st
	fstp	QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR -32[rbp]
	lea	rdi, .LC3[rip]
	mov	eax, 1
	call	printf@PLT
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	movss	xmm0, DWORD PTR -24[rbp]
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, 1000000000
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	calc_sum32_asm
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -32[rbp], rax
	fild	QWORD PTR -32[rbp]
	fld	QWORD PTR .LC1[rip]
	fdivp	st(1), st
	fld	QWORD PTR .LC2[rip]
	fdivp	st(1), st
	fstp	QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR -32[rbp]
	lea	rdi, .LC4[rip]
	mov	eax, 1
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	print_sum32_info, .-print_sum32_info
	.section	.rodata
.LC5:
	.string	"[*]     %-5.3g ns\n"
.LC6:
	.string	"[*] asm %-5.3g ns\n"
	.text
	.type	print_mul32_info, @function
print_mul32_info:
.LFB5:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	movss	DWORD PTR -20[rbp], xmm0
	movss	DWORD PTR -24[rbp], xmm1
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	movss	xmm0, DWORD PTR -24[rbp]
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, 1000000000
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	calc_mul32
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -32[rbp], rax
	fild	QWORD PTR -32[rbp]
	fld	QWORD PTR .LC1[rip]
	fdivp	st(1), st
	fld	QWORD PTR .LC2[rip]
	fdivp	st(1), st
	fstp	QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR -32[rbp]
	lea	rdi, .LC5[rip]
	mov	eax, 1
	call	printf@PLT
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	movss	xmm0, DWORD PTR -24[rbp]
	mov	eax, DWORD PTR -20[rbp]
	mov	edi, 1000000000
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	calc_mul32_asm
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -32[rbp], rax
	fild	QWORD PTR -32[rbp]
	fld	QWORD PTR .LC1[rip]
	fdivp	st(1), st
	fld	QWORD PTR .LC2[rip]
	fdivp	st(1), st
	fstp	QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR -32[rbp]
	lea	rdi, .LC6[rip]
	mov	eax, 1
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	print_mul32_info, .-print_mul32_info
	.section	.rodata
.LC7:
	.string	"FLOAT (%zu bits)\n\n"
.LC9:
	.string	"==================="
	.text
	.globl	print_measures32
	.type	print_measures32, @function
print_measures32:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	esi, 32
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	fld	DWORD PTR .LC8[rip]
	fstp	DWORD PTR -8[rbp]
	fld	DWORD PTR .LC8[rip]
	fstp	DWORD PTR -4[rbp]
	movss	xmm0, DWORD PTR -4[rbp]
	mov	eax, DWORD PTR -8[rbp]
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	print_sum32_info
	movss	xmm0, DWORD PTR -4[rbp]
	mov	eax, DWORD PTR -8[rbp]
	movaps	xmm1, xmm0
	movd	xmm0, eax
	call	print_mul32_info
	lea	rdi, .LC9[rip]
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_measures32, .-print_measures32
	.section	.rodata
	.align 8
.LC1:
	.long	3539053052
	.long	1062232653
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.align 4
.LC8:
	.long	2139095040
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
