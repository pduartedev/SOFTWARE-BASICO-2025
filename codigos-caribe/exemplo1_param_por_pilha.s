.section .text
soma:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	movq 16(%rbp), %rbx
	addq 24(%rbp), %rbx
	addq 32(%rbp), %rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp),%rax
	addq $8, %rsp
	popq %rbp
	ret
	

.globl _start
_start:	
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $10, -8(%rbp)
	movq $7, -16(%rbp)
	movq $5, -24(%rbp)
	pushq -24(%rbp)
	pushq -16(%rbp)
	pushq -8(%rbp)
	call soma
	addq $24, %rsp
	movq %rax, -32(%rbp)
	movq -32(%rbp), %rdi
	addq $32, %rsp
	popq %rbp
	movq $60, %rax
	syscall
