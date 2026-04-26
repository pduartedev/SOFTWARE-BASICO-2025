.section .data
    a: .byte -7
    b: .byte 10
    r: .long 0

.section .text

.global _start

_start:
    # b = b * 2
    movsbw b, %ax
    imulw $2, %ax
    # movswq %ax, %rdi

    # a = a - b
    movsbw a, %bx
    subw %ax, %bx
    # movswq %bx, %rdi

    # r = a
    movswl %bx, %ebx
    movl %ebx, r
    
    movl r, %edi

    movq $60, %rax
    syscall
    