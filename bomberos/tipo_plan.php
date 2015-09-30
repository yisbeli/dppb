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

						$command_sql="INSERT INTO tipo_plan(nomb_plan) VALUES ('$nomb_plan')";
						require 'includes/sql.php';

				     ?>
					 <script type="text/javascript">
					 	alert(" Tipo de Plan registrado con Exito!");
					 	window.location="sala.php"
					 </script>

					<?php else : ?>						
						<label for="nomb_plan">Nombres: </label>
						<input class="form-control" type="text" maxlength="90" name="nomb_plan" placeholder="Ingrese Nombre del Plan" required patter="^[a-zA-Z]{3,15}" title="Ingrese nombre del tipo de plan" />
						<br>

						<div class="buttons text-center">
							<button class="btn btn-danger" type="reset" title="Haga clic para limpiar formulario" >Limpiar Formulario</button>
							<button type="submit" name="registro" value="registro" title="Haga clic para Registrar" class="btn btn-danger">Registrar</button>
						</div><br>	
				</form>
			</div>
		</div>
	</div>
  
<?php
					endif;
	include_once 'librerias/pie.php'; ?>    