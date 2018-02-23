	.text 
main: 
	sw	$ra, 0($sp)
	addi	$sp, $sp, -4


	addi     $v0, $0, 5        	# v0 = readInt # service 5 for read input integer for isprime
        syscall         
        add      $t0, $0, $v0

	add	$a0, $0, $t0	
	jal	linkedlist
	add      $s0, $0, $v0

loop:	addi     $v0, $0, 5        	# v0 = readInt # service 5 for read input integer for isprime
        syscall         
        add      $t1, $0, $v0

	add	$a0, $0, $t1
	add     $a1, $0, $s0	
	jal	linkedlist2
	add     $s0, $0, $v0

	bne	$t1, $0, loop

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra


