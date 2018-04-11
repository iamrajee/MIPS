.data
	age : .word  10 ,2 ,3, 4, 5, 6	# array declaration
	length: .word  6

.text
.globl main
main: 
	la $t0 , age	# starting address of the array
	li $t3 , 1 	# loop immediate	
	li $t1, 0	# sum accumulator
	
sum_of_array: 
	lw $t2 , ($t0)
	addu $t1 , $t1 , $t2 
	addi $t0 , $t0 , 4
	addi $t3 , $t3 , 1
	bne $t3 , 7 , sum_of_array
	j print_exit

# ------------ TERMINATE THE PROGRAM ----------- #
print_exit:
	li $v0 , 1
	move $a0 , $t1
	syscall	
	li $v0 , 10
	syscall 
.end main

