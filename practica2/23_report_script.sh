#!/bin/bash

# Obtenemos la cantidad de ips unicas
uniq_ip=$(cat data/access.log | awk '{print $1}' | sort | uniq | wc -l)

# Obtenemos el top 15 de ip realizando peticiones
top15_ips=$(cat data/access.log | awk '{print $1}' | sort | uniq -c | sort -h -r | head -15)

# Obtenemos el top 10 rutas con 404
top10_404=$(cat data/access.log | awk '{$9 = 404; print $7}' | sort | uniq -c | head -10)

# Obtener la cantidad de errores 5XX
error_5xx=$(cat data/access.log | awk '$9 ~ "^5" {print $9}' | wc -l)

# Total de peticiones
total=$(cat data/access.log | wc -l)

# Calculo
perc
if (total -eq 0); then
	perc="No hay peticiones para el calculo"
else
	perc=$(echo "scale=2; $error_5xx / $total" | bc)
fi

cat << EOF
=== Informe de analisis a trazas ======

IPs consultando el servidor:
$uniq_ip

Estas fueron las 15 IPs que realizaron mas consultas:
$top15_ips

Este fue el top 10 de rutas con Not Found
$top10_404

Finalmente este es el porcentaje de 5XX
$perc
EOF
