.section .data
# declaracao de variaveis
a : .quad 0
b : .quad 0

.section .text
.globl _start
_start:

	movq $45, a
	movq $10, b
	
	movq a, %rax
	movq b, %rbx
	
	# %rax = %rax / %rbx
	divq %rbx

	# Dividendo
	#AX DX:AX EDX:EAX RDX:RAX	

	# Divisor
	#r/m8 r/m16 r/m32 r/m64	
		
	# Quociente
	#AL AX EAX RAX	
		
	# resto
	#AH DX EDX RDX
		
	#movq %rax, %rdi      # divisao
	movq %rdx, %rdi   # resto da divisao
	
	movq $60, %rax
	syscall
	