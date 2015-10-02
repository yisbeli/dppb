<?php
	include_once 'includes/bd_conexion.php';
?>
<!DOCTYPE html>
<html lang = "es">
	<head>
		<title>..::Sistema Automatizado de Registro y Control de los planes de formacion - Laboratorio de Simulacion::..</title>
		<link rel="stylesheet" type="text/css" media="screen" href="/labsimulacion/css/principal.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="/labsimulacion/css/formulario.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="/labsimulacion/css/botones.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="/labsimulacion/css/menu.css" />
		<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
		<script>
			jQuery("#buscador").keyup(function(){
			    if( jQuery(this).val() != ""){
			        jQuery("#tabla tbody>tr").hide();
			        jQuery("#tabla td:contiene-palabra('" + jQuery(this).val() + "')").parent("tr").show();
			    }
			    else{
			        jQuery("#tabla tbody>tr").show();
			    }
			});
			 
			jQuery.extend(jQuery.expr[":"], 
			{
			    "contiene-palabra": function(elem, i, match, array) {
			        return (elem.textContent || elem.innerText || jQuery(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
			    }
			});
		</script>
	</head>
	<body align="center" id="contenedor">
		<!-- INICIO DE LA PAGINA -->
			<header>
				<?php 
				session_start();
				 ?>
				<!-- Membrete -->
				
				<img align="center" src="/labsimulacion/imagenes/imagen1.png" width="100%" height="150px">

			</header>
			<nav>
				<!-- Menú principal -->
				<ul>
					<li class="nivel1"><a href="/labsimulacion/sala.php"><img align="center" src="/labsimulacion/imagenes/inicio.png"  width="23px" height="17px" /> Inicio</a></li>
					
					<li class="nivel1"><a>Planes De Formación</a>
						<ul class="nivel2">
						<?php if(isset($_SESSION['log']) and $_SESSION['tipo']==1){ ?>
							<li class="nivel2"><a class="nivel2">Registrar</a>
								<ul class="nivel3">
									<li><a href="/labsimulacion/insert/reg_plan.php">Planes de Formacion</a></li>
									<li><a href="/labsimulacion/insert/reg_part.php">Participantes</a></li>
									<li><a href="/labsimulacion/insert/reg_resp.php">Responsables</a></li>
								</ul>
							</li>
							<?php } ?>
							<li class="nivel2"><a class="nivel2">Consultas</a>
								<ul class="nivel3">
									<li><a href="/labsimulacion/consultas/consulta_plan2.php">Planes de Formacion</a></li>
									<?php if(isset($_SESSION['log']) and $_SESSION['tipo']==1){ ?>
									<li><a href="/labsimulacion/consultas/consulta_part2.php">Participantes</a></li>
									<li><a href="/labsimulacion/consultas/consulta_resp2.php">Responsables</a></li>
									<?php } ?>
								</ul>
							</li>
						</ul>
					</li>
					
					<?php if(isset($_SESSION['log']) and $_SESSION['tipo']==1){ ?>
					<li class="nivel1"><a>Servicio Operacionales</a>
						<ul class="nivel2">
							<li class="nivel2"><a class="nivel2">Registrar</a>
								<ul class="nivel3">
									<li><a href="/labsimulacion/insert/Servicio.php">Registrar Servicios </a></li>
									<li><a href="/labsimulacion/insert/paciente.php">Registrar Paciente </a></li>
								</ul>
								<li class="nivel2"><a class="nivel2">Consultas</a>
								<ul class="nivel3">
									<li><a href="/labsimulacion/consultas/consulta_serv2.php">Consultar Servicio</a></li>
									<li><a href="/labsimulacion/consultas/consulta_pac2.php">Consultar Paciente</a></li>
								</ul>
					</li>
					</ul>

					<li class="nivel1"><a>Reportes</a>
						<ul class="nivel2">
							<li><a href="/labsimulacion/reportes/ingresos.php">Ingresos </a></li>
							<li><a href="/labsimulacion/reportes/egresos.php">Egresos </a></li>
							<li><a href="/labsimulacion/reportes/ingresos_plan.php">Ingresos por plan</a></li>
						</ul>
					</li>

					<li class="nivel1"><a>Herramientas</a>
						<ul class="nivel2">
							<li><a href="enConstruccion.php">Respaldar</a></li>
							<li><a href="enConstruccion.php">Restaurar</a></li>
							<li><a href="#">Cambio de clave</a></li>
							<li><a href="#">Aceptación de usuario</a></li>
						</ul>
					</li>
					
					<li class="nivel1"><a>Ayuda</a>
						<ul class="nivel2">
							<li><a href="#">Manual de usuario</a></li>
							<li><a href="#">Documentacion</a></li>
							<li><a href="#">Acerca de</a></li>
						</ul>
					</li>
					<?php } ?>
					<li class="nivel1" id="inicio_panel" style="border-left:1px solid #ffffff"><?php if (empty($_SESSION['log'])) {  ?><a href="/labsimulacion/iniciar_sesion.php">Iniciar Sesión <?php } else {?> <a href="/labsimulacion/config/logout.php">Cerrar Sesion<?php } ?><img align="center" src="/labsimulacion/imagenes/shut_down.png"  width="20px" height="17px" /></a></li>
					<?php 
					if (isset($_SESSION['log'])){
					$nombre=$_SESSION['nombre'];	
					?>
					<li class="nivel1" id="inicio_panel" style="border-right:none"><a id="alignn">Bienvenido(a) <?php echo $nombre;} else{?><li class="nivel1" id="inicio_panel" style="border-right:none><a id="alignn"><?php } ?></a></li>
				</ul>
			</nav>
			<div id="cuerpoB">