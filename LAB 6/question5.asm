.data
	prompt1 : .asciiz "\nEnter an integer: "
	prompt2 : .asciiz "\nEnter another integer: "
	prompt_sum : .asciiz "\nSum : "
	prompt_sub : .asciiz "\nSub : "
	prompt_mul : .asciiz "\nMul : "
	prompt_div : .asciiz "\nDiv : "
	
	prompt_rem : .asciiz "\nRem : "

	num1 : .word 0
	num2 : .word 0

# start of code section 

.text
.globl main
	main:

###################################################################
# part a : both integer positive

	# input the integer 
	# print string
	li $v0 , 4
	la $a0 , prompt1
	syscall

	# read int from console
	li $v0 , 5
	syscall
	sw $v0 , num1

	# input the integer 
	li $v0 , 4
	la $a0 , prompt2
	syscall

	# read int from console
	li $v0 , 5
	syscall
	sw $v0 , num2

	
	lw $s0 , num1
	lw $s1 , num2

	# sum 
	li $v0 , 4
	la $a0 , prompt_sum
	syscall
	add $t3 , $s0 , $s1
	li $v0 , 1  		
	move $a0 , $t3
	syscall

	# sub
	li $v0 , 4
	la $a0 , prompt_sub
	syscall
	sub $t3 , $s0 , $s1
	li $v0 , 1  		
	move $a0 , $t3
	syscall

	# mul
	li $v0 , 4
	la $a0 , prompt_mul
	syscall
	mult $s0 , $s1
	mfhi $t0
	mflo $t1
	li $v0 , 1  		
	move $a0 , $t0
	syscall
	li $v0 , 1  		
	move $a0 , $t1
	syscall


	# div
	li $v0 , 4
	la $a0 , prompt_div
	syscall
	div $s0 , $s1
	mfhi $t0	# remainder
	mflo $t1	# quotient
	li $v0 , 1  		
	move $a0 , $t1
	syscall	

	# rem
	li $v0 , 4
	la $a0 , prompt_rem
	syscall
	li $v0 , 1  		
	move $a0 , $t0
	syscall	
	

##################################################################
	# exit 
	li $v0 ,  10
	syscall 

