BITS 64

section .text:

global  strcasecmp:function

; rdi -> const char *
; rsi -> const char *
strcasecmp:
    push rbp
    mov rbp, rsp

    xor rcx, rcx

L1:
    mov al, [rdi + rcx] ; al = s1[i]
    mov bl, [rsi + rcx] ; bl = s2[i]

    cmp al, 0
    jz COMPUTE_RES

    cmp al, bl
    ja COMPUTE_RES
    jb COMPUTE_RES

    inc rcx
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
