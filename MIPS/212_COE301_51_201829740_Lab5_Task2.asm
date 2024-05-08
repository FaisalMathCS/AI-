#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:5				#####################
#####################	Task:2 				#####################
##############################################################################

.data 
	prompt: .asciiz "Enter filename: "
	array: .asciiz "Integer array reversed = "
	filename: .space 50
	filecontents: .space 100
	array_int: .word 0:20
	
.text

	li $v0, 4
	la $a0, pormpt
	syscall 
	
	li $v0, 8
	la $a0, filename
	syscall 
	
	li $v0, 13
	la $a0, filename
	li $a0, 0
	syscall 
	move $s0, $v0
	
	li $v0, 14
	move $a0, $s0
	la $a1, filecontents
	syscall	
