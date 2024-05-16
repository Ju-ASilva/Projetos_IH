#Os testes foram enviados em um txt na mesma pasta desse arquivo
#Inicializando os resgitradores e suas variaveis
lw x9, a
lw x18, b
lw x19, c
lw x20, x

#Colocando inteiros em registradores para comparações
addi x21, x0, 5
addi x22, x0, 66
addi x23, x0, 15

#if e condicionais, se uma for verdadeira, o programa não entra no if
blt x9, x21, end # a < 5
bge x18, x22, end #b >= 66.
blt x19, x23, end #c < 15

#Adicionando 1 á variavel x
addi x20, x0, 1
halt 

#Caso ele não entre no if, o X não é incrementado e o programa termina
end:
	nop


#Dando valores ás variáveis
a: .word 6
b: .word 6
c: .word 20
x: .word 0
