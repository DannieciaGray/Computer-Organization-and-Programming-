# lab9_pt2.s

.data
str5: .string "\nString read is !"
str6: .string "\n!\nInt value read is !"
str7: .string "!\nChar value read is !"
str8: .string "!\n"

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
    li a7, READ
    li a0, STDIN
    la a1, mybuffer
    li a2, BUFFER_SIZE
    ecall

    mv s0, a0
    beq a0, x0, eof_reached

    la t1, temp
    sw a0, 0(t1)

    # Print string
    li a7, SIMPLE_WRITE
    la a0, str5
    ecall

    li a7, WRITE
    li a0, STDOUT
    la a1, mybuffer
    lw a2, 0(t1)
    ecall

    li a7, SIMPLE_WRITE
    la a0, str8
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
