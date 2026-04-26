.section .data
# declaracao de variaveis
a : .byte 0
b : .word 0
c : .long 0
d : .quad 0
vetor: .quad 1,5,3,2
.section .text
.globl _start
_start:
    
    movq $60, %rax
	syscall
    