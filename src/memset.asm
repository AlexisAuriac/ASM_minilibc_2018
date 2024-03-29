BITS 64

section .text

global memset:function

; rdi -> void *
; rsi -> int
; rdx -> size_t
memset:
    push rbp
    mov rbp, rsp

    mov rcx, 0

L1:
    cmp rcx, rdx
    je END

    mov rax, rdi
    add rax, rcx ; rax now contains address to current byte

    mov byte [rax], sil

    inc rcx
    jmp L1

END:
    mov rax, rdi
    leave
    ret
