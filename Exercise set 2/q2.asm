.data
	A: .word 1,2,3,4,5
    B: .word 1,1,1,1,1
.text
	.globl main
main:
	la a0, A # load address of first array
    la a1, B # load address of second array
    addi t0, zero, 0 # i = 0
    addi t1, zero 0 # vectA[i] = vectA[i] + vectB[i]
    addi a2, zero, 5 # N = len(A)
loop:
	lw t2, 0(a0) # load word A[i]
    lw t3, 0(a1) # load word B[i]
    add t1, t2, t3 # t1 has vectA[i] + vectB[i]
    sw t1, 0(a0) # vectA[i] = vectA[i] + vectB[i]
    addi a0, a0, 4 # A[i++]
    addi t0, t0, 1 # i++
    blt t0, a2, loop # if i<N, then loop