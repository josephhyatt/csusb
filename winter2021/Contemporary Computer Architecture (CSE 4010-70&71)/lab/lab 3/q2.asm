.text
.globl main

varz: .word 0

main:
    li $s0, 15 # A
    li $s1, 10 # B
    li $s2, 6  # C
    li $s7, 0  # Z
    li $t0, 1  # temp for true

    slt $t1, $s1, $s0
    beq $t1, $t0, ELSEIF
    slt $t1, $s2, 5
    beq $t1, $t0, ELSEIF
    li $s7, 1 # Z = 1
ELSEIF:
    slt $t1, $s1, $s0
    beq $t1, $zero, ELSE
    add $t2, $s2, $t0 # C + 1
    bne $t2, 7, ELSE
    li $s7, 2 # Z = 2
ELSE:
    li $s7, 3 # Z = 3

    addi $t4, $zero, 1
    bne $s7, $t4, CASE2COND
    j CASE1
CASE2COND: addi $t4, $zero, 2
    bne $s7, $t4, CASED
    j CASE2

CASE1:    li $s7, -1 # Z = -1
    j CASEEXIT
CASE2:    li $s7, -2 # Z = -2
    j CASEEXIT
CASED:    li $s7, 0  # Z = 0
CASEEXIT:
    sw $s7, varz
    jr $ra