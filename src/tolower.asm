BITS 64

section .text:

global  tolower:function

; rdi -> char
tolower:
    push rbp
    mov rbp, rsp

    cmp rdi, 'A'
    jb END

    cmp rdi, 'Z'
    ja END

    add rdi, 'a' - 'A'

END:
    mov rax, rdi
    leave
    ret
