#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:8				#####################
#####################	Task:1 				#####################
##############################################################################


.data 
	x: .asciiz "Enter Dividend(x): "
	y: .asciiz "Enter Divisor(y): "
	result: .asciiz "The result x/y is: "
	
.text 
	li $v0, 4
	la $a0, x
	syscall 
	
	li $v0, 5
	syscall 
	move $t0, $v0 
	
	li $v0, 4 
	la $a0, y
	syscall 
	 
	li $v0, 5
	syscall 
	move $t1, $v0
	
	teqi $t1, 0
	
	div $t2, $t0, $t1
	
	li $v0, 4
	la $a0, result
	syscall 
	li $v0, 1
	move $a0, $t2
	syscall 
	
	li $v0, 10
	syscall 
	
.ktext 0x80000180
move $k0, $at
la $k1, _regs
sw $k0, 0($k1) # store $at
sw $a0, 4($k1) # store $a0
sw $v0, 8($k1) # store $v0 
mfc0 $k1, $13 
srl $k1, $k1, 2 
andi $k1, $k1, 0x1f
# exception code is in $k1
bne $k1, 13, _else
li $v0, 4
la $a0, _msg
syscall 
mfc0 $k1, $14
addi $k1, $k1, -28
mtc0 $k1, $14
j _cleanup
_else: 
mfc0 $k1, $14
addi $k1, $k1, 4
mtc0 $k1, $14
_cleanup:
la $k1, _regs
lw $at, 0($k1) # load $at
lw $a0, 4($k1) # load $a0
lw $v0, 8($k1) # load $v0 
eret
.kdata
_regs: .word 0:3
_msg: .asciiz "Divide by zero Exception. Please enter a different value for y.\n"
