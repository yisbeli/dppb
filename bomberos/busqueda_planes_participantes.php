<?php	include_once 'librerias/cabecera.php'; ?>
	<div class="container"><br>

	<?php include 'includes/conexion_bd.php';
		extract($_POST);

		$sql = "SELECT * FROM planes WHERE tipo_plan='$plan'";
		$result = mysqli_query($mysqli, $sql);
	?>		
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<legend>Resultado de la búsqueda</legend>
			<form method="POST" action="participantes_pre_inscritos.php">
				<input type="hidden" name="plan" value="<?php echo $plan; ?>" />
				<table class="table table-bordered">
					<tr class="bg-warning">
						<th class="text-center">Nombre</th>
						<th class="text-center">Descripción</th>
						<th class="text-center">UT</th>
						<th class="text-center">Ver</th>
					</tr>
					<?php while ($consulta = mysqli_fetch_array($result)) :
						echo "
						<tr>
							<td class='text-center'>$consulta[2]</td>
							<td class='text-center'>$consulta[3]</td>
							<td class='text-center'>$consulta[4]</td>
							<td class='text-center' width='18%'><button type='submit' name='registro' value='$consulta[0]' class='boton-sin-estilo'>Participantes Pre-inscritos</button></td>
						</tr>";
					endwhile; ?>
				</table>
			</form>
			<div align="center">
				<button class="btn btn-danger" type="button" onclick=location="sala.php">Regresar a la página anterior</button>
			</div><br>
		</div>
	</div>

	</div>
<?php	include_once 'librerias/pie.php'; ?>
