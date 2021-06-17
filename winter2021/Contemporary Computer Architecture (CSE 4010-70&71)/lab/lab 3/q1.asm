.data

Z: .word 0
test: .asciiz "Z="

.text
.globl main

main:
   li $t0, 15 # A = 15
   li $t1, 10 # B = 10
   li $t2, 7  # C = 7
   li $t3, 2  # D = 2
   li $t4, 18 # E = 18
   li $t5, -3 # F = -3
   add $t1, $t0, $t1 # $t1 = A + B
   sub $t3, $t2, $t3 # $t3 = C - D
   add $t4, $t4, $t5 # $t4 = E + F
   sub $t0, $t0, $t2 # $t0 = A - C
   add $t1, $t1, $t3 # $t1 = (A+B) + (C-D)
   sub $t4, $t4, $t0 # $t4 = (E+F) - (A-C)
   add $t1, $t1, $t4 # $t1 = (A+B) + (C-D) + (E+F) - (A-C)
   sw $t1, Z

   li $v0, 4
   la $a0, test
   syscall

   li $v0, 1
   addi $a0, $t1, 0
   syscall