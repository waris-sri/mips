# MIPS ASM Implementation of arithmetic.c

#include <stdio.h>
# int main() {
# 	int num1 = 5;
# 	int num2 = 3;
# 	int result;
# 	result = num1 + num2;
# 	printf("%d", result);
# 	return 0;
# }

.data # Section for data definitions
num1: .word 5 # Declare a word (4 bytes) named num1, and initialize it with 5
num2: .word 3 # Declare num2 and initialize with 3
result: .word 0 # Declare result and initialize with 0

.text # Section for instructions
.globl main # Declare the main label as global

main:

# Load data from memory into registers
lw $t0, num1 # Load the value of num1 into register $t0
lw $t1, num2 # Load the value of num2 into register $t1

# Perform the addition
add $t2, $t0, $t1 # Add the values in $t0 and $t1, store in $t2

# Store the result back to memory
sw $t2, result # Store the value of $t2 into the memory location 'result'

# Print the result
li $v0, 1
lw $a0, result
syscall

# Exit the program
li $v0, 10 # Load the system call code for 'exit' into $v0
syscall # Execute the system call