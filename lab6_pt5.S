# PART 5
.text
    # Load values into registers
    la    x7, int1
    lw    s0, 0(x7)   # Load int1 into s0
    la    x7, int2
    lw    s1, 0(x7)   # Load int2 into s1

    neg   s2, s0      # Negate int1's value
    add   s2, s2, s1  # Add negated int1 to int2

    # Print the result
    li a0, 4
    la a1, str4       # Load address of string
    ecall

    li a0, 1
    mv a1, s2         # Move result to a1 for printing
    ecall

    li a0, 11
    li a1, 10         # Print newline
    ecall

# Data section, initialized variables 
.data
str4: .string "Neg int1 + int2 result: "  # String to use
int1: .word 12
int2: .word 5


