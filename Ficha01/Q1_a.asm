#if(a >= 5 && b <=65 && c > 15) x = 1 ? x = 0
lw x9, a
lw x18, b
lw x19, c
li x20, x

blt x9, 5, final # a < 5
bge x18, 66, final #b >= 66
blt 15, x19, final #15 < c

final: 
	halt 

a: .word 6
b: .word 6
c: .word 20
x: .word 0
