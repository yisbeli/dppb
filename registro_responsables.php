<?php	include_once 'cabecera.php'; ?>
<?php 	include_once 'inactivo.php';
		include_once 'sesion.php'; ?>
	<section class="container">

	<?php extract($_POST);
	if (isset($actualizarut)) :
		include 'config/conexion_bd.php';
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
			<div class="col-md-6 col-md-offset-3">
				<form action="unidades_tributarias.php" method="POST">
					<legend>Nuevo valor de la unidad tributaria</legend>
					<input type="number" name="ut" placeholder="Valor en bolívares" class="form-control" required>
					<div class="text-center"><br>
						<button class="btn btn-sistema" type="reset">Limpiar formulario</button>
						<button class="btn btn-sistema" type="submit" name="actualizarut">Actualizar unidad tributaria</button>					
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<?php endif;
	include_once 'pie.php';  ?>
