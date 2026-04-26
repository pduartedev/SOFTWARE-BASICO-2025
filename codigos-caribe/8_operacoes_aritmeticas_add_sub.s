.section .data
# declaracao de variaveis
a : .quad 0
b : .quad 0

.section .text
.globl _start
_start:

        movq $200, a
        movq $20, b
       	
		movq a, %rax
        movq b, %rbx 
			# b - a
        subq %rax, %rbx # 180 => -180 => 10110100 comp2 01001011+1 => 01001100 (76)
			# b = b - a
		movq %rbx, b 
		movzbq %bl,%rdi
		movq $60, %rax
		syscall
		