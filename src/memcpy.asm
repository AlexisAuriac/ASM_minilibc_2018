BITS 64

section .bss

dest    resq    1
src     resq    1
n       resq    1

section .text:

global my_memcpy:function

; rdi -> void *dest
; rsi -> void *src
; rdx -> size_t n
my_memcpy:
    push rbp
    mov rbp, rsp

    mov [dest], rdi
    mov [src], rsi
    mov [n], rdx

    mov rcx, 0

L1:
    cmp rcx, [n]
    je END

    xor rax, rax
    mov rax, [dest]
    add rax, rcx ; rax now contains address to dest byte

    xor rbx, rbx
    mov rbx, [src]
    add rbx, rcx ; rbx now contains address to src byte
    mov rbx, [rbx] ; rbx contains src byte

    mov byte [rax], bl

    inc rcx
    jmp L1

END:
    mov rax, [dest]
    leave
    ret

