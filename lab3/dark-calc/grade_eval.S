    .att_syntax prefix
    .global _start
_start:
    mov    $0x4, %rdi
    mov    $0x4011df, %rax
    jmp    *%rax
