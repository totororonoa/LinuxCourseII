#!/bin/bash

# Buscar todos los archivos en escenario_21/ cuyo nombre termine
# en .log sin distinguir mayusculas/minusculas.
logs=$(find ./work/escenario_21/ -type f -iname "*.log" | sort)

# Resultados a ~/practica2/entrega/21_logs.txt
echo "$logs" > ~/practica2/entrega/21_logs.txt
