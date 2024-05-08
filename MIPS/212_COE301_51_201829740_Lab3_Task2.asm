#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:3				#####################
#####################	Task:2 			#####################
##############################################################################


.data 
	prompt: .asciiz "Enter a: "
	result: .asciiz "Result: " 
	


	
.text 
	#asks the user to enter the value
	li $v0, 4
	la $a0, prompt
	syscall
	#saves the value into $v0
	li $v0, 5
	syscall
	
	

	#the value as a hexadecimal
	li $t0, 0x100200
	or $t1, $t0, $v0
	
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $t1
	syscall


