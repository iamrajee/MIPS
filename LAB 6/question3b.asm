

# @kaushal_kishore
# @rajendra_singh

# problem 3b
# (a) Load the first 3 bytes of str1 into t0, t1, t2 and store last 3 bytes of str2 into t3, t4,t5.
# (b) Load the first 2 half words of str2 into t6, t7 and store the last halfword of str1 into t8.
# (c) Load the last word of str2 into t9 and store the last word of str1 in s1 register.

.data
	str1: .ascii "123456789abcedef"
	str2: .ascii "123456789ABCDEF"

.text

.globl main

main: 
	# loading the address of each string 
	la $s0 , str1
	la $s1 , str2
	
	lb $t0 , 0($s0)
	lb $t1 , 1($s0)
	lb $t2 , 2($s0)
	
	sb $t3 , 12($s1)
	sb $t4 , 13($s1)
	sb $t5 , 14($s1)
	
	lhu $t6 , 0($s1)
	lhu $t7 , 2($s1)
	
	lhu $t8 , 14($s0)
	
	lw $t9 , 12($s1)
	lw $s1 , 12($s0)
	
	
	
	# exit instruction
	li $v0 , 10
	syscall
