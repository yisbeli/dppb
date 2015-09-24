-- phpMyAdmin SQL Dump
-- version 4.4.8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-09-2015 a las 21:54:20
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cdcol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `interpret` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cds`
--
ALTER TABLE `cds`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cds`
--
ALTER TABLE `cds`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;--
-- Base de datos: `centromedico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `CI` varchar(8) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Cédula de Identidad',
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Nombre del paciente',
  `MotivoConsulta` varchar(250) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientetratamiento`
--

CREATE TABLE IF NOT EXISTS `pacientetratamiento` (
  `Cedula` varchar(8) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Cédula de Identidad del Paciente',
  `Codigo` int(2) unsigned zerofill NOT NULL COMMENT 'Código del tratamiento',
  `Fecha` date NOT NULL COMMENT 'Fecha en la que se indica el tratamiento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE IF NOT EXISTS `tratamiento` (
  `Cod` int(2) unsigned zerofill NOT NULL COMMENT 'Código del tratamiento',
  `NombreTrata` varchar(100) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Nombre del tratamiento',
  `Costo` float unsigned NOT NULL DEFAULT '0' COMMENT 'Costo del tratamiento'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`Cod`, `NombreTrata`, `Costo`) VALUES
(01, 'Evaluación general ', 300.1),
(04, 'Plan de Ejercicios', 200);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`CI`);

--
-- Indices de la tabla `pacientetratamiento`
--
ALTER TABLE `pacientetratamiento`
  ADD PRIMARY KEY (`Cedula`,`Codigo`),
  ADD KEY `Codigo` (`Codigo`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`Cod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `Cod` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Código del tratamiento',AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pacientetratamiento`
--
ALTER TABLE `pacientetratamiento`
  ADD CONSTRAINT `PacienteTratamiento_ibfk_1` FOREIGN KEY (`Cedula`) REFERENCES `paciente` (`CI`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PacienteTratamiento_ibfk_2` FOREIGN KEY (`Codigo`) REFERENCES `tratamiento` (`Cod`) ON UPDATE CASCADE;
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
  `monto_egr` float NOT NULL COMMENT 'Monto del Egreso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `num_voucher` int(11) NOT NULL COMMENT 'Numero de Voucher',
  `otros` char(2) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Otro tipo de expediente',
  `cod_part` int(11) NOT NULL COMMENT 'Código de Participante'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `expediente`
--

INSERT INTO `expediente` (`cod_exp`, `copia_ced`, `foto`, `carpeta`, `copia_titulo`, `sintesis`, `num_voucher`, `otros`, `cod_part`) VALUES
(1, 's', 's', 's', 'n', 's', 2147483647, '0', 2),
(2, 's', 's', 's', 's', 's', 10101020, '0', 3),
(4, 's', 's', 's', 's', 's', 30303010, '0', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE IF NOT EXISTS `municipios` (
  `id_municipio` int(11) NOT NULL COMMENT 'Codigo de Municipio',
  `nomb_mun` varchar(30) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de Municipio'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `nomb_mun`) VALUES
(1, 'Libertador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_academico`
--

CREATE TABLE IF NOT EXISTS `nivel_academico` (
  `id_nivel` int(2) NOT NULL COMMENT 'Código de nivel Academico',
  `nomb_nivel` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del Nivel Academico'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `nivel_academico`
--

INSERT INTO `nivel_academico` (`id_nivel`, `nomb_nivel`) VALUES
(1, 'Ingeniero'),
(2, 'T.S.U'),
(3, 'Tecnico Medio'),
(4, 'Bachiller'),
(5, 'Licenciado'),
(6, 'Magister');

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

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`cedu_pac`, `nomb_pac`, `edad`, `diag_pac`, `cod_serv`) VALUES
(19998654, 'Jose Perez', 34, 'Fractura de craneo ', 1),
(23456908, 'Ana Suarez', 65, 'Traumatismo', 1),
(27340368, 'lala', 20, 'fiebre', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE IF NOT EXISTS `participantes` (
  `cod_par` int(11) NOT NULL COMMENT 'Código de Participantes',
  `ced_part` int(11) NOT NULL COMMENT 'Cédula de Participante',
  `nomb_part` char(15) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de Participante',
  `apell_part` char(15) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Apellido de Participante',
  `profe_part` char(15) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Profesión de Participante',
  `tlfn_part` char(10) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Teléfono de Participante',
  `email_part` char(25) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Email de Participante',
  `id_nivel` int(11) NOT NULL COMMENT 'Código Nivel Academico',
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`cod_par`, `ced_part`, `nomb_part`, `apell_part`, `profe_part`, `tlfn_part`, `email_part`, `id_nivel`, `user`) VALUES
(2, 20397171, 'krysler', 'rojass', 'tsu', '416138778', 'cirabelquintero@gmail.com', 2, NULL),
(3, 6861942, 'belkis', 'soto', 'licenciada', '2147483647', 'belslchs@gmail.com', 4, NULL),
(4, 3296089, 'otilia', 'soto', 'bachiller', '2147483647', 'kdjkwhdjw@gmail.com', 1, NULL),
(5, 20435525, 'ronald', 'avila', 'B', '0416138778', 'ronaldavila_10d@gmail.com', 4, NULL),
(6, 20709289, 'Jorge', 'Cano', 'abogado', '0416-13797', 'jorgecm14@gmail.com', 1, 8);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`cod_plan`, `tipo_plan`, `nomb_plan`, `desc_plan`, `cant_unid`, `id_unid`) VALUES
(11, 1, 'hola', 'sssss', 2, 5),
(12, 1, 'Rescateaa', 'hola rescate', 2, 5),
(13, 2, 'Incendiouuuu', 'hola incendio', 1, 5),
(15, 1, 'yisbeli', 'hola yisbenli', 2, 5),
(16, 1, 'yisssAAAAA', 'juikloo', 1, 5),
(17, 3, 'Respiracion', 'respiracion mutua', 2, 5),
(18, 3, 'Caminar', 'caminando', 2, 5),
(19, 4, 'Mal agudo', 'montala', 3, 5),
(20, 4, 'Incendio', 'Quemados', 3, 5),
(21, 3, 'Caminar', 'caminando', 0, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_participantes`
--

CREATE TABLE IF NOT EXISTS `planes_participantes` (
  `cod_part` int(11) NOT NULL COMMENT 'Codigo de Participante',
  `cod_plan` int(11) NOT NULL COMMENT 'Código de Plan',
  `apro_plan` char(2) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Aprobación del Plan de Formacion',
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes_participantes`
--

INSERT INTO `planes_participantes` (`cod_part`, `cod_plan`, `apro_plan`, `precio`) VALUES
(6, 15, NULL, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_responsables`
--

CREATE TABLE IF NOT EXISTS `planes_responsables` (
  `cod_plan` int(11) NOT NULL COMMENT 'Código de Plan ',
  `cod_resp` int(11) NOT NULL COMMENT 'Código de Responsable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `responsables`
--

INSERT INTO `responsables` (`cod_resp`, `ced_resp`, `nomb_resp`, `apell_resp`, `espe_resp`, `id_nivel`, `id_tipo`) VALUES
(3, 19996081, 'yisbeli', 'cano', 'tsu', 2, 2),
(4, 19996312, 'Ender ', 'Quintero', 'Mecanica', 3, 4),
(5, 20433536, 'Rosa', 'Lamus', 'Traumatologia', 2, 2),
(6, 15755511, 'Yohan', 'Zerpa', 'RCP', 3, 1),
(7, 4489194, 'Mireya', 'Ruiz', 'Cardiologia', 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE IF NOT EXISTS `servicios` (
  `cod_serv` int(11) NOT NULL COMMENT 'Código de Servicio ',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`cod_serv`, `hora_salida`, `hora_llegada`, `hora_ingreso`, `parroquia`, `direc_salida`, `direc_destino`, `id_tipo_serv`, `id_unidad`, `id_municipio`, `cod_resp`) VALUES
(1, '05:00:00', '05:30:00', '05:45:00', 'JJ Osuna', 'Los Curo parte baja', '', 2, 1, 1, 3),
(2, '04:00:00', '04:10:03', '04:30:00', 'Juan Rodriguez Suare', 'Estación los curos', 'El entablo', 1, 1, 1, 6),
(3, '01:00:00', '01:08:16', '01:52:04', 'JJ Osuna', 'Estacion los Curos', 'la Parroquia', 3, 1, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_plan`
--

CREATE TABLE IF NOT EXISTS `tipo_plan` (
  `idtipoplan` int(11) NOT NULL,
  `nomb_plan` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_plan`
--

INSERT INTO `tipo_plan` (`idtipoplan`, `nomb_plan`) VALUES
(1, 'Taller'),
(2, 'Curso'),
(3, 'Charla'),
(4, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE IF NOT EXISTS `tipo_servicio` (
  `id_tipo_serv` int(11) NOT NULL COMMENT 'Código de Tipo de Servicio',
  `nomb_tipo_serv` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de Tipo de Servicio'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_servicio`
--

INSERT INTO `tipo_servicio` (`id_tipo_serv`, `nomb_tipo_serv`) VALUES
(1, 'Emergencia'),
(2, 'Pre-Hospitalaria'),
(3, 'Traslado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_resp`
--

CREATE TABLE IF NOT EXISTS `tipos_resp` (
  `id_tipo` int(11) NOT NULL COMMENT 'Tipo de Responsable ',
  `nomb_tipo` varchar(40) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del Tipo de Responsable'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipos_resp`
--

INSERT INTO `tipos_resp` (`id_tipo`, `nomb_tipo`) VALUES
(1, 'Coordinador'),
(2, 'Instructor'),
(3, 'Bombero(Pre-hospitalario)'),
(4, 'Foraneo(a)');

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
(1, 1, 'mazda', 'xxx', '1pe2', 'pajaro bravo', 'los curos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_trib`
--

CREATE TABLE IF NOT EXISTS `unidades_trib` (
  `id_unid` int(11) NOT NULL COMMENT 'Código de la UT',
  `ano_unid` char(4) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Ano en q aumenta la UT',
  `fech_unid` date NOT NULL COMMENT 'Fecha en q aumenta la UT',
  `valor_unid` int(11) NOT NULL COMMENT 'Valor de la UT'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidades_trib`
--

INSERT INTO `unidades_trib` (`id_unid`, `ano_unid`, `fech_unid`, `valor_unid`) VALUES
(3, '2013', '2013-05-01', 90),
(4, '2014', '2014-05-01', 100),
(5, '2015', '2015-05-01', 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(11) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `clave` varchar(40) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `correo`, `clave`, `nombre`, `tipo`) VALUES
(1, 'cirabelquintero@gmail.com', '123', 'Cirabel', 1),
(2, 'jesusdavila@gmail.com', '987', 'Jesus Davila', 1),
(3, 'cristina@gmail.com', '456', 'cristina soto', 2),
(7, 'jose@gmail.com', '159', 'jose', 2),
(8, 'jorgecm14@gmail.com', 'jorge', 'Jorge', 1),
(9, 'jorge@gmail.com', 'jorge2', 'Jorge', 2);

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
  ADD KEY `id_nivel` (`id_nivel`),
  ADD KEY `user` (`user`);

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
  ADD KEY `cod_plan` (`cod_plan`),
  ADD KEY `cod_part` (`cod_part`);

--
-- Indices de la tabla `planes_responsables`
--
ALTER TABLE `planes_responsables`
  ADD PRIMARY KEY (`cod_plan`,`cod_resp`),
  ADD KEY `cod_plan` (`cod_plan`,`cod_resp`),
  ADD KEY `cod_resp` (`cod_resp`);

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
  MODIFY `cod_egr` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Egreso';
--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `cod_exp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de expediente',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Municipio',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `nivel_academico`
--
ALTER TABLE `nivel_academico`
  MODIFY `id_nivel` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Código de nivel Academico',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `participantes`
--
ALTER TABLE `participantes`
  MODIFY `cod_par` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Participantes',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `cod_plan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Planes',AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `responsables`
--
ALTER TABLE `responsables`
  MODIFY `cod_resp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código Responsable',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `cod_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Servicio ',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_plan`
--
ALTER TABLE `tipo_plan`
  MODIFY `idtipoplan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `id_tipo_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Tipo de Servicio',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipos_resp`
--
ALTER TABLE `tipos_resp`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo de Responsable ',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id_unidad` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Código del Vehículo  ',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `unidades_trib`
--
ALTER TABLE `unidades_trib`
  MODIFY `id_unid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la UT',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
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
  ADD CONSTRAINT `participantes_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel_academico` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `participantes_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `planes_participantes_ibfk_1` FOREIGN KEY (`cod_part`) REFERENCES `participantes` (`cod_par`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `planes_participantes_ibfk_2` FOREIGN KEY (`cod_plan`) REFERENCES `planes` (`cod_plan`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `planes_responsables`
--
ALTER TABLE `planes_responsables`
  ADD CONSTRAINT `planes_responsables_ibfk_1` FOREIGN KEY (`cod_plan`) REFERENCES `planes` (`cod_plan`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `planes_responsables_ibfk_2` FOREIGN KEY (`cod_resp`) REFERENCES `responsables` (`cod_resp`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
-- Base de datos: `neptuno`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `IdCategoria` int(11) unsigned NOT NULL COMMENT 'Número asignado a cada nueva categoría.',
  `NombreCategoria` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Nombre de la categoría de Productos.',
  `Descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Descripción del tipo de Productos que se pueden asociar a cada categoría específica'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`IdCategoria`, `NombreCategoria`, `Descripcion`) VALUES
(1, 'Bebidas', 'Gaseosas, cafÃ©, tÃ©, cervezas y maltas'),
(2, 'Condimentos', 'Salsas dulces y picantes, delicias, comida para untar y aderezos'),
(4, 'LÃ¡cteos', 'Quesos'),
(5, 'Granos/Cereal', 'Pan, galletas, pasta y cereales'),
(6, 'Carnes', 'Carnes preparadas'),
(7, 'Frutas/Verduras', 'Frutas secas y queso de soja'),
(8, 'Pescado/Marisco', 'Pescados, mariscos y algas'),
(9, 'ReposterÃ­a', 'Postres, dulces y pan dulce');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `IdCliente` varchar(5) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Código único basado en el nombre del cliente.',
  `NombreCompania` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Nombre de compañía',
  `NombreContacto` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Nombre del contacto',
  `CargoContacto` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Cargo del contacto',
  `Direccion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Calle o apartado de correos.',
  `Ciudad` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Region` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Estado o provincia.',
  `CodPostal` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Código postal',
  `Pais` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono` varchar(24) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Incluye código de país o de área.',
  `Fax` varchar(24) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Incluye código de país o de área.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`IdCliente`, `NombreCompania`, `NombreContacto`, `CargoContacto`, `Direccion`, `Ciudad`, `Region`, `CodPostal`, `Pais`, `Telefono`, `Fax`) VALUES
('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Representante de ventas', 'Obere Str. 57', 'Berlín', NULL, '12209', 'Alemania', '030-0074321', '030-0076545'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Propietario', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'México', '(5) 555-4729', '(5) 555-3745'),
('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Propietario', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México', '(5) 555-3932', NULL),
('AROUT', 'Around the Horn', 'Thomas Hardy', 'Representante de ventas', '120 Hanover Sq.', 'Londres', NULL, 'WA1 1DP', 'Reino Unido', '(71) 555-7788', '(71) 555-6750'),
('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Administrador de Pedidos', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia', '0921-12 34 65', '0921-12 34 67'),
('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Representante de ventas', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemania', '0621-08460', '0621-08924'),
('BLONP', 'Blondel père et fils', 'Frédérique Citeaux', 'Gerente de marketing', '24, place Kléber', 'Estrasburgo', NULL, '67000', 'Francia', '88.60.15.31', '88.60.15.32'),
('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Propietario', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'España', '(91) 555 22 82', '(91) 555 91 99'),
('BONAP', 'Bon app''', 'Laurence Lebihan', 'Propietario', '12, rue des Bouchers', 'Marsella', NULL, '13008', 'Francia', '91.24.45.40', '91.24.45.41'),
('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Gerente de contabilidad', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá', '(604) 555-4729', '(604) 555-3745'),
('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Representante de ventas', 'Fauntleroy Circus', 'Londres', NULL, 'EC2 5NT', 'Reino Unido', '(71) 555-1212', NULL),
('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Agente de ventas', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892'),
('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Gerente de marketing', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'México', '(5) 555-3392', '(5) 555-7293'),
('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Propietario', 'Hauptstr. 29', 'Berna', NULL, '3012', 'Suiza', '0452-076545', NULL),
('COMMI', 'Comércio Mineiro', 'Pedro Afonso', 'Asistente de ventas', 'Av. dos Lusíadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil', '(11) 555-7647', NULL),
('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Representante de ventas', 'Berkeley Gardens\r\n12  Brewery ', 'Londres', NULL, 'WX1 6LT', 'Reino Unido', '(71) 555-2282', '(71) 555-9199'),
('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Administrador de Pedidos', 'Walserweg 21', 'Aachen', NULL, '52066', 'Alemania', '0241-039123', '0241-059428'),
('DUMON', 'Du monde entier', 'Janine Labrune', 'Propietario', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'Francia', '40.67.88.88', '40.67.89.89'),
('EASTC', 'Eastern Connection', 'Ann Devon', 'Agente de ventas', '35 King George', 'Londres', NULL, 'WX3 6FW', 'Reino Unido', '(71) 555-0297', '(71) 555-3373'),
('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Gerente de ventas', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425', '7675-3426'),
('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Asistente de marketing', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brasil', '(11) 555-9857', NULL),
('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Gerente de contabilidad', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'España', '(91) 555 94 44', '(91) 555 55 93'),
('FOLIG', 'Folies gourmandes', 'Martine Rancé', 'Asistente de agente de ventas', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'Francia', '20.16.10.16', '20.16.10.17'),
('FOLKO', 'Folk och fä HB', 'Maria Larsson', 'Propietario', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia', '0695-34 67 21', NULL),
('FRANK', 'Frankenversand', 'Peter Franken', 'Gerente de marketing', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania', '089-0877310', '089-0877451'),
('FRANR', 'France restauration', 'Carine Schmitt', 'Gerente de marketing', '54, rue Royale', 'Nantes', NULL, '44000', 'Francia', '40.32.21.21', '40.32.21.20'),
('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Representante de ventas', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italia', '011-4988260', '011-4988261'),
('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez ', 'Gerente de ventas', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535'),
('GALED', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Gerente de marketing', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '08022', 'España', '(93) 203 4560', '(93) 203 4561'),
('GODOS', 'Godos Cocina Típica', 'José Pedro Freyre', 'Gerente de ventas', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España', '(95) 555 82 82', NULL),
('GOURL', 'Gourmet Lanchonetes', 'André Fonseca', 'Asistente de ventas', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil', '(11) 555-9482', NULL),
('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Gerente de marketing', '2732 Baker Blvd.', 'Eugenia', 'OR', '97403', 'Estados Unidos', '(503) 555-7555', NULL),
('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Propietario', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397'),
('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Gerente de contabilidad', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brasil', '(21) 555-0091', '(21) 555-8765'),
('HILAA', 'HILARIÓN-Abastos', 'Carlos Hernández', 'Representante de ventas', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948'),
('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Representante de ventas', 'City Center Plaza\r\n516 Main St.', 'Elgin', 'OR', '97827', 'Estados Unidos', '(503) 555-6874', '(503) 555-2376'),
('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Asistente de ventas', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda', '2967 542', '2967 3333'),
('ISLAT', 'Island Trading', 'Helen Bennett', 'Gerente de marketing', 'Garden House\r\nCrowther Way', 'Cowes', 'Isla de Wight', 'PO31 7PJ', 'Reino Unido', '(198) 555-8888', NULL),
('KOENE', 'Königlich Essen', 'Philip Cramer', 'Asistente de ventas', 'Maubelstr. 90', 'Brandenburgo', NULL, '14776', 'Alemania', '0555-09876', NULL),
('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Representante de ventas', '67, avenue de l''Europe', 'Versalles', NULL, '78000', 'Francia', '30.59.84.10', '30.59.85.11'),
('LAMAI', 'La maison d''Asie', 'Annette Roulet', 'Gerente de ventas', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia', '61.77.61.10', '61.77.61.11'),
('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Asistente de marketing', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canadá', '(604) 555-3392', '(604) 555-7293'),
('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Gerente de marketing', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'Estados Unidos', '(509) 555-7969', '(509) 555-6221'),
('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Representante de ventas', 'Magazinweg 7', 'Francfurt', NULL, '60528', 'Alemania', '069-0245984', '069-0245874'),
('LETSS', 'Let''s Stop N Shop', 'Jaime Yorres', 'Propietario', '87 Polk St.\r\nSuite 5', 'San Francisco', 'CA', '94117', 'Estados Unidos', '(415) 555-5938', NULL),
('LILAS', 'LILA-Supermercado', 'Carlos González', 'Gerente de contabilidad', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256'),
('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Propietario', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93'),
('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Gerente de ventas', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos', '(503) 555-9573', '(503) 555-9646'),
('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Gerente de marketing', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia', '035-640230', '035-640231'),
('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Agente de ventas', 'Rue Joseph-Bens 532', 'Bruselas', NULL, 'B-1180', 'Bélgica', '(02) 201 24 67', '(02) 201 24 68'),
('MEREP', 'Mère Paillarde', 'Jean Fresnière', 'Asistente de marketing', '43 rue St. Laurent', 'Montreal', 'Québec', 'H1J 1C3', 'Canadá', '(514) 555-8054', '(514) 555-8055'),
('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Asistente de marketing', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemania', '0342-023176', NULL),
('NORTS', 'North/South', 'Simon Crowther', 'Asistente de ventas', 'South House\r\n300 Queensbridge', 'Londres', NULL, 'SW7 1RZ', 'Reino Unido', '(71) 555-7733', '(71) 555-2530'),
('OCEAN', 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Agente de ventas', 'Ing. Gustavo Moncada 8585\r\nPiso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535'),
('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Representante de ventas', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos', '(907) 555-7584', '(907) 555-2880'),
('OTTIK', 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Propietario', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania', '0221-0644327', '0221-0765721'),
('PARIS', 'Paris spécialités', 'Marie Bertrand', 'Propietario', '265, boulevard Charonne', 'París', NULL, '75012', 'Francia', '(1) 42.34.22.66', '(1) 42.34.22.77'),
('PERIC', 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Representante de ventas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México', '(5) 552-3745', '(5) 545-3745'),
('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Gerente de ventas', 'Geislweg 14', 'Salzburgo', NULL, '5020', 'Austria', '6562-9722', '6562-9723'),
('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Representante de ventas', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL),
('QUEDE', 'Que Delícia', 'Bernardo Batista', 'Gerente de contabilidad', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brasil', '(21) 555-4252', '(21) 555-4545'),
('QUEEN', 'Queen Cozinha', 'Lúcia Carvalho', 'Asistente de marketing', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brasil', '(11) 555-1189', NULL),
('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Gerente de contabilidad', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania', '0372-035188', NULL),
('RANCH', 'Rancho grande', 'Sergio Gutiérrez', 'Representante de ventas', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556'),
('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Representante agente ventas', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos', '(505) 555-5939', '(505) 555-3620'),
('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Asistente de ventas', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia', '0522-556721', '0522-556722'),
('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Asistente de agente de ventas', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brasil', '(21) 555-3412', NULL),
('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Gerente de ventas', 'Grenzacherweg 237', 'Génova', NULL, '1203', 'Suiza', '0897-034214', NULL),
('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Gerente de contabilidad', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'España', '(91) 745 6200', '(91) 745 6210'),
('SANTG', 'Santé Gourmet', 'Jonas Bergulfsen', 'Propietario', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega', '07-98 92 35', '07-98 92 47'),
('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Representante de ventas', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos', '(208) 555-8097', NULL),
('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Gerente de ventas', '90 Wadhurst Rd.', 'Londres', NULL, 'OX15 4NB', 'Reino Unido', '(71) 555-1717', '(71) 555-5646'),
('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Propietario', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca', '31 12 34 56', '31 13 35 57'),
('SPECD', 'Spécialités du monde', 'Dominique Perrier', 'Gerente de marketing', '25, rue Lauriston', 'París', NULL, '75016', 'Francia', '(1) 47.55.60.10', '(1) 47.55.60.20'),
('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Gerente de ventas', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos', '(307) 555-4680', '(307) 555-6525'),
('SUPRD', 'Suprêmes délices', 'Pascale Cartrain', 'Gerente de contabilidad', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica', '(071) 23 67 22 20', '(071) 23 67 22 21'),
('THEBI', 'The Big Cheese', 'Liz Nixon', 'Gerente de marketing', '89 Jefferson Way\r\nSuite 2', 'Portland', 'OR', '97201', 'Estados Unidos', '(503) 555-3612', NULL),
('THECR', 'The Cracker Box', 'Liu Wong', 'Asistente de marketing', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'Estados Unidos', '(406) 555-5834', '(406) 555-8083'),
('TOMSP', 'Toms Spezialitäten', 'Karin Josephs', 'Gerente de marketing', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemania', '0251-031259', '0251-035695'),
('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Propietario', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México', '(5) 555-2933', NULL),
('TRADH', 'Tradição Hipermercados', 'Anabela Domingues', 'Representante de ventas', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brasil', '(11) 555-2167', '(11) 555-2168'),
('TRAIH', 'Trail''s Head Gourmet Provisioners', 'Helvetius Nagy', 'Asistente de ventas', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'Estados Unidos', '(206) 555-8257', '(206) 555-2174'),
('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Gerente de ventas', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca', '86 21 32 43', '86 22 33 44'),
('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Agente de ventas', '2, rue du Commerce', 'Lion', NULL, '69004', 'Francia', '78.32.54.86', '78.32.54.87'),
('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Gerente de contabilidad', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'Francia', '26.47.15.10', '26.47.15.11'),
('WANDK', 'Die Wandernde Kuh', 'Rita Müller', 'Representante de ventas', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania', '0711-020361', '0711-035428'),
('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Gerente de contabilidad', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia', '981-443655', '981-443655'),
('WELLI', 'Wellington Importadora', 'Paula Parente', 'Gerente de ventas', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil', '(14) 555-8122', NULL),
('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Propietario', '305 - 14th Ave. S.\r\nSuite 3B', 'Seattle', 'WA', '98128', 'Estados Unidos', '(206) 555-4112', '(206) 555-4115'),
('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Prop./Asistente marketing', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia', '90-224 8858', '90-224 8858'),
('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Propietario', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Polonia', '(26) 642-7012', '(26) 642-7012');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companias`
--

CREATE TABLE IF NOT EXISTS `companias` (
  `IdCompaniaEnvios` int(11) unsigned NOT NULL COMMENT 'Número asignado a una compañía nueva.',
  `NombreCompania` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Nombre de la compañía de envíos.',
  `Telefono` varchar(24) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Incluye el código de país o de área.'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `companias`
--

INSERT INTO `companias` (`IdCompaniaEnvios`, `NombreCompania`, `Telefono`) VALUES
(1, 'Speedy Express', '(503) 555-9831'),
(2, 'United Package', '(503) 555-3199'),
(3, 'Federal Shipping', '(503) 555-9931');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE IF NOT EXISTS `detalles` (
  `IdPedido` int(11) unsigned NOT NULL COMMENT 'Igual al Id. de pedido de la tabla Pedidos.',
  `IdProducto` int(11) unsigned NOT NULL COMMENT 'Igual al Id. de producto de la tabla Productos.',
  `PrecioUnidad` double unsigned NOT NULL COMMENT 'Precio por unidad',
  `Cantidad` smallint(6) unsigned NOT NULL,
  `Descuento` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_spanish_ci;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`IdPedido`, `IdProducto`, `PrecioUnidad`, `Cantidad`, `Descuento`) VALUES
(10254, 55, 19.2, 21, 0.15),
(10254, 74, 8, 21, 0),
(10265, 17, 31.2, 30, 0),
(10269, 33, 2, 60, 0.05),
(10269, 72, 27.8, 20, 0.05),
(10277, 28, 36.4, 20, 0),
(10277, 62, 39.4, 12, 0),
(10280, 55, 19.2, 20, 0),
(10280, 75, 6.2, 30, 0),
(10295, 56, 30.4, 4, 0),
(10297, 39, 14.4, 60, 0),
(10297, 72, 27.8, 20, 0),
(10300, 66, 13.6, 30, 0),
(10300, 68, 10, 20, 0),
(10307, 62, 39.4, 10, 0),
(10307, 68, 10, 3, 0),
(10312, 28, 36.4, 4, 0),
(10312, 43, 36.8, 24, 0),
(10312, 53, 26.2, 20, 0),
(10312, 75, 6.2, 10, 0),
(10327, 11, 16.8, 50, 0.2),
(10327, 30, 20.7, 35, 0.2),
(10327, 58, 10.6, 30, 0.2),
(10333, 14, 18.6, 10, 0),
(10333, 21, 8, 10, 0.1),
(10339, 17, 31.2, 70, 0.05),
(10339, 62, 39.4, 28, 0),
(10345, 8, 32, 70, 0),
(10345, 19, 7.3, 80, 0),
(10345, 42, 11.2, 9, 0),
(10358, 34, 11.2, 10, 0.05),
(10359, 16, 13.9, 56, 0.05),
(10359, 31, 10, 70, 0.05),
(10359, 60, 27.2, 80, 0.05),
(10368, 21, 8, 5, 0.1),
(10368, 28, 36.4, 13, 0.1),
(10368, 57, 15.6, 25, 0),
(10368, 64, 26.6, 35, 0.1),
(10372, 20, 64.8, 12, 0.25),
(10372, 38, 210.8, 40, 0.25),
(10372, 60, 27.2, 70, 0.25),
(10372, 72, 27.8, 42, 0.25),
(10379, 41, 7.7, 8, 0.1),
(10379, 63, 35.1, 16, 0.1),
(10379, 65, 16.8, 20, 0.1),
(10388, 52, 5.6, 20, 0.2),
(10388, 53, 26.2, 40, 0),
(10392, 69, 28.8, 50, 0),
(10397, 21, 8, 10, 0.15),
(10397, 51, 42.4, 18, 0.15),
(10398, 55, 19.2, 120, 0.1),
(10404, 26, 24.9, 30, 0.05),
(10404, 42, 11.2, 40, 0.05),
(10404, 49, 16, 30, 0.05),
(10407, 11, 16.8, 30, 0),
(10407, 69, 28.8, 15, 0),
(10414, 19, 7.3, 18, 0.05),
(10414, 33, 2, 50, 0),
(10422, 26, 24.9, 2, 0),
(10457, 59, 44, 36, 0),
(10462, 13, 4.8, 1, 0),
(10462, 23, 7.2, 21, 0),
(10463, 19, 7.3, 21, 0),
(10463, 42, 11.2, 50, 0),
(10471, 7, 24, 30, 0),
(10471, 56, 30.4, 20, 0),
(10474, 14, 18.6, 12, 0),
(10474, 28, 36.4, 18, 0),
(10474, 40, 14.7, 21, 0),
(10474, 75, 6.2, 10, 0),
(10477, 21, 8, 21, 0.25),
(10477, 39, 14.4, 20, 0.25),
(10478, 10, 24.8, 20, 0.05),
(10487, 19, 7.3, 5, 0),
(10487, 26, 24.9, 30, 0),
(10487, 54, 5.9, 24, 0.25),
(10502, 53, 32.8, 6, 0),
(10502, 67, 14, 30, 0),
(10515, 16, 17.45, 50, 0),
(10515, 27, 43.9, 120, 0),
(10515, 33, 2.5, 16, 0.15),
(10515, 60, 34, 84, 0.15),
(10516, 18, 62.5, 25, 0.1),
(10516, 41, 9.65, 80, 0.1),
(10516, 42, 14, 20, 0),
(10529, 55, 24, 14, 0),
(10529, 68, 12.5, 20, 0),
(10529, 69, 36, 10, 0),
(10541, 38, 263.5, 4, 0.1),
(10541, 65, 21.05, 36, 0.1),
(10549, 31, 12.5, 55, 0.15),
(10549, 51, 53, 48, 0.15),
(10552, 69, 36, 18, 0),
(10552, 75, 7.75, 30, 0),
(10553, 11, 21, 15, 0),
(10553, 16, 17.45, 14, 0),
(10553, 22, 21, 24, 0),
(10553, 31, 12.5, 30, 0),
(10556, 72, 34.8, 24, 0),
(10561, 51, 53, 50, 0),
(10563, 52, 7, 70, 0),
(10569, 31, 12.5, 35, 0.2),
(10569, 76, 18, 30, 0),
(10575, 59, 55, 12, 0),
(10575, 63, 43.9, 6, 0),
(10575, 72, 34.8, 30, 0),
(10575, 76, 18, 10, 0),
(10583, 29, 123.79, 10, 0),
(10583, 60, 34, 24, 0.15),
(10583, 69, 36, 10, 0.15),
(10588, 18, 62.5, 40, 0.2),
(10588, 42, 14, 100, 0.2),
(10595, 69, 36, 65, 0.25),
(10607, 7, 30, 45, 0),
(10607, 17, 39, 100, 0),
(10607, 33, 2.5, 14, 0),
(10607, 40, 18.4, 42, 0),
(10607, 72, 34.8, 12, 0),
(10615, 55, 24, 5, 0),
(10620, 52, 7, 5, 0),
(10648, 22, 21, 15, 0),
(10649, 28, 45.6, 20, 0),
(10649, 72, 34.8, 15, 0),
(10650, 30, 25.89, 30, 0),
(10650, 53, 32.8, 25, 0.05),
(10650, 54, 7.45, 30, 0),
(10654, 39, 18, 20, 0.1),
(10654, 54, 7.45, 6, 0.1),
(10657, 41, 9.65, 24, 0),
(10657, 46, 12, 45, 0),
(10657, 47, 9.5, 10, 0),
(10657, 56, 38, 45, 0),
(10657, 60, 34, 30, 0),
(10663, 40, 18.4, 30, 0.05),
(10663, 42, 14, 30, 0.05),
(10663, 51, 53, 20, 0.05),
(10673, 16, 17.45, 3, 0),
(10673, 42, 14, 6, 0),
(10673, 43, 46, 6, 0),
(10675, 14, 23.25, 30, 0),
(10675, 53, 32.8, 10, 0),
(10675, 58, 13.25, 30, 0),
(10676, 10, 31, 2, 0),
(10676, 19, 9.2, 7, 0),
(10683, 52, 7, 9, 0),
(10686, 17, 39, 30, 0.2),
(10686, 26, 31.23, 15, 0),
(10691, 29, 123.79, 40, 0),
(10691, 43, 46, 40, 0),
(10691, 62, 49.3, 48, 0),
(10711, 19, 9.2, 12, 0),
(10711, 41, 9.65, 42, 0),
(10711, 53, 32.8, 120, 0),
(10714, 17, 39, 27, 0.25),
(10714, 47, 9.5, 50, 0.25),
(10714, 56, 38, 18, 0.25),
(10714, 58, 13.25, 12, 0.25),
(10727, 17, 39, 20, 0.05),
(10727, 56, 38, 10, 0.05),
(10727, 59, 55, 10, 0.05),
(10730, 16, 17.45, 15, 0.05),
(10730, 31, 12.5, 3, 0.05),
(10730, 65, 21.05, 10, 0.05),
(10734, 30, 25.89, 15, 0),
(10734, 76, 18, 20, 0),
(10737, 13, 6, 4, 0),
(10737, 41, 9.65, 12, 0),
(10738, 16, 17.45, 3, 0),
(10752, 69, 36, 3, 0),
(10761, 25, 14, 35, 0.25),
(10761, 75, 7.75, 18, 0),
(10780, 77, 13, 15, 0),
(10781, 54, 7.45, 3, 0.2),
(10781, 56, 38, 20, 0.2),
(10781, 74, 10, 35, 0),
(10787, 29, 123.79, 20, 0.05),
(10798, 62, 49.3, 2, 0),
(10798, 72, 34.8, 10, 0),
(10805, 34, 14, 10, 0),
(10805, 38, 263.5, 10, 0),
(10808, 56, 38, 20, 0.15),
(10808, 76, 18, 50, 0.15),
(10810, 13, 6, 7, 0),
(10810, 25, 14, 5, 0),
(10812, 31, 12.5, 16, 0.1),
(10812, 72, 34.8, 40, 0.1),
(10812, 77, 13, 20, 0),
(10815, 33, 2.5, 16, 0),
(10819, 43, 46, 7, 0),
(10819, 75, 7.75, 20, 0),
(10823, 11, 21, 20, 0.1),
(10823, 57, 19.5, 15, 0),
(10823, 59, 55, 40, 0.1),
(10823, 77, 13, 15, 0.1),
(10832, 13, 6, 3, 0.2),
(10832, 25, 14, 10, 0.2),
(10832, 64, 33.25, 3, 0),
(10841, 10, 31, 16, 0),
(10841, 56, 38, 30, 0),
(10841, 59, 55, 50, 0),
(10841, 77, 13, 15, 0),
(10846, 74, 10, 20, 0),
(10851, 25, 14, 10, 0.05),
(10851, 57, 19.5, 10, 0.05),
(10851, 59, 55, 42, 0.05),
(10858, 7, 30, 5, 0),
(10858, 27, 43.9, 10, 0),
(10865, 38, 263.5, 60, 0.05),
(10865, 39, 18, 80, 0.05),
(10866, 30, 25.89, 40, 0.25),
(10869, 11, 21, 10, 0),
(10869, 23, 9, 50, 0),
(10869, 68, 12.5, 20, 0),
(10870, 51, 53, 2, 0),
(10872, 55, 24, 10, 0.05),
(10872, 62, 49.3, 20, 0.05),
(10872, 64, 33.25, 15, 0.05),
(10872, 65, 21.05, 21, 0.05),
(10874, 10, 31, 10, 0),
(10899, 39, 18, 8, 0.15),
(10912, 11, 21, 40, 0.25),
(10912, 29, 123.79, 60, 0.25),
(10915, 17, 39, 10, 0),
(10915, 33, 2.5, 30, 0),
(10915, 54, 7.45, 10, 0),
(10919, 16, 17.45, 24, 0),
(10919, 25, 14, 24, 0),
(10919, 40, 18.4, 20, 0),
(10922, 17, 39, 15, 0),
(10939, 67, 14, 40, 0.15),
(10949, 10, 31, 30, 0),
(10949, 17, 39, 6, 0),
(10949, 62, 49.3, 60, 0),
(10954, 16, 17.45, 28, 0.15),
(10954, 31, 12.5, 25, 0.15),
(10954, 60, 34, 24, 0.15),
(10967, 19, 9.2, 12, 0),
(10967, 49, 20, 40, 0),
(10971, 29, 123.79, 14, 0),
(10982, 7, 30, 20, 0),
(10982, 43, 46, 9, 0),
(10983, 13, 6, 84, 0.15),
(10983, 57, 19.5, 15, 0),
(10985, 16, 17.45, 36, 0.1),
(10985, 18, 62.5, 8, 0.1),
(10985, 32, 32, 35, 0.1),
(10989, 11, 21, 15, 0),
(10989, 41, 9.65, 4, 0),
(10990, 21, 10, 65, 0),
(10990, 34, 14, 60, 0.15),
(10990, 55, 24, 65, 0.15),
(10994, 59, 55, 18, 0.05),
(11000, 77, 13, 30, 0),
(11001, 7, 30, 60, 0),
(11001, 22, 21, 25, 0),
(11001, 46, 12, 25, 0),
(11001, 55, 24, 6, 0),
(11005, 59, 55, 10, 0),
(11009, 60, 34, 9, 0),
(11010, 7, 30, 20, 0),
(11013, 23, 9, 10, 0),
(11013, 42, 14, 4, 0),
(11013, 68, 12.5, 2, 0),
(11014, 41, 9.65, 28, 0.1),
(11015, 30, 25.89, 15, 0),
(11015, 77, 13, 18, 0),
(11020, 10, 31, 24, 0.15),
(11028, 55, 24, 35, 0),
(11028, 59, 55, 24, 0),
(11032, 38, 263.5, 25, 0),
(11032, 59, 55, 30, 0),
(11035, 42, 14, 30, 0),
(11035, 54, 7.45, 10, 0),
(11043, 11, 21, 10, 0),
(11053, 18, 62.5, 35, 0.2),
(11053, 32, 32, 20, 0),
(11053, 64, 33.25, 25, 0.2),
(11059, 13, 6, 30, 0),
(11059, 17, 39, 12, 0),
(11059, 60, 34, 35, 0),
(11060, 60, 34, 4, 0),
(11060, 77, 13, 10, 0),
(11070, 16, 17.45, 30, 0.15),
(11070, 31, 12.5, 20, 0),
(11073, 11, 21, 10, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `IdEmpleado` int(11) unsigned NOT NULL COMMENT 'Número asignado a un empleado nuevo.',
  `Apellidos` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cargo` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Cargo del empleado.',
  `Tratamiento` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Tratamiento usado en los saludos.',
  `FechaNacimiento` date DEFAULT NULL COMMENT 'Fecha de nacimiento. La fecha de nacimiento no puede ser posterior a la fecha actual. Formato aaaa-mm-dd',
  `FechaContratacion` date DEFAULT NULL COMMENT 'Fecha de contratación. Formato aaaa-mm-dd',
  `Direccion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Calle o apartado de correos.',
  `Ciudad` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Estado o provincia.',
  `Region` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CodPostal` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Código postal',
  `Pais` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Incluye código de país o de área.',
  `TelDomicilio` varchar(24) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Teléfono de domicilio. Incluye código de país o de área.',
  `Extension` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Número de extensión telefónica interna.',
  `Foto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'ruta del archivo',
  `Notas` mediumtext COLLATE utf8_spanish_ci COMMENT 'Información general acerca del empleado.',
  `Jefe` int(11) unsigned DEFAULT '0' COMMENT 'Jefe del empleado.'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`IdEmpleado`, `Apellidos`, `Nombre`, `Cargo`, `Tratamiento`, `FechaNacimiento`, `FechaContratacion`, `Direccion`, `Ciudad`, `Region`, `CodPostal`, `Pais`, `TelDomicilio`, `Extension`, `Foto`, `Notas`, `Jefe`) VALUES
(2, 'Fuller', 'Andrew', 'Vicepresidente comercial', 'Dr.', '1952-02-19', '1992-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'EE.UU.', '(206) 555-9482', '3457', 'EMPID2.BMP', 'Andrew completó su licenciatura en Comercio y un doctorado en Marketing Internacional de la Universidad de Dallas. Habla con fluidez en francés e italiano y lee el alemán. Ingresó en la empresa como representante de ventas, fue ascendido a gerente de cuentas y después fue nombrado vicepresidente comercial.\r\nAndrew es miembro de la Mesa redonda de administración de Ventas, la Cámara de comercio de Seattle y de la Asociación de importadores de la Cuenca del Pacífico.', NULL),
(5, 'Buchanan', 'Steven', 'Gerente de ventas', 'Sr.', '1955-03-04', '1993-10-17', '14 Garrett Hill', 'Londres', NULL, 'SW1 8JR', 'Reino Unido', '(71) 555-4848', '3453', 'EMPID5.BMP', 'Steven Buchanan se graduó en la Universidad de St. Andrews, Escocia. Tras su ingreso en la empresa dedicó 6 meses a un programa de orientación en la oficina de Seattle y luego volvió a su puesto permanente en Londres, donde fue ascendido a gerente de ventas. Completó con éxito los cursos de Telemarketing y Gestión de ventas internacional. Habla francés.', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `IdPedido` int(11) unsigned NOT NULL COMMENT 'Número de pedido exclusivo de la factura.',
  `IdCliente` varchar(5) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Igual al Id. de cliente de la tabla Clientes.',
  `IdEmpleado` int(11) unsigned NOT NULL COMMENT 'Igual al Id. de empleado de Empleados.',
  `FechaPedido` date DEFAULT NULL COMMENT 'Fecha de pedido. Formato aaaa-mm-dd',
  `FechaEntrega` date DEFAULT NULL COMMENT 'Fecha de entrega. Formato aaaa-mm-dd',
  `FechaEnvio` date DEFAULT NULL COMMENT 'Fecha de envío. Formato aaaa-mm-dd',
  `FormaEnvio` int(11) unsigned NOT NULL COMMENT 'Igual al Id. de la tabla Compañías de envíos.',
  `Cargo` float DEFAULT NULL,
  `Destinatario` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Nombre del destinatario del envío.',
  `DireccionDestinatario` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Dirección de destinatario. No se permiten apartados de correos.',
  `CiudadDestinatario` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Ciudad de destinatario. Estado o provincia.',
  `RegionDestinatario` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Región de destinatario. Estado o provincia.',
  `CodPostalDestinatario` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Código postal de destinatario',
  `PaisDestinatario` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'País de destinatario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`IdPedido`, `IdCliente`, `IdEmpleado`, `FechaPedido`, `FechaEntrega`, `FechaEnvio`, `FormaEnvio`, `Cargo`, `Destinatario`, `DireccionDestinatario`, `CiudadDestinatario`, `RegionDestinatario`, `CodPostalDestinatario`, `PaisDestinatario`) VALUES
(10254, 'CHOPS', 5, '1996-07-11', '1996-08-08', '1996-07-23', 2, 23, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Suiza'),
(10265, 'BLONP', 2, '1996-07-25', '1996-08-22', '1996-08-12', 1, 55, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia'),
(10269, 'WHITC', 5, '1996-07-31', '1996-08-14', '1996-08-09', 1, 5, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos'),
(10277, 'MORGK', 2, '1996-08-09', '1996-09-06', '1996-08-13', 3, 126, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemania'),
(10280, 'BERGS', 2, '1996-08-14', '1996-09-11', '1996-09-12', 1, 9, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia'),
(10295, 'VINET', 2, '1996-09-02', '1996-09-30', '1996-09-10', 2, 1, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'Francia'),
(10297, 'BLONP', 5, '1996-09-04', '1996-10-16', '1996-09-10', 2, 6, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'Francia'),
(10300, 'MAGAA', 2, '1996-09-09', '1996-10-07', '1996-09-18', 2, 18, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia'),
(10307, 'LONEP', 2, '1996-09-17', '1996-10-15', '1996-09-25', 2, 1, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'Estados Unidos'),
(10312, 'WANDK', 2, '1996-09-23', '1996-10-21', '1996-10-03', 2, 40, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemania'),
(10313, 'QUICK', 2, '1996-09-24', '1996-10-22', '1996-10-04', 2, 2, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania'),
(10320, 'WARTH', 5, '1996-10-03', '1996-10-17', '1996-10-18', 3, 35, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia'),
(10327, 'FOLKO', 2, '1996-10-11', '1996-11-08', '1996-10-14', 1, 63, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia'),
(10333, 'WARTH', 5, '1996-10-18', '1996-11-15', '1996-10-25', 3, 1, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia'),
(10339, 'MEREP', 2, '1996-10-28', '1996-11-25', '1996-11-04', 2, 16, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá'),
(10345, 'QUICK', 2, '1996-11-04', '1996-12-02', '1996-11-11', 2, 249, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania'),
(10358, 'LAMAI', 5, '1996-11-20', '1996-12-18', '1996-11-27', 1, 20, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia'),
(10359, 'SEVES', 5, '1996-11-21', '1996-12-19', '1996-11-26', 3, 288, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido'),
(10368, 'ERNSH', 2, '1996-11-29', '1996-12-27', '1996-12-02', 2, 102, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10372, 'QUEEN', 5, '1996-12-04', '1997-01-01', '1996-12-09', 2, 891, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil'),
(10378, 'FOLKO', 5, '1996-12-10', '1997-01-07', '1996-12-19', 3, 5, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia'),
(10379, 'QUEDE', 2, '1996-12-11', '1997-01-08', '1996-12-13', 1, 45, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil'),
(10388, 'SEVES', 2, '1996-12-19', '1997-01-16', '1996-12-20', 1, 35, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido'),
(10392, 'PICCO', 2, '1996-12-24', '1997-01-21', '1997-01-01', 3, 122, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10397, 'PRINI', 5, '1996-12-27', '1997-01-24', '1997-01-02', 1, 60, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal'),
(10398, 'SAVEA', 2, '1996-12-30', '1997-01-27', '1997-01-09', 3, 89, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos'),
(10404, 'MAGAA', 2, '1997-01-03', '1997-01-31', '1997-01-08', 1, 156, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia'),
(10407, 'OTTIK', 2, '1997-01-07', '1997-02-04', '1997-01-30', 2, 91, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania'),
(10414, 'FAMIA', 2, '1997-01-14', '1997-02-11', '1997-01-17', 3, 21, 'Familia Arquibaldo', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil'),
(10422, 'FRANS', 2, '1997-01-22', '1997-02-19', '1997-01-31', 1, 3, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italia'),
(10457, 'KOENE', 2, '1997-02-25', '1997-03-25', '1997-03-03', 1, 12, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania'),
(10462, 'CONSH', 2, '1997-03-03', '1997-03-31', '1997-03-18', 1, 6, 'Consolidated Holdings', 'Berkeley Gardens\r\n12  Brewery ', 'London', NULL, 'WX1 6LT', 'Reino Unido'),
(10463, 'SUPRD', 5, '1997-03-04', '1997-04-01', '1997-03-06', 3, 15, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica'),
(10471, 'BSBEV', 2, '1997-03-11', '1997-04-08', '1997-03-18', 3, 46, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido'),
(10474, 'PERIC', 5, '1997-03-13', '1997-04-10', '1997-03-21', 2, 83, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México'),
(10477, 'PRINI', 5, '1997-03-17', '1997-04-14', '1997-03-25', 2, 13, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal'),
(10478, 'VICTE', 2, '1997-03-18', '1997-04-01', '1997-03-26', 3, 5, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'Francia'),
(10487, 'QUEEN', 2, '1997-03-26', '1997-04-23', '1997-03-28', 2, 71, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil'),
(10502, 'PERIC', 2, '1997-04-10', '1997-05-08', '1997-04-29', 1, 69, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México'),
(10515, 'QUICK', 2, '1997-04-23', '1997-05-07', '1997-05-23', 1, 204, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania'),
(10516, 'HUNGO', 2, '1997-04-24', '1997-05-22', '1997-05-01', 3, 63, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda'),
(10529, 'MAISD', 5, '1997-05-07', '1997-06-04', '1997-05-09', 2, 67, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica'),
(10541, 'HANAR', 2, '1997-05-19', '1997-06-16', '1997-05-29', 1, 69, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil'),
(10549, 'QUICK', 5, '1997-05-27', '1997-06-10', '1997-05-30', 1, 171, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania'),
(10552, 'HILAA', 2, '1997-05-29', '1997-06-26', '1997-06-05', 1, 83, 'HILARIÓN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela'),
(10553, 'WARTH', 2, '1997-05-30', '1997-06-27', '1997-06-03', 2, 149, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia'),
(10556, 'SIMOB', 2, '1997-06-03', '1997-07-15', '1997-06-13', 1, 10, 'Simons bistro', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca'),
(10561, 'FOLKO', 2, '1997-06-06', '1997-07-04', '1997-06-09', 2, 242, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia'),
(10563, 'RICAR', 2, '1997-06-10', '1997-07-22', '1997-06-24', 2, 60, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil'),
(10569, 'RATTC', 5, '1997-06-16', '1997-07-14', '1997-07-11', 1, 59, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos'),
(10575, 'MORGK', 5, '1997-06-20', '1997-07-04', '1997-06-30', 1, 127, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemania'),
(10583, 'WARTH', 2, '1997-06-30', '1997-07-28', '1997-07-04', 2, 7, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia'),
(10588, 'QUICK', 2, '1997-07-03', '1997-07-31', '1997-07-10', 3, 195, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania'),
(10595, 'ERNSH', 2, '1997-07-10', '1997-08-07', '1997-07-14', 1, 97, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10607, 'SAVEA', 5, '1997-07-22', '1997-08-19', '1997-07-25', 1, 200, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos'),
(10615, 'WILMK', 2, '1997-07-30', '1997-08-27', '1997-08-06', 3, 1, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia'),
(10620, 'LAUGB', 2, '1997-08-05', '1997-09-02', '1997-08-14', 3, 1, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canadá'),
(10648, 'RICAR', 5, '1997-08-28', '1997-10-09', '1997-09-09', 2, 14, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil'),
(10649, 'MAISD', 5, '1997-08-28', '1997-09-25', '1997-08-29', 3, 6, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica'),
(10650, 'FAMIA', 5, '1997-08-29', '1997-09-26', '1997-09-03', 3, 177, 'Familia Arquibaldo', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil'),
(10654, 'BERGS', 5, '1997-09-02', '1997-09-30', '1997-09-11', 1, 55, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia'),
(10657, 'SAVEA', 2, '1997-09-04', '1997-10-02', '1997-09-15', 2, 353, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos'),
(10663, 'BONAP', 2, '1997-09-10', '1997-09-24', '1997-10-03', 2, 113, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia'),
(10669, 'SIMOB', 2, '1997-09-15', '1997-10-13', '1997-09-22', 1, 24, 'Simons bistro', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca'),
(10673, 'WILMK', 2, '1997-09-18', '1997-10-16', '1997-09-19', 1, 23, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia'),
(10675, 'FRANK', 5, '1997-09-19', '1997-10-17', '1997-09-23', 2, 32, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemania'),
(10676, 'TORTU', 2, '1997-09-22', '1997-10-20', '1997-09-29', 2, 2, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México'),
(10683, 'DUMON', 2, '1997-09-26', '1997-10-24', '1997-10-01', 1, 4, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'Francia'),
(10686, 'PICCO', 2, '1997-09-30', '1997-10-28', '1997-10-08', 1, 96, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(10691, 'QUICK', 2, '1997-10-03', '1997-11-14', '1997-10-22', 2, 810, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania'),
(10711, 'SAVEA', 5, '1997-10-21', '1997-12-02', '1997-10-29', 2, 52, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos'),
(10714, 'SAVEA', 5, '1997-10-22', '1997-11-19', '1997-10-27', 3, 24, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos'),
(10721, 'QUICK', 5, '1997-10-29', '1997-11-26', '1997-10-31', 3, 49, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania'),
(10727, 'REGGC', 2, '1997-11-03', '1997-12-01', '1997-12-05', 1, 90, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia'),
(10730, 'BONAP', 5, '1997-11-05', '1997-12-03', '1997-11-14', 1, 20, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'Francia'),
(10734, 'GOURL', 2, '1997-11-07', '1997-12-05', '1997-11-12', 3, 2, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil'),
(10737, 'VINET', 2, '1997-11-11', '1997-12-09', '1997-11-18', 2, 8, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'Francia'),
(10738, 'SPECD', 2, '1997-11-12', '1997-12-10', '1997-11-18', 1, 3, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'Francia'),
(10752, 'NORTS', 2, '1997-11-24', '1997-12-22', '1997-11-28', 3, 1, 'North/South', 'South House\r\n300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'Reino Unido'),
(10761, 'RATTC', 5, '1997-12-02', '1997-12-30', '1997-12-08', 2, 19, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos'),
(10780, 'LILAS', 2, '1997-12-16', '1997-12-30', '1997-12-25', 1, 42, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10781, 'WARTH', 2, '1997-12-17', '1998-01-14', '1997-12-19', 3, 73, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlandia'),
(10787, 'LAMAI', 2, '1997-12-19', '1998-01-02', '1997-12-26', 1, 250, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia'),
(10798, 'ISLAT', 2, '1997-12-26', '1998-01-23', '1998-01-05', 1, 2, 'Island Trading', 'Garden House\r\nCrowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'Reino Unido'),
(10805, 'THEBI', 2, '1997-12-30', '1998-01-27', '1998-01-09', 3, 237, 'The Big Cheese', '89 Jefferson Way\r\nSuite 2', 'Portland', 'OR', '97201', 'Estados Unidos'),
(10808, 'OLDWO', 2, '1998-01-01', '1998-01-29', '1998-01-09', 3, 46, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'Estados Unidos'),
(10810, 'LAUGB', 2, '1998-01-01', '1998-01-29', '1998-01-07', 3, 4, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canadá'),
(10812, 'REGGC', 5, '1998-01-02', '1998-01-30', '1998-01-12', 1, 60, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia'),
(10815, 'SAVEA', 2, '1998-01-05', '1998-02-02', '1998-01-14', 3, 15, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos'),
(10819, 'CACTU', 2, '1998-01-07', '1998-02-04', '1998-01-16', 3, 20, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina'),
(10823, 'LILAS', 5, '1998-01-09', '1998-02-06', '1998-01-13', 2, 164, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10832, 'LAMAI', 2, '1998-01-14', '1998-02-11', '1998-01-19', 2, 43, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'Francia'),
(10841, 'SUPRD', 5, '1998-01-20', '1998-02-17', '1998-01-29', 2, 424, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica'),
(10846, 'SUPRD', 2, '1998-01-22', '1998-03-05', '1998-01-23', 3, 56, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica'),
(10851, 'RICAR', 5, '1998-01-26', '1998-02-23', '1998-02-02', 1, 161, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil'),
(10858, 'LACOR', 2, '1998-01-29', '1998-02-26', '1998-02-03', 1, 53, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'Francia'),
(10865, 'QUICK', 2, '1998-02-02', '1998-02-16', '1998-02-12', 1, 348, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemania'),
(10866, 'BERGS', 5, '1998-02-03', '1998-03-03', '1998-02-12', 1, 109, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suecia'),
(10869, 'SEVES', 5, '1998-02-04', '1998-03-04', '1998-02-09', 1, 143, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido'),
(10870, 'WHITC', 5, '1998-02-04', '1998-03-04', '1998-02-13', 3, 12, 'White Clover Markets', '305 - 14th Ave. S.\r\nSuite 3B', 'Seattle', 'WA', '98128', 'Estados Unidos'),
(10872, 'GODOS', 5, '1998-02-05', '1998-03-05', '1998-02-09', 2, 175, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España'),
(10874, 'GODOS', 5, '1998-02-06', '1998-03-06', '1998-02-11', 2, 20, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España'),
(10899, 'LILAS', 5, '1998-02-20', '1998-03-20', '1998-02-26', 3, 1, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10912, 'HUNGO', 2, '1998-02-26', '1998-03-26', '1998-03-18', 2, 581, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda'),
(10915, 'TORTU', 2, '1998-02-27', '1998-03-27', '1998-03-02', 2, 4, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México'),
(10919, 'LINOD', 2, '1998-03-02', '1998-03-30', '1998-03-04', 2, 20, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10922, 'HANAR', 5, '1998-03-03', '1998-03-31', '1998-03-05', 3, 63, 'Hanari Carnes', 'Rua do Paço, 67', 'Río de Janeiro', 'RJ', '05454-876', 'Brasil'),
(10939, 'MAGAA', 2, '1998-03-10', '1998-04-07', '1998-03-13', 2, 76, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bérgamo', NULL, '24100', 'Italia'),
(10949, 'BOTTM', 2, '1998-03-13', '1998-04-10', '1998-03-17', 3, 74, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá'),
(10954, 'LINOD', 5, '1998-03-17', '1998-04-28', '1998-03-20', 1, 28, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(10967, 'TOMSP', 2, '1998-03-23', '1998-04-20', '1998-04-02', 2, 62, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemania'),
(10971, 'FRANR', 2, '1998-03-24', '1998-04-21', '1998-04-02', 2, 122, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'Francia'),
(10982, 'BOTTM', 2, '1998-03-27', '1998-04-24', '1998-04-08', 1, 14, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá'),
(10983, 'SAVEA', 2, '1998-03-27', '1998-04-24', '1998-04-06', 2, 658, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'Estados Unidos'),
(10985, 'HUNGO', 2, '1998-03-30', '1998-04-27', '1998-04-02', 1, 92, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda'),
(10989, 'QUEDE', 2, '1998-03-31', '1998-04-28', '1998-04-02', 1, 35, 'Que Delícia', 'Rua da Panificadora, 12', 'Río de Janeiro', 'RJ', '02389-673', 'Brasil'),
(10990, 'ERNSH', 2, '1998-04-01', '1998-05-13', '1998-04-07', 3, 118, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
(10994, 'VAFFE', 2, '1998-04-02', '1998-04-16', '1998-04-09', 3, 66, 'Vaffeljernet', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca'),
(11000, 'RATTC', 2, '1998-04-06', '1998-05-04', '1998-04-14', 3, 55, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos'),
(11001, 'FOLKO', 2, '1998-04-06', '1998-05-04', '1998-04-14', 2, 197, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suecia'),
(11005, 'WILMK', 2, '1998-04-07', '1998-05-05', '1998-04-10', 1, 1, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlandia'),
(11009, 'GODOS', 2, '1998-04-08', '1998-05-06', '1998-04-10', 1, 59, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'España'),
(11010, 'REGGC', 2, '1998-04-09', '1998-05-07', '1998-04-21', 2, 29, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italia'),
(11013, 'ROMEY', 2, '1998-04-09', '1998-05-07', '1998-04-10', 1, 33, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'España'),
(11014, 'LINOD', 2, '1998-04-10', '1998-05-08', '1998-04-15', 3, 24, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela'),
(11015, 'SANTG', 2, '1998-04-10', '1998-04-24', '1998-04-20', 2, 5, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega'),
(11020, 'OTTIK', 2, '1998-04-14', '1998-05-12', '1998-04-16', 2, 43, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemania'),
(11028, 'KOENE', 2, '1998-04-16', '1998-05-14', '1998-04-22', 1, 30, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemania'),
(11032, 'WHITC', 2, '1998-04-17', '1998-05-15', '1998-04-23', 3, 606, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos'),
(11035, 'SUPRD', 2, '1998-04-20', '1998-05-18', '1998-04-24', 2, 0, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica'),
(11042, 'COMMI', 2, '1998-04-22', '1998-05-06', '1998-05-01', 1, 30, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil'),
(11043, 'SPECD', 5, '1998-04-22', '1998-05-20', '1998-04-29', 2, 9, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'Francia'),
(11053, 'PICCO', 2, '1998-04-27', '1998-05-25', '1998-04-29', 2, 53, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria'),
(11059, 'RICAR', 2, '1998-04-29', '1998-06-10', NULL, 2, 86, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Río de Janeiro', 'RJ', '02389-890', 'Brasil'),
(11060, 'FRANS', 2, '1998-04-30', '1998-05-28', '1998-05-04', 2, 11, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italia'),
(11070, 'LEHMS', 2, '1998-05-05', '1998-06-02', NULL, 1, 136, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M. ', NULL, '60528', 'Alemania'),
(11073, 'PERIC', 2, '1998-05-05', '1998-06-02', NULL, 2, 25, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `IdProducto` int(11) unsigned NOT NULL COMMENT 'Id. de producto. Número asignado a un producto nuevo.',
  `NombreProducto` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdProveedor` int(11) unsigned NOT NULL COMMENT 'Proveedor. Igual al Id. de la tabla Proveedores.',
  `IdCategoria` int(11) unsigned NOT NULL COMMENT 'Categoría. Igual al Id. de la tabla Categorías.',
  `CantidadPorUnidad` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Cantidad por unidad. (por ej. caja de 24, botella de 1 litro).',
  `PrecioUnidad` double unsigned DEFAULT NULL COMMENT 'Precio por unidad',
  `UnidadesEnExistencia` smallint(6) unsigned DEFAULT NULL COMMENT 'Unidades en existencia',
  `UnidadesEnPedido` smallint(6) unsigned DEFAULT NULL COMMENT 'Unidades pedidas',
  `NivelNuevoPedido` int(11) unsigned DEFAULT NULL COMMENT 'Nivel de nuevo pedido. Cantidad de unidades mínima en existencia.',
  `Suspendido` tinyint(1) DEFAULT NULL COMMENT 'Sí indica que el elemento no está disponible. Posibles valores 0 (No) ó 1 (Si)'
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `NombreProducto`, `IdProveedor`, `IdCategoria`, `CantidadPorUnidad`, `PrecioUnidad`, `UnidadesEnExistencia`, `UnidadesEnPedido`, `NivelNuevoPedido`, `Suspendido`) VALUES
(7, 'Peras secas orgánicas del tío Bob', 3, 7, '12 - paq. 1 kg', 30, 15, 0, 10, 0),
(8, 'Salsa de arándanos Northwoods', 3, 2, '12 - frascos 12 l', 40, 6, 0, 0, 0),
(10, 'Pez espada', 4, 8, '12 - frascos 200 ml', 31, 31, 0, 0, 0),
(11, 'Queso Cabrales', 5, 4, 'paq. 1 kg', 21, 22, 30, 30, 0),
(12, 'Queso Manchego La Pastora', 5, 4, '10 - paq. 500 g', 38, 86, 0, 0, 0),
(13, 'Algas Konbu', 6, 8, 'caja 2 kg', 6, 24, 0, 5, 0),
(14, 'Cuajada de judías', 6, 7, '40 - paq. 100 g', 23.25, 35, 0, 0, 0),
(16, 'Postre de merengue Pavlova', 7, 9, '32 - cajas 500 g', 17.45, 29, 0, 10, 0),
(17, 'Cordero Alice Springs', 7, 6, '20 - latas 1 kg', 39, 0, 0, 0, 1),
(18, 'Langostinos tigre Carnarvon', 7, 8, 'paq. 16 kg', 62.5, 42, 0, 0, 0),
(19, 'Pastas de té de chocolate', 8, 9, '10 cajas x 12 piezas', 9.2, 25, 0, 5, 0),
(20, 'Mermelada de Sir Rodney''s', 8, 9, '30 cajas regalo', 81, 40, 0, 0, 0),
(21, 'Bollos de Sir Rodney''s', 8, 9, '24 paq. x 4 piezas', 10, 3, 40, 5, 0),
(22, 'Pan de centeno crujiente estilo Gustaf''s', 9, 5, '24 - paq. 500 g', 21, 104, 0, 25, 0),
(23, 'Pan fino', 9, 5, '12 - paq. 250 g', 9, 61, 0, 25, 0),
(25, 'Crema de chocolate y nueces NuNuCa', 11, 9, '20 - vasos  450 g', 14, 76, 0, 30, 0),
(26, 'Ositos de goma Gumbär', 11, 9, '100 - bolsas 250 g', 31.23, 15, 0, 0, 0),
(27, 'Chocolate Schoggi', 11, 9, '100 - piezas 100 g', 43.9, 49, 0, 30, 0),
(28, 'Col fermentada Rössle', 12, 7, '25 - latas 825 g', 45.6, 26, 0, 0, 1),
(29, 'Salchicha Thüringer', 12, 6, '50 bolsas x 30 salch', 123.79, 0, 0, 0, 1),
(30, 'Arenque blanco del noroeste', 13, 8, '10 - vasos 200 g', 25.89, 10, 0, 15, 0),
(31, 'Queso gorgonzola Telino', 14, 4, '12 - paq. 100 g', 12.5, 0, 70, 20, 0),
(32, 'Queso Mascarpone Fabioli', 14, 4, '24 - paq. 200 g', 32, 9, 40, 25, 0),
(33, 'Queso de cabra', 15, 4, '500 g', 2.5, 112, 0, 20, 0),
(34, 'Cerveza Sasquatch', 16, 1, '24 - bot. 12 l', 14, 111, 0, 15, 0),
(37, 'Salmón ahumado Gravad', 17, 8, '12 - paq. 500 g', 26, 11, 50, 25, 0),
(38, 'Vino Côte de Blaye', 18, 1, '12 - bot. 75 cl', 263.5, 17, 0, 15, 0),
(39, 'Licor verde Chartreuse', 18, 1, '750 cc por bot.', 18, 69, 0, 5, 0),
(40, 'Carne de cangrejo de Boston', 19, 8, '24 - latas 4 l', 18.4, 123, 0, 30, 0),
(41, 'Crema de almejas estilo Nueva Inglaterra', 19, 8, '12 - latas 12 l', 9.65, 85, 0, 10, 0),
(42, 'Tallarines de Singapur', 20, 5, '32 - 1 kg paq.', 14, 26, 0, 0, 1),
(43, 'Café de Malasia', 20, 1, '16 - latas 500 g', 46, 17, 10, 25, 0),
(46, 'Arenque salado', 21, 8, '4 - vasos 450 g', 12, 95, 0, 0, 0),
(47, 'Galletas Zaanse', 22, 9, '10 - cajas 4 l', 9.5, 36, 0, 0, 0),
(48, 'Chocolate holandés', 22, 9, '10 paq.', 12.75, 15, 70, 25, 0),
(49, 'Regaliz', 23, 9, '24 - paq. 50 g', 20, 10, 60, 15, 0),
(50, 'Chocolate blanco', 23, 9, '12 - barras 100 g', 16.25, 65, 0, 30, 0),
(51, 'Manzanas secas Manjimup', 24, 7, '50 - paq. 300 g', 53, 20, 0, 10, 0),
(52, 'Cereales para Filo', 24, 5, '16 - cajas 2 kg', 7, 38, 0, 25, 0),
(53, 'Empanada de carne', 24, 6, '48 porc.', 32.8, 0, 0, 0, 1),
(54, 'Empanada de cerdo', 25, 6, '16 tartas', 7.45, 21, 0, 10, 0),
(55, 'Paté chino', 25, 6, '24 cajas x 2 tartas', 24, 115, 0, 20, 0),
(56, 'Gnocchi de la abuela Alicia', 26, 5, '24 - paq. 250 g', 38, 21, 10, 30, 0),
(57, 'Raviolis Angelo', 26, 5, '24 - paq. 250 g', 19.5, 36, 0, 20, 0),
(58, 'Caracoles de Borgoña', 27, 8, '24 porc.', 13.25, 62, 0, 20, 0),
(59, 'Raclet de queso Courdavault', 28, 4, 'paq. 5 kg', 55, 79, 0, 0, 0),
(60, 'Camembert Pierrot', 28, 4, '15 - paq. 300 g', 34, 19, 0, 0, 0),
(62, 'Tarta de azúcar', 29, 9, '48 tartas', 49.3, 17, 0, 0, 0),
(63, 'Sandwich de vegetales', 7, 2, '15 - frascos 625 g', 43.9, 24, 0, 5, 0),
(64, 'Bollos de pan de Wimmer', 12, 5, '20 bolsas x 4 porc.', 33.25, 22, 80, 30, 0),
(65, 'Salsa de pimiento picante de Luisiana', 2, 2, '32 - bot. 8 l', 21.05, 76, 0, 0, 0),
(66, 'Especias picantes de Luisiana', 2, 2, '24 - frascos 8 l', 17, 4, 100, 20, 0),
(67, 'Cerveza Laughing Lumberjack', 16, 1, '24 - bot. 12 l', 14, 52, 0, 10, 0),
(68, 'Barras de pan de Escocia', 8, 9, '10 cajas x 8 porc.', 12.5, 6, 10, 15, 0),
(69, 'Queso Gudbrandsdals', 15, 4, 'paq. 10 kg', 36, 26, 0, 15, 0),
(72, 'Queso Mozzarella Giovanni', 14, 4, '24 - paq. 200 g', 34.8, 14, 0, 0, 0),
(73, 'Caviar rojo', 17, 8, '24 - frascos150 g', 15, 101, 0, 5, 0),
(74, 'Queso de soja Longlife', 4, 7, 'paq. 5 kg', 10, 4, 20, 5, 0),
(75, 'Cerveza Klosterbier Rhönbräu', 12, 1, '24 - bot. 0,5 l', 7.75, 125, 0, 25, 0),
(76, 'Licor Cloudberry', 23, 1, '500 ml', 18, 57, 0, 20, 0),
(77, 'Salsa verde original Frankfurter', 12, 2, '12 cajas', 13, 32, 0, 15, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
  `IdProveedor` int(11) unsigned NOT NULL COMMENT 'Id. de proveedor. Número asignado a un proveedor nuevo.',
  `NombreCompania` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NombreContacto` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CargoContacto` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Calle o apartado de correos.',
  `Ciudad` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Region` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CodPostal` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Pais` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono` varchar(24) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Incluye el código de país o de área.',
  `Fax` varchar(24) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Incluye el código de país o de área.',
  `PaginaPrincipal` mediumtext COLLATE utf8_spanish_ci COMMENT 'Página principal del proveedor en el Web. Formato URL.'
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`IdProveedor`, `NombreCompania`, `NombreContacto`, `CargoContacto`, `Direccion`, `Ciudad`, `Region`, `CodPostal`, `Pais`, `Telefono`, `Fax`, `PaginaPrincipal`) VALUES
(1, 'Exotic Liquids', 'Charlotte Cooper', 'Gerente de compras', '49 Gilbert St.', 'Londres', NULL, 'EC1 4SD', 'Reino Unido', '(171) 555-2222', NULL, NULL),
(2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Administrador de Pedidos', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'Estados Unidos', '(100) 555-4822', NULL, NULL),
(3, 'Grandma Kelly''s Homestead', 'Regina Murphy', 'Representante de ventas', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'Estados Unidos', '(313) 555-5735', '(313) 555-3349', NULL),
(4, 'Tokyo Traders', 'Yoshi Nagase', 'Gerente de marketing', '9-8 Sekimai\r\nMusashino-shi', 'Tokyo', NULL, '100', 'Japón', '(03) 3555-5011', NULL, NULL),
(5, 'Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra ', 'Administrador de exportaciones', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'España', '(98) 598 76 54', NULL, NULL),
(6, 'Mayumi''s', 'Mayumi Ohno', 'Representante de marketing', '92 Setsuko\r\nChuo-ku', 'Osaka', NULL, '545', 'Japón', '(06) 431-7877', NULL, NULL),
(7, 'Pavlova, Ltd.', 'Ian Devling', 'Gerente de marketing', '74 Rose St.\r\nMoonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL),
(8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Representante de ventas', '29 King''s Way', 'Manchester', NULL, 'M14 GSD', 'Reino Unido', '(161) 555-4448', NULL, NULL),
(9, 'PB Knäckebröd AB', 'Lars Peterson', 'Agente de ventas', 'Kaloadagatan 13', 'Göteborg', NULL, 'S-345 67', 'Suecia', '031-987 65 43', '031-987 65 91', NULL),
(10, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Gerente de marketing', 'Av. das Americanas 12.890', 'São Paulo', NULL, '5442', 'Brasil', '(11) 555 4640', NULL, NULL),
(11, 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Gerente de ventas', 'Tiergartenstraße 5', 'Berlín', NULL, '10785', 'Alemania', '(010) 9984510', NULL, NULL),
(12, 'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'Ger. marketing internacional', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Alemania', '(069) 992755', NULL, NULL),
(13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinador de mercados', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Alemania', '(04721) 8713', '(04721) 8714', NULL),
(14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Representante de ventas', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italia', '(0544) 60323', '(0544) 60603', NULL),
(15, 'Norske Meierier', 'Beate Vileid', 'Gerente de marketing', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Noruega', '(0)2-953010', NULL, NULL),
(16, 'Bigfoot Breweries', 'Cheryl Saylor', 'Repr. de cuentas regional', '3400 - 8th Avenue\r\nSuite 210', 'Bend', 'OR', '97101', 'Estados Unidos', '(503) 555-9931', NULL, NULL),
(17, 'Svensk Sjöföda AB', 'Michael Björn', 'Representante de ventas', 'Brovallavägen 231', 'Stockholm', NULL, 'S-123 45', 'Suecia', '08-123 45 67', NULL, NULL),
(18, 'Aux joyeux ecclésiastiques', 'Guylène Nodier', 'Gerente de ventas', '203, Rue des Francs-Bourgeois', 'París', NULL, '75004', 'Francia', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL),
(19, 'New England Seafood Cannery', 'Robb Merchant', 'Agente de cuentas al por mayor', 'Order Processing Dept.\r\n2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'Estados Unidos', '(617) 555-3267', '(617) 555-3389', NULL),
(20, 'Leka Trading', 'Chandra Leka', 'Propietario', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapur', '555-8787', NULL, NULL),
(21, 'Lyngbysild', 'Niels Petersen', 'Gerente de ventas', 'Lyngbysild\r\nFiskebakken 10', 'Lyngby', NULL, '2800', 'Dinamarca', '43844108', '43844115', NULL),
(22, 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Gerente de contabilidad', 'Verkoop\r\nRijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Holanda', '(12345) 1212', '(12345) 1210', NULL),
(23, 'Karkki Oy', 'Anne Heikkonen', 'Gerente de producción', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finlandia', '(953) 10956', NULL, NULL),
(24, 'G''day, Mate', 'Wendy Mackenzie', 'Representante de ventas', '170 Prince Edward Parade\r\nHunter''s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', NULL),
(25, 'Ma Maison', 'Jean-Guy Lauzon', 'Gerente de marketing', '2960 Rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá', '(514) 555-9022', NULL, NULL),
(26, 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Administrador de Pedidos', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italia', '(089) 6547665', '(089) 6547667', NULL),
(27, 'Escargots Nouveaux', 'Marie Delamare', 'Gerente de ventas', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'Francia', '85.57.00.07', NULL, NULL),
(28, 'Gai pâturage', 'Eliane Noz', 'Representante de ventas', 'Bat. B\r\n3, rue des Alpes', 'Annecy', NULL, '74000', 'Francia', '38.76.98.06', '38.76.98.58', NULL),
(29, 'Forêts d''érables', 'Chantal Goulet', 'Gerente de contabilidad', '148 rue Chasseur', 'Ste-Hyacinthe', 'Québec', 'J2S 7S8', 'Canadá', '(514) 555-2955', '(514) 555-2921', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(3) unsigned zerofill NOT NULL,
  `login` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `pass` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `NivelAcceso` tinyint(1) unsigned NOT NULL DEFAULT '3',
  `Nombre` varchar(60) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci PACK_KEYS=1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `login`, `pass`, `NivelAcceso`, `Nombre`) VALUES
(001, 'administrador', '12345678', 1, 'Raquel Zambrano'),
(002, 'usuario1', '87654321', 2, 'Pedrito de los Palotes');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `companias`
--
ALTER TABLE `companias`
  ADD PRIMARY KEY (`IdCompaniaEnvios`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`IdPedido`,`IdProducto`),
  ADD KEY `IdPedido` (`IdPedido`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`IdEmpleado`),
  ADD KEY `Jefe` (`Jefe`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`IdPedido`),
  ADD KEY `IdCliente` (`IdCliente`),
  ADD KEY `IdEmpleado` (`IdEmpleado`),
  ADD KEY `FormaEnvio` (`FormaEnvio`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IdProducto`),
  ADD KEY `IdProveedor` (`IdProveedor`),
  ADD KEY `IdCategoria` (`IdCategoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`IdProveedor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `IdCategoria` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Número asignado a cada nueva categoría.',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `companias`
--
ALTER TABLE `companias`
  MODIFY `IdCompaniaEnvios` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Número asignado a una compañía nueva.',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `IdEmpleado` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Número asignado a un empleado nuevo.',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IdProducto` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id. de producto. Número asignado a un producto nuevo.',AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `IdProveedor` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id. de proveedor. Número asignado a un proveedor nuevo.',AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_ibfk_1` FOREIGN KEY (`IdPedido`) REFERENCES `pedidos` (`IdPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalles_ibfk_2` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `Empleados_ibfk_1` FOREIGN KEY (`Jefe`) REFERENCES `empleados` (`IdEmpleado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`FormaEnvio`) REFERENCES `companias` (`IdCompaniaEnvios`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`IdProveedor`) REFERENCES `proveedores` (`IdProveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `serviciox24`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bombero`
--

CREATE TABLE IF NOT EXISTS `bombero` (
  `1` int(4) NOT NULL,
  `2` int(8) NOT NULL,
  `3` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `4` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `5` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `6` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `7` int(3) NOT NULL,
  `8` int(3) NOT NULL,
  `9` int(4) NOT NULL,
  `10` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `11` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `12` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `13` int(2) NOT NULL,
  `14` int(2) NOT NULL,
  `15` int(4) NOT NULL,
  `16` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `17` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `18` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `19` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `20` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `21` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `22` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `23` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `24` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `bombero`
--

INSERT INTO `bombero` (`1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `17`, `18`, `19`, `20`, `21`, `22`, `23`, `24`) VALUES
(1, 18397052, 'Bo-0700', 'Cabo/1ro', 'Johana Elizabeth', 'Abou-Assi Varela ', 1, 9, 2006, 'Venezolano', 'Femenino', 'EL VIGIA ', 15, 6, 1986, 'Bachiller', 'CIENCIAS', 'urbanización los curos parte media bloque 03 apartamento 2-02', '4247399990', '0414-7165579', 'johanaabouassi_15@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(2, 8084462, 'Bo-0001', 'Sgto/Aydte', 'Jairo Gregorio', 'Abreu Omaña', 1, 2, 1999, 'Venezolano', 'Masculino', 'TOVAR', 3, 10, 1964, 'Bachiller', 'HUMANIDADES', 'CALLE1, C ON CARRERA 7 CASA Nº7-4 EL COROZO TOVAR', '4265703052', '0275-8732019', 'thebombert@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(3, 17239609, 'Bo-0701', 'Cabo/2do', 'Jhoan Enrique', 'Acosta Parra ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Mérida', 24, 3, 1986, 'Tecnico Medio', 'Hoteleria y Turismo', 'Residencias Villa Libertad, las Gonzales, edificio N-1-2,apatamento 27', '4247614223', '2742453065', 'jaeap42@hotmail.com', 'Activo', '', 'Metropolitana'),
(4, 15921320, 'Bo-0931', 'Bombero', 'Erika Lisberth', 'Acosta Parra ', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 24, 7, 1982, 'Tecnico Medio', 'HOTELERIA', 'Chamita residencia los Bucares torre k apartamento 2-1', '4264378948', '2742453065', 'eri_2424@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(5, 10896928, 'Bo-0075', 'Sgto/Aydte', 'Manolo Miguel', 'Acosta Pereira', 1, 1, 1999, 'Venezolano', 'Masculino', 'Merida', 17, 7, 1970, 'Licenciado', 'Mencion Rescate', 'Sector San Buen Aventura, Parroquia', '0416-4743367', '0274-4141159', 'manolorescate1@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(6, 8711940, 'Bo-0002', 'Sgto/Aydte', 'Henry José', 'Acosta Pereira', 1, 2, 1999, 'Venezolano', 'Masculino', 'Merida', 3, 5, 1969, 'Bachiller', 'Ciencias', 'Sector 7, vereda 2, Casa N-2, Los Curos Parte Alta', '0426-7764409', '2742714739', 'tiolucas.2009@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(7, 14623445, 'Bo-0305', 'Cabo/2do', 'María Andreina', 'Acosta de Contreras', 1, 7, 2002, 'Venezolano', 'Femenino', 'TOVAR', 12, 6, 1980, 'Bachiller', 'CIENCIAS', 'CALLE 29 DE JULIO CASA 5-62 TOVAR', '', '4169973605', '', 'Activo', 'Incendio', 'Metropolitana'),
(8, 11535150, 'Bo-0662', 'Sgto/1ro', 'Omar José', 'Agreda Jiménez', 1, 1, 2006, 'Venezolano', 'Masculino', 'Ciudad Bolivar', 11, 7, 1971, 'Abogado', 'Abogado ', 'AV. SECTOR SANTA ANA RES. ALBARREGAS EDF 1  PISO 4  APTO 4-79', '0426-6261616', '0274-6585875', 'omaragre@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(9, 18895243, 'Bo-0777', 'Distinguido', 'Anyerson  Rafael', 'Aguilar Briceño  ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 16, 7, 1989, 'TSU ', 'Medicina Prehospitalaria', 'Arenal, Calle La fría Casa 18 -92', '', '4161193628', 'aguila8584@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(10, 17521840, 'Bo-0702', 'Cabo/2do', 'Richard Joel', 'Aguilar López ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 15, 10, 1984, 'Bachiller', 'HUMANIDADES', 'AV. LAS AMERICAS SECTOR SANTA BARBARA CALLE PRINCIPAL CASA Nº9 Merida', '4160729560', '4267912918', 'blackshark_359@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(11, 18125652, 'Bo-0381', 'Sgto/Aydte', 'Zaira Edilma', 'Aguirre Barrero', 1, 9, 2003, 'Venezolano', 'Femenino', 'Merida', 25, 12, 1982, 'Tecnico Medio', 'RESCATE', 'TOVAR barrio monseñor moreno calle 03 casa 04', '0426-3287097', '', 'zedy382_382@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(12, 9479598, 'Bo-0539', 'Sgto/Aydte', 'Roger Anibal', 'Alarcón Díaz', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 31, 5, 1969, 'Tecnico Medio', 'ELECTRONICA', 'AV GONZALO PICON 39-110', '0416-1379054', '0274-2635814', 'Ralarcondia@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(13, 15074992, 'Bo-0090', 'SubTeniente', 'José Leonardo', 'Alarcón González ', 1, 10, 1999, 'Venezolano', 'Masculino', 'SANTA CRUZ DE MORA', 17, 3, 1980, 'TSU ', 'Ciencias del Fuego', 'URB. LOS CUROS PARTE ALTA BLOQUE 37 EDF 03 APTO 03-03', '0426-1769711', '', 'leonardoalarcon17@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(14, 14388145, 'Bo-0306', 'Distinguido', 'David Alexander', 'Alban León', 1, 7, 2002, 'Venezolano', 'Masculino', 'CARACAS', 1, 2, 1979, 'Bachiller', 'CIENCIAS', 'Sector las  González Residencia villa libertad, edif n5d1,apat 5', '4265706245', '', '', 'Activo', 'Incendio', 'Metropolitana'),
(15, 17239826, 'Bo-0540', 'Cabo/2do', 'José Gregorio', 'Albarran Rondon', 1, 9, 2004, 'Venezolano', 'Masculino', 'Valera', 27, 1, 1986, 'Tecnico Medio', 'Medicina de emergencia', 'Residencia Villa Libertad, Torre n1-a1 Apto- 23 ', '0414-0801701', '0274-2453548', 'sanosuke79@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(16, 17895622, 'Bo-0541', 'Sgto/2do', 'Yeiser Raymir', 'Albornoz Díaz', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 29, 12, 1986, 'Tecnico Medio', 'RESCATE', 'CALLE PRICIPAL EL LLANITO LA OTRA BANDA CASA 5-58', '4147255686', '2742443276', 'yeiser86@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(17, 13966536, 'Bo-0005', 'Teniente', 'Alvyss Gisela', 'Aldana Andrade', 1, 3, 1996, 'Venezolano', 'Femenino', 'VALERA', 14, 1, 1979, 'TSU', 'MANEJO DE EMERGENCIA', 'LOS CUROS V 17  CASA 1-12', '4167757396', '2742711526', 'raym241@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(18, 15032989, 'Bo-0307', 'Sgto/2do', 'Auryss Griselia', 'Aldana Andrade', 1, 7, 2002, 'Venezolano', 'Femenino', 'VALERA', 5, 8, 1980, 'Tecnico Medio', 'Medicina Prehospitalaria', 'EJIDO, URB, LUIS OMAR SULBARAN AVENIDA A . CASA 16 ', '4269750367', '0274-4148135', 'auryss@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(19, 16201204, 'Bo-0383', 'Sgto/2do', 'Ali Gregorio', 'Aldana Andrade', 1, 9, 2003, 'Venezolano', 'Masculino', 'MARACAIBO', 26, 12, 1982, 'Bachiller', '', 'EJIDO , AV. CENTENARIO RESIDENCIAS CENTENARIO,EDIFICIO 8 PISO 4 APART. 41', '4141794913', '0274-2218843', ' aliemil2612@hotmail.com ', 'Activo', 'Incendio', 'Metropolitana'),
(20, 20571142, 'Bo-0910', 'Cabo/2do', 'Soendy Stefanny', 'Aliendres Mendez', 1, 1, 2008, 'Venezolano', 'Femenino', 'EL VIGIA', 30, 10, 1990, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'URB CARABOBO VERDA 13 CASA 20 EL VIGIA', '4269343692', '2758815285', 'soendy_2@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(21, 17238492, 'Bo-0570', 'Cabo/2do', 'Darwin Ernesto', 'Allen Rondon', 1, 9, 2005, 'Venezolano', 'Masculino', 'CARACAS', 21, 11, 1982, 'Tecnico Medio', 'FITOTECNIA', 'San Jacinto frente al Conscripto casa 0-38', '0426-3373869', '', 'Alex_8291@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(22, 19996995, 'Bo-0911', 'Distinguido', 'José Gregorio', 'Alvarez Avendaño', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 2, 12, 1990, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'av los próceres pasaje sucre', '0414-7044874', '0274-2661805', 'joalaven12@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(23, 13478995, 'Bo-0308', 'Sgto/Aydte', 'José Tomas', 'Andrade Bermúdez', 1, 7, 2002, 'Venezolano', 'Masculino', 'Caracas', 9, 7, 1976, 'Licenciado', 'Tecnologia Bomberil', 'Palmarito Calle Santander , casa S/N', '0416-2743678', '0261-7377851', 'tomassalsero@yahoo.es', 'Activo', 'Incendio', 'Panamericana'),
(24, 17029593, 'Bo-0806', 'Bombero', 'Enderson Yohan', 'Andrade Quiñones', 1, 1, 2008, 'Venezolano', 'Masculino', 'EL VIGIA', 29, 9, 1985, 'Bachiller', 'CIENCIAS', '12 OCTUBRE AV 6 CALLE 15', '4247379328', '0275/8813058', 'endersonjhoan2010@hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(25, 15921465, 'Bo-0484', 'Cabo/2do', 'Frank Reinaldo', 'Andrade Ramírez', 1, 9, 2004, 'Venezolano', 'Masculino', 'MUCUCHIES ', 5, 10, 1980, 'Bachiller', '', 'APARTADEROS ESTADO MERIDA', '0424-7339940', '0274-8880203', 'jmsmzc@hotmail.com', 'Activo', '', 'Paramo'),
(26, 11217149, 'Bo-0278', 'Cabo/2do', 'Alex Enrique', 'Angulo Chacón', 1, 3, 2002, 'Venezolano', 'Masculino', 'la azulita ', 22, 6, 1972, 'Tecnico Medio', '', 'urb.bubuqui 2 torre 5 la pedregosa el vigía', '0416-3789871', '0275-8825672', 'alx22angulo@hotmail.com', 'Activo', '', 'Metropolitana'),
(27, 14936540, 'Bo-0309', 'Sgto/2do', 'Franklin Eduardo', 'Angulo Gómez', 1, 7, 2002, 'Venezolano', 'Masculino', 'TOVAR', 19, 12, 1980, 'TSU ', 'EMERGENCIA PREHOSPITALARI', 'urbanizacion la pez sector 1 casa 6 vereda 46 ', '0414-7069393', '0275-5147977', 'frankango@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(28, 12776888, 'Bo-0128', 'Teniente', 'Alejandro José ', 'Angulo González', 1, 5, 1994, 'Venezolano', 'Masculino', 'Merida', 1, 8, 1974, 'TSU ', 'RESCATE', 'BUBUQUI 2 BLQ 5 APTO 2-4', '4168722717', '4147240735', 'sar_alejandro74@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(29, 12776873, 'Bo-0006', 'Teniente', 'Juan Carlos', 'Angulo González', 1, 2, 1999, 'Venezolano', 'Masculino', 'Merida', 1, 10, 1976, 'Tecnico Medio', 'RESCATE', 'AV. GONZALO PICON  PASAJE 1  CASA 48-56', '4267264811', '', 'juancang@hotmail.es', 'Activo', 'Rescate', 'Metropolitana'),
(30, 16743695, 'Bo-0571', 'Cabo/1ro', 'Eduinw de Jesús', 'Angulo Padilla ', 1, 9, 2005, 'Venezolano', 'Masculino', 'VIGIA ', 5, 5, 1985, 'Bachiller', 'CIENCIAS ', 'EL VIGIA . BUENOS AIRES CALLE 7 AV 4 CASA 4-156', '0424-7013702', '2758813983', 'eduinm_bombero@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(31, 20218515, 'Bo-1046', 'Distinguido', 'Luis Xavier', 'Angulo Pernia', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 10, 8, 1990, 'Tecnico Medio', 'BOMBERO', 'SABANETA  CALL. QUEBRADA BLANCA CASA S/N', '4269027323', '0275-8731114', 'luisangulo_28@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(32, 19047240, 'Bo-1190', 'Bombero', 'Johan Alexander', 'Angulo Pernia', 1, 6, 2009, 'Venezolano', 'Masculino', 'TOVAR', 17, 8, 1989, 'Tecnico Medio', 'PREHOSPITALARIA', 'SABANETA TOVAR', '4161339839', '0275-8731114', 'johanpernia_912@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(33, 17769325, 'Bo-0932', 'Distinguido', 'Yonder Alberto', 'Angulo Ramos', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 26, 6, 1987, 'Bachiller', 'CIENCIAS', 'SABANETA TOVAR AP.0203', '0414-5879947', '0275-8734155', 'YONDER_911@HOTMAIL.COM', 'Activo', 'Servivida', 'Mocoties'),
(34, 17770047, 'Bo-0807', 'Distinguido', 'Jose Luis', 'Antolinez Rodriguez ', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR', 25, 6, 1985, 'Bachiller', 'CIENCIAS', 'CALLE PRINCIPAL  RIO NEGRO GUARAQUE', '0426-6719071', '0275-8730287', 'elias_030293@hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(35, 15756287, 'Bo-0384', 'Cabo/1ro', 'Daglis Javier', 'Añez Rondón', 1, 9, 2003, 'Venezolano', 'Masculino', 'TRUJILLO', 24, 6, 1983, 'Tecnico Medio', 'RESCATE', 'SAN JACINTO SECTOR EL CONCRITO CASA 0-38', '0414-7327435', '0274-2511307', 'djar_21@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(36, 16306967, 'Bo-1191', 'Bombero', 'Yamileth', 'Araque  Marquez', 1, 6, 2009, 'Venezolano', 'Femenino', 'EL VIGIA', 12, 6, 1983, 'Bachiller', 'CIENCIAS', 'EL VIGIA URB PAEZ', '4147293803', '0275-8820112', 'labebecita1012@hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(37, 19421700, 'Bo-0808', 'Distinguido', 'Anngy Rossire', 'Araque Araque  ', 1, 1, 2008, 'Venezolano', 'Femenino', 'Merida', 26, 12, 1989, 'Tecnico Medio', 'MEDICINA EMERGENCIA', 'CHAMITA CALLE LOS PINOS CASA 1', '4147393286', '2742665329', 'ann.g.y@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(38, 12350326, 'Bo-0703', 'Sgto/2do', 'Yulman Enrique', 'Araque Mora ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 28, 8, 1976, 'Tecnico Medio', 'MECANICA Y MANTENIMIENTO', 'AV PULIDO MENDEZ SECTOR PIE DEL LLANO, CASA 2-6', '0426-8770694', '0274-2630963', 'araqueyulman@hotmail.es', 'Activo', 'Conductor', 'Metropolitana'),
(39, 13500263, 'Bo-0008', 'Sgto/Aydte', 'Rito José', 'Araujo Araujo ', 1, 2, 1999, 'Venezolano', 'Masculino', 'Merida', 19, 7, 1976, 'TSU ', 'CIENCIAS', 'BARRIO ANDRES ELOY BLANCO PASJE 1  LA ISLA', '4169755125', '0274-7894614', 'ritoaraujo@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(40, 18149612, 'Bo-0933', 'Bombero', 'Erwis', 'Araujo Rivas', 1, 1, 2009, 'Venezolano', 'Masculino', 'Caja Seca', 16, 10, 1988, 'Bachiller', 'Ciencias', 'Sector el cerro vía Palmira', '0426-4721453', '0271-4325260', 'erwishaloon@.com', 'Activo', 'Incendio', 'Panamericana'),
(41, 16664817, 'Bo-0940', 'Distinguido', 'Jose Alirio', 'Araujo Santiago', 1, 1, 2009, 'Venezolano', 'Masculino', 'Cacute', 22, 1, 1984, 'TSU ', 'MedicinaPre-hospitalaria', 'Cacute Municipio Rangel, Calle trasandina, casa c-30', '4263750309', '0275-9887531', 'jaas284@hotmail.com', 'Activo', 'Conductor', 'Paramo'),
(42, 17130216, 'Bo-0778', 'Cabo/2do', 'Ronny Jesús ', 'Araujo Sulbaran ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 26, 4, 1984, 'Tecnico Medio', 'RESCATE', 'Urb Los Curos El Entable Vda 5 Casa 13', '0426-6278812', '0274-2713710', 'rony_jas84@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(43, 19900153, 'Bo-0809', 'Distinguido', 'Ivonne Desiret', 'Arenas Guillen ', 1, 1, 2008, 'Venezolano', 'Femenino', 'CARACAS', 22, 10, 1988, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'LOS CUROS PARTE BAJA EL ENTABLE VEREDA 5  CASA 5', '4262716181', '0274-2663612', 'ennovi-221@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(44, 19503424, 'Bo-0912', 'Bombero', 'Jesús A.', 'Arreaza Jaimes ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 4, 2, 1990, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'El vigía barrio el Carmen calle 01casa 16/161', '4247535801', '0275/2681120', 'jesus_15arreaza@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(45, 19144173, 'Bo-0792', 'Distinguido', 'Luís Gustavo ', 'Avendaño  Rodriguez ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 28, 6, 1989, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'EL VALLE PARDO VERDE CASA 8', '4140770617', '0274-4171391', 'luis_21bom@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(46, 15620967, 'Bo-0934', 'Distinguido', 'Jesus Alexis', 'Avendaño Davila', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 12, 9, 1979, 'TSU', 'INFORMATICA', 'AGUAS CALIENTES EJIDO CASA 07', '0416-1368202', '0274-2663612', 'marlxiss@gmai', 'Activo', 'Incendio', 'Metropolitana'),
(47, 16741433, 'Bo-0572', 'Distinguido', 'José Ramiro', 'Avendaño Díaz  ', 1, 9, 2005, 'Venezolano', 'Masculino', 'EL VIGIA', 5, 5, 1984, 'Bachiller', 'CIENCIAS', 'LA BLANCA, CALLE 6 AV 5  CASA 5-28 EL VIGIA', '0416-3753145', '2758811450', 'ramirobom@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(48, 11953895, 'Bo-0238', 'Sgto/Aydte', 'Francisco José', 'Avendaño Trejo', 1, 4, 2001, 'Venezolano', 'Masculino', 'Merida', 10, 1, 1974, 'Tecnico Medio', 'RESCATE', 'Urb los Curos parte baja vereda 42 casa 04', '4247024832', '2742715637', 'fran_100174@hotmail.com ', 'Activo', 'Servivida', 'Metropolitana'),
(49, 11953896, 'Bo-0009', 'Sgto/1ro', 'José David', 'Avendaño Trejo', 1, 2, 1999, 'Venezolano', 'Masculino', 'Merida', 2, 4, 1975, 'Tecnico Medio', 'INCENDIO', 'LOS CUROS VEREDA 42 CASA 04', '4125161899', '2742715637', 'incendio30_@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(50, 18309011, 'Bo-0485', 'Cabo/1ro', 'Yuleinny Thamaira', 'Avila Contreras', 1, 9, 2004, 'Venezolano', 'Femenino', 'Merida', 28, 6, 1987, 'TSU ', 'Educacion Especial', 'Lagunillas Sector La Alegría baja calle 3B casa S/N', '0416-8741835', '', 'dayarimar@hotmail.com', 'Activo', '', 'Metropolitana'),
(51, 11462952, 'Bo-0010', 'Sgto/Aydte', 'Luís Carlos', 'Azocar Sánchez', 1, 3, 1996, 'Venezolano', 'Masculino', 'Merida', 18, 4, 1971, 'Tecnico Medio', 'INTEGRAL', 'RES. LOS BUCARES TORRE CPH1', '4164710375', '', 'luis_carlos_azocar@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(52, 20199826, 'Bo-1192', 'Distinguido', 'Genesis Nazareth', 'Balza Calderon', 1, 6, 2009, 'Venezolano', 'Femenino', 'Merida', 24, 9, 1991, 'Tecnico Medio', 'PREHOSPITALARIA', 'EJIDO SAN MIGUEL CASA 18 VEREDA 9', '0424-7703964', '0274-2218332', 'genesis_24_3@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(53, 12351053, 'Bo-0287', 'SubTeniente', 'Raúl Alí', 'Balza Sosa', 1, 3, 2002, 'Venezolano', 'Masculino', 'Merida', 15, 9, 1975, 'TSU ', 'EMERGENCIA PREHOSPITALARI', 'URB  CARABOBO VEREDA 33 CASA 03', '4162901417', '', '', 'Activo', 'Servivida', 'Panamericana'),
(54, 18209571, 'Bo-0935', 'Distinguido', 'Julio Cesar', 'Barilla Parra', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 17, 12, 1988, 'Tecnico Medio', 'FITOTECNIA', 'EL PEÑON TOVAR URB LA PRADERA CALLE 7 CON CARRERA 3 ', '4161398860', '0275-8670587', 'juliocbp@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(55, 16317723, 'Bo-0282', 'Sgto/Aydte', 'Jhon Mauro', 'Barillas', 1, 3, 2002, 'Venezolano', 'Masculino', 'TOVAR', 21, 3, 1982, 'Tecnico Medio', 'RESCATE', 'LAGUNILLAS AVENIDA BOLIVAR CASA 66-49 MUNICIPIO SUCRE MERIDA', '0414-7575642', '2758733312', 'jhon-fire-2009@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(56, 13542735, 'Bo-0386', 'Sgto/1ro', 'Wuilmer Augusto', 'Barillas  ', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 21, 4, 1976, 'Bachiller', 'COMERCIO ', 'EL PEÑON, CALLE 3 CASA S/n. TOVAR', '0424-7235703', '0275-4143700', 'WUILMER@HOTMAIL.COM', 'Activo', 'Conductor', 'Mocoties'),
(57, 18209570, 'Bo-0558', 'Cabo/1ro', 'Edwin Clizardo', 'Barillas Parra', 1, 2, 2005, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 26, 1, 1987, 'Tecnico Medio', 'Control y Extincion de In', 'Sector el Peñón Urb la Pradera casa n- 1-150', '4160482754', '0275-8731095', 'err997@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(58, 13542736, 'Bo-0385', 'Sgto/2do', 'Hildemaro José', 'Barillas Vergara', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 25, 10, 1977, 'Bachiller', 'CIENCIAS', 'CARRERA 1 4-73SECTOR EL ANIL TOVAR', '0426-6282731', '0275-8732141', 'hildelmaro_27@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(59, 15475006, 'Bo-0573', 'Sgto/1ro', 'Hildebrando', 'Barillas Vergara ', 1, 9, 2005, 'Venezolano', 'Masculino', 'SANTA CRUZ DE MORA ', 10, 5, 1980, 'Bachiller', 'CIENCIAS', 'EL PEÑON CALLE EL CAFETAL Casa S/n', '0426-2390875', '0275-4143700', 'hildebrando_l_barillas@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(60, 17323144, 'Bo-0704', 'Cabo/1ro', 'Yohnson Jesús', 'Barón Díaz   ', 1, 9, 2006, 'Venezolano', 'Masculino', 'TOVAR.edo.Merida', 22, 12, 1985, 'Tecnico Medio', '', 'El Vigía barrio la inmaculada bis Av. 15', '0424-7312455', '0275-2689023', 'yohnbardi16@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(61, 12353022, 'Bo-0546', 'SubTeniente', 'Orlando Avilio', 'Barreto Herrera', 1, 1, 2004, 'Venezolano', 'Masculino', 'Merida', 12, 1, 1976, 'TSU ', '', 'EJIDO PARQUE EL SALADO TORRE F APTO. 1-2', '4265708010', '', '', 'Activo', '', 'Metropolitana'),
(62, 18056597, 'Bo-0574', 'Distinguido', 'Yoel Ely', 'Barrios Atencio', 1, 9, 2005, 'Venezolano', 'Masculino', ' ZULIA', 11, 1, 1985, 'Bachiller', 'CIENCIAS', 'EL VIGIA CAÑO SECO II CAS 3', '4140825641', '0275-4155998', 'yoel1101@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(63, 14165262, 'Bo-0387', 'Sgto/Aydte', 'Arturo José', 'Barrios de la Rosa', 1, 9, 2003, 'Venezolano', 'Masculino', 'CARACAS', 17, 11, 1980, 'TSU ', '', 'URB. VILLA LIBERTAD TORRE N5D4', '0424-7151317', '0274-2453438', 'arjobarrios@yahoo.com', 'Activo', '', 'Metropolitana'),
(64, 19145681, 'Bo-0936', 'Distinguido', 'Jose Jesus ', 'Becerra Angulo', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 4, 11, 1986, 'Tecnico Medio', 'INFORMATICA', 'LOMA DE LOS MAITINES SECTOR LA ASUNCION CASA Nº117 Mérida', '0426-2716479', '0274-7900953', 'jesus04_1986@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(65, 18578770, 'Bo-0937', 'Bombero', 'Frank Jhonatan', 'Becerra Gonzalez', 1, 1, 2009, 'Venezolano', 'Masculino', 'CARACAS', 8, 4, 1988, 'Bachiller', 'CIENCIAS', 'TOVAR, BARRIO RAMONA SOTO, CALLE SIMON RODRIGUEZ, CASA 1-95', '4261197393', '2758730521', 'becrrafrank@hotmial.com', 'Activo', 'Incendio', 'Mocoties'),
(66, 13014267, 'Bo-0310', 'Cabo/1ro', 'Gregorio Ramón', 'Belandria Méndez', 1, 7, 2002, 'Venezolano', 'Masculino', 'SANTA CRUZ DE MORA', 30, 7, 1977, 'Bachiller', 'CIENCIAS', 'SANTA CRUZ MORA SECTOR SANTA ROSA SECTOR LOS BUCARES', '4267280279', '2752682608', 'gregoriob771@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(67, 16316655, 'Bo-0705', 'Cabo/2do', 'Ronald Richard', 'Belandria Rodríguez ', 1, 9, 2006, 'Venezolano', 'Masculino', 'TOVAR', 31, 3, 1982, 'Tecnico Medio', 'AGROPECUARIA', 'EL LLANO SEGUNDA CALLE LOS NARANJOS CASA 5-62 TOVAR', '4267707130', '2758733941', 'Ronaldbelandria82@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(68, 16521938, 'Bo-0812', 'Bombero', ' Vicmanuel', 'Blanco Chirino ', 1, 1, 2008, 'Venezolano', 'Masculino', 'FALCON', 25, 2, 1985, 'Tecnico Medio', 'INCENDIO', 'CALLE 18 AV17 CENTRO CASA S/N ', '0416-2755025', '0274-2446905', 'vicbla2513@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(69, 15753994, 'Bo-0311', 'Sgto/2do', 'José Leonardo', 'Borrero Rojas', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 4, 1, 1982, 'Tecnico Medio', 'MAQUINAS Y HERRAMIENTAS', 'URBANIZACION LOS CUROS PARTE MEDIA BLOQUE 13 APTO00-04', '0416-5028267', '0274-2713456', 'jleoborrero@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(70, 15074526, 'Bo-0813', 'Cabo/2do', 'Antonio Jose', 'Briceño Marquina ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 18, 3, 1978, 'Bachiller', 'CIENCIAS', 'AV MONSEÑOR CAHACON PÀN DE AZUCAR', '4147225053', '2742713052', 'zeus7216@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(71, 16656368, 'Bo-0232', 'Cabo/1ro', 'Hugo Ramón', 'Briceño Quintero ', 1, 4, 2001, 'Venezolano', 'Masculino', 'Merida', 9, 8, 1981, 'Bachiller', 'Integral', 'AV  PRICIPAL CHORRO DE MILLA CASA 2-41', '4247403666', '2742447497', 'hugo-briceno@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(72, 16317000, 'Bo-0706', 'Distinguido', 'Henrry Epifanio', 'Bustamante Ortega ', 1, 9, 2006, 'Venezolano', 'Masculino', 'TOVAR', 13, 3, 1982, 'Bachiller', 'Ciencias', 'TOVAR Barrio Monseñor Moreno Calle 2 casa Nª 9', '0416-4534597', '0275-8732715', 'bustamantechipi82@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(73, 16742067, 'Bo-0575', 'Cabo/2do', 'William', 'Bustos Rivas ', 1, 9, 2005, 'Venezolano', 'Masculino', 'EL VIGIA', 22, 7, 1985, 'Bachiller', 'CIENCIAS', 'EL VIGIA BUBUQUI III, BLOQUE 07, PISO 2 APTO. 02-30 ', '4140819652', '0275-8819647', 'viejorichar1@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(74, 16305014, 'Bo-0707', 'Distinguido', 'Eder Omar', 'Calderón Jerez ', 1, 9, 2006, 'Venezolano', 'Masculino', 'EL VIGIA', 16, 6, 1982, 'Bachiller', 'CIENCIAS', 'EL VIGIA PARAISO , CALLE 4 CASA Nº 2-56 ', '4247620935', '4247620935', 'eoca_@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(75, 18798642, 'Bo-0938', 'Distinguido', 'Kevin Neomar', 'Calderon Rincon', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 19, 5, 1987, 'Bachiller', 'CIENCIAS', 'LOS CUROS, PARTE MEDIA BLOQUE 21 APTO. 02-01 Mérida', '4140801693', '0274-2715057', 'kevin_rincon@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(76, 14916046, 'Bo-0313', 'Teniente', 'Yaneth Carolina', 'Calderón Rondón', 1, 7, 2002, 'Venezolano', 'Femenino', 'Merida', 2, 8, 1980, 'Abogado', 'ESPECIALISTA DERECHO A  D', 'URB. PINTO SALINAS , SANTA JUANA PISO III, APTO. 03-02 ', '4265506281', '2742621608', 'abocarol@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(77, 17664643, 'Bo-0390', 'Cabo/2do', 'Josué David', 'Calderón Rondón', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 5, 12, 1986, 'Tecnico Medio', 'RESCATE', 'LOS CUROS  EL ENTABLE VEREDA 5 CASA 13', '', '2742713710', '', 'Activo', 'Rescate', 'Metropolitana'),
(78, 15921897, 'Bo-0576', 'Sgto/1ro', 'Maria Virginia', 'Calderón Rondón ', 1, 9, 2005, 'Venezolano', 'Femenino', 'Merida', 3, 10, 1981, 'Bachiller', 'CIENCIAS', 'LOS CUROS  EL ENTABLE VEREDA 5 CASA 13', '4266928044', '2742713710', 'marivi.c@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(79, 16656163, 'Bo-0391', 'Sgto/2do', 'Jesús Alberto', 'Calles Valero', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 20, 6, 1983, 'Bachiller', 'CIENCIAS', 'Urbanización Carabobo', '0424-7098615', '0274-2665904', 'foxtro_eco@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(80, 12346908, 'Bo-0226', 'Capitan', 'Carlos José', 'Camacho Camargo', 1, 4, 2001, 'Venezolano', 'Masculino', 'Merida', 30, 7, 1974, 'Licenciado', 'RECURSOS HUMANOS', 'URB. PINTO SALINAS , SANTA JUANA PISO III, APTO. 03-02 ', '4166020392', '2742621608', 'camacho200230@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(81, 17239844, 'Bo-0314', 'Sgto/2do', 'Juan Carlos', 'Camacho Carrizo', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 25, 1, 1984, 'Bachiller', 'CIENCIAS ', 'Urb. J.J Osuna Rodríguez, vereda 26 parte media, casa 02', '0416-0724352', '2742710495', 'juancabombero@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(82, 16445950, 'Bo-0577', 'Distinguido', 'Júnior de Jesús', 'Camacho Guillen', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 7, 2, 1983, 'Tecnico Medio', 'MAQUINAS  Y HERRAMIENTAS', 'AV.8, ERNTRE CALLES 17 Y 18 CASA Nº17-46 Mérida', '4248481575', '', 'jjochamac@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(83, 17341915, 'Bo-0939', 'Bombero', 'Gregori Alejandro', 'Camacho Gullien', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 7, 10, 1986, 'Tecnico Medio', 'MAQUINAS Y HERRAMIENTAS', 'EL VALLE SECTOR EL ARADO B VALLE PRINCIPAL CASA  SIN NUMERO', '4267730575', '', 'caballo136@hotmail.com', 'Activo', 'Rescate', 'Paramo'),
(84, 11912485, 'Bo-0012', 'Sgto/Aydte', 'Clever Albeiro', 'Camacho Rondon', 1, 1, 2000, 'Venezolano', 'Masculino', 'EL VIGIA', 6, 4, 1972, 'Bachiller', 'CIENCIAS', 'CAÑO SECO II CALLE 7 CASA 34 EL VIGIA', '0424-7228103', '0275-8815439', 'yuyocamachin@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(85, 17238248, 'Bo-0578', 'Cabo/1ro', 'Jerson Alejandro', 'Camacho Vielma ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 3, 1, 1985, 'Bachiller', 'CIENCIAS', 'los curos parte baja vda 17 casa 5', '0426-8037321', '0274-5118392', 'elpran_431@hotmail.com', 'Activo', '', 'Metropolitana'),
(86, 13524176, 'Bo-0316', 'Sgto/1ro', 'Darglin Gregorio', 'Campos Dugarte', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 20, 6, 1978, 'Bachiller', 'CIENCIAS', 'LOS SAUZALES VEREDA 6 CASA 5 Mérida', '4162765349', '0274-5118392', 'darglincampos@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(87, 19901042, 'Bo-0966', 'Bombero', 'Luis Eduardo', 'Cañas Ramirez', 1, 1, 2009, 'Venezolano', 'Masculino', 'EL VIGIA', 28, 8, 1988, 'Bachiller', 'CIENCIAS', 'BARRIO 19 DE FEBRERO CALLE PRINCIPAL, CASA Nº4-221 EL VIGIA', '4247450101', '2758815130', 'luiseduardo_0905@hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(88, 12800456, 'Bo-0157', 'Sgto/Aydte', 'Nelson Enrrique', 'Cárdenas Guerrero', 1, 1, 2000, 'Venezolano', 'Masculino', 'TOVAR', 24, 9, 1977, 'Bachiller', 'CIENCIAS', 'SECTOR BRISAS DEL MOCOTIES CASA 33-36', '4268030483', '', '', 'Activo', 'Rescate', 'Mocoties'),
(89, 14589898, 'Bo-0779', 'Cabo/1ro', 'Devora', 'Carmona Gonzalez ', 1, 2, 2007, 'Venezolano', 'Femenino', 'Merida', 12, 2, 1980, 'TSU ', 'ADMINISTRACION', 'la pedregosa alta calle la morita casa 05', '4147853216', '0274-2666812', 'devoradario@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(90, 17028290, 'Bo-0710', 'Distinguido', 'Deinys Jesús', 'Carreño Toloza ', 1, 9, 2006, 'Venezolano', 'Masculino', 'VALERA', 9, 5, 1985, 'Bachiller', 'CIENCIAS', 'Tucani sector zona nueva', '0414-7468931', '0275-4441602', 'djrenzisanchez@gmail.com', 'Activo', 'Incendio', 'Panamericana'),
(91, 16908672, 'Bo-0581', 'Cabo/1ro', 'Cristian Jordan', 'Carrero Zambrano', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR', 27, 5, 1984, 'Tecnico Medio', 'INFORMATICA', 'TOVAR MONSEÑOR MORENO CASA N 20 VEREDA 13', '0416/2744671', '0275/8730076', 'cristian-yoli@htomail.com', 'Activo', 'Incendio', 'Mocoties'),
(92, 16907249, 'Bo-1193', 'Distinguido', 'Yimmy Yunior', 'Carrero Araque', 1, 6, 2009, 'Venezolano', 'Masculino', 'TOVAR', 26, 4, 1984, 'Bachiller', 'HUMANIDADES', 'AV PULIDO MENDEZ SANTA JUANA CASA 1-34', '0416-7725777', '0274-66573329', 'yimmy92@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(93, 17770789, 'Bo-0708', 'Cabo/2do', 'Héctor Jesús', 'Carrero Azuaje ', 1, 9, 2006, 'Venezolano', 'Masculino', 'TOVAR', 3, 2, 1986, 'Bachiller', 'CIENCIAS', 'TOVAR, sector el Corozo carrera 12 casa s/n', '4169717890', '2752050271', 'hectorcarreroj@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(94, 20828213, 'Bo-1194', 'Distinguido', 'Genesis Milangi', 'Carrero Chacon', 1, 6, 2009, 'Venezolano', 'Femenino', 'Merida', 1, 6, 1991, 'Tecnico Medio', 'PREHOSPITALARIA', 'MILLA AV 5 ENTRE CALLE 15 Y 16 CASA 15', '4127731167', '2742217859', 'g_milangi@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(95, 16908982, 'Bo-0709', 'Cabo/2do', 'Freddy Alexander', 'Carrero Contreras ', 1, 9, 2006, 'Venezolano', 'Masculino', 'SANTA CRUZ DE MORA', 9, 2, 1983, 'Bachiller', 'CIENCIAS', 'SANTA CRUZ DE MORA SECTOR EL CALVARIO, CALLE PRINCIPAL CASA S/N ', '4163722918', '0275-8670342', 'freddycarrero83@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(96, 14400027, 'Bo-0392', 'Cabo/2do', 'Luciano', 'Carrero Duarte', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 23, 12, 1979, 'Bachiller', 'CIENCIAS', 'URB SANTA JUANA V B3 CASA 50 QUINTA CARRERO', '4263727918', '2742636016', 'lucianocarreroduarte@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(97, 11911842, 'Bo-0543', 'Sgto/2do', 'José Domingo', 'Carrero Fernández', 1, 1, 2005, 'Venezolano', 'Masculino', 'el vigia', 19, 9, 1970, 'Tecnico Medio', 'ADMINISTRACION POLICIAL', 'caño seco I sector alta vista casa 52', '', '0275-8825894', 'y.e.r.s@hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(98, 10107205, 'Bo-0580', 'Sgto/2do', 'Ildemaro', 'Carrero Villamizar', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 6, 4, 1971, 'Bachiller', 'HUMANIDADES', 'urb. Carabobo vereda 51 casa 02', '0416-1195335', '0274-2665343', 'verticalbikeylde@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(99, 16908189, 'Bo-0941', 'Distinguido', 'Dayana del Valle', 'Carrero Zambrano', 1, 1, 2009, 'Venezolano', 'Femenino', 'TOVAR', 28, 12, 1985, 'Bachiller', 'CIENCIAS', 'FRAN JUAN RAMOS DE LORA CASA 45', '4149749130', '0275-8730076', 'dayanita_420@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(100, 18309200, 'Bo-0488', 'Cabo/1ro', 'Richard Esmir', 'Carrillo Villarreal', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 9, 12, 1986, 'Tecnico Medio', 'RESCATE', 'LOS CHORROS DE MILLA PASAJE 8 CASA 27', '4147342409', '0274-2440429', 'richi_ecv@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(101, 16200343, 'Bo-0394', 'Sgto/Aydte', 'Betty Yulima', 'Castellano Valero', 1, 9, 2003, 'Venezolano', 'Femenino', 'Merida', 5, 10, 1983, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'EL CHAMA VIA SANTA CATALINA CALLE LOS AZULES CASA 0-26', '4162792426', '0274-5118334', 'yuli_2626@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(102, 20396281, 'Bo-0964', 'Cabo/2do', 'Martha del carmen', 'Castillo Mora', 1, 1, 2009, 'Venezolano', 'Femenino', 'TOVAR', 12, 6, 1990, 'Tecnico Medio', 'PREHOSPITALARIA', 'CALLE SANTA ANA CHACON, QUEBRADA ARRIBA A-02 TOVAR', '4264277587', '2754118369', 'marthacastillo102@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(103, 6462616, 'Bo-0254', 'Sgto/1ro', 'Víctor Manuel', 'Castillo Useche ', 1, 1, 2002, 'Venezolano', 'Masculino', 'CARACAS', 8, 1, 1963, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'Sector los Barzales vía mesa julia casa S/N adyacente al cementerio', '0412-9185127', '0275-4158028', 'bombero@cantv.net', 'Activo', 'Conductor', 'Panamericana'),
(104, 16656365, 'Bo-0582', 'Cabo/2do', 'Josmar Alberto', 'Castillo Quintero ', 1, 9, 2005, 'Venezolano', 'Masculino', 'MUCURUBA', 18, 3, 1983, 'Tecnico Medio', 'AGROPECUARIA', 'EL VALLE SECTOR MONTE REY CASA 10', '4268734059', '0274-2443759', 'josmar_21_83@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(105, 17239969, 'Bo-0793', 'Cabo/2do', 'Freddy  Orlando  ', 'Castro Becerra ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Mérida', 27, 10, 1984, 'Tecnico Medio', 'Mencion Bomberos', 'manzano bajo urbanización el paraíso casa  25', '0416-7746976', '', 'focb_84@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(106, 19894245, 'Bo-0942', 'Distinguido', 'Eladio Jose', 'Castro Suarez', 1, 1, 2009, 'Venezolano', 'Masculino', 'CARACAS', 13, 6, 1988, 'Bachiller', 'CIENCIAS', 'URB CARABOBO BARRIO JUSTO BRICEÑO SECTOR EL PEDREGAL 02 CASA S/N ', '0426-8287993', '2744146518', 'Marivi.c@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(107, 14255415, 'Bo-0480', 'Sgto/Aydte', 'Gerson José', 'Ceballos Contreras', 1, 3, 2004, 'Venezolano', 'Masculino', 'TOVAR', 17, 6, 1980, 'Bachiller', 'CIENCIAS', 'URB CARA BOBO CALLE PRINCIPAL CASA 19', '0416/9743495', '', 'gersonj80@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(108, 14022237, 'Bo-0234', 'SubTeniente', 'Jojhana', 'Centeno Gale ', 1, 4, 2001, 'Venezolano', 'Femenino', 'EL VIGIA', 6, 3, 1980, 'TSU', 'MEDICINA DE EMERGENCIA PR', 'URB. VILLA DE LOS ANGELES CALLE 1, CASANº27 EL VIGIA', '4247438725', '', 'jojhanacentenog@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(109, 15922618, 'Bo-0666', 'Cabo/1ro', 'Sandra Carolina', 'Cerrada', 1, 1, 2006, 'Venezolano', 'Femenino', 'Merida ', 8, 4, 1982, 'Licenciado', 'educacaion integral', 'Pedregosa alta 100mt abajo  la gran Parada casa 16-16', '0426-7758643', '0274-6359603', 'sacelinda1@yahoo.es', 'Activo', 'Incendio', 'Metropolitana'),
(110, 17663013, 'Bo-0583', 'Sgto/1ro', 'Henry David', 'Cerrada Pais', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 16, 6, 1986, 'TSU ', 'Emergencias Pre-hospitala', 'Pedregosa alta 100mt abajo  la gran Parada casa 16-16', '0414-7267426', '2742585844', 'bomhenry_16@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(111, 17322253, 'Bo-0943', 'Bombero', 'Edgar Alejandro', 'Cerrada Roa', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 23, 9, 1986, 'T.S.U.', 'Ciencias del Fuegop Segur', 'URB LA VEGA CALLE 2 CASA 77 TOVAR', '0426/2878530', '2758731943', 'edgarcerrada_2253@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(112, 15517017, 'Bo-0554', 'Cabo/2do', 'Ronald Leonardo', 'Cerrada Sosa', 1, 2, 2005, 'Venezolano', 'Masculino', 'Merida', 20, 9, 1980, 'TSU ', '', 'Avenida Humberto Tejera Casa 1-86', '0416-3700067', '0274-2636954', 'RonaldCerrada@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(113, 17130384, 'Bo-0944', 'Distinguido', 'Benilde', 'Cerrada Uzcatequi', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 10, 10, 1984, 'Bachiller', 'HUMANIDADES', 'LA  PEDREGOSA MEDIA RES SAAN ISIDRO CAS 5-05', '0416-1705527', '2742667325', 'jmcc_812_22@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(114, 17340322, 'Bo-0814', 'Cabo/2do', 'Xavier Amado', 'Chacin Manrique ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Mèrida', 17, 12, 1985, 'Tecnico Medio', 'Emergencias prehospitalar', 'La Pedregosa Media Res San Isidro Casa mis hijos', '0424-5717503', '0274-2662923', '', 'Activo', 'Rescate', 'Metropolitana'),
(115, 13283467, 'Bo-0395', 'Cabo/1ro', 'Franklin Alexander', 'Chacón Díaz', 1, 9, 2003, 'Venezolano', 'Masculino', 'Mèrida', 7, 3, 1978, 'TSU ', 'Administracion induistria', 'El vigía Edo Mérida', '0426-6273194', '0275-8829119', 'frankcha_13@live.com', 'Activo', '', 'Metropolitana'),
(116, 14623461, 'Bo-0815', 'Distinguido', 'Nesmar Enrique', 'Colmenares Ramírez', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 20, 1, 1979, 'Bachiller', 'Ciencias', 'Guaraquee Sector Cañotales vía principal casa S/N', '0426-9724521', '', '**********', 'Activo', '', 'Metropolitana'),
(117, 16317079, 'Bo-0318', 'Sgto/Aydte', 'Darwin Alexander', 'Contreras', 1, 7, 2002, 'Venezolano', 'Masculino', 'TOVAR', 6, 12, 1978, 'Bachiller', '', 'Sector Wilfrido Omaña Calle Andrés bello Nª 135', '0426-4200481', '0275-8732091', 'dalexcon@hotmail.com', 'Activo', '', 'Mocoties'),
(118, 14447041, 'Bo-0816', 'Distinguido', 'Yonsy Javier', 'Contreras ', 1, 1, 2008, 'Venezolano', 'Masculino', 'LA GUNILLA', 17, 10, 1979, 'BACHILLER', 'CINCIAS', 'SECTOR LOS ARAQUEZ CALLE PRINCIPAL ', '4161798915', '0274-5113004', 'yonsycontreras@hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(119, 12347289, 'Bo-0396', 'SubTeniente', 'Argenis de Jesús', 'Contreras Araque', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 16, 8, 1975, 'TSU', 'MANEJO DE EMERGENCIA', 'PUEBLO NUEVO DEL SUR CALLE PRINCIPAL SECTOR LA TRAVESIA ', '4247346083', '2747896365', 'argenisjcontrerasa@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(120, 17341158, 'Bo-0817', 'Bombero', 'Carolina Joama ', 'Contreras Camargo ', 1, 1, 2008, 'Venezolano', 'Femenino', 'Merida', 22, 1, 1986, 'Tecnico Medio', 'MANEJO DE EMERGENCIA', 'LOS CHORROS DE MILLA PASAJE EVA  MARIA CASA09', '4269299805', '2742445252', 'carolina01221@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(121, 18579786, 'Bo-0953', 'Distinguido', 'Yonnata', 'Contreras Contreras', 1, 1, 2009, 'Venezolano', 'Masculino', 'Mérida', 4, 1, 1988, 'Bachiller', 'CIENCIAS', 'CARRERA 3 SECTOR EL TOPON CASA 018 TOVAR', '4268744055', '0414-7007364', 'elbomberothecat23@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(122, 19592650, 'Bo-0974', 'Distinguido', 'Israel', 'Contreras Contreras', 1, 1, 2009, 'Venezolano', 'Masculino', 'CHACANTA', 20, 6, 1987, 'Tecnico Medio', 'CIENCIAS AGROPECUARIAS', 'SANTA CATALINA CHAMA Mérida CALLE LOS OBANDOS CASA 4-5', '0416-4512714', '2759950112', 'contrerasisrael@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(123, 14806304, 'Bo-0820', 'Distinguido', 'Jean Carlos', 'Contreras Guerrero', 1, 1, 2008, 'Venezolano', 'Masculino', '', 26, 4, 1981, 'Bachiller', 'ciencias', 'Calle Jáuregui casa Nº 4', '', '0274-2213576', 'jeancarloscontrerasguerrero@hotmail.com', 'Activo', '', 'Metropolitana'),
(124, 18308878, 'Bo-0819', 'Bombero', 'Richard J.', 'Contreras Mancilla ', 1, 1, 2008, 'Venezolano', 'Masculino', 'merida', 10, 9, 1986, 'Bachiller', '', '', '4264099014', '', 'rjcm_bomberman@hotmail.com', 'Activo', '', 'Metropolitana'),
(125, 18579885, 'Bo-0967', 'Bombero', 'Gregorio Jose', 'Contreras Marquez', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 7, 4, 1990, 'Tecnico Medio', 'RESCATE Y SALVMENTO', 'SAN JOSEALLE 4 LOS MOLINAS CASA 4-40', '0275-8733876', '', 'GREGOCONTRE415@HOTMAIL.COM', 'Activo', '', 'Metropolitana'),
(126, 14002889, 'Bo-0317', 'Sgto/2do', 'Edgar Yodani', 'Contreras Molina', 1, 7, 2002, 'Venezolano', 'Masculino', 'BARINAS', 10, 7, 1978, 'TSU', 'TECNOLOGIA BOMBERIL', 'AV LOS PROCERES PROLON AL LLANITO CASA 0-13', '4166280150', '2747893808', 'angelguardian-78@hotail.com', 'Activo', 'Rescate', 'Metropolitana'),
(127, 20395836, 'Bo-0945', 'Bombero', 'Jorge Leonardo', 'Contreras Rangel', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 11, 9, 1987, 'Bachiller', 'CIENCIAS', 'Santa Cruz Calle los Rosales', '0426-8992788', '', 'Melkier_leonardo@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(128, 18310818, 'Bo-0538', 'Cabo/1ro', 'Yinet Carolina', 'Contreras Rivas', 1, 9, 2004, 'Venezolano', 'Femenino', '', 16, 5, 1985, 'TSU ', '', '', '', '', '', 'Activo', 'Servivida', 'Metropolitana'),
(129, 18578138, 'Bo-0818', 'Distinguido', 'Kenni O.', 'Contreras Roa ', 1, 1, 2008, 'Venezolano', 'Masculino', ' TOVAR', 15, 8, 1988, 'Bachiller', 'CIENCIAS', 'CALLE SANTA ANA CHACON, QUEBRADA ARRIBA CASA S/N TOVAR', '4264880256', '2754118369', '', 'Activo', 'Incendio', 'Mocoties'),
(130, 8084671, 'Bo-0092', 'Teniente', 'Ramón Antonio', 'Contreras Rodriguez ', 1, 3, 1992, 'Venezolano', 'Masculino', 'TOVAR', 6, 12, 1966, 'TSU', 'Ciencias del Fuego seguri', 'URB EL VERDE CASA SIN NUMERO PARROQUIA GERONIMO MALDONADO LA PLAYA', '0416-4259764', '', 'ramonc6@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(131, 16908793, 'Bo-1195', 'Bombero', 'Ronald Javier', 'Contreras Rubio', 1, 6, 2009, 'Venezolano', 'Masculino', 'TOVAR', 18, 8, 1981, 'Bachiller', 'CIENCIAS', 'CALLE 29 DE JULIO, CASA 5 62 BRISAS DEL  MOCOTIES TOVAR, ', '4161180234', '', '', 'Activo', 'Servivida', 'Mocoties'),
(132, 16934225, 'Bo-0711', 'Cabo/1ro', 'María Luísana', 'Contreras Rueda ', 1, 9, 2006, 'Venezolano', 'Femenino', 'Merida', 26, 3, 1984, 'Bachiller', 'CIENCIAS', 'SAN JUAN DE LAGUNILLAS  CALLE EL LLANO CASA RURAL 10423', '4161731570', '', 'conmarlui@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(133, 18637421, 'Bo-0584', 'Distinguido', 'Alvis Antonio', 'Contreras Ruiz', 1, 9, 2005, 'Venezolano', 'Masculino', '', 1, 3, 1987, 'Bachiller', '', '', '4247139843', '', '', 'Activo', 'Servivida', 'Panamericana'),
(134, 14447636, 'Bo-0397', 'Cabo/2do', 'Ender José', 'Contreras Torres', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 20, 9, 1979, 'TSU ', 'Informatica', 'Sector Brisas de Mocoties calle 22 de Mayo casa n-17 TOVAR', '4168752085', '2758733224', 'ende_r@hotmail.es', 'Activo', 'Conductor', 'Mocoties'),
(135, 10903726, 'Bo-0398', 'Cabo/1ro', 'Gabriel Oswaldo', 'Contreras Torres', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 11, 6, 1974, 'Tecnico Medio', 'CONTABLIDAD', 'BARRIOS BRISAS DEL MOCOTIES, CALLE 2 DE MAYO CASA Nº17 TOVAR', '0416-0880315', '0275-9897413', 'goct11@yahoo.es', 'Activo', 'Conductor', 'Mocoties'),
(136, 17322223, 'Bo-0712', 'Sgto/2do', 'Willy Favian', 'Contreras Varela ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 13, 11, 1985, 'TSU ', 'Administracion de Recurso', 'Urb Buenos Aires Calle 7 casa 4-177', '0414-7162698', '', 'la_amenaza85@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(137, 15754751, 'Bo-0399', 'Cabo/1ro', 'Mayra Alejandra', 'Cordero de Ramírez', 1, 9, 2003, 'Venezolano', 'Femenino', 'Merida', 24, 12, 1982, 'TSU', 'EDUCACION ESPECIAL', 'chamita los bucares torre H apartamento 1-3', '0416-7021837', '2748083447', 'mayralejandracr24@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(138, 11851869, 'Bo-0144', 'Teniente', 'Zolienma Yamilitza', 'Cordero Mazea', 1, 1, 1995, 'Venezolano', 'Femenino', 'Acarigua', 22, 9, 1973, 'TSU ', 'publicidad', 'URB. LA PEDREGOSA PARTE MEDIA LA GRAN PARADA calle los ruices casa s/n', '4162772299', '', 'zolienmac@hotmail.com', 'Activo', '', 'Metropolitana'),
(139, 14027934, 'Bo-0319', 'Cabo/2do', 'Gerardo Eusebio', 'Cordoba Henriquez ', 1, 7, 2002, 'Venezolano', 'Masculino', 'Coro Edo Falcon', 19, 9, 1977, 'Bachiller', 'CIENCIAS', 'AV 16 PASAJE LA FLORIDA CASA 1-57', '', '0274-2631326', 'gerardocordoba@live.com', 'Activo', 'Conductor', 'Metropolitana'),
(140, 17142272, 'Bo-0947', 'Bombero', 'Antonio Jose', 'Coronado', 1, 1, 2009, 'Venezolano', 'Masculino', 'Caracas', 11, 2, 1985, 'Bachiller', 'CIENCIAS', 'Av principal los Chorros de Milla sector el Amparo casa s/n', '4121605960', '2747897396', 'antonicorona@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(141, 11956478, 'Bo-0993', 'Distinguido', 'Neli', 'Cristancho Montes', 1, 1, 2009, 'Venezolano', 'Femenino', 'MUCUCHACHI', 28, 4, 1974, 'T.S.U.', 'EMERGENCIA PREHOSPITALARI', 'SAN JACINTO SECTORE LA UNIDAD, CASA S/N', '', '2747891889', 'nelicristancho@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(142, 17895465, 'Bo-0713', 'Cabo/1ro', 'Ramón David', 'Cristancho Rojas ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 15, 5, 1986, 'Bachiller', 'CIENCIAS', 'URBANIZACION CARABOBO VEREDA 19 CASA 01', '', '2742665585', 'cristanchor@homail.com', 'Activo', 'Rescate', 'Metropolitana'),
(143, 16316971, 'Bo-0290', 'Sgto/2do', 'Luís Alberto', 'Cruces Fernández', 1, 3, 2002, 'Venezolano', 'Masculino', 'MIRANDA', 2, 7, 1983, 'Tecnico Medio', 'MENCION BOMBERO', 'EL PEÑON TOVAR, FINAL DE LA CALLE 3', '4147409789', '', 'luis_crucesf@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(144, 16605221, 'Bo-0822', 'Distinguido', 'Naida Yusmary', 'Cruces Fernandez ', 1, 1, 2008, 'Venezolano', 'Femenino', 'MIRANDA', 11, 12, 1984, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'FINAL DE LA CALLE 3 EL PEÑON TOVAR  ', '4265728076', '', '', 'Activo', 'Rescate', 'Mocoties'),
(145, 18208556, 'Bo-0823', 'Bombero', 'Yolimar', 'Cruces Zambrano ', 1, 1, 2008, 'Venezolano', 'Femenino', 'TOVAR', 24, 12, 1988, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'SABA NETA BICENTENARIO CALLE PRINCIPAL CASA  13-A TOVAR', '4169758608', '', 'yoli_cru69@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(146, 19144310, 'Bo-0913', 'Cabo/2do', 'Isaac', 'Cruz Ramirez ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 1, 2, 1990, 'Tecnico Medio', 'Menxion Rescate', 'Belén Calle 15 entre av 5 y 6 casa 5-20', '0416-7763597', '', 'isaaccruz_2011@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(147, 17436803, 'Bo-0714', 'Distinguido', ' Fredy Alberto', 'Cubillán', 1, 9, 2006, 'Venezolano', 'Masculino', 'caja seca', 2, 7, 1983, 'Bachiller', 'ciecias', 'Palmarito calle principal 100 metros antes de la plaza Palmarito casa s/n', '0424-7094717', '', 'cubillanfreddy@hot', 'Activo', 'Servivida', 'Panamericana'),
(148, 16443338, 'Bo-0556', 'Cabo/1ro', 'Valdomiro José', 'Cuevas Montilla', 1, 2, 2005, 'Venezolano', 'Masculino', 'Merida', 12, 6, 1983, 'Tecnico Medio', 'MAQUINAS Y HERRAMIENTAS', 'sector pie de loma SAN JACINTO CASA 13-2', '0426-4782353', '0274-4168113', 'tito21_4@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(149, 16444010, 'Bo-0821', 'Distinguido', 'Mario Alberto', 'Cuevas Toro ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 3, 7, 1982, 'Bachiller', '', 'CALLE ARSOVISPO CHACON CASA 13 MUCUCHIES ', '0416-2799492', '', '', 'Activo', '', 'Paramo'),
(150, 18045515, 'Bo-0824', 'Cabo/1ro', 'Erick Dionel', 'Davila ', 1, 1, 2008, 'Venezolano', 'Masculino', 'VALENCIA', 15, 5, 1986, 'Bachiller', 'CIENCIAS', 'RIO NEGRO , GUARAQUE LAS ADJUNTAS CASA S/N PUEBLO DEL SUR', '4161732964', '', 'EDIONEL_15@HOTMAIL.COM', 'Activo', 'Conductor', 'Mocoties'),
(151, 13230224, 'Bo-0400', 'Sgto/1ro', 'Yacobanny Albert', 'Dávila Barillas', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 28, 7, 1977, 'Bachiller', '', 'casa numero 4 TOVAR', '0426-6766728', '0275-8733312', 'yacovic@hotmail.com', 'Activo', '', 'Mocoties'),
(152, 19486522, 'Bo-0971', 'Bombero', 'George Rafael', 'Davila Carruyo', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 24, 1, 1988, 'Bachiller', 'CIENCIAS', 'URB  MONSEÑOR MORENO CASA 17 TOVAR', '0416-8146401', '0416-3787242', 'george.carruyo@hotmail.es', 'Activo', 'Servivida', 'Mocoties'),
(153, 16908187, 'Bo-0490', 'Distinguido', 'Xavier Yoroni', 'Dávila Carruyo', 1, 9, 2004, 'Venezolano', 'Masculino', 'TOVAR', 20, 1, 1984, 'Tecnico Medio', 'EMERGECIA PREHOSPITALARIA', 'TOVAR SECTOR MONSEÑOR MORENO CASA 17 VEREDA 13', '4166773429', '', '', 'Activo', 'Conductor', 'Mocoties'),
(154, 17455481, 'Bo-0950', 'Distinguido', 'Marcos Antonio', 'Davila Cerrada', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 22, 7, 1985, 'Tecnico Medio', 'MAQUINA HERRAMIENTAS ', 'PEDREGOSA MEDIA,100mt debajo de la gran parada frente a hacienda la Orqueta', '', '4263786012', '', 'Activo', 'Rescate', 'Metropolitana'),
(155, 14699151, 'Bo-0949', 'Cabo/2do', 'Jeeimy Carolina', 'Davila Cerrada', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 26, 9, 1980, 'Tecnico Medio', 'SECRETARIADO EJECUTIVO', 'PEDREGOSA MEDIA,100mt debajo de la gran parada frente a hacienda la Orqueta', '4247116350', '', 'sorjeeimy@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(156, 14106178, 'Bo-0491', 'Cabo/2do', 'Jury Antonio', 'Dávila Márquez', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 1, 1, 1979, 'Bachiller', '', 'urbanización el pilar ejido', '0426-7889158', '0274-2213104', 'Jad0179@hotmail.com', 'Activo', '', 'Metropolitana'),
(157, 18902050, 'Bo-0948', 'Bombero', 'Richard Jhonjaner', 'Davila Mendez', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 8, 1, 1989, 'Tecnico Medio', 'BOMBERO', 'CAÑO SECO II, CALLE 2 CASA Nº27 EL VIGIA', '4266299295', '', 'tu_papi_15_7@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(158, 16851179, 'Bo-0715', 'Sgto/2do', 'Wilmer Alexander', 'Dávila Peña ', 1, 9, 2006, 'Venezolano', 'Masculino', 'caracas', 9, 10, 1985, 'Bachiller', '', 'el chamita calle tamanaco pasaje guacaipuro casa 1-65', '0414-9757448', '0274-7903074', 'dav_wilale@hotmail.com', 'Activo', '', 'Metropolitana'),
(159, 11952970, 'Bo-0585', 'Sgto/1ro', 'Freddys Bladimir', 'Dávila Rodríguez', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 5, 12, 1973, 'TSU ', '', 'EJIDO, CALLE JAUREGUI CASA NUMERO 4-E ', '0426-7763929', '0274-7903759', 'fbdr5@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(160, 18125387, 'Bo-0951', 'Distinguido', 'Carlos Alfredo', 'Davila Rondon', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 13, 9, 1988, 'Bachiller', 'CIENCIAS', 'LA MESA DE EJIDO AV BOLIVAR CAS 36', '4164715149', '2744147345', 'andrevera15@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(161, 20197761, 'Bo-1196', 'Distinguido', 'Julio Cesar', 'Davila Valecillos', 1, 6, 2009, 'Venezolano', 'Masculino', 'Merida', 29, 1, 1990, 'Tecnico Medio', 'RESCATE', 'URB DON LUIS CALLE 5 CASA 29 EJIDO', '4263292947', '', 'juliodavila91@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(162, 12349166, 'Bo-0158', 'SubTeniente', 'Jimmy Albeiro', 'Delgadillo Pineda', 1, 1, 2000, 'Venezolano', 'Masculino', 'Merida', 4, 3, 1974, 'Tecnico Medio', 'RESCATE', 'LA PEDREGOSA NORTE , CALLE NUEVA BOLIVIA CASA NUMERO 40', '4164724204', '0274-2664887', 'jimmyadp@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(163, 14588304, 'Bo-0401', 'Sgto/2do', 'Alejandra Susana', 'Delgadillo Pineda', 1, 9, 2003, 'Venezolano', 'Femenino', 'Merida', 12, 5, 1980, 'TSU ', 'administracion', 'LOS CUROS BLOQUE 8 APTO 01 -04', '0274-2711219', '0416-1329759', 'alejandradebautista@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(164, 15756060, 'Bo-0586', 'Sgto/2do', 'Argenis', 'Delgadillo Pineda ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 21, 6, 1981, 'Bachiller', 'CIENCIAS', 'URB. CARABOBO VERDA 34 CASA N/3 Mérida', '4160466998', '', 'rastafarixtreme@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(165, 20435423, 'Bo-1197', 'Bombero', 'Erwin Andys Neily', 'Delgadillo Rangel', 1, 6, 2009, 'Venezolano', 'Masculino', 'CIUDAD BOLIVAR', 3, 8, 1990, 'Tecnico Medio', 'OPERACIONES CONTRA INCEND', 'B. CARABOBO PARTE BAJA VDA 34, CASA Nº14 Mérida', '4266038121', '', 'hervido.pollo@hotmail.com', 'Activo', 'Servivida', 'Metropolitana');
INSERT INTO `bombero` (`1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `17`, `18`, `19`, `20`, `21`, `22`, `23`, `24`) VALUES
(166, 20217536, 'Bo-1198', 'Bombero', 'Greibys Dayan', 'Delgado Pernia', 1, 6, 2009, 'Venezolano', 'Masculino', 'TOVAR', 16, 7, 1989, 'Bachiller', 'CIENCIAS', 'URB SANTA JUANA AV PULIDO MENDEZ', '4247661109', '2758731114', 'el_grebys_912@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(167, 18797303, 'Bo-0952', 'Cabo/2do', 'Yureidi Patricia', 'Diaz', 1, 5, 2009, 'Venezolano', 'Femenino', 'Merida', 19, 5, 1989, 'Tecnico Medio', 'COMERCIO Y SERVICIOS ADMI', 'SAN JACINTO CALLE PRINCIPAL METROS ARRIBA GRANJAS INFANTILES CASA N* 20-16', '0426-1093276', '0274-7902799', 'yureidi_diaz19_05@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(168, 16655068, 'Bo-0492', 'Distinguido', 'Jean Carlos José', 'Díaz Albornoz', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida ', 19, 3, 1984, 'Tecnico Medio', 'PREHOSPITALARIA', 'SECTOR ARAPUEY CALLE  MESA ESPERANZA CASA SIN NUMERO ', '0416-4744413', '', '', 'Activo', 'Servivida', 'Panamericana'),
(169, 17455822, 'Bo-0588', 'Distinguido', 'Diana Carolina', 'Díaz Albornoz', 1, 9, 2005, 'Venezolano', 'Femenino', 'Merida', 15, 11, 1986, 'Tecnico Medio', 'CONTABILIDAD', 'EL LLANITO LA OTRA BANDA', '4265713336', '', '', 'Activo', 'Servivida', 'Metropolitana'),
(170, 16678351, 'Bo-0716', 'Cabo/2do', 'José Jackson', 'Díaz Gómez ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 2, 5, 1984, 'Bachiller', 'CIENCIAS', 'URB. BUENOS AIRES CASA 5-53 EL VIGIA', '4247309337', '2758814456', 'j.j.2405@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(171, 18618416, 'Bo-0589', 'Cabo/2do', 'Andrés Ali', 'Díaz Herrera', 1, 9, 2005, 'Venezolano', 'Masculino', '', 16, 12, 1986, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(172, 17663790, 'Bo-1199', 'Distinguido', 'Jose Antonio', 'Diaz Montilla', 1, 6, 2009, 'Venezolano', 'Masculino', 'Merida', 12, 11, 1984, 'Tecnico Medio', 'RESCATE', 'SAN JVIER DEL VALLE casa N° 6', '4264774211', '', 'josanton_12@hotmail com', 'Activo', 'Rescate', 'Metropolitana'),
(173, 17663789, 'Bo-1200', 'Bombero', 'Jesus Eduardo', 'Diaz Montilla', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 4, 4, 1986, 'Tecnico Medio', 'PREHOSPITALARIA', 'SAN JAVIER DEL VALLE, VIA PRINCIPAL CASA N6 Mérida', '4149722879', '', 'jeduard_212@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(174, 14400173, 'Bo-0013', 'Sgto/2do', 'Boris Eduardo', 'Díaz Rangel ', 1, 2, 1999, 'Venezolano', 'Masculino', 'Merida', 27, 2, 1979, 'Tecnico Medio', '', 'EJIDO MANZANO BAJO 1ERA TRANSVERSAL  VEREDA 1', '', '0274-2219546', 'firemanboris@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(175, 15755514, 'Bo-0825', 'Cabo/1ro', 'Nori Yelina', 'Diaz Sulbaran ', 1, 1, 2008, 'Venezolano', 'Femenino', 'Merida', 27, 1, 1984, 'TSU', 'INFORMATICA', 'SANTA JUANA URB LOS ANDES BLQ 22 APTO 01-04', '0426-2707166', '0274-2631730', 'yelina2784@gmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(176, 19487573, 'Bo-0955', 'Bombero', 'Lixbeidy   Paola', 'Duarte Moreno', 1, 1, 2009, 'Venezolano', 'Femenino', 'TOVAR', 24, 9, 1989, 'Bachiller', 'CIENCIAS', 'El Vigía, Sector la Vega', '4167740013', '', '', 'Activo', 'Servivida', 'Panamericana'),
(177, 16908883, 'Bo-0826', 'Distinguido', 'Jaime ', 'Duarte Ramirez', 1, 1, 2008, 'Venezolano', 'Masculino', 'SANTA CRUZ DE MORA', 11, 12, 1985, 'Bachiller', 'CIENCIAS', 'SANTA CRUZ DE MORA SECTOR SAN JOSE,SEGUNDA VEREDA,CASA S/N', '4269771216', '', 'jaimed69@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(178, 14588892, 'Bo-0717', 'Cabo/1ro', ' Ricardo José', 'Dufflart Nava', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 17, 1, 1981, 'TSU ', 'MERCADOLENCIA', 'ejido caicaguita', '0416-5707988', '', 'r_dufflart@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(179, 15922077, 'Bo-0720', 'Sgto/2do', 'Hidalgo Jesús', 'Dugarte ', 1, 9, 2006, 'Venezolano', 'Masculino', 'MERIDA', 13, 10, 1982, 'Bachiller', '', 'Los Curos Parte Baja Calle 4 casa 1', '0274-2715625', '', 'hidalgojdugarte@hotmail.com', 'Activo', '', 'Metropolitana'),
(180, 16657501, 'Bo-0718', 'Cabo/2do', 'Jerson Gregorio', 'Dugarte Carrillo ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 16, 2, 1985, 'Bachiller', 'ciencias', 'Los Curos, Parte Alta, Bloque 30, Apto 0201', '', '', 'jgdc22@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(181, 17896286, 'Bo-0780', 'Distinguido', ' Leonardo Antonio ', 'Dugarte Dávila', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 5, 11, 1987, 'Tecnico Medio', 'MENCION BOMBERO', 'SECTOR PANAMERICANA, CAMPO ALEGRE.', '0416-4718617', '0275-4153449', 'leo_duga_davi@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(182, 13099659, 'Bo-0590', 'Sgto/2do', 'Margiory', 'Dugarte Dugarte', 1, 9, 2005, 'Venezolano', 'Femenino', 'Merida', 22, 5, 1978, 'Licenciado', 'ADMINISTRACION', 'URB CARABOBO V 20 CASA 07', '0274-2637438', '0426-4155635', 'margiorydd@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(183, 18798576, 'Bo-0827', 'Bombero', 'Javier Arturo', 'Dugarte Escalona ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 26, 10, 1987, 'Bachiller', 'CIENCIAS', 'LOS CUROS PARTE MEDIA V3 CASA 13', '', '2742711709', 'angel_fired@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(184, 14400131, 'Bo-0668', 'Sgto/2do', 'Maria Carolina', 'Dugarte García', 1, 1, 2006, 'Venezolano', 'Femenino', 'Merida', 20, 6, 1979, 'Criminolgo', 'CRIMINOLOGA', 'BARRIO PUEBLO NUEVO calle 1 numero 1-21', '4165709887', '2742449574', 'macarodu@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(185, 16933763, 'Bo-0719', 'Cabo/1ro', 'Juan Francisco', 'Dugarte Guillén ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida ', 15, 4, 1984, 'Bachiller', 'Ciencias ', 'Barrio Campo de Oro Pasaje Dávila Casa 0-91', '0416-8707991', '2742632527', 'jeshiajulieth@hotmail.es', 'Activo', 'Rescate', 'Metropolitana'),
(186, 18123003, 'Bo-0591', 'Cabo/1ro', 'Yornan Gerardo', 'Dugarte Rivas ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 11, 1, 1986, 'Bachiller', '', 'la vega la don Luis ejido calle principal casa a/63', '0412/6677179', '2742215663', '', 'Activo', 'Rescate', 'Metropolitana'),
(187, 18798248, 'Bo-0828', 'Distinguido', 'Carmen D.', 'Duran Molina ', 1, 1, 2008, 'Venezolano', 'Femenino', 'Merida', 8, 6, 1987, 'Tecnico Medio', 'Insedio', 'El   chama Sector La Fría  Casa45-b', '', '0416-877-6890', 'Dairana_87@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(188, 19592004, 'Bo-0794', 'Distinguido', 'Jhovan Jesus ', 'Duran Rodriguez ', 1, 1, 2007, 'Venezolano', 'Masculino', 'LA AZULITA', 17, 7, 1988, 'Bachiller', 'CIENCIAS', 'Urb Carabobo V 43 CASA 0-21', '0416-7784751', '274-2665322', 'jesusduran170788@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(189, 19422297, 'Bo-1201', 'Bombero', 'Jonathan Miguel', 'Duran Villamizar', 1, 6, 2009, 'Venezolano', 'Masculino', 'Merida', 28, 12, 1990, 'Tecnico Medio', 'INCENDIO', 'URB CARABOBO V 43 CASA 3', '', '4164746330', '', 'Activo', 'Incendio', 'Metropolitana'),
(190, 19145745, 'Bo-1202', 'Distinguido', 'Glenderson Cristian', 'Echavarria Marquez', 1, 6, 2009, 'Venezolano', 'Masculino', 'Merida', 11, 5, 1989, 'Tecnico Medio', 'RESCATE', 'LOS CUROS PARTE ALTA, VRDA9 CASA N3 Mérida', '0426-4775660', '2742716412', 'glenderson_16@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(191, 12048214, 'Bo-0186', 'SubTeniente', 'Yojaxon Alfonso', 'Echeverría Barillas', 1, 6, 1993, 'Venezolano', 'Masculino', 'TOVAR', 11, 2, 1973, 'Bachiller', 'CIENCIAS', 'SABANETA, SANTA ELENA, CALLE PRINCIPAL.', '4168746041', '0416-8746041', '', 'Activo', 'Servivida', 'Mocoties'),
(192, 15075132, 'Bo-0592', 'Cabo/2do', 'Edwuin Joel', 'Echeverría Barillas', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR', 26, 11, 1978, 'Bachiller', 'CIENCIAS', 'VIA PRINSIPAL ALBERTO ADRIANI EL AMPARO TOVAR CASA 6-49', '', '4247097106', '', 'Activo', 'Conductor', 'Mocoties'),
(193, 16605762, 'Bo-0404', 'Cabo/2do', 'José Gregorio', 'Escalante Morales', 1, 9, 2003, 'Venezolano', 'Masculino', 'tovar', 5, 5, 1984, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(194, 14268812, 'Bo-0593', 'Sgto/1ro', 'Leymis Yojeni', 'Escalona Escalona', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 16, 2, 1981, 'Bachiller', 'CIENCIAS', 'los curos parte media vereda 27 cas nº 6', '0426-7260129', '0271-2711860', 'leyesk@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(195, 13967603, 'Bo-0406', 'Sgto/2do', 'Jhonny Alberto', 'Espinoza Balza', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 19, 11, 1978, 'Tecnico Medio', 'EMERGECIA PREHOSPITALARIA', 'los curos parte alta, bloque 37, edificio 2, apart 01-02', '', '', '', 'Activo', 'Servivida', 'Metropolitana'),
(196, 9473810, 'Bo-0292', 'Sgto/2do', 'Fray Alonso', 'Fernández Angulo', 1, 3, 2002, 'Venezolano', 'Masculino', 'Merida', 12, 8, 1968, 'Bachiller', 'CIENCIAS', 'campo de oro , pasaje Rómulo gallegos, casa 1-92', '0416-1777339', '0274-2637417', 'frayfernandez68@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(197, 20431157, 'Bo-0957', 'Cabo/2do', 'YHOAN Francisco', 'Fernandez Fernandez', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 7, 4, 1989, 'Tecnico Medio', ' CIENCIAS DEL FUEGO', 'av, los próceres urb. san José sector pie del tiro loma de la virgen parte ', '0426-2573457', '0414-7179674', 'ACLS_50@HOTMAIL.COM', 'Activo', 'Servivida', 'Metropolitana'),
(198, 14761119, 'Bo-0407', 'Cabo/2do', 'José Gregorio', 'Fernández López', 1, 9, 2003, 'Venezolano', 'Masculino', 'EL VIGIA', 10, 8, 1979, 'Bachiller', 'CIENCIAS', 'El vigía, urb. caño seco ii av. 3 casa ° 3', '0414-7577244', '', 'thejaguar_7@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(199, 15174828, 'Bo-0493', 'Cabo/1ro', 'Isbeida', 'Fernández Robain', 1, 9, 2004, 'Venezolano', 'Femenino', 'PETARE EDO. MIRANDA', 4, 12, 1979, 'Tecnico Medio', 'RESCATE', 'zumba la parroquia casa nº14', '4266022087', '', 'isbeidafr4@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(200, 18579331, 'Bo-0958', 'Distinguido', 'Emily Yusmania', 'Flores Moreno', 1, 1, 2009, 'Venezolano', 'Femenino', 'TOVAR', 26, 1, 1989, 'Bachiller', 'CIENCIAS', 'sector pueblo nuevo cale principal casa s-n santa cruz', '4264710487', '2759887570', 'emilyflore13@hotmail.comn', 'Activo', 'Rescate', 'Mocoties'),
(201, 15020055, 'Bo-0781', 'Cabo/1ro', 'Johnny Armando', 'Florez ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Caracas', 17, 7, 1980, 'TSU', 'Informatica', 'av motatan casa 1-9 Timotes Mérida', '0416-5028895', '0271-5543256', 'joharflo@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(202, 7895082, 'Bo-0159', 'Cabo/2do', 'José Benito', 'Galbán Peña', 1, 1, 2000, 'Venezolano', 'Masculino', 'San Barbara de Zulia', 13, 3, 1964, 'Bachiller', '', 'el vigía, urbanización Bubuqui ii bloque 5 apartamento 0354 tercer piso', '0416-7702697', '0275-8825800', '', 'Activo', 'Conductor', 'Panamericana'),
(203, 17912588, 'Bo-0980', 'Bombero', 'Dainire Yeraldin', 'Gale Zambrano', 1, 1, 2009, 'Venezolano', 'Femenino', 'guayabo estado zulia', 5, 10, 1984, 'Bachiller', 'ciencias', 'santa cruz de mora sector romero vía principal casa n3-07', '4161736849', '2759957056', 'dainire@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(204, 16664749, 'Bo-0721', 'Cabo/1ro', 'Frank Edilberto', 'Galue Oballes ', 1, 9, 2006, 'Venezolano', 'Masculino', '', 3, 5, 1984, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(205, 15921297, 'Bo-0722', 'Sgto/2do', 'José Daniel', 'Galviz Vásquez ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 27, 8, 1981, 'TSU', 'Informatica', 'Urb san miguel vereda 19 cas 7', '4267022325', '2742219503', 'danielgalviz_06@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(206, 12799845, 'Bo-0017', 'Sgto/Aydte', 'Ediht Marbella', 'García Carrero', 1, 3, 1996, 'Venezolano', 'Femenino', '', 21, 5, 1976, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(207, 17029929, 'Bo-0960', 'Distinguido', 'Renso Eloy', 'Garcia Pernia', 1, 1, 2009, 'Venezolano', 'Masculino', '', 2, 5, 1987, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(208, 16906753, 'Bo-0831', 'Distinguido', 'Juan Carlos', 'Garcia Ruiz ', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR', 9, 6, 1986, 'Bachiller', 'CIENCIAS', 'Tovar sector el añil carrera 3 casa 0-18 ', '4268035670', '', '', 'Activo', 'Servivida', 'Mocoties'),
(209, 18965914, 'Bo-0959', 'Cabo/2do', 'Emperatriz Adiela', 'Garcia Teran', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 26, 8, 1989, 'Tecnico Medio', 'RESCATE', 'ejido av Fernández peña calle Ayacucho', '', '', 'emperatriz_adiela_26@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(210, 16020747, 'Bo-0408', 'Sgto/2do', 'Yonny', 'García Vega', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 16, 1, 1984, 'Tecnico Medio', 'ADMINISTRACION DE SERVICI', 'Parroquia el amparo, calle principal.', '4262705794', '2753111740', 'www.yonny111@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(211, 15032203, 'Bo-0553', 'Cabo/1ro', 'Danys Gregory', 'Garnica Rojas', 1, 2, 2005, 'Venezolano', 'Masculino', 'Merida', 9, 5, 1980, 'Bachiller', 'INTEGRAL', 'los curos vereda 26 casa 10', '4147357347', '2742716012', 'elgomi_7@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(212, 17521535, 'Bo-0594', 'Bombero', 'Edgar Alexander', 'Gavidia Borrero ', 1, 9, 2005, 'Venezolano', 'Masculino', '', 23, 10, 1986, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(213, 19421928, 'Bo-0914', 'Bombero', 'Nelson Jose', 'Gavidia Rodriguez  ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 3, 3, 1988, 'Tecnico Medio', 'INCENDIO', 'Santa Ana norte bloque 4 apto 0003', '4264285868', '', 'nelsong12@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(214, 14400554, 'Bo-0145', 'Teniente', 'Franklin Alberto', 'Gavidia Tachau', 1, 8, 1998, 'Venezolano', 'Masculino', 'Merida', 15, 2, 1978, 'Licenciado', 'TECNOLOGIA BOMBERIL', 'ejido conjunto  res la campiña b casa 11', '4247381012', '', 'franklingavidia@yahoo.es', 'Activo', 'Incendio', 'Metropolitana'),
(215, 14771921, 'Bo-0409', 'Sgto/1ro', 'Ender José', 'Gil ', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 3, 12, 1981, 'Bachiller', 'CIENCIAS', 'Urbe las colinas calle Fátima casa 13-54', '0416-4594309', '', 'enderjose0312@htomail.com', 'Activo', 'Servivida', 'Mocoties'),
(216, 15517510, 'Bo-0829', 'Cabo/2do', 'Guillermo Antonio', 'Gil  Gil', 1, 1, 2008, 'Venezolano', 'Masculino', '', 20, 10, 1979, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(217, 15516186, 'Bo-0410', 'Cabo/1ro', 'Danny Romarc', 'Gil Ruiz', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 5, 2, 1980, 'Bachiller', 'Ciencias', 'ejido urb san miguel vda 4 n° 17', '4266747113', '', '', 'Activo', 'Incendio', 'Metropolitana'),
(218, 15516188, 'Bo-0595', 'Cabo/2do', 'Joed Marcel', 'Gil Ruiz', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 15, 12, 1980, 'Bachiller', 'Ciencias', 'ejido san miguel vereda 4 casa 17', '4266023115', '', '', 'Activo', 'Servivida', 'Metropolitana'),
(219, 15620220, 'Bo-0411', 'Cabo/1ro', 'Miguel Alonso', 'Giraldo Guillen', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 29, 10, 1980, 'Bachiller', 'Ciencias', 'residencias la Orqueta casa n° 0-42 calle principal', '0416-1702378', '0274-2668225', 'giraldo508@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(220, 20431064, 'Bo-0963', 'Distinguido', 'Dannys Antonio', 'Giraldo Mendez', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 23, 7, 1990, 'Tecnico Medio', 'PREHOSPITALARIA', 'el arenal sector Carlos Gainza pasaje labrador casa n 1-26', '0424-7352852', '0426-5756723', 'danni-s-17@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(221, 16680081, 'Bo-0596', 'Distinguido', 'Nelson Alirio', 'Godoy Romero ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 18, 2, 1985, 'Bachiller', 'Ciencias', 'Tucani sector los pinos calle principal casa nª 0-32', '5147274108', '0275-4449693', '', 'Activo', 'Servivida', 'Metropolitana'),
(222, 16306608, 'Bo-0723', 'Cabo/2do', 'Javier Antonio', 'Gómez Peña ', 1, 9, 2006, 'Venezolano', 'Masculino', 'EL VIGIA', 26, 3, 1982, 'Bachiller', 'CIENCIAS', 'el vigía sur América av. 03 nº 0-43', '0416-0749857', '', 'gomezjavier_82@hotmail.', 'Activo', 'Incendio', 'Panamericana'),
(223, 6237851, 'Bo-0249', 'Capitan', 'Jesús Samuel', 'Gómez Pérez', 1, 1, 2002, 'Venezolano', 'Masculino', 'Merida', 7, 5, 1967, 'Licenciado', 'LDCO ESP EDUC FISICA', 'av. las Américas res albarejas edf 2 apto 3-55', '4167745210', '4167745210', 'jesago55@hotmail.com', 'Activo', '', 'Metropolitana'),
(224, 10714423, 'Bo-0018', 'Sgto/Aydte', 'Edgardo José', 'Gómez Sosa', 1, 4, 1994, 'Venezolano', 'Masculino', 'MERIDA', 4, 4, 1971, 'TSU ', 'Ciencias del Fuego Rescat', 'urb los curos vereda 20  casa 3', '4247149113', '2742715168', 'fariman_1971@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(225, 16907207, 'Bo-0597', 'Cabo/2do', 'Jhon Alexander', 'Gómez Vega', 1, 9, 2005, 'Venezolano', 'Masculino', '', 4, 10, 1983, 'Bachiller', '', '', '4263774396', '', '', 'Activo', '', 'Metropolitana'),
(226, 18964200, 'Bo-0782', 'Cabo/2do', 'Christian Dayana ', 'Gonzales Guillen ', 1, 2, 2007, 'Venezolano', 'Femenino', 'Merida', 1, 12, 1989, 'Tecnico Medio', 'MEDICINA DE EMERGENCIA PR', 'Urb. Carlos Sánchez calle 7 casa 2-91', '4167735691', '', 'dayana_chris@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(227, 16605027, 'Bo-0320', 'Cabo/1ro', 'Ana Yenifer', 'González Cadenas', 1, 7, 2002, 'Venezolano', 'Femenino', 'MARACAIBO', 19, 11, 1982, 'Tecnico Medio', 'HOTELERIA Y TURISMO', 'el vigía sector los robles calle 3 casa n- 5', '4267792633', '2746581959', 'anitaprevencion@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(228, 12347641, 'Bo-0598', 'Cabo/2do', 'Jesús Albeiro', 'González Cadenas', 1, 9, 2005, 'Venezolano', 'Masculino', 'Chiguara/ Merida', 10, 9, 1975, 'Bachiller', 'ciencias', 'Chiguara, la otra banda casa s/n ', '0426-9344572', '', 'jesalgoca@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(229, 16020277, 'Bo-0805', 'Cabo/1ro', 'Deyvis  Johan', 'González Carrero', 1, 9, 2006, 'Venezolano', 'Masculino', 'BAILADORES', 20, 3, 1984, 'Bachiller', 'MERCANTIL', 'coliseo el llano, calle ali primera casa nº0-52 Tovar', '', '2758732818', 'deyviscarrero@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(230, 9403997, 'Bo-0599', 'Cabo/2do', 'Luís', 'González Castellanos', 1, 9, 2005, 'Venezolano', 'Masculino', 'Guanare', 26, 11, 1968, 'Bachiller', '', 'San Juan sector milla, casa N° 509', '0426-6796988', '0274-6575004', 'Johanincendio@hotmail.com', 'Activo', '', 'Metropolitana'),
(231, 6204757, 'Bo-0019', 'Sgto/2do', 'Luís Argenis', 'González Dugarte', 1, 3, 1996, 'Venezolano', 'Masculino', 'Caracas', 20, 6, 1966, 'Bachiller', '', 'Sector camellones, el valle.', '0416-4055470', '0274-6573239', '', 'Activo', '', 'metropolitana'),
(232, 15538339, 'Bo-0494', 'Cabo/1ro', ' José Ramón', 'González Medina', 1, 9, 2004, 'Venezolano', 'Masculino', 'UREÑA', 27, 10, 1982, 'Bachiller', 'CIENCIAS', 'Ureña EDO Táchira', '4247781024', '2767871104', 'monkr052@hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(233, 11460481, 'Bo-0208', 'Capitan', 'Engelberth Daniel', 'González Mendoza', 1, 1, 1993, 'Venezolano', 'Masculino', 'MARACAIBO', 29, 7, 1972, 'Tecnico Medio', 'EMERGENCIAS PREHOSPITALAR', 'ejido sector el moral petro casa vía principal', '4161710282', '4263252220', 'engelberth.gonzlez@gmail', 'Activo', 'Servivida', 'Metropolitana'),
(234, 8082658, 'Bo-0020', 'Sgto/Aydte', 'Milagros Josefina', 'González Montaya', 1, 2, 1999, 'Venezolano', 'Femenino', 'TOVAR', 3, 7, 1962, 'Bachiller', 'CIENCIAS', 'urbe santa Eduviges', '', '0275-8733579', 'milagrosg03@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(235, 13163751, 'Bo-0412', 'Sgto/1ro', 'Orlando Rafael', 'González Osorio', 1, 9, 2003, 'Venezolano', 'Masculino', 'SANTOME ESTADO ANZOATEGUI', 26, 3, 1977, 'Bachiller', 'CIENCIAS', 'Ejido, urb. el cañamelar sector c, casa nº15 Mérida', '', '0274-2210825', 'orlandorafaelgonzalez@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(236, 17523726, 'Bo-0830', 'Bombero', 'Manuel J', 'Gonzalez R. ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Mérida', 29, 9, 1984, 'Bachiller', 'Ciencias', 'san Juan de lagunillas, urb inrevi, calle 9,casa 260', '4247503400', '', 'johan1914@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(237, 11952898, 'Bo-0021', 'Cabo/1ro', 'Juan Luís', 'González Villarreal', 1, 2, 1999, 'Venezolano', 'Masculino', 'Merida', 31, 12, 1973, 'Bachiller', 'CIENCIAS', 'urb santa Ana blq 8  apto 03 -04', '4263701500', '2742447791', 'juang141@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(238, 8043095, 'Bo-1203', 'Cabo/1ro', 'Luis Felipe', 'Graterol Rodriguez', 1, 6, 2009, 'Venezolano', 'Masculino', 'VALERA', 15, 1, 1965, 'Bachiller', 'CIENCIAS', 'san Juan de lagunillas', '4149062033', '', '', 'Activo', 'Conductor', 'Metropolitana'),
(239, 16664203, 'Bo-0495', 'Cabo/2do', 'Jorge Luís', 'Guerrero Castillo', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 6, 8, 1984, 'Tecnico Medio', 'MENCION BOMBERO', 'vía bobures, las dolores, municipio sucre', '4262750732', '', '', 'Activo', 'Rescate', 'Metropolitana'),
(240, 14447161, 'Bo-0413', 'Sgto/2do', 'Reyes Noel', 'Guerrero Fernández', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 25, 9, 1977, 'Bachiller', 'CIENCIAS', 'Urb arboleda casa 11-4 Tovar', '', '2758733459', 'reyesguerrero_61@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(241, 13790856, 'Bo-0600', 'Sgto/2do', 'Degwhis Ramón', 'Guerrero González', 1, 9, 2005, 'Venezolano', 'Masculino', '', 30, 5, 1978, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Mocoties'),
(242, 14927722, 'Bo-0022', 'Cabo/1ro', 'Leonardo Antonio', 'Guerrero Herrera', 1, 3, 1999, 'Venezolano', 'Masculino', '', 17, 6, 1981, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(243, 16906414, 'Bo-0961', 'Bombero', 'Aldo Yovanny', 'Guerrero Marquez', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 4, 3, 1985, 'Bachiller', 'HUMANIDADES', 'quebrada arriba  calle Eduviges  morales casa 1 Tovar', '', '4164754787', '', 'Activo', 'Conductor', 'Mocoties'),
(244, 13649085, 'Bo-0601', 'Cabo/1ro', 'Carlos Gerardo', 'Guerrero Peña ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Mérida', 19, 9, 1978, 'Ingeniero', 'Forestal', 'los curos parte media bloque 14 apto 0004', '0416-1708005', '0274-2714093', 'odedio@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(245, 16444519, 'Bo-0603', 'Cabo/1ro', 'Marcos Alirio', 'Guerrero Rojas ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 8, 11, 1984, 'Bachiller', 'CIENCIAS', 'campo de oro  pasaje Miraflores  casa 0-167', '4147240728', '', 'marco_agr11@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(246, 18966272, 'Bo-0832', 'Bombero', 'Pedro José', 'Guerrero Vergel ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 10, 10, 1988, 'Tecnico Medio', 'RESCATE', 'av. los próceres 100 metros abajo entrada santa Anita ', '', '0274-7904725', 'jose_guerrero88@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(247, 12779912, 'Bo-0321', 'SubTeniente', 'José Alipio', 'Guerrero Vielma', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 10, 10, 1976, 'TSU', 'ADMINISTRACION', 'el chama vía santa catalina calle los azules casa 0-15', '4164796580', '2744156921', 'morochoxmen@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(248, 12779913, 'Bo-0322', 'Sgto/Aydte', 'Néstor Jose', 'Guerrero Vielma', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 10, 10, 1976, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'el chama vía santa catalina calle los azules casa 0-16', '0414-7584828', '2744156921', 'tigreguerrero21@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(249, 16201027, 'Bo-0496', 'Distinguido', 'David Antonio', 'Guerrini Sánchez', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 5, 4, 1983, 'Tecnico Medio', 'PREHOSPITALARIA', 'avenida 1 entre calles 11 y 12 edificio virgen del valle piso 4 apto.8 ', '4269261598', '', 'quibun2000@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(250, 13013662, 'Bo-0188', 'SubTeniente', 'Francisco J.', 'Guillén Ceballos', 1, 8, 1994, 'Venezolano', 'Masculino', 'TOVAR ', 12, 10, 1976, 'Tecnico Medio', 'RESCATE', 'Tovar calle 9 con carrera sexta numero 9-50', '4265114938', '4264196233', 'FCO_GUILLEN@HOTMAIL.COM', 'Activo', 'Rescate', 'Mocoties'),
(251, 17029617, 'Bo-0741', 'Bombero', 'Keiber Alberto', 'Guillén Domínguez ', 1, 9, 2006, 'Venezolano', 'Masculino', 'VIGIA', 14, 10, 1984, 'Bachiller', 'ciencias', 'el vigía urb bubuqui 4 aero puerto vereda 01 casa 12', '41659986013', '2758810639', 'kei_alber_25@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(252, 19144061, 'Bo-0962', 'Distinguido', 'Yecsika Esmeralda', 'Guillen Ibarra', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 11, 5, 1989, 'Bachiller', 'CIENCIAS', 'el chama, calle tamanaco pasaje don quijotes, casa nº2-39 Mérida', '4266786833', '', 'yecsi_5_7@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(253, 16443831, 'Bo-0685', 'Distinguido', 'José Enrique', 'Guillen Lobo ', 1, 1, 2006, 'Venezolano', 'Masculino', '', 24, 6, 1983, 'Tecnico Medio', '', 'av centenario sector los higuerones frente al brasero', '', '0274-2452579', 'jose_24guillen@hotmail.com', 'Activo', '', 'Mocoties'),
(254, 18208684, 'Bo-0605', 'Distinguido', 'Dilvert Eduardo', 'Guillen Márquez', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR', 14, 7, 1987, 'Tecnico Medio', 'CONSTRUCCION CIVIL', 'el peñón calle 3 casa s/n', '4268765080', '2758083980', '', 'Activo', 'Incendio', 'Mocoties'),
(255, 17771258, 'Bo-0833', 'Bombero', 'William Raul', 'Guillen Molina ', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 29, 9, 1987, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Mocoties'),
(256, 19047744, 'Bo-1204', 'Distinguido', 'Jennyfer Ediany', 'Guillen Montilva', 1, 6, 2009, 'Venezolano', 'Femenino', 'TOVAR', 4, 2, 1991, 'Tecnico Medio', 'PREHOSPITALARIA', 'final calle 9 sector la lagunita Tovar', '4167751917', '', 'jennyferedi@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(257, 17769973, 'Bo-0606', 'Cabo/2do', 'Víctor Alfonso', 'Guillen Pérez', 1, 9, 2005, 'Venezolano', 'Masculino', '', 7, 4, 1986, 'Tecnico Medio', 'INFORMATICA ', 'sector el peñón vía principal Tovar casa s/n ', '0424-1583420', '0275-4003434', 'alfonson24_@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(258, 14917687, 'Bo-0497', 'Cabo/1ro', 'Rufino Antonio', 'Guillen Rivas', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 9, 6, 1982, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'conjunto residencial centenario edificio 01 piso 01 apartamento 13', '4267721048', '2742216895', '', 'Activo', 'Servivida', 'Metropolitana'),
(259, 13649110, 'Bo-0414', 'Cabo/1ro', 'Osmel', 'Guillen Rodríguez', 1, 9, 2003, 'Venezolano', 'Masculino', '', 23, 6, 1979, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(260, 14588102, 'Bo-0552', 'Cabo/1ro', 'Helking', 'Guillén Rojas ', 1, 2, 2005, 'Venezolano', 'Masculino', 'Merida', 16, 6, 1981, 'Bachiller', 'Ciencias', 'urb. san miguel vda.2  casa-31 ejido', '0416-878-0762', '0274-2218297', 'helking03@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(261, 17769103, 'Bo-0834', 'Distinguido', 'Yunnier Jose', 'Gutierrez Carrero ', 1, 1, 2008, 'Venezolano', 'Masculino', 'ZEA', 8, 2, 1985, 'Tecnico Medio', 'AGROPECUARIA', 'Tovar sabaneta carrera 4 casa e-15', '4167926728', '', '', 'Activo', 'Conductor', 'Mocoties'),
(262, 17960116, 'Bo-1205', 'Bombero', 'Deivis Harol Alexander', 'Gutierrez Hernandez', 1, 6, 2009, 'Venezolano', 'Masculino', 'CARACAS', 18, 7, 1983, 'Bachiller', 'INTEGRAL', 'hoyada de milla, pasaje muñoz casa n1_21 Mérida', '4247725479', '', 'harolve18@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(263, 17341608, 'Bo-0969', 'Bombero', 'José gregorio', 'Gutierrez mendez', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 25, 7, 1987, 'Bachiller', 'CIENCIAS', 'urb padre duque calle 6 casa 19  ejido', '4161322791', '2742211104', 'gutierrez2878@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(264, 13577454, 'Bo-0835', 'Distinguido', 'Arley A.', 'Gutierrez Meza ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Mérida', 27, 2, 1978, 'Bachiller', 'Ciencias', 'san Juan de colon estado Táchira calle 03 entre carrera 7y8', '4265720095', '2772911710', 'arlyoska@hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(265, 10711185, 'Bo-0277', 'Sgto/Aydte', 'José Remigio', 'Gutiérrez Nava', 1, 3, 2002, 'Venezolano', 'Masculino', 'Merida', 11, 12, 1969, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'el arenal, resd Giandomenico puliti', '0416-5749816', '0274-6572529', 'universo3002@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(266, 12980468, 'Bo-0323', 'Sgto/Aydte', 'Mauro Manuel', 'Gutiérrez Pereira', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 10, 6, 1977, 'TSU', 'TURISMO', 'avenida las Américas sector el campito edificio serranía b piso8', '4146225935', '', 'maurogutierrez07@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(267, 11954601, 'Bo-0607', 'Cabo/1ro', 'Iván de Jesús', 'Gutiérrez Vargas ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 25, 11, 1973, 'Bachiller', 'CIENCIAS', 'campo de oro, pasaje Rómulo gallegos, casa 1-43', '4265701489', '', '', 'Activo', 'Servivida', 'Metropolitana'),
(268, 19486914, 'Bo-1000', 'Bombero', 'Mary Catherin', 'Gutierrez Zambrano', 1, 1, 2009, 'Venezolano', 'Femenino', 'TOVAR', 3, 1, 1990, 'Bachiller', 'ciencias ', 'ejido san miguel vda 11 casa 9', '0426-2043175', ' 0275-2694709', 'mary_gutierrez24@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(269, 8038599, 'Bo-0670', 'Sgto/2do', 'Teresita ', 'Gutiérrez Zambrano ', 1, 1, 2006, 'Venezolano', 'Femenino', 'Merida', 16, 2, 1966, 'Ingeniero', 'SISTEMAS', 'av 1 casa 17-61 milla', '0414-0810442', '2742512247', 'teresitagz@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(270, 18577624, 'Bo-1020', 'Bombero', 'Jefferson Alejandro', 'Guzman Gutierrez ', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 8, 1, 1988, 'Tecnico Medio', 'AGRITECNIA', 'carrera 4 casa 15-e Tovar', '4262170624', '', '', 'Activo', 'Rescate', 'Mocoties'),
(271, 18620870, 'Bo-0783', 'Cabo/2do', 'Ricardo Ali', 'Hernandez  Moreno ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 20, 7, 1986, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', ' chorros de milla pasaje 8 casa 0-03', '4262791715', '2742446220', 'ricardo_hm_8@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(272, 13826875, 'Bo-0415', 'Sgto/Aydte', 'Jovanny Javier', 'Hernández Araque', 1, 9, 2003, 'Venezolano', 'Masculino', 'CARACAS', 10, 12, 1978, 'Bachiller', 'ADMINISTRACION', 'caño seco II calle 3 casa 22 el vigía', '4265709472', '', 'jova_4736@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(273, 14131607, 'Bo-0416', 'Sgto/1ro', 'José Luís', 'Hernández Contreras', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 14, 7, 1979, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'los curos parte alta aparta 0202 bloque 48 ', '0416-6019683', '', 'pumajoseluis2009@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(274, 18056062, 'Bo-0743', 'Distinguido', 'David Tawary', 'Hernández Contreras ', 1, 9, 2006, 'Venezolano', 'Masculino', 'ZULIA', 22, 4, 1986, 'Bachiller', 'CIENCIAS', 'caño seco IIcalle 3 casa 22 el vigía', '4145310881', '', 'tawary_187@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(275, 17771505, 'Bo-0744', 'Distinguido', 'Jairo Alberto', 'Hernández Contreras ', 1, 9, 2006, 'Venezolano', 'Masculino', '', 3, 1, 1986, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Mocoties'),
(276, 11217863, 'Bo-0077', 'Sgto/1ro', 'Eudo Alonso', 'Hernández Dugarte', 1, 6, 1999, 'Venezolano', 'Masculino', '', 5, 11, 1973, 'Licenciado', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(277, 16934723, 'Bo-0564', 'Cabo/2do', 'Vicqui Marieliqui', 'Hernández Dugarte', 1, 2, 2005, 'Venezolano', 'Femenino', 'Merida', 1, 6, 1986, 'Licenciado', 'educacion', ' av. los próceres santa Anita calle principal casa 2-23', '', '', 'vicquita@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(278, 14588692, 'Bo-0417', 'Sgto/2do', 'Pedro Antonio', 'Hernández Fernández', 1, 9, 2003, 'Venezolano', 'Masculino', 'CARACAS', 17, 6, 1981, 'Tecnico Medio', 'MAQUINAS Y HERRAMIENTAS', 'campo de oro res tulio chiossone edf 3 torre apto 3-11', '0414-7466372', '2742621076', 'adante20006@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(279, 17523981, 'Bo-0418', 'Sgto/2do', 'Ricardo Antonio', 'Hernández Guerrero', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida ', 26, 1, 1984, 'Tecnico Medio', 'RESCATE', 'el arenal via la joya casa s/n', '4126459725', '2742441430', 'rikr0418@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(280, 14805597, 'Bo-0160', 'Sgto/Aydte', 'José Gregorio', 'Hernández Hernández', 1, 1, 2000, 'Venezolano', 'Masculino', 'Merida', 26, 11, 1981, 'Licenciado', 'EMERGENCIA PREHOSPITALARI', 'urb Carabobo v17 casa 16', '4162729865', ',', 'j.h27@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(281, 17598392, 'Bo-0965', 'Bombero', 'Jesus Abdon', 'Hernandez Maldonado', 1, 1, 2009, 'Venezolano', 'Masculino', 'SABA MENDOZA', 4, 9, 1984, 'BACHILLER', 'CIENCIAS', 'el cerro via Palmira Arapuey ´´´´´´´´´´´´´´´´', '0426-6755903', '', '', 'Activo', 'Rescate', 'Panamericana'),
(282, 17794222, 'Bo-0498', 'Sgto/2do', 'Richard Daniel', 'Hernández Parra', 1, 9, 2004, 'Venezolano', 'Masculino', 'EL VIGIA', 2, 4, 1986, 'Tecnico Medio', 'RESCATE', 'bubuqui 6  calle 4 casa 1 el vigía', '4266794287', '2754000790', 'richarbox55@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(283, 18125902, 'Bo-0745', 'Distinguido', 'Máximo Jesús', 'Hernández Pérez ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 21, 12, 1985, 'Bachiller', 'CIENCIAS', 'ejido urb padre duque', '4265518611', '', 'max_2114@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(284, 10711372, 'Bo-0419', 'Sgto/2do', 'Aldrin Orlando', 'Hernández Ramírez', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 22, 3, 1972, 'Abogado', 'ABOGADO', 'urb. santa Mónica bloque 2, edif 1 apto 01-02', '0424-8475383', '0274-2638433', 'aldrin_orlando@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(285, 20142408, 'Bo-1206', 'Cabo/2do', 'Ana Carolina', 'Hernandez Rivas', 1, 6, 2009, 'Venezolano', 'Femenino', 'EL VIGIA', 14, 3, 1989, 'Bachiller', 'CIENCIAS', 'El vigía calle 6 casa 14', '0424-7556771', '', '*****', 'Activo', 'Rescate', 'Panamericana'),
(286, 17340827, 'Bo-1207', 'Cabo/2do', 'Mauro Liborio', 'Hernandez Romero', 1, 6, 2009, 'Venezolano', 'Masculino', 'Merida', 17, 11, 1988, 'Tecnico Medio', 'RESCATE', 'los curos el entable casa n- 04 vereda 21', '4147452164', '2742714923', 'liborioromero@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(287, 12779475, 'Bo-0837', 'Distinguido', 'Luis Gerardo', 'Hernandez Santiago', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 21, 2, 1975, 'Bachiller', 'CIENCIAS', 'ejido sector bella vista calle Lara 105', '0426-5712805', '', 'gerardohernandez75@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(288, 8709329, 'Bo-0161', 'Sgto/2do', 'Antonio Ramón', 'Hernández Soto', 1, 1, 2000, 'Venezolano', 'Masculino', 'TOVAR', 3, 11, 1968, 'Bachiller', 'CIENCIAS', 'calle 29 de julio casa 29 el añil Tovar', '0426-4152626', '', '', 'Activo', 'Rescate', 'Mocoties'),
(289, 17522139, 'Bo-0742', 'Cabo/2do', 'Yohan Ernesto', 'Hernández Urbina ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 27, 4, 1985, 'Bachiller', 'Ciencias', 'caño  seco  2', '0414-738-5822', '', 'Socratess_2704@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(290, 13649546, 'Bo-0233', 'SubTeniente', 'Frangel Porfidio', 'Hernández Vera ', 1, 4, 2001, 'Venezolano', 'Masculino', 'Merida', 18, 8, 1977, 'Tecnico Medio', 'RESCATE', 'ejido urb. san miguel vereda 11 casa 09', '4262740673', '2742455094', 'frangel_91@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(291, 8711447, 'Bo-0023', 'Sgto/Aydte', 'José Benigno', 'Hernández Vergara', 1, 2, 1999, 'Venezolano', 'Masculino', 'SANTA CRUZ DE MORA', 28, 8, 1970, 'TSU ', ' CIENCIAS', 'barrio  brisas del mocoties call4 casa 4-4 Tovar', '4262743435', '', 'wildsiberiz_91@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(292, 15174838, 'Bo-0549', 'Cabo/1ro', 'Jesús Adrián', 'Herrera Gómez', 1, 1, 2005, 'Venezolano', 'Masculino', 'Merida', 9, 11, 1982, 'Tecnico Medio', 'Rescate', 'ejido barrio la vega calle bucaral casa 7-a', '4143741730', '2743173783', 'jadrianherrera@hotmail,com', 'Activo', 'Servivida', 'Metropolitana'),
(293, 4243581, 'Bo-1208', 'SubTeniente', 'Juan José', 'Herrera Paredes', 1, 6, 2009, 'Venezolano', 'Masculino', 'Guanare Portuguesa', 12, 6, 1951, 'Bachiller', 'Humanidades', 'los jardines de alto chama jardin1 casa nª 13', '', '0414-745277', '', 'Activo', 'Incendio', 'Metropolitana'),
(294, 17895156, 'Bo-0838', 'Cabo/1ro', 'Jhon G.', 'Hinestrosa Rangel ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Mèrida', 1, 10, 1986, 'Bachiller', '', 'la pedregosa alta sector los pandas casa 1-28', '0426-2717029', '0274-2666404', 'gabriel2197@hotmail.com', 'Activo', '', 'Metropolitana'),
(295, 16934423, 'Bo-0726', 'Cabo/2do', 'María Sileny', 'Ibarra Rondón ', 1, 9, 2006, 'Venezolano', 'Femenino', 'Merida', 1, 10, 1983, 'Bachiller', 'CIENCIAS', 'san buenaventura casa 03 ejido', '', '2742218084', '', 'Activo', 'Servivida', 'Metropolitana'),
(296, 17521998, 'Bo-0324', 'Sgto/Aydte', 'Julio César', 'Izarra Santos', 1, 7, 2002, 'Venezolano', 'Masculino', 'TACHIRA', 10, 11, 1984, 'TSU', 'DISEÑO GRAFICO', 'los curos parte baja  vereda 1 casa 3', '0426-3269268', '', 'julicersr@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(297, 18309568, 'Bo-0561', 'Cabo/1ro', 'Francisco Javier', 'Izarra Santos', 1, 2, 2005, 'Venezolano', 'Masculino', 'Merida', 25, 10, 1986, 'Tecnico Medio', 'RESCATE', 'san Jacinto rincón bajo calle los  mangos casa 4', '4247244781', '', 'toti_251086@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(298, 13282228, 'Bo-0420', 'Cabo/1ro', 'Darwin David', 'Jaimes González', 1, 9, 2003, 'Venezolano', 'Masculino', 'EL VIGIA', 30, 11, 1976, 'Bachiller', 'CIENCIAS', 'el vigía sector Mucujepe barrio Rómulo gallegos av 7  casa 05-24', '0426-3776402', '0274-9981371', 'DARWINJAIMEZ@HOTMAIL.COM', 'Activo', 'Incendio', 'Metropolitana'),
(299, 17769702, 'Bo-0608', 'Cabo/2do', 'Freddy  Enrique', 'Jaimes González', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida ', 5, 7, 1986, 'Bachiller', 'CIENCIAS ', 'ejido sector cauca guita calle principal casa numero 5', '0416-4773162', '', 'freddyjaimes86@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(300, 13608374, 'Bo-1209', 'Bombero', 'Roberth Nazareth', 'Jaimes Marquez', 1, 6, 2009, 'Venezolano', 'Masculino', 'CARACAS', 21, 6, 1978, 'Bachiller', 'CIENCIAS', 'calle los cedros, bella vista, casa n 030 ejido ', '4161389152', '', '', 'Activo', 'Conductor', 'Metropolitana'),
(301, 13146690, 'Bo-0746', 'Cabo/1ro', 'Kleiber Armando', 'Jaimes Urbina', 1, 9, 2006, 'Venezolano', 'Masculino', 'TACHIRA', 20, 3, 1977, 'TSU', 'ELECTRONICA INDUSTRIAL', 'barrio pueblo nuevo calle 1 casa 1-21', '4265705349', '2742449574', 'kleiber_jaimes@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(302, 16933072, 'Bo-0609', 'Cabo/1ro', 'Daniel Alejandro', 'Jerez Rojas', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 13, 6, 1984, 'Tecnico Medio', 'MAQUINA HERRAMIENTAS ', 'av 16 edificio Hernández apartamento 23 ', '4162789885', '', 'DANIELITRO1306 @HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(303, 15943041, 'Bo-0325', 'Cabo/1ro', 'Juan Carlos', 'Jiménez Chourio', 1, 7, 2002, 'Venezolano', 'Masculino', 'ZULIA', 18, 1, 1979, 'Abogado', 'CIENCIAS', 'final av 5 sector el silencio Arapuey', '4269283933', '', 'juanjimenez15@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(304, 16743289, 'Bo-0559', 'Cabo/1ro', 'Erik Willy', 'Karim Ballesteros', 1, 2, 2005, 'Venezolano', 'Masculino', 'EL VIGIA', 23, 4, 1986, 'Tecnico Medio', 'ENFERMERIA COMUNITARIA', 'sector unión calle 5 vereda 1 Tucani', '0426-2212882', '', 'erik_karim@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(305, 19145401, 'Bo-0698', 'Cabo/1ro', 'Arelis Katherine', 'Lacruz Contreras ', 1, 1, 2006, 'Venezolano', 'Femenino', 'Merida', 8, 7, 1988, 'Tecnico Medio', 'MENCION BOMBERO', 'ejido urb Carlos Sánchez calle 1 casa 8', '0426-7274191', '', '', 'Activo', 'Servivida', 'Metropolitana'),
(306, 16443320, 'Bo-1038', 'Distinguido', 'Henry Benedicto', 'Lacruz Sanchez', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 27, 8, 1979, 'Bachiller', 'Ciencias', 'av16 de septiembre pasaje upar casa 55-57', '0426-7293667', '2747900032', 'henrylacruz1@hotamil.com', 'Activo', 'Rescate', 'Metropolitana'),
(307, 15296048, 'Bo-0078', 'Sgto/Aydte', 'Carlos Enrique', 'Leal Montilla', 1, 1, 1999, 'Venezolano', 'Masculino', '', 17, 12, 1976, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(308, 17769382, 'Bo-0747', 'Distinguido', 'Jean Pierre', 'León García ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Colombia', 30, 8, 1984, 'Bachiller', 'Ciencias', 'santa cruz de mora, sector romero, calle 19 de abril, casa 4-20', '0426-3129474', '0275-8670560', '', 'Activo', 'Incendio', 'Mocoties'),
(309, 15754972, 'Bo-0326', 'Sgto/Aydte', 'José Isrrael', 'León Izarra', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 7, 9, 1983, 'Tecnico Medio', 'RESCATE', 'urb  Carabobo calle 1 casa 39', '0424-7746023', '2742665523', 'LEONJOSEI@GMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(310, 20435410, 'Bo-1025', 'Distinguido', 'Nilba de la Trinidad', 'Lobo Albarran', 1, 1, 2009, 'Venezolano', 'Femenino', 'aricagua', 1, 4, 1990, 'TSU ', '', 'el molino  calle el milagro casa numero 14', '0416-5763755', '', 'nilbaj16@hotmail.com ', 'Activo', 'Rescate', 'Metropolitana'),
(311, 16655699, 'Bo-0968', 'Distinguido', 'Russell Brian', 'Lobo Guerrero', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 4, 3, 1984, 'Bachiller', 'CIENCIAS', 'chamita calle Coromoto casa 1-287', '0416-6697270-04', '2742665211', 'rusony@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(312, 16664601, 'Bo-0328', 'Sgto/Aydte', 'Enyer Alonso', 'Lobo Lacruz', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 5, 10, 1983, 'TSU', 'TECNOLOGIA BOMBERIL', 'los curos parte alta vereda 1 casa 11', '0416-1340704', '0426-9784497', 'rasta_en@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(313, 15755220, 'Bo-0327', 'Sgto/Aydte', 'Edwin Leonardo', 'Lobo Lacruz', 1, 7, 2002, 'Venezolano', 'Masculino', 'Mucuchies', 11, 3, 1982, 'TSU ', 'Manejo de Emergencia', 'los curos parte alta vereda 1 casa 11', '4266033608', '2742716607', 'edwinl33@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(314, 13098761, 'Bo-0025', 'SubTeniente', 'Pedro José', 'Lobo Lobo', 1, 2, 1999, 'Venezolano', 'Masculino', 'Merida', 3, 3, 1978, 'TSU ', 'CIENCIAS DELFUEGO', 'el chama sector la fría 31-3 vía principal', '4166730767', '4166730767', 'loboguego03@hotmail.com', 'Activo', '', 'Metropolitana'),
(315, 13577926, 'Bo-1210', 'Cabo/1ro', 'Atahis', 'Lobo Lobo', 1, 6, 2009, 'Venezolano', 'Femenino', 'MUCUCHIES', 22, 11, 1977, 'TSU', 'ADMINISTRACION', 'los curos parte alta vda 6 casa 3', '0414-5373172', '', 'amaliaa71@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(316, 12799612, 'Bo-0671', 'Sgto/2do', 'Mercedes Carolina ', 'Lobo Mora', 1, 1, 2006, 'Venezolano', 'Femenino', 'TOVAR', 6, 6, 1975, 'Bachiller', 'ARQUITECTO', 'urb campo claro calle 5 a casa 82', '4266736577', '', 'carolinalobomora@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(317, 18209944, 'Bo-0970', 'Distinguido', 'Jackson Eduardo', 'Lobo Ramos', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 3, 9, 1987, 'Bachiller', 'CIENCIAS', 'urb. Don Perucho sector la playa calle la playita', '4267761408', '', 'sync180@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(318, 11955844, 'Bo-0499', 'Cabo/2do', 'José Gregorio', 'Lobo Zerpa', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 6, 5, 1975, 'Bachiller', 'Ciencias', 'ejido bella vista calle Lara casa nº 52', '0416-9799649', '0274-221-2589', 'jose-globo@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(319, 12347797, 'Bo-0421', 'Sgto/2do', 'Miguel Ángel', 'López', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 3, 12, 1974, 'TSU', 'Administracion de Emergen', 'ejido urb san Rafael calle 9 casa 459', '0426-5705942', '0274-2211228', 'miguellopeztrabajo@gmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(320, 16741977, 'Bo-0610', 'Bombero', 'Yoiber Segundo', 'López Domínguez', 1, 9, 2005, 'Venezolano', 'Masculino', '', 21, 10, 1985, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(321, 13022877, 'Bo-0300', 'Sgto/Aydte', 'Deicys Celina', 'López Uribe', 1, 4, 2002, 'Venezolano', 'Femenino', 'CARACAS', 31, 10, 1977, 'Licenciado', 'TECNOLOGIA BOMBERIL', 'urbanización Carabobo calle principal csa06', '0412-0759454', '2758083164', 'yefdey@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(322, 14401842, 'Bo-0611', 'Cabo/2do', 'Wilmer Alexander', 'López Vergara ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 19, 10, 1978, 'Bachiller', 'CIENCIAS', 'urb. Carabobo vereda 34 casa n/3 Mérida', '2665766', '', '', 'Activo', 'Rescate', 'Metropolitana'),
(323, 19997066, 'Bo-1211', 'Distinguido', 'Anyela Carolina', 'Lugo Pérez', 1, 6, 2009, 'Venezolano', 'Femenino', 'Merida', 5, 7, 1991, 'Tecnico Medio', 'PREHOSPITALARIA', ' el arenal los periodistas edificio  3 apto 00-01', '4164766207', '0274-2451267', 'CAROLANYI_19@HOTMAIL.COM', 'Activo', 'Servivida', 'Metropolitana'),
(324, 16443335, 'Bo-0382', 'Cabo/2do', 'Eduardo José', 'Albornoz Gavidia', 1, 9, 2003, 'Venezolano', 'Masculino', '', 4, 12, 1983, 'Bachiller', '', '', '', '', '', '', '', ''),
(325, 16038809, 'Bo-0422', 'Cabo/2do', 'Yorgui Alberto', 'Luzardo Bracho', 1, 9, 2003, 'Venezolano', 'Masculino', 'EL VIGIA', 8, 12, 1982, 'Bachiller', 'CIENCIAS', 'caño seco III, calle 15  casa nº20 el vigía ', '4147583200', '', 'yorgui_al@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(326, 15432637, 'Bo-0423', 'Cabo/2do', 'Manuel Benito', 'Machado Sánchez', 1, 9, 2003, 'Venezolano', 'Masculino', 'Caja Seca ', 20, 4, 1982, 'Bachiller', 'ciencias', 'nueva Bolivia calle las flores, casa f-29', '', '0271-7721591', 'rapers_9_2@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(327, 19995981, 'Bo-0915', 'Distinguido', 'Axel Alejandro', 'Maldonado Piñero', 1, 1, 2008, 'Venezolano', 'Masculino', '', 17, 9, 1990, 'Tecnico Medio', '', 'av las Américas residencia las rivera edificio 2 piso 2 apartamento 2/d ', '4140819980', '2742447795', 'axe_ale@hotmail.com', 'Activo', '', 'Metropolitana'),
(328, 14530413, 'Bo-0748', 'Cabo/2do', 'Pablo Julio', 'Manosalva Durán ', 1, 9, 2006, 'Venezolano', 'Masculino', '', 19, 8, 1980, 'Bachiller', '', 'caño seco 2 avenida 3 calle casa 53', '0424-5928750', '0275-8818160', '', 'Activo', '', 'Panamericana'),
(329, 17130399, 'Bo-0840', 'Cabo/2do', 'Dikson J.', 'Manrique D. ', 1, 12, 2007, 'Venezolano', 'Masculino', 'Merida', 9, 9, 1984, 'Bachiller', 'CIENCIAS', 'los chorros  pasaje eva maría casa nº 100 ', '4243794636', '', 'dikson_09@hormail.com', 'Activo', 'Rescate', 'Metropolitana'),
(330, 16678331, 'Bo-0424', 'Cabo/2do', 'Carlos Alberto', 'Manrique Guerrero', 1, 9, 2003, 'Venezolano', 'Masculino', '', 16, 6, 1984, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(331, 15595362, 'Bo-0727', 'Cabo/2do', 'María Alejandra', 'Manrique Guerrero ', 1, 9, 2006, 'Venezolano', 'Femenino', 'vigia', 17, 9, 1980, 'Bachiller', 'CIENCIAS', 'la blanca calle 04 con avenida 04 casa 3-97 el vigía', '0417-7096107', '0275-881784', 'maialex_17@hotmail.com', 'Activo', '', 'Panamericana'),
(332, 18995294, 'Bo-0841', 'Cabo/2do', 'Karen J.', 'Manrique Mercado ', 1, 1, 2008, 'Venezolano', 'Femenino', 'Merida', 15, 11, 1989, 'Tecnico Medio', 'INCENDIO', 'los curos parte alta vereda1 casa11', '4269784497', '0426-4031404', 'karenmanrique26@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(333, 18310278, 'Bo-0842', 'Cabo/2do', 'Gilberto', 'Márquez ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 21, 1, 1987, 'Bachiller', 'CIENCIAS', 'las tienditas del chama calle principal casa 0-17', '4161781936', '2742665119', 'otreblig_1987@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(334, 15516065, 'Bo-0843', 'Cabo/2do', 'Emiro Armando', 'Marquez Barillas', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 5, 5, 1983, 'TSU', 'MINERIA', 'urb. Carabobo vereda 27 casa nº 7', '', '2742665271', 'emiroarmando@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(335, 16445963, 'Bo-0555', 'Cabo/1ro', 'Johana Margarita', 'Márquez Dugarte', 1, 2, 2005, 'Venezolano', 'Femenino', 'Merida', 4, 1, 1984, 'Tecnico Medio', 'RESCATE', 'san Jacinto rincón bajo calle los  mangos casa 4', '4247465794', '', 'joha0209@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(336, 18124921, 'Bo-0560', 'Sgto/2do', 'Nilson Rolando', 'Márquez Duque', 1, 2, 2005, 'Venezolano', 'Masculino', 'Merida', 30, 9, 1987, 'Tecnico Medio', 'RESCATE', 'los curos parte alta calle carvajal casa n 10', '4269738319', '2742711360', 'theduque_danger@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(337, 17028843, 'Bo-1030', 'Bombero', 'Gregorio del Carmen', 'Marquez Fernandez', 1, 1, 2009, 'Venezolano', 'Masculino', 'EL VIGIA', 25, 4, 1987, 'Bachiller', 'CIENCIAS', 'la blanca caño seco II, calle 13 casa nº42', '4140826409', '2759897260', 'gregoriomarquez1@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(338, 8021621, 'Bo-0180', 'SubTeniente', 'José Ramón', 'Márquez García', 1, 6, 1990, 'Venezolano', 'Masculino', 'Merida', 27, 2, 1963, 'Bachiller', '', 'el vigía caño seco II calle 9 nº 38', '4269179559', '', 'ramonmarquez-63@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(339, 14268239, 'Bo-0425', 'Cabo/1ro', 'José Gregorio', 'Márquez Guerrero', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 20, 10, 1978, 'Tecnico Medio', 'MAQUINAS Y HERRAMIENTAS', 'sector el entable, vrda, 15 casa nº10 los curos', '0426-4736797', '', 'jose_gregorio_2031@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(340, 14268241, 'Bo-0844', 'Distinguido', 'Hector Jose', 'Marquez Guerrero ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 8, 2, 1980, 'Bachiller', 'INTEGRAL', 'sector el entable, vrda, 15 casa nº10 los curos', '0424-7174737', '0274-2715517', 'H.J.M.G@HOTMAIL.COM', 'Activo', 'Conductor', 'Metropolitana');
INSERT INTO `bombero` (`1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `17`, `18`, `19`, `20`, `21`, `22`, `23`, `24`) VALUES
(341, 17771066, 'Bo-0728', 'Cabo/2do', 'Beatriz Elena', 'Márquez Guillen', 1, 9, 2006, 'Venezolano', 'Femenino', 'PUEBLO NUEVO DEL SUR', 18, 12, 1987, 'TSU ', 'Administracion de Empresa', 'santa Juana vereda 2 casa 27', '4262717623', '', 'elenita98_89@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(342, 10100180, 'Bo-0276', 'Sgto/2do', 'Johnny Javier', 'Márquez Gutiérrez', 1, 3, 2002, 'Venezolano', 'Masculino', 'Merida', 10, 3, 1968, 'Bachiller', 'Integral', 'av. 16 septiembre pasaje páez casa n| 1-59', '0426-1457873', '0274-2631060', 'johnnyjm32@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(343, 15694671, 'Bo-0845', 'Cabo/2do', 'Adelmo', 'Marquez Márquez', 1, 1, 2008, 'Venezolano', 'Masculino', 'Sucgre', 28, 9, 1980, 'Licenciado', 'Actividad Fisica y Salud', 'santa cruz de mora calle principal San José casa s/n', '4263269699', '2759898571', 'adelmo.marquezmarquez@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(344, 19995128, 'Bo-0973', 'Distinguido', 'Yessica Gabriela', 'Marquez Peña', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 3, 11, 1988, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'chamita calle tiuna  cas 1-70', '4266739485', '2747892653', 'yessigabriel.nikole@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(345, 18964332, 'Bo-1212', 'Bombero', 'Carlos Arnaldo', 'Marquez Peña', 1, 6, 2009, 'Venezolano', 'Masculino', 'Merida', 7, 8, 1989, 'Tecnico Medio', 'RECATE', 'José Adelmo Gutiérrez parte baja', '4161322165', '', '', 'Activo', 'Servivida', 'Metropolitana'),
(346, 15622786, 'Bo-0426', 'Cabo/1ro', 'Yerlinda Tairy', 'Márquez Peña', 1, 9, 2003, 'Venezolano', 'Femenino', 'Merida', 24, 5, 1980, 'Tecnico Medio', 'RESCATE', 'los curos parte alta bloque 37 edf. 1', '4248624766', '', 'tairy2909@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(347, 11954966, 'Bo-0729', 'Cabo/1ro', 'Yelendi Jacqueline', 'Márquez Ramírez ', 1, 9, 2006, 'Venezolano', 'Femenino', 'CARACAS', 9, 1, 1974, 'TSU ', 'Informatica', 'urb. Humboldt,  residencias el rosario. Torre a.apartamentoa-3', '4167052444', '0274-2661034', 'jaquibomb@gmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(348, 19900166, 'Bo-0972', 'Bombero', 'Yanior Jose', 'Marquez Rangel ', 1, 1, 2009, 'Venezolano', 'Masculino', 'EL VIGIA', 19, 2, 1990, 'Tecnico Medio', 'INCENDIO', 'caño seco ii, calle 9 casa nº38 el vigía', '4247574330', '2758084701', 'yanior_90@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(349, 18636291, 'Bo-0847', 'Distinguido', 'Mayer José', 'Márquez Rangel ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 17, 10, 1988, 'Bachiller', 'CIENCIAS', 'caño seco i casa 5-17 el vigia', '4247476708', '', '', 'Activo', 'Incendio', 'Panamericana'),
(350, 18797564, 'Bo-0916', 'Distinguido', 'Marbelis Dayana', 'Márquez Reinoza ', 1, 1, 2008, 'Venezolano', 'Femenino', 'Merida ', 10, 5, 1990, 'Tecnico Medio', 'PREHOSPITALARIA', 'la pedregosa alta calle el cafetal , residencias cafetal ,casa numero 50', '0426-4719013', '', 'marbelisdayana_17@hotmail.com ', 'Activo', 'Servivida', 'Metropolitana'),
(351, 14970601, 'Bo-0291', 'Sgto/Aydte', 'Willians Enrique', 'Márquez Rivera', 1, 3, 2002, 'Venezolano', 'Masculino', 'VALENCIA', 21, 5, 1978, 'Bachiller', 'CIENCIAS', 'urb. alto chama jardín 2 casa 34', '4147485912', '', 'williansmarquez@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(352, 18964688, 'Bo-0848', 'Distinguido', 'José A.', 'Marquina Albornoz ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Mérida', 19, 1, 1988, 'Bachiller', '', '', '', '', '', 'Activo', 'Servivida', 'Paramo'),
(353, 12347822, 'Bo-0500', 'Sgto/2do', 'Jesse Miguel', 'Marquina Uzcategui', 1, 9, 2004, 'Venezolano', 'Masculino', '', 17, 3, 1975, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(354, 16654870, 'Bo-0749', 'Distinguido', 'Deivi Alexis', 'Marquina Uzcategui', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida ', 25, 8, 1983, 'Bachiller', 'CIENCIAS ', 'los curos el entable bloque 4 edificio 2 apto  02 03', '0414-7375187', '', 'bencar.marquina76@gmal.com', 'Activo', 'Servivida', 'Metropolitana'),
(355, 14255646, 'Bo-0330', 'Cabo/2do', 'Yulay Irama', 'Martín Márquez', 1, 7, 2002, 'Venezolano', 'Femenino', 'TOVAR.', 23, 7, 1978, 'Bachiller', 'CIENCIAS ', 'Complejo res. mariscal sucre bloque  3 piso 3 apto. 3-43', '0416-0775861', '', 'yulaymartin@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(356, 11833054, 'Bo-0612', 'Bombero', 'Gregorio Emilio', 'Martínez Acosta', 1, 9, 2005, 'Venezolano', 'Masculino', 'CUMANA', 5, 11, 1974, 'Tecnico Medio', 'ELECTRICIDAD INDUSTRIAL', 'urb santa Ana calle Tovar 1-83 ', '0416-1790836', '', 'gregoriomartinez2006@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(357, 16552888, 'Bo-0750', 'Cabo/1ro', 'José Luís', 'Martínez Dugarte ', 1, 9, 2006, 'Venezolano', 'Masculino', 'ARAGUA', 11, 4, 1984, 'Tecnico Medio', 'CONTABILIDAD', 'santa cruz de mora sector santa rosa calle rosa de la', '4162366542', '', 'jimgsmch114@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(358, 18637954, 'Bo-0975', 'Bombero', 'Moises Abrahan', 'Martinez Marquez', 1, 1, 2009, 'Venezolano', 'Masculino', 'EL VIGIA', 5, 2, 1988, 'Bachiller', 'CIENCIAS', 'av. 6 entre calles 13 y 14 barrio 12 de octubre casa nº13-55 el vigía', '4266299295', '0275-8811341', 'elalgel06@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(359, 19996221, 'Bo-0976', 'Bombero', 'Dayana Carolina', 'Martinez Rojas', 1, 1, 2009, 'Venezolano', 'Femenino', 'CARACAS', 4, 4, 1989, 'Bachiller', 'HUMANUDADES', 'Av los próceres el llanito entrada el caucho 0-20', '4247434559', '2742443631', 'danenita004@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(360, 16134579, 'Bo-0977', 'Distinguido', 'Abraham Antonio', 'Mateo Peña', 1, 1, 2009, 'Venezolano', 'Masculino', 'CARACAS', 1, 8, 1984, 'Tecnico Medio', 'CONSTRUCCION C IVIL', 'avenida 2 lora entre 24-25 casa numero 24-10', '4269798476', '2742527375', 'aamp23@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(361, 19848756, 'Bo-0978', 'Bombero', 'Ingrid Danexy', 'Medina Ortega', 1, 1, 2009, 'Venezolano', 'Femenino', 'TOVAR', 2, 3, 1990, 'Bachiller', 'CIEN CIAS', 'urb  monseñor moreno  vereda 3 casa 9', '4147171501', '2758731602', 'media_0203@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(362, 13790204, 'Bo-0730', 'Cabo/2do', 'Francisco Javier', 'Medina Parra', 1, 9, 2006, 'Venezolano', 'Masculino', 'TOVAR', 27, 11, 1979, 'Bachiller', 'CIENCIAS', 'urb buenos aires, calle Miranda, casa 6-51', '4161151259', '', '', 'Activo', 'Conductor', 'Metropolitana'),
(363, 8708859, 'Bo-0190', 'Sgto/1ro', 'Jairo Ernesto', 'Méndez', 1, 9, 1993, 'Venezolano', 'Masculino', 'BAILADORES', 8, 4, 1968, 'Bachiller', 'CIENCIAS', 'calle  5  casa 5-35 el corozo Tovar', '0414-7344226', '0275-8730287', 'jairoernesto68@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(364, 18056879, 'Bo-0751', 'Cabo/2do', 'Yoendris Orlando', 'Méndez Atencio ', 1, 9, 2006, 'Venezolano', 'Masculino', 'EL VIGIA', 29, 10, 1986, 'Bachiller', 'CIENCIAS', 'san Juan Inrevi calle 13 casa 90', '4247068902', '', 'yoendris_mendez@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(365, 16306650, 'Bo-0979', 'Distinguido', 'Yenny Carolina', 'Mendez Molina', 1, 1, 2009, 'Venezolano', 'Femenino', 'EL VIGIA', 13, 11, 1981, 'Bachiller', 'CIENCIAS', 'Ejido, urb. San miguel vrda. 02- casa nº31', '0416-9798602', '2742218297', 'yenny_s2004@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(366, 18577449, 'Bo-0982', 'Distinguido', 'Jorge Anatolio', 'Mendez Rivas', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 30, 11, 1988, 'Bachiller', 'CIENCIAS', 'el chama santa catalina calle Juan pablo segundo casa s/n ', '4161319726', '', '', 'Activo', 'Conductor', 'Metropolitana'),
(367, 19487297, 'Bo-1213', 'Bombero', 'Edis Wladimir', 'Mendez Rivas', 1, 6, 2009, 'Venezolano', 'Masculino', 'TOVAR', 16, 11, 1991, 'Tecnico Medio', 'OPERACIONES CONTRA INCEND', 'santa catalina del chama, calle Juan pablo segundo, casa sin Mérida', '4166756790', '', '', 'Activo', 'Incendio', 'Metropolitana'),
(368, 15074751, 'Bo-0850', 'Distinguido', 'Jose Gonzalo', 'Mendez Rojas', 1, 1, 2008, 'Venezolano', 'Masculino', 'CARACAS', 4, 3, 1982, 'Bachiller', 'Humanidades', 'el chama caserío san Antonio casa s/n ', '4163750353', '27451183061', 'josem_fire@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(369, 17523860, 'Bo-0851', 'Distinguido', 'Alejandro José', 'Mendez Suarez. ', 1, 1, 2008, 'Venezolano', 'Masculino', '', 24, 8, 1985, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(370, 13825692, 'Bo-0427', 'Sgto/1ro', 'Yerlander Edecio', 'Mendoza Salcedo', 1, 9, 2003, 'Venezolano', 'Masculino', 'SAN CRISTOBAL DE TORONDOY', 17, 7, 1976, 'TSU ', 'AGROPECUARIA', 'urb  los curos calle 8 casa 7', '4161768275', '2742716530', 'yerlandermendoza@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(371, 19713009, 'Bo-1044', 'Bombero', 'Walter Daniel', 'Mendoza Salcedo', 1, 1, 2009, 'Venezolano', 'Masculino', 'VALERA', 28, 2, 1987, 'Bachiller', 'CIENCIAS', 'nueva Bolivia ,san Cristóbal de Torón doy calle principal', '4267795721', '', 'walterdanielmendoza@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(372, 10718459, 'Bo-1019', 'Sgto/2do', 'Maria Valentina', 'Mercado Briceño', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 31, 3, 1972, 'BACHILLER', 'CIENCIAS', 'av 3 independencia n35-20 glorias patrias', '0416-0719964', '0274-6571244', 'hiyokochan31@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(373, 15296425, 'Bo-0428', 'Sgto/2do', 'Johenny David', 'Mercado García', 1, 9, 2003, 'Venezolano', 'Masculino', 'EL VIGIA', 29, 1, 1982, 'Bachiller', 'CIENCIAS', 'la Carabobo v 34 casa santos ', '0414-3748495', '', 'bomberd6@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(374, 14267810, 'Bo-0752', 'Cabo/1ro', 'Lioner José', 'Mesa Fernández ', 1, 9, 2006, 'Venezolano', 'Masculino', '', 31, 12, 1979, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(375, 14361771, 'Bo-0273', 'Sgto/Aydte', 'Omar de Jesús', 'Mesa Méndez', 1, 3, 2002, 'Venezolano', 'Masculino', 'coloncito estado tachira', 10, 2, 1978, 'Tecnico Medio', 'TECNICO MEDIO EN MEDICINA', 'barrio la victoria calle2 casa/ 1-69 el vigía', '4247219095', '2758816803', 'omardari_04@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(376, 15356756, 'Bo-0613', 'Cabo/1ro', 'José Alexander', 'Mesa Méndez', 1, 9, 2005, 'Venezolano', 'Masculino', '', 5, 9, 1980, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(377, 16701451, 'Bo-0852', 'Bombero', 'Angel Manuel', 'Meza Acosta ', 1, 1, 2008, 'Venezolano', 'Masculino', 'CUMANA', 17, 7, 1983, 'Bachiller', 'CIENCIAS', 'el llanito la otra banda', '4166699970', '2745115055', 'angelmeza_17@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(378, 15175702, 'Bo-0332', 'Sgto/1ro', 'Jesús Alfredo', 'Meza Alarcón', 1, 7, 2002, 'Venezolano', 'Masculino', '', 4, 2, 1981, 'Licenciado', '', 'urbanización san Rafael calle 5 ejido', '4268022737', '0274-2216993', 'chucho.je@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(379, 19751611, 'Bo-1214', 'Bombero', 'Fran Javier', 'Meza Araque', 1, 6, 2009, 'Venezolano', 'Masculino', 'Merida', 31, 5, 1991, 'Tecnico Medio', 'INCENDIO', 'urb san Rafael ejido', '4160323395', '', 'frajavier_12@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(380, 14460912, 'Bo-0614', 'Distinguido', 'José Adriver', 'Mogollón Sánchez', 1, 9, 2005, 'Venezolano', 'Masculino', 'Timotes-Mérida', 2, 9, 1980, 'Bachiller', 'Integral', 'av- universidad sector Andrés Eloy calle principal casa n-3-26', '4263732329', '', 'adrismary@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(381, 12349423, 'Bo-0502', 'Sgto/2do', ' José Marino', 'Molero Ramírez', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 20, 8, 1973, 'Tecnico Medio', 'Agrotecnia', 'el valle, sector el playón, casa 0-296', '', '0274-2443450', 'J.MARINO_MOLERO@HOTMAIL.COM', 'Activo', 'Conductor', 'Metropolitana'),
(382, 18797740, 'Bo-0699', 'Cabo/1ro', 'Giovanni Gerardo', 'Molero Vargas ', 1, 1, 2006, 'Venezolano', 'Masculino', 'Merida', 6, 8, 1988, 'TSU ', 'Educacion Fisica', 'Santa Ana alta sector bella vista casa 12', '0426-9790706', '', 'molerovargasg@yahoo.com', 'Activo', 'Rescate', 'Metropolitana'),
(383, 9396560, 'Bo-0164', 'Teniente', 'Luís Alfonso', 'Molina', 1, 12, 1987, 'Venezolano', 'Masculino', 'Merida', 24, 12, 1966, 'Tecnico Medio', 'Rescate', 'avd. los próceres sector la milagrosa casa-03-10', '0416-874-9401', '', 'luna_396@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(384, 16199566, 'Bo-0754', 'Cabo/1ro', ' Wilme José', 'Molina Angulo', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 21, 10, 1983, 'Bachiller', 'CIENCIAS', 'ejido urb, padre duque calle  3 b -179', '', '2742219410', 'fireman_tati@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(385, 18619506, 'Bo-0753', 'Cabo/2do', 'Joinner Alexander', 'Molina Angulo ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 9, 3, 1985, 'Bachiller', 'CIENCIAS', 'ejido , bella vista calle Lara', '', '0274-2217092', 'bombero_jama_00@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(386, 19848434, 'Bo-1215', 'Bombero', 'Edgar Alexander', 'Molina Barreto', 1, 6, 2009, 'Venezolano', 'Masculino', 'TOVAR', 2, 2, 1989, 'Bachiller', 'CIENCIAS', 'calle principal sector ramona Sojo casa sin numero Tovar', '', '2758733086', 'edgar19@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(387, 11216784, 'Bo-0335', 'Cabo/1ro', 'Freddy José', 'Molina Fernandez', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 29, 8, 1970, 'Bachiller', 'INTEGRAL', 'av las Ecio valeri moreno conjunto res parque las Américas torre f apto pb-', '0416-4716743', '0274-2663612', 'freddymolinaf@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(388, 13790613, 'Bo-0333', 'Cabo/1ro', 'Carlos E.', 'Molina Guillen', 1, 7, 2002, 'Venezolano', 'Masculino', '', 16, 8, 1978, 'Bachiller', '', 'sta cruz de mora calle bolívar', '4167751122', '', 'pacca@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(389, 20394927, 'Bo-0917', 'Bombero', 'Yubraisi Katerine', 'Molina Martinez', 1, 1, 2008, 'Venezolano', 'Femenino', 'TOVAR', 10, 6, 1990, 'Tecnico Medio', 'PREHOSPITALARIA', 'sabaneta, quebrada blanca calle la victoria casa nº 9 Tovar', '4164776936', '2758734419', 'yubraisi@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(390, 18964330, 'Bo-0854', 'Distinguido', 'José G.', 'Molina Monsalve ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 28, 2, 1988, 'Bachiller', 'CIENCIAS', 'barrio campo de oro pasaje Miraflores casa 0-160', '4161192592', '2742630971', 'molinajose_28@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(391, 15694935, 'Bo-0547', 'Sgto/2do', 'Efreen Johan', 'Molina Mora', 1, 1, 2005, 'Venezolano', 'Masculino', '', 26, 9, 1982, 'Bachiller', '', '', '0416-3778358', '', '', 'Activo', '', 'Mocoties'),
(392, 13804362, 'Bo-0334', 'Sgto/2do', 'Jairo Edicson', 'Molina Mora', 1, 7, 2002, 'Venezolano', 'Masculino', 'CANAGUA', 6, 2, 1979, 'Bachiller', 'CIENCIAS', 'san buenaventura ejido casa c5-14', '4160719051', '', 'edicsonmolina@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(393, 15695641, 'Bo-0615', 'Cabo/2do', 'Joffre José', 'Molina Morales', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR ', 26, 12, 1983, 'TSU ', 'Administacion mervantil', 'ejido, calle Ayacucho casa 92-7', '4247703397', '', 'joffre-36@hotmail.com ', 'Activo', 'Rescate', 'Mocoties'),
(394, 15074776, 'Bo-0853', 'Bombero', 'Jose Leonardo', 'Molina Pimentel', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR', 2, 11, 1980, 'Bachiller', 'Ciencias', 'segunda calle los naranjos casa n° 30 Tovar', '4161193016', '2758731323', 'leonardomolina_18@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(395, 15920129, 'Bo-0430', 'Sgto/1ro', 'Rubén Darío', 'Molina Peña', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 21, 4, 1982, 'TSU ', 'PREHOSPITALARIA', 'el chama ,sector el cambio, calle 3 casa nº50 Mérida', '4163630502', '', 'scalp23@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(396, 14400436, 'Bo-0731', 'Cabo/2do', 'Víctor Lenin', 'Molina Rangel', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 14, 10, 1978, 'Licenciado', 'contaduria publica ', 'barrio el amparo pasaje el chorrito casa 060', '4140802214', '2742633141', 'icich78@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(397, 19486663, 'Bo-1216', 'Distinguido', 'Carlos Alfredo', 'Molina Soto', 1, 6, 2009, 'Venezolano', 'Masculino', 'TOVAR', 29, 8, 1990, 'Bachiller', 'CIENCIAS', 'Tovar segunda calle los naranjos casa n° 18-108', '4247142485', '2758733636', 'carlos_maya_29@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(398, 20394069, 'Bo-0981', 'Distinguido', 'Astrid Carolina', 'Moncada Rivas', 1, 1, 2009, 'Venezolano', 'Femenino', 'EL VIGIA', 28, 12, 1989, 'Bachiller', 'CIENCIAS', 'urb buenos aires calle 7 casa 177', '4147162698', '2758813874', 'astrid17_89@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(399, 10715849, 'Bo-0336', 'Teniente', 'José Gregorio', 'Monsalve Ramos', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 24, 10, 1971, 'TSU ', 'ARTES INDUSTRIALES', 'la pedregosa alta calle rosa mística s/n portón negro', '4141516104', '', 'linceone@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(400, 13790892, 'Bo-0503', 'Cabo/1ro', 'Edwin Alexander', 'Monsalve Rivero', 1, 9, 2004, 'Venezolano', 'Masculino', 'Coro Edo Falcon', 3, 5, 1978, 'Bachiller', 'ciencias', 'sector corozo, calle 4 entre carrera 5 y 6', '4140533004', '2758732761', 'edwinyupi@HOTMAIL.COM', 'Activo', 'Rescate', 'Mocoties'),
(401, 18780805, 'Bo-0732', 'Cabo/2do', 'Oscar Edwin', 'Monsalve Saavedra ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 16, 7, 1977, 'Bachiller', 'Ciencias', 'campo de oro calle 2 casa 2-71', '4166010727', '2742620208', 'oscarmonsalvesaa@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(402, 19487148, 'Bo-1217', 'Distinguido', 'Norelis del Carmen', 'Montilla Dominguez', 1, 6, 2009, 'Venezolano', 'Femenino', 'SANT CRUZ DE MORA', 24, 2, 1991, 'Bachiller', 'CIENCIAS', 'el guayabal sana cruz de mora, cas sin numero calle principal', '4247152373', '', 'nre_2491@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(403, 13648582, 'Bo-0855', 'Cabo/2do', 'Cesar', 'Montilla Marquez ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 4, 5, 1978, 'Bachiller', 'CIENCIAS', 'los curos bloque 38, edf.02 apto. 02-04 Mérida', '4147170795', '', 'cesar_montilla@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(404, 14400396, 'Bo-0856', 'Distinguido', 'Yimer Alberto', 'Montilla Marquez ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 14, 3, 1979, 'Bachiller', 'CIENCIAS', 'urb Carabobo   vereda 30 casa 7', '4262823161', '2742665373', 'yam7000rpm@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(405, 15694183, 'Bo-0756', 'Cabo/2do', 'Elys Eduardo', 'Montilla Márquez ', 1, 9, 2006, 'Venezolano', 'Masculino', 'TOVAR', 24, 8, 1982, 'Bachiller', 'Ciencias', 'segunda calle, los naranjos el llano Tovar', '', '0275-8733297', 'eliseduardo_montilla99@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(406, 16316337, 'Bo-0757', 'Distinguido', 'Víctor Wladimir', 'Montilva Contreras ', 1, 9, 2006, 'Venezolano', 'Masculino', '', 7, 5, 1983, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Mocoties'),
(407, 15621099, 'Bo-0337', 'Sgto/2do', 'Rosana Coromoto', 'Monzón Medina', 1, 7, 2002, 'Venezolano', 'Femenino', 'Merida', 30, 12, 1980, 'Licenciado', 'TECNOLOGIA BOMBERIL', 'urb don perucho av 5 casa 311', '4164730782', '', 'zacha@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(408, 14699907, 'Bo-0504', 'Cabo/1ro', 'Elis Orlando', 'Mora Guillen', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 21, 8, 1978, 'Tecnico Medio', 'TECNOLOGIA BOMBERIL', 'el chama sector las mesitas calle los girasoles  casa 02', '4149751772', '', 'elismora14699@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(409, 13577247, 'Bo-0733', 'Cabo/1ro', 'José Isabelino', 'Mora Guillen', 1, 9, 2006, 'Venezolano', 'Masculino', 'Mérida', 4, 6, 1977, 'TSU ', 'Recursos Humanos', 'el chama sector san Antonio, calle Cristo rey, casa 1', '4149740612', '', 'chabelo770@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(410, 17771550, 'Bo-0758', 'Cabo/2do', 'Baudilio', 'Mora Méndez', 1, 9, 2006, 'Venezolano', 'Masculino', 'San cruz de Mora', 31, 5, 1985, 'Bachiller', 'Ciencias', 'santa cruz , sector el arenal, casa s/n', '0416-6551267', '', '', 'Activo', 'Incendio', 'Mocoties'),
(411, 19047067, 'Bo-0918', 'Distinguido', 'Ramón Eduardo', 'Mora Molina ', 1, 1, 2008, 'Venezolano', 'Masculino', 'LA VICTORIA, ESTADO ARAGUA', 5, 3, 1990, 'Tecnico Medio', 'MENCION BOMBERO', 'tienditas del chama, calle los naranjos, casa 1-3', '', '0274-6588161', 'edu_15mora@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(412, 15920122, 'Bo-0431', 'Sgto/1ro', 'Lisandro', 'Mora Mora', 1, 9, 2003, 'Venezolano', 'Masculino', 'CANAGUA', 13, 2, 1982, 'Bachiller', 'MEDICINA PREHOSPITALARIA', 'loma de los ángeles, ', '0426-5701878', '', '', 'Activo', 'Rescate', 'Metropolitana'),
(413, 17771615, 'Bo-0857', 'Distinguido', 'Jesus Ernesto', 'Mora Ortega', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR', 6, 10, 1988, 'Tecnico Medio', 'INCENDIO', 'sector el guayabal calle principal casa 8 santa cruz de mora', '4247060696', '0275-2679878', 'jesus23_mora@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(414, 18620484, 'Bo-1031', 'Bombero', 'Luis Alberto', 'Mora Peña', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 16, 9, 1987, 'Bachiller', 'CIENCIAS', 'urb cara bobo vereda 37 casa 18', '4147096985', '', 'luis_ale_01207@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(415, 14131179, 'Bo-0338', 'Sgto/1ro', 'Jairo', 'Mora Vega', 1, 7, 2002, 'Venezolano', 'Masculino', 'CANAGUA', 8, 4, 1977, 'Tecnico Medio', 'RESCATE', 'urb jj osuna parte alta blq 35 apy 00-03', '4267032004', '', 'canagua77@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(416, 8075018, 'Bo-0030', 'SubTeniente', 'Omar Alberto', 'Morales Carrero', 1, 2, 1999, 'Venezolano', 'Masculino', 'TOVAR', 13, 3, 1960, 'Bachiller', 'Ciencias', 'Arapuey, calle el estadio 3-9', '0416-6477231', '0275-8733162', 'ochallo.morales678@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(417, 16020884, 'Bo-0858', 'Distinguido', 'Omar A.', 'Morales G. ', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 28, 2, 1984, 'Bachiller', 'Ciencias', 'Tovar el amparo calle los altuves casa S/N', '0426-2751844', '2758730422', 'omarmorales42@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(418, 10905695, 'Bo-0165', 'Cabo/1ro', 'Víctor M.', 'Morales Guerrero', 1, 1, 2000, 'Venezolano', 'Masculino', 'MARACAIBO', 17, 6, 1974, 'Bachiller', 'HUMANIDADES', 'urb. el balmoral torre4 apto.1-1 pb. Tovar', '0426-8038847', '0275-8732808', 'victormorales0411@gmail.com', 'Activo', 'Conductor', 'Mocoties'),
(419, 14023560, 'Bo-0432', 'Cabo/1ro', 'Cornelio de Jesús', 'Morales Márquez', 1, 9, 2003, 'Venezolano', 'Masculino', 'EL VIGIA', 31, 7, 1979, 'Bachiller', 'CIENCIAS', 'el vigía barrí bolívar calle 4 cas 0-45', '4147578656', '2758814633', 'corneliomor@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(420, 16020841, 'Bo-0859', 'Bombero', 'Jairo Jose', 'Morales Zerpa', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 3, 9, 1983, 'Bachiller', 'HUMANUDADES', 'sabaneta Tovar', '4167763514', '', 'jjmorales65@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(421, 13230864, 'Bo-0340', 'SubTeniente', ' Wilmar Alexander', 'Moreno Crisman', 1, 7, 2002, 'Venezolano', 'Masculino', 'TOVAR', 4, 12, 1978, 'TSU ', 'MEDICINA PREHOSPITALARIA', 'urb, santa Elena avenida bella vista edificio mis muchachos piso 4 ph.', '4147411820', '', 'willmarmorc@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(422, 14401772, 'Bo-0339', 'Sgto/Aydte', 'Betty Esperanza', 'Moreno de  Rodríguez', 1, 7, 2002, 'Venezolano', 'Femenino', 'Merida', 24, 8, 1979, 'Tecnico Medio', 'MEDICINA PREHOSPITALARIA', 'los curos parte media bloque 8 apto 31', '4161323299', '', 'b_esperanza_m@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(423, 18309150, 'Bo-0860', 'Bombero', 'Jose Leonardo', 'Moreno Gonzalez ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 7, 4, 1987, 'Tecnico Medio', 'INCENDIO', 'los curos parte media bloque 7 apto 00-02', '0424-7164246', '2742715684', 'leonardomoreno_g@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(424, 16679521, 'Bo-0565', 'Cabo/1ro', 'Jackson Javier', 'Moreno Maldonado', 1, 2, 2005, 'Venezolano', 'Masculino', 'EL VIGIA', 10, 10, 1981, 'Tecnico Medio', 'RESCATE', 'caño seco ii calle 2 casa 23', '0424-7188153', '', 'jayuarle@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(425, 16231425, 'Bo-0734', 'Cabo/2do', 'Nathaly del Valle', 'Moreno Maldonado ', 1, 9, 2006, 'Venezolano', 'Femenino', '', 11, 6, 1984, 'Bachiller', '', 'caño seco calle 2 casa n- 23', '', '', '', 'Activo', '', 'Panamericana'),
(426, 17322285, 'Bo-0617', 'Cabo/1ro', 'Jean Carlos', 'Moreno Moreno', 1, 9, 2005, 'Venezolano', 'Masculino', 'Zea', 19, 8, 1986, 'Bachiller', 'ciencias', 'zea sector san miguel las colinas casa n- 2', '4160484988', '2759953303', 'morenojeancarlos@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(427, 14962088, 'Bo-0618', 'Distinguido', 'Luís Alberto', 'Moreno Pernia ', 1, 9, 2005, 'Venezolano', 'Masculino', 'EL VIGIA', 29, 4, 1981, 'Bachiller', 'CIENCIAS', 'panamericana capazón sector las rurales casa nª 36', '4268294144', '', 'luisaperro@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(428, 19894447, 'Bo-1032', 'Bombero', 'Jorge Leonardo', 'Moreno Pernia ', 1, 1, 2009, 'Venezolano', 'Masculino', 'EL VIGIA', 16, 10, 1988, 'Bachiller', 'CIENCIAS', 'panamericana capazón centro santa Elena de arenales calle principal casa /n', '4247345844', '', 'leonoche@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(429, 8006253, 'Bo-1218', 'Sgto/Aydte', 'Jose Gregorio', 'Moreno Vielma', 1, 6, 2009, 'Venezolano', 'Masculino', 'CHIGUARA', 28, 8, 1958, 'Abogado', 'ABOGADO', 'av. 16 de septiembre urb. Juan 23, bloque i apto n21 Mérida', '0414-6250806', '0274-7900637', 'josemorenovielma@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(430, 13525740, 'Bo-0505', 'Sgto/2do', 'Ender Benito', 'Morillo García ', 1, 9, 2004, 'Venezolano', 'Masculino', '', 20, 9, 1977, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(431, 14267245, 'Bo-0435', 'Sgto/2do', 'Julio César', 'Morillo Villa', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 24, 7, 1979, 'Licenciado', 'Administracion de Desastr', 'los curos parte alta bloque 37 edf. 1', '4247574066', '', 'morillojc@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(432, 13229277, 'Bo-0506', 'Cabo/2do', 'Pio Adirem', 'Muñoz Araujo', 1, 9, 2004, 'Venezolano', 'Masculino', 'TRUJILLO ', 3, 5, 1976, 'Bachiller', 'ciencias ', 'ejido, urb el pilar bloque 10 apto 00-01', '0412-1661412', '', '', 'Activo', 'Conductor', 'Metropolitana'),
(433, 17895821, 'Bo-0759', 'Cabo/1ro', 'Bonny Gerardo', 'Muñoz Rojo ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 12, 12, 1984, 'Bachiller', 'CIENCIAS', 'barrio campo de oro casa 1-15', '0416-5724053', '', '', 'Activo', 'Incendio', 'Metropolitana'),
(434, 15754699, 'Bo-0619', 'Sgto/2do', 'José Armando', 'Muro Maldonado', 1, 9, 2005, 'Venezolano', 'Masculino', 'CARACAS', 5, 3, 1981, 'Bachiller', 'CIENCIAS', 'urb Carabobo calle 1 casa 16', '4163748593', '', 'murojamm@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(435, 10713363, 'Bo-0279', 'Sgto/Aydte', 'Felisa Beatriz', 'Namias Guillén', 1, 3, 2002, 'Venezolano', 'Femenino', 'Merida', 4, 6, 1971, 'TSU', 'MANEJO DE EMERGENCIA', 'urb el pilar ejido', '4168773780', '', 'bnamias@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(436, 13229102, 'Bo-0507', 'Cabo/2do', ' Luís Antonio', 'Nava Arismendi', 1, 9, 2004, 'Venezolano', 'Masculino', '', 23, 8, 1976, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(437, 15175755, 'Bo-0760', 'Cabo/2do', 'Jhonny Jesús', 'Nava Arismendi ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 21, 12, 1979, 'Bachiller', 'CIENCIAS', 'Chamita calle Coromoto pasaje paraíso casa sin numero.', '0426-8271343', '0274-2669818', 'JHONNYNAVA@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(438, 9390973, 'Bo-0097', 'Sgto/1ro', 'José Raúl', 'Nava Linares', 1, 2, 1998, 'Venezolano', 'Masculino', 'TORONDOY', 23, 8, 1963, 'Bachiller', 'INTEGRAL', 'Nueva bolivia,av-9 tulio Febres cordero. casa s/n', '0426-1482888', '0271-7722565', 'raultuco@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(439, 19713111, 'Bo-0861', 'Bombero', 'Miguel Ángel', 'Nava Moreno ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Aragua', 16, 7, 1989, 'Bachiller', 'Ciencias', 'Nueva Bolivia, v tulio Febres cordero. casa s/n', '4160961573', '', 'miguelangel8961@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(440, 21185926, 'Bo-1033', 'Distinguido', 'Javier Alejandro', 'Nava Nava', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 8, 9, 1986, 'Bachiller', 'CIENCIAS', 'ejido manzano bajo urb Villa María Eugenia casa 13', '4164575910', '2748084210', 'alejandrob_2020@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(441, 15754093, 'Bo-0341', 'Sgto/1ro', 'Livio Antonio', 'Nava Quintero', 1, 7, 2002, 'Venezolano', 'Masculino', '', 17, 4, 1982, 'Licenciado', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(442, 15031516, 'Bo-0620', 'Cabo/1ro', 'Rafael Ángel', 'Navas Fernández', 1, 9, 2005, 'Venezolano', 'Masculino', '', 9, 4, 1980, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(443, 15921899, 'Bo-0437', 'Sgto/Aydte', 'Jean Carlos', 'Nuñez ', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 30, 9, 1983, 'TSU', 'ADMINISTRACION', 'urb Carabobo verada 20 casa 09', '4247652241', '2742665106', 'fi_reman_1983@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(444, 17027260, 'Bo-0983', 'Bombero', 'Ligia Graciela', 'Nuñez Mendez', 1, 1, 2009, 'Venezolano', 'Femenino', 'EL VIGIA', 24, 10, 1986, 'Tecnico Medio', 'INCENDIO', 'av 16 de septiembre pasaje la florida casa 1-57', '4248076536', '', 'ligia2230@live.com', 'Activo', 'Servivida', 'Metropolitana'),
(445, 15356197, 'Bo-0438', 'Sgto/1ro', 'German Antonio', 'Nuñez Roa', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR-Merida', 4, 12, 1981, 'Bachiller', 'Ciencias', 'buenos aires calle 4 cas 2-95 el vigía', '0416-2780948', '0275-8820360', 'nroagerman@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(446, 18619292, 'Bo-0796', 'Cabo/1ro', 'Yohan Yoset', 'Obando García ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 10, 11, 1987, 'Bachiller', 'CIENCIAS', 'la vega de ejido calle el bucaral casa 04', '4160467973', '0274-2215625', 'wwwyohanincendio@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(447, 8023573, 'Bo-0567', 'SubTeniente', 'José Jesús', 'Obando Peña', 1, 2, 2005, 'Venezolano', 'Masculino', 'Merida', 16, 10, 1962, 'TSU ', 'CIENCIAS', 'la vega ejido sector el bucaral casa 4', '2742215625', '', 'jose_obando@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(448, 19847274, 'Bo-1034', 'Distinguido', 'Adrian Alberto', 'Ochoa Alvarez', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 3, 7, 1989, 'Bachiller', 'CIENCIAS', 'santa cruz de mora sector padre granado, cale principal casa n1-6 ', '4162962423', '2759886566', '', 'Activo', 'Incendio', 'Mocoties'),
(449, 17770533, 'Bo-0686', 'Cabo/2do', 'Yender Ernesto', 'Ochoa Álvarez ', 1, 1, 2006, 'Venezolano', 'Masculino', 'San cruz de mora', 28, 3, 1985, 'Tecnico Medio', 'rescate ', 'san cruz de mora sector las parcelas, calle principales casa s/n', '4142409777', '0275-4117154', 'yenderocho@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(450, 14805608, 'Bo-0281', 'Sgto/1ro', 'Richard Alexis', 'Ochoa Urbina', 1, 3, 2002, 'Venezolano', 'Masculino', 'Merida', 3, 8, 1980, 'Bachiller', 'integral', 'el rincón, parte media casa 1-14 ', '', '4247205884', 'rio8a@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(451, 17130449, 'Bo-0621', 'Cabo/1ro', 'Yesenia Coromoto', 'Ochoa Urbina', 1, 9, 2005, 'Venezolano', 'Femenino', 'Merida', 17, 2, 1986, 'Bachiller', 'ciencias', 'puente la pedregosa loma los maitines, casa n-13-1', '0426-3293540', ' 0274-2664323', '', 'Activo', 'Servivida', 'Metropolitana'),
(452, 17770228, 'Bo-0784', 'Distinguido', 'Jose Adrian ', 'Ojeda Moreno ', 1, 2, 2007, 'Venezolano', 'Masculino', 'san jose de palmira', 20, 2, 1986, 'Tecnico Medio', 'medicina pre hospitalaria', 'ejido urbanización urb zumba calle 2 b casa 81', '0274-2218083', '0416-9737400', '', 'Activo', '', 'Panamericana'),
(453, 15235255, 'Bo-0622', 'Cabo/2do', 'Carlos Alberto', 'Omaña ', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR', 9, 4, 1983, 'Bachiller', 'CIENCIAS', 'el chama santa catalina casa 59-22', '4161180938', '', 'cao09@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(454, 18578432, 'Bo-0984', 'Bombero', 'Richard Alberto', 'Omaña Soto', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 20, 2, 1988, 'Bachiller', 'CIENCIAS', 'segunda calle de los naranjos el llano Tovar', '4161172598', '2758731308', 'richard.2015@hotmail.cm', 'Activo', 'Incendio', 'Mocoties'),
(455, 8020998, 'Bo-0032', 'Teniente', 'Vitalio', 'Ortega Contreras', 1, 3, 1996, 'Venezolano', 'Masculino', 'SANTA CRUZ DE MORA', 7, 1, 1961, 'Bachiller', 'CIENCIAS', 'santa Ana norte sector bella vista casa 2-23', '4268779904', '', 'vitalio1963@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(456, 16743370, 'Bo-0342', 'Sgto/2do', 'Tania Isabel', 'Ortiz Valera', 1, 7, 2002, 'Venezolano', 'Femenino', '', 26, 9, 1984, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(457, 17239002, 'Bo-0344', 'Sgto/Aydte', 'Francisco Alberto', 'Osorio Andrade', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 7, 10, 1983, 'Licenciado', 'Ciencias del Fuego seguri', 'las Gonzales residencia villa libertad edificio n4c4 apto 3', '2742453822', '4247656327', 'francisco_osorio83@hotmail.com', 'Activo', '', 'Metropolitana'),
(458, 17239001, 'Bo-0343', 'Sgto/2do', 'Daniel Evaristo', 'Osorio Andrade', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 23, 9, 1984, 'Bachiller', 'CIEN CIAS', 'ejido', '', '', '', 'Activo', 'Conductor', 'Metropolitana'),
(459, 15235403, 'Bo-0508', 'Cabo/2do', 'José Ali', 'Osuna Basto', 1, 9, 2004, 'Venezolano', 'Masculino', '', 27, 12, 1981, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(460, 11953422, 'Bo-0225', 'Teniente', 'Gustavo II Ludwing', 'Ovalles Molina', 1, 4, 2001, 'Venezolano', 'Masculino', 'Merida', 1, 7, 1974, 'TSU ', 'INFORMATICA', 'urb. los curos bloque 38 edf 3 apto 02-04', '4141790597', '4166147391', 'ovallesg@hotmail.com', 'Activo', '', 'Metropolitana'),
(461, 15516917, 'Bo-0439', 'Distinguido', 'Edelmir ', 'Ovalles Saavedra', 1, 9, 2003, 'Venezolano', 'Masculino', '', 1, 9, 1980, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(462, 13282569, 'Bo-0440', 'Sgto/2do', 'Daniel José', 'Oviedo Guerra', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR- Mérida', 9, 3, 1978, 'Bachiller', 'CIENCIAS ', 'residencias rio arriba edificio 4 apartamento 04-34', '4247767609', '0274-2631066', 'daniel_jog@hotmail.com ', 'Activo', 'Rescate', 'Metropolitana'),
(463, 15234352, 'Bo-0623', 'Distinguido', 'Javier Eduardo', 'Oviedo Guerra', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR', 10, 1, 1983, 'Bachiller', 'Ciencias', 'el vigía urb Carabobo vereda 4 casa 3', '', '2758814197', 'javier_eog@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(464, 16201461, 'Bo-0345', 'Sgto/2do', 'Ramón Antonio', 'Oviedo Rondon', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 9, 7, 1983, 'Bachiller', 'CIENCIAS', 'los curos parte alta v 20 casa 08', '4162745982', '2742710398', 'oviedoramon7@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(465, 16019819, 'Bo-0441', 'Sgto/2do', 'Darwin Asdrubal', 'Oyola Rolon', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 3, 2, 1983, 'Bachiller', 'CIENCIAS', 'Tovar sector los limones calle morales casa sin n°', '', '0275-4146677', 'asdrul_oyola@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(466, 13020704, 'Bo-0080', 'Teniente', 'Gesner Samuel', 'Padilla Henao', 1, 1, 1999, 'Venezolano', 'Masculino', 'ZULIA', 17, 12, 1975, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'urb Bubuqui II edf 5  piso 2 apto 0523 el vigía', '0426-4720300', '', 'gesner1_75@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(467, 17456169, 'Bo-0797', 'Cabo/1ro', 'Juan Martin ', 'Paez  Diaz ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 25, 5, 1985, 'Tecnico Medio', 'MEDICINA PREHOSPITALARIA', 'población de santo domingo sector la mitisus, casa s/n', '0416-8705438', '', 'paez903@hotmail.com', 'Activo', 'Incendio', 'Paramo'),
(468, 13676130, 'Bo-0237', 'Teniente', 'Irving Noelia', 'Páez de Guillén', 1, 4, 2001, 'Venezolano', 'Femenino', 'CARACAS', 22, 5, 1978, 'Tecnico Medio', 'RESCATE', 'sector sabaneta barrio Wilfredo Omaña', '4263101403', '', 'doria2205@hotmal.com', 'Activo', 'Rescate', 'Mocoties'),
(469, 16306840, 'Bo-0624', 'Cabo/1ro', 'Jhosman Alberto', 'Páez Vivas', 1, 9, 2005, 'Venezolano', 'Masculino', 'EL VIGIA', 7, 3, 1985, 'TSU ', '', 'ejido  sector los rosales al Miranda casa n-12', '4268712623', '0416-2729259', 'guaralillos@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(470, 11952975, 'Bo-0442', 'Sgto/2do', 'Miguel Ángel', 'Pardo', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 17, 6, 1973, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'urb Humboldt bloque 7 edificio 2 apto 03 03', '4165609216', '', 'mikkyp2004@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(471, 16906522, 'Bo-0862', 'Cabo/1ro', 'Eduard Jesus', 'Paredes  Moreno', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 8, 9, 1985, 'Tecnico Medio', 'CONSTRUCCION C IVIL', 'la meseta parte baja casa nº1-85 sabaneta Tovar', '4147539971', '2758733494', '', 'Activo', 'Conductor', 'Mocoties'),
(472, 11952815, 'Bo-0239', 'Sgto/1ro', 'Javier', 'Paredes Albornoz', 1, 4, 2001, 'Venezolano', 'Masculino', 'Merida', 18, 11, 1972, 'TSU ', 'ciencias del mfuegon resc', 'chamita  urb los bucares torre f apto3-1', '4168732510', '2742669744', 'javierparedes72@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(473, 13098650, 'Bo-0443', 'Sgto/2do', 'María Ramona', 'Paredes Albornoz', 1, 9, 2003, 'Venezolano', 'Femenino', 'Merida', 27, 12, 1976, 'Licenciado', 'CIENCIAS', 'el palmo av 2 cas 39 ejido', '4162704450', '', 'maria_32paredes@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(474, 10103420, 'Bo-0346', 'Sgto/Aydte', 'José Rafael', 'Paredes Calderón', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 28, 5, 1968, 'TSU', 'MANEJO DE EMERGENCIA  (PA', 'los c uros parte baja v 15 casa 05', '', '2742715709', 'alicate86@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(475, 17896354, 'Bo-0687', 'Cabo/2do', 'Yorman Benedicto', 'Paredes Cristancho ', 1, 1, 2006, 'Venezolano', 'Masculino', 'Merida', 21, 4, 1988, 'Tecnico Medio', 'MEDICINA DE EMERGENCIA PR', 'Carabobo vereda, 43. Casa n-8. ', '4263278926', '', 'segunda alarma@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(476, 18797381, 'Bo-0985', 'Distinguido', 'Amilcar Alejandro', 'Paredes Rámirez', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 14, 12, 1988, 'Bachiller', 'CIENCIAS', 'av. 4 entre calles 14 y 15  casa 14-47', '4247818133', '2746574538', 'amilcarpr55@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(477, 19894226, 'Bo-0919', 'Distinguido', 'Jesus David', 'Paredes Sanchez ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 3, 7, 1990, 'Tecnico Medio', 'rescate', 'la pedregosa  calle nueva Bolivia casa 56', '4262740379', '', 'david_2276@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(478, 16656598, 'Bo-0761', 'Cabo/2do', 'Maykel de Jesús', 'Paredes Torres ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 10, 6, 1985, 'Tecnico Medio', 'INFORMATICA', 'chamita via principal, casa 12-83', '4263265454', '2742665061', 'maykel-paredes1@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(479, 18797333, 'Bo-0986', 'Bombero', 'Jorge Alejandro', 'Parra Artigas', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 17, 11, 1989, 'Bachiller', 'CIENCIAS', 'ejido barrio san Isidro parte alta casa s/n ', '4164763090', '', '', 'Activo', 'Rescate', 'Metropolitana'),
(480, 12346602, 'Bo-0676', 'Sgto/2do', 'Heriberto José', 'Parra Barrios', 1, 1, 2006, 'Venezolano', 'Masculino', 'Merida', 28, 2, 1976, 'Ingeniero', 'CIVIL ARQUITECTO', 'calle principal andes Eloy blanco casa 1-53', '4161375267', '0274-2449302', 'heparrab@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(481, 18964282, 'Bo-0866', 'Bombero', 'Wagner Jesus', 'Parra Dugarte ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 2, 3, 1988, 'Tecnico Medio', 'RESCATE', 'ejido Carlos Sánchez calle 9 casa 473 ', '4267269020', '', 'wagner1@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(482, 12350538, 'Bo-0864', 'Cabo/1ro', 'Jose Albeiro', 'Parra Fernandez', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 4, 11, 1976, 'Bachiller', 'CIENCIAS', 'san juan de lagunillas, calle colon vereda santa Eduviges  casa nº3', '', '0274-2214630', 'josealbepf@gotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(483, 11467451, 'Bo-0167', 'Teniente', 'William', 'Parra Fernández', 1, 1, 2000, 'Venezolano', 'Masculino', 'Merida', 10, 6, 1974, 'Licenciado', 'EMERGENCIA PREHOSPITALARI', 'av. universidad pasaje la isla', '4164700055', '2742449451', 'parrafwilliam@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(484, 17323196, 'Bo-0509', 'Sgto/Aydte', 'Juan Carlos', 'Parra Molina', 1, 9, 2004, 'Venezolano', 'Masculino', 'TOVAR', 20, 1, 1986, 'TSU', 'Recursos Humanos', 'puente la pedregosa loma los maitines, casa n-13-1', '0416-1702904', '', 'juanchopolo_222@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(485, 19146688, 'Bo-0785', 'Cabo/1ro', 'Luís Gerardo ', 'Parra Molina ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 1, 11, 1988, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'urb don perrucho av 6 cas 401', '4160896693', '2742441960', 'lgpm_88@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(486, 16199602, 'Bo-0444', 'Sgto/2do', 'Osney Enrique', 'Parra Paredes', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 22, 2, 1983, 'Bachiller', 'CIENCIAS', 'santa Ana norte calle 2 pasaje sucre cas15-30', '', '2742440548', 'ooenriquepp@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(487, 13305889, 'Bo-0229', 'SubTeniente', 'Leidy Karina', 'Parra Rey ', 1, 4, 2001, 'Venezolano', 'Femenino', 'TACHIRA', 12, 11, 1978, 'Licenciado', 'LETRAS', 'urb el pilar ejido bloque 19 edf 01 apto 02-03', '4161388656', '0416-2785491', 'parrarey@yahoo.com', 'Activo', 'Servivida', 'Metropolitana'),
(488, 11954307, 'Bo-1045', 'Distinguido', 'René de Jesus', 'Peña', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 20, 4, 1973, 'TSU ', 'MANEJO DE EEMERGENCIAS', 'sector pinto salinas calle principal casa 0-43 santa Juana', '4266736461', '', 'rene_3839@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(489, 17130371, 'Bo-0865', 'Distinguido', 'Hector Jose', 'Peña ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 14, 11, 1979, 'Bachiller', '', 'san Jacinto vereda 2 casa 05 ', '0416-2755817', '2744141005', 'hectorjosep@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(490, 15032917, 'Bo-0235', 'Sgto/2do', 'Yan Carlis', 'Peña Altuve', 1, 4, 2001, 'Venezolano', 'Masculino', 'MÉRIDA', 23, 9, 1981, 'Tecnico Medio', 'RESCATE', 'ejido vega de la don Luis calle coromoto detrás de capilla casa sin numero ', '4162702312', '', 'jeanpena23@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(491, 11952603, 'Bo-0038', 'Teniente', 'María Betty', 'Peña Araque', 1, 3, 1996, 'Venezolano', 'Femenino', 'Merida', 21, 4, 1973, 'TSU ', 'CIENCIAS', 'av universidad  parque la isla calle principal casa 1-118', '4161047759', '2742449451', 'maribettp@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(492, 11466603, 'Bo-0240', 'Teniente', 'Yoston  Gerardo', 'Peña Araque', 1, 8, 2001, 'Venezolano', 'Masculino', 'Merida', 19, 2, 1973, 'TSU', 'AGROTECNIA', 'calle 5 de julio casa 18 ejido', '4140806053', '', 'YOSTONGERARDO39@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(493, 19752291, 'Bo-0920', 'Distinguido', 'Nayibi Estefania', 'Peña Avila', 1, 1, 2008, 'Venezolano', 'Femenino', 'Lagunillas-Merida', 7, 9, 1990, 'Tecnico Medio', 'Medicina pre-hospitalaria', 'san Juan de lagunilla sector el llano calle los peña casa s/n', '0416-9981129', '2744146616', 'pucha_1223@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(494, 17322009, 'Bo-0988', 'Distinguido', 'Edwin Josue', 'Peña Carrero', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 16, 9, 1986, 'Tecnico Medio', 'PROTECCION CIVIL', 'sabaneta Tovar', '4162762491', '', '', 'Activo', 'Incendio', 'Mocoties'),
(495, 12348223, 'Bo-0351', 'Sgto/2do', 'Liliana', 'Peña Dugarte', 1, 7, 2002, 'Venezolano', 'Femenino', 'Morro edo Merida', 6, 5, 1975, 'Licenciado', 'Enfermeria ', 'urb Carabobo calle 1 nro 19 el chama parroquia Jacinto plaza', '4267537918', '0274-2665223', 'lilidugarte2005@gimail.com', 'Activo', 'Servivida', 'Metropolitana'),
(496, 19997587, 'Bo-0990', 'Distinguido', 'Petra Emilia', 'Peña Garcia', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 3, 11, 1990, 'Tecnico Medio', 'PREHOSPITALARIA', 'av. las Américas frente al ambulatorio Venezuela casa nº1-35 Mérida', '', '2742443674', 'e_garcia22@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(497, 18620618, 'Bo-0762', 'Cabo/2do', 'Liver Simón', 'Peña González ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 24, 7, 1985, 'Bachiller', 'HUMANIDADES', 'ejido José adelmo Gutiérrez casa nº 0-30', '4160898573', '', '', 'Activo', 'Servivida', 'Metropolitana'),
(498, 18209479, 'Bo-0989', 'Bombero', 'Yonder Alexis', 'Peña Guillen', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 9, 6, 1987, 'Bachiller', 'CIENCIAS', 'av las Américas con viaducto de la  26 calle 2 sector santo domingo casa 1-', '4160122395', '', 'yonder_2109@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(499, 15755655, 'Bo-0763', 'Cabo/1ro', 'José Adolfo', 'Peña León', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 27, 9, 1981, 'Tecnico Medio', 'FINANCIERA', 'el valle sector el playon bajo casa 29 frente a la cancha deportiva', '', '2742441559', 'ADOLFMONTAINOL@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(500, 20433468, 'Bo-0921', 'Bombero', 'Luis José', 'Peña Lozano ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Mérida', 17, 1, 1990, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(501, 12780703, 'Bo-0511', 'Sgto/2do', ' Mario José', 'Peña Molina', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 22, 5, 1978, 'Bachiller', 'CIENCIAS', 'urb. el central sector las tapias', '4160874006', '', 'saemario@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(502, 17238225, 'Bo-0764', 'Sgto/2do', 'José Gregorio', 'Peña Moreno ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 3, 3, 1986, 'Bachiller', 'CIENC IAS', 'urb san miguel vereda 3 casa 2 ejido', '0416-9714532', '', 'gollo_866@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(503, 19996089, 'Bo-0991', 'Cabo/2do', 'Enereo', 'Peña Peña', 1, 1, 2009, 'Venezolano', 'Masculino', 'EL MORRO', 11, 7, 1987, 'Bachiller', 'CIENCIAS', 'la pedregosa parte bajo la vega', '0424-7341037', '', 'enereo25@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(504, 11959971, 'Bo-0626', 'Sgto/2do', 'José Leonardo', 'Peña Rangel ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 21, 3, 1976, 'TSU', 'INFORMATICA', 'urbanización el boticario calle principal casa 45 plata baja', '0426-7742847', '0274-4165207', 'leop.bomb@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(505, 11466751, 'Bo-0512', 'Cabo/2do', ' John Alexander', 'Peña Romero', 1, 9, 2004, 'Venezolano', 'Masculino', 'ARAGUA', 17, 5, 1974, 'Bachiller', 'CIENCIAS', 'urb. jj osuna los curos vereda casa Nº 21 ', '0416-2760105', '0274-2714923', 'john.20006@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(506, 19592706, 'Bo-0867', 'Bombero', 'Reinhold Adolfo', 'Peña Urbina ', 1, 1, 2008, 'Venezolano', 'Masculino', '', 11, 8, 1989, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(507, 12351315, 'Bo-0445', 'Sgto/Aydte', 'Wilmer Argenis', 'Peña Uzcategui', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida ', 27, 1, 1976, 'Licenciado', 'CIENCIAS DEL FUEGO RESCAT', 'urb.  Carabobo calle 01- casa numero 33', '0416-2755862', '0274-2665398', 'CHACHOPOCBM@HOTMAIL.COM', 'Activo', 'Servivida', 'Metropolitana'),
(508, 18637495, 'Bo-0992', 'Distinguido', 'Chayanne José', 'Peña Valencia', 1, 1, 2009, 'Venezolano', 'Masculino', 'Vigia', 19, 3, 1989, 'Licenciado', 'Teologia ', 'sector orosman rojas calle principal casa 02 el vigia ', '4247057677', '', 'fucho_man1@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(509, 16933357, 'Bo-0735', 'Cabo/2do', 'Maria Victoria', 'Peña Zambrano', 1, 9, 2006, 'Venezolano', 'Femenino', 'Merida', 17, 9, 1984, 'Bachiller', 'Ciencias', 'ejido bella vista calle lara parte baja n* 84', '4167035360', '2742219468', 'mita.17@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(510, 18310971, 'Bo-0869', 'Bombero', 'Divian G.', 'Perdomo Sequera ', 1, 1, 2008, 'Venezolano', 'Femenino', 'Mérida', 30, 10, 1988, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(511, 19929159, 'Bo-1035', 'Bombero', 'Luis Gerardo', 'Pereira Hernandez ', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 1, 4, 1988, 'Bachiller', 'CIENCIAS', 'carrera 4tº el llano frente al automarcado Marilú, casa nº 57 Tovar', '4266785951', '2752672445', 'pereiraluis_20@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(512, 13097526, 'Bo-0280', 'SubTeniente', 'Jean Manuel', 'Pereira Marquina', 1, 3, 2002, 'Venezolano', 'Masculino', 'Merida', 17, 10, 1978, 'Bachiller', 'CIENCIAS', 'urb don perrucho av 5 casa 311', '4161771624', '', 'gemelosjean@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(513, 17322520, 'Bo-0446', 'Cabo/1ro', 'Jhonatan José', 'Pereira Villegas', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 15, 4, 1986, 'TSU ', 'Administracion', 'sector el llano, calle 19 de abril, edif zora,apartamento1-1,vereda los fot', '4161324595', '2758730021', 'yopevi866@hotmail.com', 'Activo', 'Servivida', 'Mocoties');
INSERT INTO `bombero` (`1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `17`, `18`, `19`, `20`, `21`, `22`, `23`, `24`) VALUES
(514, 18150645, 'Bo-0349', 'Sgto/Aydte', 'Marco Antonio', 'Pérez ', 1, 7, 2002, 'Venezolano', 'Masculino', 'SANTA MARIA. ZULIA', 4, 2, 1978, 'Bachiller', 'CIENCIAS', 'Palmarito, sector las rurales.', '0414-7304816', '', '', 'Activo', 'Rescate', 'Panamericana'),
(515, 15516869, 'Bo-0548', 'Distinguido', 'Juan Carlos', 'Pérez Araujo', 1, 1, 2005, 'Venezolano', 'Masculino', 'Merida', 13, 1, 1981, 'Bachiller', 'CIENCIAS', 'avenida 2 lora calle 29 casa nº0-18', '4247668713', '0274-4141924', 'jcperezaraujo16@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(516, 17664498, 'Bo-0871', 'Cabo/2do', 'José Lisandro', 'Perez Briceño', 1, 1, 2008, 'Venezolano', 'Masculino', 'Mérida', 22, 6, 1985, 'Bachiller', 'CIENCIAS', 'los curos parte alta bloque 37 edificio 1 piso apartamento 3-03', '0424-7423179', '0274-2710745', '', 'Activo', 'Conductor', 'Metropolitana'),
(517, 14805998, 'Bo-0627', 'Cabo/1ro', 'Jonathan ', 'Pérez Mercado', 1, 9, 2005, 'Venezolano', 'Masculino', '', 28, 9, 1980, 'Bachiller', '', 'av Gonzalo picón pasaje 4 casa 4-25', '', '0274-2637569', 'jonaxx7@hotmail.com', 'Activo', '', 'Metropolitana'),
(518, 10719852, 'Bo-0035', 'Teniente', 'Nelsón Antonio', 'Pérez Montilla', 1, 3, 1996, 'Venezolano', 'Masculino', 'Merida', 4, 8, 1971, 'TSU', 'TECNOLOGIA BOMBERIL', 'los curos calle 4 casa 8', '4265732020', '2742715957', 'nelson66870@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(519, 16934106, 'Bo-0447', 'Sgto/1ro', 'Erikson José', 'Pérez Rivas', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 24, 10, 1984, 'Tecnico Medio', 'RESCATE', 'los llanitos de Tabay, calle la quebradita', '0426-5722276', '', 'erikson_perez@hotmail.com', 'Activo', 'Rescate', 'Paramo'),
(520, 19539766, 'Bo-0922', 'Distinguido', 'Genesis Oriana', 'Pérez Serrano', 1, 1, 2008, 'Venezolano', 'Femenino', 'EL VIGIA', 17, 12, 1990, 'Tecnico Medio', 'INCENDIO', 'el vigía', '4242090439', '0275-8819508', 'genesisorianaperez@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(521, 12776051, 'Bo-0147', 'Sgto/Aydte', 'Jhonny', 'Pérez Torres', 1, 1, 2000, 'Venezolano', 'Masculino', 'Merida', 11, 6, 1973, 'Bachiller', 'CIENCIAS', 'los curos parte alta sector la trinidad ', '0414-7570629', '0426-2442620', '', 'Activo', 'Conductor', 'Metropolitana'),
(522, 17610687, 'Bo-0994', 'Bombero', 'Gustavo Enrique', 'Pérez Valero', 1, 1, 2009, 'Venezolano', 'Masculino', 'CARACAS', 12, 9, 1987, 'Bachiller', 'CIENCIAS', 'jaji , loma del rosario casa sin °', '4164737521', '', 'kique_179@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(523, 19620297, 'Bo-0872', 'Distinguido', 'Giovanny José', 'Perez Valero ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Barinitas, Edo Barina', 11, 10, 1989, 'Tecnico Medio', 'MEDICINA PREHOSPITALARIA', 'av los próceres entrada el caucho casa 1_17', '0414-9742316', '2742459345', 'geovannyx7@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(524, 14791912, 'Bo-0350', 'Cabo/1ro', 'Simón Ali', 'Pernia Devia', 1, 7, 2002, 'Venezolano', 'Masculino', '', 18, 10, 1981, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(525, 14131802, 'Bo-0037', 'Teniente', 'Yureima del Valle', 'Pernia Guerrero', 1, 2, 1999, 'Venezolano', 'Femenino', 'TOVAR', 23, 11, 1979, 'TSU ', 'Ciencias', 'urb. don Luis call.4 manzana 9 casa 19', '4266114933', '0274-7891625', 'yumaiker24@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(526, 12930023, 'Bo-0514', 'Cabo/1ro', 'José Branger', 'Pernia Rivas', 1, 9, 2004, 'Venezolano', 'Masculino', 'TOVAR', 16, 12, 1973, 'Bachiller', 'Ciencias', 'Ejido, urb. padre duque calle 6 casa 10', '', '0274-2218192', 'branger_29@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(527, 15295535, 'Bo-0765', 'Distinguido', 'Gabriel', 'Pinilla Dugarte ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 28, 9, 1982, 'Tecnico Medio', 'INFORMATICA', 'av. 16 de septiembre urb. Juan 23 bloque c piso 2 apto 31 Mérida', '4125808215', '', 'mistersatan@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(528, 19421082, 'Bo-0798', 'Cabo/1ro', 'Pedro Miguel', 'Pinto Rojas ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 4, 12, 1988, 'Tecnico Medio', 'RESCATE', 'av las Américas residencia rio arriba e 13 apto 13-21', '4165785952', '', 'MIGUELpioazul@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(529, 19539334, 'Bo-1036', 'Bombero', 'Blender Smith', 'Piña Pereira', 1, 1, 2009, 'Venezolano', 'Masculino', 'EL VIGIA', 12, 5, 1989, 'Bachiller', 'CIENCIAS', 'caño seco ii calle 2 casa 13', '4247343255', '', 'blendersmith@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(530, 11612913, 'Bo-0039', 'Cabo/1ro', 'Edgar', 'Pire Valecillos', 1, 3, 1996, 'Venezolano', 'Masculino', 'Trujillo', 18, 2, 1974, 'Bachiller', '', 'nueva Bolivia, sector san Isidro', '0424-7348215', '0271-4144313', 'epirevalecillos@yahoo.con', 'Activo', 'Incendio', 'Panamericana'),
(531, 20432744, 'Bo-0923', 'Bombero', 'Josue Andres', 'Pirela Salas ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 23, 12, 1988, 'Tecnico Medio', 'RESCATE', 'los curos vereda 10 casa 06', '', '2742714084', 'josueandres_19@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(532, 20394146, 'Bo-0995', 'Bombero', 'Danfre America', 'Planchez Moreno', 1, 1, 2009, 'Venezolano', 'Femenino', 'TOVAR', 15, 8, 1988, 'BACHILLER', 'CIENCIAS', 'santa cruz de mora sector Alberto Rabell calle principal c-3 -1', '4147537129', '', 'planches _20@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(533, 10714184, 'Bo-0040', 'Sgto/Aydte', 'José Ramón', 'Plaza Sosa ', 1, 2, 1999, 'Venezolano', 'Masculino', 'MERIDA', 25, 6, 1970, 'Bachiller', 'Ciencias', 'el arenal bloque nº‚05 apto. 00-04', '0426-9496719', '0274-6588315', 'joseplaza70@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(534, 14806284, 'Bo-0352', 'Sgto/1ro', 'Miguel Angel', 'Plaza Villarreal', 1, 7, 2002, 'Venezolano', 'Masculino', 'CARACAS', 23, 3, 1978, 'Licenciado', 'RESCATE', 'santa Ana norte calle 2 pasaje sucre ', '4168764676', '', 'miguelplaza97@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(535, 18619625, 'Bo-0786', 'Cabo/2do', 'Juan Jose', 'Plaza Villarreal ', 1, 2, 2007, 'Venezolano', 'Masculino', '', 2, 2, 1987, 'Tecnico Medio', '', 'santa Ana norte torre 8 piso 1 apto 01-02', '', '0274-2459654', 'guanchoplaza_22@hotmail.com', 'Activo', '', 'Metropolitana'),
(536, 16664516, 'Bo-0353', 'Cabo/1ro', 'Franklin Enrique', 'Porras ', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 12, 1, 1984, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'irb Carlos Sánchez calle 6 casa 269 ejid', '4140745462', '', 'porras40@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(537, 17129014, 'Bo-0448', 'Cabo/2do', 'Miguel Daniel', 'Porras Zambrano', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 10, 10, 1984, 'Bachiller', 'CIENCIAS', 'Urbanización Carabobo vereda 30 casa numero 12', '4247386129', '', '', 'Activo', 'Servivida', 'Metropolitana'),
(538, 12049596, 'Bo-0628', 'Cabo/2do', 'Ángel Vitalio', 'Posadas Márquez', 1, 9, 2005, 'Venezolano', 'Masculino', 'Guaraque-Mérida', 19, 8, 1973, 'Bachiller', 'Humanidades', 'san francisco vía a guaraquee calle principal casa sin numero', '4165727471', '2754148249', '', 'Activo', 'Conductor', 'Metropolitana'),
(539, 7992746, 'Bo-0134', 'Sgto/Aydte', 'Carlos Roman', 'Pretto Pérez', 1, 2, 2000, 'Venezolano', 'Masculino', 'LA GUAIRA', 9, 8, 1968, 'Tecnico Medio', 'INCENCIO', 'conjunto residencias José María Vargar el corozo, edf.29 apto-29-1', '4267732139', '2758731060', 'carlospre89@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(540, 14699559, 'Bo-0354', 'Sgto/2do', 'José Luís', 'Prieto Colmenares', 1, 7, 2002, 'Venezolano', 'Masculino', 'Mèrida', 1, 10, 1980, 'Tecnico Medio', 'Electrionica', 'el vigía urb Carabobo vda 8 casa nª 3', '0426-7270744', '', 'joseluisp_1010@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(541, 11605505, 'Bo-0355', 'Sgto/Aydte', 'Keila Josefina', 'Prieto García', 1, 7, 2002, 'Venezolano', 'Femenino', 'MARACAIBO', 15, 12, 1972, 'Tecnico Medio', 'ADMINISTRACION POLICIAL', 'el vigia urb. villa de los ángeles calle 1 casa nº28', '0424-6871864', '0275-8828880', 'chiritalinda@yahoo.es', 'Activo', 'Servivida', 'Panamericana'),
(542, 14022810, 'Bo-1220', 'Bombero', 'Ricardo Antonio', 'Prieto Parra', 1, 6, 2009, 'Venezolano', 'Masculino', 'EL VIGIA', 17, 12, 1976, 'Bachiller', 'CIENCIAS', 'el vigia  bubuqui  II', '', '2758819360', '', 'Activo', 'Conductor', 'Panamericana'),
(543, 17663205, 'Bo-0516', 'Sgto/2do', 'Anderson Steven', 'Puccini Toro', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 28, 9, 1985, 'Tecnico Medio', 'RESCATE', 'san Juan de lagunillas barrio la cordillera casa 3', '4266700858', '', 'elguajis20@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(544, 19144145, 'Bo-0688', 'Cabo/2do', 'Eddinson Alberto', 'Puccini Toro ', 1, 1, 2006, 'Venezolano', 'Masculino', 'Merida', 4, 6, 1988, 'Tecnico Medio', 'incendio', 'san Juan de lagunillas barrio la cordillera casa 3', '4268048670', '2742446184', 'eddinsonpuccini@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(545, 14962800, 'Bo-0449', 'Sgto/2do', 'Richard Clodomiro', 'Pulido Viloria', 1, 9, 2003, 'Venezolano', 'Masculino', 'EL VIGIA', 9, 9, 1982, 'TSU ', 'MEDICINA DE EMERGENCIA PR', 'av los próceres sector san Isidro parte media casa 16', '4164099419', '', 'pulidov@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(546, 18577557, 'Bo-0998', 'Bombero', 'Stella Maris', 'Quevedo Zambrano', 1, 1, 2009, 'Venezolano', 'Femenino', 'TOVAR', 21, 7, 1987, 'Bachiller', 'HUMANIDADES', 'urb monseñor moreno vereda11 casa 2 Tovar', '0426-2771975', '2758733546', 'maris_quevedo21@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(547, 15694782, 'Bo-0997', 'Bombero', 'Johan Climaco', 'Quevedo Zambrano', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 20, 2, 1983, 'Bachiller', 'HUMANIDADES', 'sector monseñor moreno vereda 11 casa 2 Tovar', '', '2758733546', 'johan83gd@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(548, 17664083, 'Bo-0629', 'Bombero', 'Egdomar Antonio', 'Quintero Araujo', 1, 9, 2005, 'Venezolano', 'Masculino', 'ESTADO LARA', 2, 1, 1987, 'Tecnico Medio', 'CONTABILIDAD', 'chamita calle los cedros casa- 1-345', '0414-7062566', '', 'russo_nene@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(549, 17455064, 'Bo-0799', 'Cabo/2do', 'Yeifrey Jornadely', 'Quintero Calderon ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 3, 7, 1986, 'Bachiller', 'CIENCIAS', 'urb cara bobo vereda  3  casa 09', '', '2742665218', 'yeifrey@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(550, 12778893, 'Bo-0450', 'Cabo/1ro', 'Luís Danilo', 'Quintero Cetina', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 5, 8, 1977, 'Bachiller', 'Ciencias', 'san juan de lagunillas call. cementerio casa-004', '0426-4721569', '', 'luis2895@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(551, 13230295, 'Bo-0451', 'Sgto/1ro', 'Euro Ramón', 'Quintero Contreras', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 26, 1, 1978, 'Tecnico Medio', '', 'barrio libertado calle 02 san cristo casa 03/32 ', '4263784234', '0276-4161590', 'euroquintero06@hotmail.com', 'Activo', '', 'Mocoties'),
(552, 15754178, 'Bo-0231', 'Sgto/1ro', 'Omar Alexis', 'Quintero Diaz ', 1, 4, 2001, 'Venezolano', 'Masculino', 'Merida', 7, 8, 1981, 'Bachiller', 'rescate', 'los curos parte alta edificio 03 apartamento 00_01', '4160488404', '2744154838', 'bald22@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(553, 19422562, 'Bo-0900', 'Distinguido', ' Jonathan Iskel', 'Quintero Dugarte', 1, 1, 2008, 'Venezolano', 'Masculino', 'Mérida', 1, 9, 1988, 'Tecnico Medio', 'MEDICINA DE EMERGENCIA PR', 'los curos parte alta vereda  27 casa 02', '0426-7299754', '2742716012', 'jhonatan_97@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(554, 11465359, 'Bo-0170', 'SubTeniente', 'Efrén', 'Quintero Dugarte', 1, 1, 2000, 'Venezolano', 'Masculino', 'BARINAS', 9, 6, 1970, 'TSU ', 'RESCATE', 'los curos parte alta vereda  27 casa 02', '4247817948', '2742716012', '', 'Activo', 'Incendio', 'Metropolitana'),
(555, 15622973, 'Bo-0357', 'Sgto/Aydte', 'Juan Francisco', 'Quintero Dugarte', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 1, 8, 1980, 'TSU', 'TECNOLOGIA BOMBERIL', 'los curos parte alta vereda  27 casa 02', '4160783597', '2742716012', 'juanquindu@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(556, 15622971, 'Bo-0356', 'Sgto/Aydte', 'Javier', 'Quintero Dugarte', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 24, 11, 1982, 'TSU', 'TECNOLOGIA BOMBERIL', 'los curos parte alta vereda  27 casa 02', '4168738129', '2742716012', 'javierquintero25@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(557, 17436415, 'Bo-0630', 'Cabo/1ro', 'Luís Urbano', 'Quintero Fonseca ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 11, 10, 1984, 'Bachiller', 'CIENCIAS', 'pueblo nuevo, las casitas vereda 9 casa 20', '0426-8033256', '', 'luisneo327@hotmail.com', 'Activo', '', 'Metropolitana'),
(558, 14401598, 'Bo-0631', 'Cabo/1ro', 'Eduardo José', 'Quintero Mercado', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 17, 4, 1979, 'Bachiller', 'CIENCIAS', 'urb carabobo vda 40 casa 05', '0274-2668989', '', 'e_quintero_17@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(559, 16656725, 'Bo-0766', 'Sgto/2do', ' Juan Carlos', 'Quintero Navas', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida ', 6, 12, 1985, 'TSU ', 'EMERGENCIA PREHOSPITALARI', 'el chama vereda 53 casa 5', '', '0274-2665890', 'CARLOSQUINTER@HOTMIL.COM', 'Activo', 'Servivida', 'Metropolitana'),
(560, 18309899, 'Bo-0518', 'Cabo/1ro', 'Darwin Alberto', 'Quintero Quintero ', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 20, 12, 1987, 'Tecnico Medio', 'RESCATE', 'urb. los curos pate baja. vereda n05 caa nº5 sector el entable', '', '4247326067', 'lalo_daq@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(561, 20142002, 'Bo-0999', 'Bombero', 'Jose Eduardo', 'Quintero Rujano', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 6, 4, 1988, 'Bachiller', 'ciencias', 'el vigia barrio ali primera calle principal casa 0/06', '4160760728', '275', 'joeqru.@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(562, 20434312, 'Bo-0924', 'Bombero', 'Edixon Alejandro', 'Quintero Salazar ', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR', 28, 10, 1990, 'Tecnico Medio', 'BOMBERO', ' Tovar calle los limnones casa 00/17', '4266727549', '', 'eaqs_28_10@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(563, 8049569, 'Bo-0041', 'SubTeniente', 'Luís Eduardo', 'Quintero Suárez ', 1, 3, 1990, 'Venezolano', 'Masculino', 'Merida', 28, 11, 1966, 'Tecnico Medio', 'INCENDIO', 'la parroquia barrio candelaria casa 9', '4164738011', '4164738011', '', 'Activo', 'Incendio', 'Metropolitana'),
(564, 14917093, 'Bo-0519', 'Sgto/2do', 'Javier José', 'Quintero Torres', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 6, 2, 1981, 'Tecnico Medio', 'MEDICINA PREHOSPITALARIA', 'sector zumba la parroquia', '', '4164776920', '', 'Activo', 'Servivida', 'Metropolitana'),
(565, 18308956, 'Bo-0787', 'Cabo/1ro', 'Jose Jesus ', 'Quintero Villasmil ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 21, 8, 1986, 'Bachiller', 'CIENCIAS', ' res. cardenal quintero torre 09 apartamento 3-4', '4147480862', '0274-2454076', 'quinterojj@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(566, 18308180, 'Bo-0767', 'Cabo/1ro', 'Pedro Daniel', 'Quiñones Ruiz', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 2, 6, 1986, 'Bachiller', 'CIENCIAS', 'santa elena calle 4 cas 7-27', '0274-6572635', '4141771559', 'pdqr1211_8@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(567, 15235265, 'Bo-0632', 'Cabo/1ro', 'Francisco José', 'Ramírez ', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR ', 28, 11, 1982, 'Bachiller', 'CIENCIAS', 'Tovar el rosal calle 4 casa s-n', '0426-3116077', '0275-8734294', 'FRANK_2811@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(568, 16305331, 'Bo-0452', 'Distinguido', 'Ronnie Charles', 'Ramírez Araque', 1, 9, 2003, 'Venezolano', 'Masculino', 'EL VIGIA', 1, 6, 1983, 'Bachiller', 'CIENCIAS', 'caño seco ii, calle 14 casa nº3-8  el vigia', '', '4147537789', '', 'Activo', 'Incendio', 'Panamericana'),
(569, 16350817, 'Bo-0453', 'Cabo/2do', 'Juan Pablo', 'Ramírez Bohórquez', 1, 9, 2003, 'Venezolano', 'Masculino', 'CAJA  SECA', 14, 10, 1983, 'Bachiller', 'CIENCIAS', 'muyapa calle 2 casa 4010 nueva bolivia', '', '4269714896', '', 'Activo', 'Incendio', 'Panamericana'),
(570, 11960206, 'Bo-0875', 'Distinguido', 'Jose Maximiano', 'Ramirez Cardenas', 1, 1, 2008, 'Venezolano', 'Masculino', 'MERIDA', 3, 10, 1975, 'Bachiller', 'CIENCIAS', 'la otra banda arriba sector boca de monte via bella vista chiguara', '4262738975', '2745114694', 'JOSEMAXIMIANORAMIREZ@GIMAIL.COM', 'Activo', 'Conductor', 'Mocoties'),
(571, 11956574, 'Bo-0550', 'Cabo/2do', 'Delci Josefina', 'Ramírez Castillo', 1, 1, 2005, 'Venezolano', 'Femenino', 'NUEVA BOLIVIA', 10, 1, 1971, 'Bachiller', 'CIENCIAS', 'manzano bajo calle el bosque ejido', '4268036589', '2744170536', 'delcijosefinaramirezcastillo@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(572, 10902167, 'Bo-0081', 'Sgto/1ro', 'Eneida del Valle', 'Ramírez Contreras', 1, 1, 1999, 'Venezolano', 'Femenino', 'TOVAR', 16, 4, 1972, 'Bachiller', '', 'sector el carrizal calle principal', '0426-6025360', '0275-9882062', 'eneida_ramirez72@hotmail.com', 'Activo', '', 'Mocoties'),
(573, 16933080, 'Bo-0520', 'Sgto/2do', 'Jesmis Carolina', 'Ramírez de Barrios', 1, 9, 2004, 'Venezolano', 'Femenino', 'Merida', 14, 6, 1984, 'Tecnico Medio', 'RESCATE', 'el arenal urb los frailes torre 3 aptp pb-5', '', '2745111004', 'jcarolina2009@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(574, 17129280, 'Bo-0876', 'Bombero', 'Nestor Jose', 'Ramirez Fernandez', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 15, 1, 1986, 'Tecnico Medio', 'Rescate', 'av  los  próceres entrada al caucho0426-8797150', '', '', '', 'Activo', 'Rescate', 'Metropolitana'),
(575, 16657144, 'Bo-0454', 'Sgto/1ro', 'Daniel Alberto', 'Ramírez León', 1, 9, 2003, 'Venezolano', 'Masculino', '', 27, 7, 1983, 'TSU ', '', 'sector el valle la vega pácela 8 casa s/n', '4168052801', '', 'danielramirezlcon@hotmail.com', 'Activo', '', 'Metropolitana'),
(576, 17662170, 'Bo-0736', 'Sgto/2do', 'Rossana Carolina', 'Ramírez Mora ', 1, 9, 2006, 'Venezolano', 'Femenino', 'VALENCIA', 28, 10, 1985, 'TSU ', 'ADMINISTRACION', 'urb carlos sanchez calle 2 casa 65 ejido', '0424-7017553', '0274-2219366', 'ROSSI_813@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(577, 16655243, 'Bo-0768', 'Distinguido', 'Yonn Esteben', 'Ramírez Porras ', 1, 9, 2006, 'Venezolano', 'Masculino', '', 29, 5, 1985, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(578, 12487012, 'Bo-0358', 'Sgto/2do', 'William Oswaldo', 'Ramírez Ramírez', 1, 7, 2002, 'Venezolano', 'Masculino', '', 27, 11, 1976, 'Bachiller', '', 'urb san francisco torre 4, piso 2, apto 2-2', '', '', 'willian.76@hotmail.com', 'Activo', '', 'Metropolitana'),
(579, 10902865, 'Bo-0095', 'Cabo/2do', 'José Orlando', 'Ramírez Rujano', 1, 1, 2000, 'Venezolano', 'Masculino', 'TOVAR', 16, 6, 1971, 'Bachiller', '', 'el vigia la pedeca calle principal casa 58', '0426-3491053', '0275-9008821', 'orlando_343_caracas@hotmail.con', 'Activo', 'Conductor', 'Panamericana'),
(580, 13967883, 'Bo-0082', 'Sgto/Aydte', 'Renne Alexander', 'Ramírez Sepulveda', 1, 1, 1999, 'Venezolano', 'Masculino', '', 10, 9, 1979, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(581, 18797939, 'Bo-0689', 'Distinguido', 'Daniel Orlando', 'Ramírez Vargas ', 1, 1, 2006, 'Venezolano', 'Masculino', 'Mérida', 10, 11, 1987, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(582, 20218146, 'Bo-1037', 'Distinguido', 'Dubraska Paola', 'Ramirez Vega', 1, 1, 2009, 'Venezolano', 'Femenino', '', 27, 11, 1990, 'Bachiller', 'cuencias', 'monseñor moreno Tovar estado Mérida', '', '4149710511', '', 'Activo', 'Rescate', 'Mocoties'),
(583, 16019547, 'Bo-0878', 'Cabo/1ro', 'Antonio Jose', 'Ramirez Vega', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR', 20, 1, 1984, 'Bachiller', ' CIENCIAS', 'el amparo Tovar casa 129 calle las vegas', '4266134204', '', '', 'Activo', 'Conductor', 'Mocoties'),
(584, 17769942, 'Bo-0879', 'Cabo/1ro', 'Nestor Elias', 'Ramirez Vega', 1, 1, 2008, 'Venezolano', 'Masculino', '', 8, 11, 1987, 'Bachiller', '', '', '', '0275-2053468', 'nestorelias87@hotmail.com', 'Activo', '', 'Mocoties'),
(585, 13013932, 'Bo-0677', 'Sgto/2do', 'Rosa Alejandra', 'Ramírez Vega', 1, 1, 2006, 'Venezolano', 'Femenino', 'TOVAR', 11, 3, 1978, 'Licenciado', 'bioanalisis', 'residencias centenario edif 7 piso 2 apto 23 ejido', '0274-2210371', '0416-4700089', '', 'Activo', '', 'Mocoties'),
(586, 17696787, 'Bo-1001', 'Cabo/2do', 'Adrian Jesus', 'Ramos Gómez', 1, 1, 2009, 'Venezolano', 'Masculino', 'EL VIGIA', 28, 10, 1987, 'Bachiller', 'ciencias', 'capazón, santa Elena de arenales, casa n- 3 ', '4241038735', '2754147489', 'l_hayqvivirla@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(587, 16654032, 'Bo-0455', 'Cabo/2do', 'William Antonio', 'Rangel Altuve', 1, 9, 2003, 'Venezolano', 'Masculino', '', 31, 1, 1985, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Mocoties'),
(588, 13098706, 'Bo-0521', 'Cabo/2do', 'José Ricardo', 'Rangel Briceño ', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 4, 11, 1977, 'Bachiller', 'Ciencias', 'ejido el pilar calle Urdaneta edificio 1 bloque 25 piso 2 apto 0201', '0426-7729477', '0274-7897482', 'ricardo_r_rangel@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(589, 12351093, 'Bo-0678', 'Sgto/2do', 'Eugenia Yanira', 'Rangel Briceño ', 1, 1, 2006, 'Venezolano', 'Femenino', 'Merida', 18, 12, 1974, 'Licenciado', 'BIOANALISIS', 'av las Américas, calle san Juan bautista, casa 2-3', '4161384552', '2742445144', 'eugenia.rangel@ymail.com', 'Activo', 'Rescate', 'Metropolitana'),
(590, 14107585, 'Bo-0522', 'Distinguido', ' José Armando', 'Rangel Dávila', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 21, 6, 1979, 'Bachiller', 'CIENCIAS', 'san Jacinto calle principal frente al conscripto militar casa 0-31 a', '', '4161365156', 'joserangeldavila79@yahoo.es', 'Activo', 'Conductor', 'Metropolitana'),
(591, 12348328, 'Bo-0523', 'Cabo/1ro', 'Braulio Humberto', 'Rangel Dávila', 1, 9, 2004, 'Venezolano', 'Masculino', 'MUCUCHIES', 22, 7, 1976, 'Bachiller', 'CIENCIAS', 'mucuchies calle arzobispo chacón, casa nº18 ', '', '4247814437', 'rangelbrau22@hotmail.com', 'Activo', 'Rescate', 'Paramo'),
(592, 15517120, 'Bo-0359', 'Sgto/1ro', 'Roselly ', 'Rangel Dominguez.', 1, 7, 2002, 'Venezolano', 'Femenino', 'Merida', 12, 2, 1981, 'TSU ', 'Educacion Especial mencio', 'los curos sector el entable vereda 3 casa 4', '', '4160895713', 'la_polla24@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(593, 18964568, 'Bo-0880', 'Cabo/1ro', 'Deiwins Alexander', 'Rangel Marin', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 24, 4, 1989, 'Bachiller', 'CIENCIAS ', 'sector campo de oro calle 2 casa º2-77', '', '0274-2630760', 'rangel_244@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(594, 18124883, 'Bo-0769', 'Sgto/2do', 'Darwins Alexis', 'Rangel Marín ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida ', 16, 8, 1987, 'Bachiller', 'CIENCIAS ', 'sector campo de oro calle 2 casa º2-77', '0274-2630760', '', 'darwuin_rangel@hotamil.com', 'Activo', 'Servivida', 'Metropolitana'),
(595, 13022631, 'Bo-0042', 'Sgto/2do', 'José Rafael', 'Rangel Márquez', 1, 2, 1999, 'Venezolano', 'Masculino', 'EL VIGIA', 30, 8, 1973, 'Bachiller', '', 'caño seco i sector las colinas calle 5 casa 4', '', '', '', 'Activo', 'Servivida', 'Panamericana'),
(596, 19503324, 'Bo-0925', 'Cabo/2do', 'Francis Nathaly', 'Rangel Matheus', 1, 1, 2008, 'Venezolano', 'Femenino', '', 24, 5, 1990, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(597, 11960717, 'Bo-0256', 'SubTeniente', 'Reissig Darwin', 'Rangel Medina', 1, 1, 2002, 'Venezolano', 'Masculino', 'Merida', 20, 4, 1974, 'Licenciado', 'MENCION BOMBERO', 'santa Elena calle el paraíso', '4262760245', '0274-2639239', '', 'Activo', 'Incendio', 'Metropolitana'),
(598, 8044169, 'Bo-0043', 'Teniente', 'José Sabino', 'Rangel Paredes', 1, 6, 1996, 'Venezolano', 'Masculino', 'Merida', 13, 12, 1966, 'Tecnico Medio', 'BOMBERO', 'barrio campo de oro calle 2, casa nº2 -77 Mérida', '4166729809', '4161771586', 'ranjosabino@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(599, 17771125, 'Bo-1002', 'Bombero', 'Ronald Leonel', 'Rangel Pereira', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 11, 3, 1987, 'Bachiller', 'CIENCIAS', 'la vega Tovar calle 3, casa nº127 ', '4265710900', '', 'ronal_yan_27@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(600, 18938875, 'Bo-1221', 'Bombero', 'Luz Andreina', 'Rangel Rodelo', 1, 6, 2009, 'Venezolano', 'Femenino', 'EL VIGIA', 14, 8, 1990, 'Tecnico Medio', 'ENFERMERIA COMUNITARIA', 'tucani, sector unión calle 5 vrda 1 casa sin numero', '', '426772938', 'luzandreina_15@yahoo.es', 'Activo', 'Servivida', 'Panamericana'),
(601, 18577655, 'Bo-1003', 'Bombero', 'Henry Yordany', 'Rangel Rosales', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR estado Mérida', 10, 4, 1987, 'Bachiller', 'CIENCIAS', 'el llano sector vista alegre calle la galera casa s/n, Tovar', '4160770171', '2759887330', 'pihenry_190487@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(602, 17895725, 'Bo-0525', 'Cabo/2do', 'Wilmer Efrén', 'Reinoza', 1, 9, 2004, 'Venezolano', 'Masculino', '', 26, 9, 1984, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(603, 15042124, 'Bo-0881', 'Cabo/1ro', 'Wilmer Antonio', 'Reinoza Molina', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 23, 2, 1979, 'Tecnico Medio', 'INFORMATICA', ' san Juan de lagunillas av principal', '0424-7574423', '', 'WILMERANREIMOL@HOTMAIL.COM', 'Activo', 'Conductor', 'Metropolitana'),
(604, 13245316, 'Bo-0770', 'SubTeniente', 'Ricardo Rodolfo', 'Rey  García', 1, 9, 2006, 'Venezolano', 'Masculino', 'CARACAS', 28, 11, 1977, 'TSU', 'RELACIONES INDUSTRIALES', 'av las Américas res. monseñor chacón torre o apto 7-4', '4166725964', '4166725964', 'ricardorey1@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(605, 10714053, 'Bo-0136', 'SubTeniente', 'Omar Darío', 'Rincón Quintero', 2, 5, 1995, 'Venezolano', 'Masculino', 'Merida', 26, 8, 1970, 'Tecnico Medio', 'RESCATE', 'el caña sector  la mesita calle principal', '4269713492', '4269713492', '', 'Activo', 'Rescate', 'Metropolitana'),
(606, 18637933, 'Bo-0882', 'Bombero', 'Jean jose', 'Rincon Sanchez', 1, 1, 2008, 'Venezolano', 'Masculino', 'VIGIA', 18, 4, 1985, 'Tecnico Medio', 'Rescate', 'urb. Páez  sector 1 casa   nº02', '4160485120', '2758821870', 'jeanm_banban_@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(607, 13014412, 'Bo-0456', 'Sgto/1ro', 'Jonas Alexander', 'Rincón Vásquez', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 4, 2, 1978, 'Bachiller', 'CIENCIAS', 'urb Carabobo calle 3 casa 31', '', '2742665527', 'jjonasrrincon@yahoo.com', 'Activo', 'Rescate', 'Metropolitana'),
(608, 15943566, 'Bo-0636', 'Distinguido', 'Gregorio Ernesto', 'Rivas ', 1, 9, 2005, 'Venezolano', 'Masculino', 'valera', 3, 3, 1984, 'Bachiller', 'ciencias', 'el cerro via Palmira arapuey casa s/n', '0426-2111722', '', 'gregorio_rivas8@hotmsil.com', 'Activo', 'Servivida', 'Panamericana'),
(609, 16907119, 'Bo-0457', 'Cabo/2do', 'Rosiberth Sohay', 'Rivas Altuve', 1, 9, 2003, 'Venezolano', 'Femenino', 'CAJA SECA ESTADO ZULIA', 28, 11, 1985, 'Bachiller', 'CIENCIAS', 'urb. Carabobo calle principal frente a la estación del chama casa nº 6', '4161197569', '', 'rosiberth_rivas@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(610, 19895870, 'Bo-1222', 'Cabo/2do', 'Jesus Enrique', 'Rivas Araujo', 1, 6, 2009, 'Venezolano', 'Masculino', 'Merida', 30, 6, 1990, 'Bachiller', 'CIENCIAS EN TECNOLOGIA', 'san Juan de lagunillas, final calle colon casa s-n', '0416-1793388', '2746571618', 'enrique_rivas.a@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(611, 16444524, 'Bo-0633', 'Cabo/1ro', 'Yorki Antonio', 'Rivas Cadenas ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 28, 7, 1980, 'Bachiller', 'CIENCIAS', 'campo de oro calle 3 casa 03121', '', '4269701065', 'yarc158@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(612, 16020589, 'Bo-1004', 'Distinguido', 'Ruben Alexis', 'Rivas Contreras', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 28, 10, 1983, 'Bachiller', 'HUMANUDADES', 'los limones Tovar casa 2-20', '4162714616', '2758734087', 'ruben2810@hotmail.es', 'Activo', 'Incendio', 'Mocoties'),
(613, 16934740, 'Bo-0634', 'Sgto/1ro', 'Tonny Jhon', 'Rivas Fernández', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 27, 7, 1985, 'TSU ', 'CNTABILIDD', 'urb padre duque calle 6 casa 9', '0274-2217389', '0416 9987878', 'tonnyrivas_@hotmail.com', 'Activo', 'SERVIVIDA', 'Metropolitana'),
(614, 19486927, 'Bo-1005', 'Bombero', 'Yonny Javier', 'Rivas Garcia', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 13, 4, 1989, 'Bachiller', 'Ciencias', 'santa cruz de mora aldea el guayabal, casa n-5-135', '4266288919', '2752054138', 'yonnyrivas123@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(615, 17894768, 'Bo-0800', 'Distinguido', 'Jerry Jesús', 'Rivas Landaeta ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida ', 17, 4, 1986, 'Tecnico Medio', 'PREHOSPITALARIA', 'el chama, calle tamanaco pasaje los quijotes, casa nº2-39 Mérida', '4264737412', '', 'rescue_73@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(616, 13577615, 'Bo-0883', 'Distinguido', 'Jose Luis', 'Rivas Peña', 1, 1, 2008, 'Venezolano', 'Masculino', ' Aracay las piedras municipio cardenal quintero', 19, 1, 1978, 'bachiller', 'ciencias', 'av. principal chamita calle jerez frente al terminal ', '4160716280', '2744167391', 'jose.rivas24@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(617, 18309639, 'Bo-1223', 'Bombero', 'Leonel Javier', 'Rivas Sanchez', 1, 6, 2009, 'Venezolano', 'Masculino', 'Merida', 30, 10, 1988, 'Bachiller', 'CIENCIAS', 'san rfael de mucuchies', '4263719202', '2744771435', 'elrivas_leo@hotmail.com', 'Activo', 'Incendio', 'Paramo'),
(618, 19421121, 'Bo-1006', 'Bombero', 'Rosbely del Milagro', 'Rivas Uzcategui', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 2, 2, 1988, 'Bachiller', 'CIENCIAS', 'ejido bella  vista calle las flores ', '', '0414-7285739', 'rosbe_2@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(619, 10102174, 'Bo-0361', 'Sgto/1ro', 'Jesús Alberto', 'Rivera ', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 11, 7, 1970, 'Tecnico Medio', 'RESCATE', 'el salado medio sector jalisco casa 38 ejido', '0424-7338258', '0274-2219438', 'rescate0770@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(620, 14762157, 'Bo-0459', 'Cabo/1ro', 'Giovanny Alirio', 'Rivera  ', 1, 9, 2003, 'Venezolano', 'Masculino', 'VIGIA', 24, 8, 1978, 'Bachiller', 'CIENCIAS', 'urb. caño seco 4 edf. 20 apto 02-01 ', '', '0426-571-5108', 'giovannyrivera_1978@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(621, 18966644, 'Bo-1007', 'Cabo/2do', 'Juan Alfonso', 'Rivera Avendaño', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 25, 5, 1986, 'Bachiller', 'CIENCIAS', 'el valle sector pardo verde casa 32', '', '2748083645', 'alfoso_@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(622, 16656310, 'Bo-0460', 'Cabo/1ro', 'Luís Fernando', 'Rivera Rivera', 1, 9, 2003, 'Venezolano', 'Masculino', 'merida', 18, 11, 1983, 'Tecnico Medio', 'RESCATE', 'av 8 calle 19 sector belén casa 18-75', '0414-7171605', '', 'luismerida_5101@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(623, 18209772, 'Bo-1047', 'Distinguido', 'Jhan Carlo', 'Rivera Rodriguez', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 20, 3, 1988, 'Tecnico Medio', 'RESCATE', '  añil final de la calle 6', '4262199159', '2754115923', 'jhan_rivera@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(624, 16316956, 'Bo-0360', 'Sgto/1ro', 'Oscar   ', 'Rivera Rodríguez', 1, 7, 2002, 'Venezolano', 'Masculino', 'TOVAR', 22, 1, 1984, 'Bachiller', 'Humanidades', 'sector la lagunita Tovar ', '4262120951', '0275/5147919', 'oscar22198058@yohoo', 'Activo', 'Incendio', 'Mocoties'),
(625, 10711486, 'Bo-0526', 'Cabo/1ro', 'Ricardo Giovanny ', 'Roa Liscano', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 12, 7, 1969, 'Licenciado', 'MEDICINA EMERGENCIA PREHO', 'la vega de zumba calle principal cas 29', '0426-8719371', '0274-6577089', 'ricardoroa69@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(626, 17488570, 'Bo-1008', 'Distinguido', 'Dervis Enrique', 'Roa Roman', 1, 1, 2009, 'Venezolano', 'Masculino', 'CARACAS', 15, 9, 1985, 'Tecnico Medio', 'INFORMATICA', 'Tovar urbanización José María Vargas 30-2', '4266742283', '2758733458', 'cristoenvegel@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(627, 16934450, 'Bo-0563', 'Cabo/2do', 'Jasnell Daviana', 'Robles Ruiz', 1, 2, 2005, 'Venezolano', 'Femenino', 'Merida', 13, 1, 1986, 'Bachiller', 'CIENCIAS', 'urb la alameda sector zumba casa 23', '', '4145056878', '', 'Activo', 'Servivida', 'Metropolitana'),
(628, 15573416, 'Bo-0886', 'Bombero', 'Jhon Franco', 'Rodriguez ', 1, 1, 2008, 'Venezolano', 'Masculino', '', 31, 7, 1979, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(629, 13967778, 'Bo-0275', 'Sgto/Aydte', 'Roberto Antonio', 'Rodríguez Castañeda', 1, 3, 2002, 'Venezolano', 'Masculino', 'Merida', 6, 10, 1978, 'Tecnico Medio', 'MECANICA AUTOMOTRIZ', 'av Humberto tejera casa 1-77', '', '4166439453', 'robertoyea78@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(630, 14805784, 'Bo-0461', 'Sgto/2do', 'Ali David', 'Rodríguez Castañeda', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 28, 9, 1980, 'Tecnico Medio', 'MANTENIMIENTO MECANICO', 'los curos parte media bloque 8 apto 31', '', '4161323299', 'murci80_9@hotmaol.com', 'Activo', 'Servivida', 'Metropolitana'),
(631, 14954437, 'Bo-0362', 'Sgto/Aydte', 'Ronald José', 'Rodríguez Marquéz ', 1, 7, 2002, 'Venezolano', 'Masculino', 'CARACAS', 22, 3, 1980, 'Licenciado', 'EMERGENCIA PREHOSPITALARI', 'urb villa manzano calle 2 casa 83 ejido', '', '4161775378', 'ronaldrodriguez21@hotmail', 'Activo', 'Servivida', 'Metropolitana'),
(632, 17129288, 'Bo-0885', 'Cabo/1ro', 'Adalberto', 'Rodriguez Marquina', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 9, 1, 1985, 'Licenciado', 'Educacion', 'chamita calle coromoto casa 2-12', '4263531873', '2746582780', 'pocaadal@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(633, 13648326, 'Bo-0527', 'Cabo/1ro', ' Carlos Alberto', 'Rodríguez Rondón', 1, 9, 2004, 'Venezolano', 'Masculino', 'Mérida', 1, 6, 1978, 'Bachiller', 'Ciencias', 'ejido urb. san miguel parte alta casa n-10', '4263761525', '2746577836', 'rodriguezcarlos78@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(634, 16715037, 'Bo-0363', 'Cabo/2do', 'Yuzmary Elizabeth', 'Rodríguez Saavedra', 1, 7, 2002, 'Venezolano', 'Femenino', 'CAJA SECA', 29, 5, 1984, 'Bachiller', 'CINCIAS', 'bubuqui 3 blq 8 apto 3-1 el vigia ', '4147422921', '2758819259', 'y.e.r.s.@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(635, 15590431, 'Bo-0637', 'Distinguido', 'Mauro Segundo ', 'Rodríguez Saavedra', 1, 9, 2005, 'Venezolano', 'Masculino', 'CAJA SECA', 13, 10, 1982, 'Tecnico Medio', 'PRODUCCION AGROPECUARIA', 'urb el naranjal, calle 4, casa88-89,elvigia', '0414-7559583', '', 'maurosegundo_rs@hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(636, 9993171, 'Bo-0250', 'Capitan', 'Roberto José ', 'Rodríguez Velásquez', 1, 1, 2002, 'Venezolano', 'Masculino', 'La Guaira Edo. Vargas', 26, 9, 1969, 'TSU', 'Seguridad Industrial  ', 'urb. Vargas monseñor moreno Tovar calle ppal ', '4247103605', '', 'genejet@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(637, 19593807, 'Bo-1009', 'Bombero', 'Beatriz Andrea', 'Rodriguez Zuñiga', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 17, 3, 1988, 'Bachiller', 'INTEGRAL', 'el chama las mesitas calle principal  casa  s/n ', '4140811810', '', '', 'Activo', 'Servivida', 'Metropolitana'),
(638, 14400950, 'Bo-0887', 'Bombero', 'Neomar Antonio', 'Rojas', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 28, 10, 1980, 'Bachiller', 'CIENCIAS ', 'calle san Isidro sector Montalbán ejido casa 34', '4162917425', '0274-22154234', 'efraneomary@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(639, 13097154, 'Bo-0364', 'Cabo/1ro', 'José Miguel', 'Rojas Araque', 1, 7, 2002, 'Venezolano', 'Masculino', '', 3, 7, 1976, 'Licenciado', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(640, 10683980, 'Bo-0184', 'SubTeniente', 'José Alfredo', 'Rojas Arias', 8, 10, 1990, 'Venezolano', 'Masculino', 'STA BARVARA ZULIA', 5, 9, 1970, 'Bachiller', 'CIENCIAS', 'El vigía sector caño seco ii vereda 13 casa numero 9', '0416-7879498', '0416-7879498', 'alfreidys05@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(641, 19751855, 'Bo-0888', 'Distinguido', 'Leonardo de Jesus', 'Rojas Avila', 1, 1, 2008, 'Venezolano', 'Masculino', '', 26, 2, 1989, 'Bachiller', '', 'avenida Gonzalo picón casa 40-33', '', '', 'leobrat@hotmail.com', 'Activo', '', 'Metropolitana'),
(642, 19751094, 'Bo-0889', 'Distinguido', 'Felix Rafael', 'Rojas Cadenas', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 12, 8, 1989, 'Tecnico Medio', 'INCENDIO', 'sector pan de azúcar vereda la victoria casa 28 ejido', '', '2742715854', '', 'Activo', 'Incendio', 'Metropolitana'),
(643, 11246181, 'Bo-0528', 'Sgto/2do', ' Francisco José', 'Rojas Crespo', 1, 9, 2004, 'Venezolano', 'Masculino', 'MARACAIBO ', 18, 2, 1971, 'TSU', 'FORESTAL ', 'San Rafael del chama, sector curva de los guayabos casa sin numero.', '0416-4560628', '0274-4154246', 'franrojasc@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(644, 17130571, 'Bo-0638', 'Cabo/2do', 'Yenis Rafaela', 'Rojas Dávila', 1, 9, 2005, 'Venezolano', 'Femenino', 'Merida', 25, 4, 1985, 'Bachiller', 'CIENCIAS', 'el morro', '4266719454', '4247088484', 'yehirojas@yahoo.com', 'Activo', 'Servivida', 'Metropolitana'),
(645, 14401696, 'Bo-0639', 'Cabo/2do', 'Jesús Eduardo', 'Rojas Escalona ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 9, 4, 1980, 'Bachiller', 'ciencias', 'urb el pilar ejido bloque 20 apartamento 00-02', '4247252885', '2742665111', 'rojasj_9480@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(646, 15930989, 'Bo-0640', 'Cabo/2do', 'Piero', 'Rojas Garzón', 1, 9, 2005, 'Venezolano', 'Masculino', 'CARACAS', 22, 11, 1982, 'Bachiller', 'CIENCIAS', 'caño seco II av 1 casa 50', '0416-6707678', '0426-6785354', 'rojaspiero@yahoo.com', 'Activo', 'Incendio', 'Panamericana'),
(647, 13097930, 'Bo-0462', 'Sgto/1ro', 'Franklin Argenis', 'Rojas González', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 28, 11, 1974, 'Bachiller', 'CIENCIAS', 'av 16 de septiembre san José obrero pasaje II casa 11/55', '4166023229', '2742632995', '', 'Activo', 'Incendio', 'Mocoties'),
(648, 14771359, 'Bo-0679', 'Sgto/2do', 'Yenny Milagros', 'Rojas Mancilla ', 1, 1, 2006, 'Venezolano', 'Femenino', 'Merida', 13, 5, 1979, 'Bachiller', 'CIENCIAS', 'los curos parte alta bloque 37 edificio 3 apto 03-03', '0416-9790480', '4265720542', 'yennymancilla@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(649, 17129070, 'Bo-0691', 'Cabo/2do', 'José Gregorio', 'Rojas Marquez', 1, 1, 2006, 'Venezolano', 'Masculino', '', 21, 7, 1986, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(650, 9478327, 'Bo-0641', 'Sgto/2do', 'Jesús Emilio', 'Rojas Méndez', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida ', 5, 8, 1968, 'Licenciado', 'Administración', 'campo de oro calle 1 ,casa  numero 3-15', '0426-5702027', '0274-2637621', 'jer85@latinmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(651, 17596542, 'Bo-0692', 'Cabo/2do', 'Luís Alberto', 'Rojas Mendoza', 1, 1, 2006, 'Venezolano', 'Masculino', 'TRUJILLO', 18, 8, 1987, 'Tecnico Medio', 'INCENDIO', 'av. las Américas res las marias', '', '4120600048', 'universalspirit87@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(652, 17340397, 'Bo-1039', 'Bombero', 'Danny Jesus', 'Rojas Molina ', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida ', 30, 4, 1987, 'Bachiller', 'CIENCIAS ', 'urbanizacion el pilar bloque 4 edf.1ap.00-03', '4161940463', '2742218386', 'DANNYROJAS_30@HOTMAIL.COM ', 'Activo', 'Rescate', 'Metropolitana'),
(653, 14700658, 'Bo-0642', 'Sgto/2do', 'Franklin Gonzalo', 'Rojas Obando', 1, 9, 2005, 'Venezolano', 'Masculino', '', 12, 3, 1980, 'Bachiller', 'ciencias', 'la hechicera sector santa rosa', '', '', 'franklinrojas@hotmail.com', 'Activo', '', 'Metropolitana'),
(654, 19593030, 'Bo-1010', 'Bombero', 'Jesus Manuel', 'Rojas Peña', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 8, 6, 1989, 'Bachiller', 'CIENCIAS SOCIALES', 'pedregosa media, calle nva. bolivia casa n58 Mérida', '4166774006', '2747897800', 'jesus-mrp@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(655, 14962652, 'Bo-0643', 'Cabo/1ro', 'Leonardo Ali', 'Rojas Peña', 1, 9, 2005, 'Venezolano', 'Masculino', 'Vigia', 9, 11, 1980, 'Bachiller', 'CIENCIAS ', 'el paraiso, sector san martis, calle 2 casa 48', '', '0275-2686184', '', 'Activo', 'Servivida', 'Panamericana'),
(656, 19995217, 'Bo-1048', 'Distinguido', 'Jilber David', 'Rojas Pérez ', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 29, 11, 1990, 'Tecnico Medio', 'INCENDIO', 'urb carabobo  calle 1 casa 48', '4247490153', '2742665891', 'rojasfireman@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(657, 19145508, 'Bo-1011', 'Bombero', 'Deivys Jose', 'Rojas Pérez ', 1, 1, 2009, 'Venezolano', 'Masculino', 'CARACAS', 26, 6, 1988, 'Tecnico Medio', 'INCENDIO', 'urb los bucares torre 2 apto 2-d', '', '4160165927', 'deivys_r@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(658, 12349806, 'Bo-0047', 'Cabo/1ro', 'Franklin Alexander', 'Rojas Rojas', 1, 2, 1999, 'Venezolano', 'Masculino', 'MÉRIDA ', 18, 4, 1976, 'Bachiller', 'CIENCIAS', 'lagunillas calle bolivar casa 99', '', '0412-6561686', '', 'Activo', 'Servivida', 'Mocoties'),
(659, 18620941, 'Bo-0529', 'Sgto/Aydte', 'Grace Zulimar', 'Rojas Rojas', 1, 9, 2004, 'Venezolano', 'Femenino', 'Merida', 2, 3, 1985, 'Bachiller', 'ciencias', 'urb carabobo  calle 1 casa 39', '', '0414-9795033', 'greyzulimar@hotmaIL.com', 'Activo', 'Rescate', 'Metropolitana'),
(660, 16934268, 'Bo-0562', 'Cabo/2do', 'Jhoan José', 'Rojas Saavedra', 1, 2, 2005, 'Venezolano', 'Masculino', 'Merida', 2, 4, 1985, 'Tecnico Medio', '', 'loma de s maitines pdregosa casa 02', '0416-1191137', '4147344552', 'JHOANSAAVEDRA@HOTMAIL.COM', 'Activo', 'Conductor', 'Metropolitana'),
(661, 18637890, 'Bo-1012', 'Bombero', 'Eva Virginia', 'Rojas Suarez', 1, 1, 2009, 'Venezolano', 'Femenino', 'EL VIGIA', 27, 8, 1986, 'Bachiller', 'Ciencias', 'la azulita urb. eladio moreno calle maximino parra casa sin numero', '4261886536', '2745114184', 'lagata669@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(662, 17696899, 'Bo-0890', 'Distinguido', 'Luis Emilio', 'Rojas Sulbaran', 1, 1, 2008, 'Venezolano', 'Masculino', 'EJIDO', 12, 8, 1984, 'Bachiller', 'CIENCIAS', 'urb el palmo calle 04 casa sinnumero', '4261539383', '', 'riesgo_vertical41@hotmail.com', 'Activo', 'RESCATE', 'Metropolitana'),
(663, 18310336, 'Bo-0771', 'Distinguido', 'Antonio José ', 'Rojas Trejo', 1, 9, 2006, 'Venezolano', 'Masculino', '', 4, 8, 1987, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(664, 17129564, 'Bo-0463', 'Sgto/Aydte', 'Marcos Antonio', 'Rojas Villarreal', 1, 9, 2003, 'Venezolano', 'Masculino', 'MÉRIDA', 7, 7, 1984, 'Bachiller', 'CIENCIAS ', 'avenida las Américasresiden idependencia edificio pichincha piso 04 aparta ', '4265716883', '0274-2443675', 'markv0701@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(665, 11465340, 'Bo-0049', 'Teniente', 'Jhonny Alfonso', 'Rojas Zerpa', 1, 3, 1996, 'Venezolano', 'Masculino', 'Merida', 10, 8, 1972, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'el chama urb. el galeron calle 16    casa 16-4', '4267749267', '2742665883', 'jhonnyr_72@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(666, 13649685, 'Bo-0464', 'Cabo/1ro', 'Edwin Ruben ', 'Roldán Cano', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 31, 8, 1977, 'Tecnico Medio', 'ADMINISTRACION financiera', 'nueva bolivia estado Mérida', '', '0416-0888163', 'edwnfu17@hotmaiol.com', 'Activo', 'Rescate', 'Panamericana'),
(667, 13230226, 'Bo-0891', 'Distinguido', 'Jorge Eliezer', 'Rolon Guzman', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR', 14, 11, 1978, 'Bachiller', 'Ciencias', 'urb.santa edubijes bloque 5 apt 01-04', '0416-177-0226', '0275-8731039', 'jorgerolon.fuego@gmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(668, 19096993, 'Bo-0926', 'Distinguido', 'Gremis Yajaira', 'Román Castaño ', 1, 1, 2008, 'Venezolano', 'Femenino', 'Vigia', 12, 6, 1990, 'T.S.U.', 'Educion Prescolar', 'el vigia urb villa los angeles casa2-42', '4126562353', '2758829119', 'gremis18@live.com', 'Activo', 'Servivida', 'Metropolitana'),
(669, 15295216, 'Bo-0644', 'Cabo/2do', 'Carlos Eduardo', 'Romero ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 28, 9, 1981, 'TSU ', 'DEPORTES', 'av. las Américas sector santa barbara este casa 01-54', '4268196039', '0274-2664971', 'CRLOSEDUARDOS7@LIVE.COM', 'Activo', 'Servivida', 'Metropolitana'),
(670, 12049378, 'Bo-0195', 'SubTeniente', 'Oliver Evangelista', 'Romero Dugarte', 1, 5, 1994, 'Venezolano', 'Masculino', 'TOVAR', 28, 2, 1974, 'Tecnico Medio', 'medicina prehospitalaria', 'guaraque , sector el llanito calle principal casa sin numero', '4265743245', '2758731832', 'oliveromero@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(671, 11466614, 'Bo-0680', 'Sgto/2do', 'Héctor Alexander', 'Rondón ', 1, 1, 2006, 'Venezolano', 'Masculino', 'Merida', 17, 1, 1973, 'Ingeniero', 'quimico', 'los bucares torre j piso 1 apartamento 1-4', '0424-7371393', '0274-2600282', 'rondonha@yahoo.es', 'Activo', '', 'Metropolitana'),
(672, 16907552, 'Bo-0892', 'Bombero', 'Victor Yonel', 'Rondon Arellano ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 8, 4, 1986, 'Bachiller', 'HUMANIDADES', 'Tovar carrera 3bis sabaneta cana nº3-2', '4163707737', '0275/2674350', 'chispa54@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(673, 18208233, 'Bo-1040', 'Bombero', 'Albio Jose', 'Rondon Davila', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 14, 12, 1987, 'Bachiller', 'HUMANIDADES', 'carrera 1 el añil casa 2-75 Tovar', '4147163970', '2758730217', 'jose_davila_141287@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(674, 15694253, 'Bo-0645', 'Cabo/2do', 'Enger Alberto', 'Rondon Dávila', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR', 13, 11, 1982, 'Bachiller', 'CIENCIAS', 'carrera 1 el añil casa 2-75 Tovar', '4160749420', '2758730217', 'engerrondon28@htomail.com', 'Activo', 'Servivida', 'Mocoties'),
(675, 20217405, 'Bo-1013', 'Distinguido', 'Rosmel Eduardo', 'Rondon Garcia', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 24, 12, 1989, 'Tecnico Medio', 'INCENDIO', 'el peñon carretera principal edf,8 apto 02 Tovar', '4162782604', '2752694483', 'rosmel_rondon@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(676, 19487478, 'Bo-1014', 'Distinguido', 'Jesus Daniel', 'Rosales Carrero', 1, 1, 2009, 'Venezolano', 'Masculino', 'BAILADORES', 25, 4, 1990, 'Tecnico Medio', 'INCENDIO', 'urb. pinto salinas vereda 1  apto 1', '', '4166012387', '', 'Activo', 'Incendio', 'Mocoties'),
(677, 16605602, 'Bo-0646', 'Distinguido', 'Carlos Daniel', 'Rosales Carrero', 1, 9, 2005, 'Venezolano', 'Masculino', '', 18, 11, 1984, 'Bachiller', '', '', '4263721527', '', '', 'Activo', '', 'Mocoties'),
(678, 8037891, 'Bo-0050', 'Mayor', 'Ramón Antonio', 'Rosales Guillen', 1, 3, 1996, 'Venezolano', 'Masculino', 'Merida', 8, 1, 1967, 'TSU', 'MANEJO DE EMERGENCIA', 'san juan de lagunillas sector milla urb jose maria hernandez ', '4265711600', '4162664926', 'arosales_7@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(679, 10100115, 'Bo-0260', 'Teniente', 'Giovanny Alexis', 'Rosales Guillen', 1, 2, 2002, 'Venezolano', 'Masculino', 'Merida', 31, 8, 1969, 'Ingeniero', 'GEOLOGO', 'av. 16 sept. casa 47-5 campo de oro arriba del  modulo', '4167730600', '2742638485', 'giovannyrg@yahoo.es', 'Activo', '', 'Metropolitana'),
(680, 11466480, 'Bo-0293', 'Teniente', 'José Elpidio', 'Rosales Guillen', 1, 3, 2002, 'Venezolano', 'Masculino', 'Merida', 25, 12, 1972, 'TSU ', 'LCDO CIENCIAS DEL FUEGO', 'av. 16 sept. casa 47-5 campo de oro arriba del  modulo', '4125131341', '2742638485', 'joseroschi@hotmail.com', 'Activo', '', 'Metropolitana'),
(681, 13965997, 'Bo-0366', 'Cabo/2do', 'Leonardo E.', 'Rosales Mora', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 12, 10, 1977, 'Tecnico Medio', 'MEDICINA PRE.HOSP.', 'tabay sector el guamalcasa sin numero', '', '0416-1333111', '', 'Activo', 'Servivida', 'Paramo'),
(682, 16907083, 'Bo-0772', 'Distinguido', 'Renny Andersom', 'Rubio Guillen', 1, 9, 2006, 'Venezolano', 'Masculino', '', 30, 8, 1985, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(683, 16199160, 'Bo-0368', 'Sgto/1ro', 'Ana Dominga', 'Ruizde Ochoa', 1, 7, 2002, 'Venezolano', 'Femenino', 'Merida', 4, 5, 1983, 'TSU', 'Recurso Humanos', 'el rincor parte media, 1-14', '', '0414-7408925', 'ramses.ali@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(684, 11461028, 'Bo-0369', 'Sgto/2do', 'Fernando', 'Ruiz', 1, 7, 2002, 'Venezolano', 'Masculino', 'MERIDA', 15, 9, 1970, 'TSU ', '', 'santa juana bloque 11 apto3-1', '0416-1399211', '0274-2623109', 'FER.MI_27@HOTMAIL.COM', 'Activo', 'Incendio', 'Metropolitana'),
(685, 18310642, 'Bo-0893', 'Bombero', 'Christian  Alexander', 'Ruiz', 1, 1, 2008, 'Venezolano', 'Masculino', 'CARACAS', 12, 10, 1986, 'Tecnico Medio', 'RESCATE', 'manzano bajo casa 87-b ejido', '4247689777', '2742211779', 'chrispeste@gmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(686, 14250425, 'Bo-0367', 'Sgto/2do', 'José Alveiro', 'Ruiz Chacón', 1, 7, 2002, 'Venezolano', 'Masculino', 'TOVAR', 4, 11, 1979, 'Bachiller', 'CIENCIAS', 'urb. buenos aires av. 4 call 10 casa nº9-24 vigia', '', '0414-706-5183', 'ALVEIROCHACON2hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(687, 13524553, 'Bo-0051', 'Teniente', 'William Alberto', 'Ruiz Ruiz', 1, 3, 1996, 'Venezolano', 'Masculino', 'Merida', 29, 1, 1978, 'TSU', 'INFORMATICA', 'av. las Américas residencias el viaducto edf gardenia 3-1', '4265707331', '4265707331', 'william_ruiz_2000@yahoo.com', 'Activo', 'Incendio', 'Metropolitana');
INSERT INTO `bombero` (`1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `17`, `18`, `19`, `20`, `21`, `22`, `23`, `24`) VALUES
(688, 15175943, 'Bo-0544', 'Cabo/2do', 'Oscar Antonio', 'Ruiz Uzcategui', 1, 1, 2005, 'Venezolano', 'Masculino', 'Merida', 5, 1, 1978, 'Bachiller', 'Ciencias', 'callen princ santa juana csa 3-5', '4167752886', '0274-2620180', 'OSCAR_RUIZ_JOM@HOTMAIL.COM', 'Activo', 'Incendio', 'Metropolitana'),
(689, 18620097, 'Bo-0693', 'Cabo/2do', 'Henry Alberto', 'Ruiz Villegas ', 1, 1, 2006, 'Venezolano', 'Masculino', '', 15, 3, 1988, 'Bachiller', 'CIENCIAS', 'calle, principale santa juana, casa n-3-5.', '', '0416-1964685', 'OSCAR.EXTINTOR@HOTMAIL.COM', 'Activo', 'Incendio', 'Metropolitana'),
(690, 18123939, 'Bo-0894', 'Bombero', 'Cindy Fabiana', 'Rujano Rondon', 1, 1, 2008, 'Venezolano', 'Femenino', 'Merida', 24, 11, 1987, 'Bachiller', 'Ciencias', 'santa elena call 9 casa nº 10-72', '0424-7243836', '', '', 'Activo', 'Rescate', 'Metropolitana'),
(691, 17341937, 'Bo-1015', 'Distinguido', 'Deysy Josefina', 'Saabedra Ruiz', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 20, 12, 1985, 'Bachiller', 'CIENCIAS', 'av. los proceres, sector san isidroparte media casa 16', '4269741275', '', 'deysy_ss@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(692, 18310065, 'Bo-1018', 'Bombero', 'Jesús Reinaldo', 'Saavedra Díaz ', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 17, 11, 1986, 'Bachiller', 'CIENCIAS', 'las mesitas del chama calle principal casa s/n Mérida', '', '4247647634', '', 'Activo', 'Servivida', 'Metropolitana'),
(693, 19146535, 'Bo-1017', 'Distinguido', 'Gabriela Carolina', 'Saavedra Gutierrez', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 8, 12, 1988, 'Tecnico Medio', 'RESCATE', 'pie del llano entrada santa juana pasaje paredes casa 1-51 ', '4264094093', '', 'gcsg_812@hotmal.com', 'Activo', 'Servivida', 'Metropolitana'),
(694, 13230103, 'Bo-0895', 'Cabo/2do', 'Jean Wladimir', 'Saavedra Gutierrez', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR', 23, 8, 1978, 'Bachiller', 'CIENCIAS', 'carrera 4tº  letra e nº15 sabaneta Tovar', '4267021477', '2754110436', '', 'Activo', 'Conductor', 'Mocoties'),
(695, 19145206, 'Bo-0788', 'Distinguido', 'Jordan Silverio ', 'Saavedra Rojas ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Mérida', 21, 12, 1988, 'Tecnico Medio', '', 'la pedregosa alta gran parada calle cafetal casa s/n', '0424-7356762', '', 'jordansaavedra_88@hotmail.com', 'Activo', '', 'Metropolitana'),
(696, 19995518, 'Bo-1016', 'Distinguido', 'Juan Manuel', 'Saavedra Ruiz ', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 4, 11, 1988, 'Bachiller', 'CIENCIAS', 'av. los proceres sector santa barbara barrio san isidro parte media, casa n', '0416-4773945', '2742662217', 'juan16_71@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(697, 17238842, 'Bo-1224', 'Distinguido', 'Jose Rigoberto', 'Salas Andrade', 1, 6, 2009, 'Venezolano', 'Masculino', 'Merida', 15, 1, 1984, 'Bachiller', 'Mercantil', 'los curos, parte media, vrda 4 casa n15 Mérida', '', '0274-2716248', 'timbixd@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(698, 16039294, 'Bo-0647', 'Distinguido', 'Edglys Carolina', 'Salas Ramírez', 1, 9, 2005, 'Venezolano', 'Femenino', 'EL VIGIA', 14, 2, 1984, 'Licenciado', 'ADMINISTRACION MERCADEO', 'urb bubuqui 4 vereda 3 casa 5', '4247566600', '2758819570', 'edglysalas@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(699, 20199276, 'Bo-0901', 'Bombero', 'Gabriel Alexander', 'Salazar Marquez', 1, 1, 2008, 'Venezolano', 'Masculino', 'Mérida', 5, 8, 1989, 'Tecnico Medio', 'Operaciones contra Incend', 'corozo via san cristobal,sector francisco mendoza av 5 y 6 casa 3', '4267729520', '2739236777', 'gabriel_7sm@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(700, 17455854, 'Bo-0466', 'Cabo/1ro', 'Yohan Gregori', 'Salazar Márquez', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 23, 10, 1985, 'Tecnico Medio', 'RESCATE', 'urb carabobo vda 8 casa 4', '4247564705', '2742450863', 'yohan198@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(701, 18310975, 'Bo-0566', 'Bombero', 'Enmanuel', 'Salazar Salas', 1, 2, 2005, 'Venezolano', 'Masculino', 'Merida', 21, 7, 1986, 'Bachiller', 'Integral', 'av los proceres residencias albarregas', '4267374466', '', 'soldadodelñfuego_20hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(702, 9473827, 'Bo-0681', 'Cabo/1ro', 'Jorge Luís', 'Salazar Uzcategui', 1, 1, 2006, 'Venezolano', 'Masculino', 'Merida', 11, 3, 1969, 'Medico', 'cirujano', 'campo de oro calle 3 casa 0-108b', '0416-0473464', '2742622275', 'itosauz@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(703, 11954324, 'Bo-0052', 'Sgto/Aydte', 'Jorge Rosario', 'Sánchez', 1, 2, 1999, 'Venezolano', 'Masculino', 'Merida', 24, 5, 1974, 'Tecnico Medio', 'MEDICINA PREHOSPITALARIA', 'av. 16 de septiembre, campo de oro, calle3, casa n1-57', '4161776517', '2742633618', 'jorsan_34@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(704, 11951827, 'Bo-0283', 'Teniente', 'José Onofre', 'Sánchez', 1, 3, 2002, 'Venezolano', 'Masculino', 'MUCUCHIES', 16, 11, 1972, 'Abogado', 'INFORMATICA', 'sector vega de la isla pasaje 3 casa sin numero', '4163731154', '2744165678', 'elmucupar@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(705, 19421686, 'Bo-0897', 'Distinguido', 'Ruth S.', 'Sanchez Bautista ', 1, 1, 2008, 'Venezolano', 'Femenino', 'Mèrida', 15, 3, 1989, 'Tecnico Medio', 'INFORMATICA', 'ejido urb carlos sanchez calle 7 casa 315', '4164748357', '4161192', 'ruth_15_695@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(706, 19146644, 'Bo-1041', 'Distinguido', 'Roberto Carlos ', 'Sanchez Gutierrez ', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 14, 10, 1987, 'Tecnico Medio', 'RESCATE', 'san jacinto calle principal  sector el conscrito casa 0-22 ', '0426-2469637', '2742520012', 'roberto_64_2@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(707, 15756524, 'Bo-0530', 'Bombero', 'Joan Manuel', 'Sánchez Lobo', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 30, 3, 1981, 'Tecnico Medio', 'ADMINISTRACION FINANCIERA', 'valle sector playon alto casa 01-62', '0424-7471733', '', '', 'Activo', 'Conductor', 'Metropolitana'),
(708, 13790826, 'Bo-0083', 'Sgto/Aydte', 'José Miguel', 'Sánchez Medina', 1, 1, 1999, 'Venezolano', 'Masculino', '', 25, 7, 1977, 'Licenciado', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(709, 17322336, 'Bo-0801', 'Cabo/2do', 'Yolber Jose ', 'Sanchez Salas ', 1, 2, 2007, 'Venezolano', 'Masculino', '', 20, 7, 1985, 'Tecnico Medio', '', 'sector los naranjos calle 2', '0426-9288694', '', 'yolbersanchezfuego33@hotmail.com', 'Activo', '', 'Mocoties'),
(710, 16655338, 'Bo-0789', 'Distinguido', 'Juan Alberto', 'Sanchez Sanchez ', 1, 2, 2007, 'Venezolano', 'Masculino', 'MUCUCHIES', 4, 6, 1985, 'Bachiller', 'Ciencias', 'pozo hondo ejido, calle principal,casa 24-15', '0426-4745006', '0274-2216551', 'juansan1991@hotmail.com', 'Activo', 'RESCATE', 'Metropolitana'),
(711, 11467699, 'Bo-0682', 'Cabo/1ro', 'Jesús Enilber', 'Sánchez Uzcategui', 1, 1, 2006, 'Venezolano', 'Masculino', 'Merida', 21, 11, 1973, 'Licenciado', 'GEOGRAFO', 'urb buena vista vereda 2 casa 10', '0416-2730212', '0274-2635806', 'geojesuss@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(712, 19592511, 'Bo-0802', 'Distinguido', 'Jesus Alberto ', 'Sanchez Uzcategui ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 27, 11, 1989, 'Tecnico Medio', 'INCENDIO', 'sector santa barbara Mérida', '0416-9754309', '', 'cbmboby@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(713, 13648643, 'Bo-0737', 'Cabo/1ro', 'Wilmer', 'Santiago Camacho', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 26, 12, 1977, 'Bachiller', 'CIENCIAS', 'el chamita calle el ceibal cas 1-166', '0416-8746221', '2744175191', '', 'Activo', 'Servivida', 'Metropolitana'),
(714, 18798192, 'Bo-0694', 'Distinguido', 'Gregori Alejandro', 'Santiago Cañizalez', 1, 1, 2006, 'Venezolano', 'Masculino', 'Merida', 19, 11, 1987, 'Tecnico Medio', 'Ciencias del Fuego', 'el arenal via la joya entrada el toro', '', '0416-571-3169', 'incedio_20@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(715, 13967364, 'Bo-0085', 'SubTeniente', 'Rafael Ramón', 'Santiago Gavidia', 1, 1, 1999, 'Venezolano', 'Masculino', 'Merida', 12, 8, 1976, 'TSU', 'TECNOLOGIA BOMBERIL', 'los curos parte alta', '4164768464', '4160310794', 'rafaelsantiago176@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(716, 13967374, 'Bo-0084', 'Teniente', 'Javier Alexander', 'Santiago Gavidia', 1, 1, 1999, 'Venezolano', 'Masculino', 'Merida', 24, 8, 1977, 'TSU', 'MANEJO DE EMERGENCIA', 'los curos sector el entable  vereda 3 cas a 4', '4166267485', '', 'javiersantiagogavidia@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(717, 19751083, 'Bo-0927', 'Distinguido', 'Alvaro M.', 'Santiago Peñaloza ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 25, 1, 1990, 'Tecnico Medio', 'MANEJO DE EMERGENCIA', 'san rafael de tabai sector el rosal calle libertad casa 150', '0426-2052437', '0274-4176521', 'elsanti_49_51@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(718, 11466687, 'Bo-0055', 'Teniente', 'Luís Alfredo', 'Seijas Guillen', 1, 2, 1999, 'Venezolano', 'Masculino', 'CARACAS', 9, 4, 1973, 'Tecnico Medio', 'PREHOSPITALARIA', 'sto domingo calle urdaneta transvers plaza bolivar  s/n', '4268299544', '2745118875', 'seijasfuego@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(719, 11218186, 'Bo-0056', 'SubTeniente', 'Carmen Alicia ', 'Sepúlveda Hernández ', 1, 3, 1996, 'Venezolano', 'Femenino', 'VIGIA', 9, 2, 1971, 'Licenciado', '', 'ejido res centenario boq 8 apto 36', '4166098594', '', '', 'Activo', '', 'Metropolitana'),
(720, 10560727, 'Bo-0285', 'SubTeniente', 'María Mónica', 'Serrano Marín', 1, 3, 2002, 'Venezolano', 'Femenino', 'BARINAS', 28, 12, 1971, 'Ingeniero', 'INDUSTRIAL', 'via el morro casa sin numero sector los guayabos', '4163275746', '2744154246', 'monicas13@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(721, 17322919, 'Bo-0649', 'Cabo/2do', 'Jesús Alfonso', 'Serrano Márquez', 1, 9, 2005, 'Venezolano', 'Masculino', '', 23, 3, 1987, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(722, 13803276, 'Bo-0531', 'Sgto/2do', 'Carlos Enrique', 'Sosa Peña', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 4, 11, 1978, 'Tecnico Medio', 'MENCION BOMBERO', 'el chama sector san antonio casa 1646-4', '4269878642', '0274-5118672', 'CARLOSSOSA_78@HOTMAIL.COM', 'Activo', 'Incendio', 'Metropolitana'),
(723, 20851888, 'Bo-1042', 'Cabo/2do', 'Angel Ramón ', 'Sosa Rodríguez ', 1, 1, 2009, 'Venezolano', 'Masculino', 'POTUGUESA', 26, 5, 1990, 'TSU ', 'EMERGENCIA PREHOSPITALARI', 'el  portachuelo el  chama casa 52', '0274/2637498', '4147314275', 'angel_sosa_44@hotmail-com', 'Activo', 'Servivida', 'Metropolitana'),
(724, 17521580, 'Bo-1021', 'Cabo/2do', 'Deisy Yamile', 'Sosa Rojas', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 18, 11, 1985, 'T.S.U.', 'CIENCIAS DEL FUEGO RESCAT', 'mesitas del chama sector 1  casa 15', '4261556398', '', 'lacostena4@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(725, 15517990, 'Bo-0370', 'Sgto/Aydte', 'Juan Antonio', 'Sosa Rojas', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 28, 7, 1982, 'Licenciado', 'TECNOLOGIA BOMBERIL', 'san jacinto sector el concrito casa 05 ', '0416-970-7755', '', 'jsjsmatpel@gmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(726, 13577985, 'Bo-0532', 'Cabo/2do', ' Jesús Gerardo', 'Sosa Sosa', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 4, 11, 1977, 'Tecnico Medio', 'CONTABILIDAD', 'urb. don luis calle 5  casa 27 ejido', '', '2742210954', '', 'Activo', 'Conductor', 'Metropolitana'),
(727, 16317754, 'Bo-0545', 'SubTeniente', 'Luís Alexander', 'Soto Altuve', 1, 1, 2005, 'Venezolano', 'Masculino', 'TOVAR', 1, 12, 1983, 'TSU ', 'CIENCIAS', 'calle principal tienditas del chama apto 01 edf san jose', '4166234116', '', 'bomberoluissoto@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(728, 16444052, 'Bo-0371', 'Sgto/Aydte', 'Fabián Leonardo', 'Soto Parra', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 10, 11, 1983, 'TSU', 'TECNOLOGIA BOMBERIL', 'los curos parte media vereda 3 casa 5', '4265706592', '2742713196', 'fabiansoto83@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(729, 18620057, 'Bo-0898', 'Cabo/2do', 'Nelvi jesus', 'Soto Parra', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 19, 1, 1988, 'Bachiller', 'CIENCIAS', 'los curos parte media vereda 3 casa 5', '4126867863', '2742713196', 'danger_8_bmx@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(730, 18966516, 'Bo-0790', 'Cabo/2do', 'Edwin Javier', 'Soto Parra ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 27, 6, 1989, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'los curos parte media vereda 3 casa 5', '', '2742713196', 'edwin8093@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(731, 15923124, 'Bo-0650', 'Cabo/2do', 'Yenifer Yoliana', 'Soto Vera ', 1, 9, 2005, 'Venezolano', 'Femenino', 'Merida', 21, 8, 1983, 'Tecnico Medio', 'rescate', 'urbanizacion carabobo vereda 3 casa 31', '4140829375', '2742620108', 'yeni_triniti@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(732, 14106927, 'Bo-0738', 'Cabo/2do', 'Alexis Enrique', 'Soto Vera ', 1, 9, 2006, 'Venezolano', 'Masculino', 'Caracas', 3, 2, 1979, 'Bachiller', 'Ciencias', 'urb carabobo,vereda 29,casa 01', '4162716012', '2742665722', 'aesv79@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(733, 15921701, 'Bo-0899', 'Distinguido', 'Gabriel Benigno', 'Suarez Garcia', 1, 1, 2008, 'Venezolano', 'Masculino', 'CARACAS', 24, 1, 1984, 'T.S.U.', 'Admistracion de Empresas', 'pedregosa alta, frente a la segunda capilla, casa 19', '4268860389', '', 'gabrielsuarez2401@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(734, 19422791, 'Bo-1043', 'Bombero', 'Narbelly del Carmen', 'Suarez Garcia ', 1, 1, 2009, 'Venezolano', 'Femenino', 'Merida', 3, 9, 1988, 'Bachiller', 'CIENCIAS', 'los curos parte alta calle carvajal casa n 10', '0414-7289024', '2742711360', 'narbellysg@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(735, 12354139, 'Bo-0178', 'Sgto/2do', 'Espíritu', 'Suárez Lamus', 1, 12, 1994, 'Venezolano', 'Masculino', 'VIGIA', 27, 11, 1971, 'Bachiller', '', 'carretera panamericana sector quebrada blanca casa 37-86', '0414-7072647', '', 'sjoseespiritu@yahoo.com', 'Activo', 'Rescate', 'Panamericana'),
(736, 16199552, 'Bo-0468', 'Cabo/2do', 'Daniel José', 'Suárez Rojas', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 27, 9, 1982, 'Bachiller', 'CIENCIAS', 'av. centenario,res.el molino edificio 4, piso 3 apto. 3-3.', '4169215006', '', 'danieljsuarezr@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(737, 13648675, 'Bo-0739', 'Cabo/2do', 'Gloria Placida', 'Sucre Camacho', 1, 9, 2006, 'Venezolano', 'Femenino', 'Merida', 17, 4, 1977, 'Bachiller', 'Ciencias', 'urb carabobo calle 1 casa n-57', '4164755338', '2747902128', 'sucregloria@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(738, 12452149, 'Bo-0058', 'Sgto/1ro', 'Yoris del Carmen', 'Suescum Campos', 1, 2, 1999, 'Venezolano', 'Femenino', 'CAJA SECA', 15, 11, 1975, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'av los proceres prolon el llanito casa  0-13', '0426-7701897', '0416-9756271', 'yorissuescum@gmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(739, 10713504, 'Bo-0059', 'Teniente', 'Coromoto Yanet', 'Suescun Silva', 1, 3, 1996, 'Venezolano', 'Femenino', 'Merida', 17, 4, 1972, 'Licenciado', 'EMERGENCIA PREHOSPITALARI', 'la milagrosa pasaje primero de mayo , casa numero 2-17', '0416-6023183', '0274-2441863', 'suescuncy@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(740, 13500064, 'Bo-0060', 'Cabo/1ro', 'José Luís', 'Terán Lobo', 1, 5, 1998, 'Venezolano', 'Masculino', 'Merida', 7, 7, 1975, 'Bachiller', 'CIENCIAS', 'urb. carabobo , calle niño jesus casa numero 0-50', '0426-9798365', '', 'teranlobo75@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(741, 15031108, 'Bo-0236', 'Sgto/Aydte', 'Roger Alexander', 'Toro ', 1, 4, 2001, 'Venezolano', 'Masculino', 'Merida', 11, 5, 1982, 'Licenciado', 'Ciencias del Fuego Rescat', 'barrio pueblo nuevo calle', '0424-7442560', '', 'rogeralxandertoro@hotmail.com', 'Activo', '', 'Metropolitana'),
(742, 16855599, 'Bo-0773', 'Bombero', 'Deivis Junior', 'Toro Pérez', 1, 9, 2006, 'Venezolano', 'Masculino', 'CARACAS', 13, 2, 1985, 'TSU ', 'Construcion Civil', 'manzano bajo ejido', '', '4169736844', 'deivisjunior_2@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(743, 11960684, 'Bo-0061', 'Sgto/1ro', 'Joel Ricardo', 'Toro Rojas', 1, 9, 1995, 'Venezolano', 'Masculino', 'Merida', 13, 8, 1975, 'Bachiller', 'Ciencias', 'urv-carabobo v 37 casa nº05', '', '0416-088-5665', 'joeltoro13@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(744, 16655582, 'Bo-0651', 'Cabo/1ro', 'Jesús Roviro', 'Toro Zambrano', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 21, 1, 1984, 'Bachiller', 'CIENCIAS', 'el chamavia principal san antonio', '', '', 'jrto21@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(745, 20048508, 'Bo-0902', 'Cabo/2do', 'Carla Alejandra', 'Torres', 1, 1, 2008, 'Venezolano', 'Femenino', '', 17, 8, 1989, 'Tecnico Medio', '', 'chamita calle el ceibal casa 1-109', '', '', 'carlssolari_15@hotmail.com', 'Activo', '', 'Metropolitana'),
(746, 14588138, 'Bo-0469', 'Sgto/1ro', 'Gregorio José', 'Torres Lobo', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 4, 3, 1979, 'Tecnico Medio', 'RESCATE', 'el arenal urb los periodistas calle 4  casa 3', '2747896395', '4167738905', 'gregtor@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(747, 17522345, 'Bo-1023', 'Cabo/2do', 'Franklin Eduardo', 'Torres Lobo', 1, 1, 0, 'Venezolano', 'Masculino', 'Merida', 10, 8, 1986, 'Bachiller', 'CIENCIAS', 'el arenal urb. los periodistas calle 4, casa nº3 Mérida', '2747896395', '4160467274', 'franktorre_18@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(748, 13230613, 'Bo-0063', 'Sgto/2do', 'Jaiberth Jesús', 'Torres Molina', 1, 2, 1999, 'Venezolano', 'Masculino', 'TOVAR', 24, 12, 1976, 'Licenciado', 'EDUCACION INTEGRAL', 'el  punte sabaneta Tovar carrera 3 casa g-99', '0416-8752802', '4168732802', 'JAIBERTTORRE@HOTMAIL.COM', 'Activo', 'Incendio', 'Mocoties'),
(749, 19591169, 'Bo-0803', 'Cabo/1ro', 'Deyson Jesus', 'Torres Mora ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Merida', 7, 12, 1988, 'TM', 'EMERGENCIAS PREHOSPITALAR', 'chamita calle ceibal 1-79', '4265114816', '', 'deysontorres@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(750, 16200929, 'Bo-0470', 'Cabo/1ro', 'Aurimary Andreina', 'Torres Quintero', 1, 9, 2003, 'Venezolano', 'Femenino', 'Merida', 12, 4, 1984, 'TSU', 'EDUCACION ESPECIAL.', 'pedregosa baja urb los naranjos edificio 3 apto 303', '0416-2790125', '0274-2660002', 'bebesacha15-4@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(751, 8027861, 'Bo-0064', 'Cabo/1ro', 'Aldo Yunis', 'Torres Rondón', 1, 2, 1999, 'Venezolano', 'Masculino', 'Merida', 13, 2, 1960, 'Bachiller', '', 'calle las acacias sector chamita', '0416-7212977', '0274-2665325', 'Chama11_ar@hotmail.com', 'Activo', '', 'Metropolitana'),
(752, 17239631, 'Bo-0533', 'Distinguido', 'Yusmely Adriana', 'Trejo Avendaño', 1, 9, 2004, 'Venezolano', 'Femenino', 'merida', 14, 7, 1983, 'Bachiller', 'ciencias', 'urb la don luis calle 2 casa n-32', '4161727751', '2742213112', 'yadriana1@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(753, 9479624, 'Bo-0150', 'Sgto/Aydte', 'Clever Norberto', 'Trejo Díaz', 1, 8, 1995, 'Venezolano', 'Masculino', 'Merida', 15, 8, 1966, 'Tecnico Medio', 'RESCATE', 'el chamita residensias galeron calle15 casa 09', '', '2742600005', 'chepo-41@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(754, 14268521, 'Bo-0172', 'Sgto/1ro', 'Richard Enrique', 'Trejo Duran', 1, 1, 2000, 'Venezolano', 'Masculino', 'Merida', 3, 11, 1975, 'Bachiller', 'CIENCIAS', 'los sauzales vereda 12 casa 12', '', '4163796455', '', 'Activo', 'Servivida', 'Metropolitana'),
(755, 20572338, 'Bo-0928', 'Distinguido', 'Rixio Alberto', 'Trejo Uribe', 1, 1, 2008, 'Venezolano', 'Masculino', 'EL VIGIA', 11, 4, 1990, 'TSU ', 'RESCATE', 'caño seco iv calle principal edif 23 apartamento n-00-03', '4126927424', '2758828538', 'ra_tu_18@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(756, 11469294, 'Bo-0086', 'Sgto/2do', 'Giancarlos Magdiel', 'Trejo Urquiola', 1, 9, 1998, 'Venezolano', 'Masculino', 'GUANARE', 11, 12, 1973, 'Bachiller', 'Ciencias', 'urb el galeron calle 3 casa 3-22 el chamita', '0426-9263597', '0274-2669925', 'centinela_34@hotmail.com', 'Activo', 'SERVIVIDA', 'Metropolitana'),
(757, 11221507, 'Bo-0471', 'Sgto/Aydte', 'Rafael Arcángel', 'Trujillo Guillen', 1, 9, 2003, 'Venezolano', 'Masculino', 'LA AZULITA', 14, 3, 1973, 'TSU', 'MANEJO DE EMERGENCIA', 'la a zulita av zerpa entre calle 3 y 4', '0416-7757397', '0274-9997481', 'ratg14@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(758, 14106258, 'Bo-0087', 'SubTeniente', 'Yoni Alberto', 'Urbina Contreras', 1, 1, 1999, 'Venezolano', 'Masculino', 'Merida', 11, 11, 1979, 'Tecnico Medio', 'RESCATE', 'urb. el pilar blq 20 edf 01 aptp 00-02 ejido', '4265771013', '-4247779909', 'yoniurbi69@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(759, 19422089, 'Bo-0929', 'Cabo/2do', 'Edgar Antonio', 'Urbina Rojas ', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 22, 12, 1990, 'Tecnico Medio', 'RESCATE', 'puente la pedregoza casa 67-41 Mérida', '4247382339', '2742667702', 'elbotellita_02@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(760, 16908048, 'Bo-1024', 'Distinguido', 'Gustavo Enrique', 'Urbina Salas ', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 12, 3, 1986, 'Bachiller', 'CIENCIAS', 'Tovar, los limones parte alta sector el llano casa nº16-143', '', '0426-4625720', 'orion3_33@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(761, 14589945, 'Bo-0066', 'Cabo/1ro', 'Isauro Alberto', 'Urbina Sánchez', 1, 2, 1998, 'Venezolano', 'Masculino', 'merida', 12, 9, 1975, 'Tecnico Medio', 'PREHOSPITALARIA', 'av- los proceres puente la pedregosa casa n-84-72', '4263176894', '27909225', 'albertourbina8@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(762, 12048069, 'Bo-0196', 'SubTeniente', 'Nerio', 'Urbina Vera', 1, 6, 1998, 'Venezolano', 'Masculino', 'TOVAR', 20, 7, 1973, 'Bachiller', 'CIENCIAS', 'final calle  4 casa 0-62 el añil Tovar', '4166705220', '2758731437', 'www.tacupay@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(763, 17455659, 'Bo-0568', 'Cabo/2do', 'Francisco Alfonso', 'Uribe Dávila', 1, 2, 2005, 'Venezolano', 'Masculino', 'Merida', 15, 11, 1985, 'Tecnico Medio', 'BOMBERO', 'calle 18, entre av. 1y2 casa nº1-14 Mérida', '0424-7197419', '2744166151', 'bomberosMerida_uribe@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(764, 14401684, 'Bo-0472', 'SubTeniente', 'Nelson David', 'Uribe Zamora', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 4, 4, 1979, 'Licenciado', 'RESCATE', 'urb carabobo v 40 casa 1', '4147015230', '4121633617', 'uribenu4@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(765, 18308486, 'Bo-0695', 'Cabo/2do', 'Júnior José ', 'Uzcategui Carrillo ', 1, 1, 2006, 'Venezolano', 'Masculino', 'Merida', 5, 3, 1985, 'Tecnico Medio', 'INCENDIO', 'urb carlos gainza calle 2 casa 59  el arenal Mérida', '4166905500', '2742450373', '', 'Activo', 'Incendio', 'Metropolitana'),
(766, 15695783, 'Bo-0373', 'Sgto/2do', 'Daniel', 'Uzcategui Contreras', 1, 7, 2002, 'Venezolano', 'Masculino', '', 18, 3, 1984, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(767, 17771966, 'Bo-0473', 'Sgto/2do', 'César Andrés', 'Uzcategui Contreras', 1, 9, 2003, 'Venezolano', 'Masculino', 'TOVAR', 24, 10, 1986, 'Tecnico Medio', 'RESCATE', 'sector monseñor moreno calle 3 casa 4', '4267790911', '', 'cesarandres181@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(768, 16444768, 'Bo-0774', 'Cabo/1ro', 'Nick Alfredo', 'Uzcategui Marulanda', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 27, 3, 1985, 'Bachiller', 'CIENCIAS', 'el chama via principal san antonio casa 8', '0426-6754070', '2745119285', 'nicktheprincipe@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(769, 19097739, 'Bo-0903', 'Distinguido', 'Jesus Gregorio', 'Uzcategui Moncada', 1, 1, 2008, 'Venezolano', 'Masculino', 'EL VIGIA', 29, 9, 1988, 'Tecnico Medio', 'EMERGENCIAS PREHOSPITALAR', 'urb jose a. paez sector ii calle prinsipal casa 84', '0414/7344725', '0275/8816752', 'jesus_uzcategui_m@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(770, 11467862, 'Bo-0289', 'Sgto/2do', 'Eliexer Ramón', 'Uzcategui Pérez', 1, 3, 2002, 'Venezolano', 'Masculino', 'Merida', 14, 4, 1971, 'Bachiller', 'INTEGRAL', 'campo de oro pasaje romulo gallego 1-68', '0414-6935472', '0274-2663612', 'Eliexer_40@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(771, 12780877, 'Bo-0286', 'Cabo/1ro', 'Jhonny José', 'Valero Molina', 1, 3, 2002, 'Venezolano', 'Masculino', 'Merida', 6, 8, 1974, 'Bachiller', 'Integral', 'Don perucho av 08 casa 725', '4267589561', '2742441806', 'valero_jhonny1974@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(772, 19146410, 'Bo-0946', 'Distinguido', 'Leomar Jesus', 'Valero Ramirez', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 12, 6, 1990, 'Tecnico Medio', 'RESCATE', 'urb don luis calle 6 manzana 14 casa 42', '4264556334', '2742210054', 'valero_12_6@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(773, 16199919, 'Bo-0904', 'Cabo/2do', 'Ender José', 'Valero ramirez', 1, 1, 2008, 'Venezolano', 'Masculino', 'BARINAS', 12, 12, 1982, 'TSU', 'turismo', 'san jaciinto sector pie la loma via ppal casa s/n', '0426-1782449', '', 'ender_js@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(774, 15296475, 'Bo-0775', 'Cabo/1ro', 'Elimar José', 'Valero Ramírez', 1, 9, 2006, 'Venezolano', 'Masculino', 'VALENCIA', 14, 5, 1981, 'TSU ', 'INFORMATICA', 'urb san miguel v 2 casa 30 ejido', '0424-7381007', '0274-5117488', 'elivalero@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(775, 13097075, 'Bo-0228', 'SubTeniente', 'Giovanny Humberto', 'Valero Ruiz', 1, 4, 2001, 'Venezolano', 'Masculino', 'Merida', 29, 3, 1974, 'Bachiller', 'CIENCIAS', 'av. los proceres el rin con casa 1-14', '4262131126', '', 'giovannyv@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(776, 18946050, 'Bo-0987', 'Distinguido', 'Wayner Briley', 'Valles Ramirez', 1, 1, 2009, 'Venezolano', 'Masculino', 'FALCON', 25, 11, 1988, 'Bachiller', 'CIENCIAS', 'santa elena de arenales ', '', '4127991984', 'waynervalles@example.com', 'Activo', 'Conductor', 'Panamericana'),
(777, 13649330, 'Bo-0474', 'Sgto/1ro', 'José Rafael', 'Varela Albarran', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 14, 2, 1977, 'TSU', 'EMERGENCIA PREHOSPITALARI', 'sector pie llano , calle santa maria casa n° 3-95', '', '0274-2666246', 'rafaelja14@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(778, 17794221, 'Bo-0696', 'Distinguido', 'Thayna Emperatriz', 'Varela Salgado ', 1, 1, 2006, 'Venezolano', 'Femenino', '', 17, 5, 1986, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Panamericana'),
(779, 17709656, 'Bo-1026', 'Cabo/2do', 'Mayker Jose', 'Vargas Mayora', 1, 1, 2009, 'Venezolano', 'Masculino', 'LA GUAIRA', 11, 11, 1985, 'Tecnico Medio', 'MEDICINA DE EMERGENCIA', 'monseñor moreno urb jose  maria vargas modulo la guaira 33-1', '4165722873', '2758732941', 'elvargas13@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(780, 10106115, 'Bo-0068', 'Sgto/2do', 'Judith Coromoto', 'Vargas Vergara', 1, 7, 1996, 'Venezolano', 'Femenino', 'Merida', 16, 3, 1970, 'Tecnico Medio', 'PREHOSPITALARIA', 'el valle sector el playon alta casa s-n', '0416-1940805', '0274-2443645', 'JUDITH161603@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(781, 11104161, 'Bo-0740', 'Cabo/2do', 'Carlos Julio', 'Varon García', 1, 9, 2006, 'Venezolano', 'Masculino', 'EL VIGIA', 5, 6, 1973, 'Bachiller', 'CIENCIAS', 'los curos, sector negro primero, vereda 9, casa 19', '0416-1300343', '0274-2663612', '', 'Activo', 'Conductor', 'Mocoties'),
(782, 15296900, 'Bo-1027', 'Bombero', 'Jose Javier', 'Vasquez Marquez', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 29, 7, 1982, 'Bachiller', 'CIENCIAS', 'las mesitas del chama calle principal casa s/n ', '', '4266716213', 'JAVY_22240@HOTMAIL.COM', 'Activo', 'Conductor', 'Metropolitana'),
(783, 13229561, 'Bo-0905', 'Distinguido', 'Eudes Fernando', 'Velasco Contreras', 1, 1, 2008, 'Venezolano', 'Masculino', 'TOVAR', 10, 10, 1978, 'Bachiller', 'CONTABLIDADA', 'barrio santa elenna, calle principal casa s/n Tovar', '', '4162785010', 'velascoeudes@yahoo.es', 'Activo', 'Conductor', 'Mocoties'),
(784, 17523773, 'Bo-0652', 'Sgto/2do', 'Deiby Alexander', 'Vera Aparicio ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 27, 1, 1985, 'TSU ', 'emergencias prehospitalar', 'las Américas res. monseñor chacon t p apt 4-4', '', '0424-7745545', 'deiby_vera@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(785, 20938757, 'Bo-0930', 'Cabo/2do', 'Sergio José', 'Vera Bracho ', 1, 1, 2008, 'Venezolano', 'Masculino', 'EL VIGIA', 18, 2, 1990, 'Tecnico Medio', 'BOMBEROS', 'caño seco 3 calle 15 casa 50 el vigia ', '', '0426-1798747', 'SERGIOVERA08@HOTMAIL.ES', 'Activo', 'Rescate', 'Panamericana'),
(786, 12776670, 'Bo-0069', 'Cabo/1ro', 'Ender ', 'Vera Dávila', 1, 3, 1996, 'Venezolano', 'Masculino', '', 20, 10, 1975, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(787, 19997834, 'Bo-0804', 'Cabo/2do', 'Jose Yoney', 'Vera Duque ', 1, 1, 2007, 'Venezolano', 'Masculino', 'Merida', 7, 5, 1988, 'Tecnico Medio', 'RESCATE', 'los curos parte alta sector 03 09 casa 15', '4248369634', '', 'etibem62@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(788, 17238933, 'Bo-0653', 'Distinguido', 'Richard Alexander', 'Vera Pérez ', 1, 9, 2005, 'Venezolano', 'Masculino', 'Merida', 15, 6, 1985, 'Bachiller', 'HUMANIDADES', 'la pedregosa los maitines casa 72 sector el mirador', '', '4161365683', 'duenderv23@|hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(789, 17771237, 'Bo-0654', 'Cabo/1ro', 'Oscar Alexi', 'Verdi Balderama ', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR-Merida', 26, 9, 1987, 'Bachiller', 'ciencias', 'carrera 3 casa 0-20 el añil Tovar', '0416-0918725', '2758733098', 'kachorro05@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(790, 17770541, 'Bo-0655', 'Sgto/2do', 'Nelso Josue', 'Verdy Roa ', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR-Merida', 22, 6, 1987, 'Licenciado', 'Educacion mencion Desarro', 'el vigia caño seco iii av 1 casa 30', '4161172535', '2758819909', 'orion_nv18@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(791, 14663368, 'Bo-0374', 'Cabo/1ro', 'Luís Alberto', 'Vergara Torres', 1, 7, 2002, 'Venezolano', 'Masculino', 'BARINAS', 21, 8, 1979, 'Bachiller', 'CIENCIAS', 'el vigia caño seco iv calle 1 casa 29', '', '4247661349', 'luisbaritas@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(792, 16654202, 'Bo-0475', 'Sgto/1ro', 'José Isidoro', 'Vielma Rondón', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 10, 3, 1984, 'TSU ', 'RESCATE', 'santa ana norte calle1 casa n0-76 Mérida', '0426-4277163', '0275-9953252', 'vieljose@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(793, 19145594, 'Bo-0906', 'Distinguido', 'Jhonny Marcelo', 'Villafraz Zerpa', 1, 1, 2008, 'Venezolano', 'Masculino', 'Merida', 2, 2, 1988, 'Bachiller', 'CIENCIAS', 'urb padre duque calle 6 cas 10 e jido', '4247664133', '2742218192', 'jvillafraz@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(794, 13524119, 'Bo-0375', 'Sgto/2do', 'Mayra Alejandra', 'Villarreal Sulbaran', 1, 7, 2002, 'Venezolano', 'Femenino', 'Merida', 26, 2, 1976, 'Bachiller', 'CIENCIAS', 'urbanizacion galeron calle 03 casa 3-19 chama ', '4161164139', '0274-2600305', 'mayrich_26@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(795, 17238575, 'Bo-0535', 'Sgto/1ro', 'Genaro Antonio', 'Villarreal Villarreal', 1, 9, 2004, 'Venezolano', 'Masculino', '', 10, 1, 1984, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(796, 17894865, 'Bo-0536', 'Distinguido', 'Rogelio Antonio', 'Villarreal Villarreal', 1, 9, 2004, 'Venezolano', 'Masculino', 'MUCUCHIES', 10, 6, 1984, 'Bachiller', 'CIENCIAS', 'apartaderos sector las cañaditas casa s/n', '0426-8313874', '', '', 'Activo', 'Incendio', 'Paramo'),
(797, 19593745, 'Bo-1028', 'Cabo/2do', 'Marco Atilio', 'Villasmil Moreno ', 1, 1, 2009, 'Venezolano', 'Masculino', 'Merida', 24, 2, 1990, 'T.S.U.', 'Medicina prehospitalria', 'ejido, av bolivar urbanizacion el trapiche ,bloque 6 edificio 2 apto 00/01.', '0274/2210445', '4147102812', 'marcos_24748@hotmail.com ', 'Activo', 'Servivida', 'Metropolitana'),
(798, 18187591, 'Bo-0791', 'Distinguido', 'Giovanny A.', 'Villegas Guillén ', 1, 2, 2007, 'Venezolano', 'Masculino', 'Caracas', 19, 4, 1987, 'Bachiller', 'Ciencias', 'arapuey sector 23 de Enero casa 69', '4267453476', '2719892283', '', 'Activo', '', 'Panamericana'),
(799, 15943212, 'Bo-0476', 'Sgto/2do', 'Mervis Argenis', 'Villegas Rondón', 1, 9, 2003, 'Venezolano', 'Masculino', 'TRUJILLO', 29, 12, 1982, 'Bachiller', 'CIENCIAS', 'conjunto residenica inrevis calle 2, casa nº73  tucani', '4147555223', '', 'miyaguizan@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(800, 16351058, 'Bo-0656', 'Cabo/1ro', 'Francisco ', 'Villegas Rondón ', 1, 9, 2005, 'Venezolano', 'Masculino', 'ARAPUEY', 30, 7, 1984, 'Bachiller', 'CIENCIAS', 'playa grande, diagonal a la cancha deportiva', '0416-1727345', '', 'villegas_francisco@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(801, 19043829, 'Bo-0907', 'Distinguido', 'Jesus R.', 'Villegas Ruza ', 1, 1, 2008, 'Venezolano', 'Masculino', 'TRUJILLO', 1, 12, 1988, 'Tecnico Medio', 'MENCION BOMBERO', 'tucani, sector el carmen.calle 1 con carrera 4.', '4147534133', '0275/4441693', 'motogato@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(802, 14268949, 'Bo-0153', 'Teniente', 'Engelberth', 'Viloria Pabon', 1, 7, 1999, 'Venezolano', 'Masculino', 'TACHIRA', 3, 7, 1978, 'TSU ', 'Informatica', 'la pedregoza sur edf el pinal apto pb-4', '4162740799', '', 'engelviloria@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(803, 15753272, 'Bo-0071', 'Sgto/2do', 'Daniel Santos', 'Viña Meza', 16, 12, 1996, 'Venezolano', 'Masculino', 'Merida', 7, 7, 1975, 'Bachiller', 'CIENCIAS', 'urb carabobo v 34 casa 03', '', '4266706845', '', 'Activo', 'Servivida', 'Metropolitana'),
(804, 17896319, 'Bo-0537', 'Sgto/1ro', 'Jesús Manuel', 'Volcanes Rojas', 1, 9, 2004, 'Venezolano', 'Masculino', 'Merida', 5, 8, 1986, 'TSU ', '', 'urb. carlos sanchez calle 1 casa 8 ejido', '0274-2218317', '4162706192', 'jesus_volcanes18@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(805, 16664062, 'Bo-0477', 'Sgto/2do', 'Wilfredo', 'Volcanes Rondón', 1, 9, 2003, 'Venezolano', 'Masculino', 'MÉRIDA ', 16, 2, 1983, 'Bachiller', 'CIENCIAS ', 'urb carabobo bereda 24 casa 21', '', '0416-1381754', '', 'Activo', 'Incendio', 'Paramo'),
(806, 16019713, 'Bo-0660', 'Sgto/2do', 'Williams Alexis', 'Zambrano', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR', 18, 3, 1983, 'Bachiller', 'CIENCIAS', 'Tovar sector el piñon modulo 03 apartamento 04', '4168403215', '2752682471', '', 'Activo', 'Incendio', 'Mocoties'),
(807, 14401432, 'Bo-0776', 'Cabo/1ro', 'Edgar Alexander', 'Zambrano Becerra', 1, 9, 2006, 'Venezolano', 'Masculino', 'Merida', 23, 4, 1980, 'Bachiller', 'CIENCIAS', 'urb carabobo v37 casa 02', '', '4160896447', '', 'Activo', 'Rescate', 'Metropolitana'),
(808, 13965402, 'Bo-0072', 'Cabo/2do', 'Laurys Yasmin', 'Zambrano Contreras', 1, 1, 2000, 'Venezolano', 'Femenino', 'TOVAR estado Mérida', 4, 6, 1979, '', '', 'Tovar, sector los limones casa 2-42', '', '0416-8703020', 'yasmin0232@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(809, 11953016, 'Bo-0478', 'Cabo/1ro', 'Roberto', 'Zambrano Fernández', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida ', 17, 4, 1974, 'Bachiller', 'CIENCIAS', 'Mérida , la pedregosa media conjunto residencial san isidro calle albarrega', '0416-4739167', '2746587087', 'robertozf@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(810, 14255695, 'Bo-0215', 'SubTeniente', 'July Bell', 'Zambrano Flores', 1, 1, 2000, 'Venezolano', 'Femenino', 'TOVAR', 24, 3, 1980, 'TSU ', 'CIENCIAS', 'santa cruz de mora  calle la guaira casa n 4-2', '4162761019', '0275-8670061', 'venecia51@yahoo.es', 'Activo', 'Servivida', 'Mocoties'),
(811, 14936206, 'Bo-0657', 'Sgto/2do', 'Raely José', 'Zambrano Flores ', 1, 9, 2005, 'Venezolano', 'Masculino', 'TOVAR', 24, 1, 1982, 'Tecnico Medio', 'FITOTECNIA', 'av universidad casa 2-25 p/b', '0275-8670061', '0414-1942057', 'lierhadyman@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(812, 13014517, 'Bo-0376', 'Cabo/1ro', 'Eduar', 'Zambrano Martínez', 1, 7, 2002, 'Venezolano', 'Masculino', 'CANAGUA ', 26, 11, 1976, 'Bachiller', '', 'san jacinto 5 aguilas blancas calle 2 casa 60-81 ', '41699858866', '27425361', '', 'Activo', '', 'Mocoties'),
(813, 16020380, 'Bo-0658', 'Cabo/2do', 'Jesús Amado', 'Zambrano Martínez ', 1, 9, 2005, 'Venezolano', 'Masculino', 'CANAGUA ', 30, 11, 1980, 'Bachiller', 'CIENCIAS', 'ejido calle ayacucho casa 44', '0416-9730451', '', 'amado301@hotmail.com', 'Activo', 'Conductor', 'Paramo'),
(814, 12799808, 'Bo-0479', 'Sgto/2do', 'Carlos José', 'Zambrano Ramírez', 1, 9, 2003, 'Venezolano', 'Masculino', 'Merida', 31, 12, 1975, 'Bachiller', 'CIENCIAS', 'el vigia, sector la honda via la palmita, calle principal, cana s/n', '4265700846', '', 'aitierraljo@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(815, 13525569, 'Bo-0073', 'SubTeniente', 'Alix Omaira', 'Zambrano Ramírez', 1, 2, 1999, 'Venezolano', 'Femenino', 'SANTA CRUZ DE MORA', 7, 3, 1978, 'TSU', 'TECNOLOGIA BOMBERIL', 'el vigia urb. bubuqui 2, edf. 5 apto. 05-31', '4262756679', '4167767513', 'airtiersolmar@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(816, 17664241, 'Bo-0659', 'Bombero', 'Ysaias', 'Zambrano Rodríguez ', 1, 9, 2005, 'Venezolano', 'Masculino', '', 6, 4, 1985, 'Bachiller', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(817, 14623298, 'Bo-0378', 'Cabo/2do', 'Miguel', 'Zambrano Rosales', 1, 7, 2002, 'Venezolano', 'Masculino', '', 23, 11, 1979, 'Bachiller', 'CIENCIAS', 'tabay sector la mucuy alta via principal casa s/n ', '0426-7269460', '', '', 'Activo', 'Conductor', 'Paramo'),
(818, 15694745, 'Bo-0377', 'Cabo/1ro', 'Denis Oswaldo', 'Zambrano Ruiz', 1, 7, 2002, 'Venezolano', 'Masculino', 'TOVAR', 19, 11, 1982, 'TSU', 'MANEJO DE EMERGENCIA', 'mesa de adrian bailadores', '', '4268700106', 'dozr82@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(819, 17771361, 'Bo-1029', 'Bombero', 'Yordan Argenis', 'Zambrano Vega', 1, 1, 2009, 'Venezolano', 'Masculino', 'TOVAR', 21, 4, 1987, 'Bachiller', 'CIENCIAS', 'urb padre duque calle 2 casa n-221', '4262049357', '4145115399', 'nayiyesinia@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(820, 14268215, 'Bo-0661', 'Sgto/2do', 'Juan Miguel', 'Zerpa Arismendi', 1, 9, 2005, 'Venezolano', 'Masculino', '', 11, 11, 1980, 'Ingeniero', '', '', '', '', '', 'Activo', '', 'Metropolitana'),
(821, 11460374, 'Bo-0379', 'Sgto/1ro', 'Jorge Ali', 'Zerpa Briceño', 1, 7, 2002, 'Venezolano', 'Masculino', 'Merida', 28, 6, 1973, 'Bachiller', ' CIENCIAS', 'urb pinto salinas blq 5  edf 2  sanat juana', '0416-6694967', '0274-2524282', 'papanot1@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(822, 15694239, 'Bo-0074', 'Teniente', 'Luís Edecio', 'Zerpa Hernández', 1, 2, 1999, 'Venezolano', 'Masculino', 'TOVAR', 2, 5, 1979, 'TSU', 'INFORMATICA', 'Tovar, urb. la arboleda, sector el corozo, modulo1-2 ', '4169743469', '4169743469', 'edeciozer@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(823, 18798281, 'Bo-0697', 'Cabo/2do', 'Alfredo José ', 'Zerpa Uzcategui ', 1, 1, 2006, 'Venezolano', 'Masculino', 'Merida', 6, 11, 1988, 'Tecnico Medio', 'incendio', 'pedregosa alta loma corazon de jesus ultima casa', '4162734925', '2742637670', 'virra18@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(824, 18207439, 'Bo-1227', 'Bombero', 'Juan Carlos', 'Zerpa Zambrano', 1, 6, 2009, 'Venezolano', 'Masculino', 'TOVAR', 10, 10, 1986, 'Bachiller', 'CIENCIAS', 'las colina sector los pinos primera callle casa n7 Tovar', '', '4126561705', '', 'Activo', 'Servivida', 'Mocoties'),
(825, 17895885, 'Bo-1049', 'BOMBERO', 'JUNIOR ANTONIO ', 'ALBORNOZ CASTILLO ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida ', 26, 9, 1986, 'Bachiller', 'CIENCIAS ', 'capilla las mercedes calle francisco de miranda csa 2-30', '4165704895', '', '', 'Activo', '', ''),
(826, 19847882, 'Bo-1105', 'Bombero', 'Juan Carlos ', 'Acevedo Velazquez ', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 21, 11, 1989, 'Tecnico Medio', 'AGROPECUARIA', 'Tovar carrera 3  aclle 8 casa 3-32', '0426-3263091', '0275-8734740', '', 'Activo', 'Rescate', 'Mocoties'),
(827, 17991819, 'Bo-1143', 'Distinguido', 'Luis Antonio', 'Mendoza Godoy', 1, 3, 2010, 'Venezolano', 'Masculino', 'Yaracuy', 13, 12, 1985, 'TSU ', 'manejo de emergencia y ac', 'la pedregosa calle los ruises csa s/n', '0424-7198496', '', 'danfyl_2012@hotmail.com', 'Activo', '', ''),
(828, 17663349, 'Bo-1104', 'Distinguido', 'Fredy Alexi', 'Altuve Altuve ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 5, 9, 1984, 'Bachiller', 'CIENCIAS', 'el chama sector san antonio calle principal casa 12', '0416-3740681', '', 'cachimbo_05@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(829, 20217804, 'Bo-1106', 'Bombero', 'Dario Rene', 'Araque Duarte', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 23, 9, 1988, 'Bachiller', 'CIENCIAS', 'san isidro santa cruz de mora ', '4266127098', '', 'RENNEDARIOARAQUE@HOTMAIL.COM', 'Activo', 'Incendio', 'Mocoties'),
(830, 15755176, 'Bo-1052', 'Distinguido', 'Arthur Cristofesor', 'Avendaño Sánchez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 10, 9, 1983, 'Bachiller', 'CIENCIAS', 'los curos parte media vereda  casa nº 05', '4166707555', '0274-2714233', 'arthurcrito2003@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(831, 19046535, 'Bo-1107', 'Distinguido', 'Jojan Javier', 'Aza Castro ', 1, 3, 2010, 'Venezolano', 'Masculino', 'TACHIRA', 19, 7, 1986, 'Bachiller', 'CIENCIAS', 'urbanizacion el tabacal torre 18 pb 18-2 santa cruz de mora ', '0416-0750336', '', 'azafares1203@hotmail.con', 'Activo', 'Conductor', 'Mocoties'),
(832, 16907451, 'Bo-1076', 'Bombero', 'Josue Alfredo', 'Balazar Paredes', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 11, 6, 1986, 'Bachiller', 'HUMANIDADES', 'Tovar sector sabaneta via principal casa 08-35', '4268501450', '', 'bomberil_86@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(833, 17474000, 'Bo-1108', 'Bombero', 'Elis Oscar', 'Barillas Barroso', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 9, 9, 1985, 'Bachiller', 'CIENCIAS', 'carrera 07 casa 4-29 el corozo Tovar ', '0426-3710860', '', 'elisbarillas@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(834, 17028779, 'Bo-1109', 'Distinguido', 'Angel Enrique ', 'Barillas Molina', 1, 3, 2010, 'Venezolano', 'Masculino', 'El Vigia', 4, 11, 1986, 'Bachiller', 'ciencias', 'urbanizacion caño seco ii avenida 1 vereda 23 casa 42-10 el vigia ', '4247501399', '0275-2693830', 'venezuela_17028779@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(835, 13803110, 'Bo-1110', 'Distinguido', 'Maria Coromoto', 'Cáceres Márquez', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 13, 1, 1979, 'Bachiller', 'ciencias', 'avenida los proceres sector santa anita calle principal casa 2-51', '0416-3331024', '0274-2442352', '***', 'Activo', 'Servivida', 'Metropolitana'),
(836, 18055701, 'Bo-1111', 'Distinguido', 'Leoneris Enrique', 'Castellano Lopez ', 1, 3, 2010, 'Venezolano', 'Masculino', 'El Vigia', 20, 6, 1987, 'Bachiller', '', 'el vigia barrio la conquista calle chiquinquira ', '0426-9746247', '0275-8817879', '***', 'Activo', '', ''),
(837, 17322488, 'Bo-1055', 'Bombero', 'Manuel Oneiver', 'Chacón Márquez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 23, 2, 1985, 'Bachiller', 'Humanidades', 'sta cruz  aldeael guayabal por donde esta la capilla casa s/n', '4267035941', '0275-9890442', 'oneiver85@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(838, 20197853, 'Bo-1112', 'Bombero', 'Wuilliam José ', 'Chavarri Rondón', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 27, 9, 1990, 'Tecnico Medio', 'ELECTRONICA', 'urbanizacion santa monica bloque 08 apartamento 0102', '4165388025', '0274-2620692', 'wuilliam_chavarri_@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(839, 19486488, 'Bo-1114', 'Distinguido', 'Henrry Gabriel ', 'Contreras Araque', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR-Merida', 16, 7, 1989, 'Bachiller', 'Ciencias', 'sector pueblo nuevo calle principal casa s-n', '0416-2730923', '2759887570', 'EMILYFLORE13@HOTMAIL.COM', 'Activo', 'Servivida', 'Mocoties'),
(840, 17322245, 'Bo-1115', 'Bombero', 'José Daniel', 'Contreras García ', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 7, 9, 1985, 'Tecnico Medio', 'Informatica', 'el corozo Tovar calle 12 con carrera 11 casa 11-56', '4247060696', '', 'punk_30065@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(841, 19048841, 'Bo-1116', 'Bombero', 'Carlos Eduardo', 'Contreras Sánchez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 8, 11, 1988, 'Bachiller', 'CIENCIAS', 'el peñon calle principal sector san diego casa sin numero', '4268283877', '', 'Carlosnitro_9@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(842, 17663995, 'Bo-1117', 'Distinguido', 'Juan Ernesto', 'Cordero Torres ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 7, 9, 1986, 'Bachiller', 'ciencias', 'barrio campo de oro calle 03 casa 1-11', '0416-9091681', '0274-8083447', 'juacho_c@hotmail.com', 'Activo', '', ''),
(843, 18578483, 'Bo-1119', 'Bombero', 'Jesús Ramón', 'Escalante Bustamante', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merda', 25, 10, 1988, 'Bachiller', 'Ciencias', 'monseñor moreno calle 2 casa 10-a Tovar ', '0416-3145429', '0275-8733714', 'escalantejesus88@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(844, 15943070, 'Bo-1080', 'Bombero', 'Frensky Jhon', 'Gallo Segovia', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 7, 3, 1984, 'Bachiller', '', 'tucani sector zona nueva calle principal casa f-160', '4147478951', '0275-4145898', 'bmchiche@hotmail.com', 'Activo', 'Conductor', ''),
(845, 15142394, 'Bo-1081', 'Distinguido', 'Yohandry Luís', 'Garcez Andrades', 1, 3, 2010, 'Venezolano', 'Masculino', 'Caja Seca', 3, 8, 1981, 'Bachiller', 'Ciencias', 'urb. carabobo vereda 43 casa n 6 ', '0426-2780142', '', 'yohan_81garcez_03@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(846, 17323963, 'Bo-1082', 'Bombero', 'Deiber Jesús', 'García Contreras', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 8, 5, 1984, 'Bachiller', 'CIENCIAS', 'avenida 16 santa monica calle principal ', '4169714095', '0275-9884598', 'djgarcia_c84@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(847, 18207240, 'Bo-1124', 'Bombero', 'Douglas Jesús', 'García García', 1, 3, 2010, 'Venezolano', 'Masculino', 'CANAGUA ', 14, 1, 1988, 'Bachiller', 'ciencias', 'Canagua municipio arvispo chacon  via principal  casa S/N sector el Rincon', '416-1385247', '2759892437', 'garcia_douglas_18@hotmail.com', 'Activo', 'Rescate', 'Paramo'),
(848, 15923510, 'Bo-1084', 'Bombero', 'Alcira Coromoto', 'Gavidia Reinoza', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 29, 5, 1982, 'Bachiller', '', 'urbanizacion carabobo vereda 26 casa nº 12', '0414-7194623', '0274-2665713', 'alciragavidea@hotmail.com', 'Activo', '', ''),
(849, 17522560, 'Bo-1059', 'Cabo/2do', 'Raquel Adriana', 'Gómez Paredes', 1, 3, 2010, 'Venezolano', 'Femenino', 'Merida', 24, 3, 1986, 'Tecnico Medio', 'TURISMO', 'ejido el salado alto frente a la calle a la entrada frutas,casa n'' 18', '4265702566', '0416-6094260', 'Adrianarpg_22@hotmail.com', 'Activo', 'Incendio', ''),
(850, 17769146, 'Bo-1126', 'Bombero', 'Javier Enrique', 'Guerrero Zerpa', 1, 3, 2010, 'Venezolano', 'Masculino', 'Caracas', 11, 3, 1987, 'Bachiller', '', 'santa cruz sector santa marta', '0426-4747039', '0275-4004825', 'javier_bombero_87@hotmail.com', 'Activo', '', ''),
(851, 17662619, 'Bo-1128', 'Bombero', 'Beatriz Paola', 'Guzmán Peña', 1, 3, 2010, 'Venezolano', 'Femenino', 'El Vigia', 27, 11, 1986, 'Bachiller', 'Ciencias', 'urb. carabobo vereda 23, casa 19', '4164758182', '', 'guzmania_4@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(852, 19929461, 'Bo-1130', 'Bombero', 'Herney', 'Hernández', 1, 3, 2010, 'Venezolano', 'Masculino', 'SABANA DE MENDOZA', 29, 10, 1989, 'Bachiller', 'Ciencias', 'nva bolvia sector las acacias  casa s/n', '0424-2317029', '', '***', 'Activo', '', ''),
(853, 20217083, 'Bo-1087', 'Bombero', 'Leomar Antonio', 'Hernández Cerrada', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 16, 10, 1989, 'Bachiller', 'HUMANIDADES', 'monseñor moreno calle princiapl Tovar  casa nº 58', '0426-8043218', '0275-8733594', '****', 'Activo', '', ''),
(854, 19997673, 'Bo-1131', 'Distinguido', 'Willmar de Jesús', 'Ibarra García', 1, 3, 2010, 'Venezolano', 'Masculino', 'MARACACAIBO ', 27, 6, 1987, 'Bachiller', 'ciencias', 'urbanizacion carabobo casa 10 vereda 10', '4165733565', '0274-2665740', '', 'Activo', 'Incendio', ''),
(855, 17456445, 'Bo-1088', 'Bombero', 'Tomás Enrique', 'Jerez Landazabal', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 29, 12, 1984, 'Bachiller', 'ciencias', 'los curos parte alta sector 03 vereda 03 casa nº 11', 'O4247710207', '0274-2714283', 'nike_tom_7@hotmail.com', 'Activo', 'Rescate', ''),
(856, 18798766, 'Bo-1133', 'Distinguido', 'Yusbeli Sofía', 'Machacado Rincón', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 17, 7, 1987, 'Bachiller', 'ciencias', ' urbanizacion carabobo vereda 20 casa 01', '4269414821', '0274-5111680', 'YUSBELI17@HOTMAIL.COM', 'Activo', 'Rescate', ''),
(857, 17322619, 'Bo-1063', 'Cabo/2do', 'Jhonn Alexander', 'Márquez Atencio', 1, 3, 2010, 'Venezolano', 'Masculino', 'Caracas', 3, 12, 1986, 'Bachiller', 'ciencias', 'villa socorro calle principal Tovar', '0426-3490424', '0275-4153888', 'jmarquez_1974@hotmail.com', 'Activo', '', ''),
(858, 22504362, 'Bo-1135', 'Bombero', 'Breiner Osmel', 'Márquez Ceballos', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 13, 12, 1984, 'Tecnico Medio', 'Agropecuaria', 'sector brisa el mocoties calle principal  casa s/n', '0416-7752447', '', '****', 'Activo', '', '');
INSERT INTO `bombero` (`1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `17`, `18`, `19`, `20`, `21`, `22`, `23`, `24`) VALUES
(859, 18208245, 'Bo-1136', 'Bombero', 'Carlos Alberto', 'Márquez Gómez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida ', 30, 7, 1987, 'Bachiller', 'ciencias ', 'Tovar sabaneta sector las acacias calle ayacucho casanª 36', '0426-9679640', '0275-8732439', 'carlosmargueza87@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(860, 15074535, 'Bo-1064', 'Bombero', 'José Isacc', 'Márquez Márquez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida ', 14, 1, 1979, 'Bachiller', 'ciencias ', 'sector san jose santa cruz de mora ', '0416-4958255', '0275-9898571', 'joseisaac2010@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(861, 19048337, 'Bo-1138', 'Distinguido', 'Luís Eduardo', 'Márquez Molina', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 25, 3, 1988, 'Bachiller', 'ciencias ', 'santa cruz calle principal calle guayabal ', '4147258263', '', 'Luiseduardomarquez1@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(862, 20395659, 'Bo-1140', 'Distinguido', 'Antony Yustton', 'Márquez Parada', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 3, 9, 1990, 'Bachiller', 'ciencias ', 'santa cruz de mora sector alberto ravell casa s/n', '0414-7434334', '0275-8670842', 'antonyuston@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(863, 20141149, 'Bo-1141', 'Bombero', 'Deiver Daniel', 'Mateos Fuentes', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 11, 5, 1989, 'Bachiller', '', 'caño seco ii calle 06 casa 22 el vigia ', '0426-6035523', '', 'Deiverdaniel@hotmail.com', 'Activo', '', ''),
(864, 18579002, 'Bo-1091', 'Distinguido', 'Franklin Humberto', 'Medina Márquez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mèrida', 13, 2, 1988, 'Bachiller', 'ciencias', 'Tovar calle principal chimborozo', '0426-9773241', '', 'kranklinhumberto2011@hotmail.com', 'Activo', '', ''),
(865, 17523546, 'Bo-1092', 'Bombero', 'Juan Carlos', 'Mendez Molina', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 25, 10, 1986, 'Bachiller', 'Ciencias', 'urbanizacion carabobo vereda 23 casa nº 20', '0416-4790936', '', 'juancarlosmendez@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(866, 17894953, 'Bo-1065', 'Distinguido', 'Jhon Armando', 'Mesa Zambrano', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 30, 3, 1986, 'Tecnico Medio', '', 'urbanizacion san rafae calle 07 casa 380', '4265738323', '0274-2216451', 'gaton_18@hotmail.com', 'Activo', '', ''),
(867, 17322451, 'Bo-1145', 'Bombero', 'Elio Alejandro', 'Molina García', 1, 3, 2010, 'Venezolano', 'Masculino', 'merida', 13, 11, 1986, 'Tecnico Medio', 'Fitotecnia', 'santa cruz de mora sector san felipe casa s/nparroquia mesa de las palmas ', '4264790936', '', 'elio_6@hotmail.com', 'Activo', '', ''),
(868, 16908787, 'Bo-1146', 'Bombero', 'Iván Dario', 'Molina Guzmán', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 14, 6, 1986, 'Tecnico Medio', 'AGROPECUARIA ', 'apartamento la galera torre 06 piso nº3 apartamento 4-3 Tovar ', '0414-7239057', '', '***', 'Activo', 'Servivida', 'Mocoties'),
(869, 17663981, 'Bo-1147', 'Bombero', 'Yeny Carolina', 'Molina Márquez', 1, 3, 2010, 'Venezolano', 'Femenino', 'Merida', 31, 10, 1985, 'Bachiller', '', 'urbanizacion carabobo vereda 32 casa nº 08', '0412-5131607', '0274-2665173', 'yeny_molina_sar@hotmail.com', 'Activo', '', ''),
(870, 18579095, 'Bo-1067', 'Distinguido', 'Jesús Eduardo', 'Mora Peña', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 14, 12, 1988, 'Bachiller', 'Ciencias', 'sector la gruta sabaneta Tovar carrera 3 casa s/n', '4266782364', '2758733041', 'jesus_mora20@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(871, 19995802, 'Bo-1103', 'Bombero', 'Lenny Solimar', 'Muñoz Rojo', 1, 3, 2010, 'Venezolano', 'Femenino', 'Merida', 28, 2, 1988, 'Bachiller', 'CIENCIAS', 'san elena pasaje paraiso casa 0-50', '4247500079', '2742623936', 'tunegra_14_4@hotmail.com ', 'Activo', 'Incendio', 'Metropolitana'),
(872, 18577996, 'Bo-1153', 'Distinguido', 'Daniel Albeiro', 'Nava Contreras', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 12, 8, 1988, 'Bachiller', '', 'ejido sector san miguel casa 1-15', '0424-6779134', '2754112556', 'danielnava08@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(873, 18208370, 'Bo-1154', 'Distinguido', 'Leonel Alberto', 'Olejua Sánchez', 1, 3, 2010, 'Venezolano', 'Masculino', 'trujillo', 8, 11, 1988, 'Bachiller', 'ciencias', 'Tovar el peñon calle 02 con carrera 04 casa 36-40', '4264137606', '0275-8732164', 'el_fosil_@hotmail.com', 'Activo', '', ''),
(874, 15622070, 'Bo-1158', 'Bombero', 'Julio Cesar', 'Peña', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 28, 10, 1982, 'Tecnico Medio', 'Construccion civil', 'el chama sector san antonio casa 1-30', '', '', 'rasce115@hotmail.com ', 'Activo', 'Servivida', 'Metropolitana'),
(875, 19894169, 'Bo-1157', 'Bombero', 'Julio Alberto', 'Peña Uzcategui', 1, 3, 2010, 'Venezolano', 'Masculino', 'merida', 2, 6, 1988, 'Bachiller', 'Ciencias', 'alto los guayabos via jaji casa s/n', '0416-9551318', '', 'juliopena2@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(876, 17322198, 'Bo-1159', 'Bombero', 'Yoarvy José ', 'Peñaloza Carrero', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 24, 9, 1984, 'Bachiller', 'CIENCIAS', 'Tovar quebrada blanca calle la victoria ', '0416-1354645', '0275-8731576', '', 'Activo', 'Rescate', 'Mocoties'),
(877, 16147321, 'Bo-1162', 'Bombero', 'Adrian Manuel', 'Querales Duarte', 1, 3, 2010, 'Venezolano', 'Masculino', 'Caracas', 14, 1, 1982, 'Bachiller', '', 'san jacinto frente cinco aguilas blancas casa la caraña', '0416-0467720', '0274-6583107', 'adrian_q14@hotmail.com', 'Activo', '', ''),
(878, 18864473, 'Bo-1168', 'Distinguido', 'Gerardo Antonio', 'Rangel Ramírez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 22, 12, 1985, 'Bachiller', 'Integral', 'las rurarle nueva bolivia casa s/n', '0426-8040824', '0275-4113980', 'rangel_morfeo@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(879, 17488571, 'Bo-1098', 'Bombero', 'Armando José', 'Roa Román', 1, 3, 2010, 'Venezolano', 'Masculino', 'Caracas', 15, 9, 1985, 'Bachiller', '', 'Tovar urbanizacion jose maria vargas', '0426-2334170', '0275-8733458', 'armando_16_243@hotmail.com', 'Activo', '', ''),
(880, 15695189, 'Bo-1069', 'Distinguido', 'José Luís', 'Rodríguez Guerrero', 1, 3, 2010, 'Venezolano', 'Masculino', '', 22, 5, 1983, 'Bachiller', '', 'Tovar parte baja los limones sector la lagunita ', '4169771090', '0275-8080215', '***', 'Activo', '', ''),
(881, 17662367, 'Bo-1071', 'Cabo/2do', 'Fernando José', 'Rodríguez Peña', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 7, 12, 1985, 'Bachiller', '', 'calle herminia rosa casa nº 20 ejido ', '0416-3429274', '0274-6571458', 'fernando_rescuer@hotmail.com', 'Activo', '', ''),
(882, 18579210, 'Bo-1171', 'Bombero', 'Jackson José', 'Rojas Azuaje', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 1, 11, 1989, 'Bachiller', 'Ciencias', 'Tovar el peñon calle principal casa 04/02 ', '0424-7337909', '', 'yackson_r_a@hotmail.es', 'Activo', '', ''),
(883, 16906622, 'Bo-1100', 'Distinguido', 'Miguel Adrián', 'Rondón Contreras', 1, 2, 2010, 'Venezolano', 'Masculino', 'Mérida', 27, 9, 1985, 'Bachiller', '', 'sector quebrada blanca calle principal sabaneta ', '0426-3337648', '', 'miguel_rondon23@hotmail.com', 'Activo', '', ''),
(884, 16317589, 'Bo-1174', 'Bombero', 'Milagros Andreina', 'Rosales Rujano', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 11, 4, 1984, 'Bachiller', 'Humanidades', 'Tovar sector quebrada ariba calle santiago rojas 04/74', '4267711807', '0275/8731119', 'milagros_rosales@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(885, 19486876, 'Bo-1177', 'Distinguido', 'Enrique José', 'Santiago Lacruz', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR-Mérida', 1, 10, 1989, 'Bachiller', 'Ciencias', 'Tovar el llano quebrada arriba calle los pachos  casa s/n', '4269707404', '0275-8084926', 'santiag0enrique@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(886, 17769476, 'Bo-1102', 'Bombero', 'Nestor José', 'Serrano Pérez', 0, 0, 0, 'Venezolano', 'Masculino', 'Mérida', 27, 9, 1986, 'Bachiller', 'Ciencias', 'paiva santa cruz de mora casa S/N', '4161728642', '0275-8670129', '', 'Activo', '', ''),
(887, 14761587, 'Bo-1178', 'Bombero', 'José Armando', 'Sosa Obando', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 28, 2, 1981, 'Tecnico Medio', 'informatica', 'san juan de lagunillas la hollada los caracoles calle las minas ', '4264088377', '', 'armandojas@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(888, 16933609, 'Bo-1179', 'Cabo/2do', 'Juan Manuel ', 'Suárez Rojas', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 4, 5, 1986, 'Bachiller', 'Ciencias', 'urbanizacion carabobo calle 2 casa nº 15', '4261787337', '0274-2665146', 'Juanmanuelrojas08@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(889, 18309723, 'Bo-1073', 'Bombero', 'Dumar Javier', 'Torres Cadenas', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 25, 9, 1988, 'Bachiller', 'HUMANIDADES', 'urbanizacion la carabobo sector el porta chuelo ', '1462966698', '2742665912', 'dumartorres16@hotmail.com', 'Activo', 'Servivida', ''),
(890, 16907246, 'Bo-1186', 'Distinguido', 'Johan Antonio', 'Vega Caraballo ', 1, 3, 2010, 'Venezolano', 'Masculino', 'CARACAS', 10, 11, 1984, 'Bachiller', 'CIENCIAS', 'el amparo calle la onda casa la reina ', '0426-3040450', '0275-4145676', 'carlitos3213@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(891, 16317540, 'Bo-1184', 'Bombero', 'Wuiller Alexis', 'Vega Márquez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 1, 12, 1984, 'Bachiller', '', 'quebrada el barro calle panamericana santa cruz de mora', '4263788135', '0275-4002135', 'v_wuiller@hotmail.com', 'Activo', '', ''),
(892, 19146809, 'Bo-1074', 'Distinguido', 'Douglas Leonardo', 'Velázquez Díaz', 1, 3, 0, 'Venezolano', 'Masculino', 'Mérida', 18, 8, 1988, 'TSU ', 'Emergencias Prehospitalar', 'el valle sector monterey medio casa s/n', '0416-7234571', '0274-6575224', 'leovelazquez88@hotmail.com', 'Activo', '', ''),
(893, 15622646, 'Bo-1187', 'Bombero', 'Wilmer Antonio', 'Vergara Rangel', 1, 3, 2010, 'Venezolano', 'Masculino', 'El Vigia', 21, 8, 1981, 'TSU', 'Administracion de Empresa', 'san jacinto el rincon bajo casa 563', '0414-7483848', '0274-5116071', 'wilmerv_1981@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(894, 19996973, 'Bo-1075', 'Distinguido', 'Ricardo José', 'Vivas Guerrero', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 4, 4, 1990, 'Bachiller', '', 'los curos parte alta sector bicentenario casa 38', '4161198889', '0274-2715463', 'rjvg_42@hotmail.com', 'Activo', '', ''),
(895, 17770848, 'Bo-1189', 'Bombero', 'Elvis Leonardo', 'Zambrano Pérez', 1, 3, 0, 'Venezolano', 'Masculino', 'Mérida', 6, 5, 1988, 'Bachiller', '', 'la gruta sabaneta Tovar', '0146-9752150', '0275-8732919', '**º', 'Activo', '', ''),
(896, 19995676, 'Bo-1239', 'Bombero', 'Ramon Antonio', 'Rivas Barrios', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 15, 10, 1989, 'Bachiller', 'Ciencias', 'jose adelmo gutierres,parte baja,calle principal,casa 01', '4247361334', '0414-7153155', 'ramonrivas_0123@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(897, 16445425, 'Bo-1057', 'Distinguido', 'José Lino', 'Dávila Sánchez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 1, 11, 1983, 'Bachiller', 'ciencias', 'via el manzano bajo urb los bucares ejidoapartamento pba torre 02', '4267293171', '0274-4173354', '', 'Activo', 'Incendio', 'Metropolitana'),
(898, 18965851, 'Bo-1144', 'Distinguido', 'Frami  José', 'Mendoza Tinoco', 1, 3, 2010, 'Venezolano', 'Masculino', 'Miranda', 22, 5, 1988, 'Bachiller', '', 'av humberto tejera casa 1-76', '0426-4724361', '', 'FRAMI410@HOTMAIL.COM', 'Activo', '', ''),
(899, 17771561, 'Bo-1148', 'Bombero', 'Edilson De Jesús', 'Montilla Domínguez', 1, 3, 2010, 'Venezolano', 'Masculino', 'TR5UJILLO', 1, 9, 1986, 'Bachiller', 'CIENCIAS', 'santa cruz sector el hospital casa 77', '0416-1338988', '0275-2671834', '', 'Activo', 'Conductor', ''),
(900, 19048752, 'Bo-1066', 'Bombero', 'José Gregorio', 'Montilla Flores', 1, 3, 2010, 'Venezolano', 'Masculino', 'Caracas', 16, 11, 1987, 'Bachiller', 'ciencias', 'Tovar quebrada arriva el llano partealtacalle pricipal casa 54', '4162397354', '2752674288', 'elpapi870@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(901, 17341678, 'Bo-1149', 'Distinguido', 'Ansony José', 'Mora Ferreira', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 12, 6, 1986, 'Bachiller', '', 'ejido el palmo parte alta calle 4 casa 52 Mérida', '', '0274-2219304', 'AnsonyJM@hotmail.com', 'Activo', '', ''),
(902, 18209618, 'Bo-1150', 'Cabo/2do', 'Samuel Josue', 'Mora Guzmán', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 9, 11, 1987, 'Bachiller', 'CIENCIAS', 'la cascada del guayabal casa s/n santa cruz de mora', '4247469143', '2755165665', 'mora_sami@hotmail.com', 'Activo', 'Servivida', ''),
(903, 17171907, 'Bo-1151', 'Bombero', 'Darvi José', 'Mora Pineda', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 31, 5, 1985, 'Bachiller', 'Integral', 'santa cruz  de mora el guayabal la cascada casa s/n', '0424-7197728', '0275-4146069', 'DARVINJOSEMORAPINEDA@HOTMAIL.COM', 'Activo', '', ''),
(904, 17770717, 'Bo-1094', 'Bombero', 'Juan Carlos', 'Morales Gutiérrez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 7, 2, 1987, 'Bachiller', 'CIENCIAS', 'el llano rosal calle los gutierrez casa nº 5-1 Tovar', '0424-7778161', '0275-8733857', 'juanc7287@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(905, 17341863, 'Bo-1155', 'Distinguido', 'José Arturo', 'Ortega Urquiola', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 28, 12, 1986, 'Bachiller', 'CIENCIAS', 'ejido urbanización san miguel vereda 17 casa nº 15', '0426-3250736', '0274-2210636', 'arturoortega_09@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(906, 15695344, 'Bo-1156', 'Bombero', 'Héctor Luís', 'Peña Márquez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 1, 11, 1983, 'Bachiller', 'CIENCIAS', 'Tovar sectro sabaneta calle principal quebrada blanca casa n° 0-75', '4164279539', '0275-2689257', 'PEÑAHECTOR344@HOTMAIL.CO', 'Activo', 'Incendio', 'Metropolitana'),
(907, 19487113, 'Bo-1095', 'Bombero', 'Jhon Alexander', 'Prieto Pérez', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 4, 8, 1990, 'Bachiller', 'CIENCIAS', 'santa cruz de mora las delicias via la macana casa s/n', '4267260032', '0275-4110984', '', 'Activo', 'Rescate', 'Mocoties'),
(908, 20200239, 'Bo-1163', 'Distinguido', 'Yuraima del Valle', 'Ramírez Guillen', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 21, 10, 1990, 'Bachiller', 'ciencias', 'urb campo de oro calle 03 casa 1/11', '0416-8141807', '0274-8083447', 'yuidelvara_21@hotmail.com', 'Activo', '', ''),
(909, 18208692, 'Bo-1096', 'Bombero', 'Jan Carlos', 'Ramírez Piñuela', 1, 3, 2010, 'Venezolano', 'Masculino', 'Zulia', 25, 11, 1987, 'Bachiller', '', 'santa cruz de mora sector el mirador casa s/n', '0424-7335134', '', '', 'Activo', '', ''),
(910, 20352844, 'Bo-1097', 'Bombero', 'Johan José', 'Ramírez Plaza', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 8, 11, 1990, 'Bachiller', '', 'calle principal casa s/n frente la tanquilla de agua gran parada tucani', '0426-7722330', '0275-5163233', '', 'Activo', '', ''),
(911, 19503678, 'Bo-1165', 'Bombero', 'Yoni José', 'Ramírez Rivera', 1, 3, 2010, 'Venezolano', 'Masculino', 'VIGIA', 16, 11, 1986, 'Bachiller', 'CIENCIAS', 'el vigia sector san isidro calle 09 casa15-79', '0424-7441436', '0275-5168355', 'JHON_DEIVER@HOTMAIL.COM', 'Activo', 'Incendio', ''),
(912, 20197951, 'Bo-1068', 'Bombero', 'Marley Del Carmen', 'Ramírez Rojas', 1, 3, 2010, 'Venezolano', 'Femenino', 'Merida ', 10, 7, 1990, 'Bachiller', 'ciencias', 'ejido aguas calientes calle principal casa 45', '0426-7722330', '0274-2217390', '', 'Activo', 'Rescate', 'Metropolitana'),
(913, 18208892, 'Bo-1169', 'Distinguido', 'Edgar Rubén', 'Rincón Albarracin', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 4, 7, 1988, 'Tecnico Medio', 'AGROPECUARIA', 'carrera 03 bis curva savaneta casa e-85', '0426-9791093', '0275-8733376', 'EDGAR_MIBEBESASO_88@HOTMAIL.COM', 'Activo', 'Rescate', 'Mocoties'),
(914, 16443431, 'Bo-1099', 'Bombero', 'Cherly Daneycy', 'Rodríguez Márquez', 1, 3, 2010, 'Venezolano', 'Femenino', 'CARACAS', 30, 10, 1984, 'Bachiller', 'CIENCAIS', 'ejido bella vista calle los cedroscasa 01/30', '0416-7780979', '0274/2218688', 'cherly_30_10@hotmail.com', 'Activo', 'Servivida', ''),
(915, 19539743, 'Bo-1170', 'Bombero', 'Aldemar', 'Rodríguez Perea', 1, 3, 2010, 'Venezolano', 'Masculino', 'VIGIA', 22, 2, 1990, 'Bachiller', 'CIENCIAS', 'el vigia caño seco 02 calle 13 casa 41', '0424-7584363', '0275-8819156', 'JUNI_LOBO17@HOTMAIL.COM', 'Activo', 'Incendio', 'Panamericana'),
(916, 19752286, 'Bo-1172', 'Bombero', 'Jhoanna Lisseth', 'Rojas Saavedra', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 26, 8, 1990, 'Bachiller', '', 'puente la pedregosa sector el mirador casa 4 -223', '0426-4720072', '0274-4167844', 'Jlrojassvdra@gmail.com', 'Activo', '', ''),
(917, 15620096, 'Bo-1072', 'Bombero', 'Mary Inés', 'Ruiz ', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 19, 7, 1980, 'Bachiller', '', 'el rincón la otra banda casa nº 1-14 Mérida', '', '0274-2453542', 'fer.mi_27@hotmail.com', 'Activo', '', ''),
(918, 18577760, 'Bo-1176', 'Bombero', 'José Antonio', 'Sánchez Roa', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 15, 8, 1988, 'Bachiller', 'CIENCIAS', 'el llano los limones calle 10 casa nº2-45 parte alta Tovar', '4164771603', '0275-8730380', 'jarsr.@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(919, 18209644, 'Bo-1101', 'Bombero', 'Jorge Félix', 'Semerene Jaimes', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 29, 11, 1988, 'Bachiller', 'CIENCIAS', 'barrio monseñor moreno calle nº 2 casa nº 40 Tovar', '4168289377', '0275-8733542', '', 'Activo', '', 'Mocoties'),
(920, 14401685, 'Bo-1181', 'Bombero', 'Nelson Daniel', 'Uribe Zamora', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 8, 5, 1980, 'Bachiller', 'CIENCIAS', 'ejido los guaimaros santo eduvijes casa 149 calle 09 ', '4267700260', '', '', 'Activo', 'Rescate', 'Metropolitana'),
(921, 18310076, 'Bo-1185', 'Distinguido', 'Anlly Yolisbel', 'Vera Becerra', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 14, 11, 1987, 'TSU ', 'manejo de emergencia', 'sector chama calle los bucares casa01-154 ', '0412-1720068', '', 'anllyvera24@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(922, 16906804, 'Bo-1188', 'Distinguido', 'Ronal Danilo', 'Vivas Rivas', 1, 3, 2010, 'Venezolano', 'Masculino', 'Campo Alegre Mérida', 5, 8, 1985, 'Bachiller', 'Ciencia', 'aldea campo alegre finca los vivas santa cruz de moira ', '4269139982', '', 'RASTAFARI5_4@HOTMAIL.COM', 'Activo', '', ''),
(923, 15923079, 'Bo-1232', 'Cabo/1ro', 'Daniel Antonio', 'Avendaño ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 30, 3, 1981, 'Tecnico Medio', 'TECNICO SUPERIOR EN LEYES', 'los llanitos de tabay parte alta capilla las mercedes pasaje alfredo avenda', '4143795708', '0274-5111883', 'avendañodaniel30@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(924, 21182676, 'Bo-1233', 'Distinguido', 'DANYELA AILEC', 'GIRALDO MENDEZ', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 25, 9, 1991, 'Tecnico Medio', '', 'el arenal sector carlos gainza casa 01-1126', '0416-0926147', '0274-5118988', 'MIAU_259@HOTMAIL.COM', 'Activo', 'servivida', 'Metropolitana'),
(925, 16654551, 'Bo-1022', 'Distinguido', 'ERICSON ENRIQUE', 'SULBARAN CARRERO', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 19, 2, 1984, 'Bachiller', '', 'el arenal residencias los periodistas bloque 05 aparta 00-01', '0424-7423609', '', 'LAKE_S_HOUSE@HOTMAIL.COM', 'Activo', '', ''),
(926, 18374734, 'Bo-1061', 'Distinguido', 'Luis Cristobal', 'Herrera Peñaranda', 1, 3, 2010, 'Venezolano', 'Masculino', 'VIGIA', 14, 2, 1986, 'Bachiller', 'Ciencias', 'el vigia caño seco 02 calle 12 casa 23 ', '0424-7328252', '0275-8810289', 'luiscaiced24@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(927, 3961369, 'Bo-1231', 'Teniente', 'Jose Vicencio', 'Angulo Márquez ', 1, 3, 2010, 'Venezolano', 'Masculino', 'San Cristobal edo TACHIRA', 14, 8, 1952, 'Bachiller', 'HUMANIDADES', 'el vigia parroquia pulido mendez, av 2, casa nº 27', '4247423609', '0275-8815890', 'josevicencio52@hotmail.com', 'Activo', '', 'Panamericana'),
(928, 11911715, 'Bo-1235', 'Cabo/2do', 'Jose Omar', 'Prada Escalante ', 1, 3, 2010, 'Venezolano', 'Masculino', 'VIGIA', 27, 1, 1972, 'Bachiller', 'Ciencias', 'Tovar urb vista alegre calle con carrera 1 nª 3-63', '0416-8321788', '0275-2684732', 'cuago72@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(929, 11461256, 'Bo-1238', 'Cabo/2do', 'Carlos Gustavo', 'Vielma Davila ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 29, 8, 1970, 'Licenciado', '', 'urbanizacion carabobo clle corazon de jesus casa numero 9 apartamento numer', '0424-7567316', '0274-2447139', 'carlos.gustabo37@hotmail.com', 'Activo', 'Servivida', ''),
(930, 15074729, 'Bo-1089', 'Bombero', 'Leandro Esteban', 'Márquez  ', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 12, 1, 1981, 'Bachiller', '', 'las colina s parroquie el llano municipio Tovar', '0416-2753625', '2758084701', '', 'Activo', '', ''),
(931, 12356337, 'Bo-1236', 'Bombero', 'Yadira Alexandra', 'Rodriguez sanchez ', 1, 3, 2010, 'Venezolano', 'Femenino', 'San cristobal ', 9, 8, 1976, 'TSU ', 'Dificultad delaprendizaje', 'loma los maitines, puente la pèdregosa', '0416-7743276', '0274-6572616', 'yrodriguez_76@hotmail.es', 'Activo', 'Incendio', 'Metropolitana'),
(932, 20434628, 'Bo-1237', 'Bombero', 'Yamileth Andreina', 'Rojas Rujano ', 1, 3, 2010, 'Venezolano', 'Femenino', 'Merida', 2, 8, 1991, 'Tecnico Medio', 'pre-hospitalaria', 'el arenal, urb. don perucho, av. 6 nnº 497', '4261873705', '0274-5118347', 'andreina@hotmail.com', 'Activo', 'rescate', 'Panamericana'),
(933, 17522825, 'Bo-1241', 'Bombero', 'Ricardo José', 'Ramírez Cossu ', 1, 5, 2010, 'Venezolano', 'Masculino', 'Mérida', 5, 6, 1986, 'Bachiller', '', 'los curos,parte alta bqe. 43-2, apto. 02/03, piso 2', '0426-8289333', '0274-2668039', '', 'Activo', '', ''),
(934, 16664033, 'Bo-1240', 'Bombero', 'Yelitza', 'Escalona Peña ', 1, 5, 2010, 'Venezolano', 'Femenino', 'Merida', 29, 5, 1984, 'Tecnico Medio', 'Bombero ', 'jaji sector las cruces loma del rosario parte baja casa nº 8', '0426-9275818', '0426-4280295', 'yeli_2013@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(935, 17, 'Bo-1050', 'Bombero', 'Germán Ramón', 'Angulo Becerra ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Caracas', 1, 7, 1986, 'Bachiller', '', 'ejido, sector las mesitas, los guaimaros,casa nº b-10', '0426-7887227', '0274-4170888', '', 'Activo', '', ''),
(936, 17771469, 'Bo-1079', 'Bombero', 'Yohan Benerando', 'Contreras Ortega ', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR-Merida', 20, 10, 1986, 'Bachiller', 'ciencias', 'santa cruz de mora,aldea san isidro alto;calle principalcasa s/n', '4267056166', '', 'yohan_bombero20@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(937, 12353250, 'Bo-1125', 'Distinguido', 'Julio Cesar', 'González Villarrial ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 30, 7, 1976, 'Bachiller', '', 'conjunto residencial santa ana norte bloque 08 apartamento 04-02 av alverto', '0416-1775952', '0274-2447791', 'jskgonzalez@hotmail.es', 'Activo', '', ''),
(938, 19487952, 'Bo-1086', 'Distinguido', 'José Luis', 'Gutierrez Duarte ', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 4, 12, 1989, 'Bachiller', 'ciencias', 'sta cruz de mora san isidro bajo calle principal casa s/n', '0426-9717038', '', 'josegutierrez60@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(939, 17895933, 'Bo-1122', 'Bombero', 'Ydania Esther', 'Fernández Robain ', 1, 3, 2010, 'Venezolano', 'Femenino', 'Merida', 2, 8, 1984, 'Bachiller', 'ciencias', 'zumba la parroquia calle principal casa n 14', '0416-1775952', '0274-5113376', 'cristoferirf@hotmail.com', 'Activo', 'Incendio', ''),
(940, 19046917, 'Bo-1062', 'Bombero', 'Daniel Humberto', 'Márquez Araque  ', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 30, 1, 1988, 'Bachiller', 'ciencias', 'el cacique via principal Tovar cerca de la escuela ', '', '0426-8794656', 'danielmarquez_25@hotmail.com', 'Activo', '', ''),
(941, 14916949, 'Bo-1093', 'Bombero', 'Yuraima Carolina', 'Mora Molina ', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 26, 10, 1981, 'Bachiller', '', 'urb carabobo vereda 30', '0424-7023649', '0274-2665333', '', 'Activo', '', ''),
(942, 20217041, 'Bo-1070', 'Bombero', 'Jose Daniel', 'Rodriguez Molina', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 30, 8, 1990, 'Bachiller', 'ciencias', 'el añil,carrera 1 casa 0-19 Tovar', '4264264257', '2742664323', 'pachi3008@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(943, 20851011, 'Bo-1166', 'Bombero', 'WUILDER JOSE', 'RAMIREZ ROJAS', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida', 26, 4, 1990, 'Bachiller', 'ciencias', 'salado bajo,sector la montañita,calle los pinos, casa nº 17', '4247023649', '', 'wilderramirez@hotmai.com', 'Activo', '', 'Metropolitana'),
(944, 17321631, 'Bo-1161', 'Bombero', 'Frhan Daniel', 'Posadas Acevedo', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 30, 1, 1986, 'Bachiller', '', 'el amparo aldea el cambur', '4264314040', '0275-9891580', 'frhandanielposadas@gmail.com', 'Activo', '', ''),
(945, 15942135, 'Bo-1160', 'Bombero', 'Charlis', 'Pineda Cubillan', 1, 3, 2010, 'Venezolano', 'Masculino', 'CAJA SECA ', 9, 12, 1982, 'Tecnico Medio', '', 'palmarito ', '4162635101', '', 'charlis_pineda@yahoo.com', 'Activo', 'Incendio', 'Panamericana'),
(946, 8709291, 'Bo-1249', 'Distinguido', 'Gerardo Enrrique', 'Altuve Moreno', 1, 3, 2010, 'Venezolano', 'Femenino', '', 4, 6, 1965, 'Bachiller', '', 'calle 01 casa 2-30 el añil Tovar', '0416-3789265', '0275-8732503', 'atuvemoreno@gmail.com', 'Activo', '', ''),
(947, 4542915, 'Bo-1243', 'Sgto/2do', 'Elsy Tereza', 'Preziuso De Barrios', 1, 7, 2010, 'Venezolano', 'Femenino', 'Mérida ', 14, 12, 1955, 'Bachiller', '', 'serrania casa clud torre 12 piso 01 apa 12-1-1 la mata ', '0416-1955426', '0274-7905445', 'elsitpv@hotamil.com', 'Activo', '', ''),
(948, 17239926, 'Bo-1248', 'Distinguido', 'Adelis Angelo', 'Dugarte Piñuela', 0, 0, 2010, 'Venezolano', 'Masculino', 'Mérida', 12, 8, 1985, 'Bachiller', 'ciencias', 'san juan de lagunillas calle la puerta vda rosa rustica casa s/n', '', '0274-4166052', 'adelisdugarte@hotmail.com', 'Activo', '', ''),
(949, 14131899, 'Bo-1247', 'Sgto/Aydte', 'Yorman Rene', 'Echeveverria', 1, 7, 2010, 'Venezolano', 'Masculino', 'TOVAR', 11, 3, 1977, 'Bachiller', 'CIENCIAS', 'av 08 casa 04-111 sector andrei eloi blanco', '4247297231', '2755550780', 'echeveria.yorman@yahoo.es', 'Activo', 'Incendio', 'Panamericana'),
(950, 3499706, 'Bo-1244', 'Capitan', 'Orlando Augusto', 'Hernández diaz', 1, 7, 2010, 'Venezolano', 'Masculino', 'Merida', 6, 7, 1950, 'Bachiller', '', 'urb. santa monica bloq 2 edf 01 apto 01-01', '4247091355', '4161367128', '', 'Activo', '', ''),
(951, 11960464, 'Bo-1246', 'SubTeniente', 'Jesus Alfonzo', 'Lobo Castillo', 1, 7, 2010, 'Venezolano', 'Masculino', '', 1, 9, 1974, 'Tecnico Medio', '', 'los curos sector el entable', '4161323255', '', '', 'Activo', '', ''),
(952, 11467424, 'Bo-0551', 'Cabo/2do', 'Yumaira Elena ', 'Nuñez De Ruiz', 1, 7, 2010, 'Venezolano', 'Femenino', 'Mérida', 22, 10, 1972, 'Licenciado', '', 'Mérida estado Mérida', '0426-5707331', '0274-2458142', 'labvenus@gmail.com', 'Activo', '', ''),
(953, 18125307, 'Bo-1250', 'Bombero', 'Diego José', 'Molina Peña', 0, 0, 2010, 'Venezolano', 'Masculino', 'Mérida', 1, 9, 1986, 'Bachiller', '', 'el chama sector el cambio calle 3 casa 50', '0426-9718832', '', 'ey08_8@hotmail.com', 'Activo', '', ''),
(954, 8078876, 'Bo-1251', 'Distinguido', 'Nestor Egberto', 'Guerrero Maggiorani', 1, 8, 2010, 'Venezolano', 'Masculino', 'TOVAR', 2, 10, 1963, 'Bachiller', '', 'carrera 12casa nº 11- 56 corozo Tovar', '', '', '', 'Activo', '', ''),
(955, 18578231, 'Bo-1053', 'Distinguido', 'Manuel Gregorio', 'Briceño Roa', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR edo Mérida', 21, 12, 1989, 'Bachiller', 'Ciencias', 'las colinas sector los pinos casa s/n', '0416-4744686', '0275-8732951', 'manuelb63@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(956, 18578952, 'Bo-1054', 'Distinguido', 'Eleider Omar', 'Carrero Contreras ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Santa Cruz de Mora', 1, 5, 1984, 'Bachiller', '', 'santa cruz de mora sector el tabacal casa s/n', '4161191444', '', '', 'Activo', '', ''),
(957, 17340104, 'Bo-1129', 'Distinguido', 'José Alexander', 'Hernández Maldonado ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida ', 6, 1, 1988, 'TSU ', 'Emergencia Prehospitalari', 'urb los bucares torre e apto 1-3', '0426-9276374', '0274-2600318', 'joalex_3@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(958, 17794546, 'Bo-1262', 'Distinguido', 'yoandri rufino', 'torres moreno', 1, 11, 2010, 'Venezolano', 'Masculino', 'Vigia-Merida', 12, 10, 1987, 'Bachiller', 'ciencias', 'tucani sector el charal calle principal  casa 36', '4124279772', '', 'yoandrytorres@hotmail.com', 'Activo', 'Conductor', 'Panamericana'),
(959, 19422741, 'Bo-1255', 'Bombero', 'Ivan Alfredo', 'Gonzalez R. ', 1, 11, 2010, 'Venezolano', 'Masculino', 'Merida', 23, 2, 1990, 'Bachiller', '', 'san jacinto calle 02 casa 61-06', '4269703742', '2742529287', 'ivan_81_61@hotmail.com', 'Activo', '', 'Panamericana'),
(960, 20394196, 'Bo-1254', 'Bombero', 'Jose Leomar', 'Rondon Garcia', 1, 11, 2010, 'Venezolano', 'Masculino', 'TOVAR-Merida', 14, 2, 1991, 'Tecnico Medio', 'medicina pre-hospitalaria', 'Tovar, sector quebrada arriba calle principal casa s/n', '0426-2760033', '2758730901', 'excalibur_3_2004@hotmail.com', 'Activo', 'Conductor', 'Mocoties'),
(961, 20397961, 'Bo-1258', 'Distinguido', 'Yorman Jose', 'Montilla Rodriguez', 1, 11, 2010, 'Venezolano', 'Masculino', 'Merida', 30, 6, 1991, 'Tecnico Medio', 'EMERGENCIAS PRE-HOSPITALA', 'ejido el plmo calle 4 casa n 46', '4268294707', '', 'mr_josemontilla@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(962, 19487090, 'Bo-1078', 'Bombero', 'Neiri Magdalena', 'Contreras Medina ', 1, 3, 2010, 'Venezolano', 'Femenino', 'TOVAR', 22, 11, 1989, 'Bachiller', '', '', '', '2754112980', 'rabgel_mateo_@hotmail.com', 'Activo', '', ''),
(963, 16991221, 'Bo-1113', 'Bombero', 'Osnay José', 'Chirino Herrera  ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Palmarito', 10, 5, 1983, 'Bachiller', '', 'palmarito, calle santander', '4261869357', '2715116986', 'osnaychirino@hotmail.com', 'Activo', '', ''),
(964, 17323691, 'Bo-1077', 'Bombero', 'Luís Alfredo', 'Chacón Chacón  ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida ', 11, 4, 1986, 'Bachiller', 'ciencias', 'las acacias calle pricipal casa 2-17 Tovar', '0416-1736506', '0275-4113206', 'luis_alfredochacon@hotmail.com', 'Activo', 'Servivida', ''),
(965, 19048704, 'Bo-1139', 'Distinguido', 'Yordany Inocentes', 'Márquez Molina ', 1, 3, 2010, 'Venezolano', 'Masculino', 'Merida ', 9, 7, 1988, 'Bachiller', 'CIENCIAS', 'sanata cruz de mora urb la rosa casa 42', '0426-3702720', '0274-8670539', 'yordanimarquez88@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(966, 18142430, 'Bo-1051', 'Distinguido', 'Daniel de la S. T', 'Arellano Reyes', 1, 3, 2010, 'Venezolano', 'Masculino', 'Caracas', 16, 6, 1987, 'Tecnico Medio', 'Construccion Civil', 'Tovar urb jose maria vargas modulo la guaira apto 33-4', '', '0275-8733834', 'daniel_st_1987@hotmail.com', '', 'Incendio', 'Mocoties'),
(967, 16604417, 'Bo-1056', 'Distinguido', 'Jesus Armando', 'Contreras Zambrano', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 10, 2, 1984, 'Bachiller', 'Ciencias', 'sectorla cañada,via principal paramo de mariño,casa vr- 12364', '4161714662', '2759955993', 'yeder-armahotmail.com', '', 'Incendio', 'Paramo'),
(968, 18618003, 'Bo-1058', 'Cabo/2do', 'Omar Eduardo', 'Dugarte Castillo', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida ', 7, 6, 1988, 'Bachiller', '', 'urb.carlos sanchez,calle 3-77,ejido', '4263297756', '', '', '', '', ''),
(969, 16906167, 'Bo-1120', 'Bombero', 'Leonel Jesus', 'Escalante Molina', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR ', 27, 2, 1986, 'Tecnico Medio', 'Construccion civil', 'sector wuilfrido omaña,calle zamora ,casa 43', '0426-9778765', '', 'leonelescalante_86@hotmail.com', '', 'Servivida', 'Mocoties'),
(970, 18209326, 'Bo-1121', 'Bombero', 'Jorge Luís', 'Escalante Rujano', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 7, 5, 1988, 'Bachiller', '', '', '', '', '', '', '', ''),
(971, 17456634, 'Bo-1123', 'Bombero', 'Richard Jose', 'Flores Rodriguez', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 3, 9, 1984, 'Bachiller', 'Ciencias', 'urbanizacion carabobo vereda 27 casa 27 ', '0424-7552408', '0274-2665624', 'skator1984@hotmail.com', '', 'Servivida', 'Mocoties'),
(972, 16655853, 'Bo-1083', 'Distinguido', 'Daniela Carolina', 'Garrido Valencia', 1, 3, 2010, 'Venezolano', 'Femenino', 'Mérida', 31, 5, 1985, 'Bachiller', 'Ciencias', 'el chama calle principal la fria casa 0-45', '0426-7267945', '0274-8083116', 'ya_ayra@hotmail.com', '', 'Rescate', 'Metropolitana'),
(973, 18796200, 'Bo-1127', 'Cabo/2do', 'Luis Amable', 'Gutierrez Quintero', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 13, 7, 1987, 'Tecnico Medio', 'Maquinas y herramientas', 'sector el portachuelo, pasos arriba de la escuela, casa s/n', '0424-7136683', '0274-2454440', 'lagq.1987@hotmail.com', '', 'Incendio', 'Metropolitana'),
(974, 20217294, 'Bo-1132', 'Bombero', 'Luis Yoel', 'Leon Linares', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 18, 3, 1990, 'Bachiller', '', '', '', '', '', '', '', ''),
(975, 19047911, 'Bo-1134', 'Bombero', 'Luis Gerardo', 'Manrrique Gutierrez', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 23, 9, 1989, 'Bachiller', '', '', '', '', '', '', '', ''),
(976, 18020801, 'Bo-1137', 'Bombero', 'Neiby', 'Marquez Hernandez', 1, 3, 2010, 'Venezolano', 'Femenino', 'Vigia-Merida', 25, 10, 1988, 'Bachiller', 'Ciencias', 'santa ana norte, calle 1, casa 0-76', '0426-2392630', '2742446855', 'neibymar_vielma@hotmail.com', '', 'Incendio', 'Metropolitana'),
(977, 12755028, 'Bo-0501', 'Distinguido', 'Esterio Joule', 'Mendez Davila', 1, 5, 2010, 'Venezolano', 'Masculino', 'San Juan de Colon estado Tachira ', 28, 12, 1976, 'Bachiller', '', 'urb. el pilar,bloque 09,apartamento 01-03, ejido', '4166466683', '', '', '', '', ''),
(978, 19848263, 'Bo-1253', 'Bombero', 'Iraima Lisbeth ', 'Moncada Sosa', 1, 11, 2010, 'Venezolano', 'Femenino', 'TOVAR', 18, 7, 1990, 'Tecnico Medio', 'medicina pre-hospitalaria', 'Tovar sabaneta sector las acasias calle principal casa sin numero', '4269762388', '', 'lisbeth_love_18@hotmail.com', '', 'Incendio', 'Mocoties'),
(979, 9471981, 'Bo-1252', 'Distinguido', 'Adrian Hernan', 'Romero', 1, 10, 2010, 'Venezolano', 'Masculino', 'Mérida', 12, 11, 1967, 'Bachiller', '', 'el valle sector playon alto 7-07', '4164669896', '', '', '', '', ''),
(980, 20197141, 'Bo-1256', 'Bombero', 'Leonardo', 'Santiago Villarreal', 1, 11, 2010, 'Venezolano', 'Masculino', 'mucuchies', 31, 1, 1991, 'Tecnico Medio', 'emergencias pre-hospitala', 'apataderos sector el desecho casa sin numero', '4149713907', '0426-3731744', 'santi_lv_1 @hotmail.com', '', 'Conductor', 'Paramo'),
(981, 20217045, 'Bo-1260', 'Bombero', 'Carlos Xavier', 'Mendez Ortega', 1, 11, 2010, 'Venezolano', 'Masculino', 'TOVAR', 16, 9, 1991, 'Tecnico Medio', 'medicina de emergencia', 'Tovar calle principal barrio monseñor moreno casa 29', '4262723310', '2758731611', 'carlos xavi16@hotmail.com', '', 'Conductor', 'Mocoties'),
(982, 20848117, 'Bo-1263', 'Bombero', 'Eduardo Enrique', 'Paredes Cristancho', 1, 11, 2010, 'Venezolano', 'Masculino', 'Mérida', 28, 4, 1990, 'Bachiller', '', '', '', '', '', '', '', ''),
(983, 11219267, 'Bo-1230', 'Cabo/2do', 'Johnny Elias', 'Picon Avila', 1, 1, 2010, 'Venezolano', 'Masculino', 'Santa barbara -Zulia', 8, 3, 1973, 'Bachiller', 'Ciencias', 'el vigia,urb pprimero de mayo,calle principal,casa 7-17', '4147290630', '', 'johnny_elia01@hotmail.com', '', 'Conductor', 'Panamericana'),
(984, 20940482, 'Bo-1261', 'Bombero', 'Jairo Leonardo', 'Rivas Molina', 1, 11, 2010, 'Venezolano', 'Masculino', 'Mérida', 13, 6, 1992, 'Tecnico Medio', 'Emergencias medicas', 'urb. carlos sanchez calle 11, casa n- 613, ejido', '4247821049', '2742217453', 'jairo_rivas@hotmail.com', '', 'Conductor', 'Metropolitana'),
(985, 20217419, 'Bo-1259', 'Bombero', 'Henry Emir', 'Rivas Perez', 1, 11, 2010, 'Venezolano', 'Masculino', 'TOVAR-Merida', 7, 6, 1991, 'Tecnico Medio', 'medicina de emergencia', 'municipio Tovar calle bolivar sector los rivas casa v-10380', '4264743114', '2758083017', 'the_pana07@hotmail.com', '', 'Conductor', 'Mocoties'),
(986, 16933385, 'Bo-1182', 'Distinguido', 'Jose Humberto', 'Valero Calderon', 1, 3, 2010, 'Venezolano', 'Masculino', 'Mérida', 14, 7, 1982, 'Bachiller', 'Ciencias', 'monseñor chacon parte alta casa s/n', '0424-7686339', '2742635727', 'humbertocalderon52@hotmail.com', '', 'Conductor', 'Metropolitana'),
(987, 17322141, 'Bo-1183', 'Bombero', 'Charly Miriel', 'Vargas Arellano', 1, 3, 2010, 'Venezolano', 'Masculino', 'TOVAR', 3, 1, 1985, 'Bachiller', 'Ciencias', 'el añil carrera 1 calle 1 n° 3-11 Tovar', '0426-2784021', '0275-9887596', 'vargascharlihotmail.com', '', 'Incendio', 'Mocoties'),
(988, 8009665, 'BO-1553', 'Mayor', 'Carlos Miguel', 'Hernandez,', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 19, 9, 1958, 'Licenciado', 'Administracion Empresas A', ' el palmo calle 3 casa 22-a ejido', '0426-7268325', '0274-4160587', 'HERNANDEZCARLOSM@HOTMAIL.COM', '', '', ''),
(989, 14341559, 'BO-1268', 'SubTeniente', 'Alcides Jose', 'Angulo Roa,', 1, 1, 2011, 'Venezolano', 'Masculino', 'barinitas', 12, 3, 1980, 'LICENCIADO', 'educacion', 'ejido residencias el salado torre e piso 02 apartamento 22', '0426-7281312', '', 'angulobombero2@yahoo.es', '', '', 'Metropolitana'),
(990, 9346112, 'BO-1551', 'Sgto/Aydte', 'Alvaro Enrique', 'Camargo Camacho,', 1, 5, 2012, 'Venezolano', 'Masculino', 'TARIBA- TACHIRA', 25, 9, 1975, 'TSU ', 'TECNOLOGIA BOMBERIL ', 'urbanizacion santa juana edificio bucare apartamento 03-01 piso 3', '0416-6722713', '0274-2630378', 'UNION757@HOTMAIL.COM', 'Activo', 'Incendio', 'Metropolitana'),
(991, 8026740, 'BO-1297', 'Sgto/1ro', 'Tomas', 'Torres Santiago,', 1, 1, 2011, 'Venezolano', 'Masculino', 'merida', 22, 9, 1973, 'Bachiller', '', 'avenida los proeres sector el llanito la otra banda casa nª5-44', '', '0274-2449189', '', '', '', ''),
(992, 8085327, 'BO-1298', 'Sgto/2do', 'Edgar Jose', 'Torres Rojas,', 1, 1, 2011, 'Venezolano', 'Masculino', 'San cruz de Mora', 22, 9, 1964, 'Bachiller', '', 'la tandida estado tachira parte alta casa 04 calle01', '4267766030', '2758377342', '', '', '', ''),
(993, 15620204, 'BO-0372', 'CABO PRIMERO', 'Elvy Josefina', 'Torres Peña,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 6, 4, 1982, 'Tecnico Medio', 'TURISMO', 'avenida 16 de septiembre sector santa elena pasaje intercomunal paraiso nª1', '', '0274-7896971', 'torreselvy44@hotmail.com', '', 'Rescate', 'Metropolitana'),
(994, 17377941, 'BO-1283', 'Cabo/1ro', 'Wilfredo', 'Melgarejo Araque,', 1, 1, 2011, 'Venezolano', 'Masculino', 'BARINAS', 5, 7, 1986, 'Tecnico Medio', '', 'barinas', '4147430711', '0273-6633906', 'Albertoelarrazador007@hotmail.com', '', '', ''),
(995, 12384234, 'BO-1416', 'Cabo/1ro', 'Oscar Enrique', 'Castillo Alvarez,', 1, 4, 2012, 'Venezolano', 'Masculino', 'Madrid-España', 25, 6, 1973, 'Licenciado', 'ADMINISTRACION DE EMPRESA', 'avenida las Américas villa deportiva habitacion 11 al lado del sso', '0424-6698481', '0274-8080984', 'oeca73@hotmail.com', '', '', ''),
(996, 12093928, 'BO-1269', 'Cabo/2do', 'Gerardo Antonio', 'Bazan,', 1, 1, 2011, 'Venezolano', 'Masculino', 'CARACAS', 25, 2, 1975, 'Bachiller', '', 'urb. “andrés bello”, bloque 54, piso 4, apto. 406-d, sector sierra maestra,', '', '0212-858.47.86', 'gbazan25@hotmail.com.', '', '', ''),
(997, 8080896, 'BO-1288', 'CABO SEGUNDO', 'Francisco Albeiro', 'Prieto Rivas,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 7, 5, 1962, 'Bachiller', '', 'casa santisima trinidad santa cruz de mora casa s/n ', '', '4264790951', '', '', '', ''),
(998, 13499752, 'BO-1353', 'CABO SEGUNDO', 'Aurelio', 'Hernandez Ruiz,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 3, 5, 1975, 'Bachiller', 'integral', 'los curos sector los primos calle 02 casa 12 ', '0424-7770712', '0274-2715898', '', '', 'Incendio', 'Metropolitana'),
(999, 14400272, 'BO-1393', 'CABO SEGUNDO', 'Claus Gregorio', 'Sanchez Gil,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 18, 8, 1980, 'Bachiller', 'ciencias', 'carabobo vereda 03 casa 21 ', '', '0274-2665138', 'tonygreb@hotmail.com', '', '', ''),
(1000, 13896160, 'BO-1406', 'CABO SEGUNDO', 'Neomar  Kenny', 'Viloria Villarreal,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TRUJILO', 20, 2, 1980, 'Tecnico Medio', 'medicina de emergencia', 'periodistas edificio el roble piso 03 bloque 08 apto 0201', '', '0416-4742192', 'NEOMAR _VILAGUILAS@HOTMAIL.COM', '', 'Servivida', 'Metropolitana'),
(1001, 14268650, 'BO-1550', 'CABO SEGUNDO', 'Jose Luis', 'Briceño Cadenas,', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida', 19, 2, 1978, 'Bachiller', 'ciencias', 'avenida 16 de septiembre pasaje los pinos 1-33', '', '0274-2623001', 'josluix_27_06@hotmail.com', 'Activo', 'Conductor', 'Metropolitana'),
(1002, 15621100, 'BO-1552', 'Cabo/2do', 'Andre Jampiero', 'Castillo Hurtado,', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida', 12, 12, 1982, 'Licenciado', 'politologo', 'barrio pueblo nuevo pasaje 2 albarregas pasaje casa 1-96', '4145322744', '2744167438', 'FIREMANRESCATE82@GMAIL.COM', '', '', ''),
(1003, 20394705, 'BO-1267', 'DISTINGUIDO', 'Jose Israel', 'Alvarez Rodriguez,', 1, 1, 2011, 'Venezolano', 'Masculino', 'TOVAR', 18, 7, 1991, 'Tecnico Medio', '', 'Tovar  sabaneta', '', '0424-7775774 / ', 'sorvivor_man23@hotmail.com  ', '', '', ''),
(1004, 20394073, 'BO-1272', 'DISTINGUIDO', 'Jesus Alberto', 'Chaparro Marchan,', 1, 1, 2011, 'Venezolano', 'Masculino', 'TOVAR', 20, 10, 1990, 'Tecnico Medio', 'Rescate ', 'residencia geandomenico puliti calle principal, apartamento 6  Tovar ', '4247293372', '2758733716', 'el_selvatico33@hotmail.com', '', '', ''),
(1005, 22658579, 'BO-1273', 'DISTINGUIDO', 'Karem Adriana', 'Cristancho Fernandez,', 1, 1, 2011, 'Venezolano', 'Masculino', 'merida', 9, 2, 1992, 'Tecnico Medio', 'medicina de emergencia', 'sn jacinto calle principal sector la unidad casa s/n', '0426-9283710', '', 'kkcc_9@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1006, 19593276, 'BO-1274', 'DISTINGUIDO', 'Sthefany Saray', 'Gonzalez Guillen,', 1, 1, 2011, 'Venezolano', 'Femenino', 'MERIDA', 7, 6, 1991, 'Tecnico Medio', 'medicina de emergencia', 'ejido urbanizacion carlos sanchez calle 7 casa 2-91', '0416-2732083', '0474-2216370', 'SARAHGG_37@HOTAMIL.COM', 'Activo', 'Servivida', 'Metropolitana'),
(1007, 22664146, 'BO-1276', 'DISTINGUIDO', 'Barbara Esthefany', 'Hernandez Guerrero,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 15, 1, 1992, 'Tecnico Medio', 'medicina de emergencia', 'av. los chorros de milla, nº 6-92', '', '0274-2441430', 'barbi_tefi_16@hotmail.com', '', 'Servivida', 'Metropolitana'),
(1008, 20432864, 'BO-1279', 'DISTINGUIDO', 'Yohonatan Javier', 'Marquez Marquez,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 22, 8, 1990, 'Tecnico Medio', 'medicina de emergencia', 'las mesitas del chama calle 02 casa s/n ', '', '4149794617', 'the_Faireman_r11@hotamial.com', '', 'Servivida', 'Metropolitana'),
(1009, 19319839, 'BO-1280', 'DISTINGUIDO', 'Francis Evelin', 'Marquez Quintero,', 1, 1, 2011, 'Venezolano', 'Masculino', 'TOVAR', 19, 2, 1991, 'Tecnico Medio', 'medicina de emergencia', 'el vigia caño seco 04 avenida 05 casa 16 ', '', '0275-8820793', 'MIBEBEFRANNEY@HOTAMIL.COM', '', '', ''),
(1010, 21331037, 'BO-1287', 'DISTINGUIDO', 'Miguel Angel', 'Peña Albornoz,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 11, 7, 1992, 'Tecnico Medio', 'emergencia preospitalaria', 'via la mesa de ejido sector el moral casa s/n', '4162549076', '2742210405', 'mianpeal@hotmail.com', 'Activo', 'Incendio', ''),
(1011, 19847686, 'BO-1291', 'DISTINGUIDO', 'Ramon Ali', 'Rodriguez Parada,', 1, 1, 2011, 'Venezolano', 'Masculino', 'TOVAR', 20, 12, 1990, 'Tecnico Medio', 'medicina de emergencia', 'sector monseñor moreno calle 02 casa 53 Tovar', '', '0275-8734754', '', '', '', ''),
(1012, 20433679, 'BO-1292', 'DISTINGUIDO', 'Yecenia Ahiran', 'Rojas Lopez,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 15, 10, 1991, 'Tecnico Medio', 'medicina de emergencia', 'santa catalina el chama primer camillon el campestre casa s/n ', '', '0414-7415622', 'yesceniarojas@hotmail.com', '', 'Rescate', 'Metropolitana'),
(1013, 11951463, 'BO-1293', 'DISTINGUIDO', 'Pedro Aristavo', 'Sanchez Sanchez,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 8, 4, 1974, 'Licenciado', 'medicina de emergencia', 'avenida andres bello frente al central azucarero casa 23-05', '416171292', '2742710168', 'aristavo@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1014, 19997400, 'BO-1296', 'DISTINGUIDO', 'Jacson Enrique', 'Uzcategui Rivas,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 23, 3, 1991, 'Tecnico Medio', 'medicina de emergencia', 'valle grande sector camellones parcela nª 02 casa s/n', '4160543743', '0274-4161204', 'jacsonuxcatequi@hotmail.com', 'activo', 'servivida', 'Metropolitana'),
(1015, 16934531, 'BO-1301', 'DISTINGUIDO', 'Luis Oswaldo', 'Briceño Rojas,', 1, 4, 2011, 'Venezolano', 'Masculino', 'MERIDA', 2, 12, 1985, 'BACHILLER', 'ciencias', 'sector la selva calle el berro casa 1 jaji', '0426-2715004', '0274-4163121', 'lobrasvp@hotmail.com', '', 'Incendio', 'Metropolitana'),
(1016, 19518961, 'BO-1332', 'DISTINGUIDO', 'Jackson Jose', 'Caballero Araque,', 1, 5, 2011, 'Venezolano', 'Masculino', 'BARINAS', 4, 4, 1981, 'Tecnico Medio', 'industrial bombero', 'av monseñor duque calle hondura nº 14 ejido', '0424-5058692', '', 'jackson_caballero813@hotmail.com', '', '', ''),
(1017, 13649607, 'BO-1549', 'DISTINGUIDO', ' Jhon Freddy', 'Arce Marquin,', 1, 5, 2012, 'Venezolano', 'Masculino', 'TACHIRA', 10, 8, 1977, 'BACHILLER', 'ciencias', 'santa ana norte sector vista hermosa via principal bella vista 1-172', '0416-4725197', '0274-2450213', 'LATINFOTJHON@HOTMAIL.COM', '', '', ''),
(1018, 16444471, 'BO-1556', 'DISTINGUIDO', 'Roberth', 'Briceño Quintero,', 1, 6, 2012, 'Venezolano', 'Masculino', 'merida', 0, 0, 0, 'BACHILLER', 'ciencias', 'ejido urbaniacion padre duque calle 06 casa 04', '', '4247115748', '', '', '', ''),
(1019, 18420576, 'BO-1265', 'BOMBERO', 'Rossy Milagros', 'Alarcon Salas,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 26, 10, 1988, 'Tecnico Medio', 'medicina de emergencia', 'Tovar sector el cacique via principal casa s/n', '4264076870', '0275-9958466', 'theprinsecc1946@hotmail.com', '', '', ''),
(1020, 20851139, 'BO-1266', 'BOMBERO', 'Karen Yarima', 'Alvarez Davila,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 21, 9, 1991, 'Tecnico Medio', 'medicina de emergencia', 'mansano bajo sector los bilches casa s/n ejido ', '', '0274-2210224', 'kaparepe_2112@hotmail.com', '', '', ''),
(1021, 21307802, 'BO-1270', 'BOMBERO', 'Yosmer Antonio', 'Briceño Andrade,', 1, 1, 2011, 'Venezolano', 'Masculino', 'VIGIA', 17, 7, 1972, 'Tecnico Medio', '', 'caño seco ii, av. 05, casa 73, parroquia pulido  mendez', '', '(0424) 7803955 ', 'yosmerb@gmail.com', '', '', ''),
(1022, 19996065, 'BO-1275', 'BOMBERO', 'Olinto De Jesus', 'Gutierrez Avendaño,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 12, 12, 1991, 'Tecnico Medio', 'medicina de emergencia', 'el valle sector arado “b” parte alta casa n°0-48b.', '4120533355', '', 'olintogao1@gmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1023, 17130834, 'BO-1277', 'BOMBERO', 'Jose Gregorio', 'Hernandez Moreno,', 1, 1, 2011, 'Venezolano', 'Masculino', '', 19, 2, 1984, '', '', '', '', '', '', '', '', ''),
(1024, 20394636, 'BO-1278', 'BOMBERO', 'Franco Javier', 'Jaimes Romero,', 1, 1, 2011, 'Venezolano', 'Masculino', 'TOVAR', 10, 6, 1991, 'Tecnico Medio', 'medicina de emergencia', 'calle 2 casa nº 4 barrio monseñor moreno Tovar', '0416-6987094', '0275-2679351', 'francois_13_19@hotmail.com', 'Activo', 'Incendio', ''),
(1025, 19487551, 'BO-1281', 'BOMBERO', 'Maria Andreina', 'Marquina Marquez,', 1, 1, 2011, 'Venezolano', 'Masculino', '', 16, 7, 1991, 'Tecnico Medio', '', '', '', '', '', '', '', ''),
(1026, 20218992, 'BO-1282', 'BOMBERO', 'Leonel Antonio', 'Medina Medina,', 1, 1, 2011, 'Venezolano', 'Masculino', 'TOVAR', 23, 11, 1992, 'Tecnico Medio', 'medicina de emergencia', 'Tovar sector sabaneta, barrio las acacias casa s/n', '4269262012', '', 'leoburmed_18@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(1027, 21181006, 'BO-1284', 'BOMBERO', 'Renne  Alejandro', 'Molina Altuve,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 13, 6, 1991, 'Tecnico Medio', 'medicina de emergencia', 'urbanizacion francisco javier de angulo parte baja inrevi casa 2-51', '0274-2218563', '0416-6031349', 'sbdm_alejandro@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1028, 19895335, 'BO-1285', 'BOMBERO', 'Yenifer Carolina', 'Moreno Marquina,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 7, 2, 1992, 'Tecnico Medio', '', 'mesitas del chama casa nª3 ', '', '', 'yenifer129@hotmail.com', '', '', ''),
(1029, 19995514, 'BO-1286', 'BOMBERO', 'Marlyt Del Carmen', 'Paredes Albornoz,', 1, 1, 2011, 'Venezolano', 'Femenino', 'MERIDA', 22, 2, 1990, 'Tecnico Medio', 'MEDICINA DE EMERGENCIA', 'ejido el palmo calle 2 casa numero 39', '0414-7327715', '0274-2210245', 'TRUCA22@HOTMAIL.COM', 'Activo', 'Incendio', 'Metropolitana'),
(1030, 20435027, 'BO-1289', 'BOMBERO', 'Reinaldo Jose', 'Quintero Trejo,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 8, 5, 1992, 'TECNICO MEDIO', '', 'los lanitos de tabay sector capilla de las mercedes casa 04-06', '', '0416-2760544', 'QUINTERITO_20_859289@HOTMAIL.COM', '', '', ''),
(1031, 19848797, 'BO-1290', 'BOMBERO', ' Luis Armando', 'Ramirez Carrero,', 1, 1, 2011, 'Venezolano', 'Masculino', 'MERIDA', 14, 10, 1990, 'Tecnico Medio', 'medicina de emergencia', 'chama sector san antonio calle 3 san benito casa 37-23', '0426-1797129', '0274-6583270', 'ramirez_luis60@hotmail.com', '', 'rescate', 'metropolitana');
INSERT INTO `bombero` (`1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `17`, `18`, `19`, `20`, `21`, `22`, `23`, `24`) VALUES
(1032, 20938822, 'BO-1294', 'BOMBERO', 'Sailim Jose', 'Sepulveda Rico,', 1, 1, 2011, 'Venezolano', 'Masculino', 'vigia', 5, 8, 1992, 'Tecnico Medio', 'medicina de emergencia', '', '', '', '', '', '', ''),
(1033, 20828148, 'BO-1295', 'BOMBERO', 'Jose Dilmer', 'Suarez Rivas,', 1, 1, 2011, 'Venezolano', 'Masculino', 'SANTA CRUZ', 29, 1, 1992, 'Tecnico Medio', 'RESCATE Y SALVAMENTO', 'carrera 02 casa s/n sector el corozo Tovar', '', '0426-1880357', 'DILMER_SUAREZ1992@HOTMAIL.COM', '', '', ''),
(1034, 20218560, 'BO-1299', 'BOMBERO', 'Jose Yovanny', 'Alarcon Puente,', 1, 4, 2011, 'Venezolano', 'Masculino', 'MERIDA', 27, 6, 1992, 'Tecnico Medio', 'medicina de emergencia', 'hollada de milla calle principal casa 0-93', '', '0426-8775390', 'yovalar27@hotmail.com', '', '', ''),
(1035, 22929620, 'BO-1300', 'BOMBERO', 'Renny Armando', 'Araque Buitriago,', 1, 4, 2011, 'Venezolano', 'Masculino', 'MERIDA', 21, 9, 1992, 'Tecnico Medio', 'MEDICINA DE EMERGENCIA', 'pasaj la isla sector la vega casa 7-13', '0274-2450873', '0424-7735143', 'fireman_21992@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(1036, 19487847, 'BO-1302', 'BOMBERO', 'Erlis Jose', 'Criollo Ramirez,', 1, 4, 2011, 'Venezolano', 'Masculino', 'TOVAR', 2, 10, 1989, 'Tecnico Medio', 'medicina de emergencia', 'sector monseñor moreno calle # 2 casa n°  25 Tovar', '0416-5255142', '0275 – 8734241 ', 'ERLIS_CRIOLLO1@HOTMAIL.COM', '', '', ''),
(1037, 20218514, 'BO-1303', 'BOMBERO', 'Alyeri Jose', 'Fernandez Baron,', 1, 4, 2011, 'Venezolano', 'Masculino', 'TOVAR', 25, 1, 1991, 'Tecnico Medio', 'medicina de emergencia', 'calle andres bello casa nª133 sector sabaneta barrio wilfrido omaña Tovar', '4264348741', '', 'alyeri_v_2011@HOTMAIL.COM ', 'Activo', 'Rescate', 'Mocoties'),
(1038, 19847286, 'BO-1304', 'BOMBERO', 'Yuri Yerit', 'Joven Criollo,', 1, 4, 2011, 'Venezolano', 'Masculino', 'TOVAR', 4, 8, 1990, 'Tecnico Medio', 'medicina de emergencia', 'sector monseñor moreno calle 02 casa 57  Tovar', '0426-1148230', '0275-8732126', 'jghyuri@gmail.com', '', '', ''),
(1039, 21184576, 'BO-1305', 'BOMBERO', ' Mileidy Evelyn', 'Lacruz  Contreras,', 1, 4, 2011, 'Venezolano', 'Masculino', 'MERIDA', 28, 12, 1992, 'Tecnico Medio', 'medicina de emergecia', 'urb. carlos sánchez calle 1 casa n 8', '0414-9786246', '0274-2218317', 'lamami_lacruz_14@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1040, 20197097, 'BO-1306', 'BOMBERO', 'Evelyn Eunices', 'Marquez Marquez,', 1, 4, 2011, 'Venezolano', 'Masculino', 'MERIDA', 24, 3, 1992, 'Tecnico Medio', 'MEDICINA PREHOSPITALARIA', 'ejido urb villa manzano sector villa paraiso casa nº 8', '0412-7400739', '0274-6586704', 'EVELYN_ROJ@HOTMAIL.COM', 'Activo', '', ''),
(1041, 20217107, 'BO-1307', 'BOMBERO', 'Jose Antonio', 'Molina Contreras,', 1, 4, 2011, 'Venezolano', 'Masculino', 'TOVAR', 6, 6, 1992, 'Tecnico Medio', 'medicina de emergencia', 'Tovar calle 20 de julio casa 77-01 sector las acacias', '0426-3787855', '0275-8732193', 'josemolinac92@hotmail.com', '', 'Servivida', ''),
(1042, 13967296, 'BO-1308', 'BOMBERO', 'Hugo Enrique', 'Ocando Hernandez,', 1, 4, 2011, 'Venezolano', 'Masculino', 'merida', 12, 12, 1977, 'Bachiller', 'ciencias', 'los curos prte media bloque 14 aparatamento 00-04', '0416-6023720', '0274-2711115', 'higoocando1977@hotmail.com', '', '', ''),
(1043, 22657819, 'BO-1309', 'BOMBERO', ' Laura Beatriz', 'Peña Zerpa,', 1, 4, 2011, 'Venezolano', 'Femenino', 'merida', 11, 9, 1991, 'TECNICO MEDIO', 'emergencias prehospitalar', 'ejido calle lara urbanizacion villa lara bloque 12 apartamento 1', '4263060877', '2742441477', 'laurab1109@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1044, 20434954, 'BO-1310', 'BOMBERO', 'Yanelis Ninibeth', 'Quintero,', 1, 4, 2011, 'Venezolano', 'Masculino', 'MERIDA', 11, 12, 1991, 'TECNICO MEDIO', '', 'san jacinto sector raul leonita calle lagunillas casab 1282', '', '0274-2666402', '', '', '', ''),
(1045, 20673287, 'BO-1311', 'BOMBERO', ' Deily Del Carmen', 'Ramirez Valera,', 1, 4, 2011, 'Venezolano', 'Masculino', 'CARACAS', 25, 10, 1992, 'TECNICO MEDIO', '', 'los chorros de milla casa 1-14', '', '0424-8381752', '', '', '', ''),
(1046, 20142500, 'BO-1312', 'BOMBERO', ' Zuleimer Andreina', 'Rivas Duarte,', 1, 4, 2011, 'Venezolano', 'Masculino', 'vigia', 22, 10, 1990, 'Tecnico Medio', '', 'caño seco 03 avenida 01 casa 02 vereda 52 vigia', '', '0424-7409456', 'laflaca_rivas.zule@hotmail.com', '', '', ''),
(1047, 23555399, 'BO-1313', 'BOMBERO', 'Ronald Alberto', 'Rivas Portillo,', 1, 4, 2011, 'Venezolano', 'Masculino', 'arapuey ', 21, 10, 1992, 'Tecnico Medio', 'medicina de emergencia', 'calle principal sector bicentenario casa s/n Tovar', '4247651878', '', 'ronald_31082012@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(1048, 20218176, 'BO-1314', 'BOMBERO', 'Ronny Antonio', 'Rivas Quintero,', 1, 4, 2011, 'Venezolano', 'Masculino', 'TOVAR', 2, 7, 1991, 'TECNICO MEDIO', 'medicina de emergencia', 'calle 01 con carrera 07 casa 07 -06 el corozo Tovar', '4267592275', '0275-8733417', '', '', '', ''),
(1049, 21305917, 'BO-1315', 'BOMBERO', 'Maria Herminia', 'Rodriguez Leon,', 1, 4, 2011, 'Venezolano', 'Masculino', 'VIGIA', 27, 8, 1992, 'Tecnico Medio', 'MEDICINA DE EMERGENCIA ', 'barrio bolivar calle 03 casa 15-39 vigia', '0424-7285750', '0424-2297185', 'laflak_27_08@hotmail.com', '', '', ''),
(1050, 21185026, 'BO-1316', 'BOMBERO', 'Francisco javier', 'Salazar Linarez,', 1, 4, 2011, 'Venezolano', 'Masculino', 'merida', 13, 10, 1991, 'Tecnico Medio', 'medicina de Emergencia ', 'urbaniacion el arenal via principal calle 04 ', '', '0416-4739957', 'elchino.3000@hotmail.com', '', '', ''),
(1051, 21181563, 'BO-1317', 'BOMBERO', 'Antonio Jose', 'Sulbaran Petranji,', 1, 4, 2011, 'Venezolano', 'Masculino', 'merida', 20, 11, 1990, 'Tecnico Medio', 'medicina de emergencia ', 'urbanizacion carlos sanchez calle 03 casa 89', '', '0416-5743782', 'FAIRESAR_9_11@HOTMAIL.COM', '', '', ''),
(1052, 26096093, 'BO-1318', 'BOMBERO', ' Javier Orlando', 'Tolosa Tapias,', 1, 4, 2011, 'Venezolano', 'Masculino', 'Tucani', 16, 9, 1992, 'Tecnico Medio', 'medicina d emergencia', 'av principal chamita residencia los bucares torre i apto 1-4', '4169716006', '', 'darime15@yahoo.es', '', 'incendio', 'metropolitana'),
(1053, 20573993, 'BO-1319', 'BOMBERO', 'Jason Orlando', 'Toscano Garcia,', 1, 4, 2011, 'Venezolano', 'Masculino', 'vigia', 28, 1, 1993, 'Tecnico Medio', 'medicina de Emergencia', 'barrio la victoria calle principal casa 3-97 vigia', '0414-7525923', '', 'jtoscan93@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(1054, 20198376, 'BO-1320', 'BOMBERO', 'Thalimar Coromoto', 'Uzcategui Gamez,', 1, 4, 2011, 'Venezolano', 'Femenino', 'merida', 14, 2, 1991, 'Tecnico Medio', 'medicina de Emergencia', ' urbanizacion el pilar edificio 02 aparatamento 02-04 ejido', '0274-2214156', '0412-0613818', 'tcug_4@hotmail.com', '', 'Servivida', 'Metropolitana'),
(1055, 19996944, 'BO-1321', 'BOMBERO', 'Ana Fabiola', 'Vargas Guillen,', 1, 4, 2011, 'Venezolano', 'Masculino', 'merida', 30, 5, 1991, 'Tecnico Medio', 'medicina de Emergencia', 'urbanizacion carabobo verda 43 casa 21', '', '0424-1217730', '', '', '', ''),
(1056, 20828409, 'BO-1322', 'BOMBERO', 'Yojan Olivo', 'Contreras Mendez,', 1, 4, 2011, 'Venezolano', 'Masculino', 'LAGUNILLAS ', 1, 11, 1992, 'Tecnico Medio', '', 'quebrada del loro alto. sector la cancha  casa s/n', '', '416-3762834', 'yonjanolivoc.m@hotmail.com.', '', '', ''),
(1057, 20850578, 'BO-1323', 'BOMBERO', 'Jose Alexander', 'Aguilar Peña,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 16, 4, 1991, 'BACHILLER', 'ciencias', 'la joya sector el arenal  casa s/n ', '0416-0107593', '0274-2450465', 'J.ALEXANDER.P@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(1058, 16445441, 'BO-1324', 'BOMBERO', ' Wilmer De Jesus', 'Albarran Rivera,', 1, 5, 2011, 'Venezolano', 'Masculino', 'mucuchies', 22, 6, 1984, 'Tecnico Medio', 'informatica', 'san juan lagunillas calle 13 casa 114 ', '0426-7753626', '0274-4146666', 'albarran _32@hotmail.com', '', '', ''),
(1059, 22664915, 'BO-1325', 'BOMBERO', ' Freddy De Jesus', 'Alvarez Andrade,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 10, 1, 1992, 'BACHILLER', 'ciencias', ' urbanizacion jj osuna rodriguez bloque 30apartamento 02-02  los curos', '0424-7706312', '0274-2713484', 'freddycool_12@hotmail.com', '', '', ''),
(1060, 18578884, 'BO-1326', 'BOMBERO', 'Deiben Alonso', 'Amaya Flores,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 31, 10, 1987, 'BACHILLER', 'ciencias', 'santa cruz de mora ', '', '0275-4112942', 'deibi2323@hotmail.com', '', '', ''),
(1061, 19847455, 'BO-1327', 'BOMBERO', 'Jose Manuel', 'Araque Osuna,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 19, 11, 1999, 'BACHILLER', 'ciencias', 'urbanizacion wilfrido omaña calle bolivar casa 01 sector sabaneta ', '', '0414-7252228', 'josema_z91@hotmail.com', '', '', ''),
(1062, 20197822, 'BO-1328', 'BOMBERO', 'Wladimir Alejandro', 'Balza Ruiz,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 3, 4, 1990, 'BACHILLER', 'ciencias', 'urb don perucho av 4 casa 239', '0426-6722044', '0274-2440872', 'wladibiques@hotmail.com', '', '', ''),
(1063, 21183664, 'BO-1329', 'BOMBERO', 'Jesus Manuel', 'Barreto Ruiz,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 3, 2, 1992, 'BACHILLER', 'ciencias', 'urbanizacion osuna rodriguez parte alta los curos edificio 01 aparatamento ', '0426-7282920', '', 'JMBARRETO_03@HOTMAIL.COM', '', '', ''),
(1064, 20435175, 'BO-1330', 'BOMBERO', 'Jose Miguel', 'Barrios Molina,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 8, 4, 1991, 'BACHILLER', 'ciencias', 'arapuy sector mesa esperanza calle principal casa s/n', '0271-6369898', '0416-3773967', 'YARAIRA_L1994@HOTMAIL.COM', '', '', ''),
(1065, 13118677, 'BO-1331', 'BOMBERO', ' Jhonny Ramon', 'Briceño Bastidas,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TRUJILLO', 7, 12, 1978, 'INGENIERO', 'Sistema', 'av urdaneta calle tulipan residencia urdnt piso 1- apto 2', '0416-0650561', '', 'JHONY_ULA@HOTMAIL.COM', '', '', ''),
(1066, 16742796, 'BO-1333', 'BOMBERO', 'Jorsly Jose', 'Carrillo Mendez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'ACARIGUA ', 30, 12, 1983, 'BACHILLER', '', 'avenida las Américas santa barbara edificio 08pbc ', '', '0274-2631140/04', '', '', '', ''),
(1067, 17523571, 'BO-1334', 'BOMBERO', ' Yeraldine', 'Castillo Suescum,', 1, 5, 2011, 'Venezolano', 'Femenino', 'mucuchies', 27, 4, 1986, 'BACHILLER', 'ciencias', 'mucuchies mis teque via mocao casa s/n', '0426-6723446', '0274-8721015', 'yeralcastillo_25@hotmail.com', '', 'Servivida', 'Paramo'),
(1068, 17357464, 'BO-1335', 'BOMBERO', 'Alfredo Antonio', 'Contreras,', 1, 5, 2011, 'Venezolano', 'Masculino', 'BARINAS', 19, 10, 1984, 'BACHILLER', 'ciencias', 'avenida los proceseres prolongacion el llanito casa 0-13', '', '0424-5760370', '', '', '', ''),
(1069, 19146005, 'BO-1336', 'BOMBERO', 'Yohemir Edecio', 'Contreras Fernandez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 26, 7, 1989, 'BACHILLER', 'ciencias', 'av. los próceres barrió san isidro casa nº  0-23', '0426-8751576', '', 'yohe_fire@hotail.es', '', 'Incendio', ''),
(1070, 18578049, 'BO-1337', 'BOMBERO', ' Jorge Leonardo', 'Contreras Guerrero,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR ', 2, 10, 1988, 'Tecnico Medio', 'informatica', 'el corozo carrera nueve calle seis casa nº  5-16', '4262675492', '', 'jleonardocontreras@hotmail.com', 'Activo', 'Servivida', 'panamericana'),
(1071, 20829679, 'BO-1339', 'BOMBERO', 'Vianney Alfonso', 'Duran Marquez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'canagua', 24, 11, 1991, 'Bachiller', 'ciencias', 'urbanizacion villa libertad edificio nª02 apartamento 29 las gonzalez', '', '0275-8088987', 'duramviane@gmail.com', '', '', ''),
(1072, 17321143, 'BO-1340', 'BOMBERO', 'Gloria', 'Escalona Altuve,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MUCUCHACHI', 11, 3, 1984, 'TSU ', 'Emergencia Pre Hospitalar', 'chamita calle los cedros casa 1-26', '', '0426-4050253', 'GLORIAESCALONA@HOTMAIL.COM', '', 'Servivida', 'Metropolitana'),
(1073, 19848745, 'BO-1341', 'BOMBERO', 'Enyer Yaneli', 'Escalona Martinez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 11, 9, 1987, 'BACHILLER', '', 'quebrada blanca sector sabaneta Tovar', '', '0426-9777120', '', '', '', ''),
(1074, 20939644, 'BO-1342', 'BOMBERO', ' Deiby Jesus', 'Fernandez Pereira,', 1, 5, 2011, 'Venezolano', 'Masculino', '', 10, 6, 1991, 'Bachiller', '', '', '', '', '', '', '', ''),
(1075, 20433008, 'BO-1343', 'BOMBERO', 'Josue Alfonso', 'Garrido Dugarte,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 20, 6, 1991, 'Bachiller', '', 'avenida miranda casa 06 santa elena', '', '4160131019', '', '', '', ''),
(1076, 24196497, 'BO-1344', 'BOMBERO', 'Jesus Alberto', 'Giacoman Diaz,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 31, 3, 1992, 'Tecnico Medio', 'medicina de Emergencia', 'san jaciento sector la unidad via principal casa s/n', '0274-2529787', '0416-7556317', 'alberto_giacoman@hotmail.com', '', '', ''),
(1077, 18798076, 'BO-1345', 'BOMBERO', 'Carlos Eduardo', 'Guerrero Molina,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 4, 11, 1988, 'Tecnico Medio', 'agrotecnia', 'el arenal la vega san antonio calllejon las callenas casa s/n', '0274-2450710', '0416-1719242', 'carlos_eduard0g2004@hotmail.com', '', '', ''),
(1078, 17663771, 'BO-1347', 'BOMBERO', ' Jesus David', 'Guillen Rangel,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 1, 11, 1985, 'Bachiller', 'ciencias', 'el chama avenida las acacias casa nº 1-246', '', '0274-2668953', 'kachichen21@hotmail.com', '', '', ''),
(1079, 19047746, 'BO-1348', 'BOMBERO', ' Nelly Patricia', 'Guillen Villasmil,', 1, 5, 2011, 'Venezolano', 'Masculino', 'Tovar', 20, 4, 1989, 'Bachiller', 'ciencias', 'santa cruz de mora sector quebrada del barro calle principal casa s/n', '0426-1192148', '0275-4116534', '', 'Activo', 'Servivida', 'Mocoties'),
(1080, 19421939, 'BO-1349', 'BOMBERO', 'Wuilian Jose', 'Gutierrez Gutierrez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 17, 3, 1987, 'Bachiller', '', 'san juan de lagunillas sector inrrevi calle 15 casa 20', '', '', '', '', '', ''),
(1081, 17521057, 'BO-1350', 'BOMBERO', 'Yusbeydi Dayana', 'Hernandez Guerrero,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 5, 6, 1986, 'Bachiller', '', 'urbanizacion carobobo vereda 37 casa 12', '', '2742218084', 'IVONNESUAREZ28@HOTMAIL.COM', '', '', ''),
(1082, 16020136, 'BO-1351', 'BOMBERO', 'Jose Luis', 'Hernandez Molina,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 25, 5, 1984, 'Bachiller', '', 'primera calle los naranjos casa nº ·3-14', '', '0426-473.2550', 'jlocobain_444@hotmail.com', '', '', ''),
(1083, 16664939, 'BO-1354', 'BOMBERO', 'Andreina Coromoto', 'Lanzarone Peña,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 10, 5, 1985, 'Tecnico Medio', 'secretariado ejecutivo', 'ejido bella vista calle 02 casa 60 ', '0416-1961514', '0274-2710036', 'kciquita_andry@hotmail.com', '', '', ''),
(1084, 18797140, 'BO-1355', 'BOMBERO', 'Johana Carolina', 'Maldonado Castillo,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 12, 10, 1985, 'BACHILLER', 'ciencias', 'san rafael de tabay sector la plazuela callemi viejo camio casa 0-07', '426472373', '', 'Gaiskar99@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(1085, 20432037, 'BO-1356', 'BOMBERO', 'Armando Javier', 'Maldonado Flores,', 1, 5, 2011, 'Venezolano', 'Masculino', 'caracas', 4, 12, 1992, 'Tecnico Medio', 'medicina de Emergencia', 'avenida las Américas casa 1-35', '', '0274-2443674', '', '', '', ''),
(1086, 19422127, 'BO-1357', 'BOMBERO', ' Blanca Beatriz', 'Marquez Vielma,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 13, 11, 1988, 'Bachiller', 'ciencias', 'santa catalina calle principal casa n 35-38', '0424-7199367', '0274-2665470', 'blanca131188@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1087, 20397240, 'BO-1358', 'BOMBERO', 'Carlos Javier', 'Marquez Ortega,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 27, 8, 1991, 'Tecnico Medio', 'rescate y salvamennto', 'santa cruz de mora la cascada del guayabal casa sn', '0414-7355867', '0275-4145242', 'CARLOSJAVI45@HOTMAIL.COM', '', 'RESCATE', ''),
(1088, 17757156, 'BO-1359', 'BOMBERO', 'Leonardo Jose', 'Mata Lopez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'caracas', 17, 7, 1985, 'Bachiller', 'ciencias', 'barrio wilfrido omaña sbaneta calle samora casa 55 ', '', '0275-8730281', 'elmoreno_17_01_85@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1089, 19144404, 'BO-1360', 'BOMBERO', 'Carmen Oriany', 'Mattie Sayago,', 1, 5, 2011, 'Venezolano', 'Femenino', 'MERIDA ', 21, 4, 1989, 'BACHILLER', 'ciencias', 'paseo las ferias piso 02 aparatmento 24 ', '4268027047', '2742214376', 'oriany_21@hotmail.com', '', 'Servivida', ''),
(1090, 16307624, 'BO-1361', 'BOMBERO', 'Maria Elena', 'Mendez Molina,', 1, 5, 2011, 'Venezolano', 'Masculino', 'VIGIA', 5, 5, 1981, 'TSU ', 'Administracion de recurso', 'andres eloy calle principal casa nº 6-19', '0274-2440123', '', 'GEMELVAE@HOTMAIL.COM', 'Activo', 'Servivida', 'Metropolitana'),
(1091, 20832548, 'BO-1362', 'BOMBERO', ' Luis Alejandro', 'Molina Ramirez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 11, 10, 1989, 'BACHILLER', 'ciencias', 'la macana sector los llanitos santa cru de mora  casa s/n', '', '0426-6032662', 'l-molina32@hotmail.com', '', 'Rescate', ''),
(1092, 19894833, 'BO-1363', 'BOMBERO', 'Esther Abigail', 'Monsalve Torres,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 17, 8, 1989, 'TSU ', 'CIENCIAS DEL FUEGO Y RESC', 'santa anita calle principal 2-53', '', '0274-2448373', 'AGATA1_109@HOTMAIL.COM', '', '', ''),
(1093, 20829330, 'BO-1364', 'BOMBERO', ' Neptali Jose', 'Mora Marquez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'canagua', 14, 6, 1991, 'BACHILLER', 'ciencias', 'urbanizacion don luis calle 3 casa 13 manasana 9 ejido', '0416-4755037', '', 'talimoramarquez@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(1094, 20198087, 'BO-1365', 'BOMBERO', ' Reiman Jose', 'Mora Vega,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 10, 3, 1990, 'Tecnico Medio', 'rescate y salvamennto', 'el arenal urbanizacion don perucho  calle 09 avenida 05 casa 640', '0426-9266254', '0274-2449410', 'THE_KINGMAN@HOTMAIL.COM', '', 'Incendio', 'Metropolitana'),
(1095, 20197276, 'BO-1366', 'BOMBERO', 'Jaseh Rafael', 'Munelo Gil,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 10, 3, 1990, 'Tecnico Medio', 'rescate y salvamennto', 'los llanitos de tabay sector capillas de las mercedes calle la hacienda cas', '42627716876', '0274-2622685', 'rafael_776@hotmail.com', 'Activo', '', ''),
(1096, 20851714, 'BO-1367', 'BOMBERO', ' Nefi Javier', 'Parra Alarcon,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 21, 11, 1990, 'Tecnico Medio', 'medicina pre hospitalaria', 'avenida sucre casa numero 1-03 tabay', '4263761789', '', 'fireman_javier19@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1097, 17340049, 'BO-1368', 'BOMBERO', 'Jesus Antonio', 'Peña Diaz,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 27, 6, 1987, 'Tecnico Medio', 'agropecuario', 'san jaciento urbanizacion 5 aguilas blancas casa 39-99', '0414-5322596', '', 'jesus1756@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1098, 16907202, 'BO-1369', 'BOMBERO', 'Maria Eugenia', 'Peña Guillen,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 12, 11, 1985, 'bachiller', 'ciencias', 'urbanizacion la estrella edificio 01 aparatmento 1-02 mesa de las palmas ', '', '2759881809', '', '', '', ''),
(1099, 18637459, 'BO-1370', 'BOMBERO', 'Ramon David', 'Peña Rangel,', 1, 5, 2011, 'Venezolano', 'Masculino', 'VIGIA', 7, 2, 1989, 'Bachiller', 'ciencias', 'caño seco sector las colinas calle 05 casa 05-03', '0416-3773206', '', 'ramon4f1989@hotmail.com', '', '', ''),
(1100, 20851938, 'BO-1371', 'BOMBERO', 'Darwin Hangler', 'Peña Sosa,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 11, 3, 1992, 'BACHILLER', 'ciencias', 'parroquia mucutuy calle don pedro casa s/n', '', '0274-2665510', 'darwuin1992_3@hotmail.com', '', '', ''),
(1101, 17581167, 'BO-1372', 'BOMBERO', ' Yolima', 'Peñaranda Torrado,', 1, 5, 2011, 'Venezolano', 'Masculino', 'los najanjos merida', 13, 11, 1983, 'BACHILLER', 'ciencias', 'caño seco 4 urbanizacion villa los angeles calle 1 casa 29', '0414-9745427', '0275-8829212', 'sthephanyvaleria@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(1102, 20572753, 'BO-1373', 'BOMBERO', ' Luis Baudilio', 'Peñaranda Torrado,', 1, 5, 2011, 'Venezolano', 'Masculino', 'VIGIA', 30, 12, 1987, 'Bachiller', 'integral', 'zona industrial el vigia avenida principal casa 73', '', '0275-8817476', '', '', '', ''),
(1103, 19751017, 'BO-1374', 'BOMBERO', 'Ninibe Del Carmen', 'Pereira Vivas,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 10, 3, 1990, 'Tecnico Medio', 'construccion Civil', 'av principal bolivar sector chamita calle 13 los bucares casa 13-24', '0416-6759518', '0274-5111767', 'ninibe_4@hotmail.com', '', 'Servivida', 'Metropolitana'),
(1104, 20217515, 'BO-1375', 'BOMBERO', 'Junior Amador', 'Perez Pereira,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 13, 8, 1991, 'Bachiller', 'ciencias', 'la macana sector san antonio santa cruz de mora casa s/n', '4140790451', '', 'juniorperz@hotmail.com', '', '', ''),
(1105, 20394310, 'BO-1376', 'BOMBERO', 'Jose Luis', 'Perez Pinto,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 10, 9, 1989, 'Bachiller', 'ciencias', 'calle principal sector puerto rico santa cruz de mora casa 29', '4167770589', '', 'perezpintojose2012@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(1106, 19848850, 'BO-1377', 'BOMBERO', 'Yarledy Surisay', 'Pernia Ramirez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 29, 3, 1992, 'BACHILLER', 'ciencias', 'guaraquesector la vega calle prncipal casa s/n', '4264167473', '2759956582', 'jghyarledys@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(1107, 20395430, 'BO-1378', 'BOMBERO', 'Yumary Daniela', 'Pernia Vega,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR ', 17, 2, 1190, 'BACHILLER', 'ciencias', 'residencias gurmencinda rojas calle los pinos casa s/n sabaneta Tovar', '0275-2668062', '0426-6751390', 'jade_v_102@hotmail.com', '', '', ''),
(1108, 17341089, 'BO-1379', 'BOMBERO', 'Jorge Luis', 'Pirela Rojas,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 26, 2, 1987, 'BACHILLER', 'ciencias', 'santa catalina calle la estillera casa 2-20 chama', '', '0274-3104086', '', '', '', ''),
(1109, 15920219, 'BO-1380', 'BOMBERO', 'Mercedes Carolina', 'Ramirez De Mejias,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 30, 4, 1980, 'TSU ', 'emergencia pre hospitalar', 'la carbonera media calle principal casa 051', '', '0274-7896962', 'guadalupebombera@hotmail.com', '', '', ''),
(1110, 20433440, 'BO-1381', 'BOMBERO', 'Cesar Rene', 'Reinoza Guillen,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 30, 3, 1992, 'Bachiller', 'ciencias', 'barrio gonzalo picon avenida don tulio calle principal casa 39-126', '', '0426-5242335', '', '', '', ''),
(1111, 20849600, 'BO-1382', 'BOMBERO', 'Luis Alejandro', 'Rendon Sosa,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 15, 11, 1991, 'Bachiller', 'ciencias', 'urbaniacion osuna rodriguez verda 30 casa 04-01', '0274-2712672', '0426-6799848', 'alejand_re@hotmail.com', '', '', ''),
(1112, 19096033, 'BO-1383', 'BOMBERO', 'Gladys Albany', 'Rincon Goyo,', 1, 5, 2011, 'Venezolano', 'Femenino', 'merida', 18, 4, 1988, 'Bachiller', 'humanidades', 'caño seco 1 sector las colinas calle 2 casa nª 2-83', '0424-8512007', '', '', 'Activo', 'Incendio', 'Panamericana'),
(1113, 19048857, 'BO-1384', 'BOMBERO', ' Skahary Jasbely', 'Rivera Urdaneta,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 25, 6, 1990, 'Tecnico Medio', 'OPERACIONES CONTRA INCEND', 'bulevar cruz diez el añil casa s/n  Tovar', '0424-7811733', '0426-1763009', 'SKAHARY_RIVERA@HOTMAIL.COM', '', '', ''),
(1114, 20829178, 'BO-1385', 'BOMBERO', 'Yonder Alexader', 'Rojas Marquez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 17, 11, 1991, 'Bachiller', 'CENCIAS', 'barrio monseñor moreno calle 02 parte alta casa s/n', '0416-3734557', '0275-8733276', 'YOSE_03@HOTMAIL.COM', 'Activo', 'Incendio', 'Mocoties'),
(1115, 19421826, 'BO-1386', 'BOMBERO', 'Marcelo', 'Rondon Gabriel,', 1, 5, 2011, 'Venezolano', 'Masculino', '', 23, 8, 1990, 'Bachiller', '', 'san jacinto frente al concripto', '', '', 'gabriel_18_01@hotmail.com', '', '', ''),
(1116, 20394392, 'BO-1387', 'BOMBERO', 'Yunior Jose', 'Rondon Pernia,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 15, 12, 1991, 'Tecnico Medio', 'informatica', 'carrera 01 con calle 04 casa 0-68 sector el añil Tovar', '', '0275-8732945', 'YUNIOR_RONDON_1991@HOTMAIL.COM', 'Activo', 'Rescate', 'Mocoties'),
(1117, 18798401, 'BO-1388', 'BOMBERO', 'Aleska Joyner', 'Rosales Davila,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 30, 7, 1988, 'Bachiller', 'ciencias', 'la azulita, aldea olinda 1, municipio andres bello casa sin  numero', '0426-6672470', '4265737461', 'multasb_@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(1118, 18209121, 'BO-1389', 'BOMBERO', 'Ali Yordano', 'Rosales Rojas,', 1, 5, 2011, 'Venezolano', 'Masculino', 'TOVAR', 2, 4, 1989, 'Tecnico Medio', 'informatica', 'carrera 03 casa 0-18 sector el añil Tovar', '', '0426-3652831', 'thepago_13@hotmail.com', '', '', ''),
(1119, 20365730, 'BO-1390', 'BOMBERO', 'Felix Jose', 'Salas Valera,', 1, 5, 2011, 'Venezolano', 'Masculino', 'caracas ', 15, 11, 1990, 'Bachiller', 'ciencias', 'urbanizacion carabobo vereda 45 casa 13', '0426-8749478', '', 'DRAGON_FELIX_DRAGON@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(1120, 15031824, 'BO-1391', 'BOMBERO', 'Alexander Alberto', 'Salcedo Gutierrez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 15, 5, 1982, 'Bachiller', 'ciencias', 'san jacinto sector negro primero casa 0-7', '', '0274-2511458', 'cainrxz135|@hotmail.com', '', '', ''),
(1121, 17663567, 'BO-1392', 'BOMBERO', 'Franki Jose', 'Sanchez Alvarez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 2, 5, 1985, 'Bachiller', 'ciencias', 'urbanizacion carabobo vereda 23 casa 03 ', '0426-3299977', '0274-2665513', 'frankirendon@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(1122, 20431733, 'BO-1394', 'BOMBERO', ' Nohely Andrea', 'Sanchez Rivas,', 1, 5, 2011, 'Venezolano', 'Femenino', 'merida', 3, 1, 1992, 'Tecnico Medio', 'operaciones contra incend', 'calle principal el llanito la otra banda casa 5-58', '0246-7799284', '2742443276', 'nohelisanchez@hotmail.com', 'Activo', 'Rescate', ''),
(1123, 17456195, 'BO-1395', 'BOMBERO', 'Adelis Andres', 'Sosa Gamez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 31, 7, 1986, 'Bachiller', 'ciencias', 'los llanitos de tabay urbanizacion vista alegre casa 0-40', '0416-3750411', '0274-4151930', '', 'Activo', 'Incendio', 'Metropolitana'),
(1124, 17456943, 'BO-1396', 'BOMBERO', 'Pedro Jose', 'Sosa Mendez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 14, 1, 1986, 'Bachiller', 'ciencias', 'el chamita clle coromoto pasaje la villa casa 03-10', '0426-9779657', '0274-2668803', 'pedri_106@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(1125, 18124259, 'BO-1397', 'BOMBERO', 'Ronnie Paul', 'Sosa Perez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 15, 11, 1986, 'Bachiller', 'ciencias', 'avenida las Américas san jose de las flores baja calle 01 casa 0-46', '4161746594', '0274-5110292', 'RONISOS@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(1126, 21330418, 'BO-1398', 'BOMBERO', 'Elizabeth', 'Soto Quiñonez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'tovar', 2, 7, 1989, 'TSU', 'Ciencia del fuego Rescate', 'ejido pan de azucar parte alta vereda santa ines  casa s/n', '4160793344', '0274-2663853', 'elizabethsoto20@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1127, 18984069, 'BO-1399', 'BOMBERO', ' Wilmer Antonio', 'Suarez Blanco,', 1, 5, 2011, 'Venezolano', 'Masculino', 'trujillo', 24, 12, 1985, 'BACHILLER', 'ciencias', 'tucani calle 01 sector zona nueva casa s/n', '0414-7313799', '', 'wilmersblanco_8526@hot', 'Activo', 'Incendio', 'Panamericana'),
(1128, 19593757, 'BO-1400', 'BOMBERO', 'Jesus Israel', 'Torres Buitriago,', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 11, 6, 1991, 'Tecnico Medio', 'promocion y gestion ambie', 'los chorros de milla vivienda 5 de julio parte baja casa 8-12', '', '0274-2449731', 'el_saperoco4@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(1129, 19592046, 'BO-1401', 'BOMBERO', 'Jose Alexander', 'Uzcategui Hernandez,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 17, 1, 1988, 'BACHILLER', '', 'la pedregosa residencia san isidro calle albarregas casa 02', '', '4164700811', 'DJALEZ@HOTMAIL.COM', '', '', ''),
(1130, 18798876, 'BO-1402', 'BOMBERO', 'Yusmary Del Valle', 'Valero Santiago,', 1, 5, 2011, 'Venezolano', 'Femenino', 'mucuchies', 28, 2, 1988, 'Tecnico Medio', 'informatica', 'san rafael de mucuchies calle independencia doscuadras mas arriba de la igl', '0426-8028525', '0274-8085927', 'jade_v_102@hotmail.com', 'Activo', 'Servivida', 'Paramo'),
(1131, 19422755, 'BO1403', 'BOMBERO', 'Mariam', 'Vidal Torres,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 25, 5, 1990, 'BACHILLER', '', 'calle principal santa catalina casa 07 sector el chama ', '', '0274-2665220', '', '', '', ''),
(1132, 18839048, 'BO-1404', 'BOMBERO', 'Victor Julio', 'Vielma Figueroa,', 1, 5, 2011, 'Venezolano', 'Masculino', 'ZULIA', 21, 6, 1987, 'Tecnico Medio', 'industrial bombero', 'sector puente la pedregosa via jaji casa nª67-94 ', '0416-0723162', '0274-2660237', 'victorvielma_87@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1133, 17239796, 'BO-1405', 'Bombero', 'Elsy Dolores', 'Vielma Rangel,', 1, 5, 2011, 'Venezolano', 'Femenino', 'MERIDA', 2, 4, 1984, 'Licenciado', 'Educacion', 'el pinar calle principal entrada negro primero casa 0-7 san jacinto', '4161777725', '0274-6575647', 'RANSESCAIN@HOTMAIL.COM', 'Activo', 'Rescate', 'Panamericana'),
(1134, 21182080, 'BO-1407', 'BOMBERO', 'Angel David', 'Yorbouh Davila,', 1, 5, 2011, 'Venezolano', 'Masculino', 'MERIDA', 2, 7, 1990, 'Tecnico Medio', 'administracion financiera', 'chama urbanizacion carabobo sector justo briceño vereda 03 casa 02', '0426-3265713', '0274-7908401', 'angel_davila4@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1135, 22665357, 'BO-1408', 'BOMBERO', 'Leonel Emiro', 'Zerpa Pereira,', 1, 5, 2011, 'Venezolano', 'Masculino', 'lagunillas', 3, 11, 1990, 'Bachiller', 'ciencias', 'quebrada del loro sector algaborrobos casa s/n estanques ', '', '0416-6777615', '', '', '', ''),
(1136, 19486912, 'BO-1409', 'BOMBERO', 'Luis Alejandro', 'Carrero Coley,', 1, 5, 2011, 'Venezolano', 'Masculino', 'Caracas', 2, 10, 1990, 'Bachiller', 'ciencias', 'santa cruz de mora sector puerto rico calle principal casa s/n', '0426-7598610', '', 'luis-alecarrero@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(1137, 14131372, 'BO-1410', 'BOMBERO', 'Franklin Alberto', 'Marquez Molina,', 1, 7, 2011, 'Venezolano', 'Masculino', 'TOVAR', 2, 4, 1979, 'Bachiller', 'ciencias', 'sector los naranjos el llano casa s/n Tovar', '4264917157', '0275-8730766', 'franklin14131@hotmail.com', 'Activo', 'Rescate', 'Mocoties'),
(1138, 20397301, 'BO-1411', 'BOMBERO', ' Guillermo Alberto', 'Velazquez Rodriguez', 1, 7, 2011, 'Venezolano', 'Masculino', 'valencia', 25, 5, 1989, 'Bachiller', 'ciencias', 'segunda calle de los naranjos Tovar casa s/n', '0274-790920', '0426-6527973', 'guillevelasquez@gmail.com', 'Activo', 'Incendio', 'Mocoties'),
(1139, 17664137, 'BO-1412', 'BOMBERO', ' Angel Eduardo', 'Sanchez Araque', 1, 5, 2011, 'Venezolano', 'Masculino', 'merida', 9, 12, 1986, 'Bachiller', 'ciencias', 'la pedregosa media calle nueva bolivia casa nª 45', '0426-2765566', '0274-2664879', 'amersar.1@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1140, 18966978, 'BO-1413', 'BOMBERO', ' Jesus Gerardo', 'Vera Rangel', 1, 8, 2011, 'Venezolano', 'Masculino', 'merida', 1, 11, 1989, 'Bachiller', 'ciencias', 'avenida 16 de septiembre campo de oro calle 03 casa 04-02', '', '0274-2630603', '', '', '', ''),
(1141, 13097718, 'BO-1414', 'BOMBERO', ' Stiwan Eduardo', 'Barrios Marquina', 1, 10, 2011, 'Venezolano', 'Masculino', 'merida', 15, 1, 1978, 'Bachiller', 'ciencias', 'las gonzales residencias villa libertad torre 05 piso 03 aparatamento 26', '', '0274-2453416', 'stwert3_1_07@hotmail.com', '', '', ''),
(1142, 22987541, 'BO-1415', 'BOMBERO', ' Ronald Johao', 'Moran Jojoa', 1, 9, 2011, 'Venezolano', 'Masculino', 'merida', 25, 6, 1993, 'Tecnico Medio', 'medicina pre hospitalaria', 'santa catalina la estillera calle la brisa casa s/n', '0274-2600203', '0414-7244119', 'rnitro_33@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1143, 12353172, 'BO-1417', 'BOMBERO', ' Leonel Augusto', 'Hernandez Ramirez', 1, 4, 2012, 'Venezolano', 'Masculino', '', 29, 11, 1973, '', '', '', '0424-8475383', '', '', '', '', ''),
(1144, 20434220, 'BO-1418', 'BOMBERO', ' Nora Carolina', 'Peña Garcia', 1, 4, 2012, 'Venezolano', 'Femenino', 'MERIDA', 2, 5, 1992, 'Tecnico Medio', 'medicina de emergencia', 'av. las américas frente al ambulatorio venezuela  casa nº 1-35', '0426-4236903', '0274-2443674 ', 'noracarolina58@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1145, 19847712, 'BO-1419', 'Bombero', ' Asleidy Del Valle', 'Pernia Ramirez', 1, 4, 2012, 'Venezolano', 'Masculino', 'TOVAR', 24, 9, 1990, 'TECNICO MEDIO', 'MEDICINA EN EMERGENCIA', 'calle principal barrio santa elena casa numero g -27', '4247486612', '0275-8083939', 'ASLEIDY@HOTMAIL.COM', 'Activo', 'Incendio', 'Mocoties'),
(1146, 20012570, 'BO-1420', 'BOMBERO', ' Juan Coromoto', 'Valenzuela  Davila', 1, 4, 2012, 'Venezolano', 'Masculino', 'GUANARE ', 24, 11, 1989, 'BACHILLER', 'ciencias', 'via el salado urb la noguereña edif 3 apto 4', '0426-4756587', '0274-2215127 PA', 'juan13077@hotmail.com', '', '', ''),
(1147, 23236772, 'BO-1421', 'BOMBERO', ' Liliana Nayreth', 'Rodriguez Vergara', 1, 4, 2011, 'Venezolano', 'Masculino', 'chiguara ', 22, 9, 1992, 'Tecnico Medio', 'medicina de emergencia', 'sector saturna picon final calle comercio chiguara casa s/n', '0424-7528103', '', 'lilinay22@hotmail.com', '', '', ''),
(1148, 20197022, 'BO-1422', 'BOMBERO', ' Franklin Jose', 'Aguilar Lopez', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 15, 10, 1984, 'Bachiller', 'medicina de emergencia', 'urbanizacion carabobo sector santa juana ', '', '', '', '', '', ''),
(1149, 19995761, 'BO-1423', 'BOMBERO', ' Irene', 'Altuve Altuve', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 10, 11, 1989, 'BACHILLER', 'ciencias', 'chamita av bolivar sector el recreo, calle la hacienda casa 1-5', '0416-4113208', '0274-2669826', 'irene_21_89@hotmail.com', '', 'Incendio', ''),
(1150, 20433326, 'BO-1424', 'BOMBERO', ' Yohari Enrique', 'Arellano Briceño', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida', 8, 10, 1990, 'TECNICO MEDIO', 'agropecuaria', 'ek arenal los periodistas', '0416-6724114', '0274-4165005', 'angel_brabo@hotmail.com', '', '', ''),
(1151, 11466063, 'BO-1425', 'BOMBERO', ' Virgilio', 'Briceño Barrios', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 7, 11, 1972, 'Bachiller', 'ciencias', 'los rosales calle luis herrera casa n-22 b', '0274-2217589', '0416-9987848', 'virgilio_7BB@hotmail.com', '', '', ''),
(1152, 21306440, 'BO-1426', 'BOMBERO', ' Lewis Johan', 'Contreras Acosta', 1, 5, 2012, 'Venezolano', 'Masculino', 'VIGIA', 15, 12, 1993, 'Tecnico Medio', 'mencion bombero', 'caño seco 2 av 1 sector 1 casa 09 el vigia', '4147293696', '', 'LEWIS_ELBEBE@HOTMAIL.COM', 'Activo', 'Incendio', 'Panamericana'),
(1153, 20829530, 'BO-1428', 'BOMBERO', ' Nailet', 'Contreras Rondon', 1, 5, 2012, 'Venezolano', 'Masculino', 'TOVAR', 28, 8, 1992, 'Tecnico Medio', 'EMERGENCIA PREHOSPITALARI', 'san juan de lagunillas calle colon casa s/n', '0416-9068361', '', 'nailetcontreras16@hotmail.com', '', '', ''),
(1154, 20736463, 'BO-1427', 'BOMBERO', ' Eliberto Jose', 'Contreras', 1, 5, 2012, 'Venezolano', 'Masculino', 'Pedraza, Estado BARINAS', 17, 7, 1991, 'Tecnico Medio', 'MENCION CIENCIAS AGRICOLA', 'barrio la floresta calle 26 barinas', '0424-7310739', '0273) 8088704 ', 'FENIXDRANYER_SONASTY@hotmail.com ', 'Activo', 'Incendio', 'Barinas'),
(1155, 18619804, 'BO-1429', 'BOMBERO', ' Alexavier', 'Fernandez Rincon', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 3, 1, 1987, 'Tecnico Medio', 'medicina de emergencia', 'la pedregosa media calle  el araguaney casa 1 ', '0416-1737400', '0274-2666205', 'alexavierfernandezr@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1156, 24583896, 'BO-1431', 'BOMBERO', ' Skharlett Dorimar', 'Gonzalez Diaz', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 13, 3, 1994, 'Tecnico Medio', 'medicina pre hospitalaria', 'san jacinto entrada de la escuela simon rodriguez casa numero 97-70', '0416-4796914', '', 'kale_13_03@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(1157, 20352374, 'BO-1432', 'BOMBERO', ' Yordis Jose', 'Gonzalez Torres', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 21, 10, 1989, 'Tecnico Medio', 'medicina de Emeregencia', 'nva bolivia urb bolivar 2000 calle ppal frente a la iglesia casa s/n', '', '0416-065.87.15 ', 'yordis_gonzalez@hotmail.com', '', '', ''),
(1158, 22664945, 'BO-1433', 'BOMBERO', ' Sabah', 'Kahhale Santiago', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 1, 7, 1993, 'Tecnico Medio', 'medicina de Emeregencia', 'urbanizacion carobobo vereda 32 casa 10', '4147260131', '2742665451', 'sabih0192@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1159, 18309406, 'BO-1434', 'BOMBERO', ' Liseth Carolina', 'Leon Marquina', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 25, 9, 1988, 'TSU ', 'Manejo de Emergencia y Ac', 'sta cruz de mora sector alberto ravelo av ppal casa s/n', '0414-7249465', '0275-8670842', 'lisskrol_25@hotmail.com', '', '', ''),
(1160, 18146918, 'BO-1435', 'BOMBERO', ' Jesus  Eduardo', 'Madero', 1, 5, 2012, 'Venezolano', 'Masculino', 'apure', 6, 11, 1983, 'Tecnico Medio', 'mencion bombero', 'urbanizacion juan pablo ii manzana 10  casa 3 barinas ', '414-7002306', '', 'jesuseduardomadero@hotmail.com', '', 'Incendio', 'Barinas'),
(1161, 12777481, 'BO-1436', 'BOMBERO', ' Miriam Lizbeth', 'Marquez', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida', 11, 10, 1974, 'TSU ', 'administracion empresas', 'san jacinto cinco aguilas blancas avenida 04 pico humbolt casa 60-83', '0426-3704929', '0274-2523862', 'lisbet_11_35@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(1162, 23497227, 'BO-1437', 'BOMBERO', ' Angelli Genis', 'Marquez Peña', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida ', 11, 12, 1993, 'Tecnico Medio', 'medicina de Emeregencia', 'jaciento plaza verda 06 casa 11', '0424-7143272(MA', '', '', '', '', ''),
(1163, 14268414, 'BO-1438', 'BOMBERO', ' Kenya Janeth', 'Molina Marquez', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 16, 6, 1977, 'BACHILLER', 'ciencias', 'urbaniacion 5 aguilas blancas casa 60-88 san jacinto ', '0416-1793638', '0274-2529710', 'molina_kenya@hotmail.com', '', '', ''),
(1164, 19848985, 'BO-1439', 'BOMBERO', ' Miguel Antonio', 'Obando Molina', 1, 5, 2012, 'Venezolano', 'Masculino', 'TOVAR', 0, 0, 0, 'BACHILLER', 'ciencias', 'Tovar parroquia el amparo sector el tejar casa s/n', '', '0426-2394408', 'miguelantonio200611@hotmail.com', '', '', ''),
(1165, 12350896, 'BO-1440', 'BOMBERO', ' Daniel Alberto', 'Ortega Molina', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida', 27, 5, 1976, 'BACHILLER', 'ciencias', 'urbanizacion don perucho sector el arenal avenida 08 casa 7-30', '', '0274-2449951', 'T.EGADAN27@HOTMAIL.COM', '', '', ''),
(1166, 24583888, 'BO-1441', 'BOMBERO', ' Abbin Jose', 'Peña Gil', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA ', 1, 12, 1993, 'Tecnico Medio', 'medicina de Emeregencia', 'urbanizacion carabobo calle principal vereda 03casa s/n', '', '', 'abbin071178@gmail.com', '', '', ''),
(1167, 23497517, 'BO-1442', 'BOMBERO', ' Brian Alexander', 'Pineda Belandria', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA ', 19, 8, 1993, 'Tecnico Medio', 'medicina de emergencia', 'ejido urbanizacion inrrevi calle 11 casa 6-34', '0426-2772258', '0274-2214924', 'brian_PINEDA_001@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(1168, 22658570, 'BO-1443', 'BOMBERO', ' Daniel Adrian', 'Pino Sanchez', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida', 7, 6, 1993, 'Tecnico Medio', 'medicina de Emergencia ', 'chamita calle 09 los sedross casa 1 -62', '0426-9796942', '0474-4160696', 'daps_76@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1169, 23556559, 'BO-1445', 'BOMBERO', ' Erixon Jose', 'Ramirez Escalante', 1, 5, 2012, 'Venezolano', 'Masculino', 'vigia', 30, 10, 1993, 'Tecnico Medio', 'medicina de Emergencia ', 'calle 01 avenida 7 casa 0-64 barrio el carmen el vigia', '4247213305', '0275-8810838', 'goyito_ramirez@hotmail.es', '', '', ''),
(1170, 23724452, 'BO-1446', 'BOMBERO', ' Oscar Eduardo', 'Ramirez Oviedo', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 26, 8, 1993, 'TECNICO MEDIO', 'medicina de Emergencia ', 'la parroquia calle bolivar casa 12,', '4262750184', '2742714360', 'oscar_ramirez_93@hotmail.com', '', 'Incendio', 'Metropolitana'),
(1171, 23493430, 'BO-1447', 'Bombero', ' Nalberth Homero', 'Ramirez Ramirez', 1, 5, 2012, 'Venezolano', 'Masculino', 'TOVAR', 11, 4, 1994, 'Tecnico Medio', 'medicina de Emergencia ', 'urbanizacion quebrada blanca calle la victoria casa s/n', '4169725194', '0275-8083939', 'nalberthetibem@hotmail.com', 'Activo', '', 'Metropolitana'),
(1172, 22659096, 'BO-1448', 'BOMBERO', ' Jesus Alejandro', 'Rojas Monsalve', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida', 9, 3, 1994, 'Tecnico Medio', 'medicina de Emergencia ', 'urbanizacion carabobo vereda 30 casa 09', '4161764576', '0274-2665083', 'elfresa_alex@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1173, 18964932, 'BO-1449', 'BOMBERO', ' Rosbeiry Laura', 'Rondon', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida', 22, 8, 1998, 'Tecnico Medio', 'medicina de Emergencia ', 'san jaciento frente al conscrito casa s/n', '0414-9779210', '0274-2510984', '', '', '', ''),
(1174, 21332066, 'BO-1450', 'BOMBERO', ' David Alejandro', 'Salas Calderon', 1, 5, 2012, 'Venezolano', 'Masculino', 'vigia', 12, 11, 1993, 'Tecnico Medio', 'medicina de Emergencia ', 'urbanizacion francisco javier angulo calle 13 casa 7', '', '', '', '', '', ''),
(1175, 20573778, 'BO-1451', 'BOMBERO', ' Junior Leonel', 'Soto Chacon', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida', 27, 4, 1991, 'BACHILLER', 'ciencias', 'vigia urbanizacion buenos aires casa 02-06-93 ', '0424-7192829', '0275-8811013', 'LEONEL_55@HOTMAIL.COM', 'Activo', 'Incendio', 'Panamericana'),
(1176, 8005264, 'BO-1452', 'BOMBERO', ' Alirio', 'Zambrano Contreras', 1, 5, 2012, 'Venezolano', 'Masculino', 'MERIDA', 8, 10, 1959, 'Bachiller', 'ciencias', 'barrio la milagrosa pasaje principal vereda 01 casa 14-08', '4161773634', '0274-2447328', 'kuyepey@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1177, 15135302, 'BO-1453', 'BOMBERO', ' Omar Segundo', 'Zambrano Pineda', 1, 5, 2012, 'Venezolano', 'Masculino', 'merida', 3, 8, 1988, 'Tecnico Medio', 'agropecuario', 'sector el chamita sector las acacias casa 1-345', '4161277945', '0426-6741973', 'omarzambrano82@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(1178, 23556707, 'BO-1454', 'BOMBERO', ' Englishs Amin', 'Abou Assi Varela', 1, 6, 2012, 'Venezolano', 'Masculino', 'el vigia', 5, 5, 1992, 'Tecnico Medio', 'informatica', 'urb. los curos parte media bloque #3 apartamneto 02-02', '', '0414-7047587', 'ENGLISH_AMIN@HOTMAIL.COM', '', '', ''),
(1179, 20352034, 'BO-1455', 'BOMBERO', ' Norvis Enrique', 'Andara Salcedo', 1, 6, 2012, 'Venezolano', 'Masculino', 'caja seca ', 28, 4, 1991, 'BACHILLER', 'ciencias', 'la macarena via principal parte alta ', '', '0426-3740443', '', '', '', ''),
(1180, 17662520, 'BO-1456', 'BOMBERO', ' Yesika Andreina', 'Angulo Briceño', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 15, 7, 1985, 'TSU', 'agrotecnia', 'zumba la florida calle principal casa n 22', '', '0416-4764785', 'lachinita1985_27@hotmail.com', '', '', ''),
(1181, 16455872, 'BO-1457', 'BOMBERO', ' Merly Josefina', 'Araujo Santiago', 1, 6, 2012, 'Venezolano', 'Masculino', 'TRUJILLO', 20, 4, 1986, 'Bachiller', 'ciencias', 'av arzobispo chacon sector pan de azucar vereda nueva era casa 06', '4164781451', '', 'LAGUARA1@HOTMAIL.COM', '', 'Rescate', ''),
(1182, 11468334, 'BO-1459', 'BOMBERO', ' Juan Carlos', 'Balza Sosa', 1, 6, 2012, 'Venezolano', 'Masculino', 'merida', 24, 6, 1971, 'BACHILLER', 'ciencias', 'urbaniacion carabobo calle 01 casa 28', '0416-2753866', '0274-4145489', 'juanbalza1@hotamil.com', 'Activo', 'Incendio', 'Metropolitana'),
(1183, 23026707, 'BO-1460', 'BOMBERO', ' Yefferson Eslader', 'Barrios Melendez', 1, 6, 2012, 'Venezolano', 'Masculino', 'BARINAS', 26, 12, 1992, 'Tecnico Medio', 'industrial', 'urbanizacion belen san juan casa a -07', '4169740741', '', 'yefferson_barrios@hotmail.com', '', '', ''),
(1184, 15620735, 'BO-1462', 'BOMBERO', ' Franklin Jose', 'Briceño Castillo', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 13, 2, 1983, 'BACHILLER', 'ciencias', 'av ppal santa juana casa 1-66', '4247695417', '0274-2634068', 'FRANK13_83@HOTMAIL.COM', '', 'rescate', 'Metropolitana'),
(1185, 20435723, 'BO-1463', 'BOMBERO', ' Junior Albertini', 'Briceño Quintero', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 2, 2, 1991, 'BACHILLER', 'ciencias', 'el arenal parte alta sector los pinos, calle principal estado Mérida', '0416-3759343', '', 'JUNIORBRICENO_02@HOTMAIL.COM', '', '', ''),
(1186, 22111347, 'BO-1464', 'BOMBERO', ' Karena Zury', 'Cabarico Gauta', 1, 6, 2012, 'Venezolano', 'Masculino', 'BARINAS', 14, 4, 1993, 'Tecnico Medio', 'mencion Bombero', 'calle la esperanza callejon 09 poster 03 barinas', '', '0416-0320937', 'KARENA_140493@HOTMAIL.COM', '', '', ''),
(1187, 16445525, 'BO-1465', 'BOMBERO', ' Leonardo Alain', 'Camargo Uzcategui', 1, 6, 2012, 'Venezolano', 'Masculino', 'merida', 1, 7, 1983, 'Bachiller', 'ciencias', 'santa elena calle miranda casa 6-71', '', '', 'leonardocamargo02@hotmail.com', '', 'Rescate', 'Metropolitana'),
(1188, 20142606, 'BO-1466', 'BOMBERO', ' Carlos Luis', 'Carrero Arellano', 1, 6, 2012, 'Venezolano', 'Masculino', 'VIGIA', 17, 6, 1991, 'Tecnico Medio', '', 'bubuqui 04 calle 06 casa s/n', '', '0275-881.82.36', 'Brian159_5@hotmail.com', '', '', ''),
(1189, 12351745, 'BO-1468', 'BOMBERO', ' Gonzalo', 'Corredor Fernandez', 1, 6, 2012, 'Venezolano', 'Masculino', 'merida', 17, 8, 1976, 'Bachiller', 'ciencias', 'el chama urbanizacion el caleron calle 16 casa 02 ', '4163791234', '0274-2600278', '', '', '', ''),
(1190, 24374173, 'BO-1469', 'BOMBERO', ' Anthony Kevin', 'Davila Moreno', 1, 6, 2012, 'Venezolano', 'Masculino', 'Estado Mérida.', 26, 2, 1994, 'BACHILLER', '', 'el arenal. pasaje san javier. sector la bloquera', '0426-3276345', '0274-8080724', 'kevin.2602@hotmail.com', '', '', ''),
(1191, 21181909, 'BO-1470', 'BOMBERO', ' Elizabeth Del Carmen', 'Dugarte Trejo', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 8, 5, 1992, 'BACHILLER', 'ciencias', 'el rincon parte alta casa 1-94', '0416-2767995', '0272-2620307', 'GARSER_12@HOTMAIL.COM', '', '', ''),
(1192, 20217917, 'BO-1471', 'BOMBERO', ' Carlos Arturo', 'Echeverry Cortes', 1, 6, 2012, 'Venezolano', 'Masculino', 'TOVAR', 1, 9, 1991, 'Tecnico Medio', 'comercios servicio admins', 'barrio monseñor moreno calle 02 casa 57 ', '0412-5136039', '0275-2691476', 'SLIPKNOTSARL@HOTMAIL.COM', '', 'Servivida', 'Mocoties'),
(1193, 20432615, 'BO-1472', 'Bombero', ' Ana Gabriela', 'Escalona Salas', 1, 6, 2012, 'Venezolano', 'Masculino', 'm', 29, 3, 1991, 'Tecnico Medio', 'administracion de empresa', 'los curos vereda 36 casa 03', '0274-2716906', '0416-0723049', 'sao_sao15@hotmail.com', '', '', ''),
(1194, 16443089, 'BO-1473', 'Bombero', ' Martin Leonardo', 'Esteva Varela', 1, 6, 2012, 'Venezolano', 'Masculino', 'SAN ANTONIO TACHIRA ', 6, 7, 1982, 'Tecnico Medio', 'informatica', 'urbanizacion san rafael calle 06 casa 3-21  ejido', '', '0274-2215078', 'MARTIN.esteva@hotmail.com', '', '', ''),
(1195, 20434646, 'BO-1474', 'Bombero', ' Yohan Roberto', 'Fernandez Albornoz', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 13, 2, 1992, 'Bachiller', 'ciencias', 'la pedregosa gran parada casa nº 6', '', '0412-7509133', 'JHOAN_18_1@HOTMAIL.COM', '', '', ''),
(1196, 20047627, 'BO-1475', 'Bombero', ' Karelys Andreina', 'Gaona Peña', 1, 6, 2012, 'Venezolano', 'Masculino', 'CAJA SECA ', 2, 9, 1990, 'Bachiller', '', 'sector la inmaculada vereda 02 diagonal a la fruteria gato', '', '0426-2741623', 'karelysgaona@hotmail.com', '', '', ''),
(1197, 19713113, 'BO-1476', 'Bombero', ' Carlos Isidro', 'Garces Gutierrez', 1, 6, 2012, 'Venezolano', 'Masculino', 'ZULIA', 16, 7, 1990, 'Bachiller', 'ciencias', 'carabobo vereda 43 casa 06 ', '', '0426-3709772', '', '', '', ''),
(1198, 20828014, 'BO-1477', 'Bombero', ' Luis Angel', 'Garcia Garcia', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 23, 6, 1992, 'Bachiller', 'ciencias', 'el chama santa catalina verda las brisas casa s/n', '0426-2923310', '', 'GARCIAANGEL92@HOTMAIL.COM', '', '', ''),
(1199, 19155459, 'BO-1478', 'Bombero', ' Jhaiguer Jonasky', 'Garcia Marquez', 1, 6, 2012, 'Venezolano', 'Masculino', 'MIRANDA ', 7, 8, 1998, 'Tecnico Medio', '', 'el arenal bloque 07 edificio 01 piso 02 apartamento 02-03', '', '0274-2459227', 'REY211915@HOTMAIL.COM', '', '', ''),
(1200, 20097005, 'BO-1479', 'BOMBERO', ' Daniel  De Jesus', 'Gonzalez Figuera', 1, 6, 2012, 'Venezolano', 'Masculino', 'CARACAS', 21, 3, 1986, 'TSU', 'Ciencia del fuego Rescate', 'el arenal parte alta sector los pinos casa s/n', '0424-7732461', '', 'escorpionegro007@hotmail.com', '', 'Rescate', 'Metropolitana'),
(1201, 17456158, 'BO-1480', 'BOMBERO', ' Zulay Coromoto', 'Guerrero Dugarte', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 20, 2, 1986, 'Tecnico Medio', 'MANEJO DE EMERGENCIA', 'loscuros parte media verda 27 casa 02', '0414-7438130', '', 'MIPELUCHE_98@HOTMAIL.COM', '', '', ''),
(1202, 19503108, 'BO-1481', 'BOMBERO', ' Juan Carlos', 'Guerrero Rondon', 1, 6, 2012, 'Venezolano', 'Masculino', 'El Vigía-Mérida', 22, 5, 1990, 'Bachiller', 'ciencias', 'sector 12 de octubre av. 6 calle 14 casa n°14-72', '', '0416-2793111/ 0', 'juomfer19503108@hotmail.com', '', '', '');
INSERT INTO `bombero` (`1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10`, `11`, `12`, `13`, `14`, `15`, `16`, `17`, `18`, `19`, `20`, `21`, `22`, `23`, `24`) VALUES
(1203, 19243867, 'BO-1482', 'BOMBERO', ' Lilian Josefina', 'Guerrero Villalobos', 1, 6, 2012, 'Venezolano', 'Masculino', 'BARINAS', 17, 2, 1991, 'tsu', 'enfermeria', 'barinas estado barinas ciudad bolivia pedraza casa 12-25', '4163723845', '2734146307', 'LILIANGUERREROV@HOTMAIL.COM.', '', '', ''),
(1204, 20011422, 'BO-1483', 'BOMBERO', ' Robert Rafael', 'Gutierrez Altuve', 1, 6, 2012, 'Venezolano', 'Masculino', 'BARINAS', 0, 0, 0, 'Tecnico Medio', '', 'urbanizacion domingo ortiz de paz calle 10 sector 02 ', '', '0273-5523531', '', '', '', ''),
(1205, 20752763, 'BO-1484', 'BOMBERO', ' Ruben Dario', 'Gutierrez Uzcategui', 1, 6, 2012, 'Venezolano', 'Masculino', 'TUCANI', 19, 10, 1992, 'Bachiller', 'ciencias', 'sector el inavi calle 03 tucani casa 3-5', '0416-1704666', '', 'ruben.gutierrez@yahoo.com', '', '', ''),
(1206, 11468334, 'BO-1485', 'BOMBERO', ' Jesus Alberto', 'Herrera Baron', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 0, 0, 0, 'Bachiller', 'ciencias', 'calle chiochinquira calle 7-25 vigia', '', '', '', '', '', ''),
(1207, 19995502, 'BO-1486', 'BOMBERO', ' Liseth Carolina', 'Ibarra Rondon', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 7, 2, 1989, 'Bachiller', 'CIENCIAS', 'san buenaventura calle principal vereda 1 casa nº 03', '0274-2218084', '', 'la_nina_1307@hotmail.com', '', '', ''),
(1208, 19146252, 'BO-1487', 'BOMBERO', ' Luis Alejandro', 'Lacruz Camacho', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 20, 9, 1988, 'Bachiller', 'ciencias', 'ejido calle urdaneta, casa número 13-a', '0424-760-60-15.', '0274-2212762', 'alejo17_7@hotmail.com', '', '', ''),
(1209, 17896157, 'BO-1488', 'BOMBERO', ' Oscar Alberto', 'Lacruz Uzcategui', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 21, 8, 1986, 'Bachiller', 'ciencias', 'ejido urbanizacion santo edubijes calle 9 casa 130', '4263791577', '2742600880', 'yulidmarisol@hotmail.com', 'Activo', 'Servivida', ''),
(1210, 19047220, 'BO-1489', 'BOMBERO', ' Guillermo', 'Marquez Altuve', 1, 6, 2012, 'Venezolano', 'Masculino', 'MOCOCHOPO', 11, 4, 1990, 'Tecnico Medio', 'CIENCIAS agricolaS', 'aldea el ato de estanques via canagua', '0424-7374033', '0274-4174382', 'guillermomarquez-19@hotmail.com', '', 'Servivida', 'Metropolitana'),
(1211, 19048475, 'BO-1490', 'BOMBERO', ' Jose Antonio', 'Marquez Atencio', 1, 6, 2012, 'Venezolano', 'Masculino', 'MARACAIBO', 3, 12, 1986, 'BACHILLER', 'ciencias', 'vía principal sector villa del socorro  casa s/n Tovar via Tovar', '0414-7243929', '0275-4153888', 'CHICHO_15518@HOTMAIL.COM', '', '', ''),
(1212, 19046295, 'BO-1491', 'BOMBERO', ' Liset Carolina', 'Marquez Bustamante', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 30, 9, 1988, ' Bachiller ', 'ciencias', 'sector pan de azúcar, vereda nueva era casa s/n', '0426-7261015', '', 'litmb@hotmail.com', '', 'Rescate', 'Metropolitana'),
(1213, 20395967, 'BO-1492', 'BOMBERO', ' Luizardo Javier', 'Marquez Marquez', 1, 6, 2012, 'Venezolano', 'Masculino', 'TOVAR ', 22, 10, 1991, 'Bachiller', 'ciencias', 'meseta parte baja sabaneta Tovar casa s/n', '0275-9880985', '0424-7145029', 'lisardojmarquez@hotmail.com', '', '', ''),
(1214, 20397899, 'BO-1493', 'BOMBERO', ' Richard Antonio', 'Marquez Nava', 1, 6, 2012, 'Venezolano', 'Masculino', 'TOVAR', 12, 2, 1991, 'Bachiller', 'ciencias', 'villa del socorro via principal Tovar santa cruz', '', '', '', '', '', ''),
(1215, 15694305, 'BO-1494', 'BOMBERO', ' Mario Enrrique', 'Marquez Pernia', 1, 6, 2012, 'Venezolano', 'Masculino', 'sta cruz de mora MERIDA', 22, 12, 1982, 'Bachiller', 'CIENCIAS', 'aldea san pedro santa cruz de mora estado Mérida casa s/n', '4167964041', '', 'mario_199091@hotmail.com', 'Activo', 'Incendio', 'Mocoties'),
(1216, 14014608, 'BO-1495', 'BOMBERO', ' Eddy Johnson', 'Marquez Piña', 1, 6, 2012, 'Venezolano', 'Masculino', 'TRUJILLO', 17, 2, 1979, 'Tecnico Medio', '', 'la ceibita trujillo', '0271-4323401 ', '0416-4097119', '', '', '', ''),
(1217, 20217053, 'BO-1496', 'BOMBERO', ' Yohanna Coromoto', 'Marquez Zerpa', 1, 6, 2012, 'Venezolano', 'Femenino', 'TOVAR', 29, 6, 1989, 'Tecnico Medio', 'Administracion Policial ', 'santa cruz de mora urbanizacion maria antonieta rossy casa 136', '0426-3789434', '', 'YO.VANA_98@HOTMAIL.COM', 'Activo', 'Rescate', 'Mocoties'),
(1218, 19881268, 'BO-1497', 'BOMBERO', ' Hansel Jose', 'Mejias Camacho', 1, 6, 2012, 'Venezolano', 'Masculino', 'BARINAS', 18, 9, 1991, 'Tecnico Medio', 'industrial mencion bomber', 'la victori acalle la candelaria barinas casa 7-40', '4267772280', '0273-5526174', 'HANSELMJI_@HOTMAIL.COM', '', '', ''),
(1219, 19096255, 'BO-1498', 'BOMBERO', ' Antonio Jose', 'Menco Santamaria', 1, 6, 2012, 'Venezolano', 'Masculino', 'vigia ', 2, 8, 1988, 'BACHILLER', 'ciencias', 'calle02 sector orlando parra casa 09-40 zulia', '', '0424-7017225', 'ANTONIO_MENCO_17 @HOTMAIL.COM', '', '', ''),
(1220, 20217721, 'BO-1500', 'BOMBERO', ' Rober Gregorio', 'Mendez Dugarte', 1, 6, 2012, 'Venezolano', 'Masculino', 'SANTA CRUZ', 30, 11, 1990, 'BACHILLER', 'ciencias', 'santa cruz avenida ayacucho con calle mocoties casa 34', '2754111255', '0426-8261129', 'robermendez88@gmail.com', '', '', ''),
(1221, 20217739, 'BO-1501', 'BOMBERO', ' Carlos Julio', 'Mogollon Contreras', 1, 6, 2012, 'Venezolano', 'Masculino', 'timotes', 17, 11, 1986, 'Tecnico Medio', 'maquinas y herramientas', 'la vega san antonio sector la playa casa 12', '4247702467', '0274-2450663', 'carl_mogo_18@hotmIL.COM', '', '', ''),
(1222, 18056630, 'BO-1502', 'BOMBERO', ' Victor Jose', 'Molina Rondon', 1, 6, 2012, 'Venezolano', 'Masculino', 'vigia', 17, 11, 1986, 'Bachiller', 'ciencias', 'caño seco avenida 05 casa 2 el vigia ', '4148154816', '2754114309', 'thechakas67@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(1223, 20829251, 'BO-1503', 'BOMBERO', ' Josfer Alejandro', 'Montilva Chacon', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 29, 4, 1991, 'Bachiller', 'ciencias', 'urbanizacion el pilar bloque 13 edificio 02 apartamento 1-01', '0424-7434453', '0274-6587265', 'josfer29491@hotmail.com', '', '', ''),
(1224, 20831508, 'BO-1504', 'BOMBERO', ' Angel Gabriel', 'Mora Camacho', 1, 6, 2012, 'Venezolano', 'Masculino', 'VIGIA', 2, 2, 1992, 'Bachiller', 'CIENCIAS', 'quebrada arriba clle las piedras casa 0-23 Tovar', '', '0426-9763769', 'gabrielmora_0202@hotmail.com', '', '', ''),
(1225, 19593090, 'BO-1505', 'BOMBERO', ' Francy Carolina', 'Morales Vielma', 1, 6, 2012, 'Venezolano', 'Femenino', 'Merida', 6, 1, 1988, 'Tecnico Medio', 'TURISMO', 'el salado alto vega los benites casa sin numero', '4264724805', '4147482491', 'francysvielma@gmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1226, 23716095, 'BO-1506', 'BOMBERO', ' Antoni Jose', 'Moreno Paredes', 1, 6, 2012, 'Venezolano', 'Masculino', 'VIGIA', 12, 6, 1992, 'Bachiller', 'CIENCIAS', 'sector union calle 07 casa s/n tucani ', '0426-6282152', '0275-2684874', 'ANTONIMORENO_110 @HOTMAIL.COM', 'Activo', 'incendio', 'Panamericana'),
(1227, 12778312, 'BO-1507', 'Distinguido', ' Yorman', 'Moreno Peña', 1, 6, 2012, 'Venezolano', 'Masculino', 'SAN RAFAEL DEL CHAMA', 17, 10, 1976, 'Licenciado', 'historia', 'parroquia andres eloy blanco municipio mirandasector tifafa casa s/n munici', '0416-3797424', '', 'SBMYORMAN@gmail.com', 'Activo', 'Rescate', 'Paramo'),
(1228, 11677145, 'BO-1508', 'BOMBERO', ' Ana Liseth', 'Moreno Prada', 1, 6, 2012, 'Venezolano', 'Femenino', 'MERIDA', 10, 1, 1974, 'Licenciado', 'arquirecto', 'las gonzales residencias villa libertad torre n a 1 a 2 piso 1  apartamento', '0424-7716744', '0274-8085908', 'ARQUILIS74@HOTMAIL.COM', '', '', ''),
(1229, 23722145, 'BO-1509', 'BOMBERO', ' Luanyili Isabel', 'Morillo Morillo', 1, 6, 2012, 'Venezolano', 'Femenino', 'MERIDA', 20, 11, 1991, 'BACHILLER', 'CIENCIAS', 'av los proceres sector san isidro casa 0-31', '0426-7272997', '', 'LULU_MORILLO@HOTMAIL.COM', '', '', ''),
(1230, 20749927, 'BO-1510', 'BOMBERO', ' Carlos Alfredo', 'Nava Moreno', 1, 6, 2012, 'Venezolano', 'Masculino', '', 14, 11, 1990, 'Bachiller', 'ciencias', 'av tulio febres cordero', '', '0426-1482888', 'carlosnava1991@hotmail.com', '', '', ''),
(1231, 20433511, 'BO-1512', 'BOMBERO', ' Yorman Daniel', 'Parra Rodriguez', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 21, 12, 1992, 'BACHILLER', 'ciencias', 'el chana ', '', '', '', '', '', ''),
(1232, 19144654, 'BO-1513', 'BOMBERO', ' Estefani', 'Peña Carrero', 1, 6, 2012, 'Venezolano', 'Femenino', 'MERIDA', 2, 5, 1989, 'BACHILLER', 'ciencias', 'centenario calle el molino casa 2- a', '4140800383', '', 'fanny_0502@hotmail.com', '', '', ''),
(1233, 19421695, 'BO-1514', 'BOMBERO', ' Lorena', 'Peña Fernandez', 1, 6, 2012, 'Venezolano', 'Femenino', 'MERIDA', 25, 12, 1986, 'BACHILLER', 'ciencias', 'urb carabobo, vrda 21 casa 16', '0426-1615113', '', 'LORENA_152747@HOTMAIL.COM', 'Activo', 'Rescate', 'Metropolitana'),
(1234, 19901089, 'BO-1515', 'BOMBERO', ' Douglas Alonso', 'Peña Marquez', 1, 6, 2012, 'Venezolano', 'Femenino', 'vigia', 28, 11, 1991, 'BACHILLER', 'ciencias', 'sector portachuelo calle2 casa 0-7', '4161791735', '2744149361', 'dani_y12@hotmail.com', '', '', ''),
(1235, 21404837, 'BO-1516', 'Bombero', ' Sonia Carolina', 'Peña Pabon', 1, 6, 2012, 'Venezolano', 'Femenino', 'TOVAR', 10, 2, 1992, 'BACHILLER', 'ciencias', 'avenida universidad vega la isla pasaje 03 casa s/jn', '4264789421', '', 'sgpte_13@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(1236, 20141621, 'BO-1517', 'BOMBERO', ' Yosman Daniel', 'Peña Peña', 1, 6, 2012, 'Venezolano', 'Masculino', 'el vigia', 7, 9, 1990, 'BACHILLER', 'ciencias', 'la blanca sector caño seco ii vereda 19 casa 02', '4267728353', '0274-7904481', 'yosman_0000@hotmail.com', 'Activo', 'Servivida', 'Panamericana'),
(1237, 22657167, 'BO-1519', 'BOMBERO', ' Wilian Yoan', 'Pernia Rivas', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA ', 23, 4, 1992, 'bachiller', 'HUMANIDADES', 'los curos parte media sector f  bloque 4 apartamento 02-03 piso 2', '0426-9586392', '0274-2712825', 'WILIAN-PERNIA@HOTMAIL.COM', 'Activo', 'Incendio', 'Metropolitana'),
(1238, 19592986, 'BO-1520', 'BOMBERO', ' Hedibert Jose', 'Pernia Salcedo', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 3, 9, 1990, 'bachiller', 'ciencias', 'los curos parte alta vereda 28 casa n-01', '', '', 'hedibert_0390@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1239, 20395298, 'BO-1521', 'BOMBERO', ' Clever Oneiber', 'Pernia Zambrano', 1, 6, 2012, 'Venezolano', 'Masculino', 'TOVAR', 3, 3, 1982, 'Tecnico Medio', 'mercadeo', 'el amparo, sector la cañada vía paramo de mariño, Tovar    ', '0426-2796602 ', '2759891280', 'cleverpernia@hotmail.com', '', '', ''),
(1240, 20218656, 'BO-1522', 'BOMBERO', ' Jose Gabriel', 'Prada Mancilla', 1, 6, 2012, 'Venezolano', 'Masculino', 'TOVAR', 10, 6, 1991, 'Tecnico Medio', 'mmercadeo', 'paramo de mariño Tovar casa s/n', '0426-9835230', '0275-2699683', 'pradamancilla@hotmail.com', '', 'Incendio', 'Mocoties'),
(1241, 20394709, 'BO-1523', 'BOMBERO', ' Javier Jesus', 'Ramirez Molina', 1, 6, 2012, 'Venezolano', 'Masculino', 'TOVAR', 6, 6, 1992, 'Bachiller', 'ciencias', 'calle el trompillo sectcasa alberto carnevali casa s/n', '0416-5762864', '0275-8731632', 'JAVIER.EL_JEFE.@HOTMAIL.COM', 'Activo', 'Rescate', 'Mocoties'),
(1242, 12115089, 'BO-1524', 'Sgto/2do', ' Franklin', 'Ramirez Sanchez', 1, 6, 2012, 'Venezolano', 'Masculino', 'caracas ', 24, 11, 1974, 'Licenciado', 'educacion', 'barrio colinas de san jose carrera 1 calle 0 casa 0-60 san juan tachira', '4160481701', '0277-4110304', 'rescatefranklin@hotmail.com', 'Activo', 'Rescate', 'Panamericana'),
(1243, 19593538, 'BO-1525', 'BOMBERO', ' Alexander Javier', 'Rendon Sosa', 1, 6, 2012, 'Venezolano', 'Masculino', 'merida', 17, 9, 1989, 'Bachiller', 'ciencias', 'urbanizacion osuna rodrigue vereda 30 casa 04-01 los curos', '0274-6584875', '0416-1161820', 'alex_17_267@hotmail.com', '', '', ''),
(1244, 24551726, 'BO-1526', 'BOMBERO', ' Johans Antony', 'Rincon Sanchez', 1, 6, 2012, 'Venezolano', 'Masculino', 'vigia', 5, 11, 1990, 'Bachiller', 'mercadeo', 'el moralito kilometro 30 caño el padre estado zulia', '0416-7212813', '', 'elqlaspartes@hotmail.com', 'Activo', 'Incendio', 'Panamericana'),
(1245, 13098055, 'BO-1527', 'BOMBERO', ' Luis Alberto', 'Rivas Calderon', 1, 6, 2012, 'Venezolano', 'Masculino', 'merida', 7, 11, 1978, 'Bachiller', 'ciencias', 'urbanizacion carabobo vereda 03 casa 09 ', '0274-2665084', '0274-2665594', 'LUISRIVAS_357@HOTMAILCOM', '', '', ''),
(1246, 18397818, 'BO-1528', 'BOMBERO', ' Jose Luis', 'Rodriguez Saavedra', 1, 6, 2012, 'Venezolano', 'Masculino', 'VIGIA', 8, 11, 1988, 'Licenciado', '', 'urbanizacion bubuqui bloque 08 apartamento 03-01', '', '0275-8819259', 'JOSELUISRS88@HOTMAIL.COM', '', '', ''),
(1247, 20396758, 'BO-1529', 'BOMBERO', ' Jose Ramon', 'Rojas Rosales', 1, 6, 2012, 'Venezolano', 'Masculino', 'CANAGUA', 31, 8, 1991, 'Bachiller', 'ciencias', 'sector sabaneta Tovar calle paparoni nº 105', '', '', 'joseramon_19_31@hotmail.com', '', '', ''),
(1248, 23493561, 'BO-1530', 'BOMBERO', ' Ana Gabriela', 'Rondon Molina', 1, 6, 2012, 'Venezolano', 'Femenino', 'TOVAR', 24, 6, 1992, 'Bachiller', 'ciencias', 'san felipe parroquia mesa de las palmas casa 125', '4147416383', '2755142411', 'anagabrielarondonm@gmail.com', 'Activo', 'Rescate', 'Mocoties'),
(1249, 18459855, 'BO-1531', 'BOMBERO', ' Alberto Gregorio', 'Rosillo Moreno', 1, 6, 2012, 'Venezolano', 'Masculino', 'caracas ', 7, 1, 1989, 'Bachiller', '', 'barrio 23 de enero callejon coromoto avenida gargera casa 14-39 barinas', '4266706429', '0273-55520641', '', '', '', ''),
(1250, 20394141, 'BO-1532', 'BOMBERO', ' Robison Daniel', 'Salon Andrade', 1, 6, 2012, 'Venezolano', 'Masculino', 'santa cruz de mora', 10, 12, 1992, 'Bachiller', 'ciencias', 'aldea cuchilla de huacas santa cruz casa s/n', '4126610299', '', 'andrade@hotmail.com', '', '', ''),
(1251, 20397675, 'BO-1533', 'BOMBERO', ' Jorge Luis', 'Sanchez Molina', 1, 6, 2012, 'Venezolano', 'Masculino', 'TOVAR', 27, 7, 1990, 'Bachiller', 'ciencias', 'la macana sector los llanitos santa cruz de mora casa s/n', '0416-7770737', '0275-9953905', 'sanchez_90_20@hotmail.com', 'Activo', 'Servivida', 'Mocoties'),
(1252, 20601777, 'BO-1534', 'BOMBERO', ' Guillermo Antonio', 'Sosa Camacho', 1, 6, 2012, 'Venezolano', 'Masculino', 'BARINAS', 6, 10, 1991, 'Bachiller', 'ciencias', 'la parroquia zumba norte casa 01-01', '0426-1788943', '0274-2711774', 'GUILLERMO.220@HOTMAIL.S', '', '', ''),
(1253, 20831303, 'BO-1535', 'BOMBERO', ' Ruben Dario', 'Sosa Marquez', 1, 6, 2012, 'Venezolano', 'Masculino', 'mucutuy', 11, 2, 1991, 'Bachiller', 'ciencias', 'mucutuy calle principal bolivar casa s/n', '0416-7718468', '2758087549', 'rubendario-19@hotmail.com', '', 'Servivida', 'Mocoties'),
(1254, 18619398, 'BO-1536', 'BOMBERO', ' Erminda', 'Sosa Peña', 1, 6, 2012, 'Venezolano', 'Femenino', 'MERIDA', 10, 11, 1986, 'TSU ', 'manejo de Emergencia', 'avenida benedicto monsalve call principal casa 20 sector bella vista', '0416-2480730', '0274-7903286', 'MINDASOSA_10@HOTMAIL.COM', 'Activo', 'Servivida', 'Metropolitana'),
(1255, 16604744, 'BO-1537', 'BOMBERO', ' Jose Melanio', 'Suarez Guillen', 1, 6, 2012, 'Venezolano', 'Masculino', 'SANTA CRUZ', 18, 5, 1982, 'Bachiller', 'ciencias', 'santa cruz  urbanismo paiba estapa calle principal edificio 05 apartamento ', '0416-0998509', '0275-9897235', 'jose-melanio-1982@hotmail.com', '', 'Servivida', 'Mocoties'),
(1256, 18636515, 'BO-1538', 'BOMBERO', ' Alexander Ramon', 'Urbina Marquez', 1, 6, 2012, 'Venezolano', 'Masculino', 'VIGIA', 11, 8, 1989, 'Bachiller', 'ciencias', 'mucujepe calle jabon calle principal avenida 03 casa s/n', '', '4164922560', '', '', '', ''),
(1257, 20572440, 'BO-1539', 'BOMBERO', ' Jesus Alfredo', 'Urbina Marquez', 1, 6, 2012, 'Venezolano', 'Masculino', 'VIGIA', 9, 8, 1992, 'Bachiller', 'ciencias', 'mucujepe caño jabon calle principal avenida 03 casa s/n', '', '0426-8223890', '', 'Activo', 'Incendio', 'Panamericana'),
(1258, 20847946, 'BO-1540', 'BOMBERO', ' Emmeline Yosimar', 'Uzcategui Ibarra', 1, 6, 2012, 'Venezolano', 'Femenino', 'MERIDA', 10, 9, 1991, 'Bachiller', 'ciencias', 'ejido san buenaventura calle principal casa s/n', '0416-8719570', '', 'ibarrayosimar@hotmail.com', 'Activo', 'Incendio', 'Metropolitana'),
(1259, 15755378, 'BO-1541', 'BOMBERO', ' Franklin', 'Uzcategui Monsalve', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 27, 8, 1983, 'Bachiller', 'ciencias', 'el  chama santa catalina calle principal la estillera casa s/n metros abajo', '4161316914', '0274-4147065', 'franklinuzcategui_@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1260, 19593015, 'BO-1542', 'BOMBERO', ' Alexis Eduardo', 'Uzcategui Puentes', 1, 6, 2012, 'Venezolano', 'Masculino', '', 4, 4, 1989, '', '', '', '', '', '', '', '', ''),
(1261, 15032635, 'BO-1543', 'BOMBERO', ' Leonardo Alexis', 'Vega Altuve', 1, 6, 2012, 'Venezolano', 'Masculino', 'TOVAR', 27, 11, 1980, 'BACHILLER', 'ciencias', 'chama via principal calle eduvigues casa 13 ', '', '0274-2665121', 'LEOVEGA 23_01@HOTMAIL.COM', '', '', ''),
(1262, 20198780, 'BO-1544', 'BOMBERO', ' Mayra Yackelin', 'Villarreal Araujo', 1, 6, 2012, 'Venezolano', 'Femenino', 'merida', 2, 12, 1989, 'BACHILLER', 'ciencias', 'jose adelmo guitierrez parte baja casa 77', '0274-7894457', '0416-5301783', 'maira.yackelin@gmail.com', '', 'Servivida', 'Metropolitana'),
(1263, 17323149, 'BO-1545', 'BOMBERO', ' Luis Eduardo', 'Zambrano Altuve', 1, 6, 2012, 'Venezolano', 'Masculino', 'TOVAR', 21, 1, 1986, 'BACHILLER', 'ciencias', 'santa barbara del zulia calle 9 avenida kilometro 2 casa s/n', '0426-9272515', '', 'luis.zambrano86@yahoo.es', '', '', ''),
(1264, 18965115, 'BO-1546', 'BOMBERO', ' Jesus Alfonso', 'Zambrano Rojas', 1, 6, 2012, 'Venezolano', 'Masculino', 'MERIDA', 26, 8, 1985, 'BACHILLER', 'ciencias', 'j-j-osuna vereda 27 casa 09 parte alta ', '0416-8558849', '', 'jesusalfonso_2021@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1265, 17322849, 'BO-1547', 'BOMBERO', ' Yohanna Alejandra', 'Zambrano Vega', 1, 6, 2012, 'Venezolano', 'Femenino', 'santa cruz', 4, 7, 1985, 'BACHILLER', 'ciencias', 'los llanitos de tabay sector vista alegre casa 01-07', '0414-9719480', '', 'yyohanitaz19@hotmail.com', '', '', ''),
(1266, 23721113, 'BO-1548', 'BOMBERO', ' Jackson Daniel', 'Zerpa Rojas', 1, 6, 2012, 'Venezolano', 'Masculino', 'caracas', 2, 6, 1994, 'Tecnico Medio', 'medicina de Emergencia', 'lagunillas sector el molina calle jose varela casa s/n', '', '0274-6585530', 'carljack_1994@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1267, 20353721, 'BO-1554', 'BOMBERO', ' Anderson Renne', 'Correa Maldonado', 1, 6, 2012, 'Venezolano', 'Masculino', 'Arapuey', 10, 1, 1991, 'Bachiller', 'ciencias', 'arapuey sector inrevi via palmita casa n 17', '0414-6558069', '0271-4325934', 'bombe>andor_10@hotmail.com', '', '', ''),
(1268, 21183283, 'BO-1557', 'BOMBERO', ' Charlie Robinson', 'Davila Vicentino', 1, 10, 2012, 'Venezolano', 'Masculino', 'Mérida edo. Mérida', 5, 5, 1993, 'Tecnico Medio', '', 'el llanito la otra banda, calle los caiguires', '0416 – 5965984 ', '', 'camaguini_41@hotmail.com', '', '', ''),
(1269, 12493609, 'BO-1559', 'BOMBERO', ' Jose Alberto', 'Diaz Meza', 1, 10, 2012, 'Venezolano', 'Masculino', 'SANTA BARBARA ZULIA', 24, 5, 1973, 'Bachiller', 'INTEGRAL', 'avenida 13 casa 02-155 sector el paraiso santa barbara zulia', '', '0424-7538036', '', '', '', ''),
(1270, 15516645, 'BO-1560', 'BOMBERO', ' Leonardo Jose', 'Diaz Nieves', 1, 10, 2012, 'Venezolano', 'Masculino', 'merida', 12, 5, 1981, 'Tecnico Medio', 'administracion policial', 'urb santa monica b-04 apto 02-04', '0426-7860734', '', 'diaznieves@hotmail.es', 'Activo', '', ''),
(1271, 21182285, 'BO-1563', 'BOMBERO', ' Darwin Alexander', 'Ibarra Marquez', 1, 10, 2012, 'Venezolano', 'Masculino', 'MERIDA', 18, 11, 1993, 'Tecnico Medio', 'medicina de Emergencia', 'urb. francisco javier angulo, calle 13 casa nro. 102. san juan de lagunilla', '0426-7767746', '0274 – 2667157', 'darwinibarramarquez@hotmail.com', 'Activo', 'Rescate', 'Metropolitana'),
(1272, 10717972, 'BO-1565', 'Cabo/2do', ' Nelson Enrique', 'Marquez Caceres', 1, 10, 2012, 'Venezolano', 'Masculino', 'MERIDA', 3, 1, 1971, 'Bachiller', 'ciencias', 'urbanizacion carabobo vereda 35 casa 07 ', '', '0416-1159819', 'nemcpqek@hotmail.com', '', '', ''),
(1273, 16166535, 'BO-1566', 'BOMBERO', ' Angel Alberto', 'Morales Alvarado', 1, 10, 2012, 'Venezolano', 'Masculino', 'SANTA BARBARA ZULIA', 11, 10, 1983, 'Bachiller', 'ciencias', 'avenida 13 calle el praiso casa 02-165 sector el chupurun santa  barbara de', '', '0414-0822467', '', '', 'Rescate', 'Metropolitana'),
(1274, 20198318, 'BO-1567', 'BOMBERO', ' Samuel Nabor', 'Peña Sequera', 1, 10, 2012, 'Venezolano', 'Masculino', 'MERIDA', 9, 12, 1990, 'BACHILLER', '', 'el chama Mérida', '0426-3271998', '0274-2665438', 'SAMUELNABOR@HOTMAIL.COM', '', '', ''),
(1275, 22929998, 'BO-1568', 'BOMBERO', ' Jose Vicente', 'Rincon Mendez', 1, 10, 2012, 'Venezolano', 'Masculino', 'TOVAR', 14, 8, 1994, 'Tecnico Medio', 'medicina de Emergencia', 'barrio santa elena calle principal casa e-20 Tovar', '0426-2803852', '0275-8734216', 'bomrincon@hotmail.com ', 'Activo', 'Servivida', 'Mocoties'),
(1276, 21330718, 'BO-1569', 'BOMBERO', ' Jean Carlos', 'Romero Contreras', 1, 10, 2012, 'Venezolano', 'Masculino', 'TOVAR', 5, 9, 1993, 'Tecnico Medio', 'informatica', 'sabaneta sector quebrada blanca calle principal casa 0-76', '0416-7741671', '0275-2687404', 'jyk_03amor@hotmail.com', '', 'Incendio', 'Mocoties'),
(1277, 13011329, 'BO-1571', 'Sgto/2do', ' Ludovick Gustavo', 'Silva Muñoz', 1, 10, 2012, 'Venezolano', 'Masculino', 'VIGIA', 16, 5, 1976, 'Bachiller', 'ciencias', 'avenida 23 entre calle 12 sector la bandera casa 70-62 santa barbara', '', '0426-8742314', 'ludovick16@hotmail.com', '', '', ''),
(1278, 14473072, 'BO-1572', 'BOMBERO', ' David', 'Suarez Zambrano', 1, 10, 2012, 'Venezolano', 'Masculino', 'SANTA BARBARA ZULIA', 10, 4, 1980, 'Bachiller', 'ciencias', 'sector 18 de octubre avenida 06 casa 09-158 zulia', '4247452598', '2754115646', 'elbombero_31@hotmail.com', 'Activo', 'Servivida', 'paramo'),
(1279, 16124433, 'BO-1573', 'BOMBERO', ' Christian', 'Valencia Duque', 1, 10, 2012, 'Venezolano', 'Masculino', 'caracas', 1, 12, 1981, 'Bachiller', 'ciencias', 'avenida 19 numero 02-60 barrio santa barbara rubio  tachira', '0424-7209341', '0276-7621269', 'christianvalencia05@hotmail.com', '', 'Rescate', ''),
(1280, 20167766, 'BO-1575', 'BOMBERO', ' Simon Emilio', 'Zarza Badillo', 1, 10, 2012, 'Venezolano', 'Masculino', 'SANTA BARBARA ZULIA', 10, 2, 1989, 'Bachiller', 'ciencias', 'av 1g sector chamarreta casa 12a-90', '4262688822', '2755163815', 'SIMONZARZA@HOTMAIL.COM', '', 'Servivida', 'Barinas'),
(1281, 16201028, 'BO-1562', 'BOMBERO', ' Gabriel Alejandro', 'Guillen', 1, 10, 2012, 'Venezolano', 'Masculino', 'MERIDA', 11, 12, 1984, 'Ingeniero', 'electronica', 'avenida las Américas residencias el parque torre f piso 06 apartamento 6-2', '4161155153', '0274-4167066', 'gabriel_aguillen@hotmail.com', 'Activo', 'Servivida', 'Metropolitana'),
(1282, 12352836, 'BO-1574', 'BOMBERO', ' Jose Gregorio', 'Viloria  Contreras', 1, 10, 2012, 'Venezolano', 'Masculino', 'MERIDA ', 20, 9, 1975, '', '', 'lagunillas llano seco calle principal 13,114', '', '0416-2079063', '', '', '', ''),
(1283, 23723861, 'BO-1576', 'BOMBERO', ' Kevin Eduardo', 'Peña Montilla', 1, 10, 2012, 'Venezolano', 'Masculino', 'MERIDA', 23, 11, 1994, 'BACHILLER', '', '', '0426-3789388', '', '', '', '', ''),
(1284, 17678745, 'BO-1577', 'BOMBERO', ' Hector Jose', 'Medina Cardenas', 1, 11, 2012, 'Venezolano', 'Masculino', 'TARIBA', 13, 6, 1988, 'Licenciado', 'EDUCACION INTEGRAL', 'carrera 5 casa nº 9-60 colon tachira', '0416-9713212', '0277-2913505', 'HECTORJOSEMC13@GMAIL.COM', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaciones`
--

CREATE TABLE IF NOT EXISTS `estaciones` (
  `CodEst` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Código de la estación',
  `NombEst` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de la estación',
  `Horas` int(2) unsigned NOT NULL COMMENT 'Cantidad de horas que trabaja',
  `Inicio` time NOT NULL COMMENT 'hora de entrada de trabajo',
  `Norte` varchar(14) NOT NULL COMMENT 'Ubicacion Georeferencial Norte',
  `Oeste` varchar(14) NOT NULL COMMENT 'Ubicación Georeferencial Oeste',
  `Elevacion` varchar(8) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Ubicacion Georeferencial Elevacipon',
  `Turno` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Estaciones de la DPP Bomberos Mérida';

--
-- Volcado de datos para la tabla `estaciones`
--

INSERT INTO `estaciones` (`CodEst`, `NombEst`, `Horas`, `Inicio`, `Norte`, `Oeste`, `Elevacion`, `Turno`) VALUES
('01', 'Cuartel General', 24, '07:00:00', '00Â°00''00,00''''', '00Â°00''00,00''''', '000000', ''),
('02', 'Chorros de milla', 12, '07:00:00', '04Â°58''86,89''''', '10Â°75''89,98''''', '123456', ''),
('03', 'EstaciÃ³n principal de Ejido', 12, '07:00:00', '05Â°11''48,39''''', '10Â°75''89,98''''', '157789', ''),
('04', 'EstaciÃ³n sur', 12, '07:00:00', '04Â°58''86,89''''', '04Â°58''86,89''''', '157789', ''),
('05', 'Estacion la mesa', 18, '08:00:00', '05Â°11''48,39''''', '04Â°58''86,89''''', '157789', ''),
('06', 'EstaciÃ³n Tovar', 12, '07:00:00', '05Â°11''48,39''''', '10Â°75''89,98''''', '157789', ''),
('09', 'Estacion la mesas', 12, '07:00:00', '05Â°11''48,39''''', '04Â°58''86,89''''', '157789', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE IF NOT EXISTS `sesion` (
  `id` int(11) NOT NULL,
  `cedula` int(8) unsigned zerofill NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `username` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` char(128) COLLATE utf8_spanish_ci NOT NULL,
  `nivel` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `aprobacion` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `estacion` int(2) unsigned zerofill NOT NULL,
  `seccion` varchar(1) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sesion`
--

INSERT INTO `sesion` (`id`, `cedula`, `Nombre`, `username`, `email`, `password`, `nivel`, `aprobacion`, `estacion`, `seccion`) VALUES
(1, 20709289, 'Jorge Castellano', 'jorgcastellano', 'jorgecm14@gmail.com', 'qwe', '3', 'S', 01, 'A'),
(2, 19996312, 'Yisbeli Cano', 'yisbeli', 'yisbelikarin@gmail.com', 'qwe', '3', 'S', 01, 'A'),
(3, 21417486, 'Jitzon Colmenares', 'jitzon', 'jitzon.jose@gmail.com', 'Holas2', '1', 'S', 06, 'A'),
(5, 21417485, 'Pedro Castellano', 'pedro', 'jesus@gmail.com', 'mnbv', '0', 'N', 01, 'A'),
(6, 23497251, 'Liseth Cano', 'liz', 'liz.smuak@gmail.com', 'Hola123', '2', 'S', 02, 'A'),
(7, 21417484, 'Jose Colmenares', 'jitzon', 'jose@gmail.com', 'qweqwe', '0', 'N', 06, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talento_humano`
--

CREATE TABLE IF NOT EXISTS `talento_humano` (
  `CodBomb` varchar(5) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Código del bombero (Carnet)',
  `CedBomb` varchar(8) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Cédula del bombero',
  `Nacionalidad` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'V' COMMENT 'Nacionalidad del funcionario',
  `NomBomb` varchar(30) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del bombero',
  `Nom2Bomb` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Segundo Nombre del bombero',
  `ApeBomb` varchar(30) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Apellido del bombero',
  `Ape2Bomb` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Segundo Nombre del bombero',
  `Movil` varchar(12) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Telefono',
  `Fijo` varchar(12) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Telefono fijo del funcionario',
  `Email` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Correo Electrónico',
  `CargoBomb` varchar(25) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Cargo que desempeña',
  `Jerarquia` varchar(25) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Jerarquia que tiene el bombero',
  `Administrativo` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N' COMMENT 'Campo especifica si pertenece parte administrativa de la institucion',
  `Division` varchar(16) COLLATE utf8_spanish_ci NOT NULL COMMENT 'División a la que pertenece',
  `Brigada` varchar(11) COLLATE utf8_spanish_ci DEFAULT 'No' COMMENT 'Brigada de rescate de atención inmediata',
  `IngresoBomb` date NOT NULL COMMENT 'Fecha de ingreso a los bomberos',
  `Estacion` varchar(2) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Código de la estación',
  `Seccion` varchar(1) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Seccion a la que pertenece',
  `Status` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo' COMMENT 'Status en que se encuentra el funcionario',
  `Observacion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Registro de talento humano';

--
-- Volcado de datos para la tabla `talento_humano`
--

INSERT INTO `talento_humano` (`CodBomb`, `CedBomb`, `Nacionalidad`, `NomBomb`, `Nom2Bomb`, `ApeBomb`, `Ape2Bomb`, `Movil`, `Fijo`, `Email`, `CargoBomb`, `Jerarquia`, `Administrativo`, `Division`, `Brigada`, `IngresoBomb`, `Estacion`, `Seccion`, `Status`, `Observacion`) VALUES
('00007', '15755511', 'V', 'Antonito', 'Jose', 'Hernandez', 'Blanco', '0426-2213770', '0274-5114025', 'antonio_jose_h@hotmail.com', 'Comandante', '7', 'N', 'Pre-hospitalario', 'Forestal', '2014-06-03', '06', 'A', 'Activo', NULL),
('00004', '19996312', 'V', 'Yisbeli', 'Karin', 'Cano', 'Lamus', '0426-1604184', '0426-1604184', 'yisbelikarin@gmail.com', 'Jefe de Comunicaciones', '3', 'N', 'Rescate', '', '2000-01-01', '01', 'A', 'Activo', NULL),
('00001', '20709289', 'V', 'Jorge', 'Agustin', 'Castellano', 'Mantilla', '0416-1379717', '0274-8875268', 'jorgecm14@gmail.com', 'Primer Director', '1', 'N', 'Rescate', 'No', '2000-01-01', '01', 'A', 'Activo', 'Array'),
('00011', '21417484', 'V', 'Jose', 'Agustin', 'Colmenares', 'Araque', '0414-1234567', '0274-1234567', 'jose@gmail.com', 'cabo', '13', 'N', 'Rescate', '', '0000-00-00', '06', 'A', 'Activo', NULL),
('00010', '21417485', 'V', 'Pedro', 'Jesus', 'Castellano', 'Cano', '0416-1763956', '0276-3947820', 'jesus@gmail.com', 'cabo', '11', 'N', 'Pre-hospitalario', '', '0000-00-00', '06', 'A', 'Activo', NULL),
('00002', '21417486', 'V', 'Jitzon', 'Jose', 'Colmenares', 'Pulido', '0416-1379717', '0275-5896418', 'jitzon.jose@gmail.com', 'Jefe de Comunicaciones', '7', 'N', 'Incendio', 'No', '2000-01-01', '06', 'A', 'Activo', 'Array'),
('00003', '23497251', 'V', 'Liseth', 'Dayana', 'Cano', 'Suarez', '0416-0769195', '0274-8875268', 'liz.smuak@gmail.com', 'bomberita', '7', 'N', 'Rescate', 'No', '2000-01-01', '01', 'A', 'Activo', 'Array');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_automotoras`
--

CREATE TABLE IF NOT EXISTS `unidades_automotoras` (
  `CodAuto` varchar(5) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Código automotor de la unidad (código interno)',
  `CodTransp` varchar(5) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Código de transporte de las unidades (código adquerido al momento de ser dotado)',
  `Placa` varchar(6) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Placa de la unidad',
  `Seudonimo` varchar(15) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Seudónimo de la unidad',
  `CaractMec` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Características mecánicas de la unidad',
  `CodEst` varchar(2) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Código de la estación a la cual pertenece',
  `Status` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Activo' COMMENT 'Código del estado de la unidad',
  `Observacion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Registro de las unidades automotoras de la DPP Bomberos Mérida';

--
-- Volcado de datos para la tabla `unidades_automotoras`
--

INSERT INTO `unidades_automotoras` (`CodAuto`, `CodTransp`, `Placa`, `Seudonimo`, `CaractMec`, `CodEst`, `Status`, `Observacion`) VALUES
('00001', '00001', 'T8FT62', 'Carro Bomba 000', 'Prueba de modificaciÃ³n', '01', '', NULL),
('00013', '00013', 'ADS32D', 'Carro Bomba 004', 'buenas', '01', 'Activo', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD PRIMARY KEY (`CodEst`),
  ADD UNIQUE KEY `NombEst` (`NombEst`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `talento_humano`
--
ALTER TABLE `talento_humano`
  ADD PRIMARY KEY (`CedBomb`),
  ADD UNIQUE KEY `Ced_bomb` (`CedBomb`,`Movil`,`Email`),
  ADD KEY `Tipo` (`Estacion`),
  ADD KEY `Cod_est` (`Estacion`);

--
-- Indices de la tabla `unidades_automotoras`
--
ALTER TABLE `unidades_automotoras`
  ADD PRIMARY KEY (`CodAuto`),
  ADD UNIQUE KEY `CodTransp` (`CodTransp`),
  ADD UNIQUE KEY `Placa` (`Placa`),
  ADD KEY `Cod_est` (`CodEst`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sesion`
--
ALTER TABLE `sesion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `talento_humano`
--
ALTER TABLE `talento_humano`
  ADD CONSTRAINT `talento_humano_ibfk_1` FOREIGN KEY (`Estacion`) REFERENCES `estaciones` (`CodEst`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `unidades_automotoras`
--
ALTER TABLE `unidades_automotoras`
  ADD CONSTRAINT `unidades_automotoras_ibfk_1` FOREIGN KEY (`CodEst`) REFERENCES `estaciones` (`CodEst`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `sesion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(3) unsigned zerofill NOT NULL,
  `login` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `pass` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `NivelAcceso` tinyint(1) unsigned NOT NULL DEFAULT '3',
  `Nombre` varchar(60) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci PACK_KEYS=1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `login`, `pass`, `NivelAcceso`, `Nombre`) VALUES
(001, 'administrador', '12345678', 1, 'Yisbeli Cano'),
(002, 'usuario1', '87654321', 2, 'Karin Lamus');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;--
-- Base de datos: `test`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
