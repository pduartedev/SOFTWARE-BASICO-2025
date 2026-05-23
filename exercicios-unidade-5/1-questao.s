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

.globl _quantidade_pares
.globl _start

_quantidade_pares:
    pushq %rbp
    movq %rsp, %rbp

    # Variaveis locais (há duas alternativas pilha ou registrador)

    # Variáveis locais
    subq $16, %rsp      
    movq $0, -8(%rbp)   # int i = 0
    movq $0, -16(%rbp)  # int pares = 0

    # Copiar variáveis locais e parâmetros para o registrador temporário (%r12 e %r13)
    movq -8(%rbp), %r10     # i
    movq -16(%rbp), %r11    # pares
    movq 16(%rbp), %r12     # vetor[10]
    movq 24(%rbp), %r13     # tam

    _for:
        cmpq %r13, %r10 
        jge _end_for

        _if:
            movq (%r12, %r10, 8), %rax

            movq $2, %rbx
            cqo # Convert quad to octo para registradores de 64 bits
            idivq %rbx

            cmpq $0, %rdx
            jne _end_if

            # pares++
            incq %r11
        
        _end_if:
            incq %r10
            jmp _for
        
    _end_for:
        # Retorno no registrador %rax
        movq %r11, %rax
        
        addq $16, %rsp
        
        popq %rbp
        ret

_start:
    pushq %rbp
    movq %rsp, %rbp

    # Variaveis locais (tamanho e vetor[10])
    subq $96, %rsp # int pares = 0 
    subq $88, %rsp # int tam = 10, 
    subq $80, %rsp # int vetor[10];
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

    # Empilha o segundo parametro (tam = 10)
    pushq -88(%rbp)

    # Calcula o primeiro parâmetro (endereço do vetor manualmente)
    # movq %rbp, %rax
    # subq $80, %rax

    # Melhor alternativa, usar leaq (Calcule a matemática do endereço -80(%rbp)). Em seguida, empilha o primeiro parâmetro (vetor[10])
    leaq -80(%rbp), %rax
    pushq %rax

    # Chamada da função
    call _quantidade_pares

    # Limpeza dos parâmetros passados pela função
    addq $16, %rsp

    movq %rax, -96(%rbp)
    movq -96(%rbp), %rdi

    # Limepza das variáveis locais
    addq $96, %rsp

    popq %rbp

    movq $60, %rax
    syscall
    