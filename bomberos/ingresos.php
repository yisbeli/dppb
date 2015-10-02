<?php	include_once 'librerias/cabecera.php'; ?>
	<div class="container">
	<?php 	include_once 'librerias/menu.php'; ?>
	<div class="rows">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h2>Reporte de Ingreso de dinero</h2>
			<form method="POST" action="consulta_plan_ingresos.php">
				<legend>Tipo de Plan de Formacion</legend>
				<?php 
					include_once 'includes/conexion_bd.php';
					$sql=("SELECT * FROM tipo_plan");
					$result=mysqli_query($mysqli,$sql);
				?>

				<select class="form-control" name="nomb_plan">
				<?php
				while($row= mysqli_fetch_array ($result)){ ?>
					<option value="<?php echo $row['idtipoplan']; ?>"><?php echo $row['nomb_plan']; ?></option>
				<?php } ?>
				</select>
				<div class="text-center">
					<button type="submit" name="submit" class="btn btn-warning">Enviar</button>					
				</div><br>
			</form>
		</div>
	</div>

	</div>
<?php include("librerias/pie.php"); ?>