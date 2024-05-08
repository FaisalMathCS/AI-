#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:6				#####################
#####################	Task: 1				#####################
##############################################################################


.data 
	prompt: .asciiz "Enter Withdrawl amount: "
	v5: .asciiz "500 Bank note: "
	v100: .asciiz "\n100 Bank note: "
	v10: .asciiz "\n10 Bank note: "
	v1: .asciiz "\n1 Bank note: "
	
.text 
	
	li $v0, 4
	la $a0, prompt
	syscall 
	
	li $v0, 5
	syscall 
	move $t0, $v0
	li $s0, 500
	li $s1, 100
	li $s2, 10 
	divu $t0, $s0
	mflo $t1		# the number of 500 notes is stored in $t1
	mfhi $t2		#the reminder is on $t2
	divu $t2, $s1		
	mflo $t0		# the number of 100 notes is stored in $t0 
	mfhi $t2
	divu $t2, $s2		
	mfhi $t3 		#the number of 10 notes is stored in $t2
	mflo $t2		#the number of 1 notes is stored in $t3
	
	bgtz $t1, p500		#if there's a number in $t1 go to label p500
	bgtz $t0, p100		#if there's a number in $t0 go to lable p100
	bgtz $t2, p10		#if there's a number in $t2 go to label p10 
	bgtz $t3, p1		#if there's a number in $t3 go to label p1
	

	
	
	j End
p500:			
	li $v0, 4
	la $a0, v5
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	bgtz $t0, p100
	bgtz $t2, p10
	bgtz $t3, p1 
	j End
p100: 
	li $v0, 4
	la $a0, v100
	syscall

	li $v0, 1
	move $a0, $t0
	syscall
	bgtz $t2, p10
	bgtz $t3, p1
	
	j End
p10: 
	li $v0, 4
	la $a0, v10
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	bgtz $t3, p1 

	j End
p1: 
	li $v0, 4
	la $a0, v1
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall 
End: 
	li $v0, 10		#terminate 
	syscall 
