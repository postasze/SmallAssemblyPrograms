	.data
stest:	.asciiz "abcABC$123,.\"  xyzXYZ_!09"

	.text
main:	li	$t1, 0
main_loop:
	la 	$a0, stest
	add	$a0, $a0, $t1
	lb	$t0, ($a0)
	beqz 	$t0, main_exit
	jal	strlen
	move	$a0, $v0
	li	$v0, 1
	syscall
	add	$t1, $t1, 1
	b	main_loop
main_exit:
	li	$v0, 10
	syscall
strlen:
	li	$v0, 0
strlen_check:
	lb	$t0, ($a0)
	add	$a0, $a0, 1
	beqz 	$t0, strlen_exit
	blt	$t0, 'A', strlen_check
	bgt	$t0, 'Z', strlen_check
	add	$v0, $v0, 1
	b	strlen_check
strlen_exit:		
	jr	$ra
	