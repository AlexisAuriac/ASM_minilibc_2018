BITS 64

section .text:

global  strchr:function

strchr:
    push    rbp
    mov     rbp, rsp

    mov     rax, rdi
    mov     rcx, rsi

L1:
    movzx   rdx, byte [rax]
    cmp     rcx, rdx
    je      FOUND

    cmp     rdx, 0
    jz      NOT_FOUND

    inc     rax
    jmp     L1

FOUND:
    leave
    ret

NOT_FOUND:
    xor     rax, rax
    leave
    ret
