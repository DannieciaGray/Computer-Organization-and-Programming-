# lab9_pt1.s

.data
str1: .string "Enter a char "
str2: .string "Enter an int "
str3: .string "Enter a string "
str4: .string "Number of chars read is "

.align 2
mychar: .byte 0
int1:   .word 0
temp:   .word 0
mybuffer: .space 10

.eqv SIMPLE_READ 8
.eqv SIMPLE_WRITE 4
.eqv READ 63
.eqv WRITE 64
.eqv STDIN 0
.eqv STDOUT 1
.eqv NL 10
.eqv BUFFER_SIZE 10

.text
main:
    # Prompt and read char
    li a7, SIMPLE_WRITE
    la a0, str1
    ecall

    li a7, 12
    ecall
    la t0, mychar
    sb a0, 0(t0)

    # Prompt and read int
    li a7, SIMPLE_WRITE
    la a0, str2
    ecall

    li a7, 5
    ecall
    la t0, int1
    sw a0, 0(t0)

read_again:
    # Prompt and read string
    li a7, SIMPLE_WRITE
    la a0, str3
    ecall

    li a7, READ
    li a0, STDIN
    la a1, mybuffer
    li a2, BUFFER_SIZE
    ecall

    mv s0, a0
    beq a0, x0, eof_reached

    la t1, temp
    sw a0, 0(t1)

    # Print number of chars read
    li a7, SIMPLE_WRITE
    la a0, str4
    ecall

    li a7, 1
    mv a0, s0
    ecall

    # New line
    li a7, 11
    li a0, NL
    ecall

    j read_again

eof_reached:
    li a7, 10
    ecall