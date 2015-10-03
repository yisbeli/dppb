<?php	include_once 'librerias/cabecera.php'; ?>
	<div class="container">

	<?php extract($_POST);
	if (isset($actualizarut)) :
		include 'includes/conexion_bd.php';
		$ano = date("Y");
		$fecha = date("Y-m-d");
		$sql = "INSERT INTO unidades_trib (ano_unid, fecha_unid, valor_unid) VALUES ('$ano', '$fecha', '$ut')";
		mysqli_query($mysqli, $sql);
	?>
	<script type="text/javascript">
		alert("Unidad tributaria actualizada");
		window.location="sala.php";
	</script>
	<?php
	else :
	include_once 'librerias/menu.php'; ?>
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form action="unidades_tributarias.php" method="POST">
					<legend>Nuevo valor de la unidad tributaria</legend>
					<input type="text" name="ut" placeholder="Valor en bolívares" class="form-control">
					<div class="text-center"><br>
						<button class="btn btn-warning" type="reset">Limpiar formulario</button>
						<button class="btn btn-warning" type="submit" name="actualizarut">Actualizar unidad tributaria</button>					
					</div>
				</form>
			</div>
		</div>
	</div>
<?php endif;
	include_once 'librerias/pie.php'; ?>
