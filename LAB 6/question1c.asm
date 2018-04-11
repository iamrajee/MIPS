
# @kaushal_kishore
# @rajendra_singh

# (c) Load all the temporary registers t0 to t9 with 32-bit hex value 0xFFFFFFFF and
# saved registers s0 to s7 with the 32 bit hex value 0xAAAAAAAA.

.text

.globl main

main: 
	# load immediate instructions
	li $t0 , 0xFFFFFFFF
	li $t1 , 0xFFFFFFFF 
	li $t2 , 0xFFFFFFFF
	li $t3 , 0xFFFFFFFF
	li $t4 , 0xFFFFFFFF
	li $t5 , 0xFFFFFFFF
	li $t6 , 0xFFFFFFFF
	li $t7 , 0xFFFFFFFF
	li $t8 , 0xFFFFFFFF
	li $t9 , 0xFFFFFFFF
	
	li $s0 , 0xAAAAAAAA
	li $s1 , 0xAAAAAAAA
	li $s2 , 0xAAAAAAAA
	li $s3 , 0xAAAAAAAA
	li $s4 , 0xAAAAAAAA
	li $s5 , 0xAAAAAAAA
	li $s6 , 0xAAAAAAAA
	li $s7 , 0xAAAAAAAA
	
	
	# move the data from one register to another
	#move $s4 , $t6
	#move $t5 , $s7
	
	# exit instruction
	li $v0 , 10
	syscall
