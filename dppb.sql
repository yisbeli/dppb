-- phpMyAdmin SQL Dump
-- version 4.4.8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-09-2015 a las 01:18:34
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
  `tlfn_part` char(12) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Teléfono de Participante',
  `email_part` char(25) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Email de Participante',
  `id_nivel` int(11) NOT NULL COMMENT 'Código Nivel Academico',
  `user` int(11) DEFAULT NULL,
  `nomenclatura` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `dependencia` char(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`cod_par`, `ced_part`, `nomb_part`, `apell_part`, `profe_part`, `tlfn_part`, `email_part`, `id_nivel`, `user`, `nomenclatura`, `dependencia`) VALUES
(2, 20397171, 'krysler', 'rojass', 'tsu', '416138778', 'cirabelquintero@gmail.com', 2, NULL, 'V', ''),
(3, 6861942, 'belkis', 'soto', 'licenciada', '2147483647', 'belslchs@gmail.com', 4, NULL, 'V', ''),
(4, 3296089, 'otilia', 'soto', 'bachiller', '2147483647', 'kdjkwhdjw@gmail.com', 1, NULL, 'V', ''),
(5, 20435525, 'ronald', 'avila', 'B', '0416138778', 'ronaldavila_10d@gmail.com', 4, NULL, 'V', ''),
(6, 20709289, 'Jorge', 'Castellano', 'arquitecto', '0416-1379717', 'jorgecm14@gmail.com', 2, 8, 'V', ''),
(7, 19996312, 'Yisbeli Karin', 'Cano Lamus', 'disenador', '0426-1604184', 'yisbelikarin@gmail.com', 1, NULL, '', ''),
(8, 23497251, 'Paty', 'Cano', 'publicista', '0416-1379717', 'paty@gmail.com', 5, NULL, '', 'UPTM"Kle');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`cod_plan`, `tipo_plan`, `nomb_plan`, `desc_plan`, `cant_unid`, `id_unid`) VALUES
(11, 1, 'hola', 'prueba', 2, 5),
(12, 1, 'Rescateaa', 'hola rescate', 2, 5),
(13, 2, 'Incendiouuuu', 'hola incendio', 1, 5),
(15, 1, 'yisbeli', 'hola yisbenli', 2, 5),
(16, 1, 'yisssAAAAA', 'juikloo', 1, 5),
(17, 3, 'Respiracion', 'respiracion mutua', 2, 5),
(18, 3, 'Caminar', 'caminando', 2, 5),
(21, 3, 'Caminar', 'caminando', 0, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_participantes`
--

CREATE TABLE IF NOT EXISTS `planes_participantes` (
  `cod_part` int(11) NOT NULL COMMENT 'Codigo de Participante',
  `cod_plan` int(11) NOT NULL COMMENT 'Código de Plan',
  `apro_plan` char(2) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Aprobación del Plan de Formacion',
  `precio` int(11) DEFAULT NULL
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_plan`
--

INSERT INTO `tipo_plan` (`idtipoplan`, `nomb_plan`) VALUES
(1, 'Taller'),
(2, 'Curso'),
(3, 'Charla'),
(6, 'Maestrias'),
(7, 'Talleres');

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
  `tipo` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `correo`, `clave`, `nombre`, `tipo`) VALUES
(1, 'cirabelquintero@gmail.com', '123', 'Cirabel', 1),
(8, 'jorgecm14@gmail.com', 'jorge', 'Jorge', 1),
(9, 'jorge@gmail.com', 'jorge2', 'Jorge', 2),
(14, 'cristina@gmail.com', '1234', 'Cirabel', 2);

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
  MODIFY `cod_par` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Participantes',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `cod_plan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Planes',AUTO_INCREMENT=23;
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
  MODIFY `idtipoplan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
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
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
