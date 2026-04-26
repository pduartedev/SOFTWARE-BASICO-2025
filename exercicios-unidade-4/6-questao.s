.section .data
    vetor     : .long 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 
    conta_par : .long 0

.section .text

.global _start

_start:

    _for:
        cmpl $10, %edi
        jge  _end_for

        # %eax = vetor[i(%edi)]
        movl vetor(, %edi, 4), %eax

        _if_par:
            # divide %eax / %ebx para que o resto da divisao esteja em %edx
            movl $2, %ebx
            cdq
            idivl %ebx

            cmpl $0, %edx
            jne _end_if_par

            # incrementa o contador de pares
            incl conta_par

        _end_if_par:
            incl %edi
            jmp _for 

        incl %edi
        jmp _for 

    _end_for:
        movl conta_par, %edi

        movq $60, %rax
        syscall
