BITS 64

DEFAULT REL

section .bss

haystack resq 1
needle resq 1
len resq 1

section .text:

global strstr:function
extern strlen
extern strchr
extern strncmp

; rdi -> const char *
; rsi -> const char *
strstr:
    push rbp
    mov rbp, rsp

    mov [haystack], rdi
    mov [needle], rsi

    mov rdi, rsi
    mov rax, strlen
    call rax

    mov [len], rax

L1:
    mov rdi, [haystack]
    mov rsi, [needle]
    mov rsi, [rsi]
    mov rax, strchr
    call rax
    cmp rax, 0
    je NOT_FOUND

    mov [haystack], rax

    mov rdi, [haystack]
    mov rsi, [needle]
    mov rdx, [len]
    mov rax, strncmp
    call rax

    cmp rax, 0
    je FOUND

    mov rax, [haystack]
    inc rax
    mov [haystack], rax
    jmp L1

FOUND:
    mov rax, [haystack]
    leave
    ret

NOT_FOUND:
    xor rax, rax
    leave
    ret
