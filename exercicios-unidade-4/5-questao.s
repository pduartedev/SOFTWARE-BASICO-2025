.section .data
    a: .long 0
    i: .long 0
    s: .long 0

.section .text

.globl _start


_start:
    movl $0, s
    movl $1, a
    movl $1, i

    _while:
        cmpl $10, i
        jg _end

        _if:
            # a % 2
            movl a, %eax
            movl $2, %ebx
            cdq
            idivl %ebx

            # (a % 2 == 0)
            cmpl $0, %edx
            jne _end_if

            # s = s + a
            movl s, %eax
            addl a, %eax
            movl %eax, s

        _end_if:
            incl a
            incl i

            jmp _while
    
    _end:
        movl s, %edi

        movq $60, %rax
        syscall
