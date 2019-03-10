.section .text

.global strncmp

# rdi -> const char *
# rsi -> const char *
# rdx -> size_t
strncmp:
    pushq %rbp
    movq %rsp, %rbp

L1:
    cmpq $0, %rdx
    je EQU_RES

    dec %rdx

    movb (%rdi), %al
    movb (%rsi), %bl
    cmp %bl, %al
    ja POS_RES
    jb NEG_RES

    cmpb $0, %al
    je EQU_RES

    inc %rdi
    inc %rsi
    jmp L1

POS_RES:
    mov $1, %rax
    jmp END

NEG_RES:
    mov $-1, %rax
    jmp END

EQU_RES:
    xor %rax, %rax
    jmp END

END:
    leave
    ret
