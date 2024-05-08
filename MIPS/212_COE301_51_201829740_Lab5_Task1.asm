#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:5				#####################
#####################	Task:1 				#####################
##############################################################################


.data 
	promptN: .asciiz "Enter n: "
	promptS: .asciiz "Enter Strin: "
	promptE: .asciiz "\nEnter e: "
	es: 	 .asciiz "Encrypted string = " 

.text 

	li $v0, 4
	la $a0, promptN
	syscall
	
	li $v0, 5
	syscall 
	addiu $a0, $v0, 1 	#n + 1 the number of bytes (char)
	move $t0, $v0		# the value n is in $t0
	
	li $v0, 9 
	syscall
	move $t1, $v0		#the address is on $t1
	
	li $v0, 4
	la $a0, promptS
	syscall 
	
	li $v0, 8
	addu $a0, $t1, $zero	#the string is located in the heap with the address in $t1
	addi $a1, $t0, 1
	syscall 
	addu $t5, $t1, $zero
	
	li $v0, 4
	la $a0, promptE
	syscall 
	
	li $v0, 5
	syscall 
	move $t2, $v0		#key is on $t2
	
	li $s0, 0x41		# A 
	li $s1, 0x5A		# Z
	li $s2, 0x61		# a
	li $s3, 0x7A		# z
loop: 
	beqz $t0, endLoop
	lb $t3, 0($t1)		#load from the array into $t3
	addiu $t1, $t1, 1	#access the next char for the next iteration 
	subiu $t0, $t0, 1
	
	bltu $t3, $s0, loop	#if the ascii value isn't a char contineu
	bleu $t3, $s1, upper	#if it's an upper char go to label upper 
	bleu $t3, $s3, lower 

 	j loop
upper: 
	addu $t3, $t3, $t2
	bgtu $t3, $s1, outRanged
	subiu $t4, $t1, 1
	sb $t3, 0($t4)

	j loop
lower:
	addu $t3, $t3, $t2
	bgtu $t3, $s3, outRanged
	subiu $t4, $t1, 1
	sb $t3, 0($t4)

	j loop 
	
	
outRanged: 
	subiu $t3, $t3, 26
	subiu $t4, $t1, 1
	sb $t3, 0($t4)
	j loop 
	
	
endLoop: 
	li $v0, 4 
	la $a0, es
	syscall 
	addu $a0, $t5, $zero
	syscall 
	
	
	
	
	
