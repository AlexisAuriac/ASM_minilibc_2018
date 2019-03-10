.section .text

.global strchr

# rdi -> const char *
# rsi -> char
strchr:
    pushq %rbp
    movq %rsp, %rbp

    movq %rdi, %rax

L1:
    cmpb %sil, (%rax)
    je FOUND

    cmpb $0, (%rax)
    jz NOT_FOUND

    inc %rax
    jmp L1

FOUND:
    leave
    ret

NOT_FOUND:
    xor %rax, %rax
    leave
    ret
