    .data
    sum: .word 42  # Example integer to print

    .text

part3:
    la t1, sum
    lw a0, 0(t1)
    call print_int
    
    # Exit program
    li a0, 17
    li a1, 0
    ecall

print_int:
    mv a1, a0  # Move value to print
    li a0, 1   # Print integer syscall
    ecall
    ret
