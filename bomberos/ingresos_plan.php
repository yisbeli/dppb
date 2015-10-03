<?php include("librerias/cabecera.php"); ?>
	<div class="container">
		<div class="rows">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2 class="text-center">Reporte total ingresos</h2>
					<h3>Tipo de plan de formacion: </h3>
						<?php 

							$sql=("SELECT * FROM tipo_plan");
							include_once 'includes/conexion_bd.php';

							$result=mysqli_query($mysqli,$sql);							

							$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid)FROM unidades_trib)";
							$consultado=mysqli_query($mysqli,$sentencia);
							$resultado2=mysqli_fetch_array($consultado);
							$acu2=0;
							while($row= mysqli_fetch_array($result)){

								$sql1=("SELECT * FROM planes WHERE tipo_plan=$row[0]" );
								$result1=mysqli_query($mysqli,$sql1);
								echo "<table class='table table-bordered'>
										<tr class='bg-warning'>
											<th colspan='5' class='text-center'>$row[1]</th>
										</tr>
										<th class='text-center'>Nombre</th>
										<th class='text-center'>Descripcion</th>
										<th class='text-center'>Cantidad UT</th>
										<th class='text-center'>Valor UT</th>
										<th class='text-center'>Monto a cancelar</th>
										</tr>

								";
								$acu=0;
								while ($result2=mysqli_fetch_array($result1)){
									$variable=$resultado2[0]*$result2[4];
									$acu+=$variable;
									echo "
										<tr class='text-center'>
											<td>$result2[2]</td>
											<td>$result2[3]</td>
											<td>$result2[4]</td>
											<td>$resultado2[0]</td>
											<td>$variable</td>
										</tr>";
								}

								echo "<tr><td colspan='4'><b>Total</b></td>
								<td>$acu</td></tr>
								</table> <br>";
								$acu2+=$acu;
							}
						?>
						<table border="4" class="table table-bordered" class="text-center">
							<tr class="bg-warning" class="text-center">
								<td colspan="2"> Total ingreso de dinero </td>
							</tr>
							<tr>
								<td><b>Total</b></td>
								<td><?php echo "$acu2"; ?></td>
							</tr>
						</table>
				 </div>
				</div>
				</div>

				<div class="text-center">
					<button class="btn btn-warning" type="button" onclick=location="sala.php">Regresar al menu</button>		
				</div><br>
<?php include_once 'librerias/pie.php'; ?>