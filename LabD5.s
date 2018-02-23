.globl         Fraction 
.globl         getNumerator 
.globl         getDenominator 
.globl         setNumerator 
.globl         setDenominator
.globl         adding 
.globl         multiply 
.globl         subtract
.globl         divide
#---------------------------------------------      
.data
#---------------------------------------------    
         .text         
Fraction:                  
#---------------------------------------------         
         add      $t0, $0, $a0      	# t0 = numerator 
         add      $t1, $0, $a1      	# t1 = denominator 
         		            	# store the attributes somewhere in memory 
         				# and return a reference to where they are 

	 addi    $v0,    $0,    9	# calling 9 to v0, asking to allocate some space
         addi    $a0,    $0,    8    	# asking to allocate 8 byte of space for heap
         syscall   

	 sw	$t0,    0($v0)    	# saving t0 in the first 4 byte 
         sw     $t1,	4($v0)	 	# then save t1 in the last 4 byte 

					# the whole procuder above is just like making a constructor for java, see labD no 1 for better understanding 
         jr         $ra  

getNumerator:          
#---------------------------------------------         
	 lw	$v0, 0($a0)	# now loading based on reference but only the first 4 byte 
	 jr         $ra  
getDenominator:      
#---------------------------------------------         
	 lw	$v0, 4($a0)	# now loading based on reference but only the last 4 byte 
	 jr         $ra 
setNumerator:          
#---------------------------------------------         
	 add      $v0, $0, $a0		# the object where it wants to be stored
	 add      $t0, $0, $a1		# the new numerator 
	 
	 sw	$t0,    0($v0)		# store in the first 4 byte, means numerator
         syscall  
	 jr         $ra  
setDenominator:          
#---------------------------------------------         
	 add      $v0, $0, $a0		# the object where it wants to be stored
	 add      $t0, $0, $a1		# the new numerator 
	 
	 sw	$t0,    4($v0)		# store in the first 4 byte, means numerator
         syscall  
	 jr         $ra  




adding:    
#---------------------------------------------         
	 sw	$ra, 0($sp)
	 addi	$sp, $sp, -4    

	 add      $t0, $0, $a0      	# t0 = object 0 
         add      $t1, $0, $a1 		# t1 = object 1

	 add      $a0, $0, $t0  
	 jal	getNumerator  
	 add      $t9, $0, $v0		# numerator object 0
	 add      $a0, $0, $t0  
	 jal	getDenominator  
	 add      $t8, $0, $v0		# denominator object 0  

	 add      $a0, $0, $t1  
	 jal	getNumerator  
	 add      $t7, $0, $v0		# numerator object 1
	 add      $a0, $0, $t1  
	 jal	getDenominator  
	 add      $t6, $0, $v0		# denominator object 1 

					# now t0 and t1 free to be used
	 mult	$t9, $t6
	 mflo	$t5

	 mult 	$t8, $t7
	 mflo	$t4
	
	 add	$t0, $t5, $t4		# numerator
	 
	 mult	$t8, $t6
	 mflo	$t1			# denominator
	 
	 add      $a0, $0, $t0      	 
         add      $a1, $0, $t1   
	 jal	Fraction

         addi	$sp, $sp, 4
	 lw	$ra, 0($sp)
	 jr      $ra 

multiply:
#---------------------------------------------
	 sw	$ra, 0($sp)
	 addi	$sp, $sp, -4    

	 add      $t0, $0, $a0      	# t0 = object 0 
         add      $t1, $0, $a1 		# t1 = object 1

	 add      $a0, $0, $t0  
	 jal	getNumerator  
	 add      $t9, $0, $v0		# numerator object 0
	 add      $a0, $0, $t0  
	 jal	getDenominator  
	 add      $t8, $0, $v0		# denominator object 0  

	 add      $a0, $0, $t1  
	 jal	getNumerator  
	 add      $t7, $0, $v0		# numerator object 1
	 add      $a0, $0, $t1  
	 jal	getDenominator  
	 add      $t6, $0, $v0		# denominator object 1 

					# now t0 and t1 free to be used
	 mult	$t9, $t7
	 mflo	$t0

	 mult	$t8, $t6
	 mflo	$t1
	
	 add      $a0, $0, $t0      	 
         add      $a1, $0, $t1   
	 jal	Fraction

         addi	$sp, $sp, 4
	 lw	$ra, 0($sp)
	 jr      $ra 

subtract:
#---------------------------------------------
	 sw	$ra, 0($sp)
	 addi	$sp, $sp, -4    

	 add      $t0, $0, $a0      	# t0 = object 0 
         add      $t1, $0, $a1 		# t1 = object 1 

	 add      $a0, $0, $t1  
	 jal	getNumerator  
	 add      $t9, $0, $v0		# numerator object 1 / other
	 add      $a0, $0, $t1  
	 jal	getDenominator  
	 add      $t8, $0, $v0		# denominator object 1 / other

					
	 addi     $t7, $0, -1
	 mult	$t9, $t7
	 mflo	$t9
		
	 add      $a0, $0, $t9      	 
         add      $a1, $0, $t8   
	 jal	Fraction
	 add      $s3, $0, $v0 	 

	 add      $a0, $0, $s0     	 
         add      $a1, $0, $s3   
	 jal	adding

         addi	$sp, $sp, 4
	 lw	$ra, 0($sp)
	 jr      $ra 

divide:
#---------------------------------------------
	 sw	$ra, 0($sp)
	 addi	$sp, $sp, -4    

	 add      $t0, $0, $a0      	# t0 = object 0 
         add      $t1, $0, $a1 		# t1 = object 1 

	 add      $a0, $0, $t1  
	 jal	getNumerator  
	 add      $t9, $0, $v0		# numerator object 1 / other
	 add      $a0, $0, $t1  
	 jal	getDenominator  
	 add      $t8, $0, $v0		# denominator object 1 / other

		
	 add      $a0, $0, $t8     	 
         add      $a1, $0, $t9   
	 jal	Fraction
	 add      $s3, $0, $v0 	 

	 add      $a0, $0, $s0     	 
         add      $a1, $0, $s3   
	 jal	multiply

         addi	$sp, $sp, 4
	 lw	$ra, 0($sp)
	 jr      $ra 




