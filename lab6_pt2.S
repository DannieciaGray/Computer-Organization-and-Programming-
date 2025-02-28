# This code performs a subtract operation 

.text
    # Initialize register
    mv s0, x0


    # Load values into registers
    la x7, int1
    lw x5, 0(x7)   # Load int1 into x5
    la x7, int2
    lw x6, 0(x7)   # Load int2 into x6

    sub x7, x5, x6  # Sub int1 and int2, store in x7

    # Store result into memory
    la x8, diff
    sw x7, 0(x8)

    # Print "Sub result: "
    li a0, 4
    la a1, str2
    ecall

    # Print the subtraction result
    li a0, 1
    mv a1, x7
    ecall

    # Print newline 
    li a0, 11
    li a1, 10
    ecall

# Data section, initialized variables 
.data
str2: .string "Sub result: " #String to use 
int1: .word 12
int2: .word 5
int3: .word 1000
diff:  .word 0

