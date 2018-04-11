# sample1.asm
.text
	addi $t1, $zero, 97 	#Can also be written as addi $9, $0, 97
	li $v0, 10
	syscall
