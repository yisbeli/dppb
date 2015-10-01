<?php

	include 'includes/conexion_bd.php';
	extract($_POST);

	$sql = "SELECT p.nomb_plan, p.desc_plan, p.cant_unid FROM planes p, planes_responsables pr WHERE pr.cod_plan=p.cod_plan AND p.tipo_plan='$plan'";
	$result = mysqli_query($mysqli, $sql);
	
?>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<legend>Resultado de la búsqueda</legend>
			<form method="POST" action="participante.php">
				<input type="hidden" name="plan" value="<?php echo $plan; ?>" />
				<input required type="text" name="cedula" id="cedula" placeholder="Ingrese su cédula" pattern="\d{6,8}" maxlength="8" class="form-control" /><br>
				<table class="table table-bordered">
					<tr class="bg-warning">
						<th class="text-center">Nombre</th>
						<th class="text-center">Descripción</th>
						<th class="text-center">UT</th>
						<th class="text-center">Acción</th>
					</tr>
					<?php while ($consulta = mysqli_fetch_array($result)) :
						echo "
						<tr>
							<td class='text-center'>$consulta[0]</td>
							<td class='text-center'>$consulta[1]</td>
							<td class='text-center'>$consulta[2]</td>
							<td class='text-center' width='18%'><button type='submit' name='registro' value='$consulta[0]' class='boton-sin-estilo'>Pre-inscribir</button></td>
						</tr>";
					endwhile; ?>
				</table>
			</form>
			<div align="center">
				<button class="btn btn-danger" type="button" onclick=location="index.php">Regresar a la página anterior</button>
			</div><br>
		</div>
	</div>