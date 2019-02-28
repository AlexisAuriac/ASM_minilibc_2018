BITS 64

section .text

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
    jmp L1

REDIRECT_MEMCPY:
    mov rax, memcpy
    call rax
    leave
    ret

L1:
    cmp rdx, 0
    je END

    mov rax, rdi
    add rax, rdx
    dec rax

    mov rbx, [rsi + rdx - 1]

    mov byte [rax], bl

    dec rdx
    jmp L1

END:
    mov rax, rdi
    leave
    ret

