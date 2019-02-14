BITS 64

section .text:

global  my_memset:function

; rdi -> void *s
; rsi -> int c
; rdx -> size_t n
my_memset:
    push rbp
    mov rbp, rsp

END:
    mov rax, rdi
    leave
    ret
