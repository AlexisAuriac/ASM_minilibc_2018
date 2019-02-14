BITS 64

section .bss

s       resq    1
n       resq    1

section .text:

global memset:function

; rdi -> void *s
; rsi -> int c
; rdx -> size_t n
memset:
    push rbp
    mov rbp, rsp

    mov [s], rdi
    mov [n], rdx

    mov rcx, 0

L1:
    cmp rcx, [n]
    je END

    xor rax, rax
    mov rax, [s]
    add rax, rcx ; rax now contains address to current byte

    mov byte [rax], sil

    inc rcx
    jmp L1

END:
    mov rax, [s]
    leave
    ret
