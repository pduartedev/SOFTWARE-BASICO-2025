.section .data
    a: .byte 255
    b: .word 7
    c: .word 10
    d: .long 0
    r: .long 0

.section .text

.global _start

_start:
    # d = a
    movb a, %al
    movsbl %al, %eax # d = (int) a
    movl %eax, d
    # movslq d, %rdi # resultado = 255

    # d = d % 20
    movl d, %eax # dividendo
    movl $-21, %eax # ALTERAÇÃO 1
    movl $20, %ebx # divisor
    cdq # extende o sinal de %eax para %edx:%eax (32 → 64 bits)
        # essencial para a divisão de inteiros com sinal
    idivl %ebx
    # movslq %edx, %rdi # resultado = -1 => 255(complemento de 2)

    # b = b + c
    movw b, %bx
    addw c, %cx
    addw %cx, %bx
    # movswq %bx, %rdi # resultado = 17

    # b = b - d
    movslq %edx, %rdx
    movswq %bx, %rbx
    subq %rdx, %rbx

    # r = b
    movq %rbx, r

    movq r, %rdi

    movq $60, %rax
    syscall
