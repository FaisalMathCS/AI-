#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:9				#####################
#####################	Task:2 				#####################
##############################################################################


.data 
	prompt: .asciiz "Enter grade "
	result: .asciiz "Result is of the 12 grade is: "
	twelve: .float 12
	
.text 

	li $t0, 0 
	li $t1, 12
loop: 
	beq $t0, $t1, end 
	li $v0, 4 
	la $a0, prompt 
	syscall 
	
	li $v0, 1 
	move $a0, $t0
	syscall 
	
	li $v0, 11
	li $a0, ':'
	syscall 
	li $v0, 11
	li $a0, ' ' 
	syscall 
	
	li $v0, 6
	syscall 
	
	add.s $f1, $f0, $f1
	
	add $t0, $t0, 1 
	j loop 

end: 
	la $t0, twelve 
	
	l.s $f2, ($t0)
	
	div.s $f12, $f1, $f2
	
	li $v0, 4 
	la $a0, result 
	syscall 
	
	li $v0, 2
	syscall 
	
	li $v0, 10
	syscall 
	
	
	
