.section .data
.section .text
.globl _start
_start:

	movq $60, %rax
	movq $21, %rdi
	syscall
	