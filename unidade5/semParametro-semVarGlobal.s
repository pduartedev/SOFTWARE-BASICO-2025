# Sem Parâmetros e sem Variáveis Locais:

.section .data
    a: .quad 0
    b: .quad 0

.section .text


.globl _start

soma:
    pushq %rbp
    movq %rsp, %rbp

    movq a, %rax
    movq b, %rbx

    addq %rax, %rbx
    movq %rbx, %rax

    popq %rbp
ret

_start:
    movq $4, a
    movq $5, b

    call soma

    movq %rax, %rbx

    movq %rbx, %rdi

    movq $60, %rax
syscall
