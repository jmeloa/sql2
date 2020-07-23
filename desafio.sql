#ejercicio 1
CREATE DATABASE nuevadb;

#ejercicio2
CREATE TABLE peliculas(
id SERIAL PRIMARY KEY,
titulo VARCHAR,
año INT,
director VARCHAR);

CREATE TABLE reparto(
Id SERIAL PRIMARY KEY,
pelicula_id INT,
nombre VARCHAR,
FOREIGN KEY (pelicula_id) REFERENCES peliculas(id));

#ejercicio3
\copy peliculas FROM 'C:\peliculas.csv' csv header;
\copy reparto (pelicula_id, nombre) FROM 'c:\reparto.csv' csv;

#ejercicio4
SELECT * FROM peliculas INNER JOIN reparto ON peliculas.id=reparto.pelicula_id where titulo='Titanic';

#ejercicio5
SELECT * FROM peliculas INNER JOIN reparto ON peliculas.id=reparto.pelicula_id where reparto.nombre='Harrison Ford';

#ejercicio6
SELECT director, COUNT(*) as cantidad FROM peliculas GROUP BY director ORDER BY cantidad desc LIMIT 10;

#ejercicio7
SELECT COUNT (DISTINCT nombre) FROM reparto;

#ejercicio8
SELECT titulo FROM peliculas WHERE año>=1990 AND año<=1999 order by titulo asc;

#ejercicio9
SELECT peliculas.titulo, reparto.nombre FROM reparto INNER JOIN peliculas ON reparto.pelicula_id=peliculas.id where peliculas.año=2001;

#ejercicio10
SELECT reparto.nombre FROM reparto WHERE pelicula_id IN (SELECT id FROM peliculas ORDER BY año DESC LIMIT 1);







