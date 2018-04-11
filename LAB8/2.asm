.data
n:	.word	5
sumOfSquares:	.word 0

.text
.globl main

main:

lw	$t0 , n
li	$t1 ,1
li $t2,0

sumLoop:
	mul	$t3 , $t1, $t1
	add	$t2 , $t2, $t3

	add $t1, $t1, 1
	ble $t1, $t0 , sumLoop
	sw $t2, sumOfSquares

li $v0, 10
syscall
.end main
