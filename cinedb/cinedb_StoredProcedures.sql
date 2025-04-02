-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cinedb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Dumping routines for database 'cinedb'
--
/*!50003 DROP PROCEDURE IF EXISTS `PeliculaPorId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PeliculaPorId`(IN IdPeliculaBusqueda INT)
BEGIN
	SELECT p.Pelicula, p.Sinopsis, p.Duracion, p.Actores, p.Estado, p.Observaciones , g.Genero 
	FROM Peliculas p
	INNER JOIN Generos g ON p.IdGenero = g.IdGenero
	WHERE p.IdPelicula = IdPeliculaBusqueda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PeliculasEnProyeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PeliculasEnProyeccion`(IN Fecha DATE)
BEGIN
	SELECT f.IdFuncion, f.IdPelicula, f.IdSala, s.Sala, p.Pelicula, f.FechaInicio, f.Precio
	FROM Funciones f
	INNER JOIN Peliculas p ON f.IdPelicula = p.IdPelicula
	INNER JOIN Salas s ON f.IdSala = s.IdSala
	WHERE DATE(f.FechaInicio) = Fecha 
    AND f.Estado='A'
	ORDER BY f.FechaInicio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReservarFuncion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservarFuncion`(IN IdFuncionReserva INT, IN Cantidad SMALLINT, IN DniReserva VARCHAR(11))
BEGIN
	DECLARE ButacasLibres SMALLINT;
    DECLARE Contador SMALLINT DEFAULT 0;

-- Control de variables no nulas
	IF(IdFuncionReserva IS NULL OR Cantidad IS NULL OR DniReserva IS NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: parámetros invalidos';

-- Control de Cantidad no negativa
    ELSEIF (Cantidad <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: la cantidad indicada debe ser mayor a cero';

-- Control de que la funcion exista
    ELSEIF NOT EXISTS (SELECT 1 FROM Funciones WHERE IdFuncion = IdFuncionReserva) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: no existe una funcion con ese id';

-- Control de que la funcion esté activa
    ELSEIF NOT EXISTS (SELECT 1 FROM Funciones WHERE IdFuncion = IdFuncionReserva AND Estado='A') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: la funcion indicada no está activa';
	END IF;

-- Conteo de butacas libres
    SELECT COUNT(*) INTO ButacasLibres FROM Butacas b
	INNER JOIN Funciones f ON b.IdSala = f.IdSala
    LEFT JOIN Reservas r ON f.IdFuncion = r .IdFuncion AND b.IdButaca = r.IdButaca
	WHERE f.IdFuncion = IdFuncionReserva
		AND b.Estado = 'A'
		AND r.IdReserva IS NULL;  -- Serán NULL aquellas que no esten reservadas, es decir, que no figuren en la tabla Reservas 
        
-- Control de butacas disponibles
    IF (Cantidad > ButacasLibres) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: no hay suficientes butacas disponibles';
    
-- Reserva de la cantidad de butacas ingresada
	ELSE
        START TRANSACTION;
			WHILE Contador < Cantidad DO
				INSERT INTO Reservas (IdFuncion, IdPelicula, IdSala, IdButaca, DNI, FechaAlta, FechaBaja, EstaPagada, Observaciones)
				SELECT 
					Funciones.IdFuncion, 
					Funciones.IdPelicula, 
					Funciones.IdSala, 
					Butacas.IdButaca, 
					DniReserva, 
					NOW(), 
					NULL, 
					'N', 
					NULL
				FROM Butacas
				INNER JOIN	Funciones ON Butacas.IdSala = Funciones.IdSala
				LEFT JOIN 	Reservas ON Funciones.IdFuncion = Reservas.IdFuncion AND Butacas.IdButaca = Reservas.IdButaca
				WHERE Funciones.IdFuncion = IdFuncionReserva
					AND Butacas.Estado = 'A'
					AND Reservas.IdReserva IS NULL
				LIMIT 1;

				SET Contador = Contador + 1;
			END WHILE;
		COMMIT;
	SELECT 'OK' AS Mensaje;	
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-02 10:42:27
