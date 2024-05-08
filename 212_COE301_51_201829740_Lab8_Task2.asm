#############################################################################
#####################	Name: Faisal alzhrani 		#####################
#####################	ID:201829740 			#####################
#####################	Section:51 			#####################
#####################	Lab:8				#####################
#####################	Task: 2				#####################
##############################################################################



.text 
	li $t1, 0xffff0000	#the adress of keyboard register 
	addi $t2, $t1, 4	#data register 
	addi $t5, $t1, 12	#display regitser 
	
loop: 	lw $t3, ($t1)		#to see if it's ready 
	andi $t3, $t3, 1	#extract the ready bit 
	beq $t3, $zero , loop 	#if not ready just wait 
	lw $t4, ($t2)		#in $t4 the char is stored 
	
	move $a0, $t4		#since I did a lot of work in $a0 I just moved it there 
	blt $a0, 0x41, send	#below A (don't convert 
	bgt $a0, 0x5A, check	#check whether this byte is a small letter or not
	addiu $a0, $a0, 0x20	#add 0x20 to make it small 
	j send
check:
	bgt $a0, 0x7a, send	#not alphabet byte
	blt $a0, 0x61, send 	#not alphabet byte 
	addiu $a0, $a0, -0x20	#make it capital 

send:
	sw $a0, ($t5) # Send character to display
	j loop 