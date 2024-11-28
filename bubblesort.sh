#!/bin/bash

# Função para Bubble Sort
bubbleSort() {
    local tamanho=${#array[@]}

    for ((i = 0; i < tamanho - 1; i++)); do
        for ((j = 0; j < tamanho - i - 1; j++)); do
            if [[ $tipoOrdenacao == "numeros" ]]; then
                # Comparação para números
                if (( array[j] > array[j + 1] )); then
                    # Troca os elementos
                    temporario=${array[j]}
                    array[j]=${array[j + 1]}
                    array[j + 1]=$temporario
                fi
            else
                # Comparação para letras
                if [[ ${array[j]} > ${array[j + 1]} ]]; then
                    # Troca os elementos
                    temporario=${array[j]}
                    array[j]=${array[j + 1]}
                    array[j + 1]=$temporario
                fi
            fi
        done
    done
}

# Solicitar ao usuário o tipo de ordenação
echo "Escolha o tipo de ordenação:"
echo "1 - Numérica"
echo "2 - Alfabética"
read escolha

if [ "$escolha" -eq 1 ]; then
    tipoOrdenacao="numeros"
    echo "Digite os números, separados por espaço:"
elif [ "$escolha" -eq 2 ]; then
    tipoOrdenacao="letras"
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
