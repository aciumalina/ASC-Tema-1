.data
	op: .space 10
	str: .space 300
	formatPrintf: .asciz "%d\n"
	delim: .asciz " "
	scanLinie: .asciz "%300[^\n]"
	add: .asciz "add"
	sub: .asciz "sub"
	mul: .asciz "mul"
	div: .asciz "div"
	let: .asciz "let"
	vec: .space 26
	
	
.text
	
.global main

main:
	movl $vec, %edi

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
	
	movl %eax, op
	
	pushl op
	call atoi
	popl %ebx
	
	cmp $0, %eax
	je var
	
	pushl %eax
	jmp et_for
	
et_for:
	pushl $delim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je et_exit
	
	movl %eax, op
	
	pushl op
	call atoi    
	popl %ebx
	
	cmp $0, %eax
	je oper_var
	
	pushl %eax
	
	jmp et_for
	
oper_var:
	pushl op
	call strlen
	popl %ebx
	
	cmp $1, %eax
	je var
	
	pushl op
	pushl $let
	call strcmp
	popl %ebx
	popl %ebx
	cmp $0, %eax
	je let_op

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

let_op:
	popl %eax
	popl %ecx
	
	movl %eax, (%edi, %ecx, 4)
	
	jmp et_for	
var:
	movl op, %esi
	xorl %ecx, %ecx
	xorl %eax, %eax
	movb (%esi, %ecx,1), %al
	movl %eax, %ecx
	subl $97, %ecx
	movl (%edi, %ecx, 4), %ebx
	cmp $0, %ebx
	je fara_val
	
	pushl %ebx
	
	jmp et_for
	
fara_val:

	pushl %ecx
	
	jmp et_for
	
	
add_op:                                            	
	popl %edx
	popl %ecx
	addl %edx, %ecx                          
	pushl %ecx 
	jmp et_for         
	
sub_op:
	popl %edx	
	popl %ecx
	subl %edx, %ecx
	pushl %ecx
	jmp et_for
	
mul_op:
	popl %eax
	popl %ecx
	mull %ecx
	pushl %eax
	jmp et_for

div_op:
	popl %esi
	popl %eax
	xorl %edx, %edx
	divl %esi
	pushl %eax
	jmp et_for	
		
et_exit:
	popl %eax
	
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
	
	
	
	
	
