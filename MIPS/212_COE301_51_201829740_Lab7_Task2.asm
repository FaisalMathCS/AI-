	#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:7				#####################
#####################	Task: 2				#####################
##############################################################################
.data 

	prompt: .asciiz "Enter n: "
	Answer: .asciiz "Fib(n) = "
.text 
				#prompt the user to enter n 
			
	li $v0, 4 
	la $a0, prompt 
	syscall 
	
	li $v0, 5
	syscall 
	move $a0, $v0 		#move it to $a0 for when we call the function 
	jal Fibonacci 
	
	move $t0, $v0		#saving the returned value of Fib(n)
	
	li $v0, 4
	la $a0, Answer		#print 
	syscall 
	
	li $v0, 1
	move $a0, $t0
	syscall 
	
	li $v0, 10		#terminate 
	syscall
	
	
Fibonacci: 
	bgt $a0, 1, FibRecursive	#for the base case 
	move $v0, $a0 
	jr $ra
		
FibRecursive:
	sub $sp, $sp, 12 		#extending the stack by 3 words
	sw $ra, 0($sp)			#saving the return adress for the first call
	sw $a0, 4($sp) 			#save n 
	addi $a0, $a0, -1 		#this is n-1 for the first recursive call
	jal Fibonacci			#the first recursive call with n-1 in $a0
	lw $a0, 4($sp) 			#n
	sw $v0, 8($sp)			#save the output of Fib(n-1)
	
	add $a0, $a0, -2		#now for the call of n-2
	
	jal Fibonacci 			#the second recursive call 
	
	lw $t0, 8($sp)			#the value of Fib(n-1) is in $t0
	add $v0, $v0, $t0		#by the difention of the function we add Fib(n-1) and Fib(n-2)
	
	lw $ra, 0($sp)			#restore the return address 
	addi $sp, $sp, 12 		#deallocate the stack memory 
	jr $ra 				#return 
