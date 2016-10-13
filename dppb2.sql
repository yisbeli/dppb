-- phpMyAdmin SQL Dump
-- version 4.4.8
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2016 a las 02:49:10
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `crlproyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areacomunicacion`
--

CREATE TABLE IF NOT EXISTS `areacomunicacion` (
  `codareacomunicacion` int(11) NOT NULL,
  `area` varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `areacomunicacion`
--

INSERT INTO `areacomunicacion` (`codareacomunicacion`, `area`) VALUES
(1, 'Area 1'),
(2, 'Area 2'),
(3, 'AREA 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE IF NOT EXISTS `asistencias` (
  `codasistencia` int(11) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date NOT NULL,
  `coddocente` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asistencias`
--

INSERT INTO `asistencias` (`codasistencia`, `cantidad`, `fechainicio`, `fechafin`, `coddocente`) VALUES
(1, 45, '2016-05-09', '2016-05-13', 1),
(2, 30, '2016-05-16', '2016-05-20', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE IF NOT EXISTS `bitacora` (
  `id_bitacora` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `valor_nuevo` varchar(100) DEFAULT NULL,
  `valor_viejo` varchar(100) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `accion` varchar(15) DEFAULT NULL,
  `tabla` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id_bitacora`, `id`, `valor_nuevo`, `valor_viejo`, `usuario`, `fecha`, `accion`, `tabla`) VALUES
(1, 12, 'MARIA ALEJANDRA SALA', NULL, 'root@localhost', '2016-02-23 20:18:34', 'insertar', 'representantante'),
(2, 13, 'DIEGO MARQUEZ', NULL, 'root@localhost', '2016-02-23 20:26:51', 'insertar', 'representantante'),
(3, 5, 'JOSE LUIS SARAGOZA23', NULL, 'root@localhost', '2016-02-23 20:38:11', 'insertar', 'docentes'),
(4, 6, 'JAIME PERNIA16545678', NULL, 'root@localhost', '2016-02-23 20:40:31', 'insertar', 'docentes'),
(5, 21, 'LUIS MARQUEZ2016-02-26', NULL, 'root@localhost', '2016-02-23 20:44:04', 'insertar', 'citas'),
(6, 7, 'JOSE LUIS SALAS99999992', NULL, 'root@localhost', '2016-02-23 20:55:15', 'insertar', 'docentes'),
(7, 7, 'JOSE AMADOR SALAS RUIZ ESTA SI ES LA DIRECCION', 'JOSE LUIS SALAS RUIZ ESTA SI ES LA DIRECCION', 'root@localhost', '2016-02-23 20:56:59', 'actualizar', 'docentes'),
(11, 8, 'ESTUDIANTE AIXA SUJEI CALDERON', 'AMA DE CASA AIXA SUSANA MARQUEZ ZAMBRANO', 'root@localhost', '2016-02-23 21:32:35', 'actualizar', 'representante'),
(12, 14, 'MARIA ALEJANDRA MARQUEZ', NULL, 'root@localhost', '2016-02-23 21:59:10', 'insertar', 'representantante'),
(13, 14, NULL, 'MARIA ALEJANDRA MARQUEZ ESTUDIANTE', 'root@localhost', '2016-02-23 21:59:28', 'eliminar', 'representante'),
(14, 1, NULL, 'MARIBEL LUISA GONZALEZ 2015-09-19', 'root@localhost', '2016-02-23 22:04:13', 'eliminar', 'citas'),
(15, 22, 'LUISA MARQUEZ2016-02-28', NULL, 'root@localhost', '2016-02-27 11:29:16', 'insertar', 'citas'),
(17, 24, 'ERIKA ZAMBRANO2016-03-03', NULL, 'root@localhost', '2016-02-27 12:03:57', 'insertar', 'citas'),
(18, 25, 'ERIKA ZAMBRANO2016-03-03', NULL, 'root@localhost', '2016-02-27 12:07:04', 'insertar', 'citas'),
(19, 26, 'KAREN ZAMBRANO2016-03-01', NULL, 'root@localhost', '2016-02-29 14:43:27', 'insertar', 'citas'),
(20, 27, 'MARIA PAREDES2016-03-01', NULL, 'root@localhost', '2016-02-29 14:51:12', 'insertar', 'citas'),
(21, 28, 'MARIA PAREDES2016-03-01', NULL, 'root@localhost', '2016-02-29 14:52:44', 'insertar', 'citas'),
(22, 29, 'MARIA PAREDES2016-03-01', NULL, 'root@localhost', '2016-02-29 14:53:26', 'insertar', 'citas'),
(23, 30, 'LUIS PAREDES2016-03-01', NULL, 'root@localhost', '2016-02-29 14:57:28', 'insertar', 'citas'),
(25, 32, 'FERNANDO CAMACHO2016-03-01', NULL, 'root@localhost', '2016-02-29 15:39:36', 'insertar', 'citas'),
(26, 33, 'JOSE LUIS CAMACHO2016-03-01', NULL, 'root@localhost', '2016-02-29 15:41:19', 'insertar', 'citas'),
(27, 32, NULL, 'FERNANDO CAMACHO 2016-03-01', 'root@localhost', '2016-02-29 15:41:35', 'eliminar', 'citas'),
(28, 14, 'ALEJANDRA RUIZ', NULL, 'root@localhost', '2016-03-01 10:48:12', 'insertar', 'representantante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE IF NOT EXISTS `citas` (
  `codcita` int(11) NOT NULL,
  `hora` varchar(11) CHARACTER SET latin1 NOT NULL,
  `fechaasignacion` date NOT NULL,
  `fechasolicitud` date NOT NULL,
  `observacion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `cedula` varchar(12) CHARACTER SET latin1 NOT NULL,
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL,
  `apellido` varchar(30) CHARACTER SET latin1 NOT NULL,
  `telefono` varchar(12) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin7 COLLATE=latin7_bin;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`codcita`, `hora`, `fechaasignacion`, `fechasolicitud`, `observacion`, `cedula`, `nombre`, `apellido`, `telefono`) VALUES
(2, '08:00', '2015-09-19', '2015-09-18', 'RIKFJDDD', '895732', 'MILAGROS', 'OBERTO', '45398633333'),
(3, '08:00', '2015-09-23', '2015-09-25', 'WERWERWER', '888888', 'DFSDFSDF', 'SDFSDFSDF', '45657567454'),
(4, '08:00', '2015-09-20', '2015-09-25', 'FSDFDFSDFSFD', '888888', 'DFDSF', 'SDFSDF', '34345345345'),
(5, '08:00', '2016-01-27', '2016-01-19', 'SDFDGHGHJ', '11111111', 'PEDRO', 'PEREZ', '23453546757'),
(6, '08:00', '2016-01-27', '2016-01-19', 'SDFGRTFUTYGI', '11111111', 'PEDRO', 'PEREZ', '23453546757'),
(7, '08:00', '2016-01-27', '2016-01-19', 'SDFDFHGHGHFH', '11111111', 'PEDRO', 'PEREZ', '23453546757'),
(8, '08:00', '2016-01-27', '2016-01-19', 'ZDFDFHFGJJ', '11111112', 'PEDRO', 'PEREZ', '23453546757'),
(9, '08:00', '2016-01-22', '2016-01-19', 'SDFDDFGFH', '11111112', 'JUAN', 'GARCIA', '35465678789'),
(10, '08:00', '2016-01-22', '2016-01-19', 'SDFDYYJYGJ', '11111112', 'JUAN', 'GARCIA', '35465678789'),
(11, '08:00', '2016-04-30', '2016-04-30', 'AFDHGYJHJKHJKHL', '11111116', 'JUAN', 'PEREZ', '23453546757'),
(12, '08:00', '2016-04-30', '2016-04-30', 'SFFGJGHJGHJ', '11111117', 'PEDRO', 'GARCIA', '23453546757'),
(13, '08:00', '2016-04-30', '2016-04-30', 'AWEWRTYHFTU', '11111118', 'MARIA', 'CASTRO', '45675678789'),
(14, '08:00', '2016-04-30', '2016-04-30', '', '11111119', 'MARIA', 'GARCIA', '57684342343'),
(15, '08:00', '2016-04-30', '2016-04-30', 'DFGFGHFGHFGH', '11111119', 'MARIA', 'PEREZ', '23453546757'),
(19, '08:00', '2016-04-30', '2016-04-30', 'dfghfh', '23241232', 'sdfdsfsdf', 'sdfdfgfg', '445456456'),
(21, '09:00', '2016-04-30', '2016-04-30', 'LLEGAR', '23722212', 'LUIS', 'MARQUEZ', '02742510403'),
(22, '08:00', '2016-04-30', '2016-04-30', 'JAJAJAJAJAJA', '23722212', 'LUISA', 'MARQUEZ', '02742631060'),
(24, '', '2016-03-03', '2016-02-27', 'AAAAAAA', '23722212', 'ERIKA', 'ZAMBRANO', '02743256780'),
(25, '', '2016-03-03', '2016-02-27', 'AAAAAAA', '23722212', 'ERIKA', 'ZAMBRANO', '02743256780'),
(26, '', '2016-03-01', '2016-02-29', 'AAAAAAAA', '23722212', 'KAREN', 'ZAMBRANO', '02742510403'),
(27, '', '2016-03-01', '2016-02-29', 'LLEGAR A TIEMPO', '21345678', 'MARIA', 'PAREDES', '0414345678'),
(28, '', '2016-03-01', '2016-02-29', 'LLEGAR A TIEMPO', '21345678', 'MARIA', 'PAREDES', '0414345678'),
(29, '', '2016-03-01', '2016-02-29', 'LLEGAR A TIEMPO', '21345678', 'MARIA', 'PAREDES', '0414345678'),
(30, '', '2016-03-01', '2016-02-29', 'LLEGAR A TIEMPO', '21345678', 'LUIS', 'PAREDES', '0414345678'),
(33, '', '2016-03-01', '2016-02-29', 'LLEGAR TEMPRANO', '23722212', 'JOSE LUIS', 'CAMACHO', '0426345678'),
(34, '08:00', '2016-04-27', '2016-04-27', 'OBSERVACION', '20340239', 'JESUS', 'MARTINEZ', '92349093840'),
(35, '08:00', '2016-04-27', '2016-04-30', '.AKDAS,DNS,DASD', '20340239', 'JESUS MANUEL', 'MARTINEZ', '12345674344'),
(36, '08:00', '2016-04-30', '2016-04-28', 'AWEWEET', '41414141', 'JULIO', 'CORTAZAR', '12345678901');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

CREATE TABLE IF NOT EXISTS `director` (
  `coddirector` int(11) NOT NULL,
  `titdirector` varchar(10) NOT NULL,
  `ceddirector` varchar(9) NOT NULL,
  `nomdirector` varchar(25) NOT NULL,
  `apedirector` varchar(25) NOT NULL,
  `teldirector` varchar(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `director`
--

INSERT INTO `director` (`coddirector`, `titdirector`, `ceddirector`, `nomdirector`, `apedirector`, `teldirector`) VALUES
(1, 'Lcdo.', '8034729', 'Jos? Delf', 'Morantes Torres', '04151234567');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE IF NOT EXISTS `docentes` (
  `coddocente` int(11) NOT NULL,
  `ceduladocente` varchar(12) NOT NULL,
  `nomdocente` varchar(30) NOT NULL,
  `apellidodocente` varchar(30) NOT NULL,
  `fnacdocente` date NOT NULL,
  `tlfdocente` varchar(12) NOT NULL,
  `correodocente` varchar(70) NOT NULL,
  `direcciondocente` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`coddocente`, `ceduladocente`, `nomdocente`, `apellidodocente`, `fnacdocente`, `tlfdocente`, `correodocente`, `direcciondocente`) VALUES
(1, '99999999', 'LUIS ALBERTO', 'CONTRERAS SALAS', '1983-09-25', '32985749435', 'CORREO NO ESTA VALIDADO', 'DFS DSFSDF SDF SF'),
(2, '99999992', 'JOSE', 'SALAS', '1986-09-25', '32985749431', 'CORREO NO ESTA', 'ESTA SI ES LA DIRECCION'),
(5, '23722212', 'JOSE LUIS', 'SARAGOZA', '1989-11-12', '02742621768', 'DIEGO@GMAIL.COM', 'LA CUESTA'),
(6, '16545678', 'JAIME', 'PERNIA', '1980-12-13', '02742621768', 'DIEGO@GMAIL.COM', 'LAS ACASIAS'),
(7, '99999992', 'JOSE AMADOR', 'SALAS RUIZ', '1986-09-25', '32985749431', 'JUAN_R23@HOTMAIL.COM', 'ESTA SI ES LA DIRECCION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estud_repres`
--

CREATE TABLE IF NOT EXISTS `estud_repres` (
  `codestudiante` int(11) NOT NULL,
  `codrepresentante` int(11) NOT NULL DEFAULT '0',
  `parentesco` varchar(15) COLLATE latin7_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin7 COLLATE=latin7_bin;

--
-- Volcado de datos para la tabla `estud_repres`
--

INSERT INTO `estud_repres` (`codestudiante`, `codrepresentante`, `parentesco`) VALUES
(1, 1, 'P'),
(1, 3, 'M'),
(2, 1, 'P'),
(3, 1, 'P'),
(7, 6, 'H'),
(8, 6, 'H'),
(8, 7, 'P'),
(9, 8, 'M'),
(10, 9, 'P'),
(11, 4, 'M'),
(12, 6, 'T'),
(12, 11, 'P'),
(14, 14, 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
  `codestudiante` int(11) NOT NULL,
  `cedulaestudiante` varchar(14) COLLATE latin7_bin NOT NULL,
  `nomestudiante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `apellidoestudiante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `sexo` char(1) COLLATE latin7_bin NOT NULL,
  `gradoinstruccion` char(1) COLLATE latin7_bin DEFAULT NULL,
  `codprofesion` int(11) DEFAULT NULL,
  `fechanacimiento` date NOT NULL,
  `lugarnacimiento` varchar(255) CHARACTER SET latin1 NOT NULL,
  `direccion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `codmunicipio` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin7 COLLATE=latin7_bin;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`codestudiante`, `cedulaestudiante`, `nomestudiante`, `apellidoestudiante`, `sexo`, `gradoinstruccion`, `codprofesion`, `fechanacimiento`, `lugarnacimiento`, `direccion`, `codmunicipio`) VALUES
(1, '111111112', 'JOSE', 'PEREZ', 'M', '', 0, '2007-10-30', 'MERIDA', 'DIRECCION DEL ESTUDIANTE', 1),
(2, '111111113', 'MARIA', 'PEREZ', 'F', '', 0, '2010-05-26', 'MERIDA', 'DIRECCION DE MARIA', 1),
(3, '111111114', 'LUIS', 'PEREZ', 'M', '', 0, '2009-12-31', 'EL VIGIA', 'DFGDG G DFGF  HGH J', 1),
(4, '333333331', 'ANDRES', 'CADENAS', 'M', '', 0, '2011-04-10', 'MERIDA', 'MERIDA', 12),
(5, '333333332', 'MARIA', 'GONZALEZ', 'F', '', 0, '2007-03-28', 'EL VIGIA', 'MERIDA', 12),
(6, '333333334', 'ALBERTO', 'MARQUEZ', 'M', '', 0, '2003-05-24', 'EJIDO', 'TABAY', 19),
(7, '237222101', 'ELIANYBETH', 'CALDERON', 'F', '', 0, '2002-11-12', 'MERIDA', 'LAS CASITAS', 11),
(8, '237222102', 'ERICK', 'CALDERON', 'M', '', 0, '2000-06-10', 'EJIDO', 'LAS CASITAS', 12),
(9, '194220921', 'NEYBER', 'MARQUEZ', 'M', '', 0, '2000-07-15', 'MERIDA', 'PIE DEL LLANO', 12),
(10, '256689991', 'CARLOS', 'MARQUEZ', 'M', '', 0, '2011-04-10', 'MERIDA', 'EJIDO', 6),
(11, '333333335', 'LUIS', 'MARQUEZ', 'F', '', 0, '2007-09-30', 'MERIDA', 'SDFSDFSDFSDFSDF', 1),
(12, '241971422', 'ANDRES', 'DAVILA', 'M', '', 0, '2011-04-10', 'MERIDA', 'LOS GUAIMAROS', 6),
(13, '14698874', 'MARIA', 'SANTIAGO', 'F', '', 0, '1980-11-15', 'MERIDA, TIMOTES', 'SAN JUAN MERIDA', 13),
(14, '237222121', 'JULIAN', 'CALDERON', 'M', NULL, NULL, '2011-04-10', 'MERIDA', 'DDFRTFG', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE IF NOT EXISTS `inscripcion` (
  `codinscripcion` int(11) NOT NULL,
  `codareacomunicacion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `fechainscripcion` date NOT NULL,
  `escolaridad` int(2) NOT NULL,
  `conclusiones` varchar(255) CHARACTER SET latin1 NOT NULL,
  `codestudiante` int(11) NOT NULL,
  `codinstitucion` int(11) DEFAULT NULL,
  `estatus` int(1) NOT NULL DEFAULT '1',
  `coddocente` int(11) DEFAULT NULL,
  `codusuario` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin7 COLLATE=latin7_bin;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`codinscripcion`, `codareacomunicacion`, `fechainscripcion`, `escolaridad`, `conclusiones`, `codestudiante`, `codinstitucion`, `estatus`, `coddocente`, `codusuario`) VALUES
(1, 'DFGFGHFGHFGH FGFGH', '2015-09-15', 1, 'DFFGH  GHFGHFGHFGH ', 1, 1, 1, NULL, 0),
(2, 'HHHDHDHSFDGG', '2015-09-15', 3, 'TERTERTERT ER ERT', 3, 1, 1, NULL, 0),
(3, '', '2015-09-15', 2, 'ERGRTYBTTY TYR  TY RT', 2, 2, 1, 2, 1),
(4, 'DFSDFS SDFSF', '2015-09-16', 7, 'SDFS FSDFSDF', 5, 1, 1, 1, 1),
(5, 'DFDFG DFGDFG', '2015-09-16', 2, 'DFGDF GDFGDFGDFG', 4, 1, 1, NULL, 0),
(6, 'DDFKGJNSD KFG HKJ', '2015-09-16', 3, 'MDKD GNFGKFNGFH', 6, 1, 1, NULL, 0),
(7, 'PRONUNCIACION', '2015-09-17', 4, '', 7, 3, 1, 1, 1),
(8, 'PRONUNCIACION', '2015-09-17', 4, '', 8, 3, 1, NULL, 0),
(9, 'FRENILLO', '2015-09-17', 16, '', 9, 2, 1, NULL, 0),
(10, 'FRENILLO', '2015-09-18', 16, '', 10, 4, 1, NULL, 0),
(11, 'PALADAR ENDIDO', '2015-09-25', 16, '', 12, 4, 1, 1, 1),
(12, 'AREA COMUNICACIONAL', '2015-11-15', 14, 'CONCLISIONES', 13, 2, 1, 1, 1),
(13, 'FRENILLO', '2016-03-01', 17, 'AAAA', 14, 8, 1, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucionproce`
--

CREATE TABLE IF NOT EXISTS `institucionproce` (
  `codinstitucion` int(11) NOT NULL,
  `nombreinstitucion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `direccioninstitucion` varchar(200) COLLATE latin7_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin7 COLLATE=latin7_bin;

--
-- Volcado de datos para la tabla `institucionproce`
--

INSERT INTO `institucionproce` (`codinstitucion`, `nombreinstitucion`, `direccioninstitucion`) VALUES
(1, 'ETCRN JOSE RICARDO GUILLEN SUAREZ', ''),
(2, 'LICEO EJIDO', ''),
(3, 'ESCUELA BASICA RAFAEL ANTONIO GODOY', ''),
(4, 'ESCUELA BASICA RAFAEL ANTONIO GODOY', ''),
(6, 'NUEVA CON DIRECCION', ''),
(7, 'SDFSDF', 'SDFSDFDFDF'),
(8, 'U. E LAS FLORES', 'JAJI'),
(9, 'LABIO LEPORINO', ''),
(10, 'AAA', ''),
(11, 'BBB', 'EN LA BBB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE IF NOT EXISTS `municipios` (
  `codmunicipio` int(11) NOT NULL,
  `nombremunicipio` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin7 COLLATE=latin7_bin;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`codmunicipio`, `nombremunicipio`) VALUES
(1, 'ALBERTO ADRIANI'),
(2, 'ANDRES BELLO'),
(3, 'ANTONIO PINTO SALINAS'),
(4, 'ARICAGUA'),
(5, 'ARZOBISPO CHACON'),
(6, 'CAMPO ELIAS'),
(7, 'CARACCIOLO PARRA Y OLMEDO'),
(8, 'CARDENAL QUINTERO'),
(9, 'GUARAQUE'),
(10, 'JULIO CESAR SALAS'),
(11, 'JUSTO BRICE?O'),
(12, 'LIBERTADOR'),
(13, 'MIRANDA'),
(14, 'OBISPO RAMOS DE LORA'),
(15, 'PADRE NOGUERA'),
(16, 'PUEBLO LLANO'),
(17, 'RANGEL'),
(18, 'RIVAS DAVILA'),
(19, 'SANTOS MARQUINA'),
(20, 'SUCRE'),
(21, 'TOVAR'),
(22, 'TULIO FEBRES CORDERO'),
(23, 'ZEA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
  `codpregunta` int(11) NOT NULL,
  `pregunta` varchar(80) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`codpregunta`, `pregunta`) VALUES
(1, 'cual es el nombre de su primera mascota'),
(2, 'en que municipio se caso'),
(3, 'cual es su comida favorita'),
(4, 'cual es su pelicula favorita'),
(5, 'cual es el nombre de su primo mayor'),
(6, 'cual es su marca de carros preferida'),
(7, 'cual fue su materia favorita en bachillerato'),
(8, 'cual es el segundo nombre de su madre'),
(9, 'cual es el nombre de su abuela paterna'),
(10, 'cual es el segundo nombre de su primer hijo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_usuarios`
--

CREATE TABLE IF NOT EXISTS `preguntas_usuarios` (
  `codusuario` int(11) NOT NULL,
  `codpregunta` int(11) NOT NULL,
  `respuesta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preguntas_usuarios`
--

INSERT INTO `preguntas_usuarios` (`codusuario`, `codpregunta`, `respuesta`) VALUES
(1, 3, 'PASTA'),
(1, 4, 'BOBI'),
(1, 8, 'LUZ'),
(1, 9, 'CORINA'),
(4, 2, 'LIBERTADOR'),
(4, 4, 'TROYA'),
(4, 5, 'JUAN'),
(4, 6, 'FIAT'),
(4, 8, 'MARIA'),
(10, 1, 'PERRO'),
(10, 3, 'CARNE'),
(10, 4, 'TROYA'),
(10, 6, 'TOYOTA'),
(10, 7, 'MATEMATICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE IF NOT EXISTS `profesion` (
  `codprofesion` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin7 COLLATE=latin7_bin;

--
-- Volcado de datos para la tabla `profesion`
--

INSERT INTO `profesion` (`codprofesion`, `nombre`) VALUES
(1, 'ABOGADO'),
(2, 'ACTRIZ/ACTOR'),
(3, 'ADMINISTRADOR(A)'),
(4, 'ADMINISTRATIVO'),
(5, 'AGENTE DE BOLSA'),
(6, 'AGENTE DE VIAJES'),
(7, 'AGENTE DE SEGUROS'),
(8, 'AGRONOMO/A'),
(9, 'ANALISTA DE MERCADO'),
(10, 'ANIMADOR/A'),
(11, 'ANTROPOLOGO/A'),
(12, 'ARCHIVERO/A'),
(13, 'ARQUEOLOGO/A'),
(14, 'ARQUITECTO/A'),
(15, 'ASESOR DE EMPRESAS'),
(16, 'BAILARIN/A'),
(17, 'BIBLIOTECARIO/A'),
(18, 'BIOLOGO/A'),
(19, 'BOMBERO/A'),
(20, 'BOTANICO/A'),
(21, 'CANTANTE'),
(22, 'CARPINTERO'),
(23, 'COCINERO/A'),
(24, 'COMPOSITOR/A'),
(25, 'CONSULTOR/A EMPRESARIAL'),
(26, 'CONTADOR/A'),
(27, 'COREOGRAFO'),
(28, 'CRIMINOLOGO'),
(29, 'DECORADOR/A'),
(30, 'DISE?ADOR/A'),
(31, 'DEPORTISTA'),
(32, 'DIETISTA'),
(34, 'DECORADOR/A'),
(35, 'DEPORTISTA'),
(36, 'DIETISTA'),
(37, 'DISE?ADOR/A ROPA'),
(38, 'DISE?ADOR/A GRAFICO'),
(39, 'ECONOMISTA'),
(40, 'EDUCADOR/A INFANTIL'),
(41, 'ENFERMERO/A'),
(42, 'ESCRITOR/A'),
(43, 'ESCULTOR/A'),
(44, 'ESTADISTICO/A'),
(45, 'ESTETICISTA'),
(46, 'ESTILISTA'),
(47, 'FARMACEUTICO/A'),
(48, 'FILOSOFO/A'),
(49, 'FISICO/A'),
(50, 'FISIOTERAPEUTA'),
(51, 'FOTOGRAFO/A'),
(52, 'GEOGRAFO/A'),
(53, 'GEOLOGO/A'),
(54, 'GERENTE DE EMPRESAS'),
(55, 'GUARDIA DE SEGURIDAD'),
(56, 'HISTORIADOR/A'),
(57, 'INFORMADOR/A TURISTICO'),
(58, 'INFORMATICO/A'),
(59, 'INGENIERO/A EN OBRAS PUBLICAS'),
(60, 'JARDINERO/A'),
(61, 'JUEZ/A'),
(62, 'LOCUTOR/A'),
(63, 'MAQUILLADOR/A'),
(64, 'MATEMATICO/A'),
(65, 'MEDICO'),
(66, 'METALURGICO/A'),
(67, 'MILITAR'),
(68, 'MODELO'),
(69, 'MUSICO'),
(70, 'NUTRICIONISTA'),
(71, 'ODONTOLOGO'),
(72, 'OFTALMOLOGO'),
(73, 'PEDAGOGO'),
(74, 'PEDIATRA'),
(75, 'PELUQUERO/A'),
(76, 'PINTOR'),
(77, 'POLICIA'),
(78, 'PROCURADOR/A'),
(79, 'PROFESOR/A'),
(80, 'PSICOLOGO/A'),
(81, 'PSIQUIATRA'),
(82, 'PUBLITARIO/A'),
(83, 'QUIMICO/A'),
(84, 'REDACTOR/A'),
(85, 'RELACIONISTA PUBLICO'),
(86, 'SECRETARIO/A'),
(87, 'SOCIOLOGO/A'),
(88, 'SOCORRISTA'),
(89, 'TECNICO DE LABORATORIO'),
(90, 'TECNICO DE SONIDO'),
(91, 'TECNICO EN ELECTRONICA'),
(92, 'TOPOGRAFO/A'),
(93, 'TRABAJADOR/A SOCIAL'),
(94, 'TRADUCTOR/A'),
(95, 'VETERINARIO'),
(96, 'SIN PROFRESION'),
(97, 'INVESTIGADOR DE LA NASA'),
(98, 'INGENIERO TERMONUCLEAR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representante`
--

CREATE TABLE IF NOT EXISTS `representante` (
  `codrepresentante` int(11) NOT NULL,
  `cedula` varchar(12) CHARACTER SET latin1 NOT NULL,
  `nomrepresentante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `apellidorepresentante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fechanacimientorepresentante` date NOT NULL,
  `telefono` varchar(255) CHARACTER SET latin1 NOT NULL,
  `celular` varchar(12) CHARACTER SET latin1 NOT NULL,
  `correo` varchar(70) COLLATE latin7_bin NOT NULL,
  `ocupacion` varchar(20) CHARACTER SET latin1 NOT NULL,
  `gradoinstruccion` varchar(20) CHARACTER SET latin1 NOT NULL,
  `codprofesion` int(11) DEFAULT NULL,
  `direccionrepresen` varchar(255) CHARACTER SET latin1 NOT NULL,
  `estadocivil` char(1) CHARACTER SET latin1 NOT NULL,
  `codmunicipiorep` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin7 COLLATE=latin7_bin;

--
-- Volcado de datos para la tabla `representante`
--

INSERT INTO `representante` (`codrepresentante`, `cedula`, `nomrepresentante`, `apellidorepresentante`, `fechanacimientorepresentante`, `telefono`, `celular`, `correo`, `ocupacion`, `gradoinstruccion`, `codprofesion`, `direccionrepresen`, `estadocivil`, `codmunicipiorep`) VALUES
(1, '11111111', 'PEDRO', 'PEREZ', '1984-07-30', '92385739454', '57978446456', '', 'MECANICO', 'P', 66, 'SFDG  DFGD FGDF GN KJDGN', 'S', 1),
(3, '22222222', 'MARIA', 'GARCIA', '1990-07-28', '23456789345', '98305840958', '', 'AMA DE CASA', 'U', 3, 'DIRECCION DE MARIA', 'S', 1),
(4, '33333333', 'RICMAR', 'MARQUEZ', '1993-07-27', '34545656786', '45675687687', '', 'ESTUDIANTE', 'U', 58, 'MERIDA', 'S', 12),
(5, '44444444', 'JOSEFINA', 'JIMENEZ', '1990-05-30', '94859475947', '93785948794', '', 'AMA DE CASA', 'U', 3, 'MERIDA', 'S', 12),
(6, '23722210', 'MAYRET', 'CALDERON', '1993-09-14', '02742510403', '04264730670', '', 'ASISTENTE DE LABORAT', 'MD', 96, 'EL CHAMA', 'S', 12),
(7, '21123456', 'LUIS', 'CALDERON', '1975-10-11', '02763333333', '04142222222', '', 'TRABAJADOR ALBANIL', 'M', 96, 'RAUL LEONI', 'S', 11),
(8, '19422092', 'AIXA SUJEI', 'CALDERON', '1989-12-30', '02744172798', '04263549231', 'AAA_23455@HOTMAIL.COM', 'ESTUDIANTE', 'MP', 58, 'PIE DEL LLANO', 'S', 12),
(9, '25668999', 'MERVIN', 'MARQUEZ', '1992-02-16', '02742211750', '04246762815', '', 'GIGOLO', 'U', 97, 'EJIDO', 'S', 6),
(10, '44444445', 'JAVIER', 'MARQUEZ', '1998-08-24', '02742510403', '87868686868', 'CORREO@CORREO.COM', 'KLJLKJKJ', 'P', 2, 'SDFDSFGDFG', 'S', 18),
(11, '24197142', 'DIEGO', 'SALAZAR', '1994-01-29', '02742510403', '04168549901', 'DIEJOJOSEDAVILASALAZAR@HOTMAIL.COM', 'TRABAJADOR', 'MP', 14, 'LOS GUAIMAROS', 'C', 6),
(12, '21076324', 'MARIA ALEJANDRA', 'SALAZAR', '1987-02-12', '02742211750', '04264730670', 'DIEJOJOSEDAVILASALAZAR@HOTMAIL.COM', 'ESTUDIANTE', 'MD', 16, 'SAN JACINTO', 'C', 17),
(13, '14663829', 'DIEGO', 'MARQUEZ', '1989-12-01', '02742211750', '04264730670', 'DIEJOJOSEDAVILASALAZAR@HOTMAIL.COM', 'TRABAJADOR', 'MD', 18, 'SAN JACINTO', 'C', 16),
(14, '23722212', 'ALEJANDRA', 'RUIZ', '1992-11-08', '02742510403', '04264730670', 'DIEJOJOSEDAVILASALAZAR@HOTMAIL.COM', 'ESTUDIANTE', 'MP', 12, 'SAN JACINTO', 'S', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `codusuario` int(11) NOT NULL,
  `cedula` varchar(12) NOT NULL,
  `nombre` varchar(20) CHARACTER SET latin1 NOT NULL,
  `apellido` varchar(20) CHARACTER SET latin1 NOT NULL,
  `login` varchar(15) NOT NULL,
  `clave` varchar(40) NOT NULL,
  `tipo` varchar(1) CHARACTER SET latin1 NOT NULL,
  `intentos` int(11) NOT NULL,
  `ultimavisita` date NOT NULL,
  `ultimointento` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`codusuario`, `cedula`, `nombre`, `apellido`, `login`, `clave`, `tipo`, `intentos`, `ultimavisita`, `ultimointento`) VALUES
(1, '23722212', 'RICMAR A', 'MARQUEZ R', 'ricmar', '202cb962ac59075b964b07152d234b70', 'A', 0, '0000-00-00', '0000-00-00'),
(4, '19422092', 'AIXA DEL CARMEN', 'MARQUEZ', 'aixa', '202cb962ac59075b964b07152d234b70', 'U', 0, '0000-00-00', '0000-00-00'),
(9, '14663829', 'MARIBEL A', 'GONZALEZ', 'mary', '202cb962ac59075b964b07152d234b70', 'A', 0, '0000-00-00', '0000-00-00'),
(10, '12345672', 'LUISA ALEJANDRA', 'GONZALEZ', 'LUISA', '202cb962ac59075b964b07152d234b70', 'U', 0, '0000-00-00', '0000-00-00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areacomunicacion`
--
ALTER TABLE `areacomunicacion`
  ADD PRIMARY KEY (`codareacomunicacion`);

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`codasistencia`),
  ADD UNIQUE KEY `fechainicio` (`fechainicio`,`fechafin`,`coddocente`),
  ADD KEY `coddocente` (`coddocente`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id_bitacora`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`codcita`),
  ADD KEY `cedula` (`cedula`);

--
-- Indices de la tabla `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`coddirector`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`coddocente`);

--
-- Indices de la tabla `estud_repres`
--
ALTER TABLE `estud_repres`
  ADD PRIMARY KEY (`codestudiante`,`codrepresentante`),
  ADD KEY `codrepresentante` (`codrepresentante`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`codestudiante`),
  ADD KEY `codmunicipio` (`codmunicipio`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`codinscripcion`),
  ADD UNIQUE KEY `codestudiante` (`codestudiante`),
  ADD KEY `codinstitucion` (`codinstitucion`),
  ADD KEY `codusuario` (`codusuario`),
  ADD KEY `coddocente` (`coddocente`);

--
-- Indices de la tabla `institucionproce`
--
ALTER TABLE `institucionproce`
  ADD PRIMARY KEY (`codinstitucion`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`codmunicipio`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`codpregunta`);

--
-- Indices de la tabla `preguntas_usuarios`
--
ALTER TABLE `preguntas_usuarios`
  ADD PRIMARY KEY (`codusuario`,`codpregunta`),
  ADD KEY `codpregunta` (`codpregunta`);

--
-- Indices de la tabla `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`codprofesion`);

--
-- Indices de la tabla `representante`
--
ALTER TABLE `representante`
  ADD PRIMARY KEY (`codrepresentante`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD KEY `codmunicipio` (`codmunicipiorep`),
  ADD KEY `codprofesion` (`codprofesion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`codusuario`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areacomunicacion`
--
ALTER TABLE `areacomunicacion`
  MODIFY `codareacomunicacion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `codasistencia` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `codcita` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `director`
--
ALTER TABLE `director`
  MODIFY `coddirector` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `coddocente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `codestudiante` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `codinscripcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `institucionproce`
--
ALTER TABLE `institucionproce`
  MODIFY `codinstitucion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `codmunicipio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `codpregunta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `profesion`
--
ALTER TABLE `profesion`
  MODIFY `codprofesion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT de la tabla `representante`
--
ALTER TABLE `representante`
  MODIFY `codrepresentante` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `codusuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`coddocente`) REFERENCES `docentes` (`coddocente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estud_repres`
--
ALTER TABLE `estud_repres`
  ADD CONSTRAINT `estud_repres_ibfk_1` FOREIGN KEY (`codestudiante`) REFERENCES `estudiante` (`codestudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estud_repres_ibfk_2` FOREIGN KEY (`codrepresentante`) REFERENCES `representante` (`codrepresentante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`codmunicipio`) REFERENCES `municipios` (`codmunicipio`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`coddocente`) REFERENCES `docentes` (`coddocente`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`codestudiante`) REFERENCES `estudiante` (`codestudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preguntas_usuarios`
--
ALTER TABLE `preguntas_usuarios`
  ADD CONSTRAINT `preguntas_usuarios_ibfk_1` FOREIGN KEY (`codusuario`) REFERENCES `usuarios` (`codusuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preguntas_usuarios_ibfk_2` FOREIGN KEY (`codpregunta`) REFERENCES `preguntas` (`codpregunta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `representante`
--
ALTER TABLE `representante`
  ADD CONSTRAINT `representante_ibfk_1` FOREIGN KEY (`codprofesion`) REFERENCES `profesion` (`codprofesion`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Base de datos: `dppb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE IF NOT EXISTS `egresos` (
  `cod_egr` int(11) NOT NULL COMMENT 'Código de Egreso',
  `fech_egr` date NOT NULL COMMENT 'Fecha de Egreso',
  `clase_egr` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Clase de Egreso',
  `monto_egr` float NOT NULL COMMENT 'Monto del Egreso',
  `num_factura` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`cod_egr`, `fech_egr`, `clase_egr`, `monto_egr`, `num_factura`) VALUES
(1, '2015-10-02', 'Compra de hojas', 50.1, 123456),
(2, '2015-10-02', 'Compra de lapiz', 100.2, 789456),
(3, '2015-10-01', 'compra de papel', 1000, 34566778);

--
-- Disparadores `egresos`
--
DELIMITER $$
CREATE TRIGGER `control` AFTER UPDATE ON `egresos`
 FOR EACH ROW UPDATE fondos SET saldo=total_ingreso-total_egreso
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE IF NOT EXISTS `expediente` (
  `cod_exp` int(11) NOT NULL COMMENT 'Codigo de expediente',
  `copia_ced` char(1) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Copia de Cedula de Identidad',
  `foto` char(1) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Foto Carnet',
  `carpeta` char(1) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Carpeta Marron',
  `copia_titulo` char(1) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Copia de Titulo de bachiller',
  `sintesis` char(1) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Sistesis Curricular',
  `otros` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Otro tipo de expediente',
  `cod_part` int(11) NOT NULL COMMENT 'Código de Participante'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `expediente`
--

INSERT INTO `expediente` (`cod_exp`, `copia_ced`, `foto`, `carpeta`, `copia_titulo`, `sintesis`, `otros`, `cod_part`) VALUES
(1, 's', 's', 's', 's', 's', '', 7),
(2, 's', 's', 's', 's', 's', '', 7),
(3, 's', 's', 's', 's', 's', '', 8),
(4, 's', 's', 's', 's', 's', '', 5),
(5, 's', 's', 's', 's', 's', '', 11),
(6, 's', 's', 's', 's', 's', '', 3),
(7, 's', 's', 's', 's', 's', '', 6),
(8, 's', 's', 's', 's', 's', '', 16),
(9, 's', 's', 's', 's', 's', '', 18),
(10, 's', 's', 's', 's', 's', '', 12),
(11, 's', 's', 's', 's', 's', 'Rit', 13),
(12, 's', 's', 's', 's', 's', '', 4),
(13, 's', 's', 's', 's', 's', '', 19),
(14, 's', 's', 's', 's', 's', 'RIF', 23),
(15, 's', 's', 's', 's', 's', '', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondos`
--

CREATE TABLE IF NOT EXISTS `fondos` (
  `id` int(11) NOT NULL,
  `total_ingreso` int(11) NOT NULL,
  `total_egreso` int(11) NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `fondos`
--

INSERT INTO `fondos` (`id`, `total_ingreso`, `total_egreso`, `saldo`) VALUES
(1, 2250, 1100, 1150);

--
-- Disparadores `fondos`
--
DELIMITER $$
CREATE TRIGGER `gastos` AFTER UPDATE ON `fondos`
 FOR EACH ROW UPDATE fondos SET total_egreso=(SELECT (total_egreso + 2678) FROM fondos WHERE id=1) WHERE id=1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE IF NOT EXISTS `municipios` (
  `id_municipio` int(11) NOT NULL COMMENT 'Codigo de Municipio',
  `nomb_mun` varchar(30) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de Municipio'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `nomb_mun`) VALUES
(1, 'Libertador'),
(2, 'Campo Elias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_academico`
--

CREATE TABLE IF NOT EXISTS `nivel_academico` (
  `id_nivel` int(2) NOT NULL COMMENT 'Código de nivel Academico',
  `nomb_nivel` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del Nivel Academico'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `nivel_academico`
--

INSERT INTO `nivel_academico` (`id_nivel`, `nomb_nivel`) VALUES
(1, 'Primaria'),
(7, 'Bachillerato'),
(8, 'TÃ©cnico medio'),
(9, 'T.S.U'),
(10, 'Licenciado'),
(11, 'Ingeniero(a)'),
(12, 'Maestria'),
(13, 'Doctorado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `cedu_pac` int(11) NOT NULL COMMENT 'Cédula del Paciente',
  `nomb_pac` char(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del Paciente',
  `edad` int(3) NOT NULL COMMENT 'Edad del Paciente',
  `diag_pac` varchar(100) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Diagnostico del Paciente',
  `cod_serv` int(11) NOT NULL COMMENT 'Código de Servicio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE IF NOT EXISTS `participantes` (
  `cod_par` int(11) NOT NULL COMMENT 'Código de Participantes',
  `ced_part` int(11) NOT NULL COMMENT 'Cédula de Participante',
  `nomb_part` char(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de Participante',
  `apell_part` char(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Apellido de Participante',
  `profe_part` char(15) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Profesión de Participante',
  `tlfn_part` char(12) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Teléfono de Participante',
  `email_part` char(25) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Email de Participante',
  `id_nivel` int(11) NOT NULL COMMENT 'Código Nivel Academico',
  `nomenclatura` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'V',
  `dependencia` char(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`cod_par`, `ced_part`, `nomb_part`, `apell_part`, `profe_part`, `tlfn_part`, `email_part`, `id_nivel`, `nomenclatura`, `dependencia`) VALUES
(3, 20709289, 'Jorge', 'Castellano', 'juridico', '+58416137971', 'jorgecm14@gmail.com', 11, 'V', 'UPTM'),
(4, 19539526, 'Yuriesskys', 'Rojas', 'docente', '678909887654', 'yuriesskys.rojas@gmail.co', 10, 'V', 'SimÃ³n Rodriguez'),
(5, 24567897, 'Daniel', 'Rojas', 'ingeniero', '123456788899', 'danirojas@gmail.com', 11, 'V', 'Bolivar 2000'),
(6, 20145678, 'Yoel', 'Torres', 'ingeniero', '345678909876', 'yoeltorres@gmail.com', 11, 'V', 'Bolivar 2000'),
(7, 19996312, 'Yitzon', 'Colmenares', 'ingeniero', '0412-1256894', 'yistzon@gmail.com', 9, 'V', 'UPTT'),
(8, 23456789, 'Cirabel', 'Quintero', 'gerente', '0424-2345678', 'cirabelquintero@gmail.com', 10, 'V', 'UNA'),
(9, 87654345, 'Lizmar', 'Marquez', 'comerciante', '0416-1234567', 'lizmarquez@gmail.com', 1, 'V', 'ONA'),
(10, 56783928, 'Jesus', 'Davila', 'docente', '0412-0987678', 'davilajesus@gmail.com', 10, 'V', 'Liceo Ejido'),
(11, 44567889, 'Franci', 'Mantilla', 'ingeniero', '0426-9876548', 'franci@gmail.com', 11, 'V', 'UPTM'),
(12, 18345678, 'Argenis', 'Gil', 'economista', '0414-8765456', 'gil.argenis@gmail.com', 12, 'V', 'Alberto Adriani'),
(13, 67807654, 'Erika', 'Quintero', 'arquitecto', '0412-5708653', 'Erica2@gmail.com', 10, 'V', 'INIA'),
(14, 22784930, 'Jitzon', 'Colmenares', 'director', '0416-5637382', 'Colmenares8@gmail.com', 13, 'V', 'Banco de Venezuela'),
(15, 24689494, 'Ines', 'Benitez', 'administrador', '0426-3458686', 'benitez.ines@gmail.com', 9, 'V', 'Fundacite'),
(16, 74630498, 'Yosman', 'Mora', 'juridico', '0212-6473948', 'Mora23@gmail.com', 13, 'V', 'Colegio de Abogados'),
(17, 97542345, 'Benito', 'Paz', 'obrero', '0424-9875684', 'PazBenito@gmail.com', 1, 'V', 'Alcadia de Lagunillas'),
(18, 64738000, 'Xiomara', 'Ozorio', 'publicista', '0416-3478485', 'Xiomara234@gmail.com', 10, 'V', 'Santiago MariÃ±o'),
(19, 20398052, 'cira', 'quin', 'juridico', '04261387789', 'ciraquin@gmail.com', 9, '', 'uptm'),
(20, 24567900, 'Andru', 'Marquez', 'ingeniero', '0426-9776365', 'andru.123@gmail.com', 11, 'V', 'IUTT'),
(21, 25678890, 'Johana', 'Felisola', 'docente', '0215-5354890', 'johana_felisola@gmail.com', 10, 'V', 'SimÃ³n Rodriguez'),
(22, 45670000, 'Isamar', 'Colmenares', 'administrador', '2345-6677899', 'isamar_colmenares@gmail.c', 10, 'V', 'Liceo Lagunillas'),
(23, 12643784, 'Ronald', 'Rivera', 'gerente', '2345-8338848', 'ronal@gmail.com', 10, 'V', 'UPTM'),
(24, 10898072, 'Albert', 'Romero', 'ingeniero', '0414-3455677', 'albert@gmail.com', 11, 'V', 'UPTM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE IF NOT EXISTS `planes` (
  `cod_plan` int(11) NOT NULL COMMENT 'Código de Planes',
  `tipo_plan` int(11) NOT NULL COMMENT 'Tipo de Planes',
  `nomb_plan` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del Plan ',
  `desc_plan` varchar(250) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripción del Plan ',
  `cant_unid` int(2) NOT NULL COMMENT 'Cantidad de U.T a cancelar',
  `id_unid` int(11) DEFAULT NULL COMMENT 'Código de la Unidad Tributaria'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`cod_plan`, `tipo_plan`, `nomb_plan`, `desc_plan`, `cant_unid`, `id_unid`) VALUES
(2, 1, 'Evacuación de terremotos', 'Retiro de personas en lugares cerrados', 0, 2),
(3, 1, 'AtenciÃ³n de parto', 'Parto vaginal espontÃ¡neo, Parto abdominal', 0, 2),
(4, 2, 'RCP', 'La reanimaciÃ³n cardiopulmonar(RCP) es un procedimiento de emergencia para salvar vidas que se utiliza cuando una persona ha dejado de respirar y el corazÃ³n ha cesado de palpitar.', 2, 2),
(5, 2, 'Primero auxilios', 'AtenciÃ³n inmediata que se le da a una persona enferma o lesionada en el lugar de los acontecimientos', 3, 2),
(6, 3, 'Manejo de Fuegos Artificiales', 'La forma mÃ¡s segura de prevenir las lesiones relacionadas con los fuegos artificiales es dejando el uso de estos a profesionales que han recibido entrenamiento..', 0, 2),
(7, 3, 'Incendios forestales', 'Un incendio forestal se distingue de otros tipos de incendio por su amplia extensiÃ³n, la velocidad con la que se puede extender desde su lugar de origen, su potencial para cambiar de direcciÃ³n inesperadamente, y su capacidad para superar obstÃ¡culo', 0, 2),
(8, 4, 'AtenciÃ³n pre-hospitalaria  ', 'IntroducciÃ³n, Objetivos, Precauciones ', 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_participantes`
--

CREATE TABLE IF NOT EXISTS `planes_participantes` (
  `id` int(11) NOT NULL,
  `cod_plan` int(11) NOT NULL,
  `cod_par` int(11) NOT NULL,
  `nota` int(2) unsigned zerofill DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `status` varchar(12) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'pre-inscrito',
  `exonerado` varchar(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'No',
  `bauche` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes_participantes`
--

INSERT INTO `planes_participantes` (`id`, `cod_plan`, `cod_par`, `nota`, `precio`, `status`, `exonerado`, `bauche`) VALUES
(9, 3, 5, 16, 0, 'inscrito', 'No', 2147483647),
(11, 7, 6, NULL, 0, 'inscrito', 'No', 2147483647),
(12, 5, 7, NULL, 450, 'inscrito', 'No', 2147483647),
(14, 5, 3, NULL, 450, 'inscrito', 'No', 23456789),
(15, 3, 3, 12, 0, 'inscrito', 'Si', 0),
(16, 5, 8, NULL, 450, 'inscrito', 'Si', 0),
(20, 3, 12, 20, 300, 'inscrito', 'No', 12345420),
(24, 4, 16, NULL, 300, 'inscrito', 'Si', 0),
(26, 9, 18, NULL, 0, 'inscrito', 'No', 2147483647),
(27, 13, 7, 15, 450, 'inscrito', 'No', 1234567),
(28, 13, 3, 18, 450, 'inscrito', 'No', 12345670),
(29, 13, 4, 20, 450, 'inscrito', 'No', 1234567),
(30, 5, 19, NULL, 0, 'inscrito', 'No', 908978654),
(31, 5, 19, NULL, 0, 'inscrito', 'No', 908978654),
(32, 5, 20, NULL, 0, 'pre-inscrito', 'No', NULL),
(33, 6, 21, NULL, 0, 'pre-inscrito', 'No', NULL),
(34, 16, 22, NULL, 600, 'pre-inscrito', 'No', NULL),
(35, 7, 23, NULL, 0, 'inscrito', 'No', 2147483647),
(36, 7, 24, NULL, 0, 'pre-inscrito', 'No', NULL),
(37, 18, 24, NULL, 300, 'inscrito', 'No', 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_responsables`
--

CREATE TABLE IF NOT EXISTS `planes_responsables` (
  `id` int(11) NOT NULL,
  `cod_plan` int(11) NOT NULL COMMENT 'Código de Plan ',
  `cod_resp` int(11) NOT NULL COMMENT 'Código de Responsable',
  `lugar` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'por-iniciar',
  `Dia_I` int(2) unsigned zerofill NOT NULL,
  `Mes_I` int(2) unsigned zerofill NOT NULL,
  `Ano_I` int(4) unsigned zerofill NOT NULL,
  `Dia_F` int(2) unsigned zerofill NOT NULL,
  `Mes_F` int(2) unsigned zerofill NOT NULL,
  `Ano_F` int(4) unsigned zerofill NOT NULL,
  `horario` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes_responsables`
--

INSERT INTO `planes_responsables` (`id`, `cod_plan`, `cod_resp`, `lugar`, `status`, `Dia_I`, `Mes_I`, `Ano_I`, `Dia_F`, `Mes_F`, `Ano_F`, `horario`) VALUES
(3, 4, 6, 'UPTM', 'culminado', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(4, 7, 8, 'iute', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(5, 2, 6, 'laboratorio', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(6, 3, 8, 'laboratorio', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(7, 6, 6, 'laboratorio', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(8, 7, 8, 'ula', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(9, 7, 6, 'ula', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(10, 7, 6, 'UPTM', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(13, 5, 8, 'Inia', 'culminado', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(15, 5, 11, 'IUFRONT', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(16, 8, 10, 'CDI', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(17, 8, 10, 'laboratorio', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(18, 4, 6, 'Gobernacion', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(19, 2, 8, 'laboratorio', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(20, 6, 11, 'UPTM', 'por-iniciar', 00, 00, 0000, 00, 00, 0000, '00:00:00'),
(21, 2, 6, 'UPTM', 'por-iniciar', 01, 00, 2015, 01, 00, 2015, '00:00:00'),
(22, 4, 6, 'IUFRONT', 'por-iniciar', 04, 01, 2015, 08, 01, 2015, '00:00:00'),
(23, 8, 10, 'hospital', 'por-iniciar', 03, 12, 2015, 04, 12, 2015, '00:00:00'),
(24, 4, 8, 'unefa', 'por-iniciar', 06, 01, 2015, 07, 01, 2015, '00:00:00'),
(25, 8, 8, 'laboratorio', 'por-iniciar', 17, 11, 2015, 19, 12, 2015, '13:56:00'),
(26, 2, 6, 'MERD', 'por-iniciar', 19, 05, 2016, 20, 05, 2015, '14:02:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsables`
--

CREATE TABLE IF NOT EXISTS `responsables` (
  `cod_resp` int(11) NOT NULL COMMENT 'Código Responsable',
  `ced_resp` int(8) NOT NULL COMMENT 'Cédula Responsable',
  `nomb_resp` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre Responsable',
  `apell_resp` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Apellido Responsable',
  `espe_resp` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Especialidad Responsable',
  `id_nivel` int(11) NOT NULL COMMENT 'Codigo Nivel',
  `id_tipo` int(11) NOT NULL COMMENT 'Código de Tipo de Responsable'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `responsables`
--

INSERT INTO `responsables` (`cod_resp`, `ced_resp`, `nomb_resp`, `apell_resp`, `espe_resp`, `id_nivel`, `id_tipo`) VALUES
(6, 20709289, 'Jorge', 'Castellano', 'InformÃ¡tica', 1, 1),
(8, 23556948, 'Jurielis', 'Rojas', 'TSU Informatica', 9, 4),
(10, 19996312, 'Yisbeli', 'Cano', 'Comerciante', 9, 4),
(11, 20433593, 'Yohander', 'Sanchez', 'Bombero', 9, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE IF NOT EXISTS `servicios` (
  `cod_serv` int(11) NOT NULL COMMENT 'Código de Servicio ',
  `fecha_serv` date NOT NULL,
  `hora_salida` time NOT NULL COMMENT 'Hora de Salida de ambulancia de la estacion',
  `hora_llegada` time NOT NULL COMMENT 'Hora de Llegada al sitio donde se encuentra el paciente',
  `hora_ingreso` time NOT NULL COMMENT 'Hora de Ingreso nuevamente a la estacion',
  `parroquia` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Parroquia donde se presto el servicio',
  `direc_salida` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Dirección salida de la Ambulacia ',
  `direc_destino` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Dirección de Destino de la Ambulancia',
  `id_tipo_serv` int(11) NOT NULL COMMENT 'Código de Tipo de Servicio  ',
  `id_unidad` int(11) NOT NULL COMMENT 'Código del Vehiculo',
  `id_municipio` int(11) NOT NULL COMMENT 'Código de Municipio',
  `cod_resp` int(11) NOT NULL COMMENT 'Código de Responsable '
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`cod_serv`, `fecha_serv`, `hora_salida`, `hora_llegada`, `hora_ingreso`, `parroquia`, `direc_salida`, `direc_destino`, `id_tipo_serv`, `id_unidad`, `id_municipio`, `cod_resp`) VALUES
(1, '2016-02-16', '12:00:00', '13:00:00', '14:00:00', 'jj osuna', 'los curos', 'parte baja', 1, 1, 1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_plan`
--

CREATE TABLE IF NOT EXISTS `tipo_plan` (
  `idtipoplan` int(11) NOT NULL,
  `nomb_plan` varchar(100) NOT NULL,
  `evaluacion` varchar(2) NOT NULL DEFAULT 'no'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_plan`
--

INSERT INTO `tipo_plan` (`idtipoplan`, `nomb_plan`, `evaluacion`) VALUES
(1, 'Taller', 'no'),
(2, 'Curso', 'si'),
(3, 'Charla', 'no'),
(4, 'Seminario', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE IF NOT EXISTS `tipo_servicio` (
  `id_tipo_serv` int(11) NOT NULL COMMENT 'Código de Tipo de Servicio',
  `nomb_tipo_serv` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de Tipo de Servicio'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_servicio`
--

INSERT INTO `tipo_servicio` (`id_tipo_serv`, `nomb_tipo_serv`) VALUES
(1, 'Emergencia'),
(2, 'Traslado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_resp`
--

CREATE TABLE IF NOT EXISTS `tipos_resp` (
  `id_tipo` int(11) NOT NULL COMMENT 'Tipo de Responsable ',
  `nomb_tipo` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del Tipo de Responsable'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipos_resp`
--

INSERT INTO `tipos_resp` (`id_tipo`, `nomb_tipo`) VALUES
(1, 'Sargento I'),
(2, 'Sargento II'),
(3, 'Instructor'),
(4, 'Coordinador'),
(5, 'Coronel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE IF NOT EXISTS `unidades` (
  `id_unidad` int(2) NOT NULL COMMENT 'Código del Vehículo  ',
  `nro_unidad` int(11) NOT NULL COMMENT 'Numero de Unidad',
  `marca` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Marca del Vehiculo',
  `modelo` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Modelo del Vehiculo',
  `placa` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Placa del Vehiculo',
  `seudonimo` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Apodo del Vehiculo',
  `estacion` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Estación a la que pertenece el Vehiculo'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id_unidad`, `nro_unidad`, `marca`, `modelo`, `placa`, `seudonimo`, `estacion`) VALUES
(1, 1, 'Ford', 'Eco spor', 'xsr-503', 'Carro Bomba', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_trib`
--

CREATE TABLE IF NOT EXISTS `unidades_trib` (
  `id_unid` int(11) NOT NULL COMMENT 'Código de la UT',
  `ano_unid` char(4) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Ano en q aumenta la UT',
  `fecha_unid` date NOT NULL COMMENT 'Fecha en q aumenta la UT',
  `valor_unid` int(11) NOT NULL COMMENT 'Valor de la UT'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidades_trib`
--

INSERT INTO `unidades_trib` (`id_unid`, `ano_unid`, `fecha_unid`, `valor_unid`) VALUES
(1, '2014', '2014-01-01', 120),
(2, '2015', '2015-01-15', 140),
(3, '2015', '2015-10-02', 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(11) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `clave` varchar(40) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT '2',
  `responsable` int(11) DEFAULT NULL,
  `status` varchar(12) NOT NULL DEFAULT 'por-aprobar'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `correo`, `clave`, `nombre`, `tipo`, `responsable`, `status`) VALUES
(2, 'jurielis.rojas10@gmail.com', 'hisopo24.', 'Jurielis Rojas', 1, 8, 'aprobado'),
(4, 'administrador@gmail.com', 'Futbol312.', 'Yisbeli Cano', 1, 10, 'aprobado'),
(5, 'responsable@gmail.com', '19996312.', 'Pedro', 2, 11, 'aprobado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`cod_egr`);

--
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD PRIMARY KEY (`cod_exp`),
  ADD KEY `cod_part` (`cod_part`);

--
-- Indices de la tabla `fondos`
--
ALTER TABLE `fondos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`);

--
-- Indices de la tabla `nivel_academico`
--
ALTER TABLE `nivel_academico`
  ADD PRIMARY KEY (`id_nivel`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`cedu_pac`),
  ADD KEY `cod_serv` (`cod_serv`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`cod_par`),
  ADD UNIQUE KEY `ced_part` (`ced_part`),
  ADD KEY `id_nivel` (`id_nivel`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`cod_plan`),
  ADD KEY `id_unid` (`id_unid`),
  ADD KEY `tipo_plan` (`tipo_plan`);

--
-- Indices de la tabla `planes_participantes`
--
ALTER TABLE `planes_participantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cod_plan` (`cod_plan`),
  ADD KEY `cod_par` (`cod_par`);

--
-- Indices de la tabla `planes_responsables`
--
ALTER TABLE `planes_responsables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cod_resp` (`cod_resp`),
  ADD KEY `cod_plan` (`cod_plan`) USING BTREE;

--
-- Indices de la tabla `responsables`
--
ALTER TABLE `responsables`
  ADD PRIMARY KEY (`cod_resp`),
  ADD KEY `id_nivel` (`id_nivel`,`id_tipo`),
  ADD KEY `id_nivel_2` (`id_nivel`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`cod_serv`),
  ADD KEY `id_tipo_serv` (`id_tipo_serv`,`id_unidad`,`id_municipio`),
  ADD KEY `cod_resp` (`cod_resp`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_unidad` (`id_unidad`);

--
-- Indices de la tabla `tipo_plan`
--
ALTER TABLE `tipo_plan`
  ADD PRIMARY KEY (`idtipoplan`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`id_tipo_serv`);

--
-- Indices de la tabla `tipos_resp`
--
ALTER TABLE `tipos_resp`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `unidades_trib`
--
ALTER TABLE `unidades_trib`
  ADD PRIMARY KEY (`id_unid`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `cod_egr` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Egreso',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `cod_exp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de expediente',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `fondos`
--
ALTER TABLE `fondos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Municipio',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `nivel_academico`
--
ALTER TABLE `nivel_academico`
  MODIFY `id_nivel` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Código de nivel Academico',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `participantes`
--
ALTER TABLE `participantes`
  MODIFY `cod_par` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Participantes',AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `cod_plan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Planes',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `planes_participantes`
--
ALTER TABLE `planes_participantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `planes_responsables`
--
ALTER TABLE `planes_responsables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `responsables`
--
ALTER TABLE `responsables`
  MODIFY `cod_resp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código Responsable',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `cod_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Servicio ',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_plan`
--
ALTER TABLE `tipo_plan`
  MODIFY `idtipoplan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `id_tipo_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Tipo de Servicio',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipos_resp`
--
ALTER TABLE `tipos_resp`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo de Responsable ',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id_unidad` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Código del Vehículo  ',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `unidades_trib`
--
ALTER TABLE `unidades_trib`
  MODIFY `id_unid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la UT',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD CONSTRAINT `expediente_ibfk_1` FOREIGN KEY (`cod_part`) REFERENCES `participantes` (`cod_par`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`cod_serv`) REFERENCES `servicios` (`cod_serv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD CONSTRAINT `participantes_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel_academico` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `planes`
--
ALTER TABLE `planes`
  ADD CONSTRAINT `planes_ibfk_1` FOREIGN KEY (`id_unid`) REFERENCES `unidades_trib` (`id_unid`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `planes_ibfk_2` FOREIGN KEY (`tipo_plan`) REFERENCES `tipo_plan` (`idtipoplan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `planes_participantes`
--
ALTER TABLE `planes_participantes`
  ADD CONSTRAINT `planes_participantes_ibfk_2` FOREIGN KEY (`cod_par`) REFERENCES `participantes` (`cod_par`),
  ADD CONSTRAINT `planes_participantes_ibfk_3` FOREIGN KEY (`cod_plan`) REFERENCES `planes_responsables` (`id`);

--
-- Filtros para la tabla `planes_responsables`
--
ALTER TABLE `planes_responsables`
  ADD CONSTRAINT `planes_responsables_ibfk_1` FOREIGN KEY (`cod_plan`) REFERENCES `planes` (`cod_plan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `planes_responsables_ibfk_2` FOREIGN KEY (`cod_resp`) REFERENCES `responsables` (`cod_resp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `responsables`
--
ALTER TABLE `responsables`
  ADD CONSTRAINT `responsables_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel_academico` (`id_nivel`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `responsables_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_resp` (`id_tipo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`cod_resp`) REFERENCES `responsables` (`cod_resp`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `servicios_ibfk_2` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `servicios_ibfk_3` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id_unidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `servicios_ibfk_4` FOREIGN KEY (`id_tipo_serv`) REFERENCES `tipo_servicio` (`id_tipo_serv`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `dppb2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE IF NOT EXISTS `egresos` (
  `cod_egr` int(11) NOT NULL COMMENT 'C?digo de Egreso',
  `fech_egr` date NOT NULL COMMENT 'Fecha de Egreso',
  `clase_egr` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Clase de Egreso',
  `monto_egr` float NOT NULL COMMENT 'Monto del Egreso',
  `num_factura` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`cod_egr`, `fech_egr`, `clase_egr`, `monto_egr`, `num_factura`) VALUES
(1, '2015-10-02', 'Compra de hojas', 50.1, 123456),
(2, '2015-10-02', 'Compra de lap', 100.2, 789456),
(3, '2015-10-01', 'compra de papel', 1000, 34566778);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE IF NOT EXISTS `expediente` (
  `cod_exp` int(11) NOT NULL COMMENT 'Codigo de expediente',
  `copia_ced` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Copia de Cedula de Identidad',
  `foto` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Foto Carnet',
  `carpeta` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Carpeta Marron',
  `copia_titulo` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Copia de Titulo de bachiller',
  `sintesis` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Sistesis Curricular',
  `otros` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Otro tipo de expediente',
  `cod_part` int(11) NOT NULL COMMENT 'C?digo de Participante'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `expediente`
--

INSERT INTO `expediente` (`cod_exp`, `copia_ced`, `foto`, `carpeta`, `copia_titulo`, `sintesis`, `otros`, `cod_part`) VALUES
(1, 's', 's', 's', 's', 's', '', 7),
(2, 's', 's', 's', 's', 's', '', 7),
(3, 's', 's', 's', 's', 's', '', 8),
(4, 's', 's', 's', 's', 's', '', 5),
(5, 's', 's', 's', 's', 's', '', 11),
(6, 's', 's', 's', 's', 's', '', 3),
(7, 's', 's', 's', 's', 's', '', 6),
(8, 's', 's', 's', 's', 's', '', 16),
(9, 's', 's', 's', 's', 's', '', 18),
(10, 's', 's', 's', 's', 's', '', 12),
(11, 's', 's', 's', 's', 's', 'Rit', 13),
(12, 's', 's', 's', 's', 's', '', 4),
(13, 's', 's', 's', 's', 's', '', 19),
(14, 's', 's', 's', 's', 's', 'RIF', 23),
(15, 's', 's', 's', 's', 's', '', 24),
(16, 's', 's', 's', 's', 's', '', 32),
(17, 's', 's', 's', 's', 's', '', 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE IF NOT EXISTS `municipios` (
  `id_municipio` int(11) NOT NULL COMMENT 'Codigo de Municipio',
  `nomb_mun` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de Municipio'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `nomb_mun`) VALUES
(1, 'Libertador'),
(2, 'Campo Elias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_academico`
--

CREATE TABLE IF NOT EXISTS `nivel_academico` (
  `id_nivel` int(2) NOT NULL COMMENT 'C?digo de nivel Academico',
  `nomb_nivel` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Nivel Academico'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `nivel_academico`
--

INSERT INTO `nivel_academico` (`id_nivel`, `nomb_nivel`) VALUES
(1, 'Primaria'),
(7, 'Bachillerato'),
(9, 'T.S.U'),
(10, 'Universitario'),
(11, 'Ingeniero(a)'),
(12, 'Maestria'),
(13, 'Doctorado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `cedu_pac` int(11) NOT NULL COMMENT 'C?dula del Paciente',
  `nomb_pac` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Paciente',
  `edad` int(3) NOT NULL COMMENT 'Edad del Paciente',
  `diag_pac` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Diagnostico del Paciente',
  `cod_serv` int(11) NOT NULL COMMENT 'C?digo de Servicio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE IF NOT EXISTS `participantes` (
  `cod_par` int(11) NOT NULL COMMENT 'C?digo de Participantes',
  `ced_part` int(11) NOT NULL COMMENT 'C?dula de Participante',
  `nomb_part` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de Participante',
  `apell_part` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apellido de Participante',
  `nota` int(2) NOT NULL,
  `profe_part` char(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Profesi?n de Participante',
  `tlfn_part` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tel?fono de Participante',
  `email_part` char(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Email de Participante',
  `id_nivel` int(11) NOT NULL COMMENT 'C?digo Nivel Academico',
  `nomenclatura` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'V',
  `dependencia` char(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`cod_par`, `ced_part`, `nomb_part`, `apell_part`, `nota`, `profe_part`, `tlfn_part`, `email_part`, `id_nivel`, `nomenclatura`, `dependencia`) VALUES
(33, 9987876, 'Byron', 'quintero', 0, 'publicista', '09876546543', 'byron@gmail.com', 9, '', 'no se'),
(35, 22345345, 'akim', 'sajal', 0, 'publicista', '0426-3144987', 'akim@gmail.com', 9, '', 'sdfgh');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE IF NOT EXISTS `planes` (
  `cod_plan` int(11) NOT NULL COMMENT 'C?digo de Planes',
  `tipo_plan` int(11) NOT NULL COMMENT 'Tipo de Planes',
  `nomb_plan` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Plan ',
  `desc_plan` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripci?n del Plan ',
  `cant_unid` int(2) NOT NULL COMMENT 'Cantidad de U.T a cancelar',
  `id_unid` int(11) DEFAULT NULL COMMENT 'C?digo de la Unidad Tributaria'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`cod_plan`, `tipo_plan`, `nomb_plan`, `desc_plan`, `cant_unid`, `id_unid`) VALUES
(10, 5, 'telefono ', 'gt i9192', 4, 3),
(11, 3, 'sobres de cartas', 'qwertyui', 3, 3),
(12, 6, 'lkjhgfrde', 'dfghjk', 4, 3),
(13, 5, 'kkjhjgfdsa', 'oiuytrdefjkmjg', 1, 3),
(14, 6, 'o987ygg', 'kjhgfgfdesaw', 1, 3),
(15, 6, 'nunu', 'nunu', 2, 3),
(16, 3, 'niÃ±os', 'sdcfgvhbjkmlÃ±,kjhgf', 3, 3),
(17, 0, '', '', 0, 3),
(18, 7, 'frotty lopy', 'comida', 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_participantes`
--

CREATE TABLE IF NOT EXISTS `planes_participantes` (
  `id` int(11) NOT NULL,
  `cod_plan` int(11) NOT NULL,
  `cod_par` int(11) NOT NULL,
  `nota` int(2) unsigned zerofill DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `status` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pre-inscrito',
  `exonerado` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `bauche` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes_participantes`
--

INSERT INTO `planes_participantes` (`id`, `cod_plan`, `cod_par`, `nota`, `precio`, `status`, `exonerado`, `bauche`) VALUES
(37, 18, 24, 00, 300, 'inscrito', 'No', 2147483647),
(38, 0, 25, NULL, 0, 'pre-inscrito', 'No', NULL),
(39, 0, 26, NULL, 0, 'pre-inscrito', 'No', NULL),
(40, 10, 27, NULL, 0, 'pre-inscrito', 'No', NULL),
(41, 12, 28, NULL, 0, 'pre-inscrito', 'No', NULL),
(42, 0, 29, NULL, 0, 'pre-inscrito', 'No', NULL),
(43, 16, 30, NULL, 0, 'pre-inscrito', 'No', NULL),
(44, 10, 31, NULL, 0, 'pre-inscrito', 'No', NULL),
(45, 10, 32, NULL, 0, 'pre-inscrito', 'No', NULL),
(46, 10, 33, NULL, 0, 'pre-inscrito', 'No', NULL),
(47, 18, 34, NULL, 0, 'pre-inscrito', 'No', NULL),
(48, 18, 35, NULL, 0, 'pre-inscrito', 'No', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_responsables`
--

CREATE TABLE IF NOT EXISTS `planes_responsables` (
  `id` int(11) NOT NULL,
  `cod_plan` int(11) NOT NULL COMMENT 'C?digo de Plan ',
  `cod_resp` int(11) NOT NULL COMMENT 'C?digo de Responsable',
  `lugar` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `horario` time NOT NULL,
  `Fecha_inicio` text COLLATE utf8_spanish_ci NOT NULL,
  `Fecha_fin` text COLLATE utf8_spanish_ci NOT NULL,
  `idstatus` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes_responsables`
--

INSERT INTO `planes_responsables` (`id`, `cod_plan`, `cod_resp`, `lugar`, `horario`, `Fecha_inicio`, `Fecha_fin`, `idstatus`) VALUES
(28, 10, 15, 'ejido', '00:00:00', '1970-01-01', '1970-01-01', 0),
(29, 0, 15, 'bomberos', '00:00:00', '1970-01-01', '1970-01-01', 0),
(30, 12, 15, 'nijkhghfd', '00:00:00', '1970-01-01', '1970-01-01', 0),
(31, 15, 15, 'jhhff', '00:00:00', '1970-01-01', '1970-01-01', 0),
(32, 15, 15, 'sausales', '00:00:00', '1970-01-01', '1970-01-01', 0),
(33, 16, 15, 'howard', '00:00:00', '1970-01-01', '1970-01-01', 0),
(34, 18, 15, 'asdfg', '00:00:00', '1970-01-01', '1970-01-01', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsables`
--

CREATE TABLE IF NOT EXISTS `responsables` (
  `cod_resp` int(11) NOT NULL COMMENT 'C?digo Responsable',
  `ced_resp` int(8) NOT NULL COMMENT 'C?dula Responsable',
  `nomb_resp` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre Responsable',
  `apell_resp` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apellido Responsable',
  `espe_resp` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Especialidad Responsable',
  `id_nivel` int(11) NOT NULL COMMENT 'Codigo Nivel',
  `id_tipo` int(11) NOT NULL COMMENT 'C?digo de Tipo de Responsable'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `responsables`
--

INSERT INTO `responsables` (`cod_resp`, `ced_resp`, `nomb_resp`, `apell_resp`, `espe_resp`, `id_nivel`, `id_tipo`) VALUES
(15, 6861942, 'belkis', 'soto', 'profesora', 10, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE IF NOT EXISTS `servicios` (
  `cod_serv` int(11) NOT NULL COMMENT 'C?digo de Servicio ',
  `fecha_serv` date NOT NULL,
  `hora_salida` time NOT NULL COMMENT 'Hora de Salida de ambulancia de la estacion',
  `hora_llegada` time NOT NULL COMMENT 'Hora de Llegada al sitio donde se encuentra el paciente',
  `hora_ingreso` time NOT NULL COMMENT 'Hora de Ingreso nuevamente a la estacion',
  `parroquia` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Parroquia donde se presto el servicio',
  `direc_salida` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Direcci?n salida de la Ambulacia ',
  `direc_destino` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Direcci?n de Destino de la Ambulancia',
  `id_tipo_serv` int(11) NOT NULL COMMENT 'C?digo de Tipo de Servicio  ',
  `id_unidad` int(11) NOT NULL COMMENT 'C?digo del Vehiculo',
  `id_municipio` int(11) NOT NULL COMMENT 'C?digo de Municipio',
  `cod_resp` int(11) NOT NULL COMMENT 'C?digo de Responsable '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `statuspl`
--

CREATE TABLE IF NOT EXISTS `statuspl` (
  `idstatus` int(11) NOT NULL,
  `nomb_status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `statuspl`
--

INSERT INTO `statuspl` (`idstatus`, `nomb_status`) VALUES
(1, 'Por-Iniciar'),
(2, 'En Curso'),
(3, 'Culminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_plan`
--

CREATE TABLE IF NOT EXISTS `tipo_plan` (
  `idtipoplan` int(11) NOT NULL,
  `nomb_plan` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `evaluacion` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_plan`
--

INSERT INTO `tipo_plan` (`idtipoplan`, `nomb_plan`, `evaluacion`) VALUES
(1, 'Taller', 'no'),
(2, 'Curso', 'si'),
(3, 'Charla', 'no'),
(4, 'Seminario', 'si'),
(5, 'samsung', 'si'),
(6, 'accion', 'si'),
(7, 'mesas de trabajo', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE IF NOT EXISTS `tipo_servicio` (
  `id_tipo_serv` int(11) NOT NULL COMMENT 'C?digo de Tipo de Servicio',
  `nomb_tipo_serv` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de Tipo de Servicio'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_servicio`
--

INSERT INTO `tipo_servicio` (`id_tipo_serv`, `nomb_tipo_serv`) VALUES
(1, 'Traslado'),
(2, 'Emergencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_resp`
--

CREATE TABLE IF NOT EXISTS `tipos_resp` (
  `id_tipo` int(11) NOT NULL COMMENT 'Tipo de Responsable ',
  `nomb_tipo` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Tipo de Responsable'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipos_resp`
--

INSERT INTO `tipos_resp` (`id_tipo`, `nomb_tipo`) VALUES
(1, 'Sargento I'),
(2, 'Sargento II'),
(3, 'Instructor'),
(4, 'Coordinador'),
(5, 'Coronel'),
(6, 'cuidador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE IF NOT EXISTS `unidades` (
  `id_unidad` int(2) NOT NULL COMMENT 'C?digo del Veh?culo  ',
  `nro_unidad` int(11) NOT NULL COMMENT 'Numero de Unidad',
  `marca` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Marca del Vehiculo',
  `modelo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Modelo del Vehiculo',
  `placa` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Placa del Vehiculo',
  `seudonimo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apodo del Vehiculo',
  `estacion` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Estaci?n a la que pertenece el Vehiculo'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id_unidad`, `nro_unidad`, `marca`, `modelo`, `placa`, `seudonimo`, `estacion`) VALUES
(1, 1, 'Ford', 'Eco spor', 'xsr-503', 'Carro Bomba', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_trib`
--

CREATE TABLE IF NOT EXISTS `unidades_trib` (
  `id_unid` int(11) NOT NULL COMMENT 'C?digo de la UT',
  `ano_unid` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ano en q aumenta la UT',
  `fecha_unid` date NOT NULL COMMENT 'Fecha en q aumenta la UT',
  `valor_unid` int(11) NOT NULL COMMENT 'Valor de la UT'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidades_trib`
--

INSERT INTO `unidades_trib` (`id_unid`, `ano_unid`, `fecha_unid`, `valor_unid`) VALUES
(1, '2014', '2014-01-01', 120),
(2, '2015', '2015-01-15', 140),
(3, '2015', '2015-10-02', 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(11) NOT NULL,
  `correo` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `clave` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT '2',
  `responsable` int(11) DEFAULT NULL,
  `status` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'por-aprobar',
  `pregunta` int(2) NOT NULL,
  `respuesta` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `correo`, `clave`, `nombre`, `tipo`, `responsable`, `status`, `pregunta`, `respuesta`) VALUES
(10, 'jurielis.rojas10@gmail.com', '202cb962ac59075b964b07152d234b70', 'jurielis', 1, NULL, 'aprobado', 1, '841739de6fa81b972993ff1a8192f93e');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`cod_egr`);

--
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD PRIMARY KEY (`cod_exp`),
  ADD KEY `cod_part` (`cod_part`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`);

--
-- Indices de la tabla `nivel_academico`
--
ALTER TABLE `nivel_academico`
  ADD PRIMARY KEY (`id_nivel`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`cedu_pac`),
  ADD KEY `cod_serv` (`cod_serv`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`cod_par`),
  ADD UNIQUE KEY `ced_part` (`ced_part`),
  ADD KEY `id_nivel` (`id_nivel`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`cod_plan`),
  ADD KEY `id_unid` (`id_unid`),
  ADD KEY `tipo_plan` (`tipo_plan`);

--
-- Indices de la tabla `planes_participantes`
--
ALTER TABLE `planes_participantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cod_plan` (`cod_plan`),
  ADD KEY `cod_par` (`cod_par`);

--
-- Indices de la tabla `planes_responsables`
--
ALTER TABLE `planes_responsables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cod_resp` (`cod_resp`),
  ADD KEY `cod_plan` (`cod_plan`) USING BTREE,
  ADD KEY `idstatus` (`idstatus`);

--
-- Indices de la tabla `responsables`
--
ALTER TABLE `responsables`
  ADD PRIMARY KEY (`cod_resp`),
  ADD KEY `id_nivel` (`id_nivel`,`id_tipo`),
  ADD KEY `id_nivel_2` (`id_nivel`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`cod_serv`),
  ADD KEY `id_tipo_serv` (`id_tipo_serv`,`id_unidad`,`id_municipio`),
  ADD KEY `cod_resp` (`cod_resp`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_unidad` (`id_unidad`);

--
-- Indices de la tabla `statuspl`
--
ALTER TABLE `statuspl`
  ADD PRIMARY KEY (`idstatus`);

--
-- Indices de la tabla `tipo_plan`
--
ALTER TABLE `tipo_plan`
  ADD PRIMARY KEY (`idtipoplan`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`id_tipo_serv`);

--
-- Indices de la tabla `tipos_resp`
--
ALTER TABLE `tipos_resp`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `unidades_trib`
--
ALTER TABLE `unidades_trib`
  ADD PRIMARY KEY (`id_unid`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `cod_egr` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de Egreso',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `cod_exp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de expediente',AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Municipio',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `nivel_academico`
--
ALTER TABLE `nivel_academico`
  MODIFY `id_nivel` int(2) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de nivel Academico',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `participantes`
--
ALTER TABLE `participantes`
  MODIFY `cod_par` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de Participantes',AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `cod_plan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de Planes',AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `planes_participantes`
--
ALTER TABLE `planes_participantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT de la tabla `planes_responsables`
--
ALTER TABLE `planes_responsables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `responsables`
--
ALTER TABLE `responsables`
  MODIFY `cod_resp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo Responsable',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `cod_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de Servicio ';
--
-- AUTO_INCREMENT de la tabla `statuspl`
--
ALTER TABLE `statuspl`
  MODIFY `idstatus` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_plan`
--
ALTER TABLE `tipo_plan`
  MODIFY `idtipoplan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `id_tipo_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de Tipo de Servicio',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipos_resp`
--
ALTER TABLE `tipos_resp`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo de Responsable ',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id_unidad` int(2) NOT NULL AUTO_INCREMENT COMMENT 'C?digo del Veh?culo  ',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `unidades_trib`
--
ALTER TABLE `unidades_trib`
  MODIFY `id_unid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de la UT',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;--
-- Base de datos: `test`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
