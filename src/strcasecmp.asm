BITS 64

DEFAULT REL

section .bss

s1      resq  1
s2      resq  1

section .text:

global strcasecmp:function
extern toupper

; rdi -> const char *
; rsi -> const char *
strcasecmp:
    push rbp
    mov rbp, rsp

    mov [s1], rdi
    mov [s2], rsi

L1:
    mov rdi, [s2]
    mov rdi, [rdi]
    mov rdx, toupper
    call rdx
    mov bl, al

    mov rdi, [s1]
    mov rdi, [rdi]
    mov rdx, toupper
    call rdx

    cmp al, 0
    jz COMPUTE_RES

    cmp al, bl
    ja COMPUTE_RES
    jb COMPUTE_RES

    inc qword [s1]
    inc qword [s2]
    jmp L1

COMPUTE_RES:
    cmp al, bl

    ja POS_RES
    jb NEG_RES
    jmp EQU_RES

POS_RES:
    mov rax, 1
    jmp END

NEG_RES:
    mov rax, -1
    jmp END

EQU_RES:
    xor rax, rax
    jmp END

END:
    leave
    ret
