<?php	include_once 'librerias/cabecera.php'; ?>
	<div class="container">

	<?php extract($_POST);
	if (isset($actualizarut)) :
		include 'includes/conexion_bd.php';
		$sql = "INSERT INTO nivel_academico (nomb_nivel) VALUES ('$ut')";
		mysqli_query($mysqli, $sql);
	?>
	<script type="text/javascript">
		alert("Nivel académico registrado con éxito");
		window.location="nivel_academico.php";
	</script>
	<?php
	else :
	include_once 'librerias/menu.php'; ?>
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form action="nivel_academico.php" method="POST">
					<legend>Registro de niveles académicos</legend>
					<input type="text" name="ut" placeholder="Nivel académico" class="form-control">
					<div class="text-center"><br>
						<button class="btn btn-warning" type="reset">Limpiar formulario</button>
						<button class="btn btn-warning" type="submit" name="actualizarut">Registrar nivel académico</button>					
					</div>
				</form>
			</div>
		</div>
	</div>
<?php endif;
	include_once 'librerias/pie.php'; ?>
