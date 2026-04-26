.section .data
    vetor: .quad 3, 5, 7, 9 , 11
    soma:  .quad 0

.section .text

.global _start

_start:
    # Criar um comando de repetição
    movq $0, %rdi                                       # i = 0

    _for:
        cmpq $5, %rdi                                  # rdi >= 10
        jge _end_for                                    # Se a condição acima for verdadeira, salta para _end_for

        movq soma, %rax
        addq vetor(, %rdi, 8), %rax                     # soma += vetor[i]
        movq %rax, soma

        incq %rdi                                       # i++

        jmp _for                                        # retorna ao label _for
    _end_for:
        movq soma, %rdi

        movq $60, %rax
        syscall
