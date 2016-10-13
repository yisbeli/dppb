-- phpMyAdmin SQL Dump
-- version 4.4.8
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2016 a las 03:29:18
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
