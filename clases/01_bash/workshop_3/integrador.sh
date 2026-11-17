#!/bin/bash

fecha=$(date +%Y-%m-%d)
mkdir -p "$fecha"

cp *.txt "$fecha"/
codigo=$?

total=$(ls "$fecha"/*.txt | wc -l)

{
    echo "Reporte generado: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Carpeta destino: $fecha"
    echo "Archivos copiados: $total"
} > reporte.log

if [ $codigo -eq 0 ]
then
    echo "Éxito: se copiaron $total archivos .txt a $fecha"
else
    echo "Error: la copia falló con código $codigo"
fi
