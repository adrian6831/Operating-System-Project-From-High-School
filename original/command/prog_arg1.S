	.file	"prog_arg.c"
	.section	.rodata
.LC0:
	.string	"argv[%d] is %s\n"
	.align 4
.LC1:
	.string	"\n      I`m father prog, my pid:%d, I will show process list\n"
	.align 4
.LC2:
	.string	"\n      I`m child prog, my pid:%d, I will exec %s right now\n"
.LC3:
	.string	"/"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%edi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	subl	$556, %esp
	movl	%ecx, %ebx
	movl	4(%ebx), %eax
	movl	%eax, -556(%ebp)
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	movl	$0, -552(%ebp)
	jmp	.L2
.L3:
	movl	-552(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-556(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	-552(%ebp)
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	addl	$1, -552(%ebp)
.L2:
	movl	-552(%ebp), %eax
	cmpl	(%ebx), %eax
	jl	.L3
	call	fork
	cwtl
	movl	%eax, -544(%ebp)
	cmpl	$0, -544(%ebp)
	je	.L4
	movl	$900000, -548(%ebp)
	nop
.L5:
	movl	-548(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, -548(%ebp)
	testl	%eax, %eax
	jne	.L5
	call	getpid
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	call	ps
	jmp	.L6
.L4:
	leal	-540(%ebp), %edx
	movl	$0, %eax
	movl	$128, %ecx
	movl	%edx, %edi
	rep stosl
	movl	-556(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %ebx
	call	getpid
	subl	$4, %esp
	pushl	%ebx
	pushl	%eax
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	movl	-556(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	je	.L7
	subl	$8, %esp
	pushl	$512
	leal	-540(%ebp), %eax
	pushl	%eax
	call	getcwd
	addl	$16, %esp
	subl	$8, %esp
	pushl	$.LC3
	leal	-540(%ebp), %eax
	pushl	%eax
	call	strcat
	addl	$16, %esp
	movl	-556(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	leal	-540(%ebp), %eax
	pushl	%eax
	call	strcat
	addl	$16, %esp
	subl	$8, %esp
	pushl	-556(%ebp)
	leal	-540(%ebp), %eax
	pushl	%eax
	call	execv
	addl	$16, %esp
	jmp	.L8
.L7:
	movl	-556(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	-556(%ebp)
	pushl	%eax
	call	execv
	addl	$16, %esp
.L8:
.L6:
	jmp	.L6
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
