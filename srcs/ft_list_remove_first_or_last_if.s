global _ft_list_remove_first_or_last_if

extern _free

section .text

_ft_list_remove_first_or_last_if:
	push	rbp
	mov		rbp, rsp
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
	xor		r14, r14
	push	r15			;tmp
    mov		r12, rdi
	mov		rdi, [rdi]

_verif_first:
	mov		r15, rdi
	push	rdi
	mov		rdi, [r15]
	call	rdx
	pop		rdi
	cmp		rax, 0
	jne		_setup

_push_front:
	cmp		[rdi + 8], byte 0
	je		_push_front_null
	mov		r14, [rdi + 8] 		; tmp = next
	mov		[rdi + 8], byte 0 	; next = null
	mov		r15, rdi
	mov		rdi, [rdi]			; rdi = data
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
	mov		rdi, r14			; lst = next (tmp)
	mov		[r12], r14			; lst ** -> next (tmp)
	jmp		_verif_first

_setup:
	mov		r13, rdi
	cmp		[rdi + 8], byte 0
	je		_exit
	jmp		_loop

_loop:
	mov		rdi, [rdi + 8]
	mov		r15, [rdi]
	cmp		[rdi + 8], byte 0
	je		_verif_last_exit
	mov		r13, rdi
	jmp		_loop

_verif_last_exit:
	mov		r15, rdi
	push	rdi
	mov		rdi, [r15]
	call	rdx
	pop		rdi
	cmp		rax, 0
	jne		_set_val
	mov		[r13 + 8], byte 0
	mov		r13, [r13 + 8]
	mov		r13, 0
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
	jmp		_set_val

_push_front_null:
	mov		rdi, [rdi]
	call	rcx
	mov		rdi, [r12]
	call	_free
	mov		[r12], byte 0

_set_val:
	mov		rdi, r12

_exit:
	pop		r15
	pop		r14
	pop		r13
	pop		r12

_exit_error:
	xor		rax, rax
	leave
	ret