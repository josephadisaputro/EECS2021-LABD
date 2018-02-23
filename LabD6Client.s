         .text         
main:    sw       $ra,    0($sp)    
         addi     $sp, $sp, -4 
         addi     $a0, $0, 16        
         jal      SB                # call the constructor 
         add      $s0, $0, $v0 
         add      $a0, $0, $s0       
         addi     $a1, $0, 'A'       
         jal      append            # append 'A' 
         add      $a0, $0, $s0 
         addi     $a1, $0, 'B' 
         jal      append            # append 'B' 
         add      $a0, $0, $s0 
         addi     $v0, $0, 4         
         syscall                    # print the string at a0 
         addi     $sp, $sp, 4 
         lw         $ra,         0($sp)         
         jr         $ra         
