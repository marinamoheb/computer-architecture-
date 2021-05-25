.data
 
.text 

.globl main

main: 
     # $s0 = g, $s1 = h
      addi $s0,$s0,7
      addi $s1,$s1,3
loop: 
      ble $s0,$s1 ,loop2# if g<=h
      addi $s1,$s0,0 #   h=g
       j done # jump past else block
loop2:
      bgt $s0,0, else # if g>0 do else
else:   
  addi $s0, $s1,0 # g =  h
done:
    # exit program
    li      $v0,10
    syscall