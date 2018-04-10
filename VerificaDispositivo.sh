#!/bin/bash

#Verifica se o dispositivo está em barramento PCI ou USB

dispositivo=$1
pci=`lspci | grep -c $dispositivo`
usb=`lsusb | grep -c $dispositivo`

if [ "$pci" == 0 ] && [ "$usb" == 0 ]; then
	echo "Dispositivo não encontrado"
else
	if [ "$pci" == 1 ]; then
		echo `lspci | grep $dispositivo`
	else
		echo `lsusb | grep $dispositivo`
	fi
fi
