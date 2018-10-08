.data
    year: .word 2004
    success: .word 1
    failure: .word 0
.text
    .globl main
main:
    la t0, year # save year to t0
    addi t1, x0, 4 # save 4 to t1
    rem t2, t0, t1 # save the remainder of year%4 to t2
    addi t3, x0, 100 # save 100 to t3
    addi t4, x0, 400 # save 400 to t4
    rem t3, t0, t3 # save the remainder year%100 to t3
    rem t4, t0, t4 # save the remainder year%400 to t4
first:
    bne t2, x0, nope # if year%4==0, next comparison
second:
    bne t3, x0, yes # if year%100==0, next comparison
third:
    bne t4, x0, nope # if year%400!=0, failure
yes:
    la t0, success # set t0 to 1 to show success
    j exit # exit
nope:
    la t0, failure # set t0 to 0 to show failure
exit:
