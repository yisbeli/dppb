<?php	include_once 'cabecera.php'; ?>
<?php   include_once 'libs/menu.php'; ?>
	<section class="container">

	<?php extract($_POST);
	if (isset($actualizarut)) :
		include 'config/conexion_bd.php';
		$sql = "INSERT INTO tipos_resp (nomb_tipo) VALUES ('$ut')";
		mysqli_query($mysqli, $sql);
	?>
	<script type="text/javascript">
		alert("Cargo institucional registrado con éxito");
		window.location="cargo_institucional.php";
	</script>
	<?php
	else :
	include_once 'libs/menu.php'; ?>
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form action="cargo_institucional.php" method="POST">
					<legend>Nuevo cargo institucional</legend>
					<input type="text" name="ut" placeholder="Tipo de responsable" class="form-control">
					<div class="text-center"><br>
						<button class="btn btn-sistema" type="reset" title="volver" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>
						<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>
						<button type="submit" name="crear" class="btn btn-sistema"><span class="glyphicon glyphicon-floppy-saved"></span> Guardar</button>
					</div>
				</form>
			</div>
		</div>

</section>
<?php endif;
	include_once 'pie.php'; ?>
