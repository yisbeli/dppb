<?php	include_once 'cabecera.php'; ?>
	<section class="container">
	<?php 	include_once 'libs/menu.php'; ?>
	<div class="rows">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h2>Reporte de ingreso de dinero</h2>
			<form method="POST" action="consulta_plan_ingresos.php">
				<legend>Tipo de plan de formacion</legend>
				<?php 
					include_once 'config/conexion_bd.php';
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
					<button type="submit" name="submit" class="btn btn-sistema">Enviar</button>					
				</div><br>
			</form>
		</div>
	</div>
</section>
<?php include_once 'pie.php'; ?>