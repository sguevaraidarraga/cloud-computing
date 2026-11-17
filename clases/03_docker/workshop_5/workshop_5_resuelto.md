# Taller 5 - MongoDB con Docker y Docker Compose

## Parte 1. MongoDB manual
![Levantar](img/parte_1_levantar.png)

Entré con `mongosh`, creé la base `tienda`, la colección `products`, inserté tres documentos y los consulté.

![Manual](img/parte_1_manual.png)

## Parte 2. Explorar colecciones y documentos
Probé `show dbs`, `show collections`, `countDocuments` y un filtro con `$gt`. También inserté una orden con una lista de productos dentro del mismo documento, que es un ejemplo de estructura anidada.

![Explorar](img/parte_2_explorar.png)

## Parte 3. Automatización con JavaScript
![Script y compose](img/parte_3_script_y_compose.png)

## Parte 4. Verificar la carga automática
Recreé todo desde cero con `docker compose down -v` y `up -d`. Las colecciones y los documentos aparecen solos.

![Recrear](img/parte_4_recrear.png)

![Verificar](img/parte_4_verificar.png)

## Parte 5. Reto de modelado
Amplié el script para crear `products`, `customers` y `orders`. Cada orden guarda los productos como una lista dentro del propio documento.

![Script reto](img/reto_script.png)

![Verificar reto](img/reto_verificar_1.png)
![Verificar reto](img/reto_verificar_2.png)

## Parte 6. Comparación PostgreSQL vs MongoDB
1. Una tabla tiene columnas fijas definidas de antemano. Una colección agrupa documentos y no obliga a que todos tengan la misma estructura.
2. Una fila es un registro plano con un valor por columna. Un documento es un objeto JSON que puede tener listas y objetos dentro.
3. Permiten guardar en un solo documento datos que van juntos, como una orden con sus productos. Se leen con una sola consulta y sin hacer joins.
4. Si un dato está repetido en muchos documentos y cambia, hay que actualizarlo en todos y es fácil que queden valores distintos. También aumenta el espacio usado.
5. Catálogos de productos, perfiles de usuario, contenido de sitios, datos de sensores de IoT y aplicaciones donde la estructura de los datos cambia con frecuencia.
6. Para el ejercicio universitario es más adecuado PostgreSQL. Hay relaciones claras entre estudiantes, cursos, profesores y matrículas, y se necesitan llaves foráneas, restricciones y consultas con joins que garanticen la consistencia.
