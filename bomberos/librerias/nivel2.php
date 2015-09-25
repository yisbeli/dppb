<?php

	include 'includes/conexion_bd.php';
	$sql = "SELECT * FROM analisis";
	$result = mysqli_query($mysqli, $sql);

?>
	<form action='sala.php' method='POST'>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<legend>Planes a consultar</legend>
			<select for='1' name='' class='form-control'>
				<option> -- seleccione -- </option>
		<?php	while ($consulta = mysqli_fetch_array($result)) { ?>
		<?php echo $consulta[1]; ?>
					<option value="<?php echo $consulta[0]; ?>"><?php echo $consulta[1]; ?></option>
				<?php } ?>
			</select>
			<div class="text-right">
				<button type="submit" class="btn btn-danger">Consultar</button>
			</div>
		</div>
	</div>
</form>