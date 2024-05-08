#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:4				#####################
#####################	Task:1 				#####################
##############################################################################




.data 
	prompt: .asciiz "Enter a: "
	
	posE: .asciiz "Your number is a positive even number"
	posO: .asciiz "Your number is a positive odd number"
	negE: .asciiz "Your number is a negative even number"
	negO: .asciiz "Your number is a negative odd number"
	
.text 

	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall 
	move $t0, $v0
		
	bgt $zero, $t0, negative  			# to see if positive or negative 
	
	andi $t0, $t0, 0x1  			#checks if the number is even or odd
	beqz $t0, posEven				
	
	li $v0, 4
	la $a0, posO				#if there's no branch this means the numebr is Positive ODD
	syscall
	li $v0, 10
	syscall 				#Terminates so that the program doenn't display other things 
	
negative:	andi $t0, $t0, 0x0001
		beqz $t0, negEven
		li $v0, 4
		la $a0, negO
		syscall 
		li $v0, 10
		syscall
	
negEven: 	li $v0, 4
		la $a0, negE
		syscall 
		li $v0, 10
		syscall
posEven: 	li $v0, 4
		la $a0, posE
		syscall
		li $v0, 10
		syscall
