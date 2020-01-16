global _ft_list_push_front

extern _malloc

section .text

_ft_list_push_front:
	cmp		rdi, 0
	je		_exit_error
	cmp		rsi, 0
	je		_exit_error
	push	r12
	mov		r12, rdi
	mov		rdi, 16
	call	_malloc
	cmp		rax, 0
	je		_ret_exit_error_malloc

_push_front:
	push	r13
	mov		r13, [r12]
	mov		[rax + 0] , rsi
	mov		[rax + 8] , r13
	mov		[r12], rax

_exit:
	pop		r13

_ret_exit_error_malloc:
	pop		r12

_exit_error:
	xor		rax, rax
	ret
	
