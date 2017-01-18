<?php include_once 'cabecera.php'; ?>
	<section class="container">
		<div class="rows">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2 class="text-center">Reporte mensual personas capacitadas</h2>
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
						}else{
					?>

						<table border="2" class="table table-bordered">
						<tr class="bg-warning">
							<th>Nombre del plan de formacion</th>
							<th>Fecha inicio</th>
							<th>Fecha final</th>
							<th>Cantidad personas capacitadas</th>
						</tr>
						

						<?php
						$sql = "SELECT * FROM planes_responsables WHERE Fecha_inicio >= '".$ano."-".$mes."-01' AND Fecha_inicio <= '".$ano."-".$mes."-31' ORDER BY Fecha_inicio ASC";
						$resultado= mysqli_query($mysqli,$sql);

						$i = 0;

						 while ($result=mysqli_fetch_array($resultado)) :

						 	$sql = "SELECT nomb_plan FROM planes WHERE cod_plan = '".$result[1]."'";
							$consulta_nombre_plan = mysqli_query($mysqli, $sql);
							$nombrePlan = mysqli_fetch_array($consulta_nombre_plan);

							$sql = "SELECT count(cod_par) FROM planes_participantes WHERE cod_plan = '".$result[1]."'";
							$consulta = mysqli_query($mysqli, $sql);
							$participantes = mysqli_fetch_array($consulta);
							?>

							<tr class="text-center">
								<td><?php echo "$nombrePlan[0]"; ?></td>
								<td><?php echo "$result[5]"; ?></td>
								<td><?php echo "$result[6]"; ?></td>
								<td><?php echo "$participantes[0]"; ?></td>
							</tr>
					<?php $i += $participantes[0] ; endwhile; ?>
					<tr class="bg-warning">
							<th colspan="3"> Total personas capacitadas</th>
							<th class="text-center"><?php echo $i; ?></th>
					</tr>

					</table>
				<?php } ?>
				<form method="POST" action="personas_capacitadas_pdf.php">

					<input  type="hidden" name="mes" value="<?php echo $mes;  ?>">
					<input type="hidden" name="ano" value="<?php echo $ano ?>">

					<div class="text-center">
						<button class="btn btn-sistema" type="button" onclick=location="personas_capacitadas_mes.php">Regresar a la pagina principal</button>					
						<button class="btn btn-sistema" type="submit" target="_blank" >Imprimir</button>					
					</div><br>
				</form>
			</div>
		</div>
	</div>
</section>
<?php include_once 'pie.php'; ?>