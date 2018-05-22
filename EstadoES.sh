#!/bin/bash

# 
# Autor: Leonardo Tadeu Diniz Leal

#Lista parametros txt em formato csv
nome=`grep -c "^$1:" /etc/passwd`

if [ "$nome" -ge 1 ]; then
	usuario=$1
else
	usuario=$USER
fi

# Constroi nome do arquivo
FileName="$(date +"%Y%m%d_%H":"%M")_EstadoES_$usuario.csv"

date="$(date +"%Y%m%d-%T")"
processor=`cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l`
nucleos=`grep -c processor /proc/cpuinfo`
memoria=`cat /proc/meminfo | grep MemTotal | cut -c 17-25`
usb=`lsusb | grep Bus -c`
usbativo=``
ethernet=`lspci | grep Ethernet`
vga=`lspci | grep VGA`
veleth=``
hdsize=`sudo fdisk -l | grep Disk | grep  /dev/sda | awk '{print $3}'`

echo $date "," $usuario "," $HOSTNAME "," $processor "," $nucleos "," $memoria "," $usb "," $usbativo "," $ethernet "," $veleth "," $hdsize "," $vga >> $FileName
