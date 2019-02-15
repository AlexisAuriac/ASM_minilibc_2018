BITS 64

section .text:

global memmove:function
extern memcpy

; rdi -> void *
; rsi -> void *
; rdx -> size_t
memmove:
    push rbp
    mov rbp, rsp

    cmp rdi, rsi
    je END
    jb REDIRECT_MEMCPY

REDIRECT_MEMCPY:
    call memcpy
    leave
    ret

L1:
    cmp rdx, 0
    je END

    mov rax, rdi
    add rax, rcx
    dec rax

    mov rbx, [rsi + rcx - 1]

    mov byte [rax], bl

    dec rcx
    jmp L1

END:
    mov rax, rdi
    leave
    ret

