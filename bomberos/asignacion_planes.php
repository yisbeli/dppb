<?php	include_once 'librerias/cabecera.php';
	include 'includes/conexion_bd.php';
	$sql = "SELECT * FROM tipo_plan";
	$result = mysqli_query($mysqli, $sql);

	extract($_POST);

	if (isset($crear)) :
		$sql = "INSERT INTO planes_responsables (cod_plan, cod_resp, lugar, fecha) VALUES ('$codigoplan', '$responsable', '$lugar', '$fecha')";
		mysqli_query($mysqli, $sql);
?>
<script type="text/javascript">
	alert("Se ha asignado un nuevo curso con éxito");
	window.location="asignacion_planes.php";
</script>

<?php
	elseif (isset($consulta2)) : 
		$sql = "SELECT * FROM planes WHERE tipo_plan='$plan'";
		$result = mysqli_query($mysqli, $sql);
		$sql = "SELECT * FROM responsables";
		$resultado = mysqli_query($mysqli, $sql);
	?>

	<div class="container">
<?php
		include_once 'librerias/menu.php'; ?>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form action="asignacion_planes.php" method="POST">
					<legend>Resultado de la búsqueda</legend>
					<table class="table table-bordered">
						<tr class="bg-warning">
							<th class="text-center">Nombre</th>
							<th class="text-center">Descripción</th>
							<th class="text-center">UT</th>
							<th class="text-center">Acción</th>
						</tr>
						<?php while ($consulta = mysqli_fetch_array($result)) :
							echo "
							<tr>
								<td class='text-center'>$consulta[2]</td>
								<td class='text-center'>$consulta[3]</td>
								<td class='text-center'>$consulta[4]</td>
								<td class='text-center'><input type='radio' name='codigoplan' value='$consulta[0]' class='' /></td>
							</tr>";
						endwhile; ?>
					</table>
					
					<label>Responsable a asignar</label>
					<select required name="responsable" class="form-control">
						<option value=""> -- Seleccione -- </option>
						<?php while ($consulta1 = mysqli_fetch_array($resultado)) :
							echo "
							<option value='$consulta1[0]'>$consulta1[2] $consulta1[3]</option>";
						endwhile; ?>
					</select>

					<label>Lugar del curso</label>
					<input type="text" name="lugar" value="" class="form-control">
					<label>Fecha</label>
					<input name="fecha" type="date" class="form-control"><br>
					<div class="text-center">
						<button type="submit" name="crear" class="btn btn-danger">Crear</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<?php	include_once 'librerias/pie.php'; ?>


<?php	else :
?>
	<div class="container">
<?php
		include_once 'librerias/menu.php'; ?>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form action="asignacion_planes.php" method="POST">
					<legend>Planes a consultar</legend>
					<select name="plan" id="plan" class="form-control">
						<?php while ($consulta = mysqli_fetch_array($result)) : ?>
							<option value="<?php echo $consulta[0]; ?>"> <?php echo $consulta[1]; ?></option>
						<?php endwhile; ?>
					</select>
					<button type="submit" name="consulta2" class="btn btn-danger">Consultar</button>
				</form>
			</div>
		</div>
	</div>
<?php	include_once 'librerias/pie.php';
	endif;
?>
