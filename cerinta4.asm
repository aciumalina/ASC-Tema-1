


.data
	
	formatPrintf: .asciz "%d "
	delim: .asciz " "
	scanLinie: .asciz "%300[^\n]"
	add: .asciz "add"
	sub: .asciz "sub"
	mul: .asciz "mul"
	div: .asciz "div"
	endl: .asciz "\n"
	let: .asciz "let"
	linii: .space 4
	coloane: .space 4
	matrix: .space 1600
	var: .space 4
	op: .space 4
	str: .space 300
	
.text


.global main


main:
	movl $matrix, %edi
	
	pushl $str
	pushl $scanLinie
	call scanf
	popl %ebx
	popl %ebx

	pushl $delim
	pushl $str
	call strtok
	popl %ebx
	popl %ebx
	
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax, op
	
	pushl op
	call atoi
	popl %ebx
	
	movl %eax, linii
	
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax, op
	
	pushl op
	call atoi
	popl %ebx
	
	movl %eax, coloane
	
	xorl %ecx, %ecx

et_for:
	pushl %ecx
	
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx

	movl %eax, op
	
	pushl op
	pushl $let
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je let_op
	
	pushl op
	call atoi
	popl %ebx
	
	popl %ecx
	
	movl $matrix, %edi
	movl %eax, (%edi, %ecx, 4)
	incl %ecx
	
	jmp et_for
	
let_op:
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	pushl %eax
	call atoi
	popl %ebx
	
	movl %eax, var
	
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax, op
	
	pushl op
	pushl $mul
	call strcmp
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je mul_op
	
	pushl op
	pushl $add
	call strcmp
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je add_op

	pushl op
	pushl $sub
	call strcmp
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je sub_op

	pushl op
	pushl $div
	call strcmp
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je div_op
	
	
	
mul_op:
	xorl %ecx, %ecx
	pushl %ecx
	
	pushl linii
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl coloane
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
inmultire:
	movl linii, %eax
	imull coloane
	movl %eax, %edx
	
	xorl %eax, %eax
	cmp %edx, %ecx
	je et_exit
	movl (%edi, %ecx,4), %eax
	cdq
	imull var
	
	pushl %ecx
	
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	movl %eax, (%edi, %ecx,4)
	incl %ecx
	jmp inmultire
		
add_op:
	xorl %ecx, %ecx
	pushl %ecx
	
	pushl linii
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl coloane
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
adunare:
	movl linii, %eax
	imull coloane
	movl %eax, %edx
	
	xorl %eax, %eax
	cmp %edx, %ecx
	je et_exit
	movl (%edi, %ecx,4), %eax
	cdq
	addl var, %eax
	
	pushl %ecx
	
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	movl %eax, (%edi, %ecx, 4)
	incl %ecx
	jmp adunare
	
	
sub_op:
	xorl %ecx, %ecx
	
	pushl %ecx
	
	pushl linii
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl coloane
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
scadere:
	movl linii, %eax
	imull coloane
	movl %eax, %edx
	
	xorl %eax, %eax
	cmp %edx, %ecx
	je et_exit
	movl (%edi, %ecx,4), %eax
	cdq
	subl var, %eax
	
	pushl %ecx
	
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	movl %eax, (%edi, %ecx,4)
	incl %ecx
	jmp scadere
	
	
div_op:
	xorl %ecx, %ecx
	pushl %ecx
	
	pushl linii
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl coloane
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
impartire:
	movl linii, %eax
	imull coloane
	movl %eax, %edx
	
	xorl %eax, %eax
	cmp %edx, %ecx
	je et_exit
	movl (%edi, %ecx,4), %eax
	cdq
	idivl var
	
	pushl %ecx
	
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	#movl %eax, (%edi, %ecx,4)
	incl %ecx
	jmp impartire
	

et_exit:
	pushl $endl
	call printf
	popl %ebx
	

	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
	

	
	
