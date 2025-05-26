#!/bin/bash
# Calculadora simples
# Loop infinito para manter a calculadora rodando até o usuário sair
while true; do

    # Solicita ao usuário o primeiro número
    echo "Digite o primeiro valor:"
    read num1

    # Exibe as opções de operação
    echo "Escolha o número do operador:"
    echo "1. Somar"
    echo "2. Subtrair"
    echo "3. Multiplicar"
    echo "4. Dividir"
    echo "0. Sair"

    # Lê a escolha do usuário
    read operador

    # Se o usuário escolher 0, o script encerra
    if [ "$operador" -eq 0 ]; then
        echo "Saindo da calculadora..."
        break
    fi

    # Solicita o segundo número
    echo "Digite o segundo valor:"
    read num2

    # Verifica qual operação foi escolhida e executa o cálculo correspondente
    if [ "$operador" -eq 1 ]; then
        # Soma
        resultado=$(echo "scale=2; $num1 + $num2" | bc)
        echo "O resultado de $num1 + $num2 é = $resultado"

    elif [ "$operador" -eq 2 ]; then
        # Subtração
        resultado=$(echo "scale=2; $num1 - $num2" | bc)
        echo "O resultado de $num1 - $num2 é = $resultado"

    elif [ "$operador" -eq 3 ]; then
        # Multiplicação
        resultado=$(echo "scale=2; $num1 * $num2" | bc)
        echo "O resultado de $num1 * $num2 é = $resultado"

    elif [ "$operador" -eq 4 ]; then
        # Divisão (com verificação para evitar divisão por zero)
        if [ "$num2" -eq 0 ]; then
            echo "Erro: Divisão por zero não é permitida! Digite um número diferente de 0."
        else
            resultado=$(echo "scale=2; $num1 / $num2" | bc)
            echo "O resultado de $num1 / $num2 é = $resultado"
        fi

    else
        # Caso o usuário insira uma opção inválida
        echo "Nenhuma operação válida foi encontrada. Escolha um número entre 1 e 4."
    fi

done

