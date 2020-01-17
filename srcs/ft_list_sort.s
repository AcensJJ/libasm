global _ft_list_sort

section .text

_ft_list_sort:
	cmp		rdi, 0
	je		_exit_error
	cmp		rsi, 0
	je		_exit_error
	push	r12			;list
    mov		r12, rdi
	push	r13			;fnct
    mov		r13, rsi
	push	r14			;tmp
	mov		rdi, [r12]
	mov		rsi, [r12 + 8]
	push	r15			;bef_lst
	cmp		rsi, 0
	je		_exit

_loop_before:
	call	r13
	cmp		rax, 0
	jge		_loop_after

_push_front:
	mov		r14, [rsi + 8]
	mov		[rdi + 8], r14
	mov		[rsi + 8], rdi
	mov		[r12], rsi
	mov		rdi, [rdi]
	mov		r15, rdi
	jmp		_loop_before

_loop_after:
	mov		rdi, rsi
	mov		rsi, [rsi + 8]
	cmp		rsi, 0
	je		_exit
	call	r13
	cmp		rax, 0
	jl		_loop_swap
	mov		r15, rdi
	jmp		_loop_after

_loop_swap:
	mov		r14, [rsi + 8]
	mov		[rdi + 8], r14
	mov		[rsi + 8], rdi
	mov		[r15 + 8], rsi

_reset:
	mov		rdi, [r12]
	mov		rsi, [r12 + 8]
	jmp		_loop_before

_exit:
	pop		r15
	pop		r14
	pop		r13
	pop		r12

_exit_error:
	ret