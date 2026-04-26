.section .data
# declaracao de variaveis
.section .text
.globl _start
_start:
    movb $113, %al    #                       01110001 byte 113 
    negb %al          # 11111111 ... 11111111 10001111 byte -113
    movzbq %al,%rdi   # 00000000 ... 00000000 10001111 qword 143
	movq $60, %rax
	syscall
	