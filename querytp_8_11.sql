/* usuarios 10 registros */

INSERT INTO usuarios ( id_usuario , nombre_usuario , email_usuario )
VALUES 
(DEFAULT , 'Pedro Alfonso', 'pedroa@gmail.com'),
(DEFAULT , 'Ana Velazco' , 'anavelez@gmail.com'),
(DEFAULT , 'Teodoro Pitascho' , 'teodoro99@hotmail.com'),
(DEFAULT , 'Melisa Sanguinetti' , 'meliseweet@aol.com' ),
(DEFAULT , 'Celeste Perez' , 'celestequeen@gmail.com');

INSERT INTO usuarios ( id_usuario , nombre_usuario , email_usuario )
VALUES 
(2 , 'Juan j. Ogando', 'juancho78@gmail.com'),
(3 , 'Camila Centurion' , 'tinkybell91@gmail.com'),
(4 , 'Erica Martinez' , 'ppipi@hotmail.com'),
(5 , 'Jhhon Maxxwell' , 'j.maxx@aol.com' );

UPDATE usuarios
SET nombre_usuario='Celeste Correa'
WHERE id_usuario=14;

UPDATE usuarios
SET email_usuario='calesita2001@pepe.com'
WHERE id_usuario=10;

UPDATE usuarios
SET nombre_usuario='Jonny Bigboy'
WHERE id_usuario=5;

SELECT id_usuario, COUNT(1) AS 'TOTAL DE USUARIOS'
FROM usuarios;

SELECT email_usuario , count(1) As 'direcciones google'
FROM usuarios
WHERE email_usuario LIKE '%gmail.com';

SELECT email_usuario 
CASE 
    WHEN email_usuario (COUNT(LIKE'%gmail.com')) <5
    THEN 'LOWER USERS GMAIL'
    WHEN email_usuario (COUNT(LIKE'%gmail.com')) >5 
    THEN 'MEDIUM USERS GMAIL'
    END AS COUNT_USERS_GMAIL
FROM usuarios;

SELECT DISTINCT email_usuario
FROM usuarios
WHERE email_usuario LIKE '%gmail%';

SELECT nombre_usuario
FROM usuarios
WHERE nombre_usuario LIKE '%Perez%'
GROUP BY nombre_usuario;







/*  categorias 10 registros  */

INSERT INTO categorias ( id_categoria)
VALUES
('musica'),('mecanica'),('nautica'),('peliculas'),('filosofia'),('deporte'),('documentales');

UPDATE categorias
SET id_categoria= 'solo deporte'
WHERE id_categoria='deporte';

SELECT id_notas, COUNT(1)
FROM notas
WHERE  fk_id_categoria= 'solo deporte'
GROUP BY fk_id_categoria;

SELECT id_notas, COUNT(1)
FROM notas
WHERE  fk_id_categoria= 'filosofia' AND date_created= '2021-11-08'
GROUP BY fk_id_categoria;

SELECT id_notas, COUNT(1)
FROM notas
WHERE  fk_id_categoria= 'filosofia' AND date_created= '2021-11-07'
GROUP BY fk_id_categoria;



/* NOTAS 10 REGISTROS  */

INSERT INTO notas (id_notas, titulo,date_created,date_modif,descripcion,locked,fk_id_categoria,fk_id_usuario)
VALUES
(DEFAULT, 'La vida al aire libre', date(now()) ,NULL,'lorem ipsum', 'no', 'filosofia' , 6 );

INSERT INTO notas (id_notas, titulo,date_created,date_modif,descripcion,locked,fk_id_categoria,fk_id_usuario)
VALUES
(DEFAULT, 'PEPE CENTURION', date(now()) ,NULL,
'CORRIENDO CARRERAS POR EL AUTODROMO ALCANZÓ MUCHOS RECORDS EN CAMPEONATOS', 'no', 'solo deporte' , 8 );

INSERT INTO notas (id_notas, titulo,date_created,date_modif,descripcion,locked,fk_id_categoria,fk_id_usuario)
VALUES
(DEFAULT, 'la ley del mas fuerte', date(now()) ,NULL,
'pensandolo bien el tigre sobrevive si esta casando en grupo', 'si', 'documentales' ,11 );

INSERT INTO notas (id_notas,titulo,date_created,date_modif,descripcion,locked,fk_id_categoria,fk_id_usuario)
VALUES
(DEFAULT, 'el clavado de la muerte', date(now()) ,NULL,
'de 30 mts de altura hay atletas que se disponen a lograr tal record de clavados', 'si', 'solo deporte' ,12 );

INSERT INTO notas (id_notas,titulo,date_created,date_modif,descripcion,locked,fk_id_categoria,fk_id_usuario)
VALUES
(DEFAULT, 'mejor pelicula del siglo', date(now()) ,NULL,
'creo por mi gusto que es Games of The Trones', 'si', 'peliculas' ,10 );

INSERT INTO notas (id_notas,titulo,date_created,date_modif,descripcion,locked,fk_id_categoria,fk_id_usuario)
VALUES
(DEFAULT, 'mirar para adelante con vivir', date(now()) ,NULL,
'buenos documentales de national geographic', 'no', 'documentales' ,12 );

SELECT  nombre_usuario, email_usuario 
FROM usuarios;

SELECT * FROM NOTAS;