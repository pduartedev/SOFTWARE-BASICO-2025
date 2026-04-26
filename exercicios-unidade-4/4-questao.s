.section .data
    a: .long 0
    i: .long 0
    s: .long 0

.section .text

.globl _start

_start:
    # s = 0
    movl $0, s

    # a = 1
    movl $1, a

    # i = 0
    movl $1, i

    # for(i = 1; i <= 10; i++)
    _for:
        cmpl $10, i
        jg _end

        # s = s + a
        movl s, %eax
        addl a, %eax
        movl %eax, s
        
        # a++
        incl a

        # i++
        incl i

        jmp _for

    _end:
        movl s, %edi
        movq $60, %rax
        syscall
