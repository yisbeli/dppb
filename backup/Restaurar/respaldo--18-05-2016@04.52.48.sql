--
-- Base de datos : dppb2
--
-- --------------------------------------------------
-- ---------------------------------------------------
SET AUTOCOMMIT = 0 ;
SET FOREIGN_KEY_CHECKS=0 ;
--
-- Se puede reservar la estructura de la tabla `cobradores`
--
DROP TABLE  IF EXISTS `cobradores`;
CREATE TABLE `cobradores` (
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` int(11) NOT NULL,
  `cuentas_cobradas` int(11) NOT NULL,
  `zona` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `cobradores`  VALUES ( "ciro quintero","3962250","430","foranea");
INSERT INTO `cobradores`  VALUES ( "ronald avila","20435525","360","local");


--
-- Se puede reservar la estructura de la tabla `egresos`
--
DROP TABLE  IF EXISTS `egresos`;
CREATE TABLE `egresos` (
  `cod_egr` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de Egreso',
  `fech_egr` date NOT NULL COMMENT 'Fecha de Egreso',
  `clase_egr` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Clase de Egreso',
  `monto_egr` float NOT NULL COMMENT 'Monto del Egreso',
  `num_factura` int(11) NOT NULL,
  PRIMARY KEY (`cod_egr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `egresos`  VALUES ( "1","2015-10-02","Compra de hojas","50.1","123456");
INSERT INTO `egresos`  VALUES ( "2","2015-10-02","Compra de lap","100.2","789456");
INSERT INTO `egresos`  VALUES ( "3","2015-10-01","compra de papel","1000","34566778");
INSERT INTO `egresos`  VALUES ( "4","2016-05-01","pago","200","1245874");


--
-- Se puede reservar la estructura de la tabla `expediente`
--
DROP TABLE  IF EXISTS `expediente`;
CREATE TABLE `expediente` (
  `cod_exp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de expediente',
  `copia_ced` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Copia de Cedula de Identidad',
  `foto` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Foto Carnet',
  `carpeta` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Carpeta Marron',
  `copia_titulo` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Copia de Titulo de bachiller',
  `sintesis` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Sistesis Curricular',
  `otros` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Otro tipo de expediente',
  `cod_part` int(11) NOT NULL COMMENT 'C?digo de Participante',
  PRIMARY KEY (`cod_exp`),
  KEY `cod_part` (`cod_part`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `expediente`  VALUES ( "1","s","s","s","s","s","","7");
INSERT INTO `expediente`  VALUES ( "2","s","s","s","s","s","","7");
INSERT INTO `expediente`  VALUES ( "3","s","s","s","s","s","","8");
INSERT INTO `expediente`  VALUES ( "4","s","s","s","s","s","","5");
INSERT INTO `expediente`  VALUES ( "5","s","s","s","s","s","","11");
INSERT INTO `expediente`  VALUES ( "6","s","s","s","s","s","","3");
INSERT INTO `expediente`  VALUES ( "7","s","s","s","s","s","","6");
INSERT INTO `expediente`  VALUES ( "8","s","s","s","s","s","","16");
INSERT INTO `expediente`  VALUES ( "9","s","s","s","s","s","","18");
INSERT INTO `expediente`  VALUES ( "10","s","s","s","s","s","","12");
INSERT INTO `expediente`  VALUES ( "11","s","s","s","s","s","Rit","13");
INSERT INTO `expediente`  VALUES ( "12","s","s","s","s","s","","4");
INSERT INTO `expediente`  VALUES ( "13","s","s","s","s","s","","19");
INSERT INTO `expediente`  VALUES ( "14","s","s","s","s","s","RIF","23");
INSERT INTO `expediente`  VALUES ( "15","s","s","s","s","s","","24");


--
-- Se puede reservar la estructura de la tabla `fondos`
--
DROP TABLE  IF EXISTS `fondos`;
CREATE TABLE `fondos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_ingreso` int(11) NOT NULL,
  `total_egreso` int(11) NOT NULL,
  `saldo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `fondos`  VALUES ( "1","2250","1300","950");


--
-- Se puede reservar la estructura de la tabla `gerentes`
--
DROP TABLE  IF EXISTS `gerentes`;
CREATE TABLE `gerentes` (
  `nombre_g` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `gerentes`  VALUES ( "ada guillen","adaguillen@gmail.com","ada");
INSERT INTO `gerentes`  VALUES ( "jose moreno","josemoreno@gmail.com","moreno");
INSERT INTO `gerentes`  VALUES ( "otilia soto","otiliasoto@gmail.com","otilia");


--
-- Se puede reservar la estructura de la tabla `municipios`
--
DROP TABLE  IF EXISTS `municipios`;
CREATE TABLE `municipios` (
  `id_municipio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Municipio',
  `nomb_mun` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de Municipio',
  PRIMARY KEY (`id_municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `municipios`  VALUES ( "1","Libertador");
INSERT INTO `municipios`  VALUES ( "2","Campo Elias");


--
-- Se puede reservar la estructura de la tabla `nivel_academico`
--
DROP TABLE  IF EXISTS `nivel_academico`;
CREATE TABLE `nivel_academico` (
  `id_nivel` int(2) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de nivel Academico',
  `nomb_nivel` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Nivel Academico',
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `nivel_academico`  VALUES ( "1","Primaria");
INSERT INTO `nivel_academico`  VALUES ( "7","Bachillerato");
INSERT INTO `nivel_academico`  VALUES ( "8","T");
INSERT INTO `nivel_academico`  VALUES ( "9","T.S.U");
INSERT INTO `nivel_academico`  VALUES ( "10","Universitario");
INSERT INTO `nivel_academico`  VALUES ( "11","Ingeniero(a)");
INSERT INTO `nivel_academico`  VALUES ( "12","Maestria");
INSERT INTO `nivel_academico`  VALUES ( "13","Doctorado");


--
-- Se puede reservar la estructura de la tabla `paciente`
--
DROP TABLE  IF EXISTS `paciente`;
CREATE TABLE `paciente` (
  `cedu_pac` int(11) NOT NULL COMMENT 'C?dula del Paciente',
  `nomb_pac` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Paciente',
  `edad` int(3) NOT NULL COMMENT 'Edad del Paciente',
  `diag_pac` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Diagnostico del Paciente',
  `cod_serv` int(11) NOT NULL COMMENT 'C?digo de Servicio',
  PRIMARY KEY (`cedu_pac`),
  KEY `cod_serv` (`cod_serv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



--
-- Se puede reservar la estructura de la tabla `participantes`
--
DROP TABLE  IF EXISTS `participantes`;
CREATE TABLE `participantes` (
  `cod_par` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de Participantes',
  `ced_part` int(11) NOT NULL COMMENT 'C?dula de Participante',
  `nomb_part` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de Participante',
  `apell_part` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apellido de Participante',
  `profe_part` char(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Profesi?n de Participante',
  `tlfn_part` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tel?fono de Participante',
  `email_part` char(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Email de Participante',
  `id_nivel` int(11) NOT NULL COMMENT 'C?digo Nivel Academico',
  `nomenclatura` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'V',
  `dependencia` char(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cod_par`),
  UNIQUE KEY `ced_part` (`ced_part`),
  KEY `id_nivel` (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `participantes`  VALUES ( "4","19539526","Yuriesskys","Rojas","docente","678909887654","yuriesskys.rojas@gmail.co","10","V","Sim");
INSERT INTO `participantes`  VALUES ( "5","24567897","Daniel","Rojas","ingeniero","123456788899","danirojas@gmail.com","11","V","Bolivar 2000");
INSERT INTO `participantes`  VALUES ( "6","20145678","Yoel","Torres","ingeniero","345678909876","yoeltorres@gmail.com","11","V","Bolivar 2000");
INSERT INTO `participantes`  VALUES ( "8","23456789","Cirabel","Quintero","gerente","0424-2345678","cirabelquintero@gmail.com","10","V","UNA");
INSERT INTO `participantes`  VALUES ( "9","87654345","Lizmar","Marquez","comerciante","0416-1234567","lizmarquez@gmail.com","1","V","ONA");
INSERT INTO `participantes`  VALUES ( "10","56783928","Jesus","Davila","docente","0412-0987678","davilajesus@gmail.com","10","V","Liceo Ejido");
INSERT INTO `participantes`  VALUES ( "12","18345678","Argenis","Gil","economista","0414-8765456","gil.argenis@gmail.com","12","V","Alberto Adriani");
INSERT INTO `participantes`  VALUES ( "13","67807654","Erika","Quintero","arquitecto","0412-5708653","Erica2@gmail.com","10","V","INIA");
INSERT INTO `participantes`  VALUES ( "19","20398052","cira","quin","juridico","04261387789","ciraquin@gmail.com","9","","uptm");
INSERT INTO `participantes`  VALUES ( "20","24567900","Andru","Marquez","ingeniero","0426-9776365","andru.123@gmail.com","11","V","IUTT");
INSERT INTO `participantes`  VALUES ( "21","25678890","Johana","Felisola","docente","0215-5354890","johana_felisola@gmail.com","10","V","Sim");
INSERT INTO `participantes`  VALUES ( "23","12643784","Ronald","Rivera","gerente","2345-8338848","ronal@gmail.com","10","V","UPTM");
INSERT INTO `participantes`  VALUES ( "24","10898072","Albert","Romero","ingeniero","0414-3455677","albert@gmail.com","11","V","UPTM");


--
-- Se puede reservar la estructura de la tabla `planes`
--
DROP TABLE  IF EXISTS `planes`;
CREATE TABLE `planes` (
  `cod_plan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de Planes',
  `tipo_plan` int(11) NOT NULL COMMENT 'Tipo de Planes',
  `nomb_plan` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Plan ',
  `desc_plan` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripci?n del Plan ',
  `cant_unid` int(2) NOT NULL COMMENT 'Cantidad de U.T a cancelar',
  `id_unid` int(11) DEFAULT NULL COMMENT 'C?digo de la Unidad Tributaria',
  PRIMARY KEY (`cod_plan`),
  KEY `id_unid` (`id_unid`),
  KEY `tipo_plan` (`tipo_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `planes`  VALUES ( "2","1","Evacuaci","Retiro de personas en lugares cerrados","0","2");
INSERT INTO `planes`  VALUES ( "3","1","Atenci","Parto vaginal espont","0","2");
INSERT INTO `planes`  VALUES ( "4","2","RCP","La reanimaci","2","2");
INSERT INTO `planes`  VALUES ( "5","2","Primero auxilios","Atenci","3","2");
INSERT INTO `planes`  VALUES ( "6","3","Manejo de Fuegos Artificiales","La forma m","0","2");
INSERT INTO `planes`  VALUES ( "7","3","Incendios forestales","Un incendio forestal se distingue de otros tipos de incendio por su amplia extensi","0","2");
INSERT INTO `planes`  VALUES ( "8","4","Atenci","Introducci","4","3");
INSERT INTO `planes`  VALUES ( "9","1","la prueba de la verdad","para todo el mundo","2","3");


--
-- Se puede reservar la estructura de la tabla `planes_participantes`
--
DROP TABLE  IF EXISTS `planes_participantes`;
CREATE TABLE `planes_participantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_plan` int(11) NOT NULL,
  `cod_par` int(11) NOT NULL,
  `nota` int(2) unsigned zerofill DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `status` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pre-inscrito',
  `exonerado` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `bauche` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cod_plan` (`cod_plan`),
  KEY `cod_par` (`cod_par`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `planes_participantes`  VALUES ( "9","3","5","16","0","inscrito","No","2147483647");
INSERT INTO `planes_participantes`  VALUES ( "11","7","6","00","0","inscrito","No","2147483647");
INSERT INTO `planes_participantes`  VALUES ( "12","5","7","00","450","inscrito","No","2147483647");
INSERT INTO `planes_participantes`  VALUES ( "14","5","3","00","450","inscrito","No","23456789");
INSERT INTO `planes_participantes`  VALUES ( "15","3","3","12","0","inscrito","Si","0");
INSERT INTO `planes_participantes`  VALUES ( "16","5","8","00","450","inscrito","Si","0");
INSERT INTO `planes_participantes`  VALUES ( "20","3","12","20","300","inscrito","No","12345420");
INSERT INTO `planes_participantes`  VALUES ( "24","4","16","00","300","inscrito","Si","0");
INSERT INTO `planes_participantes`  VALUES ( "26","9","18","00","0","inscrito","No","2147483647");
INSERT INTO `planes_participantes`  VALUES ( "27","13","7","15","450","inscrito","No","1234567");
INSERT INTO `planes_participantes`  VALUES ( "28","13","3","18","450","inscrito","No","12345670");
INSERT INTO `planes_participantes`  VALUES ( "29","13","4","20","450","inscrito","No","1234567");
INSERT INTO `planes_participantes`  VALUES ( "30","5","19","00","0","inscrito","No","908978654");
INSERT INTO `planes_participantes`  VALUES ( "31","5","19","00","0","inscrito","No","908978654");
INSERT INTO `planes_participantes`  VALUES ( "32","5","20","00","0","pre-inscrito","No","0");
INSERT INTO `planes_participantes`  VALUES ( "33","6","21","00","0","pre-inscrito","No","0");
INSERT INTO `planes_participantes`  VALUES ( "34","16","22","00","600","pre-inscrito","No","0");
INSERT INTO `planes_participantes`  VALUES ( "35","7","23","00","0","inscrito","No","2147483647");
INSERT INTO `planes_participantes`  VALUES ( "36","7","24","00","0","pre-inscrito","No","0");
INSERT INTO `planes_participantes`  VALUES ( "37","18","24","00","300","inscrito","No","2147483647");


--
-- Se puede reservar la estructura de la tabla `planes_responsables`
--
DROP TABLE  IF EXISTS `planes_responsables`;
CREATE TABLE `planes_responsables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_plan` int(11) NOT NULL COMMENT 'C?digo de Plan ',
  `cod_resp` int(11) NOT NULL COMMENT 'C?digo de Responsable',
  `lugar` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'por-iniciar',
  `Dia_I` int(2) unsigned zerofill NOT NULL,
  `Mes_I` int(2) unsigned zerofill NOT NULL,
  `Ano_I` int(4) unsigned zerofill NOT NULL,
  `Dia_F` int(2) unsigned zerofill NOT NULL,
  `Mes_F` int(2) unsigned zerofill NOT NULL,
  `Ano_F` int(4) unsigned zerofill NOT NULL,
  `horario` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cod_resp` (`cod_resp`),
  KEY `cod_plan` (`cod_plan`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `planes_responsables`  VALUES ( "3","4","6","UPTM","culminado","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "4","7","8","iute","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "5","2","6","laboratorio","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "6","3","8","laboratorio","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "7","6","6","laboratorio","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "8","7","8","ula","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "9","7","6","ula","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "10","7","6","UPTM","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "13","5","8","Inia","culminado","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "15","5","11","IUFRONT","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "16","8","10","CDI","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "17","8","10","laboratorio","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "18","4","6","Gobernacion","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "19","2","8","laboratorio","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "20","6","11","UPTM","por-iniciar","00","00","0000","00","00","0000","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "21","2","6","UPTM","por-iniciar","01","00","2015","01","00","2015","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "22","4","6","IUFRONT","por-iniciar","04","01","2015","08","01","2015","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "23","8","10","hospital","por-iniciar","03","12","2015","04","12","2015","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "24","4","8","unefa","por-iniciar","06","01","2015","07","01","2015","00:00:00");
INSERT INTO `planes_responsables`  VALUES ( "25","8","8","laboratorio","por-iniciar","17","11","2015","19","12","2015","13:56:00");


--
-- Se puede reservar la estructura de la tabla `responsables`
--
DROP TABLE  IF EXISTS `responsables`;
CREATE TABLE `responsables` (
  `cod_resp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo Responsable',
  `ced_resp` int(8) NOT NULL COMMENT 'C?dula Responsable',
  `nomb_resp` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre Responsable',
  `apell_resp` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apellido Responsable',
  `espe_resp` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Especialidad Responsable',
  `id_nivel` int(11) NOT NULL COMMENT 'Codigo Nivel',
  `id_tipo` int(11) NOT NULL COMMENT 'C?digo de Tipo de Responsable',
  PRIMARY KEY (`cod_resp`),
  KEY `id_nivel` (`id_nivel`,`id_tipo`),
  KEY `id_nivel_2` (`id_nivel`),
  KEY `id_tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `responsables`  VALUES ( "8","23556948","Jurielis","Rojas","TSU Informatica","9","4");
INSERT INTO `responsables`  VALUES ( "10","19996312","Yisbeli","Cano","Comerciante","9","4");
INSERT INTO `responsables`  VALUES ( "12","12347856","pedro","perez","educador","11","3");


--
-- Se puede reservar la estructura de la tabla `servicios`
--
DROP TABLE  IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `cod_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de Servicio ',
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
  `cod_resp` int(11) NOT NULL COMMENT 'C?digo de Responsable ',
  PRIMARY KEY (`cod_serv`),
  KEY `id_tipo_serv` (`id_tipo_serv`,`id_unidad`,`id_municipio`),
  KEY `cod_resp` (`cod_resp`),
  KEY `id_municipio` (`id_municipio`),
  KEY `id_unidad` (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



--
-- Se puede reservar la estructura de la tabla `tipo_plan`
--
DROP TABLE  IF EXISTS `tipo_plan`;
CREATE TABLE `tipo_plan` (
  `idtipoplan` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_plan` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `evaluacion` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`idtipoplan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `tipo_plan`  VALUES ( "1","Taller","no");
INSERT INTO `tipo_plan`  VALUES ( "2","Curso","si");
INSERT INTO `tipo_plan`  VALUES ( "3","Charla","no");
INSERT INTO `tipo_plan`  VALUES ( "4","Seminario","si");
INSERT INTO `tipo_plan`  VALUES ( "5","las drogas como medio potencial para el deterioro de la salud","si");


--
-- Se puede reservar la estructura de la tabla `tipo_servicio`
--
DROP TABLE  IF EXISTS `tipo_servicio`;
CREATE TABLE `tipo_servicio` (
  `id_tipo_serv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de Tipo de Servicio',
  `nomb_tipo_serv` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de Tipo de Servicio',
  PRIMARY KEY (`id_tipo_serv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



--
-- Se puede reservar la estructura de la tabla `tipos_resp`
--
DROP TABLE  IF EXISTS `tipos_resp`;
CREATE TABLE `tipos_resp` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo de Responsable ',
  `nomb_tipo` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Tipo de Responsable',
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `tipos_resp`  VALUES ( "1","Sargento I");
INSERT INTO `tipos_resp`  VALUES ( "2","Sargento II");
INSERT INTO `tipos_resp`  VALUES ( "3","Instructor");
INSERT INTO `tipos_resp`  VALUES ( "4","Coordinador");
INSERT INTO `tipos_resp`  VALUES ( "5","Coronel");


--
-- Se puede reservar la estructura de la tabla `unidades`
--
DROP TABLE  IF EXISTS `unidades`;
CREATE TABLE `unidades` (
  `id_unidad` int(2) NOT NULL AUTO_INCREMENT COMMENT 'C?digo del Veh?culo  ',
  `nro_unidad` int(11) NOT NULL COMMENT 'Numero de Unidad',
  `marca` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Marca del Vehiculo',
  `modelo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Modelo del Vehiculo',
  `placa` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Placa del Vehiculo',
  `seudonimo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apodo del Vehiculo',
  `estacion` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Estaci?n a la que pertenece el Vehiculo',
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `unidades`  VALUES ( "1","1","Ford","Eco spor","xsr-503","Carro Bomba","1");


--
-- Se puede reservar la estructura de la tabla `unidades_trib`
--
DROP TABLE  IF EXISTS `unidades_trib`;
CREATE TABLE `unidades_trib` (
  `id_unid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'C?digo de la UT',
  `ano_unid` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ano en q aumenta la UT',
  `fecha_unid` date NOT NULL COMMENT 'Fecha en q aumenta la UT',
  `valor_unid` int(11) NOT NULL COMMENT 'Valor de la UT',
  PRIMARY KEY (`id_unid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `unidades_trib`  VALUES ( "1","2014","2014-01-01","120");
INSERT INTO `unidades_trib`  VALUES ( "2","2015","2015-01-15","140");
INSERT INTO `unidades_trib`  VALUES ( "3","2015","2015-10-02","150");


--
-- Se puede reservar la estructura de la tabla `user`
--
DROP TABLE  IF EXISTS `user`;
CREATE TABLE `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `clave` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT '2',
  `responsable` int(11) DEFAULT NULL,
  `status` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'por-aprobar',
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `user`  VALUES ( "2","jurielis.rojas10@gmail.com","hisopo24.","Jurielis Rojas","2","8","aprobado");
INSERT INTO `user`  VALUES ( "6","cirabel@gmail.com","byron","Cirabel Quintero","1","12","aprobado");


--
-- Se puede reservar la estructura de la tabla `vendedores`
--
DROP TABLE  IF EXISTS `vendedores`;
CREATE TABLE `vendedores` (
  `nombre_v` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_v` int(11) NOT NULL,
  `cuentas_vendidas` int(11) NOT NULL,
  `zona` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula_v`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `vendedores`  VALUES ( "belkis soto","6861942","230","local");
INSERT INTO `vendedores`  VALUES ( "cirabel quintero soto","20397052","200","foranea");


SET FOREIGN_KEY_CHECKS = 1 ; 
COMMIT ; 
SET AUTOCOMMIT = 1 ; 
