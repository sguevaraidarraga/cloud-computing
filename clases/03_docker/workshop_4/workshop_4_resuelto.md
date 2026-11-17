# Taller 4 - PostgreSQL con Docker y Docker Compose

## Parte 1. Construcción manual
![Levantar](img/parte_1_levantar.png)

## Parte 2. Crear la estructura a mano con psql
Entré con `psql`, creé el esquema `academia`, las tablas `students` y `courses`, inserté datos y los consulté.

![Manual](img/parte_2_manual.png)

Después eliminé todo con `docker compose down -v` para probar la automatización desde cero.

## Parte 3. Scripts de inicialización
![Scripts SQL](img/parte_3_scripts_sql.png)

## Parte 4. Montar los scripts y el volumen
![Compose con volumen](img/parte_4_compose_con_volumen.png)

## Parte 5. Verificación de la carga automática
Después de `docker compose down -v` y `docker compose up -d`, el esquema, las tablas y los datos aparecen solos. La carpeta `/docker-entrypoint-initdb.d` solo se ejecuta cuando el directorio de datos está vacío, por eso hay que borrar el volumen con `-v` para repetir la prueba.

![Automático](img/parte_5_automatico.png)

## Parte 6. Reto
Agregué el script `03-reto.sql` con `teachers` y `enrollments`, las llaves foráneas y datos de prueba.

![Script reto](img/reto_script.png)

Eliminé el volumen y volví a levantar. Todo se reconstruyó automáticamente.

![Reconstruido](img/reto_reconstruido.png)

Consulta que une las cuatro tablas para comprobar que las relaciones funcionan.

![Join](img/reto_consulta_join.png)
