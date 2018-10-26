#!/bin/bash

# Avaliação Progressiva / SOP0002
# Autor: Leonardo Tadeu Diniz Leal, Guilherme Rauvers

# Valores do cabecalho a serem impressos
cabecalho="Data,user,hostname,mem total,mem uso,swap disp,swap uso,processos,mem total processos"

# Constroi nome do arquivo, com data e hora atual
fileName="$(date +"%Y%m%d")_Memoria_<$USER>.txt"

# Data corrente
date="$(date +"%Y%m%d-%H%M%S")"

# Memória total
memoryTotal=`cat /proc/meminfo | grep MemTotal | awk {'print $2'}`

# Memória livre
memoryFree=`cat /proc/meminfo | grep MemFree |awk {'print $2'}`

# Memória em uso (memTotal - memFree)
memoryUsed=`expr $memoryTotal - $memoryFree`

# Memória Swap total
memorySwapTotal=`cat /proc/meminfo | grep SwapTotal | awk {'print $2'}`

# Memória Swap livre
memorySwapFree=`cat /proc/meminfo | grep SwapFree |awk {'print $2'}`

# Memória Swap em uso (memSwapTotal - memSwapFree)
memorySwapUsed=`expr $memorySwapTotal - $memorySwapFree`

# Quantidade de processos do usuário corrente
userProcess=$(ps axo user | grep $USER | wc -l)

# Quantidade de memória utilizada pelos processos correntes do usuário
userMemoryTotal=$( ps axo rss,user | grep $USER | awk '{sum+=$1} END {print sum}')

# Impressão

# Valida se o arquivo existe para incluir o cabecalho
if [ ! -f $fileName ]; then
	echo $cabecalho >> $fileName
else
# Caso arquivo exista, inclui as informacoes
	echo $date","$USER","$HOSTNAME","$memoryTotal","$memoryUsed","$memorySwapFree","$memorySwapUsed","$userProcess","$userMemoryTotal >> $fileName
fi






