.section .text

.global memcpy

# rdi -> void *
# rsi -> void *
# rdx -> size_t
memcpy:
    push %rbp
    movq %rsp, %rbp

    xor %rcx, %rcx
    movq %rdi, %rax

L1:
    cmpq %rcx, %rdx
    je END

    movb (%rsi), %bl # rbx contains src byte
    movb %bl, (%rdi)

    inc %rcx
    inc %rdi
    inc %rsi
    jmp L1

END:
    leave
    ret

