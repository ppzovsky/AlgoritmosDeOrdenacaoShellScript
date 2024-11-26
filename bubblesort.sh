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
echo "Escolha o tipo de dados para ordenar:"
echo "1 - Números"
echo "2 - Letras"
read choice

if [ "$choice" -eq 1 ]; then
    orderType="numbers"
    echo "Digite os números para o array, separados por espaço:"
elif [ "$choice" -eq 2 ]; then
    orderType="letters"
    echo "Digite as letras para o array, separadas por espaço:"
else
    echo "Escolha inválida. Saindo."
    exit 1
fi

# Ler os valores do array
read -a array

echo "Original Array: ${array[@]}"

# Chamar a função bubbleSort
bubbleSort

echo "Sorted Array: ${array[@]}"