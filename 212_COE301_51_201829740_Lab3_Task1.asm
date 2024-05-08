#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:3				#####################
#####################	Task:1 			#####################
##############################################################################


.data 

	Prompt: .asciiz "Enter x: " 
	answer: .asciiz "y = "
	x: .word 
	
	

.text
	#asks the user to enter the value
	li $v0, 4
	la $a0, Prompt
	syscall
	
	
	li $v0, 5
	la $a0, x
	syscall
	
	#shift 5 to multiply by 32
	sll $t0, $v0, 5
	#shift 1 time to multiply by 2
	sll $t1, $v0, 1
	#shift 3 times to multiply by 8
	sll $t2, $v0, 3
	
	#add all of them 
	add $t3, $t0, $t1
	add $t4, $t3, $t2
	#we have the number multiplied by 42 stored in $t4
	
	#division by 4
	
	sra $t5, $v0, 2
	#adding the two values 
	add $t6, $t4, $t5
	
	#printing the text answer 
	li $v0, 4
	la $a0, answer
	syscall
	#printing the result 
	li $v0, 1       
	move $a0, $t6
	syscall 
	
	li $v0, 10
