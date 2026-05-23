	.att_syntax
	.text
	.p2align	5
	.global	NB_AES_MEM__dec
	.global	NB_AES_MEM__enc
	.global	NB_AES_REG__dec
	.global	NB_AES_REG__enc
	.global	AES__invaes
	.global	AES__aes
	.type	NB_AES_MEM__dec, %function
NB_AES_MEM__dec:
	vmovdqu	(%rsi), %xmm11
	vmovdqu	(%rdx), %xmm1
	vmovdqu	%xmm11, %xmm0
	vpxor	%xmm2, %xmm2, %xmm2
	vaeskeygenassist	$1, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm3
	vaeskeygenassist	$2, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm4
	vaeskeygenassist	$4, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm5
	vaeskeygenassist	$8, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm6
	vaeskeygenassist	$16, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm7
	vaeskeygenassist	$32, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm8
	vaeskeygenassist	$64, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm9
	vaeskeygenassist	$128, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm12
	vmovdqu	%xmm12, %xmm10
	vaeskeygenassist	$27, %xmm12, %xmm11
	vpshufd	$255, %xmm11, %xmm11
	vshufps	$16, %xmm12, %xmm2, %xmm2
	vpxor	%xmm2, %xmm12, %xmm12
	vshufps	$140, %xmm12, %xmm2, %xmm2
	vpxor	%xmm2, %xmm12, %xmm12
	vpxor	%xmm11, %xmm12, %xmm13
	vmovdqu	%xmm13, %xmm11
	vaeskeygenassist	$54, %xmm13, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm13, %xmm2, %xmm2
	vpxor	%xmm2, %xmm13, %xmm13
	vshufps	$140, %xmm13, %xmm2, %xmm2
	vpxor	%xmm2, %xmm13, %xmm13
	vpxor	%xmm12, %xmm13, %xmm2
	vpxor	%xmm0, %xmm1, %xmm1
	aesenc	%xmm3, %xmm1
	aesenc	%xmm4, %xmm1
	aesenc	%xmm5, %xmm1
	aesenc	%xmm6, %xmm1
	aesenc	%xmm7, %xmm1
	aesenc	%xmm8, %xmm1
	aesenc	%xmm9, %xmm1
	aesenc	%xmm10, %xmm1
	aesenc	%xmm11, %xmm1
	aesenclast	%xmm2, %xmm1
	vmovdqu	(%rcx), %xmm0
	vpxor	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, (%rdi)
	ret
	.type	NB_AES_MEM__enc, %function
NB_AES_MEM__enc:
	vmovdqu	(%rsi), %xmm11
	vmovdqu	(%rdx), %xmm1
	vmovdqu	%xmm11, %xmm0
	vpxor	%xmm2, %xmm2, %xmm2
	vaeskeygenassist	$1, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm3
	vaeskeygenassist	$2, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm4
	vaeskeygenassist	$4, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm5
	vaeskeygenassist	$8, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm6
	vaeskeygenassist	$16, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm7
	vaeskeygenassist	$32, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm8
	vaeskeygenassist	$64, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm9
	vaeskeygenassist	$128, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm12
	vmovdqu	%xmm12, %xmm10
	vaeskeygenassist	$27, %xmm12, %xmm11
	vpshufd	$255, %xmm11, %xmm11
	vshufps	$16, %xmm12, %xmm2, %xmm2
	vpxor	%xmm2, %xmm12, %xmm12
	vshufps	$140, %xmm12, %xmm2, %xmm2
	vpxor	%xmm2, %xmm12, %xmm12
	vpxor	%xmm11, %xmm12, %xmm13
	vmovdqu	%xmm13, %xmm11
	vaeskeygenassist	$54, %xmm13, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm13, %xmm2, %xmm2
	vpxor	%xmm2, %xmm13, %xmm13
	vshufps	$140, %xmm13, %xmm2, %xmm2
	vpxor	%xmm2, %xmm13, %xmm13
	vpxor	%xmm12, %xmm13, %xmm2
	vpxor	%xmm0, %xmm1, %xmm1
	aesenc	%xmm3, %xmm1
	aesenc	%xmm4, %xmm1
	aesenc	%xmm5, %xmm1
	aesenc	%xmm6, %xmm1
	aesenc	%xmm7, %xmm1
	aesenc	%xmm8, %xmm1
	aesenc	%xmm9, %xmm1
	aesenc	%xmm10, %xmm1
	aesenc	%xmm11, %xmm1
	aesenclast	%xmm2, %xmm1
	vmovdqu	(%rcx), %xmm0
	vpxor	%xmm0, %xmm1, %xmm0
	vmovdqu	%xmm0, (%rdi)
	ret
	.type	NB_AES_REG__dec, %function
NB_AES_REG__dec:
	vmovdqu	%xmm0, %xmm11
	vmovdqu	%xmm11, %xmm0
	vpxor	%xmm10, %xmm10, %xmm10
	vaeskeygenassist	$1, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm3
	vaeskeygenassist	$2, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm4
	vaeskeygenassist	$4, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm5
	vaeskeygenassist	$8, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm6
	vaeskeygenassist	$16, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm7
	vaeskeygenassist	$32, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm8
	vaeskeygenassist	$64, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm12
	vmovdqu	%xmm12, %xmm9
	vaeskeygenassist	$128, %xmm12, %xmm11
	vpshufd	$255, %xmm11, %xmm11
	vshufps	$16, %xmm12, %xmm10, %xmm10
	vpxor	%xmm10, %xmm12, %xmm13
	vshufps	$140, %xmm13, %xmm10, %xmm12
	vpxor	%xmm12, %xmm13, %xmm13
	vpxor	%xmm11, %xmm13, %xmm13
	vmovdqu	%xmm13, %xmm10
	vaeskeygenassist	$27, %xmm13, %xmm11
	vpshufd	$255, %xmm11, %xmm11
	vshufps	$16, %xmm13, %xmm12, %xmm12
	vpxor	%xmm12, %xmm13, %xmm13
	vshufps	$140, %xmm13, %xmm12, %xmm12
	vpxor	%xmm12, %xmm13, %xmm13
	vpxor	%xmm11, %xmm13, %xmm11
	vmovdqu	%xmm11, %xmm13
	vaeskeygenassist	$54, %xmm11, %xmm14
	vpshufd	$255, %xmm14, %xmm14
	vshufps	$16, %xmm11, %xmm12, %xmm12
	vpxor	%xmm12, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm12, %xmm12
	vpxor	%xmm12, %xmm11, %xmm11
	vpxor	%xmm14, %xmm11, %xmm11
	vpxor	%xmm0, %xmm1, %xmm1
	aesenc	%xmm3, %xmm1
	aesenc	%xmm4, %xmm1
	aesenc	%xmm5, %xmm1
	aesenc	%xmm6, %xmm1
	aesenc	%xmm7, %xmm1
	aesenc	%xmm8, %xmm1
	aesenc	%xmm9, %xmm1
	aesenc	%xmm10, %xmm1
	aesenc	%xmm13, %xmm1
	aesenclast	%xmm11, %xmm1
	vpxor	%xmm2, %xmm1, %xmm0
	ret
	.type	NB_AES_REG__enc, %function
NB_AES_REG__enc:
	vmovdqu	%xmm0, %xmm11
	vmovdqu	%xmm11, %xmm0
	vpxor	%xmm10, %xmm10, %xmm10
	vaeskeygenassist	$1, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm3
	vaeskeygenassist	$2, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm4
	vaeskeygenassist	$4, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm5
	vaeskeygenassist	$8, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm6
	vaeskeygenassist	$16, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm7
	vaeskeygenassist	$32, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm8
	vaeskeygenassist	$64, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm10, %xmm10
	vpxor	%xmm10, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm12
	vmovdqu	%xmm12, %xmm9
	vaeskeygenassist	$128, %xmm12, %xmm11
	vpshufd	$255, %xmm11, %xmm11
	vshufps	$16, %xmm12, %xmm10, %xmm10
	vpxor	%xmm10, %xmm12, %xmm13
	vshufps	$140, %xmm13, %xmm10, %xmm12
	vpxor	%xmm12, %xmm13, %xmm13
	vpxor	%xmm11, %xmm13, %xmm13
	vmovdqu	%xmm13, %xmm10
	vaeskeygenassist	$27, %xmm13, %xmm11
	vpshufd	$255, %xmm11, %xmm11
	vshufps	$16, %xmm13, %xmm12, %xmm12
	vpxor	%xmm12, %xmm13, %xmm13
	vshufps	$140, %xmm13, %xmm12, %xmm12
	vpxor	%xmm12, %xmm13, %xmm13
	vpxor	%xmm11, %xmm13, %xmm11
	vmovdqu	%xmm11, %xmm13
	vaeskeygenassist	$54, %xmm11, %xmm14
	vpshufd	$255, %xmm14, %xmm14
	vshufps	$16, %xmm11, %xmm12, %xmm12
	vpxor	%xmm12, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm12, %xmm12
	vpxor	%xmm12, %xmm11, %xmm11
	vpxor	%xmm14, %xmm11, %xmm11
	vpxor	%xmm0, %xmm1, %xmm1
	aesenc	%xmm3, %xmm1
	aesenc	%xmm4, %xmm1
	aesenc	%xmm5, %xmm1
	aesenc	%xmm6, %xmm1
	aesenc	%xmm7, %xmm1
	aesenc	%xmm8, %xmm1
	aesenc	%xmm9, %xmm1
	aesenc	%xmm10, %xmm1
	aesenc	%xmm13, %xmm1
	aesenclast	%xmm11, %xmm1
	vpxor	%xmm2, %xmm1, %xmm0
	ret
	.type	AES__invaes, %function
AES__invaes:
	movq	%rsp, %rsi
	leaq	-16(%rsp), %rsp
	andq	$-16, %rsp
	vmovdqu	%xmm0, %xmm11
	vmovdqu	%xmm11, %xmm0
	vpxor	%xmm2, %xmm2, %xmm2
	vaeskeygenassist	$1, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	aesimc	%xmm11, %xmm3
	vaeskeygenassist	$2, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	aesimc	%xmm11, %xmm4
	vaeskeygenassist	$4, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	aesimc	%xmm11, %xmm5
	vaeskeygenassist	$8, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	aesimc	%xmm11, %xmm6
	vaeskeygenassist	$16, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	aesimc	%xmm11, %xmm7
	vaeskeygenassist	$32, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	aesimc	%xmm11, %xmm8
	vaeskeygenassist	$64, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	aesimc	%xmm11, %xmm9
	vaeskeygenassist	$128, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm12
	aesimc	%xmm12, %xmm10
	vaeskeygenassist	$27, %xmm12, %xmm11
	vpshufd	$255, %xmm11, %xmm11
	vshufps	$16, %xmm12, %xmm2, %xmm2
	vpxor	%xmm2, %xmm12, %xmm12
	vshufps	$140, %xmm12, %xmm2, %xmm2
	vpxor	%xmm2, %xmm12, %xmm12
	vpxor	%xmm11, %xmm12, %xmm13
	aesimc	%xmm13, %xmm11
	vaeskeygenassist	$54, %xmm13, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm13, %xmm2, %xmm2
	vpxor	%xmm2, %xmm13, %xmm13
	vshufps	$140, %xmm13, %xmm2, %xmm2
	vpxor	%xmm2, %xmm13, %xmm13
	vpxor	%xmm12, %xmm13, %xmm2
	vmovdqu	%xmm2, (%rsp)
	vpxor	(%rsp), %xmm1, %xmm1
	aesdec	%xmm11, %xmm1
	aesdec	%xmm10, %xmm1
	aesdec	%xmm9, %xmm1
	aesdec	%xmm8, %xmm1
	aesdec	%xmm7, %xmm1
	aesdec	%xmm6, %xmm1
	aesdec	%xmm5, %xmm1
	aesdec	%xmm4, %xmm1
	aesdec	%xmm3, %xmm1
	aesdeclast	%xmm0, %xmm1
	vmovdqu	%xmm1, %xmm0
	movq	%rsi, %rsp
	movq	%rsp, %rsi
	andq	$-16, %rsp
	subq	$16, %rsp
	movb	$0, 15(%rsp)
	movb	$0, 14(%rsp)
	movb	$0, 13(%rsp)
	movb	$0, 12(%rsp)
	movb	$0, 11(%rsp)
	movb	$0, 10(%rsp)
	movb	$0, 9(%rsp)
	movb	$0, 8(%rsp)
	movb	$0, 7(%rsp)
	movb	$0, 6(%rsp)
	movb	$0, 5(%rsp)
	movb	$0, 4(%rsp)
	movb	$0, 3(%rsp)
	movb	$0, 2(%rsp)
	movb	$0, 1(%rsp)
	movb	$0, (%rsp)
	movq	%rsi, %rsp
	ret
	.type	AES__aes, %function
AES__aes:
	vmovdqu	%xmm0, %xmm11
	vmovdqu	%xmm11, %xmm0
	vpxor	%xmm2, %xmm2, %xmm2
	vaeskeygenassist	$1, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm3
	vaeskeygenassist	$2, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm4
	vaeskeygenassist	$4, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm5
	vaeskeygenassist	$8, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm6
	vaeskeygenassist	$16, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm7
	vaeskeygenassist	$32, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm8
	vaeskeygenassist	$64, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm11
	vmovdqu	%xmm11, %xmm9
	vaeskeygenassist	$128, %xmm11, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vshufps	$140, %xmm11, %xmm2, %xmm2
	vpxor	%xmm2, %xmm11, %xmm11
	vpxor	%xmm12, %xmm11, %xmm12
	vmovdqu	%xmm12, %xmm10
	vaeskeygenassist	$27, %xmm12, %xmm11
	vpshufd	$255, %xmm11, %xmm11
	vshufps	$16, %xmm12, %xmm2, %xmm2
	vpxor	%xmm2, %xmm12, %xmm12
	vshufps	$140, %xmm12, %xmm2, %xmm2
	vpxor	%xmm2, %xmm12, %xmm12
	vpxor	%xmm11, %xmm12, %xmm13
	vmovdqu	%xmm13, %xmm11
	vaeskeygenassist	$54, %xmm13, %xmm12
	vpshufd	$255, %xmm12, %xmm12
	vshufps	$16, %xmm13, %xmm2, %xmm2
	vpxor	%xmm2, %xmm13, %xmm13
	vshufps	$140, %xmm13, %xmm2, %xmm2
	vpxor	%xmm2, %xmm13, %xmm13
	vpxor	%xmm12, %xmm13, %xmm2
	vpxor	%xmm0, %xmm1, %xmm1
	aesenc	%xmm3, %xmm1
	aesenc	%xmm4, %xmm1
	aesenc	%xmm5, %xmm1
	aesenc	%xmm6, %xmm1
	aesenc	%xmm7, %xmm1
	aesenc	%xmm8, %xmm1
	aesenc	%xmm9, %xmm1
	aesenc	%xmm10, %xmm1
	aesenc	%xmm11, %xmm1
	aesenclast	%xmm2, %xmm1
	vmovdqu	%xmm1, %xmm0
	ret
	.section	".note.GNU-stack", "", %progbits
