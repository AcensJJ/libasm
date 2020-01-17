global _ft_list_push_front

extern _malloc

section .text

_ft_list_push_front:
	push	rbp
	mov		rbp, rsp
	cmp		rdi, 0
	je		_exit
	cmp		rsi, 0
	je		_exit
	push	rdi
	push	rsi
	mov		rdi, 16
	call	_malloc
	pop		rdx
	pop		rdi
	cmp		rax, 0
	je		_exit
	mov		[rax], rdx
	cmp		[rdi], byte 0
	je		_push_front_null
	

_push_front:
	mov		rsi, [rdi]
	mov		[rax + 8], rsi
	mov		[rdi], rax
	pop		rsp
	leave
	ret

_push_front_null:
	mov		[rax + 8], byte 0
	mov		[rdi], rax
	pop		rsp
	leave
	ret

_exit:
	pop		rsp
	
