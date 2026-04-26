.section .data
# declaracao de variaveis
a : .quad 0
b : .quad 0

.section .text
.globl _start
_start:

        movq $15, a
        movq $20, b
       
        movq a, %rax
        movq b, %rbx
			# b = b + a
        addq %rax, %rbx # b + a
			# b = b + a
		#movq %rbx, b 
		#movq %rbx,%rdi
		#movq $60, %rax
		#syscall
		
		#movq a, %rax
        #movq b, %rbx 
			# b - a
        #subq %rax, %rbx
			# b = b - a
		#movq %rbx, b 
		#movq %rbx,%rdi
		#movq $60, %rax
		#syscall
		