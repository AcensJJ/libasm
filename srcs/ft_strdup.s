global _ft_strdup

extern  _ft_strlen, _malloc, _ft_strcpy

section .text

_ft_strdup:
	push	rbp
	mov		rbp, rsp
    push	r12
    mov		r12, rdi
    call	_ft_strlen
    inc		rax
    mov		rdi, rax
    push	rax
    call	_malloc
    cmp		rax, 0
    je		.exit
    mov		rdi, rax
    mov		rsi, r12
    call	_ft_strcpy

.exit:
    pop		rax
    pop		r12
	leave
	ret
