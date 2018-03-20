#!/bin/bash

echo "Informe o nome do programa: "
read processName

if (ps ax | grep -v grep | grep processName) then 
echo "$processName is running."
else
echo "$processName is not running."
fi
