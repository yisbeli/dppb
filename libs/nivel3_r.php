<?php
	include ('config/conexion_bd.php');
	$plan=$_REQUEST['plan'];
	$sql = "SELECT p.nomb_plan, p.desc_plan, p.cant_unid, pr.id, pr.horario, pr.cod_resp, pr.Fecha_inicio, pr.Fecha_fin, pr.lugar, p.cod_plan FROM planes p, planes_responsables pr WHERE pr.idstatus='0' AND pr.cod_plan=p.cod_plan AND p.tipo_plan='$plan'";
	$result = mysqli_query($mysqli, $sql);
?>
	<div class="row">
		<div class="col-md-10 col-md-offset-1 text-center">
			<legend>Resultado de la búsqueda</legend>
				<table class="table table-bordered table-hover">
					<tr class="bg-cabecera">
						<th class="text-center">Nombre</th>
						<th class="text-center">Descripción</th>
						<th class="text-center">Lugar</th>
						<th class="text-center">UT</th>
						<th class="text-center">Hora</th>
						<th class="text-center">Fecha Inicio</th>
						<th class="text-center">Fecha Culminacion</th>
						<th class="text-center">Responsable</th>
						<th class="text-center">Acción</th>
					</tr>
					<?php while ($consulta = mysqli_fetch_array($result)) :
						$sql= "SELECT r.nomb_resp, r.apell_resp FROM responsables r WHERE r.cod_resp='$consulta[5]'";
						$r = mysqli_query($mysqli, $sql);
						$responsable=mysqli_fetch_array($r);
						echo "
						<tr>
							<td class='text-center'>$consulta[0]</td>
							<td class='text-center'>$consulta[1]</td>
							<td class='text-center'>$consulta[8]</td>
							<td class='text-center'>$consulta[2]</td>
							<td class='text-center'>$consulta[4]</td>
							<td class='text-center'>$consulta[6]</td>
							<td class='text-center'>$consulta[7]</td>
							<td class='text-center'>$responsable[0] $responsable[1]</td>
							<td class='text-center' width='18%'>
								<form method='POST' action='participante.php'>
									<input type='hidden' name='plan' value=".$plan." />
									<input type='hidden' name='cod_plan' value='$consulta[9]'> 
									<button type='submit' name='registro'  class='boton-sin-estilo'>Pre-inscribir</button>
								</form>
							</td>

							
						</tr>";
					endwhile; ?>

				</table>
			<div align="text-center">
				<div align="left">
				<button class="btn btn-sistema" type="button" onclick=location="home.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>
			</div>
			</div><br>
		</div>
	</div>