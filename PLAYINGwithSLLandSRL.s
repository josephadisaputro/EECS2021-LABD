	.text
main:

	addi	$t0, $0, 279	#even number, this time i use 4 as example
	addi	$t1, $0, 3	#odd number, this time i use 3 as example

	sll	$t9, $t0, 27
	add	$a0, $0, $t9
	addi	$v0, $0, 1
	syscall

	add	$a0, $0, ' '
	addi	$v0, $0, 11
	syscall

	srl	$a0, $t9, 31
	addi	$v0, $0, 1
	syscall

	jr	$ra


