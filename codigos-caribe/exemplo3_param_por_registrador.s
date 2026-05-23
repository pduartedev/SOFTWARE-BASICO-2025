.section .text

_soma:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp # i s
	movq $0, -16(%rbp)
	movq $0, -8(%rbp)	
_for:
	cmpq %rsi, -8(%rbp)
	jge _end_for
	movq -8(%rbp), %rbx  
	movq (%rdi,%rbx,8),%rax    # rax = vet[i]    i = rbx
	addq %rax, -16(%rbp)
	incq -8(%rbp)  #i++
	jmp _for
_end_for:
	movq -16(%rbp), %rax
	addq $16, %rsp
	popq %rbp
	ret

.globl _start
_start:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp #long int vet[10]
	subq $8, %rsp  #r
	
	movq $1 , -80(%rbp)
	movq $2 , -72(%rbp)
	movq $3 , -64(%rbp)
	movq $4 , -56(%rbp)
	movq $5 , -48(%rbp)
	movq $6 , -40(%rbp)
	movq $7 , -32(%rbp)
	movq $8 , -24(%rbp)
	movq $9 , -16(%rbp)
	movq $10 , -8(%rbp)

	movq %rbp, %rax
	subq $80, %rax   # &vet[0]
	#leaq -80(%rbp),%rax
	movq %rax, %rdi # 1 param &vet[0]
	movq $10, %rsi
	call _soma
	movq %rax, -88(%rbp)
	movq -88(%rbp), %rdi
	
	addq $88, %rsp

	popq %rbp
	movq $60, %rax
	syscall
