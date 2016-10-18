<?php include_once 'cabecera.php'; ?>
	<section class="container">
		<div class="rows">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2 class="text-center">Reporte de planes dictados</h2>
				<form method="POST" action="">
					<?php 
						extract($_POST);

						if (empty($mes) || 	 empty($ano)) {
							?>
							<script type="text/javascript">
								alert("Debe seleccionar todos los campos requeridos");
								window.location="planes_dictados.php";
							</script>
							<?php
						}

						include_once 'config/conexion_bd.php';
						$sql = "SELECT * FROM planes_responsables WHERE Fecha_inicio >= '".$ano."-".$mes."-01' AND Fecha_inicio <= '".$ano."-".$mes."-31' ORDER BY Fecha_inicio ASC";
						$resultado= mysqli_query($mysqli,$sql);
						$result=mysqli_fetch_array($resultado);
						$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid) FROM unidades_trib)";
						$consultado=mysqli_query($mysqli,$sentencia);
						$resultado2=mysqli_fetch_array($consultado);

						if (empty($result)) {
							echo "<legend class='text-center'> No se encontro ningun registro </legend>";
						} else {
					?>

					<table border="2" class="table table-bordered">
						<tr class="bg-warning">
							<th>Nombre del plan de formacion</th>
							<th>Lugar</th>
							<th>Fecha inicio</th>
							<th>Fecha final</th>
						</tr>
						

						<?php
						$sql = "SELECT * FROM planes_responsables WHERE Fecha_inicio >= '".$ano."-".$mes."-01' AND Fecha_inicio <= '".$ano."-".$mes."-31' ORDER BY Fecha_inicio ASC";
						$resultado= mysqli_query($mysqli,$sql);

						$i = 0;

						 while ($result=mysqli_fetch_array($resultado)) :
						 	$sql = "SELECT nomb_plan FROM planes WHERE cod_plan = '".$result[1]."'";
							$consulta_nombre_plan = mysqli_query($mysqli, $sql);
							$nombrePlan = mysqli_fetch_array($consulta_nombre_plan)?>
							<tr class="text-center">
								<td><?php echo "$nombrePlan[0]"; ?></td>
								<td><?php echo "$result[3]"; ?></td>
								<td><?php echo "$result[5]"; ?></td>
								<td><?php echo "$result[6]"; ?></td>
							</tr>
					<?php $i++; endwhile; ?>
					<tr class="bg-warning">
							<th colspan="3"> Total planes dictados</th>
							<th><?php echo $i; ?></th>
					</tr>

					</table>
				<?php } ?>
				</form>
				<div class="text-center">
					<button class="btn btn-sistema" type="button" onclick=location="planes_dictados.php">Regresar a la pagina principal</button>					
				</div><br>
			</div>
		</div>
	</div>
</section>
<?php include_once 'pie.php'; ?>