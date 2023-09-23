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
  `ApellidoPaterno` varchar(100) NOT NULL,
  `ApellidoMaterno` varchar(100) NOT NULL,
  `CURP` varchar(18) NOT NULL,
  `Genero` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IdComensal`) USING BTREE,
  UNIQUE KEY `CURP` (`CURP`),
  UNIQUE KEY `IdPersona` (`IdComensal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.comensal: ~3 rows (aproximadamente)
DELETE FROM `comensal`;
INSERT INTO `comensal` (`IdComensal`, `Nombres`, `ApellidoPaterno`, `ApellidoMaterno`, `CURP`, `Genero`) VALUES
	(1, 'Miguel Angel', 'Figueroa', 'Andrade', 'FIAM691023HDFGNG07', 1),
	(2, 'Rosa Itzel', 'Figueroa', 'Rosas', 'FIRR030820MMCGSSA4', 2),
	(6, 'Dulce María', 'Rosas', 'Hernández', 'ROHD700629MDFSRL02', 2);

-- Volcando estructura para tabla comedor.comida
CREATE TABLE IF NOT EXISTS `comida` (
  `IdComida` int(11) NOT NULL AUTO_INCREMENT,
  `IdComedor` int(11) NOT NULL DEFAULT 0,
  `IdComensal` int(11) NOT NULL,
  `aportacion` int(11) NOT NULL DEFAULT 13,
  `fecha` date NOT NULL DEFAULT curdate(),
  `IdRelacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdComida`),
  UNIQUE KEY `IdComida` (`IdComida`),
  KEY `FK_comida_persona` (`IdComensal`) USING BTREE,
  KEY `FK_comida_idResponsable` (`IdRelacion`) USING BTREE,
  KEY `FK_comida_comedor` (`IdComedor`),
  CONSTRAINT `FK_comida_comedor` FOREIGN KEY (`IdComedor`) REFERENCES `comedor` (`IdComedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comida_idComensal` FOREIGN KEY (`IdComensal`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comida_relacionpersonadependiente` FOREIGN KEY (`IdRelacion`) REFERENCES `relacionpersonadependiente` (`IdRelacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.comida: ~2 rows (aproximadamente)
DELETE FROM `comida`;
INSERT INTO `comida` (`IdComida`, `IdComedor`, `IdComensal`, `aportacion`, `fecha`, `IdRelacion`) VALUES
	(2, 1, 2, 13, '2023-09-21', NULL),
	(3, 1, 1, 13, '2023-09-21', 6),
	(4, 1, 1, 13, '2023-09-21', NULL);

-- Volcando estructura para tabla comedor.discapacidadcomensal
CREATE TABLE IF NOT EXISTS `discapacidadcomensal` (
  `IdDiscapacidad` int(11) NOT NULL,
  `IdComensal` int(11) NOT NULL,
  PRIMARY KEY (`IdDiscapacidad`,`IdComensal`) USING BTREE,
  KEY `FK_discapacidadcomensal_comensal` (`IdComensal`),
  CONSTRAINT `FK_DiscapacidadIdDiscapacidad` FOREIGN KEY (`IdDiscapacidad`) REFERENCES `discapacidades` (`IdDiscapacidades`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_discapacidadcomensal_comensal` FOREIGN KEY (`IdComensal`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.discapacidadcomensal: ~1 rows (aproximadamente)
DELETE FROM `discapacidadcomensal`;
INSERT INTO `discapacidadcomensal` (`IdDiscapacidad`, `IdComensal`) VALUES
	(5, 2);

-- Volcando estructura para tabla comedor.discapacidades
CREATE TABLE IF NOT EXISTS `discapacidades` (
  `IdDiscapacidades` int(11) NOT NULL AUTO_INCREMENT,
  `Discapacidad` varchar(50) NOT NULL,
  PRIMARY KEY (`IdDiscapacidades`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.discapacidades: ~7 rows (aproximadamente)
DELETE FROM `discapacidades`;
INSERT INTO `discapacidades` (`IdDiscapacidades`, `Discapacidad`) VALUES
	(1, 'Visual'),
	(2, 'Auditiva'),
	(3, 'Motriz'),
	(4, 'Visual'),
	(5, 'Auditiva'),
	(6, 'Motriz'),
	(7, 'Intelectual o Cognitiva');

-- Volcando estructura para tabla comedor.relacionpersonadependiente
CREATE TABLE IF NOT EXISTS `relacionpersonadependiente` (
  `IdRelacion` int(11) NOT NULL AUTO_INCREMENT,
  `IdCuidador` int(11) NOT NULL DEFAULT 0,
  `IdDependiente` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IdRelacion`),
  UNIQUE KEY `IdRelacion` (`IdRelacion`),
  KEY `IdResponsable` (`IdCuidador`) USING BTREE,
  KEY `FK_relacionPersonaDependiente` (`IdDependiente`),
  CONSTRAINT `FK_relacionPersonaDependiente` FOREIGN KEY (`IdDependiente`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_relacionPersonaDependiente_idComensal` FOREIGN KEY (`IdCuidador`) REFERENCES `comensal` (`IdComensal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.relacionpersonadependiente: ~2 rows (aproximadamente)
DELETE FROM `relacionpersonadependiente`;
INSERT INTO `relacionpersonadependiente` (`IdRelacion`, `IdCuidador`, `IdDependiente`) VALUES
	(1, 1, 2),
	(6, 1, 6),
	(7, 2, 6);

-- Volcando estructura para tabla comedor.responsable
CREATE TABLE IF NOT EXISTS `responsable` (
  `IdResponsable` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) NOT NULL,
  `ApellidoPaterno` varchar(100) NOT NULL,
  `ApellidoMaterno` varchar(100) NOT NULL,
  `Celular` bigint(20) DEFAULT NULL,
  `IdComedor` int(11) NOT NULL DEFAULT 0,
  `Contra` varchar(80) NOT NULL,
  PRIMARY KEY (`IdResponsable`) USING BTREE,
  UNIQUE KEY `IdAdmin` (`IdResponsable`) USING BTREE,
  UNIQUE KEY `Celular` (`Celular`),
  KEY `FK_responsableIdComedor` (`IdComedor`),
  CONSTRAINT `FK_responsableIdComedor` FOREIGN KEY (`IdComedor`) REFERENCES `comedor` (`IdComedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.responsable: ~1 rows (aproximadamente)
DELETE FROM `responsable`;
INSERT INTO `responsable` (`IdResponsable`, `Nombres`, `ApellidoPaterno`, `ApellidoMaterno`, `Celular`, `IdComedor`, `Contra`) VALUES
	(17, 'Marcos', 'Portillo', 'Morales', 554163289017, 1, '0000000000000006˜ðÊ­ÇÅ±NoB«â\\r~5Ù\0ÈPû±»á,@˜±•'),
	(19, 'Ana', 'Lopez', 'Chavez', 554269863520, 5, '0003306461220453UÎ\rLöwT¬	.WóýÈ×›t¡×†G{.“èâÃÐ');

-- Volcando estructura para tabla comedor.responsableabrecomedor
CREATE TABLE IF NOT EXISTS `responsableabrecomedor` (
  `IdAbreComedor` int(11) NOT NULL DEFAULT 0,
  `IdComedor` int(11) NOT NULL DEFAULT 0,
  `Abierto` tinyint(4) NOT NULL DEFAULT 1,
  `Fecha` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`IdAbreComedor`) USING BTREE,
  KEY `IdComedor` (`IdComedor`),
  CONSTRAINT `FK_responsableabrecomedor_comedor` FOREIGN KEY (`IdComedor`) REFERENCES `comedor` (`IdComedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla comedor.responsableabrecomedor: ~0 rows (aproximadamente)
DELETE FROM `responsableabrecomedor`;
INSERT INTO `responsableabrecomedor` (`IdAbreComedor`, `IdComedor`, `Abierto`, `Fecha`) VALUES
	(0, 1, 1, '2023-09-21');

-- Volcando estructura para procedimiento comedor.loginResponsable
DELIMITER //
CREATE PROCEDURE `loginResponsable`()
BEGIN
    DECLARE v_StoredPassword VARCHAR(80);
    DECLARE v_Salt VARCHAR(64);
    DECLARE v_IdComedor VARCHAR(50);
    DECLARE v_Contra VARCHAR(80);
    DECLARE p_Resultado INT;
	 
	 SELECT contra, Salt INTO v_StoredPassword, v_Salt
    FROM responsable
    WHERE IdComedor = v_IdComedor;
    
    IF v_StoredPassword IS NOT NULL THEN
    SET v_Salt = SUBSTRING(v_StoredPassword, 1, 16);
	 SET v_Contra = CONCAT(v_Salt, UNHEX(SHA2(CONCAT(v_Salt, v_Contra), 256)));
	 IF v_StoredPassword = v_Contra THEN
            SET p_Resultado = 1; 
        ELSE
            SET p_Resultado = 0;
        END IF;
    ELSE
        SET p_Resultado = -1;
    END IF;
END//
DELIMITER ;

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

-- Volcando estructura para procedimiento comedor.mostrarDependientes
DELIMITER //
CREATE PROCEDURE `mostrarDependientes`()
BEGIN

DECLARE curpB VARCHAR(18); 

SELECT nombres, apellidoPaterno, apellidoMaterno, curp, genero FROM comensal WHERE IdComensal IN (SELECT relacionpersonadependiente.IdDependiente FROM relacionpersonadependiente 
JOIN comensal ON comensal.IdComensal = relacionpersonadependiente.IdCuidador WHERE IdComensal = (SELECT IdComensal FROM comensal WHERE curp = curpB));

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.notificarApertura
DELIMITER //
CREATE PROCEDURE `notificarApertura`()
BEGIN


DECLARE comedorV VARCHAR(50);
DECLARE abierto TINYINT;
DECLARE fecha DATE;

INSERT INTO responsableabrecomedor (IdComedor, abierto, fecha) VALUES ((SELECT IdComedor FROM comedor WHERE NombreComedore = comedorV), abierto, fecha);

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarComensal
DELIMITER //
CREATE PROCEDURE `registrarComensal`()
BEGIN

DECLARE nombresV VARCHAR(50);
DECLARE apellidoPaternoV VARCHAR(50);
DECLARE apellidoMaternoV VARCHAR(50);
DECLARE curpV VARCHAR(18);
DECLARE generoV INT;

INSERT INTO comensal (Nombres, ApellidoPaterno, ApellidoMaterno, curp, genero, IdRelacion) VALUES (nombresV, apellidoPaternoV, apellidoMaternoV, curpV, generoV);

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarComida
DELIMITER //
CREATE PROCEDURE `registrarComida`()
BEGIN

DECLARE CURPComensal VARCHAR(18);
DECLARE comedorV VARCHAR(50);
DECLARE aportacionV INT;

INSERT INTO comida (IdComedor, IdComensal, aportacion, fecha) VALUES ((SELECT IdComedor FROM comedor WHERE NombreComedor = comedorV), (SELECT IdComensal FROM comensal WHERE curp = CURPComensal), aportacionV, CURDATE());

END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarComidaDependiente
DELIMITER //
CREATE PROCEDURE `registrarComidaDependiente`()
BEGIN

DECLARE CURPDepende VARCHAR(18);
DECLARE CURPDependiente VARCHAR(18);

#INSERT INTO comida (IdComedor, IdComensal, aportacion, fecha) VALUES ((SELECT IdComedor FROM comedor WHERE NombreComedor = comedorV), (SELECT IdComensal FROM comensal WHERE curp = CURPComensal), aportacionV, CURDATE());


END//
DELIMITER ;

-- Volcando estructura para procedimiento comedor.registrarDependencia
DELIMITER //
CREATE PROCEDURE `registrarDependencia`()
BEGIN

DECLARE CURPdependiente VARCHAR(18);
DECLARE CURPcuidador VARCHAR(18);


INSERT INTO relacionpersonadependiente (IdCuidador, IdDependiente) VALUES ((SELECT IdComensal FROM comensal WHERE curp = CURPcuidador), (SELECT IdComensal FROM comensal WHERE curp = CURPdependiente));

END//
DELIMITER ;

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
DELETE FROM relacionpersonadependiente WHERE IdDeoendiente = variable;

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
DECLARE Salt VARCHAR(64);

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
