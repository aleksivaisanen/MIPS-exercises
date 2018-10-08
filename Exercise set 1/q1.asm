.text # identifies the code part
    add x0, zero, zero  # saves zero + zero to register address x0, aka does nothing because zero is alias for x 0 and will always 0
    add t0, a0, zero   # adds value from zero to value from a0 and saves result to t0
    addi t1, zero, 8 # adds 8 to zero and saves the result to t1
loop: # label for code block
    lw t2, 0(t0)  # copies word (32-bits) at source location (t0 + 0) to destination register (t2), "0" gives offset from address in register
    sub x0, x0, t2 #  substracts value of t2 from value of x0 and saves the result to x0, but since x0 is read only nothing happens
    addi t0, t0, 4 # adds 4 to t0 value
    addi t1, t1, -1 # adds -1 to t1 value
    bne t1, zero, loop # branches to loop if value of t1 <> value of zero 
exit: # label for exit-part
    addi a0, x0, 10 # adds 10 to value of x0 and saves to a0
    add a1, x0, x0 # adds value of x0 to value of x0 and saves to a1
    ecall # probably calls system for exiting the runtime, no proper docs were found 