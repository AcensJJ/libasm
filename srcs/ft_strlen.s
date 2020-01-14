global _ft_strlen

section .text

_ft_strlen:
	push r12
	xor	r12, r12
	cmp byte [rdi], 0
	je .exit

.loop:
	inc r12
	cmp byte [rdi + r12], 0
	jne .loop

.exit:
	mov rax, r12
	pop r12
	ret