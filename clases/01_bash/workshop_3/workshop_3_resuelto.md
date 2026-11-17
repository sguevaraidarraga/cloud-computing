# Taller 3 - Bash

## Ejercicios 1 al 3. Primer script, variables y entrada
![Ejercicios 1 a 3](img/ejercicios_1_3.png)

## Ejercicios 4 al 6. Condicional, for y while
![Ejercicios 4 a 6](img/ejercicios_4_6.png)

## Ejercicios 7 al 9. Funciones, parámetros y código de salida
![Ejercicios 7 a 9](img/ejercicios_7_9.png)

## Ejercicio 10. Proyecto integrador
Script `integrador.sh`:

![Script integrador](img/ejercicio_10_script.png)

Ejecución:

![Ejecución integrador](img/ejercicio_10_ejecucion.png)

## Desafío final. backup.sh
Script `backup.sh`:

![Script backup](img/desafio_script.png)

Ejecución con un directorio válido y con uno que no existe:

![Ejecución backup](img/desafio_ejecucion.png)

## Preguntas de reflexión
1. Un script permite repetir la misma tarea muchas veces sin escribir todo otra vez. Además reduce errores humanos, ahorra tiempo y deja un procedimiento documentado que otros pueden usar.
2. Uso `for` cuando sé de antemano cuántas veces o sobre qué elementos voy a repetir, por ejemplo recorrer una lista de archivos. Uso `while` cuando debo repetir mientras se cumpla una condición y no sé cuántas vueltas serán.
3. `$?` guarda el código de salida del último comando ejecutado. Un `0` significa que todo salió bien y cualquier otro número indica que hubo un error.
4. Porque si el archivo o la carpeta no existe, el comando puede fallar, dar resultados incorrectos o incluso dañar datos. Validar antes permite mostrar un mensaje claro y detener el script a tiempo.
5. Se pueden programar con `cron` o `systemd timers` para hacer respaldos, limpiar logs o revisar el estado de los servicios. En la nube se usan en scripts de arranque de las instancias y en pipelines de despliegue. En dispositivos IoT sirven para recolectar datos de sensores, enviarlos a un servidor y reiniciar servicios si fallan.
