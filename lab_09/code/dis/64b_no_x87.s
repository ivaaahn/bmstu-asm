	.file	"measures64.c"
	.intel_syntax noprefix
	.text
	.globl	calc_sum64
	.type	calc_sum64, @function
calc_sum64:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	QWORD PTR -32[rbp], xmm1
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -16[rbp], 0
	jmp	.L2
.L3:
	movsd	xmm0, QWORD PTR -24[rbp]
	addsd	xmm0, QWORD PTR -32[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	add	QWORD PTR -16[rbp], 1
.L2:
	cmp	QWORD PTR -16[rbp], 999999999
	jbe	.L3
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	calc_sum64, .-calc_sum64
	.globl	calc_sum64_asm
	.type	calc_sum64_asm, @function
calc_sum64_asm:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	QWORD PTR -48[rbp], xmm1
	mov	QWORD PTR -56[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -16[rbp], 0
	jmp	.L5
.L6:
#APP
# 18 "sources/measures64.c" 1
	fld QWORD PTR -40[rbp]
fld QWORD PTR -48[rbp]
faddp
fstp QWORD PTR -24[rbp]

# 0 "" 2
#NO_APP
	add	QWORD PTR -16[rbp], 1
.L5:
	mov	rax, QWORD PTR -16[rbp]
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
	.size	calc_sum64_asm, .-calc_sum64_asm
	.globl	calc_mul64
	.type	calc_mul64, @function
calc_mul64:
.LFB2:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	QWORD PTR -32[rbp], xmm1
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -16[rbp], 0
	jmp	.L9
.L10:
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -32[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	add	QWORD PTR -16[rbp], 1
.L9:
	cmp	QWORD PTR -16[rbp], 999999999
	jbe	.L10
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	calc_mul64, .-calc_mul64
	.globl	calc_mul64_asm
	.type	calc_mul64_asm, @function
calc_mul64_asm:
.LFB3:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	QWORD PTR -48[rbp], xmm1
	mov	QWORD PTR -56[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -16[rbp], 0
	jmp	.L12
.L13:
#APP
# 40 "sources/measures64.c" 1
	fld QWORD PTR -40[rbp]
fld QWORD PTR -48[rbp]
fmulp
fstp QWORD PTR -24[rbp]

# 0 "" 2
#NO_APP
	add	QWORD PTR -16[rbp], 1
.L12:
	mov	rax, QWORD PTR -16[rbp]
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
	.size	calc_mul64_asm, .-calc_mul64_asm
	.section	.rodata
.LC2:
	.string	"[+]     %-5.3g ns\n"
.LC3:
	.string	"[+] asm %-5.3g ns\n"
	.text
	.type	print_sum64_info, @function
print_sum64_info:
.LFB4:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	QWORD PTR -32[rbp], xmm1
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	movsd	xmm0, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	edi, 1000000000
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	calc_sum64
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	lea	rdi, .LC2[rip]
	mov	eax, 1
	call	printf@PLT
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	movsd	xmm0, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	edi, 1000000000
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	calc_sum64_asm
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	lea	rdi, .LC3[rip]
	mov	eax, 1
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	print_sum64_info, .-print_sum64_info
	.section	.rodata
.LC4:
	.string	"[*]     %-5.3g ns\n"
.LC5:
	.string	"[*] asm %-5.3g ns\n"
	.text
	.type	print_mul64_info, @function
print_mul64_info:
.LFB5:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	QWORD PTR -32[rbp], xmm1
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	movsd	xmm0, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	edi, 1000000000
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	calc_mul64
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	lea	rdi, .LC4[rip]
	mov	eax, 1
	call	printf@PLT
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	movsd	xmm0, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	edi, 1000000000
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	calc_mul64_asm
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	lea	rdi, .LC5[rip]
	mov	eax, 1
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	print_mul64_info, .-print_mul64_info
	.section	.rodata
.LC6:
	.string	"DOUBLE (%zu bits)\n\n"
.LC9:
	.string	"==================="
	.text
	.globl	print_measures64
	.type	print_measures64, @function
print_measures64:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	esi, 64
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	movsd	xmm0, QWORD PTR .LC7[rip]
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC8[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -16[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	print_sum64_info
	movsd	xmm0, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -16[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	print_mul64_info
	lea	rdi, .LC9[rip]
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_measures64, .-print_measures64
	.section	.rodata
	.align 8
.LC0:
	.long	3539053052
	.long	1062232653
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.align 8
.LC7:
	.long	4128819321
	.long	1223471830
	.align 8
.LC8:
	.long	363886485
	.long	1260845077
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
