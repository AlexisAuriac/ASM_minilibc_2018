BITS 64

section .text

global memcpy:function

; rdi -> void *
; rsi -> void *
; rdx -> size_t
memcpy:
    push rbp
    mov rbp, rsp

    xor rcx, rcx

L1:
    cmp rcx, rdx
    je END

    mov rax, rdi
    add rax, rcx ; rax now contains address to dest byte

    mov rbx, [rsi + rcx] ; rbx contains src byte

    mov byte [rax], bl

    inc rcx
    jmp L1

END:
    mov rax, rdi
    leave
    ret

