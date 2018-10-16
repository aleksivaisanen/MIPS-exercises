.data
    str: .asciiz "innostunutsonni"

.text
	.globl main
strlen:
    # ------------
    # arguments:
    # a0 = string
    # ------------

    li      a2, 0  # set return value to 0
strlen_loop:
	lb      t0,0(a0)  # load byte from beginning of the string
    beq     t0,zero,strlen_exit # when character value is 0 we have reached the end of the string
    addi    a0,a0,1 # shift pointer to string one space right
    addi    a2,a2,1 # increment return value by one
    j       strlen_loop

strlen_exit:
    # ------------
    # returns:
    # INTEGER (string length)
    # ------------
    jr ra  #return

palindrom:
    # ------------
    # arguments:
    # a0 = string
    # ------------
	addi a7, zero, 8
    
    sub sp, sp, a7  # allocate memory on stack
    sw ra, 0(sp)  # save return address
    sw a0, 4(sp)  # save argument value

    jal strlen  # call strlen
    addi t0, a2, 0   # save result

    lw a0, 4(sp) #load argument
    addi t1, a0, 0  # save its value to t1

    li t2, 1 # set counter to 1
    li a2, 1  # prepare return value
    addi a7, zero, 2
    div t3, t0, a7  # calculate string length / 2
    addi t3, t3, 1  # add one more in case of even number
palindrom_loop:
    bge t2, t3, palindrom_exit  # when counter reaches half of the string length - exit
    lb t4, 0(a0) # get character from beginning
    sub t5, t0, t2 # subtract counter from the string length
    add t6, t5, t1 # add index from the end of the string to start address
    lb a1, 0(t6) # get corresponding character from the end of the string

    beq t4, a1, palindrom_continue  # check to determine are the characters exact match
    li a2, 0  # if not return 0, immediately
    j palindrom_exit

palindrom_continue:
    addi a0, a0, 1 # shift pointer to string one space right
    addi t2, t2, 1 # increment counter by one
    j palindrom_loop

palindrom_exit:
    # ------------
    # returns:
    # TRUE (1) or FALSE (0)
    # ------------
    lw ra, 0(sp) # load return address
    addi sp, sp, 8  # free stack
    jr ra # return

main:
    # entry point
    la a0, str # load string
    jal palindrom  # call palindrom (jal = jump and save return address, jump and link)
    addi a0, a2, 0 # set a0 to palindrom return value