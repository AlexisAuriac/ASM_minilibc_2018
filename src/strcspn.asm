BITS 64

DEFAULT REL

section .bss

s resq 1
reject resb 1

section .text

global strcspn:function
extern strchr

; rdi -> const char *
; rsi -> const char *
strcspn:
    push rbp
    mov rbp, rsp

    mov [s], rdi
    mov [reject], rsi
    mov rcx, 0

L1:
    mov rsi, [s]
    add rsi, rcx
    mov rsi, [rsi]

    cmp sil, 0
    je END

    mov rdi, [reject]

    mov rax, strchr
    call rax

    cmp rax, 0
    ja END
    jb END

    inc rcx
    jmp L1

END:
    mov rax, rcx
    leave
    ret
