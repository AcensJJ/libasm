global _ft_atoi_base

extern  _ft_strlen

section .text

_ft_atoi_base:
    push	r8        ;str
    push	r9        ;base
    push	r12        ;len
    mov		r8, rdi
    mov		r9, rsi
    mov		rdi, rsi
    call	_ft_strlen
    cmp		rax, 2      ;base < 2
    jl		_exitun
    mov		r12, rax
    push	r13        ;i
    push	r14        ;return value
	mov		r14, 0
    push	r15        ;sign
	mov		r15, 1
	push	r10        ;tmp1
    push	rbx        ;tmp2
	xor		r10, r10
	xor		r13, r13
	jmp		_check_base

_check_doublon:
	cmp		[r9 + rbx], byte 0
	je		_check_base
	mov		r10, [r9 + rbx]
	cmp		[r9 + r13 - 1], r10
	je		_exit_error2
	inc		rbx
	jmp		_check_doublon

_check_base:
	cmp		byte [r9 + r13], 0
	je		_skip_init
	cmp		byte [r9 + r13], 127
	je		_exit_error2
	cmp		byte [r9 + r13], 43
	je		_exit_error2
	cmp		byte [r9 + r13], 45
	je		_exit_error2
	cmp		byte [r9 + r13], 32
	jl		_exit_error2
	inc		r13
	mov		rbx, r13
	jmp		_check_doublon

_skip_init:
	xor		r13, r13
	jmp		_skip_init

_skip_space:
	inc		r13
	jmp		_skip

_skip_whitespace:
	cmp		byte [r8 + r13], 13
	jg		_sign
	inc		r13

_skip:
	cmp		byte [r8 + r13], 32
	je		_skip_space
	cmp		byte [r8 + r13], 9
	jge		_skip_whitespace
	jmp		_sign

_skip_more:
	inc		r13
	jmp		_sign

_skip_many:
	inc		r13
	imul		r15, -1

_sign:
	cmp		byte [r8 + r13], 43
	je		_skip_more
	cmp		byte [r8 + r13], 45
	je		_skip_many
	mov		r10, 0
	jmp		_nb

_value_not_egal:
	cmp		al, byte 0
	je		_exit
	inc		r10

_value_nb:
	mov		al, byte [r9 + r10]
	mov		dl, byte [r8 + r13]
	cmp		dl, byte 0
	je		_exit
	cmp		dl, al
	je		_value_more
	cmp		dl, al
	jne		_value_not_egal

_value_more:
	inc		r13

_nb:
	imul	r14, r12	
	add		r14, r10
	mov		r10, 0
	jmp		_value_nb

_exit:
	imu		 r14, r15
    mov		rax, r14
    pop		rbx
    pop		r10
	pop		r15
    pop		r14
    pop		r13
    pop		r12
    pop		r9
    pop		r8
    ret

_exit_error2:
    pop		rbx
    pop		r10
	pop		r15
    pop		r14
    pop		r13

_exitun:
    pop		r12
    pop		r9
    pop		r8
    mov		rax, 0
    ret