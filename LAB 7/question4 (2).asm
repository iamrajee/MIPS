.text
.globl main
main: 
	li $s0, 0
	li $s1, 1
	li $s2, 2
	li $s3, 3
	li $s4, 4 
	li $s5, 5
	li $s6, 6
	li $s7, 7
# ----------- ADDING THE STORED REGISTERS ------ #
	subu	$sp , $sp , 4
	sw		$s0 , ($sp)
	
	
	subu	$sp , $sp , 4
	sw		$s1 , ($sp)	
	subu	$sp , $sp , 4
	sw		$s2 , ($sp)	
	subu	$sp , $sp , 4
	sw		$s3 , ($sp)	
	subu	$sp , $sp , 4
	sw		$s4 , ($sp)	
	subu	$sp , $sp , 4
	sw		$s5 , ($sp)
	subu	$sp , $sp , 4
	sw		$s6 , ($sp)
	subu	$sp , $sp , 4
	sw		$s7 , ($sp)

# ------------ TERMINATE THE PROGRAM ----------- #
	li $v0 , 10
	syscall 
.end main

