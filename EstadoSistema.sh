#!/bin/bash

# Recebe usuário como parametro, verifica se é valido e após isso lista as informações abaixo para usuário passado por parametro ou corrente (caso nao achar o que foi informado)
# Autor: Leonardo Tadeu Diniz Leal

#Verifica se o usuario passado como argumento eh valido
nome=`grep -c "^$1:" /etc/passwd`

if [ "$nome" -ge 1 ]; then
	usuario=$1
else
	usuario=$USER
fi

# Constroi nome do arquivo
FileName="$(date +"%Y%m%d_%T")_EstadoES_$usuario.txt"

totalps=$(ps -A --no-headers | wc -l) 
echo "Número total de processos ativos no sistema :" $totalps  >> $FileName
totalusuario=$(ps axo user | grep $usuario | wc -l)
echo "Número de processos ativos do usuário :" $totalusuario >> $FileName
echo "Nome do usuário :"  $usuario >> $FileName
totalsemusuario=$totalps-$totalusuario
echo "Quantidade de processos sendo executados excluindo-se os do usuário" $usuario : $totalusuario >> $FileName
echo "Quantidade de processos sendo executados como root :" $(ps axo user | grep root | wc -l) >> $FileName
