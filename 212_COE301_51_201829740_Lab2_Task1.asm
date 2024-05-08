.data 
	promptA: .asciiz "\nEnter a: "
	A: .word 0
	promptB: .asciiz "Enter b: "
	B: .word 0
	promptC: .asciiz "Enter c: "
	C: .word 0

	messageZ: .asciiz "Z = "
	Z: .word 0 
	
.text
	#Get A 
	li $v0, 4
	la $a0, promptA
	syscall
	
	li $v0, 5
	syscall
	
	lw $s0, A
	move $s0, $v0
	###
	
	#Get B 
	li $v0, 4
	la $a0, promptB
	syscall
	
	li $v0, 5
	syscall
	
	lw $s1, B
	move $s1, $v0
	###
	
	#Get C
	li $v0, 4
	la $a0, promptC
	syscall
	
	li $v0, 5
	syscall
	
	lw $s2, C
	move $s2, $v0
	###
	
	
	#calculations 
	
	mul $t0, $s0, 5
	mul $t1, $s1, 3
	mul $t2, $s2, 2
	
	sub $t0, $t0, $t1
	sub $t2, $t2, 15
	sub $t3, $t0, $t2
	
	li $v0, 4
	la $a0, messageZ
	syscall
	
	addi $v0, $zero, 1    
    	move $a0, $t3
    	syscall
	
	addi $v0, $zero, 10
    	syscall
	
	
	
	
	
	