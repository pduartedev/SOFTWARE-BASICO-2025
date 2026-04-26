.section .data
    vector: .long 7, 2, 3, 4, 5, 8, 9, 6, 0, 1
    size: .long 10

.section .text

.globl _start

_start:
    # i = 0
    movl $0, %r8d
    
    # j = 0
    movl $0, %r9d 

    _for_i:
        cmpl size, %r8d
        jge _end_for_i

        movl vector(, %r8d, 4), %eax

        # j =  i + 1
        movl %r8d, %r9d
        addl $1, %r9d

        _for_j:
            cmpl size, %r9d
            jge _end_for_j

            movl vector(, %r9d, 4), %ebx

            # vetor[i] > vetor[j]
            _if:
                cmpl %ebx, %eax
                jle _end_if

                # vector[i] = %ebx
                movl %ebx, vector(, %r8d, 4) 
                # vector[j] = %eax
                movl %eax, vector(, %r9d, 4)

                # A CORREÇÃO: Atualiza o %eax com o novo menor valor encontrado!
                movl %ebx, %eax
            
            _end_if:
                incl %r9d
                jmp _for_j 

        _end_for_j:
            incl %r8d
            jmp _for_i

    _end_for_i:
        movl %eax, %edi
        
        movq $60, %rax
        syscall
