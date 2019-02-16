BITS 64

DEFAULT REL

section .bss

s resq 1
accept resb 1

section .text:

global strpbrk:function
extern strchr

; rdi -> const char *
; rsi -> const char *
strpbrk:
    push rbp
    mov rbp, rsp

    mov [s], rdi
    mov [accept], rsi

L1:
    mov rsi, [s]
    mov rsi, [rsi]

    cmp sil, 0
    je NOT_FOUND

    mov rdi, [accept]

    mov rax, strchr
    call rax

    cmp rax, 0
    ja FOUND
    jb FOUND

    mov rax, [s]
    inc rax
    mov [s], rax
    jmp L1

FOUND:
    mov rax, [s]
    leave
    ret

NOT_FOUND:
    xor rax, rax
    leave
    ret
