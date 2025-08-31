# Title: Lab Exercise 1, Question 2
# Author: Waris Sripatoomrak 6788112
# Date: 28/8/2025
# Description: Receive an integer and double it, with an option whether to repeat the calculation.
# Input: Any integer as n
# Output: 2n, i.e., n + n

.data
################### Data segment #####################
# `str1` and `str2` are called "labels"
str1: .asciiz "\nEnter an integer value: "
str2: .asciiz "The doubled value is: "
str3: .asciiz "\nRepeat [y/n]? "

################### Code segment #####################
.globl main

.text
main:				# main function entry
    li $v0, 4			# Load Immediate value #4 (means "print string") into register $v0
    la $a0, str1		# Load Address of `str1` into register $a0 (will print str1)
    syscall			# to interact with something, i.e., print something on the screen or get input from keyboard
				# this time, the syscall is for printing the string (as specified by the `li $v0, 4` line)

    li $v0, 5			# will read integer
    syscall			# do read that integer

    move $s0, $v0		# save input value to register $s0
    
    move $a1, $v0		# copy the integer into address $a1
    add $a2, $a1, $a1		# add integers from addresses $a1 and $a1, keep in $a2

    li $v0, 4			# will print string (str2)
    la $a0, str2		# load str2's address into register $a0
    syscall			# do print str2

    li $v0, 1			# will print modified integer
    move $a0, $a2		# copy the input value for printing to address $a0
    syscall			# do print modified integer

################### QUESTION 2 #####################
    li $v0, 4		        # will print string (str3)
    la $a0, str3		# load str3's address into register $a0
    syscall			# do print str3
    li $v0, 12          	# will read char
    syscall             	# do read char
    li $t0, 'y'			# prepare comparison point
    beq $v0, $t0, main		# use comparison point
    li $t0, 'Y'			# prepare comparison point
    beq $v0, $t0, main		# use comparison point
####################################################

    li $v0, 10			# will exit program
    syscall			# do exit program