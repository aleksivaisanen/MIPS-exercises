main: 
    addi sp, sp, -4
    sw ra, 0(sp)

    addi a0, zero, 5
    jal fibo

    add a0, zero, t2
    li t2 1

    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra

fibo: 
    addi sp, sp, -12
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw ra, 8(sp)


    slti t0, a0, 2
    beq t0, zero, ELSE

    addi t2, zero, 1
    j EXIT

    ELSE: 
        addi s0, a0, 0
        addi a0, a0, -1
        jal fibo

        addi s1, t2, 0
        addi a0, s0, -2
        jal fibo

        add t2, s1, t2

    EXIT: 
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw ra, 8(sp)
    addi sp, sp, 12

    jr ra 