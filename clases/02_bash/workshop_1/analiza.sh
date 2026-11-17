#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Uso: $0 archivo1 [archivo2 ...]"
    exit 1
fi

for archivo in "$@"
do
    if [ ! -f "$archivo" ]
    then
        echo "Error: el archivo $archivo no existe"
        continue
    fi
    echo "===== Análisis de: $archivo ====="
    echo "Líneas: $(wc -l < "$archivo")"
    echo "Palabras: $(wc -w < "$archivo")"
    echo "Caracteres: $(wc -m < "$archivo")"
    echo "Líneas con ERROR: $(grep -c ERROR "$archivo")"
    echo "Líneas con WARN: $(grep -c WARN "$archivo")"
done
