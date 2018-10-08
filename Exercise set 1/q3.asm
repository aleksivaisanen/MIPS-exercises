.data
 list1: .word 3, 1, 4, 1, 5, 9, 0
 list2: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
	.globl main

main:
 la t3, list1 
 la t4, list2
 add t0, x0, x0
 addi t1, x0, 24

loop:
 add t4, zero, t3
 addi t0, t0,  4
 bne t0, t1, loop

exit:
 ecall