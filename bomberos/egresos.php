<?php include("librerias/cabecera.php"); ?>
	<div class="container">
		<div class="rows">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2 class="text-center">Reporte total egresos</h2>
					<h3>Tipo de egresos: </h3>
						<?php 

							$sql=("SELECT * FROM egresos");
							include_once 'includes/conexion_bd.php';
							$result=mysqli_query($mysqli,$sql);	


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
							
							while ($resulta=mysqli_fetch_array($result)):
								
							
									echo "
										<tr class='text-center'>
											<td>$resulta[1]</td>
											<td>$resulta[2]</td>
											<td>$resulta[3]</td>
											<td>$resulta[4]</td>
										</tr>";
										endwhile;	
							?></table>
							<div class="text-center">
								<button class="btn btn-warning" type="button" onclick=location="sala.php">Regresar al menu</button>		
							</div><br>
			</div>
		</div>
	</div>
<?php include_once 'librerias/pie.php'; ?>