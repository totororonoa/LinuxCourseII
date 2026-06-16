#!/bin/bash

# Definimos umask para que solamente el usuario pueda leer y escribir
# los miembros del grupo solo puedan leer
# y los otros no tengan permisos
umask 117

# Crear un nuevo archivo para validar el umask
touch ./work/escenario_21/tmp/umask_test.txt

# Validamos y creamos entrega
echo $(ls -l ./work/escenario_21/tmp/umask_test.txt) > ~/practica2/entrega/21_umask.txt
