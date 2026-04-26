.section .data
.section .text
.globl _start
_start:
    movb $-7, %bl    # move constante de um byte (11111001) (249)
    movsbw %bl, %bx   # move %bh de um byte para %bx de dois bytes 11111111(bh).11111001(bl)
	
	movq $60, %rax
	movb %bl, %dl
	movsbq %dl,%rdi
	syscall
	