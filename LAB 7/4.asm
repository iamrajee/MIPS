.data

.text
	main:
		addi $s0, $zero, 0 # Initialising the "s" registers
		addi $s1, $zero, 1
		addi $s2, $zero, 2
		addi $s3, $zero, 3
		addi $s4, $zero, 4
		addi $s5, $zero, 5
		addi $s6, $zero, 6
		addi $s7, $zero, 7
		
		jal increment # Calling the procedure
		li $v0, 10 # Exit
		syscall
		
	increment: 
		addi $sp, $sp, -32 # Allocating enough space on stack
		sw $s0, 0($sp) # Storing all the "s" registers
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		
		addi $s0, $s0, 1 # Incrementing all the "s" registers
		addi $s1, $s1, 1
		addi $s2, $s2, 1
		addi $s3, $s3, 1
		addi $s4, $s4, 1
		addi $s5, $s5, 1
		addi $s6, $s6, 1
		addi $s7, $s7, 1
		# Putting in respective "t's" the old value + the new value with the help of stack
		add $t0, $zero, $s0 
		lw $s0, 0($sp)
		add $t0, $t0, $s0
		add $t1, $zero, $s1
		lw $s1, 4($sp)
		add $t1, $t1, $s1
		add $t2, $zero, $s2
		lw $s2, 8($sp)
		add $t2, $t2, $s2
		add $t3, $zero, $s3
		lw $s3, 12($sp)
		add $t3, $t3, $s3
		add $t4, $zero, $s4
		lw $s4, 16($sp)
		add $t4, $t4, $s4
		add $t5, $zero, $s5
		lw $s5, 20($sp)
		add $t5, $t5, $s5
		add $t6, $zero, $s6
		lw $s6, 24($sp)
		add $t6, $t6, $s6
		add $t7, $zero, $s7
		lw $s7, 28($sp)
		add $t7, $t7, $s7
		addi $sp, $sp, 32 # Making it free
 		jr $ra # Go back to main