<?php
	include 'includes/conexion_bd.php';
	$sql = "SELECT * FROM tipo_plan";
	$result = mysqli_query($mysqli, $sql);
?>
<div class="container">
	<div class="row">
	<div class="col-md-4"></div>
		<div class="col-md-4">
			<form action="busqueda_planes_participantes.php" method="POST">
				<legend>Planes a consultar</legend>
				<select name="plan" id="plan" class="form-control">
					<?php while ($consulta = mysqli_fetch_array($result)) : ?>
						<option value="<?php echo $consulta[0]; ?>"><?php echo $consulta[1]; ?></option>
					<?php endwhile; ?>
				</select>
				<div class="text-center">
					<button type="submit" name="consulta2" class="btn btn-warning">Consultar</button>					
				</div><br>
			</form>
		</div>
	</div>
</div>        	