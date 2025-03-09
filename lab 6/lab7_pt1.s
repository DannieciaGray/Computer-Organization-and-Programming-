    .data
    types_of_apples: .string "Types of apples:\n"
    apple1: .string " Gala\n"
    apple2: .string " Fuji\n"
    apple3: .string " Honeycrisp\n"

    .text
    .globl _start

_start:
    la a0, types_of_apples  # Load address of the string
    li a7, 4  # Syscall for printing strings
    ecall

    la a0, apple1
    li a7, 4
    ecall

    la a0, apple2
    li a7, 4
    ecall

    la a0, apple3
    li a7, 4
    ecall

    # Ensure proper program exit
    li a7, 10  # Syscall for exit
    ecall
