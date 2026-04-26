.section .data
.section .text
.globl _start

_start:
        movb $5, %al    # move constante de um byte
        movw $6, %bx    # move constante de dois bytes (word)
        movl $7, %ecx   # move constante de quatro bytes (long)
        movq $8, %rdx   # move oito bytes (quad word)

	movq $60, %rax
	movq %rdx, %rdi
	syscall
	