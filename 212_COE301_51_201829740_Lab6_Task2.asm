#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:	6			#####################
#####################	Task: 	2			#####################
##############################################################################


.data 
	prompt: .asciiz "Enter n: "
	answer: .asciiz "n! = "
.text 

	li $v0, 4
	la $a0, prompt
	syscall 
	li $v0, 5 
	syscall 
	move $t0, $v0
	li $t1, 1	# another value to increase with each iteration 
	li $t2, 0
	li $t3, 1	#result 
loop:	beq $t2, $t0, end	# branch for the loop to end 
	multu $t1, $t3		#multiplication 
	mflo $t3		#moving from the low to $t3
	addi $t2, $t2, 1	#increaminting
	addi $t1, $t1, 1	#increaminting

	j loop
end: 

	li $v0, 4
	la $a0, answer
	syscall 
	li $v0, 1
	move $a0, $t3
	syscall 