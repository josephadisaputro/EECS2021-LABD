         .globl         SB         
         .globl         append         
         .globl         setCharAt                           
         .text         
SB:      #-------------------- # a0 = maximum size 
         addi     $v0, $0, 9 
         syscall                
         sb       $0, 0($v0)    # null terminator  
         jr       $ra            
append:  #---------------------a0=reference,  a1=char    
         lb         $t0,         0($a0)      
loop:	 beq	$t0, $0, appending
	 
	 add	$a0, $a0, 1  
	 lb         $t0,         0($a0)  
	 j loop
appending:	 
	 sb	$t0, 0($a0)
	 sb	$0, 1($a0)
         jr         $ra      
setCharAt:  
         #------------------a0=string, a1=position, a2=char 
	 add	$a0, $a0, $a1
         lb         $a2,         0($a0)    
	 
         jr         $ra         

   
