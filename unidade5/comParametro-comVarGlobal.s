.section .data
    A: .quad 0
    B: .quad 0

.section .text

.globl _soma
.globl _start

_soma:
    pushq %rbp
    movq %rsp, %rbp

    # ARMAZENA a variavel local (z)
    subq $8, %rsp

    # PEGA O PRIMEIRO PARAMETRO (a) e armazena em %rax
    movq 16(%rbp), %rax
    # PEGA O SEGUNDO PARAMETRO (b) e soma com %rax
    addq 24(%rbp), %rax

    # GUARDA O RESULTADO na variavel local (z)
    movq %rax, -8(%rbp)

    # REMOVE a variavel local (z)
    addq $8, %rsp

    popq %rbp
    ret

_start:
    movq $4, A
    movq $5, B

    # parametro por pilha
    pushq B
    pushq A

    call _soma

    # descarta os dois long ints que foram empilhados
    addq $16, %rsp

    movq %rax, %rdi

    movq $60, %rax
    syscall

