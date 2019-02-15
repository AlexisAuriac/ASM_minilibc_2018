BITS 64

section .text:

global memmove:function
extern memcpy

; rdi -> void *dest
; rsi -> void *src
; rdx -> size_t n
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

    xor rax, rax
    mov rax, rdi
    add rax, rcx ; rax now contains address to dest byte
    dec rax

    xor rbx, rbx
    mov rbx, rsi
    add rbx, rcx ; rbx now contains address to src byte
    dec rbx
    mov rbx, [rbx] ; rbx contains src byte

    mov byte [rax], bl

    dec rcx
    jmp L1

END:
    mov rax, rdi
    leave
    ret

