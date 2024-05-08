#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:2 				#####################
#####################	Task: 2 			#####################
##############################################################################
 
 .data
 	prompet: .asciiz "Enter your name: "
 	message: .asciiz "Welcome to MISP Assembly, "
 	userInput: .space 20
.text
	main:
	# Display prompet
	li $v0, 4
	la $a0, prompet
	syscall
	 
	#Getting text from the user
	li $v0, 8
	la $a0, userInput
	li $a1, 20
	syscall
	
	#Display message
	li $v0, 4
	la $a0, message
	syscall
	
	#Display user's input
	li $v0, 4
	la $a0, userInput
	syscall
	
	
	li $v0, 10
	syscall
	