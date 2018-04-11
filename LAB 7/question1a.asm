.data 
	prompt_1 : .asciiz "A is less than B\n"
	prompt_2 : .asciiz "B is less than A\n"
	

.text 

.globl main
	main:
		li $t2 , 0xFFFFFFFF  # A
		li $t3 , 0x0000000F  # B

		li $t0 , 0			# already reset		
		
		slt $t0 , $t2 , $t3
		blt $t2 , $t3 , A_lt_B
		blt $t3 , $t2 , B_lt_A
		j exit

	A_lt_B:
		li $t1 , 1
				
		la $a0, prompt_1
		li $v0, 4
		syscall

		j exit
		
	B_lt_A:
		la $a0, prompt_2
		li $v0 , 4
		syscall

		j exit

		
	exit:
		li $v0 , 10
		syscall
