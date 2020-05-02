#!/bin/bash

# Initial vars
RA="RA HERE"
CONFIG_INI="config.ini"
NOME="YOU NAME HERE"
CIDADE="CITY"
UF="UF"
EMAIL="my@email.com"

cd $HOME'/Área de Trabalho'

# Check if has directory with the name of RA and remove if has
if [ -d "$HOME/Área de Trabalho/$RA" ]; then
    echo "Removed directory $RA'"
    rm -rf $RA
fi

# Check if has directory with the name of RA and create if hasn't
if [ ! -d "$HOME/Área de Trabalho/$RA" ]; then
    echo "Created directory '$HOME/Área de Trabalho/$RA'"
    mkdir $RA
fi

cd $RA

# Create file config.ini
touch $CONFIG_INI

echo $NOME   >> $CONFIG_INI
echo $CIDADE >> $CONFIG_INI
echo $UF     >> $CONFIG_INI
echo $EMAIL  >> $CONFIG_INI

# Check if has directory with the name of Backup and remove if has
if [ -d "$HOME/Backup" ]; then
    echo "Removed directory Backup'"
    rm -rf $HOME/Backup
fi

# Check if has directory with the name of Backup and create if hasn't
if [ ! -d "$HOME/Backup" ]; then
    echo "Created directory '$HOME/Backup'"
    mkdir $HOME/Backup
fi

# Copy directory and all your content created to $HOME/Backup
cp -r $HOME/'Área de Trabalho'/$RA $HOME/Backup

# Access Backup/$RA directory
cd $HOME/Backup/$RA

# Display content file
cat $CONFIG_INI

# history > comandos.txt