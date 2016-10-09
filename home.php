<?php
	include_once 'cabecera.php';
	session_destroy();
	session_unset();
?>
	<section class="container home">
		<div class="row">


			<div class="col-md-4"></div>


			<div class="col-md-3 text-center"><br>
				<h1> Laboratorio de Simulacion</h1>

				<legend>Iniciar Sesión</legend>
				<?php
					include 'config/conexion_bd.php';
					$sql = "SELECT * FROM tipo_plan";
					$result = mysqli_query($mysqli, $sql);
				?>
				<form action="config/login.php" method="POST" >
					<input  type="email" name="usuario" class="form-control" placeholder="Correo">
					<input type="password" name="password" class="form-control" placeholder="Contraseña"><br>
					<div class="text-center">
						<button type="submit" class="btn btn-sistema">Iniciar sesión <span class="glyphicon glyphicon-log-in"></span></button><br><br>
					</div>
				</form>
				<a href="recuperar_contrasena.php">Recuperar contraseña</a>
				<br><br>
				<form action="busqueda_planes.php" method="POST">
					<legend>Planes a consultar</legend>
					<select name="plan" id="plan" class="form-control">
						<option disabled selected>--Seleccione una opción--</option>
						<?php while ($consulta = mysqli_fetch_array($result)) : ?>
							<option value="<?php echo $consulta[0]; ?>"> <?php echo $consulta[1]; ?></option>
						<?php endwhile; ?>
					</select><br>
					<div class="text-center">
						<button type="submit" name="consulta2" class="btn btn-sistema"><span class="glyphicon glyphicon-search"></span>Consultar</button>
					</div>
				</form>
			</div>

		</div>
	</section>
<?php include_once 'pie.php'; ?>
