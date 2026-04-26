.section .data
# declaracao de variaveis
a : .quad 0
b : .quad 0

.section .text
.globl _start
_start:

	movq $5, a
	movq $2, b
	
	movq a, %rax
	movq b, %rbx
		# a = a * b;
		#rax = rax * rbx
	mulq %rbx 

	# %rax = %rax * %rbx
	#imulq %rbx
  
    movq %rax,%rdi
	movq $60, %rax
	syscall
	