global _ft_list_sort

section .text

_ft_list_sort:
	cmp		rdi, 0
	je		_exit_error
	cmp		rsi, 0
	je		_exit_error
	cmp		[rdi], byte 0
	je		_exit_error
	push	r12					;list
    mov		r12, rdi
	push	rdi
	push	r13					;fnct
    mov		r13, rsi
	push	r14					;tmp
	mov		rdi, [r12]
	push	r15					;bef_lst
	cmp		[rdi + 8], byte 0
	je		_exit
	mov		rsi, [rdi + 8]


_loop_before:
	mov		r14, [rdi]
	push	rdi
	mov		rdi, r14
	mov		r14, [rsi]
	push	rsi
	mov		rsi, r14
	call	r13
	pop		rsi
	pop		rdi
	mov		r15, rdi
	cmp		rax, 0
	jle		_loop_after

_push_front:
	cmp		[rsi + 8], byte 0
	je		_push_front_null_next
	mov		r14, [rsi + 8]		; tmp next
	mov		[rdi + 8], r14		; actu -> -> next -> next
	mov		[rsi + 8], rdi		; next -> actu
	mov		[r12], rsi			; reset beg list **
	mov		rdi, rsi
	mov		rsi, [rsi + 8]
	mov		r15, rdi
	jmp		_loop_after

_push_front_null_next:
	mov		[rdi + 8], byte 0
	mov		[rsi + 8], rdi
	mov		[r12], rsi
	mov		rdi, [rdi]
	jmp		_exit

_loop_after:
	cmp		[rsi + 8], byte 0
	je		_exit
	mov		rdi, rsi
	mov		rsi, [rsi + 8]
	mov		r14, [rdi]
	push	rdi
	mov		rdi, r14
	mov		r14, [rsi]
	push	rsi
	mov		rsi, r14
	call	r13
	pop		rsi
	pop		rdi
	cmp		rax, 0
	jg		_loop_swap
	mov		r15, rdi
	jmp		_loop_after

_loop_swap:
	cmp		[rsi + 8], byte 0
	je		_loop_swap_null_next
	mov		r14, [rsi + 8] 		;tmp -> (next)
	mov		[rdi + 8], r14		;actu->next->tmp
	mov		[rsi + 8], rdi		;actu->next -> next->actu
	mov		[r15 + 8], rsi		; av->next->actu->tmp

_reset:
	mov		rdi, [r12]
	mov		rsi, [rdi + 8]
	jmp		_loop_before

_loop_swap_null_next:
	mov		[rdi + 8], byte 0	; pas de next
	mov		[rsi + 8], rdi		; next vers actu
	mov		[r15 + 8], rsi		; av vers actu
	jmp		_reset

_exit:
	pop		rdi
	pop		r15
	pop		r14
	pop		r13
	pop		r12

_exit_error:
	ret