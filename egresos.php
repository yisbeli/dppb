<?php include_once 'cabecera.php';  ?>
	<section class="container">
		<div class="rows">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2 class="text-center">Reporte total de egresos</h2>
					<h3>Tipo de egresos: </h3>
					<form method="POST" action="">
						<?php 
						extract($_POST);

						if (empty($mes) || 	 empty($ano)) {
							?>
							<script type="text/javascript">
								alert("Debe seleccionar todos los campos requeridos");
								window.location="egresos_mes.php";
							</script>
							<?php
						}

							include_once 'config/conexion_bd.php';
							$sql=("SELECT * FROM egresos WHERE fech_egr >= '".$ano."-".$mes."-01' AND fech_egr <= '".$ano."-".$mes."-31' ORDER BY fech_egr ASC");
							$resultado=mysqli_query($mysqli,$sql);	
							$result=mysqli_fetch_array($resultado);
							$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid) FROM unidades_trib)";
							$consultado=mysqli_query($mysqli,$sentencia);
							$resultado2=mysqli_fetch_array($consultado);


						if (empty($result)) {
							echo "<legend class='text-center'> No se encontro ningun registro </legend>";
						} else {


								echo "<table class='table table-bordered'>
										<tr class='bg-warning'>
											<th colspan='4' class='text-center'>Egresos</th>
										</tr>
										<tr>
											<th class='text-center'>Fecha</th>
											<th class='text-center'>Descripcion</th>
											<th class='text-center'>Monto</th>
											<th class='text-center'>Factura #</th>
										</tr>";
							$sql=("SELECT * FROM egresos WHERE fech_egr >= '".$ano."-".$mes."-01' AND fech_egr <= '".$ano."-".$mes."-31' ORDER BY fech_egr ASC");
							$resultado=mysqli_query($mysqli,$sql);
							while ($result=mysqli_fetch_array($resultado)): 
								
							
									echo "<tr class='text-center'>
											<td>$result[1]</td>
											<td>$result[2]</td>
											<td>$result[3]</td>
											<td>$result[4]</td>
										</tr>";
										endwhile;	
							?>
				</table>
				<?php } ?>
				</form>
				<div class="text-center">
					<button class="btn btn-sistema" type="button" onclick=location="egresos_mes.php">Regresar a la pagina principal</button>					
				</div><br>
			</div>
		</div>
	</div>
</section>
<?php include_once 'pie.php'; ?>