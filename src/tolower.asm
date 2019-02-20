BITS 64

section .text:

global my_tolower:function

; rdi -> char
my_tolower:
    push rbp
    mov rbp, rsp

    cmp dil, 'A'
    jb END

    cmp dil, 'Z'
    ja END

    add rdi, 'a' - 'A'

END:
    mov rax, rdi
    leave
    ret
