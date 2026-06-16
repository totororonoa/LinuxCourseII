#!/bin/bash

# Obtener la ruta de script hola.sh
path=$(find . -type f -iname "hola.sh")

# Agregar permisos de ejecucion unicamente al owner
# Permiso de lectura y escritura a miembros del grupo
# Permiso de lectura a otros
sudo chmod 764 "$path"

echo "$(ls -l $path)" > ~/practica2/entrega/21_ejecutable.txt
echo "$(which bash)" >> ~/practica2/entrega/21_ejecutable.txt
