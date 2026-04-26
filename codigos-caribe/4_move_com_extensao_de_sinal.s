.section .data
.section .text
.globl _start
_start:
    movb $7, %bl    # move constante de um byte (00000111)
    movsbw %bl, %bx   # move %bh de um byte para %bx de dois bytes 00000000(bh).00000111(bl)
	
	movq $60, %rax
	movb %bh, %dl
	movsbq %dl,%rdi
	syscall
	