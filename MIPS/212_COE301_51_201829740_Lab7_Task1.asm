#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:7				#####################
#####################	Task:1 				#####################
##############################################################################



.data 

Prompt: .asciiz "Enter integer "
Answer : .asciiz "Integers reversed: "

.text

main:
	jal f 
	li $v0, 10
	syscall   
f: 
	addiu $sp, $sp, -44 # allocate stack frame = 44 bytes
	sw $ra, 40($sp) # save $ra on the stack
	move $a0, $sp # $a0 = address of array on the stack
	li $a1, 10 # $a1 = 10
	jal read # call function read
	move $a0, $sp # $a0 = address of array on the stack
	li $a1, 10 # $a1 = 10
	jal reverse # call function reverse
	move $a0, $sp # $a0 = address of array on the stack
	li $a1, 10 # $a1 = 10
	jal print # call function print
	lw $ra, 40($sp) # load $ra from the stack
	addiu $sp, $sp, 44 # Free stack frame = 44 bytes
	jr $ra # return to caller
	
read: 			#reads integers where the beginning of the array is on $a0, and the size is in $a1
	li $t0, 0
	move $t1, $a0 		#save the adress of the array in $t1

loop:
	bge $t0, $a1, loopEnd
	
	li $v0, 4
	la $a0, Prompt
	syscall 
	li $v0, 1
	addi $a0, $t0, 1
	syscall 
	
	li $v0, 11
	addi $a0, $zero, ':'
	syscall 
	
	li $v0, 11
	addi $a0, $zero, ' '
	syscall 
	
	li $v0, 5 
	syscall 
	
	sw $v0, ($t1)
	addiu $t1, $t1, 4
	
	addiu $t0, $t0, 1
	j loop 
loopEnd: 
 	sll $t0, $t0, 2
 	addu $v0, $t1, $t0		#to return the base adress of the array into $v0
	jr $ra

reverse: 				#adress of the first element is on $a0, size in $a1
	srl $t0, $a1, 1			#divide by 2, becuase we will shift two elements at a time
	li $t1, 0
	move $t3, $a0
	sll $t4, $a1, 2
	addu $t4, $a0, $t4
	addi $t4, $t4, -4
TheLoop: 
	beq $t1, $t0, TheEnd
	lw $t5, 0($t4)
	lw $t6, 0($t3)
	sw $t5, 0($t3)
	sw $t6, 0($t4)
	
	subi $t4, $t4, 4
	addi $t3, $t3, 4
	addiu $t1, $t1, 1
	j TheLoop
TheEnd:
	jr $ra
	
print:  				#adress of the array is on $a0, size in $a1 
	move $t1, $a0 
	li $t0, 0
	
	li $v0, 4
	la $a0, Answer
	syscall 
	
loopP: 	bge $t0, $a1, EndLoopP
	
	lw $a0, ($t1)
	
	li $v0, 1
	syscall 
	
	li $v0, 11
	addiu $a0, $zero, ' '
	syscall 

	addiu $t1, $t1, 4 
	addiu $t0, $t0, 1 
	j loopP
EndLoopP:

	jr $ra


