.data
even: .asciiz     "Even"
odd:    .asciiz     "Odd "
.text 

.globl main

main:
 addi $a1,$zero,10
 jal isodd
move $s1,$v1
beq $s1,0,printodd
    li      $v0,1
    move    $a0,$a1
    syscall
     li      $v0,4
     la      $a0,even
     syscall


 li $v0,10 
 syscall


iseven:
      li $s0,2
      div $a1,$s0
      mfhi $v1
      bne $v1,0,isodd
      jr $ra
isodd:
      addi $sp,$sp,-4
      sw $ra,0($sp)
      jal iseven
      xor $v1,$v1,1
      lw $ra,0($sp)
      addi $sp,$sp,4
      jr $ra
printodd:
    li      $v0,1
    move    $a0,$a1
    syscall
    li      $v0,4
    la      $a0,odd
    syscall
end:
li $v0,10

syscall
