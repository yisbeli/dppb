<?php include_once 'cabecera.php'; ?>
	<section class="container">
		<div class="rows">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2 class="text-center">Reporte de ingresos</h2>
				<form method="POST" action="">
					<?php 
						extract($_POST);
						include_once 'config/conexion_bd.php';
						$sql="SELECT * FROM planes WHERE tipo_plan='$nomb_plan'";
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
							<th>Nombre</th>
							<th>Descripcion</th>
							<th>Cantidad UT</th>
							<th>Valor UT</th>
							<th>Total a cancelar</th>
						</tr>
						<?php
						$sql="SELECT * FROM planes WHERE tipo_plan='$nomb_plan'";
						$resultado= mysqli_query($mysqli,$sql);
						 while ($result=mysqli_fetch_array($resultado)) : ?>
						<tr class="text-center">
							<td><?php echo "$result[2]"; ?></td>
							<td><?php echo "$result[3]"; ?></td>
							<td><?php echo "$result[4]"; ?></td>
							<td><?php echo "$resultado2[0]"; ?></td>
							<td><?php echo $result[4]*$resultado2[0]; ?></td>
						</tr>
					<?php endwhile; } ?>
					</table>
				</form>
				<div class="text-center">
					<button class="btn btn-sistema" type="button" onclick=location="ingresos.php">Regresar a la pagina principal</button>					
				</div><br>
			</div>
		</div>
	</div>
</section>
<?php include_once 'pie.php'; ?>