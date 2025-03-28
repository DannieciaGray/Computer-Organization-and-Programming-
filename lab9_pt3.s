# lab9_pt3.s

.data
str6: .string "\n!\nInt value read is !"
str7: .string "!\nChar value read is !"
str8: .string "!\n"

.align 2
mychar: .byte 0
int1:   .word 0
mybuffer: .space 10

.eqv SIMPLE_READ 8
.eqv SIMPLE_WRITE 4
.eqv STDIN 0
.eqv STDOUT 1
.eqv NL 10
.eqv BUFFER_SIZE 10

.text
main:
    # Read char
    li a7, 12
    ecall
    la t0, mychar
    sb a0, 0(t0)

    # Read int
    li a7, 5
    ecall
    la t0, int1
    sw a0, 0(t0)

read_again:
    li a7, SIMPLE_READ
    la a0, mybuffer
    li a1, BUFFER_SIZE
    ecall

    la t0, mybuffer
    lb a0, 0(t0)
    li a1, NL
    beq a0, a1, eof_reached

    # Print string
    li a7, SIMPLE_WRITE
    la a0, mybuffer
    ecall

    j read_again

eof_reached:
    # Print int
    li a7, SIMPLE_WRITE
    la a0, str6
    ecall

    la t0, int1
    lw a0, 0(t0)
    li a7, 1
    ecall

    li a7, SIMPLE_WRITE
    la a0, str8
    ecall

    # Print char
    li a7, SIMPLE_WRITE
    la a0, str7
    ecall

    la t0, mychar
    lbu a0, 0(t0)
    li a7, 1
    ecall

    li a7, SIMPLE_WRITE
    la a0, str8
    ecall

    li a7, 10
    ecall
