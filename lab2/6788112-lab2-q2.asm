# Title: Lab Exercise 2, Question 2
# Author: Waris Sripatoomrak 6788112
# Date: 9/9/2025
# Description: Assume that $s1 = 0x12345678 and $s2 = 0xffff9a00. Determine the content of registers $s3 to $s6 after executing the instructions.
# Input: Hexadecimal, $s1 = 0x12345678 and $s2 = 0xffff9a00
# Output: Returns and/or/xor/nor of $s1, $s2

.globl main

.text
main:
	ori $s1, $s1, 0x12345678
	ori $s2, $s2, 0xffff9a00
	
	and $s3, $s1, $s2 # $s3 = 305402368 = 0x12341200
	or $s4, $s1, $s2 # $s4 = -8584 = 0xffffde78
	xor $s5, $s1, $s2 # $s5 = -305410952 = 0xedcbcc78
	nor $s6, $s1, $s2 # $s6 = 8583 = 0x00002187
	
	li $v0, 1
	move $a0, $s6
	syscall
