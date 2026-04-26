.section .data
    vetor: .long 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    maior_elemento: .long 0

.section .text

.globl _start

_start:
    _for:
        cmpl $10, %edi
        jge _end_for

        movl vetor(, %edi, 4), %eax

        _if_maior:
            cmpl maior_elemento, %eax
            jl _end_if_maior

            movl %eax, maior_elemento

        _end_if_maior:
            incl %edi
            jmp _for

    _end_for:
        movl maior_elemento, %edi

        movq $60, %rax
        syscall
