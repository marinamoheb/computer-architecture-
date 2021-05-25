.data
c: .word 3, 0, 1, 2, 6, -2, 4, 7, 3, 7 
a: .word 5 
i: .word 0
.text
main:
 la $t0,c
 lw $t1,a
 lw $t2,i
  
OuterLoop: 
         bgt $t2, $t1, Exit # i>aExit the loop
         addi $t3, $zero, 0 # Intialize loop index j to 0
InnerLoop: 
    bgt $t3, $t2, ExitInnerLoop # j>iExit the loop
    sll $t4, $t2,4 # calculate offset of a[i]
    addu $t4,$t4,$t0
    lw $t6,0($t4) 
    add $s0,$s0,$t6
    add $s0,$s0,$t3
    addi $t3, $t3, 1 # Increment j by 1
    j InnerLoop
    nop
ExitInnerLoop:
    addi $t2, $t2, 1 # Increment i by 1
    j OuterLoop
    nop

Exit:
# li $v0,10 
 syscall
    li $v0, 10
    syscall