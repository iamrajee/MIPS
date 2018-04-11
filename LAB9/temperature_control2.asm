# lab-9
# temperature_control.asm

.data 
    optimal_temperature : .word 20      # 20 degree C
    wait_time           : .word 60      # 60 minutes
    error_array         : .word 0:1000  # array declaration of maxsize: 1000
    array_capacity      : .word 1000    # array capacity
    prompt_poll         : .asciiz "Enter the current temperature: "
    prompt_optimal      : .asciiz "Optimal Temperature: "
    prompt_content_size : .asciiz "Total entries in `error_array` : "
    newline             : .asciiz "\n"	# new-line character
    temp_eq             : .asciiz "\nTemperature is equal to optimal temperature.\n"
    stable              : .asciiz "\nTemperature is stable.\n"
.text
.globl main
.ent main
    # load the base address
    la      $t0 , error_array
    move    $s0 , $t0      # safe copy
    # load the array capacity
    lw      $s1 , array_capacity
    # set the initial content size to 0
    move    $t1 , $zero
    # load the optimal temperature
    lw      $s2 , optimal_temperature

    # print the optimal temperature on the screen
    li      $v0 , 4
	la      $a0 , prompt_optimal      # prompt
	syscall
	li      $v0 , 1  		
	lw      $a0 , optimal_temperature # integer to print 
	syscall
    li $v0 , 4
	la $a0 , newline
	syscall


# break out this loop if anyone of the give 
# two cases are true: 
# (i) if the final temperature is equal to optimal_temperature
# (ii) or the current temperature is equal to the previous temperature


# input the first poll
    # ask the user to input the temperature
    li      $v0 , 4
	la      $a0 , prompt_poll        # prompt
	syscall
	li      $v0 , 5
	syscall
	move    $t9 , $v0
    # store this number into the array
    sub     $t9, $t9, $s2		# error: outside_temp - optimal_temp
    sw      $t9 , ($t0)
    # increment the $t1 : the current content size of the array
	addi    $t1 , $t1 , 1
condition1:
    # if condition (i) is satisfied
    beq	    $t9, $zero, out_of_loop_one
    # incrementing the base address
    addi    $t0 , $t0 , 4

temperature_poll:
    # now it's sure here that size is greater than equal to 1 at any time.
    # ask the user to input the temperature
    li      $v0 , 4
	la      $a0 , prompt_poll        # prompt
	syscall
	li      $v0 , 5
	syscall
	move    $t9 , $v0
    # store this number into the array
    sub     $t9, $t9, $s2		# error: outside_temp - optimal_temp
    sw      $t9 , ($t0)
    # increment the $t1 : the current content size of the array
	addi    $t1 , $t1 , 1
condition_one:
    # if condition (i) is satisfied
    beq	    $t9, $zero, out_of_loop_one
condition_two:    
    # if condition (ii) is satisfied
    sub     $t8, $t0 , 4
    lw      $t8 , ($t8)     # retrieve the previous value
    beq	    $t8, $t9, out_of_loop_two
    
    # incrementing the base address
    addi    $t0 , $t0 , 4
    # if the array is not full: then branching
    blt     $t1 , $s1 , temperature_poll

out_of_loop_one:
    li      $v0 , 4
	la      $a0 , temp_eq      # prompt
	syscall
    j print_the_array
out_of_loop_two:
    li      $v0 , 4
	la      $a0 , stable      # prompt
	syscall

print_the_array:
    li $v0 , 4
	la $a0 , newline
	syscall
    # print the size of the array
    li      $v0 , 4
	la      $a0 , prompt_content_size      # prompt
	syscall
	li      $v0 , 1  		
	move    $a0 , $t1 # integer to print 
	syscall
    li $v0 , 4
	la $a0 , newline
	syscall    
    # printing the error_array
    move    $t0 , $s0 # set the base address
    li $t3 , 0 		# loop index - (0 to size-1)
print_loop:
	li $v0 , 1
	lw $a0 , ($t0)
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	addi $t0 , $t0 , 4
	addi $t3 , $t3 , 1
	blt $t3 , $t1 , print_loop
	j exit

exit:
	li $v0 , 10
	syscall    
.end main