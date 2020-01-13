global _ft_strcpy

section .text

_ft_strcpy:
	push r12
	push r13
	xor	r12, r12
	xor	r13, r13
	cmp byte [rsi], 0
	je .exit

.loop:
	mov r13, [rsi + r12]
	mov [rdi + r12], r13
	inc r12
	cmp byte [rsi + r12], 0
	jne .loop

.exit:
	mov r13, [rsi + r12]
	mov [rdi + r12], r13
	mov rax, rdi
	pop r13
	pop r12
	ret