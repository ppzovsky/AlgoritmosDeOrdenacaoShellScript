#!/bin/bash

# Função para Bubble Sort
bubbleSort() {
    local n=${#array[@]}

    for ((i = 0; i < n - 1; i++)); do
        for ((j = 0; j < n - i - 1; j++)); do
            if [[ $orderType == "numbers" ]]; then
                # Comparação para números
                if (( array[j] > array[j + 1] )); then
                    # Troca os elementos
                    temp=${array[j]}
                    array[j]=${array[j + 1]}
                    array[j + 1]=$temp
                fi
            else
                # Comparação para letras
                if [[ ${array[j]} > ${array[j + 1]} ]]; then
                    # Troca os elementos
                    temp=${array[j]}
                    array[j]=${array[j + 1]}
                    array[j + 1]=$temp
                fi
            fi
        done
    done
}

# Solicitar ao usuário o tipo de ordenação
echo "Escolha o tipo de ordenação:"
echo "1 - Numérica"
echo "2 - Alfabética"
read choice

if [ "$choice" -eq 1 ]; then
    orderType="numbers"
    echo "Digite os números, separados por espaço:"
elif [ "$choice" -eq 2 ]; then
    orderType="letters"
    echo "Digite as letras ou palavras, separadas por espaço:"
else
    echo "Escolha inválida. Saindo."
    exit 1
fi

# Ler os valores do array
read -a array

echo "Lista Original: ${array[@]}"

# Chamar a função bubbleSort
bubbleSort

echo "Lista Ordenada: ${array[@]}"