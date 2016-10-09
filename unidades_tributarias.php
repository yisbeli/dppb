<?php	include_once 'cabecera.php'; ?>
<?php   include_once 'libs/menu.php'; ?>
	<section class="container">

	<?php extract($_POST);
	if (isset($actualizarut)) :
		include 'config/conexion_bd.php';
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
	 ?>
		<div class="rows">
			<div class="col-md-5 col-md-offset-3">
				<form action="unidades_tributarias.php" method="POST">
					<legend>Nuevo valor de la unidad tributaria</legend>
					<input type="text" name="ut" placeholder="Valor en bolívares" class="form-control" required>
					<div class="text-center"><br>
						<button class="btn btn-sistema" type="reset" title="volver" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>
						<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>
						<button type="submit" name="crear" class="btn btn-sistema"><span class="glyphicon glyphicon-refresh"></span> Actulizar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<?php endif;
	include_once 'pie.php';  ?>
