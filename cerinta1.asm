

.data
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "%s "
	formatPrintfnr: .asciz "%d "
	indexb2: .long 0
	indexoutput: .long 0
	nr: .long 0
	semn: .asciz "-"
	formatPrintfsemn: .asciz "%s"
	operatie: .space 10
	var: .space 10
	formatPrintfvar: .asciz "%c "
	var2: .asciz "a"
	printat: .asciz "\n"
	nr_string: .space 10
	sirb6: .space 300
	sirb2: .space 1200
	output: .space 100
.text

.global main
	
main:
	pushl $sirb6
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl $sirb6, %edi
	movl $sirb2, %esi
	xorl %ecx, %ecx
	
et_for:
	movb (%edi, %ecx, 1), %al
	cmp $0, %al
	je conversie	
	cmp $48, %al
	je cif0	
	cmp $49, %al
	je cif1	
	cmp $50, %al
	je cif2	
	cmp $51, %al
	je cif3	
	cmp $52, %al
	je cif4	
	cmp $53, %al
	je cif5	
	cmp $54, %al
	je cif6	
	cmp $55, %al
	je cif7	
	cmp $56, %al
	je cif8	
	cmp $57, %al
	je cif9	
	cmp $65, %al
	je A
	cmp $66, %al
	je B
	cmp $67, %al
	je C
	cmp $68, %al
	je D	
	cmp $69, %al
	je E
	cmp $70, %al
	je F

cont: 
	incl %ecx
	jmp et_for

cif0:
	pushl %ecx
	movl indexb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	addl $4, indexb2
	popl %ecx	
	jmp cont

cif1:
	pushl %ecx	
	movl indexb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	addl $4, indexb2
	popl %ecx	
	jmp cont
cif2:
	pushl %ecx	
	movl indexb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	addl $4, indexb2
	popl %ecx	
	jmp cont
cif3:
	pushl %ecx	
	movl indexb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	addl $4, indexb2
	popl %ecx	
	jmp cont

cif4:
	pushl %ecx	
	movl indexb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	addl $4, indexb2
	popl %ecx	
	jmp cont
cif5:
	pushl %ecx	
	movl indexb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	addl $4, indexb2
	popl %ecx	
	jmp cont
cif6: 
	pushl %ecx	
	movl indexb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	addl $4, indexb2
	popl %ecx	
	jmp cont
cif7:
	pushl %ecx
	
	movl indexb2, %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx

	addl $4, indexb2

	popl %ecx
	
	jmp cont
cif8:
	pushl %ecx
	
	movl indexb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx

	addl $4, indexb2

	popl %ecx
	
	jmp cont
cif9:
	pushl %ecx
	
	movl indexb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx

	addl $4, indexb2

	popl %ecx
	
	jmp cont
A:
	pushl %ecx
	
	movl indexb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx

	addl $4, indexb2

	popl %ecx
	
	jmp cont
B:
	pushl %ecx
	
	movl indexb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx

	addl $4, indexb2

	popl %ecx
	
	jmp cont
C:
	pushl %ecx
	
	movl indexb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx

	addl $4, indexb2

	popl %ecx
	
	jmp cont
D:
	pushl %ecx
	
	movl indexb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx                           

	addl $4, indexb2

	popl %ecx
	
	jmp cont
E:

	pushl %ecx
	
	movl indexb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $48, (%esi, %ecx,1)
	incl %ecx

	addl $4, indexb2

	popl %ecx
	
	jmp cont
F:
	pushl %ecx
	
	movl indexb2, %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx
	movb $49, (%esi, %ecx,1)
	incl %ecx

	addl $4, indexb2

	popl %ecx
	
	jmp cont
	
conversie:
	xor %al, %al
	xorl %edi, %edi
	movl $operatie, %edi
	movl $0, %ecx
	
startloop:

	movb (%esi, %ecx, 1), %ah
	cmp $0, %ah
	je et_exit
	
	incl %ecx
	movb (%esi, %ecx, 1), %ah
	
	cmp $49, %ah
	je et_operatie
	
	incl %ecx
	movb (%esi, %ecx, 1), %ah
	
	cmp $48, %ah
	je numar
	
	cmp $49, %ah
	je variabila

numar:
	incl %ecx
	movb (%esi, %ecx, 1), %ah
	cmp $49, %ah     
	je minus
	
cont_numar:
	pushl %eax
	
	xorl %eax, %eax
	movl %eax, nr
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $128, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $64, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $32, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $16, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $8, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $4, %edx
	mul %edx
	addl %eax, nr

	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $2, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	mov $1, %edx
	mul %edx
	addl %eax, nr
	
	pushl %ecx
	
	pushl nr
	pushl $formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	popl %ecx
	popl %eax
	
	incl %ecx

	jmp startloop

minus:
	pushl %ecx

	pushl $semn
	pushl $formatPrintfsemn
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	popl %ecx
	
	jmp cont_numar

variabila:

	pushl %eax
	
	xorl %eax, %eax
	movl %eax, nr
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $256, %edx
	mul %edx
	addl %eax, nr

	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $128, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $64, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $32, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $16, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $8, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $4, %edx
	mul %edx
	addl %eax, nr

	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $2, %edx
	mul %edx
	addl %eax, nr
	
	xorl %eax, %eax
	incl %ecx
	movb (%esi, %ecx, 1), %al
	subl $48, %eax
	movl $1, %edx
	mul %edx
	addl %eax, nr
	
	pushl %ecx
	pushl %edi
	
	movl $var2, %edi
	xorl %ecx, %ecx
	movb nr, %al
	movb %al, (%edi, %ecx,1)
	
	pushl $var2
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	popl %edi
	popl %ecx
	popl %eax
	
	incl %ecx

	jmp startloop
		
et_operatie:

	addl $8, %ecx
	movb (%esi, %ecx, 1), %ah
	cmp $49, %ah
	je div
	
	incl %ecx
	movb (%esi, %ecx, 1), %ah
	cmp $49, %ah
	je sub_mul
	
	incl %ecx
	movb (%esi, %ecx, 1), %ah
	cmp $49, %ah
	je add
	
	jmp let 

div:
	pushl %ecx
	
	movl $0, %ecx
	movb $100, (%edi, %ecx,1)
	incl %ecx
	movb $105, (%edi, %ecx,1)
	incl %ecx
	movb $118, (%edi, %ecx,1)
	incl %ecx
	movb $0, (%edi, %ecx, 1)
	incl %ecx
	
	pushl $operatie
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx

	popl %ecx
	
	addl $3, %ecx
	
	jmp startloop
	
sub_mul:
	incl %ecx
	movb (%esi, %ecx,1), %ah
	cmp $49, %ah
	je mul
	
	jmp sub
	
mul:

	pushl %ecx
	
	movl $0, %ecx
	movb $109, (%edi, %ecx,1)
	incl %ecx
	movb $117, (%edi, %ecx,1)
	incl %ecx
	movb $108, (%edi, %ecx,1)
	incl %ecx
	movb $0, (%edi, %ecx, 1)
	incl %ecx
	
	
	pushl $operatie
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	popl %ecx
	
	addl $1, %ecx
	
	jmp startloop
	
sub:
	pushl %ecx
	
	movl $0, %ecx
	movb $115, (%edi, %ecx,1)
	incl %ecx
	movb $117, (%edi, %ecx,1)
	incl %ecx
	movb $98, (%edi, %ecx,1)
	incl %ecx
	movb $0, (%edi, %ecx, 1)
	incl %ecx
	
	pushl $operatie
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	popl %ecx
	
	addl $1, %ecx
	
	jmp startloop
add:
	pushl %ecx
	
	movl $0, %ecx
	movb $97, (%edi, %ecx,1)
	incl %ecx
	movb $100, (%edi, %ecx,1)
	incl %ecx
	movb $100, (%edi, %ecx,1)
	incl %ecx
	movb $0, (%edi, %ecx, 1)
	incl %ecx

	
	pushl $operatie
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	popl %ecx
	
	addl $1, %ecx
	
	jmp startloop	
let:
	pushl %ecx
	
	movl $0, %ecx
	movb $108, (%edi, %ecx,1)
	incl %ecx
	movb $101, (%edi, %ecx,1)
	incl %ecx
	movb $116, (%edi, %ecx,1)
	incl %ecx
	movb $0, (%edi, %ecx, 1)
	incl %ecx
	
	pushl $operatie
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	popl %ecx
	
	addl $1, %ecx
	
	jmp startloop	

et_exit:
	pushl $printat
	call printf
	popl %ebx

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80	

