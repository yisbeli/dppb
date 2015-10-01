<?php

	include 'includes/conexion_bd.php';
	extract($_POST);

	if (isset($consulta2)) :

	$sql = "SELECT p.nomb_plan, p.desc_plan, p.cant_unid, p.tipo_plan FROM planes p, planes_responsables pr WHERE pr.cod_plan=p.cod_plan AND p.tipo_plan='$plan'";
	$result = mysqli_query($mysqli, $sql);
?>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<legend>Resultado de la búsqueda</legend>
			<table class="table table-bordered">
				<tr class="bg-warning">
					<th class="text-center">Nombre</th>
					<th class="text-center">Descripción</th>
					<th class="text-center">UT</th>
				</tr>
		<?php		while ($consulta = mysqli_fetch_array($result)) :
					echo "
					<tr>
						<td class='text-center'>$consulta[0]</td>
						<td class='text-center'>$consulta[1]</td>
						<td class='text-center'>$consulta[2]</td>
					</tr>";
				endwhile; ?>
			</table>
		</div>
	</div>
<?php else :

	$sql = "SELECT * FROM tipo_plan";
	$result = mysqli_query($mysqli, $sql);

?>
	<form action='sala.php' method='POST'>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<legend>Planes a consultar</legend>
			<select required for='1' name='plan' class='form-control'>
				<option value=""> -- seleccione -- </option>
		<?php	while ($consulta = mysqli_fetch_array($result)) { ?>
					<option value="<?php echo $consulta[0]; ?>"><?php echo $consulta[1]; ?></option>
				<?php } ?>
			</select>
			<div class="text-right">
				<button type="submit" name="consulta2" class="btn btn-danger">Consultar</button>
			</div>
		</div>
	</div>
</form>
<br>

<?php endif; ?>