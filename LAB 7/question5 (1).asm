.data
	gpa:	.float	10.0 8.23 8.10 7.0
	length:	.word	4
	
	sum: 	.asciiz "\nSum: "
	product: .asciiz "\nProduct: "
	average: .asciiz "\nAverage: "
	max: .asciiz "\nMaximum: "
	min: .asciiz "\nMinimum: "

# sum, product, average, minimum and maximum,
.text
.globl main
main:
	la $t0 , gpa 	# starting address of the array
	li $t1 , 0		# loop index
	li.s $f12 , 0.0	# sum accumulator
	li.s $f1 , 0.0	# maximum
	li.s $f2 , 11.0	# minimum
	li.s $f3 , 1.0	# product
	li.s $f9 , 4.0	# length of array
	
operational_loop: 
	l.s $f5 , ($t0)			# load a float from array
	add.s $f12 , $f12 , $f5	# val(f12) = val(f12) + val(f5) 	
	addi $t0 , $t0 , 4		# updating the address
	addi $t1 , $t1 , 1		# loop index increment
	mul.s $f3 , $f3, $f5	# f3 = f3 * f5
	
	c.lt.s $f5 , $f2		# is f5<f2?
	bc1t set_minimum
common1:
	c.lt.s $f1 , $f5		# is f1<f5?
	bc1t set_maximum
	
common2:
	bne $t1 , 4 , operational_loop
	j print_exit

set_maximum:
	mov.s $f1 , $f5
	j common2
	
set_minimum:
	mov.s $f2 , $f5
	j common1 

# ------------ TERMINATE THE PROGRAM ----------- #
print_exit:	
# ------------ PRINT SUM ----------------- #
	li $v0 , 4
	la $a0 , sum
	syscall
	li $v0 , 2
	syscall

# ------------ AVERAGE -------------------- #
	div.s  $f12, $f12, $f9
	li $v0 , 4
	la $a0 , average
	syscall
	li $v0 , 2
	syscall

# ------------ PRODUCT -------------------- #
	li $v0 , 4
	la $a0 , product
	syscall
	li $v0 , 2
	mov.s $f12 , $f3
	syscall

# ------------ MAXIMUM -------------------- #
	li $v0 , 4
	la $a0 , max
	syscall
	li $v0 , 2
	mov.s $f12 , $f1
	syscall

# ------------ MINIMUM -------------------- #
	li $v0 , 4
	la $a0 , min
	syscall
	li $v0 , 2
	mov.s $f12 , $f2
	syscall


# ------------- EXIT ---------------- #
	li $v0 , 10
	syscall 
.end main

