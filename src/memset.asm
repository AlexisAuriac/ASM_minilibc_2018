BITS 64

section .text:

global  my_memset:function

my_memset:
    push    rbp
    mov     rbp, rsp

; L1:
    ; mov     rdi, rsi

    ; dec     rdx
    ; cmp     rdx, 0
    ; jne     L1

END:
    mov rax, rdi
    leave
    ret

section .data
msg:    db  "Hello, world!", 10
.len:   equ $ - msg
