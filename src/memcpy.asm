BITS 64

section .text:

global memcpy:function

; rdi -> void *dest
; rsi -> void *src
; rdx -> size_t n
memcpy:
    push rbp
    mov rbp, rsp

    mov rcx, 0

L1:
    cmp rcx, rdx
    je END

    xor rax, rax
    mov rax, rdi
    add rax, rcx ; rax now contains address to dest byte

    xor rbx, rbx
    mov rbx, rsi
    add rbx, rcx ; rbx now contains address to src byte
    mov rbx, [rbx] ; rbx contains src byte

    mov byte [rax], bl

    inc rcx
    jmp L1

END:
    mov rax, rdi
    leave
    ret

