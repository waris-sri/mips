# Title: Lab Exercise 2, Question 6
# Author: Waris Sripatoomrak 6788112
# Date: 10/9/2025
# Description: Asks the user to enter a signed number then display the content of multiplying this number by 24.5
# Input: Signed Integer, x
# Output: x * 24.5 (24.5 = 49/2)

.data
ask_x: .asciiz "Enter a signed integer: "

.globl main

.text
main:
	li $v0, 4
	la $a0, ask_x
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $t0, 49
	mult $s0, $t0
	mflo $t1 # in 64-bit value, get the lower 32-bit value
	
	div $t1, $t1, 2
	mflo $s0
	
	li $v0, 1
    move $a0, $s0
    syscall