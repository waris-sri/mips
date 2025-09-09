# Title: Lab Exercise 2, Question 1
# Author: Waris Sripatoomrak 6788112
# Date: 9/9/2025
# Description: Asks the user to enter two integers a and b and then display the result of computing the expression: a + 2b - 5.
# Input: Integer, a and b
# Output: Returns a + (b + b) - 5

.data
ask_a: .asciiz "a = "
ask_b: .asciiz "b = "

.globl main

.text
main:
    li $v0, 4
    la $a0, ask_a
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, ask_b
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    addu $s0, $t1, $t1
    addu $s0, $s0, $t0
    subiu $s0, $s0, 5

    li $v0, 1
    move $a0, $s0
    syscall
