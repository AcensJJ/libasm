global _ft_list_size

section .text

_ft_list_size:
	push	r12
	xor		rax, rax
	cmp		rdi, 0
	je		_exit
	mov		r12, rdi

_loop:
	mov		r12, qword [r12 + 8]
	inc		rax
	cmp		r12, 0
	jne		_loop

_exit:
	pop		r12
	ret 