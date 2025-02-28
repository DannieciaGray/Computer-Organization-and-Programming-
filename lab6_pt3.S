# This code performs a NOT operation 
.text
    # Load values into registers
    la x7, int1
    lw x5, 0(x7)   # Load int1 into x5
    la x7, int2
    lw x6, 0(x7)   # Load int2 into x6

    sub x7, x6, x5  # Perform int2 - int1 (Reversed Subtraction)

    # Store result in memory
    la x8, diff
    sw x7, 0(x8)

    # Print first operand (int2)
    li a0, 1
    mv a1, x6
    ecall

    # Print "-" character (ASCII 45)
    li a0, 11
    li a1, 45
    ecall

    # Print second operand (int1)
    li a0, 1
    mv a1, x5
    ecall

    # Print "=" character (ASCII 61)
    li a0, 11
    li a1, 61
    ecall

    # Print the result of the subtraction
    li a0, 1
    mv a1, x7
    ecall

    # Print newline (ASCII 10)
    li a0, 11
    li a1, 10
    ecall

# Data section, initialized variables 
.data
int1: .word 12
int2: .word 5
diff: .word 0  # Stores result of int2 - int1
