<?php include_once 'cabecera.php'; ?>
<?php   include_once 'libs/menu.php'; ?>

	<section class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form method="POST" action="requisitos.php">
				<legend>Resultado de la búsqueda</legend>
				<?php
					extract($_POST);
					//EXTRAEMOS Y CONECTAMOS
					include 'config/conexion_bd.php';
					$sql="SELECT p.ced_part, p.nomb_part, p.apell_part FROM participantes p, planes_participantes pp WHERE pp.cod_par=p.cod_par AND pp.status = 'pre-inscrito' AND pp.cod_plan='$idplan'";
					$result=mysqli_query($mysqli,$sql);
					?>
		
				<input type="hidden" name="codigoplan" value="<?php echo $idplan; ?>"/>

				<table class="table table-bordered">
					<tr class="bg-warning">
						<th class="text-center">Cedula</th>
						<th class="text-center">Nombre</th>
						<th class="text-center">Apellido</th>
						<th colspan="3" class="text-center">Accion</th>
					</tr>
					<?php while ($consulta=mysqli_fetch_array($result)) :
						echo "
						<tr>
							<td class='text-center'>$consulta[0]</td>
							<td class='text-center'>$consulta[1]</td>
							<td class='text-center'>$consulta[2]</td>
							<td class='text-center' width='18%'><button type='submit' name='registrar' value='$consulta[0]' class='boton-sin-estilo'>Culminar Inscripcion</button></td>
							

							</tr>
							";

					endwhile; ?>
				</table>
				<div align="center">
					<button class="btn btn-sistema" type="button" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver</button>
				</div><br>
			</form>
		</div>
	</section>
<?php include_once 'pie.php'; ?>