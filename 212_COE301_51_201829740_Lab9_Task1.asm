#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:9				#####################
#####################	Task: 1				#####################
##############################################################################

.data 
	pi: .double 3.14
	eight: .double 8 
	doubleNegOne: .double -1
	Zero: .double 0
	promptX: .asciiz "Enter double x: "
	promptY: .asciiz "Enter double y: "
	result: .asciiz "The result is: " 
	
	
.text 
	li $v0, 4
	la $a0, promptX
	syscall 
	
	li $v0, 7		
	syscall 
	
	mov.d $f2, $f0		#x at $f2
	
	li $v0, 4 
	la $a0, promptY
	syscall 
	
	li $v0, 7 
	syscall 
	
	div.d $f4, $f2, $f0
	
	la $t0, Zero 
	l.d $f0, ($t0)
	c.le.d $f4, $f0
	
	bc1t 0, negative 
	
	la $t0, eight 
	l.d $f0, ($t0)
	
	mul.d $f4, $f0, $f4
	
	sqrt.d $f4, $f4
	
	j print
	
negative: 
	
	la $t0, doubleNegOne
	l.d $f0, ($t0)
	mul.d $f4, $f0, $f4
	
	la $t0, pi
	l.d $f0, ($t0)
	
	sqrt.d $f4, $f4
	
	mul.d $f4, $f4, $f0

print: 
	mov.d $f12, $f4
	
	li $v0, 3
	syscall 