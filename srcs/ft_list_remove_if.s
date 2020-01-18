global _ft_list_remove_if

extern _free, _ft_list_remove_first_or_last_if

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
	push	r14			;next
	push	r15			;tmp
	mov		r12, rdi
	mov		r13, [rdi]
	mov		r14, rdx
	mov		r15, rcx
	mov		rdi, [rdi]
	cmp		[rdi + 8], byte 0
	je		_end
	mov		rdi, [rdi + 8]
	cmp		[rdi + 8], byte 0
	je		_end
	jmp		_loop

_free_val:
	mov		r14, [rdi + 8] ; next
	mov		[r13 + 8], r14	; av -> apres (skip)
	mov		r15, rdi
	mov		rdi, [rdi]
	push	r13
	push	rdx
	mov		rdx, rcx
	push	rcx
	mov		r13, rsi
	call	rdx
	mov		rdi, r15
	call	_free
	mov		rsi, r13	
	pop		rcx
	pop		rdx
	pop		r13
	mov		rdi, r14 ; next
	cmp		[rdi + 8], byte 0
	je		_end

_loop:
	mov		r15, rdi
	push	rdi
	mov		rdi, [r15]
	call	rdx
	pop		rdi
	cmp		rax, 0
	je		_free_val
	mov		r13, rdi
	mov		rdi, [rdi + 8]
	cmp		[rdi + 8], byte 0
	jne		_loop

_end:
	mov		rdi, r12
	call	_ft_list_remove_first_or_last_if

_exit:
	pop		r15
	pop		r14
	pop		r13
	pop		r12

_exit_error:
	ret