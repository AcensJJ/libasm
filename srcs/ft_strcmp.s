global _ft_strcmp

section .text

_ft_strcmp:
	push	r12
	push	r13
	push	r14
	xor		r12, r12
	xor		r13, r13
	xor		r14, r14
	movzx	r14, BYTE [rdi + r12]
	movzx	r13, BYTE [rsi + r12]
	cmp		r14, r13
	jne		.exit
	cmp		byte [rsi], 0
	je		.exit

.loop:
	inc		r12
	movzx	r14, BYTE [rdi + r12]
	movzx	r13, BYTE [rsi + r12]
	cmp		r14, r13
	jne		.exit
	cmp		byte [rsi + r12], 0
	jne		.loop

.exit:
	movzx	r14, BYTE [rdi + r12]
	movzx	r13, BYTE [rsi + r12]
	sub		r14, r13
	mov		rax, r14
	pop		r14
	pop		r13
	pop		r12
	ret 