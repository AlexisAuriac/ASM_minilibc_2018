.section .text

.global strcmp

# rdi -> const char *
# rsi -> const char *
strcmp:
    pushq %rbp
    movq %rsp, %rbp

L1:
    movb (%rdi), %al # al = s1[i]
    movb (%rsi), %bl # bl = s2[i]

    cmpb $0, %al
    jz COMPUTE_RES

    cmpb %al, %bl
    ja COMPUTE_RES
    jb COMPUTE_RES

    inc %rdi
    inc %rsi
    jmp L1

COMPUTE_RES:
    cmpb %al, %bl

    ja NEG_RES
    jb POS_RES
    jmp EQU_RES

POS_RES:
    movq $1, %rax
    jmp END

NEG_RES:
    movq $-1, %rax
    jmp END

EQU_RES:
    xorq %rax, %rax
    jmp END

END:
    leave
    ret
