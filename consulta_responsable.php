<?php	include_once 'cabecera.php'; ?>
<?php   include_once 'libs/menu.php'; ?>
<?php include 'config/conexion_bd.php';?>
	
	<?php
	//$responsable=$_REQUEST['responsable'];
	$sql = "SELECT nomb_resp, apell_resp, ced_resp, cod_resp, espe_resp, id_nivel FROM responsables";
	$result= mysqli_query($mysqli, $sql);
	?>
	
	
	<section class="container"><br>	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<legend>Responsables</legend>
				<table class="table table-bordered">
					<tr class="bg-warning">
						<th class="text-center">Nombre</th>
						<th class="text-center">Apellido</th>
						<th class="text-center">Cedula</th>
						<th class="text-center">Codigo</th>
						<th class="text-center">Especialidad</th>
						<th class="text-center">Codigo Nivel</th>
						<th colspan="2" class="text-center">Accion</th>
	

				</tr>
					<?php while ($consulta= mysqli_fetch_array($result)) : ?>
						<tr>
							<td class='text-center'><?php  echo $consulta[0]; ?></td>
							<td class='text-center'><?php  echo $consulta[1]; ?></td>
							<td class='text-center'><?php  echo $consulta[2]; ?></td>
							<td class='text-center'><?php  echo $consulta[3]; ?></td>
							<td class='text-center'><?php  echo $consulta[4]; ?></td>
							<td class='text-center'><?php  echo $consulta[5]; ?></td>
							<td class="text-center"><a href='modificar_responsable.php?ce=<?=$consulta[2]?>'><span class="glyphicon glyphicon-pencil"></span></a></td>
							<td class="text-center"><a href='eliminar_responsable.php?eu=<?php echo $consulta[2]; ?>'><span class="glyphicon glyphicon-trash" onclick="return confirm('Seguro que Desea Eliminar este Responsable?');"></span></a></td>
						</tr>
					<?php endwhile; ?>
				</table>
			<div align="left">
				<button class="btn btn-sistema" type="button" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al incio</button>
			</div><br>
		</div>
	</div>
	</section>
<?php include_once 'pie.php'; ?>