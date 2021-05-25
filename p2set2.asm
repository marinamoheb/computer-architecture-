   .data
vowel:      .asciiz     "aeiouAEIOU"
msg_prompt: .asciiz     "Enter string: "
msg_out:    .asciiz     "Number of vowels is: "
msg_nl:     .asciiz     "\n"
str:        .space      20

    .text
    .globl  main
main:
    # print user prompt
    li      $v0,4
    la      $a0,msg_prompt
    syscall

    # get string to scan
    li      $v0,8
    la      $a0,str
    li      $a1,20
    syscall

    li      $s2,0                   # initialize vowel count
    la      $s0,str                 # point to string

# registers:
#   s0 -- pointer to string character
#   s1 -- pointer to vowel character
#   s2 -- count of vowels
#
#   t0 -- current string character
#   t1 -- current vowel character
string_loop:
    lb      $t0,0($s0)              # get string char
    addiu   $s0,$s0,1               # point to next string char
    beqz    $t0,string_done         # at end of string? if yes, fly
 la      $s1,vowel               # point to vowels

vowel_loop:
    lb      $t1,0($s1)              # get the vowel we wish to test for
    beqz    $t1,string_loop         # any more vowels? if not, fly
    addiu   $s1,$s1,1               # point to next vowel
    bne     $t0,$t1,vowel_loop      # is string char a vowel? -- if no, loop
    addi    $s2,$s2,1               # yes, increment vowel count
    j       string_loop             # do next string char

string_done:
    # print count message
    li      $v0,4
    la      $a0,msg_out
    syscall

    # print vowel count
    li      $v0,1
    move    $a0,$s2
    syscall

   

    # exit program
    li      $v0,10
    syscall