.globl	printFraction
.globl	println
.data
newline:	.asciiz "\n"

.text

printFraction:
#--------------------------------------------- 
	add      $t0, $0, $a0      	# t0 = numerator 
        add      $t1, $0, $a1		# t1 = denominator
	
	
	add	$a0, $0, $t0
	addi	$v0, $0, 1
	syscall
	
	add	$a0, $0, '/'		# print the "/"
	addi	$v0, $0, 11
	syscall

	add	$a0, $0, $t1
	addi	$v0, $0, 1
	syscall

	jr	$ra

println:
#--------------------------------------------- 

	la	$a0, newline
	addi	$v0, $0, 4
	syscall
	jr	$ra
