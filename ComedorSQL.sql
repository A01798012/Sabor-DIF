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
  PRIMARY KEY (`IdAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.administradores: ~0 rows (aproximadamente)
DELETE FROM `administradores`;

-- Volcando estructura para tabla comedor.comedor
CREATE TABLE IF NOT EXISTS `comedor` (
  `IdComedor` int(11) NOT NULL AUTO_INCREMENT,
  `NombreComedor` varchar(50) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `IdResponsable` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdComedor`) USING BTREE,
  UNIQUE KEY `IdComedor` (`NombreComedor`) USING BTREE,
  KEY `IdAdmin` (`IdResponsable`) USING BTREE,
  KEY `Id` (`IdComedor`),
  CONSTRAINT `FK_comedor_responsable` FOREIGN KEY (`IdResponsable`) REFERENCES `responsable` (`IdResponsable`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.comedor: ~40 rows (aproximadamente)
DELETE FROM `comedor`;
INSERT INTO `comedor` (`IdComedor`, `NombreComedor`, `Direccion`, `IdResponsable`) VALUES
	(1, 'CLosOlivos', 'Avenida Jalisco s/n Casa de la Juventud', 17),
	(2, 'CAdolfoLopezM', 'Privada Zacatecas no. 6', NULL),
	(3, 'CHogaresAtizapan', 'Hogares. Retorno de la Tranquilidad No. 8A', NULL),
	(4, 'CRinconadaBonfil', 'Calle Rosas MZ 4 Lt 15', NULL),
	(5, 'CSanJuanBosco', 'Calle Profesor Roberto Barrio No. 2', 19),
	(6, 'CMexicoNuevo', 'Pioneros de Rochdale esquina con calle Veracruz S/N', NULL),
	(7, 'CPeñitas', 'Mirador 1 #100 Colonia las peñitas', NULL),
	(8, 'CRanchoCastro', 'Calle del Puente s/n Rancho salón de usos múltiplos.', NULL),
	(9, 'CAmpVillasPalmas', 'Villas de las palmas Calle avena Mz. 5 Lt. 12', NULL),
	(10, 'CColUAM', 'UAM Calle Ingenieria Industrial Mz 24 Lt 45', NULL),
	(11, 'CCincoMayo', 'Calle Porfirio Díaz #27', NULL),
	(12, 'CBosqueIxtacala', 'Cerrada Sauces Mz 12 Lt 13- C #6 ', NULL),
	(13, 'CLomasTepalcapa', 'Calle seis # 14', NULL),
	(14, 'CVillasTorres', 'Calle Villa Alba Mza. 17 lote 9, esquina Bicentenario', NULL),
	(15, 'CProfCristobalHiguera', 'Calle Sandía # 24', NULL),
	(16, 'CLomasGuadalupe', 'Calle Vicente Guerrero Número 2', NULL),
	(17, 'CLazaroCardenas', 'Calle Chihuahua 151', NULL),
	(18, 'CChaparral', 'Calle Túcan # 48', NULL),
	(19, 'CPrimeroSeptiembre', 'Calle Belisario Dominguez # 44', NULL),
	(20, 'CLasAguidas', 'Pavo Real # 18', NULL),
	(21, 'CCerrito', 'Paseo Buenavista # 1', NULL),
	(22, 'CMexico86', 'Calle Italia # 53', NULL),
	(23, 'CVillasHacienda', 'Calle de la Chaparreras # 5', NULL),
	(24, 'CSeguiridadPublica', 'Remodelación', NULL),
	(25, 'CSanJuanIxtacala', 'Loma San Juan 194', NULL),
	(26, 'CPradosIxtacala', 'Clavel no.13 Mz 13 Lt 7 ', NULL),
	(27, 'CVillaJardin', 'Cda . Francisco Villa S/N', NULL),
	(28, 'CAmpCristobalHiguera', 'Calle Aldama #17', NULL),
	(29, 'CAdolfoLopezMateos', 'Calle Leon #1 esquina Coatzacoalcos', NULL),
	(30, 'CLomasSanMiguel', 'Jacarandas #5', NULL),
	(31, 'CSanJuanIxtacalaPlanoNorte', 'Boulevar Ignacio Zaragoza , Loma Alta #82', NULL),
	(32, 'C2LosOlivos', 'Calle Mérida numero 10', NULL),
	(33, 'CLomasMonteM', 'Calle Monte Real Mz 406 LT 11', NULL),
	(34, 'CTierraEnMedio', 'Hacienda de la Flor #14 ', NULL),
	(35, 'CCerroGrande', 'Calle Teotihuacan #15', NULL),
	(36, 'CAmpPenitas', 'Cda. Gardenias #3 ', NULL),
	(37, 'CSJoseJaral2', 'Calle Jazmín #22', NULL),
	(38, 'CSJoseJaral', 'Calle Clavelinas #24', NULL),
	(39, 'CAmplEmiZap', 'Av. Ejército Mexicano s/n', NULL),
	(40, 'CDIFCental', 'DIF Central. Av. Ruiz Cortines esq. Acambay', NULL);

-- Volcando estructura para tabla comedor.comensal
CREATE TABLE IF NOT EXISTS `comensal` (
  `IdComensal` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) NOT NULL,
  `ApellidoPaterno` varchar(100) DEFAULT NULL,
  `ApellidoMaterno` varchar(100) DEFAULT NULL,
  `CURP` varchar(18) NOT NULL,
  `Genero` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IdComensal`) USING BTREE,
  UNIQUE KEY `CURP` (`CURP`),
  UNIQUE KEY `IdPersona` (`IdComensal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.comensal: ~4 rows (aproximadamente)
DELETE FROM `comensal`;
INSERT INTO `comensal` (`IdComensal`, `Nombres`, `ApellidoPaterno`, `ApellidoMaterno`, `CURP`, `Genero`) VALUES
	(1, 'Miguel Angel', 'Figueroa', 'Andrade', 'FIAM691023HDFGNG07', 1),
	(2, 'Rosa Itzel', 'Figueroa', 'Rosas', 'FIRR030820MMCGSSA4', 2),
	(6, 'Dulce María', 'Rosas', 'Hernández', 'ROHD700629MDFSRL02', 2),
	(13, 'Jaime', 'Beltran', 'Hidalgo', 'GEJA020503M5KL45F2', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.comida: ~3 rows (aproximadamente)
DELETE FROM `comida`;
INSERT INTO `comida` (`IdComida`, `IdComedor`, `IdComensal`, `aportacion`, `fecha`, `IdRelacion`, `paraLlevar`) VALUES
	(2, 1, 2, 13, '2023-09-21', NULL, 0),
	(3, 1, 1, 13, '2023-09-21', 6, 0),
	(4, 1, 1, 13, '2023-09-21', NULL, 0);

-- Volcando estructura para tabla comedor.condicion
CREATE TABLE IF NOT EXISTS `condicion` (
  `IdCondicion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCondicion` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCondicion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.condicion: ~6 rows (aproximadamente)
DELETE FROM `condicion`;
INSERT INTO `condicion` (`IdCondicion`, `nombreCondicion`) VALUES
	(1, 'Discapacidad visual'),
	(2, 'Discapacidad auditiva'),
	(3, 'Discapacidad motriz'),
	(4, 'Discapacidad intelectual o cognitiva'),
	(5, 'Embarazada'),
	(6, 'Tercera edad');

-- Volcando estructura para tabla comedor.condicioncomensal
CREATE TABLE IF NOT EXISTS `condicioncomensal` (
  `IdCondicion` int(11) NOT NULL,
  `IdComensal` int(11) NOT NULL,
  PRIMARY KEY (`IdCondicion`,`IdComensal`) USING BTREE,
  KEY `FK_condicioncomensal_comensal` (`IdComensal`) USING BTREE,
  CONSTRAINT `FK_condicioncomensal_idcomensal` FOREIGN KEY (`IdComensal`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_condicioncomensal_idcondicion` FOREIGN KEY (`IdCondicion`) REFERENCES `condicion` (`IdCondicion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.condicioncomensal: ~1 rows (aproximadamente)
DELETE FROM `condicioncomensal`;
INSERT INTO `condicioncomensal` (`IdCondicion`, `IdComensal`) VALUES
	(1, 13);

-- Volcando estructura para tabla comedor.encuesta
CREATE TABLE IF NOT EXISTS `encuesta` (
  `IdEncuesta` int(11) NOT NULL AUTO_INCREMENT,
  `IdComedor` int(11) NOT NULL DEFAULT 0,
  `Higiene` int(11) NOT NULL DEFAULT 0,
  `Comida` int(11) NOT NULL DEFAULT 0,
  `Atencion` int(11) NOT NULL DEFAULT 0,
  `Tiempo` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IdEncuesta`),
  KEY `IdComedor` (`IdComedor`),
  CONSTRAINT `FK_encuesta_IdComedor` FOREIGN KEY (`IdComedor`) REFERENCES `comedor` (`IdComedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.encuesta: ~0 rows (aproximadamente)
DELETE FROM `encuesta`;

-- Volcando estructura para tabla comedor.relacionpersonadependiente
CREATE TABLE IF NOT EXISTS `relacionpersonadependiente` (
  `IdRelacion` int(11) NOT NULL AUTO_INCREMENT,
  `IdCuidador` int(11) NOT NULL,
  `IdDependiente` int(11) NOT NULL,
  PRIMARY KEY (`IdRelacion`),
  UNIQUE KEY `IdRelacion` (`IdRelacion`),
  KEY `IdResponsable` (`IdCuidador`) USING BTREE,
  KEY `FK_relacionPersonaDependiente` (`IdDependiente`),
  CONSTRAINT `FK_relacionPersonaDependiente` FOREIGN KEY (`IdDependiente`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_relacionPersonaDependiente_idComensal` FOREIGN KEY (`IdCuidador`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.relacionpersonadependiente: ~4 rows (aproximadamente)
DELETE FROM `relacionpersonadependiente`;
INSERT INTO `relacionpersonadependiente` (`IdRelacion`, `IdCuidador`, `IdDependiente`) VALUES
	(1, 1, 2),
	(6, 1, 6),
	(7, 2, 6),
	(8, 6, 2);

-- Volcando estructura para tabla comedor.responsable
CREATE TABLE IF NOT EXISTS `responsable` (
  `IdResponsable` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) NOT NULL,
  `ApellidoPaterno` varchar(100) NOT NULL,
  `ApellidoMaterno` varchar(100) NOT NULL,
  `Celular` bigint(20) DEFAULT NULL,
  `IdComedor` int(11) NOT NULL,
  `Contra` varchar(80) NOT NULL,
  PRIMARY KEY (`IdResponsable`) USING BTREE,
  UNIQUE KEY `IdAdmin` (`IdResponsable`) USING BTREE,
  UNIQUE KEY `Celular` (`Celular`),
  KEY `FK_responsableIdComedor` (`IdComedor`),
  CONSTRAINT `FK_responsableIdComedor` FOREIGN KEY (`IdComedor`) REFERENCES `comedor` (`IdComedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.responsable: ~2 rows (aproximadamente)
DELETE FROM `responsable`;
INSERT INTO `responsable` (`IdResponsable`, `Nombres`, `ApellidoPaterno`, `ApellidoMaterno`, `Celular`, `IdComedor`, `Contra`) VALUES
	(17, 'Marcos', 'Portillo', 'Morales', 554163289017, 1, '0000000000000006˜ðÊ­ÇÅ±NoB«â\\r~5Ù\0ÈPû±»á,@˜±•'),
	(19, 'Ana', 'Lopez', 'Chavez', 554269863520, 5, '0003306461220453UÎ\rLöwT¬	.WóýÈ×›t¡×†G{.“èâÃÐ');

-- Volcando estructura para tabla comedor.responsableabrecomedor
CREATE TABLE IF NOT EXISTS `responsableabrecomedor` (
  `IdAbreComedor` int(11) NOT NULL AUTO_INCREMENT,
  `IdComedor` int(11) NOT NULL,
  `Abierto` tinyint(4) NOT NULL DEFAULT 1,
  `Fecha` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`IdAbreComedor`) USING BTREE,
  KEY `IdComedor` (`IdComedor`),
  CONSTRAINT `FK_responsableabrecomedor_comedor` FOREIGN KEY (`IdComedor`) REFERENCES `comedor` (`IdComedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.responsableabrecomedor: ~2 rows (aproximadamente)
DELETE FROM `responsableabrecomedor`;
INSERT INTO `responsableabrecomedor` (`IdAbreComedor`, `IdComedor`, `Abierto`, `Fecha`) VALUES
	(1, 1, 1, '2023-09-21'),
	(2, 1, 1, '2023-09-26');

-- Volcando estructura para procedimiento comedor.mostrarComedores
DELIMITER //
CREATE PROCEDURE `mostrarComedores`()
BEGIN
SELECT NombreComedor FROM comedor;
END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.mostrarComensales
DELIMITER //
CREATE PROCEDURE `mostrarComensales`()
BEGIN

SELECT nombres, apellidoPaterno, apellidoMaterno FROM comensal;

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.mostrarCondicion
DELIMITER //
CREATE PROCEDURE `mostrarCondicion`()
BEGIN

SELECT nombreCondicion FROM condicion;

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.mostrarDependientes
DELIMITER //
CREATE PROCEDURE `mostrarDependientes`(
	IN `curpB` VARCHAR(18)
)
BEGIN

SELECT nombres, apellidoPaterno, apellidoMaterno, curp, genero FROM comensal WHERE IdComensal IN (SELECT relacionpersonadependiente.IdDependiente FROM relacionpersonadependiente 
JOIN comensal ON comensal.IdComensal = relacionpersonadependiente.IdCuidador WHERE IdComensal = (SELECT IdComensal FROM comensal WHERE curp = curpB));

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.notificarApertura
DELIMITER //
CREATE PROCEDURE `notificarApertura`(
	IN `comedorV` VARCHAR(50),
	IN `abierto` TINYINT,
	IN `fecha` DATE
)
BEGIN

INSERT INTO responsableabrecomedor (IdComedor, abierto, fecha) VALUES ((SELECT IdComedor FROM comedor WHERE NombreComedor = comedorV), abierto, fecha);

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarComensal
DELIMITER //
CREATE PROCEDURE `registrarComensal`(
	IN `nombresV` VARCHAR(50),
	IN `apellidoPaternoV` VARCHAR(50),
	IN `apellidoMaternoV` VARCHAR(50),
	IN `curpV` VARCHAR(18),
	IN `generoV` INT,
	IN `condicionV` VARCHAR(50)
)
BEGIN

INSERT INTO comensal (Nombres, ApellidoPaterno, ApellidoMaterno, curp, genero) VALUES (nombresV, apellidoPaternoV, apellidoMaternoV, curpV, generoV);
INSERT INTO condicioncomensal(IdComensal, IdCondicion) VALUES ((SELECT IdComensal FROM comensal WHERE curp = curpV ), (SELECT IdCondicion FROM condicion WHERE nombreCondicion = condicionV));

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarComida
DELIMITER //
CREATE PROCEDURE `registrarComida`(
	IN `CURPComensal` VARCHAR(18),
	IN `comedorV` VARCHAR(50),
	IN `aportacionV` INT,
	IN `paraLlevar` INT
)
BEGIN

INSERT INTO comida (IdComedor, IdComensal, aportacion, fecha, paraLlevar) VALUES ((SELECT IdComedor FROM comedor WHERE NombreComedor = comedorV), (SELECT IdComensal FROM comensal WHERE curp = CURPComensal), 
aportacionV, CURDATE(), paraLlevar);

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarComidaDependiente
DELIMITER //
CREATE PROCEDURE `registrarComidaDependiente`(
	IN `comedorV` VARCHAR(50),
	IN `CURPDependiente` VARCHAR(18),
	IN `CURPCuidador` VARCHAR(18),
	IN `aportacionV` INT,
	IN `paraLlevarV` INT
)
BEGIN

INSERT INTO comida (IdComedor, IdComensal, aportacion, fecha, IdRelacion, paraLlevar) VALUES ((SELECT IdComedor FROM comedor WHERE NombreComedor = comedorV), 
(SELECT IdComensal FROM comensal WHERE curp = CURPDependiente), aportacionV, CURDATE(), (SELECT IdRelacion FROM relacionpersonadependiente WHERE IdCuidador = (SELECT IdCuidador FROM comensal WHERE curp = CURPCuidador) AND IdDependiente = (SELECT IdDependiente FROM comensal WHERE curp = CURPDependiente)), paraLlevarV);

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarDependencia
DELIMITER //
CREATE PROCEDURE `registrarDependencia`(
	IN `CURPdependiente` VARCHAR(18),
	IN `CURPcuidador` VARCHAR(18)
)
BEGIN

INSERT INTO relacionpersonadependiente (IdCuidador, IdDependiente) VALUES ((SELECT IdComensal FROM comensal WHERE curp = CURPcuidador), (SELECT IdComensal FROM comensal WHERE curp = CURPdependiente));

END//
DELIMITER ;

-- Volcando estructura para función comedor.loginResponsable
DELIMITER //
CREATE FUNCTION `loginResponsable`(`v_NombreComedor` VARCHAR(50),
	`p_Password` VARCHAR(50)
) RETURNS int(11)
BEGIN
    DECLARE v_StoredPassword VARCHAR(80);
    DECLARE v_Salt VARCHAR(16);
    DECLARE v_HashedPassword VARCHAR(300);
    DECLARE p_Success INT;
    
    -- Obtener el valor de la contraseña almacenada y el salt asociado
    SELECT contra INTO v_StoredPassword FROM responsable WHERE IdComedor = (SELECT IdComedor FROM comedor WHERE nombreComedor = v_NombreComedor);
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

-- Volcando estructura para función comedor.login_admin
DELIMITER //
CREATE FUNCTION `login_admin`(`usuarioV` VARCHAR(50),
	`p_Password` VARCHAR(80)
) RETURNS int(11)
BEGIN

   DECLARE v_StoredPassword VARCHAR(80);
    DECLARE v_Salt VARCHAR(16);
    DECLARE v_HashedPassword VARCHAR(300);
    DECLARE p_Success INT;
    
    -- Obtener el valor de la contraseña almacenada y el salt asociado
    SELECT contra INTO v_StoredPassword FROM admin WHERE usuario = usuarioV;
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
