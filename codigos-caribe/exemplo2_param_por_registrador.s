.section .text
.globl _start
soma:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	movq %rdi, %rbx
	addq %rsi, %rbx
	addq %rdx, %rbx
	addq %rcx, %rbx
	addq %r8, %rbx
	addq %r9, %rbx
	addq 16(%rbp), %rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp),%rax
	addq $8, %rsp
	popq %rbp
	ret

_start:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq $10, -8(%rbp) #a
	movq $8, -16(%rbp) #b
	movq $6, -24(%rbp) #c
	movq $4, -32(%rbp) #d
	movq $2, -40(%rbp) #e
	movq $1, -48(%rbp) #f
	movq $4, -56(%rbp) #g
	# r = -64(%rbp)
	
	movq -8(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdx
	movq -32(%rbp), %rcx
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	pushq -56(%rbp)
	call soma
	addq $8, %rsp
	movq %rax, -64(%rbp)

	movq -64(%rbp), %rdi
	addq $64, %rsp
	popq %rbp
	movq $60, %rax
	syscall
