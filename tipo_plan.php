<?php include_once 'cabecera.php';?>
<?php 	include_once 'libs/menu.php'; ?>
<?php 	include_once 'inactivo.php';
		include_once 'sesion.php'; ?>
		
	<section class="container">
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Registro de tipo de planes</h2>
				<form method="POST" action="tipo_plan.php" >
					<?php
						extract($_POST);
						if(isset($registro)):

						//EXTRAEMOS Y CONECTAMOS
						require_once 'config/conexion_bd.php';

						$command_sql="INSERT INTO tipo_plan(nomb_plan, evaluacion) VALUES ('$nomb_plan', '$Evaluacion')";
						require 'config/sql.php';

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
						<select name="Evaluacion" class="form-control" required>
							<option selected disabled value=""> --Seleccione-- </option>
							<option value="si">Si</option>
							<option value="no">No</option>
						</select>
						<br>


						<div class="buttons text-center">
							<button class="btn btn-sistema" type="reset" title="volver" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>
						<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>
							<button type="submit" name="registro" value="registro" title="Haga clic para Registrar" class="btn btn-sistema"><span class="glyphicon glyphicon-floppy-saved"></span> Guardar </button>
						</div><br>	
				</form>
			</div>
		</div>
	</div>
  </section>
<?php
					endif;
	include_once 'pie.php';  ?>    