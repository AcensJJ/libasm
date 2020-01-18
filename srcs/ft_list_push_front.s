global _ft_list_push_front

extern _malloc

section .text

_ft_list_push_front:
	push	rbp
	mov		rbp, rsp
	cmp		rdi, 0
	je		_exit
	push	rdi
	push	rsi
	mov		rdi, 16
	call	_malloc
	pop		rsi
	pop		rdi
	cmp		rax, 0
	je		_exit
	mov		[rax], rsi

_push_front:
	mov		rsi, [rdi]
	mov		[rax + 8], rsi
	mov		[rdi], rax
	pop		rsp
	leave
	ret

_exit:
	pop		rsp
	leave
	ret