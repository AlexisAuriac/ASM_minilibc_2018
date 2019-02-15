BITS 64

section .text:

global  tolower:function

; rdi -> char
tolower:
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
