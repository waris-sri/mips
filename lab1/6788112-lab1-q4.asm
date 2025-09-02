# Title: Lab Exercise 1, Question 4
# Author: Waris Sripatoomrak 6788112
# Date: 1/9/2025
# Description: Executes the statement s = (a + b) – (c + 101), where a, b, and c are
#              user-provided integer inputs, and s is computed and printed out
# Input: Integer a, b, c
# Output: Integer s

# 1. Suppose the user enters a = 5, b = 10, and c = -30, what is the expected value of s?
# Ans. -56

# 2. Which instruction in your program computed the value of s and which register is used?
# Ans. add, addi, sub / $t0, $t1, $t2

# 3. What is the address of this instruction in memory?
# Ans. add = 0x00400054, addi = 0X00400058, sub = 0x0040005c

# 4. Put a breakpoint at this instruction and write the value of the register used for computing s in decimal and hexadecimal.
# Ans. $t0 = 0x0000000f (15), $t1 = 0x00000047 (71), $t2 = 0xffffffc8 (-56)

.data
################### Data segment #####################
ask_a: .asciiz "a = "
ask_b: .asciiz "b = "
ask_c: .asciiz "c = "

################### Code segment #####################
.globl main

.text
main:                   # main function entry
# READ AND STORE A
    li $v0, 4           # will print string
    la $a0, ask_a       # load address of string
    syscall             # do print string
    li $v0, 5           # will read integer
    syscall             # do read integer
    move $s0, $v0       # move integer to $s0

# READ AND STORE B
    li $v0, 4           # will print string
    la $a0, ask_b       # load address of string
    syscall             # do print string
    li $v0, 5           # will read integer
    syscall             # do read integer
    move $s1, $v0       # move integer to $s1

# READ AND STORE C
    li $v0, 4           # will print string
    la $a0, ask_c       # load address of string
    syscall             # do print string
    li $v0, 5           # will read integer
    syscall             # do read integer
    move $s2, $v0       # move integer to $s2
    
# COMPUTE S
    add $t0, $s0, $s1   # assign a + b to $t0
    addi $t1, $s2, 101  # assign c + 101 (Imm) to $t1
    sub $t2, $t0, $t1   # assign (a + b) – (c + 101) to $t2
    li $v0, 1           # will print integer
    move $a0, $t2       # copy the input value for printing to address $a0
    syscall             # do print integer
                            
    li $v0, 10          # will exit program
    syscall             # do exit program
