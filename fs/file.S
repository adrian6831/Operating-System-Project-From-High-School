	.file	"file.c"
	.comm	file_table,384,32
	.section	.rodata
.LC0:
	.string	"exceed max open files\n"
	.text
	.globl	get_free_slot_in_global
	.type	get_free_slot_in_global, @function
get_free_slot_in_global:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$3, -12(%ebp)
	jmp	.L2
.L5:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$file_table+8, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L8
	addl	$1, -12(%ebp)
.L2:
	cmpl	$31, -12(%ebp)
	jbe	.L5
	jmp	.L4
.L8:
	nop
.L4:
	cmpl	$32, -12(%ebp)
	jne	.L6
	subl	$12, %esp
	pushl	$.LC0
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L7
.L6:
	movl	-12(%ebp), %eax
.L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	get_free_slot_in_global, .-get_free_slot_in_global
	.section	.rodata
	.align 4
.LC1:
	.string	"exceed max open files_per_proc\n"
	.text
	.globl	pcb_fd_install
	.type	pcb_fd_install, @function
pcb_fd_install:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	running_thread
	movl	%eax, -16(%ebp)
	movb	$3, -9(%ebp)
	jmp	.L10
.L13:
	movzbl	-9(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	$56, %edx
	movl	12(%eax,%edx,4), %eax
	cmpl	$-1, %eax
	jne	.L11
	movzbl	-9(%ebp), %edx
	movl	-16(%ebp), %eax
	leal	56(%edx), %ecx
	movl	8(%ebp), %edx
	movl	%edx, 12(%eax,%ecx,4)
	jmp	.L12
.L11:
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
.L10:
	cmpb	$7, -9(%ebp)
	jbe	.L13
.L12:
	cmpb	$8, -9(%ebp)
	jne	.L14
	subl	$12, %esp
	pushl	$.LC1
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L15
.L14:
	movzbl	-9(%ebp), %eax
.L15:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	pcb_fd_install, .-pcb_fd_install
	.globl	inode_bitmap_alloc
	.type	inode_bitmap_alloc, @function
inode_bitmap_alloc:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	addl	$40, %eax
	subl	$8, %esp
	pushl	$1
	pushl	%eax
	call	bitmap_scan
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	cmpl	$-1, -12(%ebp)
	jne	.L17
	movl	$-1, %eax
	jmp	.L18
.L17:
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$40, %edx
	subl	$4, %esp
	pushl	$1
	pushl	%eax
	pushl	%edx
	call	bitmap_set
	addl	$16, %esp
	movl	-12(%ebp), %eax
.L18:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	inode_bitmap_alloc, .-inode_bitmap_alloc
	.globl	block_bitmap_alloc
	.type	block_bitmap_alloc, @function
block_bitmap_alloc:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	addl	$32, %eax
	subl	$8, %esp
	pushl	$1
	pushl	%eax
	call	bitmap_scan
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	cmpl	$-1, -12(%ebp)
	jne	.L20
	movl	$-1, %eax
	jmp	.L21
.L20:
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$32, %edx
	subl	$4, %esp
	pushl	$1
	pushl	%eax
	pushl	%edx
	call	bitmap_set
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	40(%eax), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
.L21:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	block_bitmap_alloc, .-block_bitmap_alloc
	.globl	bitmap_sync
	.type	bitmap_sync, @function
bitmap_sync:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	16(%ebp), %eax
	movb	%al, -28(%ebp)
	movl	12(%ebp), %eax
	shrl	$12, %eax
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	sall	$9, %eax
	movl	%eax, -24(%ebp)
	movzbl	-28(%ebp), %eax
	testl	%eax, %eax
	je	.L24
	cmpl	$1, %eax
	je	.L25
	jmp	.L23
.L24:
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	24(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	44(%eax), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -16(%ebp)
	jmp	.L23
.L25:
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	16(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	36(%eax), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -16(%ebp)
	nop
.L23:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	-16(%ebp)
	pushl	-12(%ebp)
	pushl	%eax
	call	ide_write
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	bitmap_sync, .-bitmap_sync
	.section	.rodata
	.align 4
.LC2:
	.string	"in file_creat: sys_malloc for io_buf failed\n"
	.align 4
.LC3:
	.string	"in file_creat: allocate inode failed\n"
	.align 4
.LC4:
	.string	"file_create: sys_malloc for inode failded\n"
	.align 4
.LC5:
	.string	"sync dir_entry to disk failed\n"
	.text
	.globl	file_create
	.type	file_create, @function
file_create:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	16(%ebp), %eax
	movb	%al, -60(%ebp)
	subl	$12, %esp
	pushl	$1024
	call	sys_malloc
	addl	$16, %esp
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jne	.L27
	subl	$12, %esp
	pushl	$.LC2
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L38
.L27:
	movb	$0, -9(%ebp)
	movl	cur_part, %eax
	subl	$12, %esp
	pushl	%eax
	call	inode_bitmap_alloc
	addl	$16, %esp
	movl	%eax, -24(%ebp)
	cmpl	$-1, -24(%ebp)
	jne	.L29
	subl	$12, %esp
	pushl	$.LC3
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L38
.L29:
	subl	$12, %esp
	pushl	$76
	call	sys_malloc
	addl	$16, %esp
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	jne	.L30
	subl	$12, %esp
	pushl	$.LC4
	call	printk
	addl	$16, %esp
	movb	$1, -9(%ebp)
	jmp	.L31
.L30:
	movl	-24(%ebp), %eax
	subl	$8, %esp
	pushl	-28(%ebp)
	pushl	%eax
	call	inode_init
	addl	$16, %esp
	call	get_free_slot_in_global
	movl	%eax, -16(%ebp)
	cmpl	$-1, -16(%ebp)
	jne	.L32
	subl	$12, %esp
	pushl	$.LC0
	call	printk
	addl	$16, %esp
	movb	$2, -9(%ebp)
	jmp	.L31
.L32:
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	leal	file_table+8(%eax), %edx
	movl	-28(%ebp), %eax
	movl	%eax, (%edx)
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$file_table, %eax
	movl	$0, (%eax)
	movzbl	-60(%ebp), %ecx
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$file_table+4, %eax
	movl	%ecx, (%eax)
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$file_table+8, %eax
	movl	(%eax), %eax
	movl	$0, 12(%eax)
	subl	$4, %esp
	pushl	$24
	pushl	$0
	leal	-52(%ebp), %eax
	pushl	%eax
	call	memset
	addl	$16, %esp
	movl	-24(%ebp), %eax
	leal	-52(%ebp), %edx
	pushl	%edx
	pushl	$1
	pushl	%eax
	pushl	12(%ebp)
	call	create_dir_entry
	addl	$16, %esp
	subl	$4, %esp
	pushl	-20(%ebp)
	leal	-52(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	sync_dir_entry
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L33
	subl	$12, %esp
	pushl	$.LC5
	call	printk
	addl	$16, %esp
	movb	$3, -9(%ebp)
	jmp	.L31
.L33:
	subl	$4, %esp
	pushl	$1024
	pushl	$0
	pushl	-20(%ebp)
	call	memset
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	cur_part, %eax
	subl	$4, %esp
	pushl	-20(%ebp)
	pushl	%edx
	pushl	%eax
	call	inode_sync
	addl	$16, %esp
	subl	$4, %esp
	pushl	$1024
	pushl	$0
	pushl	-20(%ebp)
	call	memset
	addl	$16, %esp
	movl	cur_part, %eax
	subl	$4, %esp
	pushl	-20(%ebp)
	pushl	-28(%ebp)
	pushl	%eax
	call	inode_sync
	addl	$16, %esp
	movl	-24(%ebp), %edx
	movl	cur_part, %eax
	subl	$4, %esp
	pushl	$0
	pushl	%edx
	pushl	%eax
	call	bitmap_sync
	addl	$16, %esp
	movl	-28(%ebp), %eax
	leal	68(%eax), %edx
	movl	cur_part, %eax
	addl	$48, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	list_push
	addl	$16, %esp
	movl	-28(%ebp), %eax
	movl	$1, 8(%eax)
	subl	$12, %esp
	pushl	-20(%ebp)
	call	sys_free
	addl	$16, %esp
	subl	$12, %esp
	pushl	-16(%ebp)
	call	pcb_fd_install
	addl	$16, %esp
	jmp	.L38
.L31:
	movzbl	-9(%ebp), %eax
	cmpl	$2, %eax
	je	.L35
	cmpl	$3, %eax
	je	.L36
	cmpl	$1, %eax
	je	.L37
	jmp	.L34
.L36:
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$file_table, %eax
	subl	$4, %esp
	pushl	$12
	pushl	$0
	pushl	%eax
	call	memset
	addl	$16, %esp
.L35:
	subl	$12, %esp
	pushl	-28(%ebp)
	call	sys_free
	addl	$16, %esp
.L37:
	movl	-24(%ebp), %eax
	movl	cur_part, %edx
	addl	$40, %edx
	subl	$4, %esp
	pushl	$0
	pushl	%eax
	pushl	%edx
	call	bitmap_set
	addl	$16, %esp
	nop
.L34:
	subl	$12, %esp
	pushl	-20(%ebp)
	call	sys_free
	addl	$16, %esp
	movl	$-1, %eax
.L38:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	file_create, .-file_create
	.section	.rodata
	.align 4
.LC6:
	.string	"file can`t be write now, try again later\n"
	.text
	.globl	file_open
	.type	file_open, @function
file_open:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movb	%al, -28(%ebp)
	call	get_free_slot_in_global
	movl	%eax, -12(%ebp)
	cmpl	$-1, -12(%ebp)
	jne	.L40
	subl	$12, %esp
	pushl	$.LC0
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L41
.L40:
	movl	cur_part, %eax
	subl	$8, %esp
	pushl	8(%ebp)
	pushl	%eax
	call	inode_open
	addl	$16, %esp
	movl	%eax, %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$file_table+8, %eax
	movl	%ecx, (%eax)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$file_table, %eax
	movl	$0, (%eax)
	movzbl	-28(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$file_table+4, %eax
	movl	%ecx, (%eax)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$file_table+8, %eax
	movl	(%eax), %eax
	addl	$12, %eax
	movl	%eax, -16(%ebp)
	cmpb	$1, -28(%ebp)
	je	.L42
	cmpb	$2, -28(%ebp)
	jne	.L43
.L42:
	call	intr_disable
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L44
	movl	-16(%ebp), %eax
	movl	$1, (%eax)
	subl	$12, %esp
	pushl	-20(%ebp)
	call	intr_set_status
	addl	$16, %esp
	jmp	.L43
.L44:
	subl	$12, %esp
	pushl	-20(%ebp)
	call	intr_set_status
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC6
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L41
.L43:
	subl	$12, %esp
	pushl	-12(%ebp)
	call	pcb_fd_install
	addl	$16, %esp
.L41:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	file_open, .-file_open
	.globl	file_close
	.type	file_close, @function
file_close:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	cmpl	$0, 8(%ebp)
	jne	.L46
	movl	$-1, %eax
	jmp	.L47
.L46:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	$0, 12(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	inode_close
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	$0, 8(%eax)
	movl	$0, %eax
.L47:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	file_close, .-file_close
	.section	.rodata
	.align 4
.LC7:
	.string	"exceed max file_size 71680 bytes, write file failed\n"
	.align 4
.LC8:
	.string	"file_write: sys_malloc for io_buf failed\n"
	.align 4
.LC9:
	.string	"file_write: sys_malloc for all_blocks failed\n"
	.align 4
.LC10:
	.string	"file_write: block_bitmap_alloc failed\n"
.LC11:
	.string	"block_bitmap_idx != 0"
.LC12:
	.string	"fs/file.c"
.LC13:
	.string	"file_will_use_blocks <= 140"
	.align 4
.LC14:
	.string	"file->fd_inode->i_sectors[12] != 0"
	.align 4
.LC15:
	.string	"file->fd_inode->i_sectors[block_idx] != 0"
	.align 4
.LC16:
	.string	"file_write: block_bitmap_alloc for situation 1 failed\n"
	.align 4
.LC17:
	.string	"file->fd_inode->i_sectors[block_idx] == 0"
	.align 4
.LC18:
	.string	"file_write: block_bitmap_alloc for situation 2 failed\n"
	.align 4
.LC19:
	.string	"file->fd_inode->i_sectors[12] == 0"
	.align 4
.LC20:
	.string	"file_write: block_bitmap_alloc for situation 3 failed\n"
	.text
	.globl	file_write
	.type	file_write, @function
file_write:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	4(%eax), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	cmpl	$71680, %eax
	jbe	.L49
	subl	$12, %esp
	pushl	$.LC7
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L50
.L49:
	subl	$12, %esp
	pushl	$512
	call	sys_malloc
	addl	$16, %esp
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	jne	.L51
	subl	$12, %esp
	pushl	$.LC8
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L50
.L51:
	subl	$12, %esp
	pushl	$560
	call	sys_malloc
	addl	$16, %esp
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	jne	.L52
	subl	$12, %esp
	pushl	$.LC9
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L50
.L52:
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	$-1, -40(%ebp)
	movl	$0, -44(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	jne	.L53
	movl	cur_part, %eax
	subl	$12, %esp
	pushl	%eax
	call	block_bitmap_alloc
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	cmpl	$-1, -40(%ebp)
	jne	.L54
	subl	$12, %esp
	pushl	$.LC10
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L50
.L54:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-40(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-40(%ebp), %edx
	movl	cur_part, %eax
	movl	28(%eax), %eax
	movl	40(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -44(%ebp)
	cmpl	$0, -44(%ebp)
	jne	.L55
	pushl	$.LC11
	pushl	$__func__.1609
	pushl	$265
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L55:
	movl	cur_part, %eax
	subl	$4, %esp
	pushl	$1
	pushl	-44(%ebp)
	pushl	%eax
	call	bitmap_sync
	addl	$16, %esp
.L53:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	4(%eax), %eax
	shrl	$9, %eax
	addl	$1, %eax
	movl	%eax, -48(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	4(%eax), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	shrl	$9, %eax
	addl	$1, %eax
	movl	%eax, -52(%ebp)
	cmpl	$140, -52(%ebp)
	jbe	.L56
	pushl	$.LC13
	pushl	$__func__.1609
	pushl	$274
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L56:
	movl	-52(%ebp), %eax
	subl	-48(%ebp), %eax
	movl	%eax, -56(%ebp)
	cmpl	$0, -56(%ebp)
	jne	.L57
	cmpl	$12, -48(%ebp)
	ja	.L58
	movl	-48(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-24(%ebp), %ecx
	addl	$4, %ecx
	movl	(%eax,%ecx,4), %eax
	movl	%eax, (%edx)
	jmp	.L61
.L58:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	64(%eax), %eax
	testl	%eax, %eax
	jne	.L60
	pushl	$.LC14
	pushl	$__func__.1609
	pushl	$288
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L60:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	64(%eax), %eax
	movl	%eax, -60(%ebp)
	movl	-36(%ebp), %eax
	leal	48(%eax), %ecx
	movl	-60(%ebp), %edx
	movl	cur_part, %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	ide_read
	addl	$16, %esp
	jmp	.L61
.L57:
	cmpl	$12, -52(%ebp)
	ja	.L62
	movl	-48(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-24(%ebp), %edx
	addl	$4, %edx
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	jne	.L63
	pushl	$.LC15
	pushl	$__func__.1609
	pushl	$298
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L63:
	movl	-24(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-24(%ebp), %ecx
	addl	$4, %ecx
	movl	(%eax,%ecx,4), %eax
	movl	%eax, (%edx)
	movl	-48(%ebp), %eax
	movl	%eax, -24(%ebp)
	jmp	.L64
.L67:
	movl	cur_part, %eax
	subl	$12, %esp
	pushl	%eax
	call	block_bitmap_alloc
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	cmpl	$-1, -40(%ebp)
	jne	.L65
	subl	$12, %esp
	pushl	$.LC16
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L50
.L65:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-24(%ebp), %edx
	addl	$4, %edx
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L66
	pushl	$.LC17
	pushl	$__func__.1609
	pushl	$311
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L66:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-24(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	-36(%ebp), %eax
	addl	%ecx, %eax
	movl	-40(%ebp), %ecx
	movl	%ecx, (%eax)
	movl	(%eax), %eax
	movl	-24(%ebp), %ecx
	addl	$4, %ecx
	movl	%eax, (%edx,%ecx,4)
	movl	-40(%ebp), %edx
	movl	cur_part, %eax
	movl	28(%eax), %eax
	movl	40(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -44(%ebp)
	movl	cur_part, %eax
	subl	$4, %esp
	pushl	$1
	pushl	-44(%ebp)
	pushl	%eax
	call	bitmap_sync
	addl	$16, %esp
	addl	$1, -24(%ebp)
.L64:
	movl	-24(%ebp), %eax
	cmpl	-52(%ebp), %eax
	jb	.L67
	jmp	.L61
.L62:
	cmpl	$12, -48(%ebp)
	ja	.L68
	cmpl	$12, -52(%ebp)
	jbe	.L68
	movl	-48(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-24(%ebp), %ecx
	addl	$4, %ecx
	movl	(%eax,%ecx,4), %eax
	movl	%eax, (%edx)
	movl	cur_part, %eax
	subl	$12, %esp
	pushl	%eax
	call	block_bitmap_alloc
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	cmpl	$-1, -40(%ebp)
	jne	.L69
	subl	$12, %esp
	pushl	$.LC18
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L50
.L69:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	64(%eax), %eax
	testl	%eax, %eax
	je	.L70
	pushl	$.LC19
	pushl	$__func__.1609
	pushl	$334
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L70:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-40(%ebp), %edx
	movl	%edx, 64(%eax)
	movl	64(%eax), %eax
	movl	%eax, -60(%ebp)
	movl	-48(%ebp), %eax
	movl	%eax, -24(%ebp)
	jmp	.L71
.L76:
	movl	cur_part, %eax
	subl	$12, %esp
	pushl	%eax
	call	block_bitmap_alloc
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	cmpl	$-1, -40(%ebp)
	jne	.L72
	subl	$12, %esp
	pushl	$.LC18
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L50
.L72:
	cmpl	$11, -24(%ebp)
	ja	.L73
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-24(%ebp), %edx
	addl	$4, %edx
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L74
	pushl	$.LC17
	pushl	$__func__.1609
	pushl	$347
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L74:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-24(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	-36(%ebp), %eax
	addl	%ecx, %eax
	movl	-40(%ebp), %ecx
	movl	%ecx, (%eax)
	movl	(%eax), %eax
	movl	-24(%ebp), %ecx
	addl	$4, %ecx
	movl	%eax, (%edx,%ecx,4)
	jmp	.L75
.L73:
	movl	-24(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	-40(%ebp), %eax
	movl	%eax, (%edx)
.L75:
	movl	-40(%ebp), %edx
	movl	cur_part, %eax
	movl	28(%eax), %eax
	movl	40(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -44(%ebp)
	movl	cur_part, %eax
	subl	$4, %esp
	pushl	$1
	pushl	-44(%ebp)
	pushl	%eax
	call	bitmap_sync
	addl	$16, %esp
	addl	$1, -24(%ebp)
.L71:
	movl	-24(%ebp), %eax
	cmpl	-52(%ebp), %eax
	jb	.L76
	movl	-36(%ebp), %eax
	leal	48(%eax), %ecx
	movl	-60(%ebp), %edx
	movl	cur_part, %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	ide_write
	addl	$16, %esp
	jmp	.L61
.L68:
	cmpl	$12, -48(%ebp)
	jbe	.L61
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	64(%eax), %eax
	testl	%eax, %eax
	jne	.L77
	pushl	$.LC14
	pushl	$__func__.1609
	pushl	$362
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L77:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	64(%eax), %eax
	movl	%eax, -60(%ebp)
	movl	-36(%ebp), %eax
	leal	48(%eax), %ecx
	movl	-60(%ebp), %edx
	movl	cur_part, %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	ide_read
	addl	$16, %esp
	movl	-48(%ebp), %eax
	movl	%eax, -24(%ebp)
	jmp	.L78
.L80:
	movl	cur_part, %eax
	subl	$12, %esp
	pushl	%eax
	call	block_bitmap_alloc
	addl	$16, %esp
	movl	%eax, -40(%ebp)
	cmpl	$-1, -40(%ebp)
	jne	.L79
	subl	$12, %esp
	pushl	$.LC20
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L50
.L79:
	movl	-24(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -24(%ebp)
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	-40(%ebp), %eax
	movl	%eax, (%edx)
	movl	-40(%ebp), %edx
	movl	cur_part, %eax
	movl	28(%eax), %eax
	movl	40(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -44(%ebp)
	movl	cur_part, %eax
	subl	$4, %esp
	pushl	$1
	pushl	-44(%ebp)
	pushl	%eax
	call	bitmap_sync
	addl	$16, %esp
.L78:
	movl	-24(%ebp), %eax
	cmpl	-52(%ebp), %eax
	jb	.L80
	movl	-36(%ebp), %eax
	leal	48(%eax), %ecx
	movl	-60(%ebp), %edx
	movl	cur_part, %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	ide_write
	addl	$16, %esp
.L61:
	movl	$1, -28(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	4(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	jmp	.L81
.L83:
	subl	$4, %esp
	pushl	$512
	pushl	$0
	pushl	-32(%ebp)
	call	memset
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	4(%eax), %eax
	shrl	$9, %eax
	movl	%eax, -64(%ebp)
	movl	-64(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -68(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	4(%eax), %eax
	andl	$511, %eax
	movl	%eax, -72(%ebp)
	movl	$512, %eax
	subl	-72(%ebp), %eax
	movl	%eax, -76(%ebp)
	movl	-20(%ebp), %eax
	cmpl	%eax, -76(%ebp)
	cmovbe	-76(%ebp), %eax
	movl	%eax, -80(%ebp)
	cmpl	$0, -28(%ebp)
	je	.L82
	movl	cur_part, %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	-32(%ebp)
	pushl	-68(%ebp)
	pushl	%eax
	call	ide_read
	addl	$16, %esp
	movl	$0, -28(%ebp)
.L82:
	movl	-32(%ebp), %edx
	movl	-72(%ebp), %eax
	addl	%edx, %eax
	subl	$4, %esp
	pushl	-80(%ebp)
	pushl	-12(%ebp)
	pushl	%eax
	call	memcpy
	addl	$16, %esp
	movl	cur_part, %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	-32(%ebp)
	pushl	-68(%ebp)
	pushl	%eax
	call	ide_write
	addl	$16, %esp
	movl	-80(%ebp), %eax
	addl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	8(%ebp), %edx
	movl	8(%edx), %edx
	movl	4(%edx), %ecx
	movl	-80(%ebp), %edx
	addl	%ecx, %edx
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-80(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	-80(%ebp), %eax
	addl	%eax, -16(%ebp)
	movl	-80(%ebp), %eax
	subl	%eax, -20(%ebp)
.L81:
	movl	-16(%ebp), %eax
	cmpl	16(%ebp), %eax
	jb	.L83
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	cur_part, %eax
	subl	$4, %esp
	pushl	-32(%ebp)
	pushl	%edx
	pushl	%eax
	call	inode_sync
	addl	$16, %esp
	subl	$12, %esp
	pushl	-36(%ebp)
	call	sys_free
	addl	$16, %esp
	subl	$12, %esp
	pushl	-32(%ebp)
	call	sys_free
	addl	$16, %esp
	movl	-16(%ebp), %eax
.L50:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	file_write, .-file_write
	.section	.rodata
	.align 4
.LC21:
	.string	"file_read: sys_malloc for io_buf failed\n"
	.align 4
.LC22:
	.string	"file_read: sys_malloc for all_blocks failed\n"
	.align 4
.LC23:
	.string	"block_read_start_idx < 139 && block_read_end_idx < 139"
	.align 4
.LC24:
	.string	"block_read_end_idx == block_read_start_idx"
	.text
	.globl	file_read
	.type	file_read, @function
file_read:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jbe	.L85
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, -20(%ebp)
	cmpl	$0, -16(%ebp)
	jne	.L85
	movl	$-1, %eax
	jmp	.L86
.L85:
	subl	$12, %esp
	pushl	$512
	call	sys_malloc
	addl	$16, %esp
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	jne	.L87
	subl	$12, %esp
	pushl	$.LC21
	call	printk
	addl	$16, %esp
.L87:
	subl	$12, %esp
	pushl	$560
	call	sys_malloc
	addl	$16, %esp
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	jne	.L88
	subl	$12, %esp
	pushl	$.LC22
	call	printk
	addl	$16, %esp
	movl	$-1, %eax
	jmp	.L86
.L88:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	shrl	$9, %eax
	movl	%eax, -40(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	shrl	$9, %eax
	movl	%eax, -44(%ebp)
	movl	-40(%ebp), %eax
	subl	-44(%ebp), %eax
	movl	%eax, -48(%ebp)
	cmpl	$138, -40(%ebp)
	ja	.L89
	cmpl	$138, -44(%ebp)
	jbe	.L90
.L89:
	pushl	$.LC23
	pushl	$__func__.1639
	pushl	$443
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L90:
	cmpl	$0, -48(%ebp)
	jne	.L91
	movl	-44(%ebp), %eax
	cmpl	-40(%ebp), %eax
	je	.L92
	pushl	$.LC24
	pushl	$__func__.1639
	pushl	$450
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L92:
	cmpl	$11, -44(%ebp)
	ja	.L93
	movl	-44(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-24(%ebp), %ecx
	addl	$4, %ecx
	movl	(%eax,%ecx,4), %eax
	movl	%eax, (%edx)
	jmp	.L95
.L93:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	64(%eax), %eax
	movl	%eax, -52(%ebp)
	movl	-36(%ebp), %eax
	leal	48(%eax), %ecx
	movl	-52(%ebp), %edx
	movl	cur_part, %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	ide_read
	addl	$16, %esp
	jmp	.L95
.L91:
	cmpl	$11, -44(%ebp)
	ja	.L96
	movl	-40(%ebp), %eax
	movl	%eax, -24(%ebp)
	jmp	.L97
.L98:
	movl	-24(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-24(%ebp), %ecx
	addl	$4, %ecx
	movl	(%eax,%ecx,4), %eax
	movl	%eax, (%edx)
	addl	$1, -24(%ebp)
.L97:
	movl	-24(%ebp), %eax
	cmpl	-44(%ebp), %eax
	jbe	.L98
	jmp	.L95
.L96:
	cmpl	$11, -40(%ebp)
	ja	.L99
	cmpl	$11, -44(%ebp)
	jbe	.L99
	movl	-40(%ebp), %eax
	movl	%eax, -24(%ebp)
	jmp	.L100
.L101:
	movl	-24(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-24(%ebp), %ecx
	addl	$4, %ecx
	movl	(%eax,%ecx,4), %eax
	movl	%eax, (%edx)
	addl	$1, -24(%ebp)
.L100:
	cmpl	$11, -24(%ebp)
	jbe	.L101
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	64(%eax), %eax
	testl	%eax, %eax
	jne	.L102
	pushl	$.LC14
	pushl	$__func__.1639
	pushl	$475
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L102:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	64(%eax), %eax
	movl	%eax, -52(%ebp)
	movl	-36(%ebp), %eax
	leal	48(%eax), %ecx
	movl	-52(%ebp), %edx
	movl	cur_part, %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	ide_read
	addl	$16, %esp
	jmp	.L95
.L99:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	64(%eax), %eax
	testl	%eax, %eax
	jne	.L103
	pushl	$.LC14
	pushl	$__func__.1639
	pushl	$482
	pushl	$.LC12
	call	panic_spin
	addl	$16, %esp
.L103:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	64(%eax), %eax
	movl	%eax, -52(%ebp)
	movl	-36(%ebp), %eax
	leal	48(%eax), %ecx
	movl	-52(%ebp), %edx
	movl	cur_part, %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	ide_read
	addl	$16, %esp
.L95:
	movl	$0, -28(%ebp)
	jmp	.L104
.L105:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	shrl	$9, %eax
	movl	%eax, -56(%ebp)
	movl	-56(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -60(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	andl	$511, %eax
	movl	%eax, -64(%ebp)
	movl	$512, %eax
	subl	-64(%ebp), %eax
	movl	%eax, -68(%ebp)
	movl	-20(%ebp), %eax
	cmpl	%eax, -68(%ebp)
	cmovbe	-68(%ebp), %eax
	movl	%eax, -72(%ebp)
	subl	$4, %esp
	pushl	$512
	pushl	$0
	pushl	-32(%ebp)
	call	memset
	addl	$16, %esp
	movl	cur_part, %eax
	movl	8(%eax), %eax
	pushl	$1
	pushl	-32(%ebp)
	pushl	-60(%ebp)
	pushl	%eax
	call	ide_read
	addl	$16, %esp
	movl	-32(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	subl	$4, %esp
	pushl	-72(%ebp)
	pushl	%eax
	pushl	-12(%ebp)
	call	memcpy
	addl	$16, %esp
	movl	-72(%ebp), %eax
	addl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-72(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	-72(%ebp), %eax
	addl	%eax, -28(%ebp)
	movl	-72(%ebp), %eax
	subl	%eax, -20(%ebp)
.L104:
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jb	.L105
	subl	$12, %esp
	pushl	-36(%ebp)
	call	sys_free
	addl	$16, %esp
	subl	$12, %esp
	pushl	-32(%ebp)
	call	sys_free
	addl	$16, %esp
	movl	-28(%ebp), %eax
.L86:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	file_read, .-file_read
	.section	.rodata
	.align 4
	.type	__func__.1609, @object
	.size	__func__.1609, 11
__func__.1609:
	.string	"file_write"
	.align 4
	.type	__func__.1639, @object
	.size	__func__.1639, 10
__func__.1639:
	.string	"file_read"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
