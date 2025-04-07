# Final Version - CSC3210 LAB 10
# Purpose: Print values in an array, compute and display sum, min, max, and average

.data
    myarr:      .word 10, 20, 30, 40, 50, 60
    myarr_end:
    sum:        .word 0
    min:        .word 0
    max:        .word 0
    avg:        .word 0

    msg_array:  .asciiz "The array has the following values: "
    msg_min:    .asciiz "\nThe minimum is: "
    msg_max:    .asciiz "\nThe maximum is: "
    msg_avg:    .asciiz "\nThe average is: "

.text
.globl main
main:
    # Print message
    la a0, msg_array
    li a7, 4
    ecall

    # Initialize pointers
    la s0, myarr            # s0 -> current element
    la s1, myarr_end        # s1 = end address
    la t0, sum
    sw zero, 0(t0)          # sum = 0

    lw t1, 0(s0)            # Load first value
    la t2, min
    la t3, max
    sw t1, 0(t2)            # min = first value
    sw t1, 0(t3)            # max = first value

    li t6, 0                # element count = 0

loop:
    lw t4, 0(s0)            # t4 = current value

    # Print value
    mv a1, t4
    li a0, 1
    li a7, 1
    ecall

    # Print space
    li a0, 32
    li a7, 11
    ecall

    # Update sum
    lw t5, 0(t0)            # t5 = current sum
    add t5, t5, t4
    sw t5, 0(t0)            # sum += current value

    # Update min
    lw t7, 0(t2)
    blt t4, t7, update_min
    j skip_min
update_min:
    sw t4, 0(t2)
skip_min:

    # Update max
    lw t7, 0(t3)
    bgt t4, t7, update_max
    j skip_max
update_max:
    sw t4, 0(t3)
skip_max:

    # Increment count
    addi t6, t6, 1

    # Move to next element
    addi s0, s0, 4
    blt s0, s1, loop

    # Compute average
    lw t5, 0(t0)            # t5 = sum
    div t5, t5, t6          # average = sum / count
    la t7, avg
    sw t5, 0(t7)

    # Newline
    li a0, 10
    li a7, 11
    ecall

    # Print min
    la a0, msg_min
    li a7, 4
    ecall
    lw a1, 0(t2)
    li a0, 1
    li a7, 1
    ecall

    # Print max
    la a0, msg_max
    li a7, 4
    ecall
    lw a1, 0(t3)
    li a0, 1
    li a7, 1
    ecall

    # Print avg
    la a0, msg_avg
    li a7, 4
    ecall
    lw a1, 0(t7)
    li a0, 1
    li a7, 1
    ecall

    # Exit
    li a0, 10
    li a7, 93
    ecall
