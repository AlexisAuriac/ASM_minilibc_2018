BITS 64

section .text:

global  strlen:function

strlen:
    push    rbp
    mov     rbp, rsp

    xor     rcx, rcx

L1:
    cmp     byte [rdi + rcx], 0
    jz      END
    inc     rcx
    jmp     L1

END:
    mov     rax, rcx
    leave
    ret
