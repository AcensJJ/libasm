global _ft_read

section .text

_ft_read:
    mov rax, 0x2000003;
    syscall
    cmp rdx, 0
    je .exit_ok

.exit_error:
    mov rax, -1

.exit_ok:
    ret