CREATE DATABASE  IF NOT EXISTS `entregable1ro_8_11` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `entregable1ro_8_11`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: entregable1ro_8_11
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` varchar(10) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `id_categoria_UNIQUE` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id_notas` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `date_created` date NOT NULL,
  `date_modif` date NOT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `locked` varchar(2) DEFAULT NULL,
  `fk_id_categoria` varchar(10) DEFAULT NULL,
  `fk_id_usuario` int NOT NULL,
  PRIMARY KEY (`id_notas`),
  UNIQUE KEY `id_notas_UNIQUE` (`id_notas`),
  KEY `fk_categorias_idx` (`fk_id_categoria`),
  KEY `fk_usuario_idx` (`fk_id_usuario`),
  CONSTRAINT `fk_categorias` FOREIGN KEY (`fk_id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(15) NOT NULL,
  `email_usuario` varchar(40) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-07 16:40:39




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

SELECT * FROM usuarios;

SELECT * categorias;


