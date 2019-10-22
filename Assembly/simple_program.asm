# Jadon Fowler
# 10/15/19
# Program 1
# result = C + (A - B)

.data
Prompt: .asciiz "Enter a number: "
Output: .asciiz "The answer is: "

  .text
  .globl main

main:
  # Ask the user for input num1
  la $a0, Prompt
  li $v0, 4
  syscall
  # Read input
  li $v0, 5
  syscall
  # Save input
  move $s0, $v0

  # Ask the user for input num2
  li $v0, 4
  syscall
  # Read input
  li $v0, 5
  syscall
  # Save input
  move $s1, $v0

  # Ask the user for input num3
  li $v0, 4
  syscall
  # Read input
  li $v0, 5
  syscall
  # Save input
  move $s2, $v0

  # Do the math: $s4 = $s2 + ($s0 - $s1)
  sub $s3, $s0, $s1
  add $s4, $s2, $s3

  # Print the output text
  la $a0, Output
  li $v0, 4
  syscall

  # Print the result
  move $a0, $s4
  li $v0, 1
  syscall

  # Exit the program
  li $v0, 10
  syscall
