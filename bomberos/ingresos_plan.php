<?php include("librerias/cabecera.php"); ?>
	<div class="container">
		<div class="rows">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2 class="text-center">Reporte total ingresos</h2>
					<h3>Tipo de Plan de Formacion: </h3>
						<?php 

							$sql=("SELECT * FROM tipo_plan");
							include_once 'includes/conexion_bd.php';

							$result=mysqli_query($mysqli,$sql);							

							$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid)FROM unidades_trib)";
							$consultado=mysqli_query($mysqli,$sentencia);
							$resultado2=mysqli_fetch_array($consultado);
							$acu2=0;
							while($row= mysqli_fetch_array($result)){


								$sql1=("SELECT p.nomb_plan, p.desc_plan, p.cant_unid,pr.cod_plan FROM planes_responsables pr, planes p WHERE p.tipo_plan='$row[0]' AND p.cod_plan=pr.cod_plan");
								$result1=mysqli_query($mysqli,$sql1);


								echo "<table class='table table-bordered'>
										<tr class='bg-warning'>
											<th colspan='6' class='text-center'>$row[1]</th>
										</tr>
											<th class='text-center'>Nombre</th>
											<th class='text-center'>Descripcion</th>
											<th class='text-center'>Cantidad UT</th>
											<th class='text-center'>Valor UT</th>
											<th class='text-center'>Cant. participantes</th>
											<th class='text-center'>Monto total</th>
										</tr>

								";
								$acu=0;
								while ($result2=mysqli_fetch_array($result1)){
								$sql1=("SELECT COUNT(*) FROM planes_participantes WHERE cod_plan='$result2[3]' AND planes_participantes.status='inscrito'");
								$consultado=mysqli_query($mysqli,$sql1);
								$res=mysqli_fetch_array($consultado);

									$variable=$resultado2[0]*$result2[2];
									$var=$variable*$res[0];
									$acu+=$var;
									echo "
										<tr class='text-center'>
											<td>$result2[0]</td>
											<td>$result2[1]</td>
											<td>$result2[2]</td>
											<td>$resultado2[0]</td>
											<td>$res[0]</td>							
											<td>$var</td>
										</tr>";
								}

								echo "<tr><td colspan='5'><b>Total</b></td>
								<td>$acu</td></tr>
								</table> <br>";
								$acu2+=$acu;
							}
						?>
						<table border="4" class="table table-bordered" class="text-center">
							<tr class="bg-warning" class="text-center">
								<td colspan="2"> Total Ingreso de dinero </td>
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