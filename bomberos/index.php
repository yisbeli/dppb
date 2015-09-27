<?php include_once 'librerias/cabecera.php';
	session_destroy();
	session_unset();
?>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<article id="vision"><br />
					<h3>Objetivo Específico</h3>
					<ul type="circle">
						<li><p>1. Recopilar información acerca de las actividades y proceso que realiza el Laboratorio de simulación para el desarrollo de los diferentes módulos del sistema.</p></li>
						<li><p>2. Diagnosticar los requerimientos y necesidades del Laboratorio de simulación, para llevar el diseño del sistema de información de manera acorde a la problemática que se encuentra, para la automatización de sus procesos según el área. </p></li>
						<li><p>3. Determinar el estudio de factibilidad, para que el proyecto llegue al punto en que se quiere, y que todas las actividades que se realicen se lleven a cabo y funcionen a un cien por ciento, para la solución de la problemática. </p></li>	
						<li><p>4. Modificar el sistema automatizado que incluye los módulos de administración, registro, control, relación de ingresos, egresos y estadística.</p></li>
						<li><p>5. Desarrollar un plan de pruebas para verificar la calidad y operatividad del sistema.</p></li>
					</ul>
				</article>
				<?php

					include 'includes/conexion_bd.php';
					$sql = "SELECT * FROM tipo_plan";
					$result = mysqli_query($mysqli, $sql);

				?>
				<form action="">
				<legend>Planes a consultar</legend>
					<select name="" id="" class="form-control">
						<?php while ($consulta = mysqli_fetch_array($result)) : ?>
							<option value="<?php echo $consulta[0]; ?>"><?php echo $consulta[1]; ?></option>
						<?php endwhile; ?>
					</select>
					<button type="submit" name="consulta2" class="btn btn-danger">Consultar</button>
				</form>
			</div>
			<div class="col-md-3 text-left">
				<legend>Inicio de sesión</legend>
				<form action="includes/login.php" method="POST">
					<input  type="email" name="usuario" class="form-control" placeholder="Usuario">
					<input type="password" name="password" class="form-control" placeholder="Contraseña">
					<button type="submit" class="btn btn-danger">Iniciar sesión</button>
				</form>
			</div>
		</div>
	</div>
<?php include_once 'librerias/pie.php'; ?>