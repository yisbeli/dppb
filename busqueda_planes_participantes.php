<?php include_once 'cabecera.php'; ?>
<?php   include_once 'libs/menu.php'; ?>

	<section class="container"><br>
	<?php include 'config/conexion_bd.php';
	$plan=$_REQUEST['plan'];
	$sql = "SELECT p.nomb_plan, p.desc_plan, p.cant_unid, pr.id, pr.horario, pr.cod_resp, pr.Fecha_inicio, pr.Fecha_fin, pr.lugar, p.cod_plan, r.nomb_resp FROM planes p, planes_responsables pr, responsables r WHERE pr.idstatus='por-iniciar' AND pr.cod_plan=p.cod_plan AND r.cod_resp=pr.cod_resp AND p.tipo_plan='$plan'";
	$result = mysqli_query($mysqli, $sql);
		//extract($_POST);
	//$plan=1;
	//$sql="SELECT * FROM planes WHERE  tipo_plan='$plan'";
	//$result = mysqli_query($mysqli, $sql);
	?>		
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<legend>Resultado de la búsqueda</legend>
				<table class="table table-bordered">
					<tr class="bg-warning">
						<th class="text-center">Nombre</th>
						<th class="text-center">Descripción</th>
						<th class="text-center">Lugar</th>
						<th class="text-center">UT</th>
						<th class="text-center">Hora</th>
						<th class="text-center">Responsable</th>


						<th colspan="2" class="text-center">Ver</th>
						<th colspan="2" class="text-center">Accion</th>
					</tr>
					<?php while ($consulta =mysqli_fetch_array($result)) : ?>
						<tr>
							<td class='text-center'><?php  echo $consulta[0]; ?></td>
							<td class='text-center'><?php  echo $consulta[1]; ?></td>
							<td class='text-center'><?php  echo $consulta[8]; ?></td>
							<td class='text-center'><?php  echo $consulta[2]; ?></td>
							<td class='text-center'><?php  echo $consulta[4]; ?></td>
							<td class='text-center'><?php  echo $consulta[10]; ?></td>
							<td class='text-center' width='10%'>
								<form method="POST" action="participantes_pre_inscritos.php">
									<input type="hidden" name="plan" value="<?php echo $plan; ?>" />
									<input type="hidden" name="idplan" value="<?php echo $consulta[9]; ?>">
									<button type='submit' name='registro' class='boton-sin-estilo'>Pre-inscritos</button>
								</form>
							</td>
							<td class='text-center' width='10%'>
								<form method="POST" action="participantes_inscritos.php">
									<input type="hidden" name="idplan" value="<?php echo $consulta[9]; ?>">
									<input type="hidden" name="plan" value="<?php echo $plan; ?>" />
									<button type='submit' name='registro' class='boton-sin-estilo'>Inscritos</button>
								</form>
							</td>
							<td class='text-center' width='10%'>
								<form method="POST" action="modificar_plan.php">
									<input type="hidden" name="cp" value="<?php echo $consulta[9]; ?>">
									<button type='submit' name='registro' class='boton-sin-estilo'> <span class="glyphicon glyphicon-pencil"></span></button>
								</form>							
							</td>
								<td class='text-center' width='10%'>
								<form method="POST" action="eliminar_plan.php">
									<input type="hidden" name="cod_plan" value="<?php echo $consulta[9]; ?>">
									<button type='submit' name='registro' class='boton-sin-estilo' onclick="return confirm('Seguro que desea eliminar este plan?');"><span class="glyphicon glyphicon-trash"></span></button>
								</form>
							</td>
						</tr>
					<?php endwhile; ?>
				</table>
			<div align="center">
				<button class="btn btn-sistema" type="button" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al incio</button> 
			</div><br>
		</div>
	</div>
	</section>
<?php	include_once 'pie.php'; ?>
