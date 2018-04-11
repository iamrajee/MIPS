
# @kaushal_kishore
# @rajendra_singh

# 1(b) Load all the temporary registers t0 to t9 with 16-bit hex value 0xFFFF and saved
# registers s0 to s7 with the 16 bit hex value 0xAAAA.

.text

.globl main

main: 
	# load immediate instructions
	li $t0 , 0xFFFF
	li $t1 , 0xFFFF 
	li $t2 , 0xFFFF
	li $t3 , 0xFFFF
	li $t4 , 0xFFFF
	li $t5 , 0xFFFF
	li $t6 , 0xFFFF
	li $t7 , 0xFFFF
	li $t8 , 0xFFFF
	li $t9 , 0xFFFF
	
	li $s0 , 0xAAAA
	li $s1 , 0xAAAA
	li $s2 , 0xAAAA
	li $s3 , 0xAAAA
	li $s4 , 0xAAAA
	li $s5 , 0xAAAA
	li $s6 , 0xAAAA
	li $s7 , 0xAAAA
	
	
	# move the data from one register to another
	#move $s4 , $t6
	#move $t5 , $s7
	
	# exit instruction
	li $v0 , 10
	syscall
