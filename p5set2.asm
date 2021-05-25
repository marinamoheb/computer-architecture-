.data
 
.text 

.globl main

main:
       li $t1 ,0xc0200000 
       li $t2 ,0xe0200000
       li $t3 ,0x007fffff
       and  $s1, $t1, $t3
       and  $s2, $t2, $t3
       li $t3 , 0x00800000
       or  $s1, $t1, $t3
       or  $s2, $t2, $t3
       

 #sign
       li $t3 ,0x80000000

       and  $s3, $t1, $t3
       and  $s4, $t2, $t3
       and  $s0, $s4, $s3
#exponent
       li $t3 ,0x7f800000
       and  $s5, $t1, $t3
       and  $s6, $t2, $t3
       srl  $s5, $t1, 23
       srl  $s6, $t2, 23
       li $t3,127

       sub $s5, $s5, $t3
       sub  $s6, $s6, $t3
      li $t3,127
     add $t5,$t5,$t3  
     sll $t5, $t5, 23
 #mmm
     
     beq $s5,$s4,next
     sub $s7,$s5,$s6 #compare
     bgt $s1,$s2,mant2
     srl $s1,$s1,$s7  
     j next

mant2:
       srl $s2,$s2,$s7
       j next 
next:
     add $t7,$s1,$s2 # mantasaa
     add $t5,$s5,$s6
      j norm
norm:
     
      li $t3,0x01000000
      and $t0, $t7, $t3
      beq $t0, $0, done
      srl $t7, $t7,  1
      addi $s7, $s7, 1
      j done
done:

     li $t3 ,00000000011111111111111111111111  
     and $t7,$t7,$t3
     li $t3,127
     add $t5,$t5,$t3  
     sll $t5, $t5, 23
        or $t8,$s0,$t5
      or $t8,$t8,$t7

    li      $v0,1
    move    $a0,$t8
    syscall

end:
li $v0,10

syscall
