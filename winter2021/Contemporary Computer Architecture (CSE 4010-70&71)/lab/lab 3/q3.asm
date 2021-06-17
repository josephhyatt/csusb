.text
.globl main

main:

li $s0, 0 # s0 stores the sum and then sets it to 0
li $t0, 0 # i is in t0 and then sets it to 10

FOR:
    bge $t0, 10, FOREND # i < 10
    move $t1, $t0 # j = i
    mul $t2, $t0, 2 # 2 * i

WHILE:
    bge $t1,$t2, WHILEEND # j < 2 * i
    add $s0, $s0, $t1 # sum = sum + j
    add $t1, $t1, 1 # j++
      j WHILE
WHILEEND:

    add $t0, $t0, 1 # i++
    j FOR
FOREND: # we are done.
    jr $ra