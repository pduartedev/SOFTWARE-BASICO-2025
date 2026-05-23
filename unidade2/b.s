.section .data
a: quad 0
b: quad 0

.section .data

.globl _start
_start:
    movq $7, a # endereçamento imediato
    movq $7. b

    movq a, %rax # endereçamento direto
    movq b, %rbx

    addq %rax, %rbx # rbx = rax + rbx (endereçamento registrador)

    movq %rbx, a

    movq a, %rdi
    movq $60, %rax

    syscall


