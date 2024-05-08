#quiz 
#Name: Faisal alzhrani 
#ID: 201829740
#sec: 51


.data 
	promptA: .asciiz "Enter a: "
	promptB: .asciiz "Enter b: "
	answer: .asciiz "funp(a, b) = " 
.text 

	li $v0, 4
	la $a0, promptA
	syscall 
	
	li $v0, 5
	syscall 
	move $t0, $v0 
	
	li $v0, 4
	la $a0, promptB
	syscall 
	
	li $v0, 5
	syscall 
	
	move $a1, $v0
	move $a0, $t0
	jal funp
	
	move $a0, $v0
	
	li $v0, 4 
	la $a0, answer
	syscall 
	
	li $v0, 1
	syscall 
	
	li $v0, 10
	syscall 
	
funp: 
	bnez  $a1, funpRec
	li $v0, 1
	jr $ra

funpRec:
	li $t5, 2
	div $a1, $t5
	mfhi $t5 
	
	addi $sp, $sp, -8
	sw $ra, ($sp)
	sw $a0, 4($sp)
	beqz $t5, change
	
	mul $a0, $a0, $a0
	sra $a1, $a1, 1
	
	jal funp 
	lw $a0, 4($sp)
	lw $ra, ($sp)
	mul $v0, $v0, $a0
	addi $sp, $sp, 8
	jr $ra
change: 
	mul $a0, $a0, $a0
	srl $a1, $a1, 1
	jal funp
	lw $a0, 4($sp)
	lw $ra, ($sp)
	mul $v0, $v0, $a0
	addi $sp, $sp, 8
	jr $ra
