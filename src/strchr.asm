BITS 64

section .text

global strchr:function

; rdi -> const char *
; rsi -> char
strchr:
    push rbp
    mov rbp, rsp

    mov rax, rdi

L1:
    cmp byte [rax], sil
    je FOUND

    cmp byte [rax], 0
    jz NOT_FOUND

    inc rax
    jmp L1

FOUND:
    leave
    ret

NOT_FOUND:
    xor rax, rax
    leave
    ret
