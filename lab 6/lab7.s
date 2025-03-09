# Lab 7 - Macros and Subroutines
# Part 1: Using Macros

    .data
    helloworld: .string "Hello, World!\n"
    types_of_apples: .string "Types of apples:\n"
    apple1: .string " Gala\n"
    apple2: .string " Fuji\n"
    apple3: .string " Honeycrisp\n"

    .macro print_string(%x)
        li a7, 4
        la a0, %x
        ecall
    .end_macro

    .text
    .globl _start

_start:
    print_string(types_of_apples)
    print_string(apple1)
    print_string(apple2)
    print_string(apple3)

    # Exit program
    li a0, 10
    ecall

# Part 2: Using Constants

    .data
    str1: .string "Hello from Part 2!\n"
    str2: .string "Using macros and constants\n"

    .equ PRINT_STR, 4
    .equ PRINT_INT, 1
    .equ PRINT_CHAR, 11
    .equ NEWLINE, 10
    .equ SPACE, 32

    .text

part2:
    li a0, PRINT_STR
    la a1, str1
    ecall
    
    li a0, PRINT_STR
    la a1, str2
    ecall
    
    # Exit program with return code (last two digits of student ID)
    li a0, 17
    li a1, 57  # Student ID last two digits
    ecall

# Part 3: Using Subroutines

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
