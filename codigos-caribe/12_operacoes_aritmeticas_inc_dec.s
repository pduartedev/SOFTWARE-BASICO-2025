.section .data
# declaracao de variaveis
a : .quad 0
b : .quad 0

.section .text
.globl _start
_start:

        movq $2, a
        
        movq a, %rax
            
		# %rax = %rax + 1
		#incq %rax

		# %rax = %rax - 1
		#decq %rax 

		# %rax = -%rax
		negq %rax
		
        movq %rax,%rdi
	movq $60, %rax
	syscall
	