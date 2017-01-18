<?php	include_once 'cabecera.php'; ?>
<?php 	include_once 'libs/menu.php'; ?>
<?php 	include_once 'inactivo.php';
	    include_once 'sesion.php'; ?>
	<section class="container">

	<?php extract($_POST);
	if (isset($actualizarut)) :
		include 'config/conexion_bd.php';
		$sql = "INSERT INTO nivel_academico (nomb_nivel) VALUES ('$ut')";
		mysqli_query($mysqli, $sql);
	?>
	<script type="text/javascript">
		alert("Nivel académico registrado con éxito");
		window.location="nivel_academico.php";
	</script>
	<?php
	else :
	 ?>
		<div class="rows">
			<div class="col-md-5 col-md-offset-3">
				<form action="nivel_academico.php" method="POST">
					<legend>Registro de niveles académicos</legend>
					<input type="text" name="ut" placeholder="Nivel académico" class="form-control">
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
