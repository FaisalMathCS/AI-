#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:4				#####################
#####################	Task:2 				#####################
##############################################################################


.data 
	sum: .asciiz "\nSum = "
	prompt: .asciiz "Enter integer "
	mark: .asciiz ": "


.text

	addi $t0, $zero, 0
	addi $t1, $zero, 4
	
loop:	bgt $t0, $t1, endLoop
	li $v0, 4
	la $a0, prompt
	syscall 
	
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	li $v0, 4
	la $a0, mark
	syscall
	li $v0, 5
	syscall
	add $t3, $v0, $t3
	
	addi $t0, $t0, 1
	j loop
	
endLoop: li $v0, 4
	la $a0, sum
	syscall 
	
	li $v0, 1
	add $a0, $t3, $zero
	syscall
		
