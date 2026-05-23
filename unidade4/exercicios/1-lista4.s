.section .data
    a: .long 0
    n: .long -1

.section .text

.globl _start

_start:
    # a = 16
    movl $15, a
    movl a, %eax

    # divisão (resto em %edx)
    movl $2, %ebx
    cdq
    idivl %ebx

    # if(a % 2  == 0)
    _if:
        cmpl $0, %edx  # compara %eax com $0
        jne _end_if    # se for diferente, salta para o label

        # n = 0
        movl $0, n

    _end_if:
        movl n, %edi

        movq $60, %rax
        syscall
