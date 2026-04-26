.section .data
    str: .asciz "Algoritmoso"
    caractere: .byte 'o'
    qtd: .quad 0
.section .text

.globl _start

_start:         
    movq $0, %rdi

    _for:                                   
        movb str(, %rdi, 1), %al
        cmpb $0, %al
        je _end_for
        
        cmpb caractere, %al                 # compara o caractere com %al
        jne _end_if                         # se não forem iguais, salta para _end_if
        incq qtd                            # incrimenta quando é igual

        _end_if:
            incq %rdi
            jmp _for
    
    _end_for:
        movq qtd, %rdi
        movq $60, %rax
        syscall
