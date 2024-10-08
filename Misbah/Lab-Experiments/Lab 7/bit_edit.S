.section .text
.global _start
_start:
    addi x1, x0, 2
    addi x2, x0, 17
    addi x3, x0, 1
    xori x4, x3, -1
    addi x5, x1, -1
    sll x6, x4, x5
    addi x7, x1, -2
    addi x13, x0, 0

check_cond:
    bge x7, x0, loop_start
    j clear

loop_start:
    addi x8, x0, 1
    addi x9, x7, 0
    bge x9, x0, exp_calc

exp_calc:
    beq x9, x0, zero_exp
    addi x12, x0, 2
    mul x8, x8, x12
    addi x9, x9, -1
    addi x13, x13, 0

zero_exp:
    add x13, x13, x8
    addi x7, x7, -1
    j check_cond

clear:
    or x10, x13, x6
    and x11, x2, x10
    j set

set:
    xori x10, x10, -1
    or x16, x10, x2

end:
    li t0, 1
    la t1, tohost
    sw t0, (t1)

1: j 1b

.section .tohost
.align 2
tohost: .dword 0
fromhost: .dword 0
