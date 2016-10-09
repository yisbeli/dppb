-- phpMyAdmin SQL Dump
-- version 4.4.8
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2016 a las 22:13:55
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `comarpe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobradores`
--

CREATE TABLE IF NOT EXISTS `cobradores` (
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` int(11) NOT NULL,
  `cuentas_cobradas` int(11) NOT NULL,
  `zona` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cobradores`
--

INSERT INTO `cobradores` (`nombre`, `cedula`, `cuentas_cobradas`, `zona`) VALUES
('ciro quintero', 3962250, 430, 'foranea'),
('ronald avila', 20435525, 360, 'local');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerentes`
--

CREATE TABLE IF NOT EXISTS `gerentes` (
  `nombre_g` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(11) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `gerentes`
--

INSERT INTO `gerentes` (`nombre_g`, `correo`, `clave`) VALUES
('ada guillen', 'adaguillen@gmail.com', 'ada'),
('jose moreno', 'josemoreno@gmail.com', 'moreno'),
('otilia soto', 'otiliasoto@gmail.com', 'otilia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE IF NOT EXISTS `vendedores` (
  `nombre_v` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_v` int(11) NOT NULL,
  `cuentas_vendidas` int(11) NOT NULL,
  `zona` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`nombre_v`, `cedula_v`, `cuentas_vendidas`, `zona`) VALUES
('belkis soto', 6861942, 230, 'local'),
('cirabel quintero soto', 20397052, 200, 'foranea');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cobradores`
--
ALTER TABLE `cobradores`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `gerentes`
--
ALTER TABLE `gerentes`
  ADD PRIMARY KEY (`correo`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`cedula_v`);
--
-- Base de datos: `dppb2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE IF NOT EXISTS `egresos` (
  `cod_egr` int(11) NOT NULL COMMENT 'Código de Egreso',
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
(2, '2015-10-02', 'Compra de lapíz', 100.2, 789456),
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
  `id_nivel` int(2) NOT NULL COMMENT 'Código de nivel Academico',
  `nomb_nivel` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Nivel Academico'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `nivel_academico`
--

INSERT INTO `nivel_academico` (`id_nivel`, `nomb_nivel`) VALUES
(1, 'Primaria'),
(7, 'Bachillerato'),
(8, 'Técnico medio'),
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
  `cedu_pac` int(11) NOT NULL COMMENT 'Cédula del Paciente',
  `nomb_pac` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Paciente',
  `edad` int(3) NOT NULL COMMENT 'Edad del Paciente',
  `diag_pac` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Diagnostico del Paciente',
  `cod_serv` int(11) NOT NULL COMMENT 'Código de Servicio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE IF NOT EXISTS `participantes` (
  `cod_par` int(11) NOT NULL COMMENT 'Código de Participantes',
  `ced_part` int(11) NOT NULL COMMENT 'Cédula de Participante',
  `nomb_part` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de Participante',
  `apell_part` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apellido de Participante',
  `profe_part` char(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Profesión de Participante',
  `tlfn_part` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Teléfono de Participante',
  `email_part` char(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Email de Participante',
  `id_nivel` int(11) NOT NULL COMMENT 'Código Nivel Academico',
  `nomenclatura` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'V',
  `dependencia` char(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`cod_par`, `ced_part`, `nomb_part`, `apell_part`, `profe_part`, `tlfn_part`, `email_part`, `id_nivel`, `nomenclatura`, `dependencia`) VALUES
(4, 19539526, 'Yuriesskys', 'Rojas', 'docente', '678909887654', 'yuriesskys.rojas@gmail.co', 10, 'V', 'SimÃ³n Rodriguez'),
(5, 24567897, 'Daniel', 'Rojas', 'ingeniero', '123456788899', 'danirojas@gmail.com', 11, 'V', 'Bolivar 2000'),
(6, 20145678, 'Yoel', 'Torres', 'ingeniero', '345678909876', 'yoeltorres@gmail.com', 11, 'V', 'Bolivar 2000'),
(8, 23456789, 'Cirabel', 'Quintero', 'gerente', '0424-2345678', 'cirabelquintero@gmail.com', 10, 'V', 'UNA'),
(9, 87654345, 'Lizmar', 'Marquez', 'comerciante', '0416-1234567', 'lizmarquez@gmail.com', 1, 'V', 'ONA'),
(10, 56783928, 'Jesus', 'Davila', 'docente', '0412-0987678', 'davilajesus@gmail.com', 10, 'V', 'Liceo Ejido'),
(12, 18345678, 'Argenis', 'Gil', 'economista', '0414-8765456', 'gil.argenis@gmail.com', 12, 'V', 'Alberto Adriani'),
(13, 67807654, 'Erika', 'Quintero', 'arquitecto', '0412-5708653', 'Erica2@gmail.com', 10, 'V', 'INIA'),
(19, 20398052, 'cira', 'quin', 'juridico', '04261387789', 'ciraquin@gmail.com', 9, '', 'uptm'),
(20, 24567900, 'Andru', 'Marquez', 'ingeniero', '0426-9776365', 'andru.123@gmail.com', 11, 'V', 'IUTT'),
(21, 25678890, 'Johana', 'Felisola', 'docente', '0215-5354890', 'johana_felisola@gmail.com', 10, 'V', 'SimÃ³n Rodriguez'),
(23, 12643784, 'Ronald', 'Rivera', 'gerente', '2345-8338848', 'ronal@gmail.com', 10, 'V', 'UPTM'),
(24, 10898072, 'Albert', 'Romero', 'ingeniero', '0414-3455677', 'albert@gmail.com', 11, 'V', 'UPTM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE IF NOT EXISTS `planes` (
  `cod_plan` int(11) NOT NULL COMMENT 'Código de Planes',
  `tipo_plan` int(11) NOT NULL COMMENT 'Tipo de Planes',
  `nomb_plan` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Plan ',
  `desc_plan` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripción del Plan ',
  `cant_unid` int(2) NOT NULL COMMENT 'Cantidad de U.T a cancelar',
  `id_unid` int(11) DEFAULT NULL COMMENT 'Código de la Unidad Tributaria'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`cod_plan`, `tipo_plan`, `nomb_plan`, `desc_plan`, `cant_unid`, `id_unid`) VALUES
(2, 1, 'Evacuación de terremotos', 'Retiro de personas en lugares cerrados', 0, 2),
(3, 1, 'Atención de parto', 'Parto vaginal espontáneo, Parto abdominal', 0, 2),
(4, 2, 'RCP', 'La reanimación cardiopulmonar(RCP) es un procedimiento de emergencia para salvar vidas que se utiliza cuando una persona ha dejado de respirar y el corazÃ³n ha cesado de palpitar.', 2, 2),
(5, 2, 'Primero auxilios', 'Atención inmediata que se le da a una persona enferma o lesionada en el lugar de los acontecimientos', 3, 2),
(6, 3, 'Manejo de Fuegos Artificiales', 'La forma más segura de prevenir las lesiones relacionadas con los fuegos artificiales es dejando el uso de estos a profesionales que han recibido entrenamiento..', 0, 2),
(7, 3, 'Incendios forestales', 'Un incendio forestal se distingue de otros tipos de incendio por su amplia extensiÃ³n, la velocidad con la que se puede extender desde su lugar de origen, su potencial para cambiar de direcciÃ³n inesperadamente, y su capacidad para superar obstÃ¡culo', 0, 2),
(8, 4, 'Atención pre-hospitalaria  ', 'Introducción, Objetivos, Precauciones ', 4, 3);

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
  `lugar` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'por-iniciar',
  `Dia_I` int(2) unsigned zerofill NOT NULL,
  `Mes_I` int(2) unsigned zerofill NOT NULL,
  `Ano_I` int(4) unsigned zerofill NOT NULL,
  `Dia_F` int(2) unsigned zerofill NOT NULL,
  `Mes_F` int(2) unsigned zerofill NOT NULL,
  `Ano_F` int(4) unsigned zerofill NOT NULL,
  `horario` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(25, 8, 8, 'laboratorio', 'por-iniciar', 17, 11, 2015, 19, 12, 2015, '13:56:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsables`
--

CREATE TABLE IF NOT EXISTS `responsables` (
  `cod_resp` int(11) NOT NULL COMMENT 'Código Responsable',
  `ced_resp` int(8) NOT NULL COMMENT 'Cédula Responsable',
  `nomb_resp` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre Responsable',
  `apell_resp` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apellido Responsable',
  `espe_resp` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Especialidad Responsable',
  `id_nivel` int(11) NOT NULL COMMENT 'Codigo Nivel',
  `id_tipo` int(11) NOT NULL COMMENT 'Código de Tipo de Responsable'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `responsables`
--

INSERT INTO `responsables` (`cod_resp`, `ced_resp`, `nomb_resp`, `apell_resp`, `espe_resp`, `id_nivel`, `id_tipo`) VALUES
(8, 23556948, 'Jurielis', 'Rojas', 'TSU Informatica', 9, 4),
(10, 19996312, 'Yisbeli', 'Cano', 'Comerciante', 9, 4);

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
  `parroquia` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Parroquia donde se presto el servicio',
  `direc_salida` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Dirección salida de la Ambulacia ',
  `direc_destino` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Dirección de Destino de la Ambulancia',
  `id_tipo_serv` int(11) NOT NULL COMMENT 'Código de Tipo de Servicio  ',
  `id_unidad` int(11) NOT NULL COMMENT 'Código del Vehiculo',
  `id_municipio` int(11) NOT NULL COMMENT 'Código de Municipio',
  `cod_resp` int(11) NOT NULL COMMENT 'Código de Responsable '
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_plan`
--

CREATE TABLE IF NOT EXISTS `tipo_plan` (
  `idtipoplan` int(11) NOT NULL,
  `nomb_plan` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `evaluacion` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no'
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
  `nomb_tipo_serv` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de Tipo de Servicio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_resp`
--

CREATE TABLE IF NOT EXISTS `tipos_resp` (
  `id_tipo` int(11) NOT NULL COMMENT 'Tipo de Responsable ',
  `nomb_tipo` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Tipo de Responsable'
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
  `marca` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Marca del Vehiculo',
  `modelo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Modelo del Vehiculo',
  `placa` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Placa del Vehiculo',
  `seudonimo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apodo del Vehiculo',
  `estacion` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Estación a la que pertenece el Vehiculo'
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
  `status` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'por-aprobar'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `correo`, `clave`, `nombre`, `tipo`, `responsable`, `status`) VALUES
(2, 'jurielis.rojas10@gmail.com', 'hisopo24.', 'Jurielis Rojas', 2, 8, 'aprobado'),
(6, 'cirabel@gmail.com', 'byron', 'Cirabel Quintero', 1, NULL, 'aprobado');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `responsables`
--
ALTER TABLE `responsables`
  MODIFY `cod_resp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código Responsable',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `cod_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Servicio ',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_plan`
--
ALTER TABLE `tipo_plan`
  MODIFY `idtipoplan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `id_tipo_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Tipo de Servicio';
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
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
-- Base de datos: `test`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
