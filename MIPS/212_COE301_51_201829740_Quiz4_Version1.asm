#Quiz 4 
#Name: Faisal alzhrani 
#ID: 201829740

.data 
	promptX: .asciiz "Enter x: "
	answer: .asciiz "ln(1+x) = "

.text 

	li $v0, 4 
	la $a0, promptX
	syscall 
	
	li $v0, 7 
	syscall 
	
	
	jal seriesFunction
	
	
	li $v0, 4
	la $a0, answer 
	syscall 
	
	li $v0, 3
	syscall 
	
	li $v0, 10
	syscall 
	
	
	
seriesFunction: 	#x = $f0

	addi $sp, $sp, -4
	sw $ra, 0($sp)

	li $t2, 1
	li $t3, 21
	
looping: 
	beq $t2, $t3, found
	
	move $a0, $t2
	jal power 
	
	
	andi $t4, $t2, 1
	mtc1 $a0, $f10
	cvt.d.w $f8, $f10
	div.d $f12, $f12,$f8
	 
	beq $t4, $zero, even
	addi $t2, $t2, 1
	j looping 

	
	
even: 
	li $t5, -1
	mtc1 $t5, $f10
	cvt.d.w $f8,$f10
	
	mul.d $f12, $f8, $f12
	addi $t2, $t2, 1
	j looping
found:
	lw $ra, ($sp)
	addi $sp, $sp, 4 
	jr $ra
	
	
	
power: 		#a0 = b, $f0 = x 
	mov.d $f4, $f0
	li $t0, 1
	move $t1, $a0
loop: 	
	beq $t0, $t1, done
	mul.d $f4, $f4, $f0
	addi $t0, $t0, 1 
	j loop

done: 
	
	mov.d $f12, $f4
	jr $ra 
