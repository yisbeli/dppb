<?php	include_once 'librerias/cabecera.php'; ?>
	<div class="container">

	<?php extract($_POST);
	if (isset($actualizarut)) :
		include 'includes/conexion_bd.php';
		$sql = "INSERT INTO tipos_resp (nomb_tipo) VALUES ('$ut')";
		mysqli_query($mysqli, $sql);
	?>
	<script type="text/javascript">
		alert("Cargo institucional registrado con éxito");
		window.location="cargo_institucional.php";
	</script>
	<?php
	else :
	include_once 'librerias/menu.php'; ?>
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form action="cargo_institucional.php" method="POST">
					<legend>Nuevo cargo institucional</legend>
					<input type="text" name="ut" placeholder="Tipo de responsable" class="form-control">
					<div class="text-center"><br>
						<button class="btn btn-warning" type="reset">Limpiar formulario</button>
						<button class="btn btn-warning" type="submit" name="actualizarut">Registrar cargo institucional</button>					
					</div>
				</form>
			</div>
		</div>
	</div>
<?php endif;
	include_once 'librerias/pie.php'; ?>
