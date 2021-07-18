    .data
ret1: .asciiz "\nreta 1\n"
ret2: .asciiz "\nreta 2\n"
ret3: .asciiz "\nreta 3\n"

istri_msg: .asciiz "\nEssas retas formam um triangulo"
nottri_msg: .asciiz "\nEssas retas não podem formar um triangulo\n"

equi_msg: .asciiz " equilatero\n"
esca_msg: .asciiz " escaleno\n"
isos_msg: .asciiz " isosceles\n"

    .text

main:


li $v0, 4
la $a0, ret1
syscall

li $v0, 5
syscall

move $t0, $v0


li $v0, 4
la $a0, ret2
syscall

li $v0, 5
syscall

move $t1, $v0


li $v0, 4
la $a0, ret3
syscall

li $v0, 5
syscall

move $t2, $v0


blt $t0, $t1, sub2t1
sub $t3, $t0, $t1
j step2t1

sub2t1:
sub $t3, $t1, $t0

step2t1:
bge $t3, $t2, not_tri
add $t3, $t0, $t1
ble $t3, $t2, not_tri

blt $t1, $t2, sub2t2
sub $t3, $t1, $t2
j step2t2

sub2t2:
sub $t3, $t2, $t1

step2t2:
bge $t3, $t0, not_tri
add $t3, $t1, $t2
ble $t3, $t0, not_tri

blt $t0, $t2, sub2t3
sub $t3, $t0, $t2
j step2t3

sub2t3:
sub $t3, $t2, $t0

step2t3:
bge $t3, $t1, not_tri
add $t3, $t0, $t2
ble $t3, $t1, not_tri
j is_tri

not_tri:
la $a0, nottri_msg
li $v0, 4
syscall
j end

is_tri:
la $a0, istri_msg
li $v0, 4
syscall

equilatero:
bne $t0, $t1, escaleno
bne $t1, $t2, escaleno
bne $t0, $t2, escaleno
la $a0, equi_msg
li $v0, 4
syscall
j end

escaleno:
beq $t0, $t1, isosceles
beq $t1, $t2, isosceles
beq $t2, $t0, isosceles

la $a0, esca_msg
li $v0, 4
syscall
j end

isosceles:
la $a0, isos_msg
li $v0, 4
syscall

end:
li $v0, 10
syscall