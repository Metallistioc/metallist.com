-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para metallist
CREATE DATABASE IF NOT EXISTS `metallist` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `metallist`;


-- Volcando estructura para tabla metallist.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `usuario_email` varchar(128) NOT NULL,
  PRIMARY KEY (`usuario_email`),
  KEY `fk_administrador_usuario1_idx` (`usuario_email`),
  CONSTRAINT `fk_administrador_usuario1` FOREIGN KEY (`usuario_email`) REFERENCES `usuario` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.administrador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` (`usuario_email`) VALUES
	('metal@metallist.com');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;


-- Volcando estructura para tabla metallist.cancion
CREATE TABLE IF NOT EXISTS `cancion` (
  `id_cancion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(120) NOT NULL,
  `album` varchar(120) DEFAULT NULL,
  `artista` varchar(120) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `genero_idgenero` int(11) NOT NULL,
  `comment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cancion`),
  KEY `SEARCH` (`titulo`,`album`,`artista`,`year`,`comment`),
  KEY `fk_cancion_genero1_idx` (`genero_idgenero`),
  CONSTRAINT `fk_cancion_genero1` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.cancion: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `cancion` DISABLE KEYS */;
INSERT INTO `cancion` (`id_cancion`, `titulo`, `album`, `artista`, `year`, `genero_idgenero`, `comment`) VALUES
	(1, 'Scream', 'From The Ashes', 'Black Star', '2014', 9, 1),
	(2, 'Close Your Eyes', 'From The Ashes', 'Black Star', '2014', 9, 2),
	(3, 'Love Passion', 'From The Ashes', 'Black Star', '2014', 9, 3),
	(4, 'Evil Heart', 'From The Ashes', 'Black Star', '2014', 9, 4),
	(5, 'Fight', 'From The Ashes', 'Black Star', '2014', 9, 5),
	(6, 'From The Outside, Looking In', 'From The Outside, Looking In', 'Fallen To Flux', '2013', 9, 1),
	(7, 'Living With The Pain', 'From The Outside, Looking In', 'Fallen To Flux', '2013', 9, 2),
	(8, 'Relapse', 'From The Outside, Looking In', 'Fallen To Flux', '2013', 9, 3),
	(9, 'Disenchanted', 'From The Outside, Looking In', 'Fallen To Flux', '2013', 9, 4),
	(10, 'One Chance', 'Piece By Piece', 'Fallen To Flux', '2015', 9, 1),
	(11, 'Playing With Fire', 'Piece By Piece', 'Fallen To Flux', '2015', 9, 2),
	(12, 'Halo', 'Piece By Piece', 'Fallen To Flux', '2015', 9, 3),
	(13, 'Alone', 'Piece By Piece', 'Fallen To Flux', '2015', 9, 4),
	(14, 'Vengeance Demon', 'Metal Demon', 'Metal Detector', '2014', 79, 1),
	(15, 'Soul Of The Scorpion', 'Metal Demon', 'Metal Detector', '2014', 79, 2),
	(16, 'Heavy From The Sky', 'Metal Demon', 'Metal Detector', '2014', 79, 3),
	(17, 'Steel Blood', 'Metal Demon', 'Metal Detector', '2014', 79, 4),
	(18, 'Metal Detector', 'Metal Demon', 'Metal Detector', '2014', 79, 5),
	(19, 'West Of Heaven', 'Metal Demon', 'Metal Detector', '2014', 79, 6),
	(20, 'The Sniper', 'Metal Demon', 'Metal Detector', '2014', 79, 7),
	(21, 'The Fall Of Troy', 'Metal Demon', 'Metal Detector', '2014', 79, 8),
	(22, 'Blind Messiah', 'Metal Demon', 'Metal Detector', '2014', 79, 9),
	(23, 'La Ley de la Calle', 'Fucking Metal', 'Vendetta', '2013', 9, 1),
	(24, 'Juanito el Caminante', 'Fucking Metal', 'Vendetta', '2013', 9, 2),
	(25, 'Loco', 'Fucking Metal', 'Vendetta', '2013', 9, 3),
	(26, 'Insonorizate', 'Fucking Metal', 'Vendetta', '2013', 9, 4),
	(27, 'Infierno', 'Fucking Metal', 'Vendetta', '2013', 9, 5),
	(28, 'Depresion', 'Fucking Metal', 'Vendetta', '2013', 9, 6);
/*!40000 ALTER TABLE `cancion` ENABLE KEYS */;


-- Volcando estructura para tabla metallist.canciones_lista
CREATE TABLE IF NOT EXISTS `canciones_lista` (
  `lista_nombre_lista` varchar(45) NOT NULL,
  `cancion_id_cancion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lista_nombre_lista`),
  KEY `fk_canciones_lista_cancion1_idx` (`cancion_id_cancion`),
  CONSTRAINT `fk_canciones_lista_cancion1` FOREIGN KEY (`cancion_id_cancion`) REFERENCES `cancion` (`id_cancion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_canciones_lista_lista1` FOREIGN KEY (`lista_nombre_lista`) REFERENCES `lista` (`nombre_lista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.canciones_lista: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `canciones_lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `canciones_lista` ENABLE KEYS */;


-- Volcando estructura para tabla metallist.genero
CREATE TABLE IF NOT EXISTS `genero` (
  `idgenero` int(11) NOT NULL DEFAULT '0',
  `nombre_genero` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`idgenero`),
  UNIQUE KEY `nombre_genero_UNIQUE` (`nombre_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.genero: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` (`idgenero`, `nombre_genero`) VALUES
	(79, 'Hard Rock'),
	(9, 'Metal');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;


-- Volcando estructura para tabla metallist.historico
CREATE TABLE IF NOT EXISTS `historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cancion_id_cancion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_historico_cancion1_idx` (`cancion_id_cancion`),
  CONSTRAINT `fk_historico_cancion1` FOREIGN KEY (`cancion_id_cancion`) REFERENCES `cancion` (`id_cancion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.historico: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;


-- Volcando estructura para tabla metallist.lista
CREATE TABLE IF NOT EXISTS `lista` (
  `nombre_lista` varchar(45) NOT NULL,
  `usuario_email` varchar(128) NOT NULL,
  `descripción` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`nombre_lista`,`usuario_email`),
  KEY `fk_listas_usuario_idx` (`usuario_email`),
  CONSTRAINT `fk_listas_usuario` FOREIGN KEY (`usuario_email`) REFERENCES `usuario` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.lista: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista` ENABLE KEYS */;


-- Volcando estructura para tabla metallist.lista propuesta
CREATE TABLE IF NOT EXISTS `lista propuesta` (
  `usuario_email` varchar(128) NOT NULL,
  `tema_propuesto_fecha` date NOT NULL,
  `lista_nombre_lista` varchar(45) NOT NULL,
  `puntuacion` int(11) DEFAULT '0',
  `reproducida` int(11) DEFAULT '0',
  PRIMARY KEY (`usuario_email`,`tema_propuesto_fecha`),
  UNIQUE KEY `lista_nombre_lista_UNIQUE` (`lista_nombre_lista`),
  KEY `fk_lista propuesta_lista1_idx` (`lista_nombre_lista`),
  KEY `fk_lista propuesta_usuario1_idx` (`usuario_email`),
  KEY `fk_lista propuesta_tema_propuesto1_idx` (`tema_propuesto_fecha`),
  CONSTRAINT `fk_lista propuesta_lista1` FOREIGN KEY (`lista_nombre_lista`) REFERENCES `lista` (`nombre_lista`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista propuesta_tema_propuesto1` FOREIGN KEY (`tema_propuesto_fecha`) REFERENCES `tema_propuesto` (`fecha`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista propuesta_usuario1` FOREIGN KEY (`usuario_email`) REFERENCES `usuario` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.lista propuesta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `lista propuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista propuesta` ENABLE KEYS */;


-- Volcando estructura para tabla metallist.temas
CREATE TABLE IF NOT EXISTS `temas` (
  `nombre_tema` varchar(128) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`nombre_tema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.temas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `temas` DISABLE KEYS */;
INSERT INTO `temas` (`nombre_tema`, `descripcion`) VALUES
	('Bocata de fruagrass', 'Grandes clásicos de toda la vida'),
	('Lucha y Conquista', 'Grandes bandas sonoras con las que venirse arriba'),
	('Romantic Night', 'Música para convencer a un/a chati para una noche de... Heavy Metal');
/*!40000 ALTER TABLE `temas` ENABLE KEYS */;


-- Volcando estructura para tabla metallist.tema_propuesto
CREATE TABLE IF NOT EXISTS `tema_propuesto` (
  `fecha` date NOT NULL,
  `administrador_usuario_email` varchar(128) NOT NULL,
  `temas_nombre_tema` varchar(128) NOT NULL,
  PRIMARY KEY (`fecha`),
  KEY `fk_tema_propuesto_administrador1_idx` (`administrador_usuario_email`),
  KEY `fk_tema_propuesto_temas1_idx` (`temas_nombre_tema`),
  CONSTRAINT `fk_tema_propuesto_administrador1` FOREIGN KEY (`administrador_usuario_email`) REFERENCES `administrador` (`usuario_email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tema_propuesto_temas1` FOREIGN KEY (`temas_nombre_tema`) REFERENCES `temas` (`nombre_tema`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.tema_propuesto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tema_propuesto` DISABLE KEYS */;
INSERT INTO `tema_propuesto` (`fecha`, `administrador_usuario_email`, `temas_nombre_tema`) VALUES
	('2017-01-31', 'metal@metallist.com', 'Bocata de fruagrass');
/*!40000 ALTER TABLE `tema_propuesto` ENABLE KEYS */;


-- Volcando estructura para tabla metallist.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `email` varchar(128) NOT NULL,
  `alias` varchar(128) NOT NULL,
  `pwd` char(32) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`email`, `alias`, `pwd`) VALUES
	('juan23@gmail.com', 'The King of Metal', 'VxZYQ1KY0Q0h4tIMhbcjio6VS60F/2JO'),
	('maria_de_la_hoz@yahoo.com', 'MehARIA Metalera', 'J2UW46EE0iDtjjyrYYfN9sQ1RGVS5ZYQ'),
	('metal@metallist.com', 'Metallist', 'NzVQbrFwxgaFIN1CAe6VMyj6jy2BQp/k');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


-- Volcando estructura para tabla metallist.vota
CREATE TABLE IF NOT EXISTS `vota` (
  `usuario_email` varchar(128) NOT NULL,
  `lista propuesta_tema_propuesto_fecha` date NOT NULL,
  `lista propuesta_usuario_email` varchar(128) NOT NULL,
  `puntuación` int(11) NOT NULL,
  PRIMARY KEY (`usuario_email`,`lista propuesta_tema_propuesto_fecha`),
  UNIQUE KEY `lista propuesta_usuario_email_UNIQUE` (`lista propuesta_usuario_email`),
  KEY `fk_usuario_has_lista propuesta_lista propuesta1_idx` (`lista propuesta_usuario_email`,`lista propuesta_tema_propuesto_fecha`),
  KEY `fk_usuario_has_lista propuesta_usuario1_idx` (`usuario_email`),
  CONSTRAINT `fk_usuario_has_lista propuesta_lista propuesta1` FOREIGN KEY (`lista propuesta_usuario_email`, `lista propuesta_tema_propuesto_fecha`) REFERENCES `lista propuesta` (`usuario_email`, `tema_propuesto_fecha`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_lista propuesta_usuario1` FOREIGN KEY (`usuario_email`) REFERENCES `usuario` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla metallist.vota: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vota` DISABLE KEYS */;
/*!40000 ALTER TABLE `vota` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
