.text
.globl main
	main:
	# initially the LED 2 is ON
	li $t0 , 4
	# then rotate (18-2) positions left
	rol $t0 , $t0 , 16	# LED 18 is activated now
	# then rotate (18-0) positions right
	ror $t0 , $t0 , 18	# LED 0  is activated now
	# then rotate (18-0) positions left
	rol $t0 , $t0 , 18	# LED 18 is activated now
	# then rotate (18-2) positions right
	ror $t0 , $t0 , 16	# LED 2 is activated now
	
	# exit 
	li $v0 ,  10
	syscall 
	
	
	
