# (Assembly com passagem de parâmetros por pilha):

# PILHA (DETALHE IMPORTANTE): 
# > -16(%rbp): Variável local maior
# > -8(%rbp): Variável local i
# >  0(%rbp): Âncora (o %rbp antigo)
# >  8(%rbp): Endereço de Retorno
# >  16(%rbp): Parâmetro 1 (vetor)
# >  24(%rbp): Parâmetro 2 (tam)

.section .data
.section .text

.globl _maior_elemento
.globl _start

_maior_elemento:
    pushq %rbp
    movq %rsp, %rbp

    # Variáveis locais
    subq $16, %rsp      
    movq $0, -8(%rbp)   # int i = 0
    movq $0, -16(%rbp)  # int maior = 0

    # Copiar variáveis locais e parâmetros para o registrador temporário (%r12 e %r13)
    movq -8(%rbp), %r10     # i
    movq -16(%rbp), %r11    # maior
    movq 16(%rbp), %r12     # vetor[10]
    movq 24(%rbp), %r13     # tam

    # maior = v[0]
    movq (%r12, %r10, 8), %r11

    # i= 1
    movq $1, %r10

    _for:
        cmpq %r13, %r10
        jge _end_for

    movq (%r12, %r10, 8), %rax

    _if:
        cmpq %rax, %r11
        jge _end_if

        movq %rax, %r11

    _end_if:
        incq %r10
        jmp _for

    _end_for:

        addq $16, %rsp

        movq %r11, %rax

        popq %rbp
        ret

_start:
    pushq %rbp
    movq %rsp, %rbp

    # Variáveis locais
    subq $96, %rsp # long int maior = 0
    subq $88, %rsp # long int tam = 0
    subq $80, %rsp # long int vetor[10]
    movq $0     ,   -96(%rbp)   
    movq $10    ,   -88(%rbp)
    movq $-8    ,   -80(%rbp)
    movq $1     ,   -72(%rbp)
    movq $4     ,   -64(%rbp)
    movq $23    ,   -56(%rbp)
    movq $12    ,   -48(%rbp)
    movq $67    ,   -40(%rbp)
    movq $98    ,   -32(%rbp)
    movq $2     ,   -24(%rbp)
    movq $5     ,   -16(%rbp)
    movq $9     ,   -8(%rbp)

    # Parâmetros
    leaq -80(%rbp), %rax

    pushq -88(%rbp) # Segundo: tam
    pushq %rax      # Primeiro: rax = &vetor

    call _maior_elemento

    # Limpeza dos parâmetros passados pela função
    addq $16, %rsp

    movq %rax, -96(%rbp)
    movq -96(%rbp), %rdi

    # Limepza das variáveis locais
    addq $96, %rsp

    popq %rbp

    movq $60, %rax
    syscall
