
# @kaushal_kishore
# @rajendra_singh

#1(d) Load all the temporary registers t0 to t9 and saved registers s0 to s7 with the 36
#bit hex value 0x123456789.
.text

.globl main

main: 
	# load immediate instructions
	li $t0 , 0x123456789
	li $t1 , 0x123456789 
	li $t2 , 0x123456789
	li $t3 , 0x123456789
	li $t4 , 0x123456789
	li $t5 , 0x123456789
	li $t6 , 0x123456789
	li $t7 , 0x123456789
	li $t8 , 0x123456789
	li $t9 , 0x123456789
	
	li $s0 , 0x123456789
	li $s1 , 0x123456789
	li $s2 , 0x123456789
	li $s3 , 0x123456789
	li $s4 , 0x123456789
	li $s5 , 0x123456789
	li $s6 , 0x123456789
	li $s7 , 0x123456789
	
	
	# move the data from one register to another
	#move $s4 , $t6
	#move $t5 , $s7
	
	# exit instruction
	li $v0 , 10
	syscall
