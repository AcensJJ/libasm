global _ft_list_remove_if

extern _free

section .text

_ft_list_remove_if:
	cmp		rdi, 0
	je		_exit_error
	cmp		rsi, 0		;data ref
	je		_exit_error
	cmp		rdx, 0		;fnct
	je		_exit_error
	cmp		rcx, 0		;free content
	je		_exit_error
	cmp		[rdi], byte 0
	je		_exit_error
	push	r12			;list
	push	r13			;bef_lst
	push	r14			;tmp
    mov		r12, rdi
	mov		rdi, [rdi]
	cmp		rdi, 0
	je		_exit
	call	rdx
	cmp		rax, 0
	jne		_setup

_push_front:
	mov		r14, [rdi + 8]
	mov		qword [rdi + 8], 0
	call	rcx
	call	_free
	mov		rdi, r14
	mov		[r12], r14

_setup:
	mov		r13, rdi
	jne		_loop

_free_lst:
	mov		r14, [rdi + 8]
	mov		r13, r14
	call	rcx
	call	_free;
	mov		rdi, r14

_loop:
	mov		rdi, [rdi + 8]
	cmp		rdi, 0
	je		_exit
	call	rdx,
	cmp		rax, 0
	je		_free_lst
	mov		r13, rdi
	jmp		_loop

_exit:
	pop r14
	pop r13
	pop r12

_exit_error:
	ret

	;if list = null car list 1 elem retiré