#!/bin/bash

# Avaliação progressiva 2 Questão 3
# Autor: Leonardo Tadeu Diniz Leal

# Crontab
# m h dom mon dow user	command
# 1  *    * * *   udesc   /home/udesc/Área de Trabalho/shell/Memoria.sh
#

# Constroi nome do arquivo
FileName="$(date +"%Y%m%d")_Memoria_<$USER>.txt"

date="$(date +"%Y%m%d-%H":"%M":"%S")"
memoryTotal=`cat /proc/meminfo | grep MemTotal | cut -c 17-25`
memoryFree=`cat /proc/meminfo | grep MemFree | cut -c 17-25`
memoryUsed=`expr $memoryTotal - $memoryFree`
memorySwapTotal=`cat /proc/meminfo | grep SwapTotal | cut -c 17-25`
memorySwapFree=`cat /proc/meminfo | grep SwapFree | cut -c 17-25`
memorySwapUsed=`expr $memorySwapTotal - $memorySwapFree`
userProcess=$(ps axo user | grep $USER | wc -l)
userProcessMemory=`ps aux | sort -r -n --key=4 | grep udesc | awk '{n+=$4} END {print n}'`

echo $date "," $USER "," $HOSTNAME "," $memoryTotal "," $memoryUsed "," $memorySwapFree "," $memorySwapUsed "," $userProcess "," $userProcessMemory  >> $FileName
