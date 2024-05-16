addi x26, x0, 57
addi x25, x0, 48

addi x24, x0, 49

addi x21, x0, 5
addi x22, x0, 65
addi x23, x0, 15

addi x28, x0, 4


add x9, x0, x0
lb x5, 1025(x0)
loop1:
lb x6, 1025(x0)
blt x6, x25, endloop1
blt x26, x6, endloop1
addi x27, x9, 0
slli x9, x27, 3
add x9, x27, x9
add x9, x27, x9
sub x6, x6, x25

beq x5, x28, negative1
add x9, x9, x6
beq x0, x0, skipneg1
negative1:
sub x9, x9, x6
skipneg1:

beq x0, x0, loop1
endloop1:
addi x18, x9, 0


add x9, x0, x0
lb x5, 1025(x0)
loop2:
lb x6, 1025(x0)
blt x6, x25, endloop2
blt x26, x6, endloop2
addi x27, x9, 0
slli x9, x27, 3
add x9, x27, x9
add x9, x27, x9
sub x6, x6, x25

beq x5, x28, negative2
add x9, x9, x6
beq x0, x0, skipneg2
negative2:
sub x9, x9, x6
skipneg2:

beq x0, x0, loop2
endloop2:
addi x19, x9, 0


add x9, x0, x0
lb x5, 1025(x0)
loop3:
lb x6, 1025(x0)
blt x6, x25, endloop3
blt x26, x6, endloop3
addi x27, x9, 0
slli x9, x27, 3
add x9, x27, x9
add x9, x27, x9
sub x6, x6, x25

beq x5, x28, negative3
add x9, x9, x6
beq x0, x0, skipneg3
negative3:
sub x9, x9, x6
skipneg3:

beq x0, x0, loop3
endloop3:
addi x20, x9, 0


blt x18, x21, end
blt x22, x19, end
bge x23, x20, end

sb x24, 1024(x0)
halt 


end: 
sb x25, 1024(x0)
halt


	








