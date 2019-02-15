BITS 64

section .text:

global  toupper:function

; rdi -> char
toupper:
    push rbp
    mov rbp, rsp

    cmp dil, 'a'
    jb END

    cmp dil, 'z'
    ja END

    sub rdi, 'a' - 'A'

END:
    mov rax, rdi
    leave
    ret
