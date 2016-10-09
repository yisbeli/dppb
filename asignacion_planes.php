<?php	include_once 'cabecera.php';
	include 'config/conexion_bd.php';
	$sql = "SELECT * FROM tipo_plan";
	$result = mysqli_query($mysqli, $sql);

	extract($_POST);

	if (isset($crear)):
		$inicio=date("Y-m-d",strtotime($fecha_inicio));
		$fin=date("Y-m-d",strtotime($fecha_fin));
		$sql = "INSERT INTO planes_responsables (cod_plan, cod_resp, lugar, fecha_inicio, fecha_fin, idstatus) VALUES ('$codigoplan', '$responsable', '$lugar', '$inicio', '$fin', '$nomb_status')";
		echo $sql;
		$cirabel=mysqli_query($mysqli, $sql);
			 if($cirabel){ 
							echo'
								<script type="text/javascript">
								alert("SE HA ASIGNADO EL RESPONSABLE AL PLAN DE FORMACION CON EXITO!");
								window.location="asignacion_planes.php";
								</script>
								';
						}
			else {
				echo'<script type="text/javascript">
								alert("No ha sido posible asignar el plan al responsable");
								window.location="asignacion_planes.php";
								</script>';
			}

?>

<?php
	elseif (isset($consulta2)) : 
		$sql = "SELECT * FROM planes WHERE tipo_plan='$plan'";
		$result = mysqli_query($mysqli, $sql);
		$sql = "SELECT * FROM responsables";
		$resultado = mysqli_query($mysqli, $sql);
		$sql = "SELECT * FROM statuspl";
		$res = mysqli_query($mysqli, $sql);

	?>
<?php include_once 'libs/menu.php';?>
	<section class="container asignacionP">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form action="asignacion_planes.php" method="POST">
					<legend>Resultado de la búsqueda</legend>
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
								<td class='text-center'>".$consulta[2]."</td>
								<td class='text-center'>".$consulta[3]."</td>
								<td class='text-center'>".$consulta[4]."</td>
								<td class='text-center'><input type='radio' name='codigoplan' value='".$consulta[0]."' class='' /></td>
							</tr>";
						endwhile; ?>
					</table>
					<div class="col-md-6">
						<label>Responsable a asignar</label>
						<select required name="responsable" class="form-control">
							<option value=""> -- Seleccione -- </option>
							<?php while ($consulta1 = mysqli_fetch_array($resultado)) :
							echo "
							<option value='$consulta1[0]'>$consulta1[2] $consulta1[3]</option>";
							endwhile; ?>
						</select>
					</div>

					<div class="col-md-6">
						<label>Lugar del curso</label>
						<input type="text" name="lugar" value="" class="form-control" placeholder="Lugar del Curso" required><br>
					</div>
					<div class="col-md-6">
						<label>Fecha de inicio</label>
						<input name="fecha_inicio" type="text" class="datepicker form-control" required><br>
					</div>

					<div class="col-md-6">
						<label>Fecha de culminacion</label>
						<input type="text" name="fecha_fin" class="datepicker2 form-control" required><br>
					</div>
					
					<div class="col-md-4">
						<label> Estatus del Plan</label>
						<select required name="status" class="form-control">
							<option value=""> -- Seleccione -- </option>
							<?php while ($consulta3= mysqli_fetch_array($res)) :
							echo "
							<option value='$consulta3[0]'>$consulta3[1]</option>";
							endwhile; ?>
						</select>
					</div>
					<div class="col-md-12">
					<div class="text-left">
						<button class="btn btn-sistema" type="reset" title="volver" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>
						<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>
						<button type="submit" name="crear" class="btn btn-sistema"><span class="glyphicon glyphicon-floppy-saved"></span> Asignar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<?php	include_once 'pie.php'; ?>


<?php	else :
?>
	
<?php
		include_once 'libs/menu.php'; ?> 
		<section class="container asignacionP">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form action="asignacion_planes.php" method="POST">
					<legend>Planes a consultar</legend>
					<select name="plan" id="plan" class="form-control">
						<?php while ($consulta = mysqli_fetch_array($result)) : ?>
							<option value="<?php echo $consulta[0]; ?>"> <?php echo $consulta[1]; ?></option>
						<?php endwhile; ?>
					</select><br>
					<div class="text-center">
						<button type="submit" name="consulta2" class="btn btn-sistema"> <span class="glyphicon glyphicon-search"> </span> Consultar</button>
					</div>
				</form>
			</div>
		</div>
	</section>
<?php	include_once 'pie.php';
	endif;
?>
