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

-- Volcando datos para la tabla comedor.administradores: ~5 rows (aproximadamente)
DELETE FROM `administradores`;
INSERT INTO `administradores` (`IdAdmin`, `Usuario`, `Contra`) VALUES
	(1, 'cisco', '0000000000000006˜ðÊ­ÇÅ±NoB«â\\r~5Ù\0ÈPû±»á,@˜±•'),
	(2, 'Arturo', '0000000000000002ý¾júwwP«Æ–ž¡ßˆ‹tEî¨ºZ’Ã²Oö'),
	(3, 'Ares', '0000000000000005Ý×ð5úë»S–üÂäý÷¸Üô-~¢,²K‘³Ÿ'),
	(4, 'Sofia', '0000000000000009y^_ç±Œ‹7L 7#§3DM5òöe5?Mˆo¾RÙ'),
	(5, 'Rosa', '00015D61B596B099uDÕÍ­T1ŸL«j¸Yù>¡ZýRVówX§');

-- Volcando datos para la tabla comedor.comedor: ~40 rows (aproximadamente)
DELETE FROM `comedor`;
INSERT INTO `comedor` (`IdComedor`, `NombreComedor`, `Direccion`, `IdResponsable`, `Activo`) VALUES
	(1, 'CLosOlivos', 'Avenida Jalisco s/n Casa de la Juventud', 17, NULL),
	(2, 'CAdolfoLopezM', 'Privada Zacatecas no. 6', NULL, NULL),
	(3, 'CHogaresAtizapan', 'Hogares. Retorno de la Tranquilidad No. 8A', NULL, NULL),
	(4, 'CRinconadaBonfil', 'Calle Rosas MZ 4 Lt 15', NULL, NULL),
	(5, 'CSanJuanBosco', 'Calle Profesor Roberto Barrio No. 2', 19, NULL),
	(6, 'CMexicoNuevo', 'Pioneros de Rochdale esquina con calle Veracruz S/N', NULL, NULL),
	(7, 'CPeñitas', 'Mirador 1 #100 Colonia las peñitas', NULL, NULL),
	(8, 'CRanchoCastro', 'Calle del Puente s/n Rancho salón de usos múltiplos.', NULL, NULL),
	(9, 'CAmpVillasPalmas', 'Villas de las palmas Calle avena Mz. 5 Lt. 12', NULL, NULL),
	(10, 'CColUAM', 'UAM Calle Ingenieria Industrial Mz 24 Lt 45', NULL, NULL),
	(11, 'CCincoMayo', 'Calle Porfirio Díaz #27', NULL, NULL),
	(12, 'CBosqueIxtacala', 'Cerrada Sauces Mz 12 Lt 13- C #6 ', NULL, NULL),
	(13, 'CLomasTepalcapa', 'Calle seis # 14', NULL, NULL),
	(14, 'CVillasTorres', 'Calle Villa Alba Mza. 17 lote 9, esquina Bicentenario', NULL, NULL),
	(15, 'CProfCristobalHiguera', 'Calle Sandía # 24', NULL, NULL),
	(16, 'CLomasGuadalupe', 'Calle Vicente Guerrero Número 2', NULL, NULL),
	(17, 'CLazaroCardenas', 'Calle Chihuahua 151', NULL, NULL),
	(18, 'CChaparral', 'Calle Túcan # 48', NULL, NULL),
	(19, 'CPrimeroSeptiembre', 'Calle Belisario Dominguez # 44', NULL, NULL),
	(20, 'CLasAguidas', 'Pavo Real # 18', NULL, NULL),
	(21, 'CCerrito', 'Paseo Buenavista # 1', NULL, NULL),
	(22, 'CMexico86', 'Calle Italia # 53', NULL, NULL),
	(23, 'CVillasHacienda', 'Calle de la Chaparreras # 5', NULL, NULL),
	(24, 'CSeguiridadPublica', 'Remodelación', NULL, NULL),
	(25, 'CSanJuanIxtacala', 'Loma San Juan 194', NULL, NULL),
	(26, 'CPradosIxtacala', 'Clavel no.13 Mz 13 Lt 7 ', NULL, NULL),
	(27, 'CVillaJardin', 'Cda . Francisco Villa S/N', NULL, NULL),
	(28, 'CAmpCristobalHiguera', 'Calle Aldama #17', NULL, NULL),
	(29, 'CAdolfoLopezMateos', 'Calle Leon #1 esquina Coatzacoalcos', NULL, NULL),
	(30, 'CLomasSanMiguel', 'Jacarandas #5', NULL, NULL),
	(31, 'CSanJuanIxtacalaPlanoNorte', 'Boulevar Ignacio Zaragoza , Loma Alta #82', NULL, NULL),
	(32, 'C2LosOlivos', 'Calle Mérida numero 10', NULL, NULL),
	(33, 'CLomasMonteM', 'Calle Monte Real Mz 406 LT 11', NULL, NULL),
	(34, 'CTierraEnMedio', 'Hacienda de la Flor #14 ', NULL, NULL),
	(35, 'CCerroGrande', 'Calle Teotihuacan #15', NULL, NULL),
	(36, 'CAmpPenitas', 'Cda. Gardenias #3 ', NULL, NULL),
	(37, 'CSJoseJaral2', 'Calle Jazmín #22', NULL, NULL),
	(38, 'CSJoseJaral', 'Calle Clavelinas #24', NULL, NULL),
	(39, 'CAmplEmiZap', 'Av. Ejército Mexicano s/n', NULL, NULL),
	(40, 'CDIFCental', 'DIF Central. Av. Ruiz Cortines esq. Acambay', NULL, NULL);

-- Volcando datos para la tabla comedor.comensal: ~8 rows (aproximadamente)
DELETE FROM `comensal`;
INSERT INTO `comensal` (`IdComensal`, `Nombres`, `ApellidoPaterno`, `ApellidoMaterno`, `CURP`, `Genero`) VALUES
	(1, 'Miguel Angel', 'Figueroa', 'Andrade', 'FIAM691023HDFGNG07', 1),
	(2, 'Rosa Itzel', 'Figueroa', 'Rosas', 'FIRR030820MMCGSSA4', 2),
	(6, 'Dulce María', 'Rosas', 'Hernández', 'ROHD700629MDFSRL02', 2),
	(13, 'Jaime', 'Beltran', 'Hidalgo', 'GEJA020503M5KL45F2', 1),
	(14, 'Emma', 'Gutierrez', 'Cardenas', 'EGR1234567OKLMSNLP', 2),
	(15, 'Tilin', 'Til', 'Ti', 'FLNAFJKSBDKJF', 1),
	(16, 'Tilin', 'Ti', 'ti', 'JHADJBDJ', 1),
	(18, 'Tilin', 'Ti', 'ti', 'JHADJBmjrh4DJ', 1);

-- Volcando datos para la tabla comedor.comida: ~15 rows (aproximadamente)
DELETE FROM `comida`;
INSERT INTO `comida` (`IdComida`, `IdComedor`, `IdComensal`, `aportacion`, `fecha`, `IdRelacion`, `paraLlevar`) VALUES
	(2, 1, 2, 13, '2023-09-21', NULL, 0),
	(3, 1, 1, 13, '2023-09-21', 6, 0),
	(4, 1, 1, 13, '2023-09-21', NULL, 0),
	(5, 2, 6, 13, '2023-10-09', NULL, 1),
	(6, 2, 13, 13, '2023-10-09', NULL, 0),
	(7, 2, 14, 13, '2023-10-09', NULL, 0),
	(8, 1, 6, 13, '2023-10-09', NULL, 0),
	(9, 1, 13, 13, '2023-10-09', NULL, 1),
	(10, 1, 14, 13, '2023-10-09', NULL, 0),
	(11, 1, 1, 0, '2023-10-10', NULL, 0),
	(12, 1, 2, 0, '2023-10-10', NULL, 0),
	(13, 1, 6, 0, '2023-10-10', NULL, 0),
	(14, 2, 1, 0, '2023-10-10', NULL, 0),
	(15, 2, 2, 0, '2023-10-10', NULL, 0),
	(16, 2, 6, 0, '2023-10-10', NULL, 1);

-- Volcando datos para la tabla comedor.condicion: ~12 rows (aproximadamente)
DELETE FROM `condicion`;
INSERT INTO `condicion` (`IdCondicion`, `nombreCondicion`) VALUES
	(1, 'Discapacidad visual'),
	(2, 'Discapacidad auditiva'),
	(3, 'Discapacidad motriz'),
	(4, 'Discapacidad intelectual o cognitiva'),
	(5, 'Embarazada'),
	(6, 'Tercera edad'),
	(7, 'Migrantes'),
	(8, 'Diabetes'),
	(9, 'Hipertensión'),
	(10, 'Cáncer'),
	(11, 'Sobrepeso u obesidad'),
	(12, 'Comunidades indígenas');

-- Volcando datos para la tabla comedor.condicioncomensal: ~2 rows (aproximadamente)
DELETE FROM `condicioncomensal`;
INSERT INTO `condicioncomensal` (`IdCondicion`, `IdComensal`) VALUES
	(2, 1),
	(1, 13);

-- Volcando datos para la tabla comedor.encuesta: ~6 rows (aproximadamente)
DELETE FROM `encuesta`;
INSERT INTO `encuesta` (`IdEncuesta`, `IdComedor`, `Higiene`, `Sabor`, `Atencion`, `Tiempo`, `Lugar`) VALUES
	(1, 1, 9, 9, 7, 8, 8),
	(2, 1, 10, 10, 8, 8, 8),
	(3, 1, 5, 8, 3, 8, 8),
	(4, 3, 9, 9, 7, 8, 8),
	(5, 3, 10, 10, 8, 8, 8),
	(6, 3, 5, 8, 3, 8, 8);

-- Volcando datos para la tabla comedor.relacionpersonadependiente: ~5 rows (aproximadamente)
DELETE FROM `relacionpersonadependiente`;
INSERT INTO `relacionpersonadependiente` (`IdRelacion`, `IdCuidador`, `IdDependiente`) VALUES
	(1, 1, 2),
	(6, 1, 6),
	(7, 2, 6),
	(8, 6, 2),
	(9, 13, 1);

-- Volcando datos para la tabla comedor.responsable: ~2 rows (aproximadamente)
DELETE FROM `responsable`;
INSERT INTO `responsable` (`IdResponsable`, `Nombres`, `ApellidoPaterno`, `ApellidoMaterno`, `Celular`, `IdComedor`, `Contra`) VALUES
	(17, 'Marcos', 'Portillo', 'Morales', 554163289017, 1, '0000000000000006˜ðÊ­ÇÅ±NoB«â\\r~5Ù\0ÈPû±»á,@˜±•'),
	(19, 'Ana', 'Lopez', 'Chavez', 554269863520, 7, '0003306461220453UÎ\rLöwT¬	.WóýÈ×›t¡×†G{.“èâÃÐ');

-- Volcando datos para la tabla comedor.responsableabrecomedor: ~3 rows (aproximadamente)
DELETE FROM `responsableabrecomedor`;
INSERT INTO `responsableabrecomedor` (`IdAbreComedor`, `IdComedor`, `Abierto`, `Fecha`) VALUES
	(1, 1, 1, '2023-09-21'),
	(2, 1, 1, '2023-09-26'),
	(3, 1, 1, '2023-10-02');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
