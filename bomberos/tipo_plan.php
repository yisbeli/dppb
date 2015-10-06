<?php
	include_once 'librerias/cabecera.php';
?>

	<div class="container">
	<?php 	include_once 'librerias/menu.php'; ?>
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Registro de tipo de planes</h2>
				<form method="POST" action="tipo_plan.php" >
					<?php
						extract($_POST);
						if(isset($registro)):

						//EXTRAEMOS Y CONECTAMOS
						require_once 'includes/conexion_bd.php';

						$command_sql="INSERT INTO tipo_plan(nomb_plan, evaluacion) VALUES ('$nomb_plan', '$Evaluacion')";
						require 'includes/sql.php';

				     ?>
					 <script type="text/javascript">
					 	alert(" Tipo de Plan registrado con Exito!");
					 	window.location="tipo_plan.php"
					 </script>
					<?php else : ?>

						<h3>Tipo de planes</h3>
						<label for="nomb_plan">Nombres: </label>
						<input class="form-control" type="text" maxlength="90" name="nomb_plan" placeholder="Ingrese Nombre del Plan" required patter="^[a-zA-Z]{3,15}" title="Ingrese nombre del tipo de plan" />
						<br>
						<label>Evaluacion: </label>
						<select name="Evaluacion" class="form-control">
							<option value="si">Si</option>
							<option value="no">No</option>
						</select>
						<br>


						<div class="buttons text-center">
							<button class="btn btn-warning" type="reset" title="Haga clic para limpiar formulario" >Limpiar Formulario</button>
							<button type="submit" name="registro" value="registro" title="Haga clic para Registrar" class="btn btn-warning">Registrar</button>
						</div><br>	
				</form>
			</div>
		</div>
	</div>
  
<?php
					endif;
	include_once 'librerias/pie.php'; ?>    