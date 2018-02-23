.globl         Fraction 
.globl         getNumerator 
.globl         getDenominator 
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
        
