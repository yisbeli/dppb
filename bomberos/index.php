<?php include_once 'librerias/cabecera.php';
	session_destroy();
	session_unset();
?>
	<div class="container">
		<div class="row">
			<div class="col-md-3 text-left"><br>
				<legend>Inicio de sesión</legend>
				<?php
					include 'includes/conexion_bd.php';
					$sql = "SELECT * FROM tipo_plan";
					$result = mysqli_query($mysqli, $sql);
				?>
				<form action="includes/login.php" method="POST">
					<input  type="email" name="usuario" class="form-control" placeholder="Correo">
					<input type="password" name="password" class="form-control" placeholder="Contraseña"><br>
					<div class="text-center">
						<button type="submit" class="btn btn-warning">Iniciar sesión</button><br><br>
					</div>
					<a href="nuevo_usu.php" >Registrar nueva cuenta </a>
				</form>
				<br><br>
				<form action="busqueda_planes.php" method="POST">
					<legend>Planes a consultar</legend>
					<select name="plan" id="plan" class="form-control">
						<?php while ($consulta = mysqli_fetch_array($result)) : ?>
							<option value="<?php echo $consulta[0]; ?>"> <?php echo $consulta[1]; ?></option>
						<?php endwhile; ?>
					</select><br>
					<div class="text-center">
						<button type="submit" name="consulta2" class="btn btn-warning">Consultar</button>
					</div>
				</form>
			</div>
			<div class="col-md-9">
				<article id="vision"><br />
					<h2> Laboratorio de Simulación</h2>
					<h3>Misión</h3>
					<ul type="circle">
						<li><p align="justify">El laboratorio de simulación de emergencias prehospitalarias del cuerpo de bomberos del Estado Mérida tiene la facultad de dictar la capacitación del personal uniformado y civil en el campo de atención y control de emergencias prehospitalarias con el fin de mantener el personal actualizado para enfrentar cualquier situación con técnicas y protocolos dictaminados por entes
						internacionales. Además de brindarles el contacto con maniquís de simulación los cuales constituyen todas las situaciones que se presentan en las actividades en el quehacer diario de un funcionario 
						bomberil y civil en el campo de la medicina de emergencia.</p>
					</ul>
					<h3>Visión</h3>
					<ul type="circle">
						<li><p align="justify">Ser el primer laboratorio de simulaciones de emergencias prehospitalarias en Venezuela y Latinoamérica con los maniquís de simulación de última generación que den a los usuarios el contacto más cercano con la realidad y así contar con la aptitudes y destrezas de enfrentar cualquier situación donde la vida de una persona este en riesgo vital.</p>
					</ul>
				</article>
			</div>
		</div>
	</div>
<?php include_once 'librerias/pie.php'; ?>