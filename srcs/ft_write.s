global _ft_write

section .text

_ft_write:
    mov rax, 0x2000004;
    syscall
    cmp rdx, 0
    je .exit_ok

.exit_error:
    mov rax, -1

.exit_ok:
    ret