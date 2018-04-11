.data
	marks : .word  0,0,0,0	# array declaration
	length: .word  4
	newline: .asciiz "\n"		# new-line character

.text
.globl main
main: 

# ------- MARKS STORED IN THE REGISTERS ------  #
	li $s0 , 10
	li $s1 , 7
 	li $s2 , 8
	li $s3 , 9
# ------- STORING THOSE IN THE ARRAYS --------- #
	la $t0 , marks
	lw $t1 , length
	li $t3 , 1 		# loop index - (1 to length)

store_in_array:
	sw $s0 , ($t0)
	sw $s1 , 4($t0)
	sw $s2 , 8($t0)
	sw $s3 , 12($t0)

print_the_array:
	li $v0 , 1 
	lw $a0 , ($t0)
	syscall 
	li $v0 , 4
	la $a0 , newline
	syscall
	addi $t0 , $t0 , 4
	addi $t3 , $t3 , 1
	bne $t3 , 5 , print_the_array
	j exit

# ------------ TERMINATE THE PROGRAM ----------- #
exit:
	li $v0 , 10
	syscall 
.end main

