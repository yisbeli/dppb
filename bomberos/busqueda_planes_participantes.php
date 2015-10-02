<?php
	include_once 'librerias/cabecera.php'; ?>
	<div class="container"><br>
	<?php include 'includes/conexion_bd.php';
		extract($_POST);
		$sql = "SELECT p.nomb_plan, p.desc_plan, p.cant_unid, pr.id FROM planes p, planes_responsables pr WHERE pr.cod_plan=p.cod_plan AND p.tipo_plan='$plan'";
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
						<th colspan="2" class="text-center">Ver</th>
					</tr>
					<?php while ($consulta =mysqli_fetch_array($result)) : ?>
						<tr>
							<td class='text-center'><?php  echo $consulta[0]; ?></td>
							<td class='text-center'><?php  echo $consulta[1]; ?></td>
							<td class='text-center'><?php  echo $consulta[2]; ?></td>
							<td class='text-center' width='10%'>
								<input type="hidden" name="plan" value="<?php echo $plan; ?>" />
								<button type='submit' name='registro' value='<?php echo $consulta[3]; ?>' class='boton-sin-estilo'>Pre-inscritos</button>
								<input type="hidden" name="plan" value="<?php echo $plan; ?>" />
								<button formaction="participantes_inscritos.php" type='submit' name='registro' value='<?php echo $consulta[3]; ?>' class='boton-sin-estilo'>Inscritos</button>
							</td>
						</tr>
					<?php endwhile; ?>
				</table>
			</form>
			<div align="center">
				<button class="btn btn-danger" type="button" onclick=location="sala.php">Regresar a la página anterior</button>
			</div><br>
		</div>
	</div>

	</div>
<?php	include_once 'librerias/pie.php'; ?>