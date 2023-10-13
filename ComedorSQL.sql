-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.1.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para comedor
CREATE DATABASE IF NOT EXISTS `comedor` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `comedor`;

-- Volcando estructura para tabla comedor.administradores
CREATE TABLE IF NOT EXISTS `administradores` (
  `IdAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) NOT NULL,
  `Contra` varchar(80) NOT NULL,
  PRIMARY KEY (`IdAdmin`),
  UNIQUE KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla comedor.comedor
CREATE TABLE IF NOT EXISTS `comedor` (
  `IdComedor` int(11) NOT NULL AUTO_INCREMENT,
  `NombreComedor` varchar(50) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `IdResponsable` int(11) DEFAULT NULL,
  `Activo` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`IdComedor`) USING BTREE,
  UNIQUE KEY `IdComedor` (`NombreComedor`) USING BTREE,
  KEY `IdAdmin` (`IdResponsable`) USING BTREE,
  KEY `Id` (`IdComedor`),
  CONSTRAINT `FK_comedor_responsable` FOREIGN KEY (`IdResponsable`) REFERENCES `responsable` (`IdResponsable`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla comedor.comensal
CREATE TABLE IF NOT EXISTS `comensal` (
  `IdComensal` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) NOT NULL,
  `ApellidoPaterno` varchar(100) DEFAULT NULL,
  `ApellidoMaterno` varchar(100) DEFAULT NULL,
  `CURP` varchar(18) DEFAULT NULL,
  `Genero` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IdComensal`) USING BTREE,
  UNIQUE KEY `CURP` (`CURP`),
  UNIQUE KEY `IdPersona` (`IdComensal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla comedor.comida
CREATE TABLE IF NOT EXISTS `comida` (
  `IdComida` int(11) NOT NULL AUTO_INCREMENT,
  `IdComedor` int(11) NOT NULL,
  `IdComensal` int(11) NOT NULL,
  `aportacion` int(11) NOT NULL DEFAULT 13,
  `fecha` date NOT NULL DEFAULT curdate(),
  `IdRelacion` int(11) DEFAULT NULL,
  `paraLlevar` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdComida`),
  UNIQUE KEY `IdComida` (`IdComida`),
  KEY `FK_comida_persona` (`IdComensal`) USING BTREE,
  KEY `FK_comida_idResponsable` (`IdRelacion`) USING BTREE,
  KEY `FK_comida_comedor` (`IdComedor`),
  CONSTRAINT `FK_comida_comedor` FOREIGN KEY (`IdComedor`) REFERENCES `comedor` (`IdComedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comida_idComensal` FOREIGN KEY (`IdComensal`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comida_relacionpersonadependiente` FOREIGN KEY (`IdRelacion`) REFERENCES `relacionpersonadependiente` (`IdRelacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla comedor.condicion
CREATE TABLE IF NOT EXISTS `condicion` (
  `IdCondicion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCondicion` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCondicion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla comedor.condicioncomensal
CREATE TABLE IF NOT EXISTS `condicioncomensal` (
  `IdCondicion` int(11) NOT NULL,
  `IdComensal` int(11) NOT NULL,
  PRIMARY KEY (`IdCondicion`,`IdComensal`) USING BTREE,
  KEY `FK_condicioncomensal_comensal` (`IdComensal`) USING BTREE,
  CONSTRAINT `FK_condicioncomensal_idcomensal` FOREIGN KEY (`IdComensal`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_condicioncomensal_idcondicion` FOREIGN KEY (`IdCondicion`) REFERENCES `condicion` (`IdCondicion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla comedor.encuesta
CREATE TABLE IF NOT EXISTS `encuesta` (
  `IdEncuesta` int(11) NOT NULL AUTO_INCREMENT,
  `IdComedor` int(11) NOT NULL DEFAULT 0,
  `Higiene` int(11) NOT NULL DEFAULT 0,
  `Sabor` int(11) NOT NULL DEFAULT 0,
  `Atencion` int(11) NOT NULL DEFAULT 0,
  `Tiempo` int(11) NOT NULL DEFAULT 0,
  `Lugar` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdEncuesta`),
  KEY `IdComedor` (`IdComedor`),
  CONSTRAINT `FK_encuesta_IdComedor` FOREIGN KEY (`IdComedor`) REFERENCES `comedor` (`IdComedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla comedor.relacionpersonadependiente
CREATE TABLE IF NOT EXISTS `relacionpersonadependiente` (
  `IdRelacion` int(11) NOT NULL AUTO_INCREMENT,
  `IdCuidador` int(11) NOT NULL,
  `IdDependiente` int(11) NOT NULL,
  PRIMARY KEY (`IdDependiente`,`IdCuidador`) USING BTREE,
  UNIQUE KEY `IdRelacion` (`IdRelacion`),
  KEY `FK_IdCuidador` (`IdCuidador`),
  CONSTRAINT `FK_IdCuidador` FOREIGN KEY (`IdCuidador`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_IdDependiente` FOREIGN KEY (`IdDependiente`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla comedor.responsable
CREATE TABLE IF NOT EXISTS `responsable` (
  `IdResponsable` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) NOT NULL,
  `ApellidoPaterno` varchar(100) NOT NULL,
  `ApellidoMaterno` varchar(100) NOT NULL,
  `Celular` varchar(50) DEFAULT NULL,
  `IdComedor` int(11) NOT NULL,
  `Contra` varchar(80) NOT NULL,
  PRIMARY KEY (`IdResponsable`) USING BTREE,
  UNIQUE KEY `IdAdmin` (`IdResponsable`) USING BTREE,
  UNIQUE KEY `IdComedor` (`IdComedor`),
  UNIQUE KEY `Celular` (`Celular`),
  CONSTRAINT `FK_responsableIdComedor` FOREIGN KEY (`IdComedor`) REFERENCES `comedor` (`IdComedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla comedor.responsableabrecomedor
CREATE TABLE IF NOT EXISTS `responsableabrecomedor` (
  `IdAbreComedor` int(11) NOT NULL AUTO_INCREMENT,
  `IdComedor` int(11) NOT NULL,
  `Abierto` tinyint(4) NOT NULL DEFAULT 1,
  `Fecha` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`IdAbreComedor`) USING BTREE,
  KEY `IdComedor` (`IdComedor`),
  CONSTRAINT `FK_responsableabrecomedor_comedor` FOREIGN KEY (`IdComedor`) REFERENCES `comedor` (`IdComedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento comedor.graficaCantidadCondicion
DELIMITER //
CREATE PROCEDURE `graficaCantidadCondicion`()
BEGIN

SELECT
    nombreCondicion,
    COUNT(condicioncomensal.IdComensal) AS TotalComensales
FROM
    condicion 
LEFT JOIN
    condicioncomensal  ON condicion.IdCondicion = condicioncomensal.IdCondicion
GROUP BY
	nombreCondicion
ORDER BY
   nombreCondicion;

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.graficaComidasDiarias
DELIMITER //
CREATE PROCEDURE `graficaComidasDiarias`(
	IN `IdComedorV` INT,
	IN `fechaV` DATE
)
BEGIN

SELECT
    COUNT(IF(aportacion = 13, 1, NULL)) AS TotalComidasVendidas,
    COUNT(IF(aportacion = 0, 1, NULL)) AS TotalComidasDonadas
FROM
    comida
WHERE 
	 IdComedor = IdComedorV AND fecha LIKE fechaV;

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.graficaComidasMensuales
DELIMITER //
CREATE PROCEDURE `graficaComidasMensuales`(
	IN `IdComedorV` INT,
	IN `fechaV` INT
)
BEGIN
SELECT
    IdComedor, DATE_FORMAT(fecha, '%Y-%m') AS Mes,
    COUNT(IF(aportacion = 13, 1, NULL)) AS TotalComidasVendidas,
    COUNT(IF(aportacion = 0, 1, NULL)) AS TotalComidasDonadas

FROM
    comida
    
WHERE 
	 IdComedor = IdComedorV AND DATE_FORMAT(fecha, '%Y-%m') LIKE DATE_FORMAT(fechaV, '%Y-%m');

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.graficaComidasParaLlevarDiarias
DELIMITER //
CREATE PROCEDURE `graficaComidasParaLlevarDiarias`(
	IN `IdComedorV` INT,
	IN `fechaV` DATE
)
BEGIN

SELECT
    IdComedor, DATE_FORMAT(fecha, '%Y-%m-%d') AS Dia,
    SUM(CASE WHEN paraLlevar = 1 THEN 1 ELSE 0 END) AS ComidasParaLlevar,
    SUM(CASE WHEN paraLlevar = 0 THEN 1 ELSE 0 END) AS ComidasEnComedor
FROM
    comida
WHERE 
	IdComedor = IdComedorV AND fecha LIKE fechaV;

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.graficaComidasParaLlevarMensuales
DELIMITER //
CREATE PROCEDURE `graficaComidasParaLlevarMensuales`(
	IN `IdComedorV` INT,
	IN `fechaV` DATE
)
BEGIN
SELECT
    IdComedor, DATE_FORMAT(fecha, '%Y-%m') AS Mes,
    SUM(CASE WHEN paraLlevar = 1 THEN 1 ELSE 0 END) AS ComidasParaLlevar,
    SUM(CASE WHEN paraLlevar = 0 THEN 1 ELSE 0 END) AS ComidasEnComedor
FROM
    comida
    
WHERE 
	 IdComedor = IdComedorV AND DATE_FORMAT(fecha, '%Y-%m') LIKE DATE_FORMAT(fechaV, '%Y-%m');

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.graficaEncuesta
DELIMITER //
CREATE PROCEDURE `graficaEncuesta`(
	IN `IdComedorV` INT
)
BEGIN

SELECT 
	   COUNT(IdEncuesta) AS NumeroEncuestas, 
		SUM(Higiene) AS Higiene, 
		SUM(Tiempo) AS Tiempo, 
		SUM(Sabor) AS Sabor, 
		SUM(Atencion) AS Atencion, 
		SUM(Lugar) AS Lugar
FROM 
	   encuesta
WHERE 
	   IdComedor = IdComedorV;


END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.mostrarComedores
DELIMITER //
CREATE PROCEDURE `mostrarComedores`()
BEGIN
SELECT IdComedor, NombreComedor FROM comedor;
END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.mostrarComensales
DELIMITER //
CREATE PROCEDURE `mostrarComensales`()
BEGIN

SELECT IdComensal, nombres, apellidoPaterno, apellidoMaterno FROM comensal;

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.mostrarCondicion
DELIMITER //
CREATE PROCEDURE `mostrarCondicion`()
BEGIN

SELECT IdCondicion, nombreCondicion FROM condicion;

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.mostrarDependientes
DELIMITER //
CREATE PROCEDURE `mostrarDependientes`(
	IN `IdComensalV` INT
)
BEGIN

SELECT IdComensal, nombres, apellidoPaterno, apellidoMaterno FROM comensal WHERE IdComensal IN (SELECT relacionpersonadependiente.IdDependiente FROM relacionpersonadependiente 
JOIN comensal ON comensal.IdComensal = relacionpersonadependiente.IdCuidador WHERE IdComensal = IdComensalV);

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.mostrarDonadasVendidas
DELIMITER //
CREATE PROCEDURE `mostrarDonadasVendidas`(
	IN `IdComedorV` INT
)
BEGIN

SELECT 
    COUNT(IF(aportacion = 13,1 , NULL)) AS TotalComidasVendidas,
    COUNT(IF(aportacion = 0, 1, NULL)) AS TotalComidasDonadas
FROM
    comida
WHERE fecha = CURDATE() AND IdComedor LIKE IdComedorV;
END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.notificarApertura
DELIMITER //
CREATE PROCEDURE `notificarApertura`(
	IN `comedorV` INT,
	IN `abierto` INT
)
BEGIN

INSERT INTO responsableabrecomedor (IdComedor, abierto, fecha) VALUES (comedorV, abierto, CURDATE());

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarComensal
DELIMITER //
CREATE PROCEDURE `registrarComensal`(
	IN `nombresV` VARCHAR(50),
	IN `apellidoPaternoV` VARCHAR(50),
	IN `apellidoMaternoV` VARCHAR(50),
	IN `curpV` VARCHAR(50),
	IN `generoV` INT
)
BEGIN

INSERT INTO comensal (Nombres, ApellidoPaterno, ApellidoMaterno, curp, genero) VALUES (nombresV, apellidoPaternoV, apellidoMaternoV, curpV, generoV);

SELECT IdComensal FROM comensal WHERE curp = curpV;

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarComida
DELIMITER //
CREATE PROCEDURE `registrarComida`(
	IN `IdComensalV` INT,
	IN `IdComedorV` INT,
	IN `aportacionV` INT,
	IN `paraLlevar` INT
)
BEGIN

INSERT INTO comida (IdComedor, IdComensal, aportacion, fecha, paraLlevar) VALUES (IdComedorV, IdComensalV, 
aportacionV, CURDATE(), paraLlevar);

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarComidaDependiente
DELIMITER //
CREATE PROCEDURE `registrarComidaDependiente`(
	IN `comedorV` INT,
	IN `IdDependienteV` INT,
	IN `IdCuidadorV` INT,
	IN `aportacionV` INT,
	IN `paraLlevarV` INT
)
BEGIN

INSERT INTO comida (IdComedor, IdComensal, aportacion, fecha, IdRelacion, paraLlevar) VALUES (comedorV, 
IdDependienteV, aportacionV, CURDATE(), (SELECT IdRelacion FROM relacionpersonadependiente WHERE IdCuidador = IdCuidadorV AND IdDependiente = IdDependienteV), paraLlevarV);

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarCondiciones
DELIMITER //
CREATE PROCEDURE `registrarCondiciones`(
	IN `IdComensalV` INT,
	IN `IdCondicionV` INT
)
BEGIN


INSERT INTO condicioncomensal (IdComensal, IdCondicion) VALUES (IdComensalV, IdCondicionV);


END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarDependencia
DELIMITER //
CREATE PROCEDURE `registrarDependencia`(
	IN `IdDependienteV` INT,
	IN `IdCuidadorV` INT
)
BEGIN

INSERT INTO relacionpersonadependiente (IdCuidador, IdDependiente) VALUES (IdCuidadorV, IdDependienteV);

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarEncuesta
DELIMITER //
CREATE PROCEDURE `registrarEncuesta`(
	IN `IdComedor` INT,
	IN `atencion` INT,
	IN `higiene` INT,
	IN `sabor` INT,
	IN `lugar` INT,
	IN `tiempo` INT
)
BEGIN

INSERT INTO encuesta (IdComedor, Higiene, Sabor, Atencion, Tiempo, Lugar) VALUES (IdComedor, atencion, higiene, sabor, tiempo, lugar);

END//
DELIMITER ;

-- Volcando estructura para función comedor.loginAdmin
DELIMITER //
CREATE FUNCTION `loginAdmin`(`usuarioV` VARCHAR(50),
	`p_Password` VARCHAR(80)
) RETURNS int(11)
BEGIN

   DECLARE v_StoredPassword VARCHAR(80);
    DECLARE v_Salt VARCHAR(16);
    DECLARE v_HashedPassword VARCHAR(300);
    DECLARE p_Success INT;
    
    -- Obtener el valor de la contraseña almacenada y el salt asociado
    SELECT contra INTO v_StoredPassword FROM administradores WHERE usuario = usuarioV;
    SELECT SUBSTRING(v_StoredPassword, 1, 16) INTO v_Salt;
   
    -- Calcular el hash de la contraseña ingresada con el salt
    SET v_HashedPassword = CONCAT(v_Salt, UNHEX(SHA2(CONCAT(v_Salt, p_Password), 256)));
    
    -- Comparar el hash calculado con el almacenado y establecer p_Success en 1 si coinciden
    IF v_HashedPassword = v_StoredPassword THEN
        SET p_Success = 1;
    ELSE
        SET p_Success = 0;
    END IF;
    
    RETURN p_Success;

END//
DELIMITER ;

-- Volcando estructura para función comedor.loginResponsable
DELIMITER //
CREATE FUNCTION `loginResponsable`(`v_Comedor` INT,
	`p_Password` VARCHAR(50)
) RETURNS int(11)
BEGIN
    DECLARE v_StoredPassword VARCHAR(80);
    DECLARE v_Salt VARCHAR(16);
    DECLARE v_HashedPassword VARCHAR(300);
    DECLARE p_Success INT;
    
    SELECT contra INTO v_StoredPassword FROM responsable WHERE IdComedor = v_Comedor;
    SELECT SUBSTRING(v_StoredPassword, 1, 16) INTO v_Salt;
   
    SET v_HashedPassword = CONCAT(v_Salt, UNHEX(SHA2(CONCAT(v_Salt, p_Password), 256)));
    
    IF v_HashedPassword = v_StoredPassword THEN
        SET p_Success = 1;
    ELSE
        SET p_Success = 0;
    END IF;
    RETURN p_Success;
END//
DELIMITER ;

-- Volcando estructura para disparador comedor.TRG_administradores_before_insert_password
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TRG_administradores_before_insert_password` BEFORE INSERT ON `administradores` FOR EACH ROW BEGIN

DECLARE usuario VARCHAR(50);
DECLARE contra VARCHAR(80);
DECLARE Salt VARCHAR(16);

SET usuario = NEW.usuario;
SET Salt = LPAD(CONV(RAND() * 9999999999999999, 10, 16), 16, '0');
SET NEW.contra = CONCAT(Salt, UNHEX(SHA2(CONCAT(Salt, NEW.contra), 256)));


END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador comedor.TRG_comedor_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TRG_comedor_before_delete` BEFORE DELETE ON `comedor` FOR EACH ROW BEGIN 
DECLARE variable INT;
SET variable = OLD.IdComedor;

DELETE FROM comida WHERE IdComedor = variable;
DELETE FROM responsable WHERE IdComedor = variable;
DELETE FROM responsableabrecomedor WHERE IdComedor = variable;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador comedor.TRG_comensal_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TRG_comensal_before_delete` BEFORE DELETE ON `comensal` FOR EACH ROW BEGIN 
DECLARE variable INT;
SET variable = OLD.IdComensal;

DELETE FROM comida WHERE IdComensal = variable;
DELETE FROM relacionpersonadependiente WHERE IdCuidador = variable;
DELETE FROM relacionpersonadependiente WHERE IdDependiente = variable;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador comedor.TRG_relacionpersonadependiente_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TRG_relacionpersonadependiente_before_delete` BEFORE DELETE ON `relacionpersonadependiente` FOR EACH ROW BEGIN 
DECLARE variable INT;
SET variable = OLD.IdRelacion;

DELETE FROM comida WHERE IdRelacion = variable;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador comedor.TRG_responsable_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TRG_responsable_before_delete` BEFORE DELETE ON `responsable` FOR EACH ROW BEGIN 
DECLARE variable INT;
SET variable = OLD.IdResponsable;

DELETE FROM comedor WHERE IdResponsable = variable;
DELETE FROM responsableabrecomedor WHERE IdResponsable = variable;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador comedor.TRG_responsable_before_insert_password
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TRG_responsable_before_insert_password` BEFORE INSERT ON `responsable` FOR EACH ROW BEGIN

DECLARE nombres VARCHAR(100);
DECLARE IdResponsable INT;
DECLARE apellidoPaterno VARCHAR(100);
DECLARE apellidoMaterno VARCHAR(100);
DECLARE celular BIGINT;
DECLARE IdComedor VARCHAR(50);
DECLARE contra VARCHAR(80);
DECLARE Salt VARCHAR(16);

SET nombres = NEW.nombres;
SET IdResponsable = NEW.IdResponsable;
SET apellidoPaterno = NEW.apellidoPaterno;
SET apellidoMaterno = NEW.apellidoMaterno;
SET celular = NEW.celular;
SET IdComedor = NEW.IdComedor;
SET Salt = LPAD(CONV(RAND() * 9999999999999999, 10, 16), 16, '0');
SET NEW.contra = CONCAT(Salt, UNHEX(SHA2(CONCAT(Salt, NEW.contra), 256)));

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
