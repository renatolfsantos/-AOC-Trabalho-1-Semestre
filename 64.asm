.data
	msg1: .asciiz "Digite um valor maior que 2 e menor que 20: "
	msg2: .asciiz " e par\n"
	msg3: .asciiz "A multiplicacao entre os dois ultimos termos e: "
.text

main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	ble $t0, 2, main
	bge $t0, 20, main
	
	li $t1, 0
	li $t2, 1
	
	li $t6, 2
loop:
	add $t3, $t1, $t2
	add $t1, $t2, 0
	add $t2, $t3, 0
	
	rem $t7, $t3, 2
	
	beq $t7, 0, par
	j fim_par
par:
	li $v0, 1
	add $a0, $t3, 0
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall
fim_par:
	add $t6, $t6, 1
	
	blt $t6, $t0, loop
	
	mul $t4, $t2, $t1
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	add $a0, $t4, 0
	syscall