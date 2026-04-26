.section .data
    a: .word 7
    b: .word 10
    c: .word 15
    r: .long 0

.section .text

.global _start
    
_start:
    # c = c % b
    movw c, %ax # dividendo %ax, %dx:%ax, %edx:%eax, %rdx: %rax
    movw b, %bx # divisor
                # quociente = al, %ax, %eax e %eax
                # resto = %ah, %dx, %edx e %rdx
    idivw %bx    # resto armazenado em %dx
    # movswl %dx, %edi # resultado = 5

    # c(edx) = c * a
    movw a, %ax
    imulw %ax, %dx
    # movswl %dx, %edi # resultado = 10
    
    # r = c
    movswl %dx, %edx
    movl %edx, r

    movl r, %edi # resultado = 35

    movq $60, %rax
    syscall
