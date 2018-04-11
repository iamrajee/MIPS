.globl main
main:
	li $t0, 0x0eeffdd0         	#storing original value

   	and $t1, $t0, 0x0ff00000		#extracting red
   	srl $t1, $t1, 20
   	and $t2, $t0, 0x00000ff0		#extracting blue
   	srl $t2, $t2, 4
   	and $t2, $t0, 0x000ff000		#extracting green
   	srl $t2, $t2, 12

	and $t3, $t0, 0xfbbccfff		# updating red from ee 
									# to bb and green from 
									# ff to cc, 
									# rest remains same
	or $t3, $t3, 0x01100000
	or $t4, $t0, 0x00000001			#update alpha to 1

	li $v0, 10
	syscall
