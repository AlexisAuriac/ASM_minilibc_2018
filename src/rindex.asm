BITS 64

section .bss

char resb 1
res resq 1

section .text

global rindex:function
extern strchr

default rel

; rdi -> const char *
; rsi -> char
rindex:
    push rbp
    mov rbp, rsp    ; prologue

    mov [char], sil

    xor rsi, rsi    ; c = '\0'
    mov rax, strchr
    call rax        ; strchr(str, c) -> result in rax
    mov [res], rax

L1:
    mov r8, [res]       ; puts the res string address in r8
    mov r8, [r8]        ; puts first char of the string in r8
    cmp r8b, [char]
    je FOUND

    cmp rdi, [res]
    jz NOT_FOUND

    dec byte [res]
    jmp L1

FOUND:
    mov rax, [res]
    leave
    ret

NOT_FOUND:
    xor rax, rax
    leave
    ret
