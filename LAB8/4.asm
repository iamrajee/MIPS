.data
mult_arr:
	.word	6 , 3
	.word	4 , 0	

size:	.word 2
ans: 	.word 0

DATASIZE = 4

#   addr = baseAddr+(rowIndex*colSize+colIndex) * dataSize

.text
.globl main
.ent main
main:
	la $a0 , mult_arr
	lw $a1 , size
	jal det
	move $a0 , $v0
	li $v0 , 1  
	syscall
	sw $a0 , ans
	li $v0, 10
	syscall
	
.end main


# argument to det procedure:
# base address 	: $a0
# colSize	: $a1
# return the result
# determinant	: $v0


.globl det
.ent det
det:
	# (0,0)
	lw $v0 , ($a0)
	# (1,1)
	addi $t0 , $a1 , 1
	mul $t0 , $t0 , DATASIZE
	add $t0 , $t0 , $a0
	lw $t0 , ($t0)
	mul $v0 , $t0, $v0
	# (0,1)
	li $t0 , DATASIZE
	add $t0 , $t0 , $a0
	lw $t0 , ($t0)
	# (1,0)
	move $t1 , $a1
	mul $t1 , $t1 , DATASIZE
	add $t1 , $t1 , $a0
	lw $t1 , ($t1)
	# # # # # # # # # # # # 
	mul $t0 , $t0 , $t1
	sub $v0 , $v0 , $t0	
	jr $ra
	
.end det
