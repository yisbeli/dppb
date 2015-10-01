<?php include_once 'librerias/cabecera.php';?>
<div class="container">
<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form method="POST" action="requisitos.php">
			<legend>Resultado de la búsqueda</legend>
			<?php
				extract($_POST);
				//EXTRAEMOS Y CONECTAMOS
				require_once 'includes/conexion_bd.php';
				
				$sql="SELECT participantes.ced_part, participantes.nomb_part, participantes.apell_part  FROM participantes,planes_participantes WHERE planes_participantes.cod_par=participantes.cod_par AND planes_participantes.status = 'pre-inscrito' AND planes_participantes.cod_plan='$registro'";
				$result=mysqli_query($mysqli,$sql);
			?>
			<input type="hidden" name="codigoplan" value=" <?php echo $registro ?>"/>

				<table class="table table-bordered">
					<tr class="bg-warning">
						<th class="text-center">Cedula</th>
						<th class="text-center">Nombre</th>
						<th class="text-center">Apellido</th>
						<th class="text-center">Accion</th>
					</tr>
					<?php while ($consulta=mysqli_fetch_array($result)) :
						echo "
						<tr>
							<td class='text-center'>$consulta[0]</td>
							<td class='text-center'>$consulta[1]</td>
							<td class='text-center'>$consulta[2]</td>
							<td class='text-center' width='18%'><button type='submit' name='registrar' value='$consulta[0]' class='boton-sin-estilo'>Culminar Inscripcion</button></td>
						</tr>";
					endwhile; ?>
				</table>
		</div>
</div>
<?php include_once 'librerias/pie.php'; ?>