.section .data
    a: .long 0
    n: .long 2

.section .text

.globl _start

_start:
    # a = numero
    movl $15, a
    movl a, %eax

    # divisão (resto em %edx)
    movl $2, %ebx
    cdq
    idivl %ebx

    # if(a % 2  == 0)
    _if:
        cmpl $0, %edx  # compara %eax com $0
        jne _else_if   # se for diferente, salta para o label

        # n = 0
        movl $0, n
        
        jmp _end

    _else_if:        
        movl $1, n

    _end:
        movl n, %edi
        movq $60, %rax
        syscall
