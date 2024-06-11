#ATENÇÃO: O codigo foi configurado para o led "a" do display de 7 segmentos ser o pin 2, o led "b"
#ser o pin 3 até o led "f" ser o pin 7 (de 2 a 7 do PortD com excrita 1029(x0)) e o pin 8 com a led
# "g" no PortB com escrita 1027(x0)

#entrada 0000, numero 0, correspondente a 111111 em binario no PortD, equivale a 63 em decimal e 0 no portB
#entrada 0001, numero 1, correspondente a 000110 em binario no portD, equivale a 6 em decimal e 0 no portB
#entrada 0010, numero 2, correspondente a 011011 em binario no portD, equivale a 27 em decimal e 1 no portB
#entrada 0011, numero 3, correspondente a 001111 em binario no portD, equivale a 15 em decimal e 1 no portB
#entrada 0100, numero 4, correspondente a 100110 em binario no portD, equivale a 38 em decimal e 1 no portB
#entrada 0101, numero 5, correspondente a 101101 em binario no portD, equivale a 45 em decimal e 1 no portB
#entrada 0110, numero 6, correspondente a 111101 em binario no portD, equivale a 61 em decimal e 1 no portB
#entrada 0111, numero 7, correspondente a 000111 em binario no portD, equivale a 7 em decimal e 0 no portB
#entrada 1000, numero 8, correspondente a 111111 em binario no portD, equivale a 63 em decimal e 1 no portB
#entrada 1001, numero 9, correspondente a 101111 em binario no portD, equivale a 47 em decimal e 1 no portB

#carregando registradores para salvar os numeros do teclado
lb x5, 1025(x0)
lb x6, 1025(x0)
lb x7, 1025(x0)
lb x28, 1025(x0)

#registrando 1
addi x27, x27, 1
#registrando o valor do 0 da tabela ascii
addi x30, x30, 48

#adicionando os numeros para imprimir no display de 7 segmentos no portD
addi x9, x9, 63
addi x18, x18, 6
addi x19, x19, 27
addi x20, x20, 15
addi x21, x21, 38
addi x22, x22, 45
addi x23, x23, 61
addi x24, x24, 7
addi x25, x25, 63
addi x26, x26, 47

#casos
bne x5, x30, jump4 # se não for igual a 0, pula
bne x6, x30, jump3 #se não for igual a 0, pula
bne x7, x30, jump2 # se não for igual a 0, pula
bne x28, x30, jump1 # se não for igual a 0, pula
sb x9, 1029(x0) #numero 0 no display
sb x0, 1027(x0)
beq x0, x0, fim

jump1: #já sabemos que a entrada foi 0001 pois foi o ultimo jump do 0000 e como pulou o ultimo 0, então termina com 1
    sb x18, 1029(x0) #numero 1 no display
    sb x0, 1027(x0)
    beq x0, x0, fim

jump2:#sabemos que começa com 001 a entrada
    bne x28, x30, jump21 #se não for igual a 0, pula
    sb x19, 1029(x0) #numero 2 no display (0010)
    sb x27, 1027(x0) 
    beq x0, x0, fim
jump21: #o numero é 0011
    sb x20, 1029(x0) #numero 3 no display
    sb x27, 1027(x0)
    beq x0, x0, fim 

jump3:#começa com 01 o numero
    bne x7, x30, jump32 # se não for igual a 0, pula
    bne x28, x30, jump31 # se não for igual a 0, pula
    sb x21, 1029(x0) #numero 4 no display (0100)
    sb x27, 1027(x0)
    beq x0, x0, fim
jump31:#o numero é 0101
    sb x22, 1029(x0) #numero 5 no display
    sb x27, 1027(x0)
    beq x0, x0, fim
jump32:#o numero começa com 011
    bne x28, x30, jump321 # se não for igual a 0, pula
    sb x23, 1029(x0) #numero 6 no display (0110)
    sb x27, 1027(x0)
    beq x0, x0, fim
jump321:#o numero é 0111
    sb x24, 1029(x0)#numero 7 no display
    sb x0, 1027(x0)
    beq x0, x0, fim

jump4:# o numero começa com 1
    bne x6, x30, jump42 #se não for igual a 0, pula
    bne x7, x30, fim # se não for igual a 0, pula
    bne x28, x30, jump41 # se não for igual a 0, pula
    sb x25, 1029(x0) #numero 8 no display (1000)
    sb x27, 1027(x0)
    beq x0, x0, fim
jump41:#o numero começa com 100, então é 1001
    sb x26, 1029(x0) #numero 9 no display
    sb x27, 1027(x0)
    beq x0, x0, fim
jump42:#a unica alternativa para 11 é 1111, que é limpar o display
    sb x0, 1029(x0) #todos os leds do display desligados (0000000)
    sb x0, 1027(x0)
fim:
    halt
