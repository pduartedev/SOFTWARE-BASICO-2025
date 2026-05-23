# (Assembly com passagem de parâmetros por registrador):
# PRIMEIRO PARÂMETRO   :   %rdi 
# SEGUNDO PARÂMETRO    :   %rsi 
# TERCEIRO PARÂMETRO   :   %rdx 
# QUARTO PARÂMETRO     :   %rcx 
# QUINTO PARÂMETRO     :   %r8 
# SEXTO PARÂMETRO      :   %r9

# PILHA (DETALHE IMPORTANTE):
# > -16(%rbp)        : Variável local maior
# > -8(%rbp)         : Variável local i
# >  0(%rbp)         : Âncora (o %rbp antigo)
# >  8(%rbp)         : Endereço de Retorno
# >  rsi (ou 16%rbp) : Parâmetro 2 (tam)
# >  rdi (ou 24%rbp) : Parâmetro 1 (vetor) 

.section .data
.section .text

.globl _quantidade_pares
.globl _start

_quantidade_pares:
    pushq %rbp
    movq %rsp, %rbp

    # Variáveis locais
    subq $16, %rsp      
    movq $0, -8(%rbp)   # int i = 0
    movq $0, -16(%rbp)  # int pares = 0

    # Copiar as variáveis locais para um registrador temporário
    movq -8(%rbp), %r10  # i
    movq -16(%rbp), %r11 # pares

    _for:
        cmpq %rsi, %r10
        jge _end_for

        _if:
            movq (%rdi, %r10, 8), %rax
            
            movq $2, %rbx
            cqo 
            idivq %rbx

            cmpq $0, %rdx
            jne _end_if

            # pares++
            incq %r11

        _end_if:
            incq %r10
            jmp _for

    _end_for:
        addq $16, %rsp

        # Retorno no registrador %rax
        movq %r11, %rax
        
        popq %rbp
        ret

_start:
    pushq %rbp
    movq %rsp, %rbp

    subq $96, %rsp # int pares = 0, int tam = 10, int vetor[10];

    # Variáveis locais
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

    # Parâmetros
    leaq -80(%rbp), %rdi # Primeiro: rsi = &vetor
    movq -88(%rbp), %rsi # Segundo: tam

    # Chamada da função
    call _quantidade_pares

    movq %rax, -96(%rbp)
    movq -96(%rbp), %rdi

    # Limpeza das variáveis locais
    addq $96, %rsp

    popq %rbp

    movq $60, %rax
    syscall
