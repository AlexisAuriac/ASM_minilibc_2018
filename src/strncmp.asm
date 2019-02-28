BITS 64

section .text

global strncmp:function

; rdi -> const char *
; rsi -> const char *
; rdx -> size_t
strncmp:
    push rbp
    mov rbp, rsp

L1:
    cmp rdx, 0
    je EQU_RES

    dec rdx

    mov rax, [rdi]
    mov rbx, [rsi]
    cmp al, bl
    ja POS_RES
    jb NEG_RES

    cmp byte [rdi], 0
    je EQU_RES

    inc rdi
    inc rsi
    jmp L1

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
