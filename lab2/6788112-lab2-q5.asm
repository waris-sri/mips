# Title: Lab Exercise 2, Question 5
# Author: Waris Sripatoomrak 6788112
# Date: 9/9/2025
# Description: Receive an integer (32-bit word by default for MIPS) and print its binary value as a bit at a specified position from 0 to 31.
# Input: Integers, x and b
# Output: The value at bit b

.data
ask_x: .asciiz "Enter an integer: "
below_range_msg: .asciiz "The bit position must not be below 0.\n"
over_range_msg: .asciiz "The bit position must not be over 31.\n"
ask_b: .asciiz "Enter a bit position (0 to 31): "

.globl main

.text
main:
	li $v0, 4
	la $a0, ask_x
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, ask_b
	syscall
	li $v0, 5
	syscall
	move $s1, $v0
	
	blt, $s1, 0, below_range_err
	bgt, $s1, 31, over_range_err
	j done

below_range_err:
	# print msg then reprompt
	li $v0, 4
	la $a0, below_range_msg
	syscall
	j main

over_range_err:
	# print msg then reprompt
	li $v0, 4
	la $a0, over_range_msg
	syscall
	j main

done:
	srlv $t0, $s0, $s1 # shift the interested bit to LSB position
    andi $t0, $t0, 1 # only get LSB
    li $v0, 1
    move $a0, $t0
    syscall