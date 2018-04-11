# @kaushal_kishore
# @rajendra_singh

# problem 1a
# Load all the temporary registers t0 to t9 with 4-bit hex value 0xF and saved
# registers s0 to s7 with the 4 bit hex value 0xA. Move data in t6 to s4 and s7 to t5

.text

.globl main

main: 
	# load immediate instructions
	li $t0 , 0xF
	li $t1 , 0xF 
	li $t2 , 0xF
	li $t3 , 0xF
	li $t4 , 0xF
	li $t5 , 0xF
	li $t6 , 0xF
	li $t7 , 0xF
	li $t8 , 0xF
	li $t9 , 0xF
	
	li $s0 , 0xA
	li $s1 , 0xA
	li $s2 , 0xA
	li $s3 , 0xA
	li $s4 , 0xA
	li $s5 , 0xA
	li $s6 , 0xA
	li $s7 , 0xA
	
	
	# move the data from one register to another
	move $s4 , $t6
	move $t5 , $s7
	
	# exit instruction
	li $v0 , 10
	syscall
