# Title: Lab Exercise 1, Question 5
# Author: Waris Sripatoomrak 6788112
# Date: 2/9/2025
# Description: Compares 2 integers and output "equal" if the 2 integers are equal, else "not equal".
# Input: Integer, x and y
# Output: Returns (x == y) ? "equal" : "not equal"

.data
################### Data segment #####################
ask_x: .asciiz "x = "
ask_y: .asciiz "y = "
isequal: .asciiz "equal"
notequal: .asciiz "not equal"

################### Code segment #####################
.globl main

.text
main:                   # main function entry
# READ AND STORE X
    li $v0, 4           # will print string
    la $a0, ask_x       # load address of string
    syscall             # do print string
    li $v0, 5           # will read integer
    syscall             # do read integer
    move $s0, $v0       # move integer to $s0

# READ AND STORE Y
    li $v0, 4           # will print string
    la $a0, ask_y       # load address of string
    syscall             # do print string
    li $v0, 5           # will read integer
    syscall             # do read integer
    move $s1, $v0       # move integer to $s1

# COMPARE X AND Y
# using beq then bne makes the beq branching fall onto bne, so use 1 branch instead
	bne  $s0, $s1, case_not_equal

# equal case
	li   $v0, 4
	la   $a0, isequal
	syscall
	j    finish

case_not_equal:
	li   $v0, 4
	la   $a0, notequal
	syscall

finish:
	li   $v0, 10
	syscall