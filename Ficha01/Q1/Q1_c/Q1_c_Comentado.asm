#variaveis estáticas
# x26 guarda '9'
addi x26, x0, 57
# x25 guarda '0'
addi x25, x0, 48
# x24 guarda '1'
addi x24, x0, 49
# x28 guarda '-'
addi x28, x0, 45

# numeros usados nas operações lógicas
addi x21, x0, 5
addi x22, x0, 65
addi x23, x0, 15


# recebe valor de a através de x9 e salva em x18

# seta x9 como 0
add x9, x0, x0
# carrega sinal em x5
lb x5, 1025(x0)
# início do laço de recebimento
loop1:
    # recebe caractere
    lb x6, 1025(x0)
    # se x6 < '0' termina laço
    blt x6, x25, endloop1
    # se '9' < x6 termina laço
    blt x26, x6, endloop1
    # usando x27 como variável auxiliar, multiplica x9 por 10
    addi x27, x9, 0
    slli x9, x27, 3
    add x9, x27, x9
    add x9, x27, x9
    # arualiza valor de x6 de ['0', '9'] para [0, 9]
    sub x6, x6, x25

    # subtrai ou soma cada caractere, dependendo do sinal
    beq x5, x28, negative1
    add x9, x9, x6
    beq x0, x0, skipneg1
    negative1:
    sub x9, x9, x6
    skipneg1:

    # retorna para inicio do laço
    beq x0, x0, loop1
endloop1:
# armazena x9 em x18
addi x18, x9, 0


# não irei comentar em detalhes o recebimento de b e c
# pois são funcionalmente iguais ao recebimento de a.


# recebe valor de b
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



# recebe valor de c
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


# se ( a < 5 || 65 < b || 15 >= c ) pular para end
blt x18, x21, end
blt x22, x19, end
bge x23, x20, end

# escreve '1' na saida (nao pulou para end)
sb x24, 1024(x0)

halt 

end: 
# escreve '0' na saida (pulou para end)
sb x25, 1024(x0)
halt