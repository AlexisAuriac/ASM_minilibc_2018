.section .text

.global memset

# rdi -> void *
# rsi -> int
# rdx -> size_t
memset:
    push %rbp
    mov %rsp, %rbp

    movq $0, %rcx
    movq %rdi, %rax

L1:
    cmpq %rcx, %rdx
    je END

    movb %sil, (%rdi)

    inc %rcx
    inc %rdi
    jmp L1

END:
    leave
    ret
