# This code performs a NEG operation 
.text
    # Load values into registers
    la x7, int1
    lw x5, 0(x7)   # Load int1 into x5
    la x7, int2
    lw x6, 0(x7)   # Load int2 into x6

    add x7, x5, x6  # Add int1 and int2, store in x7
    neg x7, x7      # Negate the sum (x7 = -x7)

    # Print the result
    li a0, 4
    la a1, str4     # Load address of string
    ecall

    li a0, 1
    mv a1, x7       # Move negated result to a1
    ecall

    li a0, 11
    li a1, 10       # Print newline
    ecall

# Data section, initialized variables 
.data
str4: .string "Neg result: "  # String to use
int1: .word 12
int2: .word 5
