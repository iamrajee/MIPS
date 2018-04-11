
# @kaushal_kishore
# @rajendra_singh

# problem 2
# Store 4 strings as indicated below. Load the address of each string into registers t0, t1, t2,
# t3 respectively. Run step by step and note how each string is getting stored and explain
# the changes occuring in the data segment:


.data
	str1: .ascii "123456789abcedef"
	str2: .ascii "123456789ABCDEF"
	str3: .asciiz "123456789abcedef"
	str4: .asciiz "123456789ABCDEF"

.text

.globl main

main: 
	# loading the address of each string 
	la $t0 , str1
	la $t1 , str2
	la $t2 , str3
	la $t3 , str4
	
	# exit instruction
	li $v0 , 10
	syscall
