#!/bin/bash

# Função para fazer o merge
merge() {
    local inicio=$1
    local meio=$2
    local fim=$3

    local tamEsquerdo=$((meio - inicio + 1))
    local tamDireito=$((fim - meio))

    local -a arrayEsquerdo
    local -a arrayDireito

    for ((i = 0; i < tamEsquerdo; i++)); do
        arrayEsquerdo[$i]=${array[$((inicio + i))]}
    done
    for ((j = 0; j < tamDireito; j++)); do
        arrayDireito[$j]=${array[$((meio + 1 + j))]}
    done

    local indiceEsquerdo=0
    local indiceDireito=0
    local indicePrincipal=$inicio
    while [ $indiceEsquerdo -lt $tamEsquerdo ] && [ $indiceDireito -lt $tamDireito ]; do
        if [[ $tipoOrdenacao == "numeros" ]]; then
            # Comparação para números
            if (( arrayEsquerdo[indiceEsquerdo] <= arrayDireito[indiceDireito] )); then
                array[indicePrincipal]=${arrayEsquerdo[indiceEsquerdo]}
                indiceEsquerdo=$((indiceEsquerdo + 1))
            else
                array[indicePrincipal]=${arrayDireito[indiceDireito]}
                indiceDireito=$((indiceDireito + 1))
            fi
        else
            # Comparação para letras
            if [[ ${arrayEsquerdo[indiceEsquerdo]} < ${arrayDireito[indiceDireito]} ]]; then
                array[indicePrincipal]=${arrayEsquerdo[indiceEsquerdo]}
                indiceEsquerdo=$((indiceEsquerdo + 1))
            else
                array[indicePrincipal]=${arrayDireito[indiceDireito]}
                indiceDireito=$((indiceDireito + 1))
            fi
        fi
        indicePrincipal=$((indicePrincipal + 1))
    done

    while [ $indiceEsquerdo -lt $tamEsquerdo ]; do
        array[indicePrincipal]=${arrayEsquerdo[indiceEsquerdo]}
        indiceEsquerdo=$((indiceEsquerdo + 1))
        indicePrincipal=$((indicePrincipal + 1))
    done

    while [ $indiceDireito -lt $tamDireito ]; do
        array[indicePrincipal]=${arrayDireito[indiceDireito]}
        indiceDireito=$((indiceDireito + 1))
        indicePrincipal=$((indicePrincipal + 1))
    done
}

# Função de Merge Sort
mergeSort() {
    local inicio=$1
    local fim=$2

    if [ $inicio -lt $fim ]; then
        local meio=$((inicio + (fim - inicio) / 2))

        mergeSort $inicio $meio
        mergeSort $((meio + 1)) $fim

        merge $inicio $meio $fim
    fi
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

# Chamar a função mergeSort
mergeSort 0 $(( ${#array[@]} - 1 ))

echo "Lista Ordenada: ${array[@]}"