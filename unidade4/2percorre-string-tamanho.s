.section .data
    str: .asciz "Algoritmos"
    tam: .quad 0

.section .text

.globl _start

_start:
    movq $0, %rdi                       # i = 0
    
    _for:
        movb str(,%rdi, 1), %al         # %al = str[0] (registrador de 1 byte - 16 bits)    
        cmpb $0, %al                    # compara %al com 0 = \0
        je _end_for                     # se for igual, salta

        incq tam                        # conta (incrementa) o tamanho - tam++
        
        incq %rdi                       # i++
        
        jmp _for

    _end_for:
        movq tam, %rdi

        movq $60, %rax
        syscall

