.data
	roll_no : .word 111601008
	name 	: .asciiz "\nMy name is : bithack: "
	float_num : .float 0.0

	read_integer_prompt :.asciiz "\nEnter an integer: "
	read_string_prompt :.asciiz "\nEnter a string: "
	print_string :.asciiz "\nYou entered the string: "
	print_integer :.asciiz "\nYou entered the number : "
	read_float : .asciiz "\nEnter a floating point number: "
	print_float : .asciiz "\nYou entered a floating point number : "

# start of code section 

.text
.globl main
	main:
	
	# print integer 
	li $v0 , 1  		
	lw $a0 , roll_no 	# integer to print 
	syscall

	# print string
	li $v0 , 4
	la $a0 , name
	syscall


###################################################################
	# input the integer 
	# print string
	li $v0 , 4
	la $a0 , read_integer_prompt
	syscall

	# read int from console
	li $v0 , 5
	syscall
	sw $v0 , roll_no

	# print string
	li $v0 , 4
	la $a0 , print_integer
	syscall

	# print integer 
	li $v0 , 1  		
	lw $a0 , roll_no 	# integer to print 
	syscall

##################################################################
	
	# input the string
	# print string
	li $v0 , 4
	la $a0 , read_string_prompt
	syscall

	# read string from console
	li $v0 , 8 
	la $a0 , name 
	syscall
		
	# print string
	li $v0 , 4
	la $a0 , print_string
	syscall
	
	# print string
	li $v0 , 4
	la $a0 , name
	syscall

###################################################################

	# input the string
	# print string
	li $v0 , 4
	la $a0 , read_float
	syscall

	# read float from console
	li $v0 , 6
	syscall
	s.s $f0 , float_num
		
	# print float prompt
	li $v0 , 4
	la $a0 , print_float
	syscall
	
	# print float num
	li $v0 , 2
	l.s $f12 , float_num
	syscall

##################################################################
	# exit 
	li $v0 ,  10
	syscall 

