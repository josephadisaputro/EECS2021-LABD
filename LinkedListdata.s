.globl	linkedlist
.globl	linkedlist2
.text

linkedlist:
	add	$t0, $0, $a0
	addi	$v0, $0, 9
	addi	$a0, $0, 8
	syscall
	add	$s0, $0, $v0
	sw	$0, 0($s0)
	sw	$t0, 4($s0)
	
	add	$v0, $0, $s0

	jr	$ra	

linkedlist2:
	add	$t0, $0, $a0
	add	$t1, $0, $a1	#address from prev
	
	addi	$v0, $0, 9
	addi	$a0, $0, 8
	syscall
	add	$s0, $0, $v0
	sw	$t1, 0($s0)
	sw	$t0, 4($s0)
	
	add	$v0, $0, $s0

	jr	$ra





