#!/bin/bash

UMBRAL=80

echo "===== MONITOR DEL CONTENEDOR ====="
echo "Hostname: $(hostname)"
echo "Usuario: $(whoami)"
echo "Fecha: $(date)"
echo "Directorio: $(pwd)"

echo "===== DISCO ====="
df -h
df -h --output=target,pcent | tail -n +2 | while read punto uso
do
    numero=${uso%\%}
    if [ "$numero" -gt "$UMBRAL" ]
    then
        echo "ADVERTENCIA: $punto supera el $UMBRAL% ($uso)"
    fi
done

echo "===== PROCESOS ====="
echo "Procesos activos (aprox): $(ps aux | wc -l)"

echo "===== FIN DEL REPORTE ====="
echo "El diagnóstico terminó correctamente"
