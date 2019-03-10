.section .text

.global strlen

# rdi -> const char *
strlen:
    push %rbp
    mov %rsp, %rbp

    movq $0, %rax

L1:
    cmpb $0, (%rdi)
    jz END

    inc %rax
    inc %rdi
    jmp L1

END:
    leave
    ret
