# Title: Lab Exercise 1, Question 3
# Author: Waris Sripatoomrak 6788112
# Date: 1/9/2025
# Description: Asks the user to input a name and then prints "Hello " by the name entered by the user
# Input: A string, name
# Output: "Hello <name>"

.data
################### Data segment #####################
str1: .asciiz "Hello "
memstr: .space 32       # 256 bits including \0

################### Code segment #####################
.globl main

.text
main:                   # main function entry
    # READING STRING: $v0 = 8, la $a0 <addr_label>, li $a1 <bytes_imm>
    li $v0, 8           # will read string
    la $a0, memstr      # prepare memory for string
    li $a1, 32          # specify size
    syscall             # do read string (now stored in $a0)
     
    li $v0, 4           # will print string
    la $a0, str1        # load address of string
    syscall             # do print string
    
    li $v0, 4           # will print string
    la $a0, memstr      # load address of string
    syscall             # do print string
                            
    li $v0, 10          # will exit program
    syscall             # do exit program