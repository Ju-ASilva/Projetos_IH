#if(a >= 5 && b <=65 && c > 15) x = 1 ? x = 0
lw x9, a
lw x18, b
lw x19, c
lw x20, x

add x20, x0, x0
addi x21, x0, 5
addi x22, x0, 66
addi x23, x0, 15

blt x9, x21, final1 # a < 5
bge x18, x22, final2 #b >= 66
blt x19, x23, final3 #c < 15

addi x20, x0, 1
halt 

final1:
	addi x25, x0, 8
	halt
final2:
	addi x26, x0, 8
	halt
final3:
	addi x27, x0, 8 
	halt

a: .word 6
b: .word 6
c: .word 20
x: .word 0
