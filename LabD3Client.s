.text
main: 
#--------------------------------------------- 
	sw	$ra, 0($sp)
	addi	$sp, $sp, -4
	
	addi	$a0, $0, 3
	addi	$a1, $0, 8 
	jal	Fraction
	add	$s0, $0, $v0	 # s0 holds the address of v0 

	addi	$a0, $0, 1
	addi	$a1, $0, 2 
	jal	Fraction
	add	$s1, $0, $v0
#--------------------------------------------- 
	add	$a0, $0, $s0
	add	$a1, $0, $s1
	jal	adding
	add	$s2, $0, $v0

	add	$a0, $0, $s2	# passing address s2 to a0
	jal	getNumerator
	add	$t0, $0, $v0

	add	$a0, $0, $s2
	jal	getDenominator
	add	$t1, $0, $v0
		
	
	add	$a0, $0, $t0
	add	$a1, $0, $t1
	jal	printFraction
	jal	println

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr      $ra     
