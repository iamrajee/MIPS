.data 
num1 : .word 2
num2 : .word 4

.text
.globl main
.ent main
main:

lw $t1, num1
lw $t1, num2
lw $t2, num2


add $t4, $t1, $0
add $t3, $t1, $0

li $v0 , 10
syscall

.end main
