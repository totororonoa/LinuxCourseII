#!/bin/bash

# Obtener los archivos > 10MiB
grandes=$(find ./work/escenario_21/ -type f -size +10M | xargs ls -lh)

# Imprimirlos en ~/practica2/entrega/21_grandes.txt
echo "$grandes" > ~/practica2/entrega/21_grandes.txt
