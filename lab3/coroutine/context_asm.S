.text

.globl __ctx_save
__ctx_save:
    endbr64
    movq %r15, 0x00(%rdi)
    movq %r14, 0x08(%rdi)
    movq %r13, 0x10(%rdi)
    movq %r12, 0x18(%rdi)
    movq %rbx, 0x20(%rdi)
    movq %rbp, 0x28(%rdi)
    leaq 8(%rsp), %rax
    movq %rax, 0x30(%rdi)
    movq (%rsp), %rax
    movq %rax, 0x38(%rdi)
    xor %eax, %eax
    ret

.globl __ctx_restore
__ctx_restore:
    endbr64
    movq 0x00(%rdi), %r15
    movq 0x08(%rdi), %r14
    movq 0x10(%rdi), %r13
    movq 0x18(%rdi), %r12
    movq 0x20(%rdi), %rbx
    movq 0x28(%rdi), %rbp
    movq 0x30(%rdi), %rsp
    movl %esi, %eax
    movq 0x38(%rdi), %rdx
    movq 0x40(%rdi), %rdi
    jmp *%rdx

#ifdef __ELF__
.section .note.GNU-stack,"",@progbits
#endif
