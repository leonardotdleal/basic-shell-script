#!/bin/bash

# Recebe usuário como parametro, verifica se é valido e após isso lista as informações abaixo para usuário passado por parametro ou corrente (caso nao achar o que foi informado)
# Autor: Leonardo Tadeu Diniz Leal, Guilherme Rauvers


#Verifica se o usuario passado como argumento é valido
nome=`grep -c "^$1:" /etc/passwd`

#compara se o usuário existe no arquivo /etc/passwd, caso sim retorna o usuário do parametro, senão pega o usuario atual
if [ "$nome" -ge 1 ]; then
        usuario=$1
else
         usuario=$USER
fi

# Constroi nome do arquivo, com data e hora atual
FileName="$(date +"%Y%m%d_%T")_EstadoSistema_$usuario.txt"

#lista todos os processos e armazena em totalps, "wc -l" conta a quantidade de processos.
totalps=$(ps -A --no-headers | wc -l) 

#Imprime na tela o total de processos do sistema e escreve a saida no arquivo
echo "Número total de processos ativos no sistema :" $totalps  >> $FileName

#Busca o total de processos do usuário , "ps axo user" lista todos processos, e o "grep" filtra somente os processos do usuário, "wc -l" lista a quantidade de processos 
totalusuario=$(ps axo user | grep $usuario | wc -l)
echo "Número de processos ativos do usuário :" $totalusuario >> $FileName

#Pega todos os processos e pid executando do usuario e lista somente o primeiro com o comando "head -n 1"
processoAntigo=$(ps axo fname,pid,user | grep $usuario | head -n 1 | awk {'print $1" "$2'} ) 
echo "Processo mais antigo:" $processoAntigo >> $FileName

#Print do nome do usuário
echo "Nome do usuário :"  $usuario >> $FileName

#contabiliza o total de procesos - os processos do usuario e printa na tela, o comando "`expr`" é utilizado para efetuar a operacao dos valores antes a atribuição
totalsemusuario=`expr $totalps - $totalusuario`
echo "Quantidade de processos sendo executados excluindo-se os do usuário" $usuario : $totalsemusuario >> $FileName

#Imprime a quantidade de processos do root
echo "Quantidade de processos sendo executados como root :" $(ps axo user | grep root | wc -l) >> $FileName
