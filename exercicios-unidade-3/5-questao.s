.section .data
    a: .long 7
    b: .long 10
    r: .long 0

.section .text

.global _start

_start:
    # b = b * 2
    movl b, %eax
    imull $2, %eax

    # a = a + b
    movl a, %ebx
    addl %ebx, %eax

    # r = a
    movl %eax, r
    
    movl r, %edi

    movq $60, %rax
    syscall
