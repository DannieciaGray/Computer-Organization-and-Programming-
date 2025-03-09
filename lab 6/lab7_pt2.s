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
