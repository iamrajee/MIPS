.data

x:	.word	6
y:	.word	3
answer:	.word	0

.text
.globl main
.ent main
main:

	lw $a0 , x
	lw $a1 , y
	jal power
	move  $t5, $v0
	
	li $v0, 10
	syscall
	
.end main


.globl power
.ent power
power:
	li $v0,1
	li $t0,0
	
powLoop:
	mul $v0, $v0, $a0
	add $t0, $t0, 1
	blt	$t0, $a1, powLoop
	jr $ra
	
.end power
