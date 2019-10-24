# Jadon Fowler
# 10/22/19
# Program 2
# Find the min and max numbers in an array

    .data

Nums:
    .word 5
    .word 7
    .word 12
    .word 3
    .word 4
    .word 9
    .word 6
    .word 11
    .word 2
    .word 10
Size: .word 10
MinText: .asciiz "The minimum number was: "
MaxText: .asciiz "\nThe maximum number was: "

    .text
    .globl main

main:
    la $s0, Nums
    la $s1, Size
    lw $t3, 0($s1)

    # $s3 = Size - 1
    li $t0, 1
    sub $s3, $t3, $t0

    # int min = array[0];
    lw $t0, 0($s0)
    # int max = array[0];
    lw $t1, 0($s0)
    # int i = 0
    li $s2, 1

    loop: #while(i < Size)

    # add i * 4 to the address of Nums and load the word into $t5
    move $t5, $s2
    li $t6, 4
    mult $t5, $t6
    mflo $t5
    add $t4, $s0, $t5
    lw $t5, 0($t4)

    bge $t5, $t0, after_min # skip the next line if the number is not the min
    move $t0, $t5 # set the min to $t5
    after_min:

    ble $t5, $t1, after_max # skip the next line if the number is not the max
    move $t1, $t5 # set the max to $t5
    after_max:

    # while loop condition
    add $s2, $s2, 1
    ble $s2, $s3, loop

    la $a0, MinText
    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    la $a0, MaxText
    li $v0, 4
    syscall

    move $a0, $t1
    li $v0, 1
    syscall

    # Exit the program
    li $v0, 10
    syscall
