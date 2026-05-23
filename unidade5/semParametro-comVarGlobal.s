# Sem Parâmetros e com Variáveis Locais:

.section .data
    a: .quad 0
    b: .quad 0

.section .text

.globl _start

soma:
    pushq %rbp
    movq %rsp, %rbp
    

    # CRIAÇÃO DE VARIAVEIS LOCAIS DENTRO DA FUNÇÃO
    subq $16, %rsp

    movq a, %rax
    movq %rax, -8(%rbp)

    movq b, %rbx
    movq %rbx, -16(%rbp)

    movq -8(%rbp), %rax
    movq -16(%rbp), %rbx

    addq %rbx, %rax

    addq $16, %rsp

    popq %rbp
ret


_start:
    movq $4, a
    movq $5, b

    call soma

    movq %rax, %rdi

    movq $60, %rax
syscall
