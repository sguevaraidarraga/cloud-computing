#!/bin/bash

read -p "Ingrese el nombre del directorio: " dir

if [ ! -d "$dir" ]
then
    echo "Error: el directorio $dir no existe"
    echo "$(date '+%Y-%m-%d %H:%M:%S') ERROR directorio $dir no existe" >> backup.log
    exit 1
fi

mkdir -p backup
fecha=$(date +%Y%m%d_%H%M%S)
archivo="backup/${dir}_${fecha}.tar.gz"

tar -czf "$archivo" "$dir"
estado=$?

cantidad=$(find "$dir" -type f | wc -l)
tamano=$(du -h "$archivo" | cut -f1)

if [ $estado -eq 0 ]
then
    resultado="EXITO"
else
    resultado="ERROR"
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') $resultado respaldo de $dir en $archivo" >> backup.log

echo "===== RESUMEN DEL RESPALDO ====="
echo "Fecha: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Archivos respaldados: $cantidad"
echo "Tamaño del respaldo: $tamano"
echo "Estado: $resultado"
