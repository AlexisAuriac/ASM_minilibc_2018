BITS 64

section .text:

global my_toupper:function

; rdi -> char
my_toupper:
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
