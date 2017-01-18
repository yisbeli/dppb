<?php include_once 'cabecera.php';?>
<?php 	include_once 'libs/menu.php'; ?>
<?php 	include_once 'inactivo.php';
		include_once 'sesion.php'; ?>
	<section class="container planes_registro">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h2>Registro de planes de formación</h2><br>
				<form method="POST" action="planes_registro.php">
			
					<?php extract($_POST);
					if (isset($registro)) :
						//EXTRAEMOS Y CONECTAMOS
						include 'config/conexion_bd.php';
						
						$sentencia="SELECT MAX(id_unid) FROM unidades_trib";
						$consultado=mysqli_query($mysqli,$sentencia);
						$resultado2=mysqli_fetch_array($consultado);
						
						//INSERTAMOS
						$command_sql = "INSERT INTO planes (tipo_plan, nomb_plan, desc_plan, cant_unid, id_unid) VALUES ('$tipo_plan','$nomb_plan','$desc_plan','$cant_unid', '$resultado2[0]')";
						require 'config/sql.php';
					?>
					<script type="text/javascript">
						alert("Plan registrado con éxito!");
						window.location="asignacion_planes.php";
					</script>
					<?php
						else :
						require_once 'config/conexion_bd.php';
						$command_sql = "SELECT * FROM tipo_plan";
						require 'config/sql.php';
					?>
					<!-- Tipo del Plan de formacion -->
					<div class="row">
						<div class="col-md-6">
							<label>Tipo de plan de formacion: </label><br>
							<select name="tipo_plan" class="form-control" required>
								<option name="tipo_plan" value="" selected disabled> -- Seleccione -- </option>
							<?php
								while($registro=mysqli_fetch_array($result))
								{
							?>
								<option name="tipo_plan" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
							<?php } ?>
							</select><br>
						</div>
						<!-- Nombre del Plan de Formacion -->
						<div class="col-md-6">
							<label for="nomb_plan">Nombre del plan de formacion: </label>
							<input class="form-control" type="text" name="nomb_plan" maxlength="50" size="44" placeholder="Ingrese un Nombre de Plan de Formacion" required pattern="[A-Za-z ]+" title="Solo caracteres y espacios" required/><br>
						</div>
					</div>
					<!-- Descripcion del plan  -->
					<div class="row">
						<div class="col-md-6">
							<label for="desc_plan">Descripcion del plan de formacion: </label>
							<input class="form-control"type="text" name="desc_plan" placeholder="Ingrese la descripcion del plan de formacion" required pattern="[A-Za-z ]+"/><br>
						</div>
						<!-- Unidades tributarias-->
						<div class="col-md-6">		
							<label for="cant_uni">Cant. de unidad(es) tributaria(s): </label>
							<input class="form-control" type="number" name="cant_unid" maxlength="10" size="44" placeholder="Ingrese la cantidad de UT a cancelar" required>
						</div>
					</div>
					<!-- Botones -->
					<div class="row">
						<div class="col-md-4 text-left">					
							<button class="btn btn-sistema" type="button" title="volver" onclick=location="sala.php"><span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>
						</div>
						<div class="col-md-4 text-center">
							<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"><span class="glyphicon glyphicon-repeat"></span> Limpiar Formulario</button>
						</div>
						<div class="col-md-4 text-right">
							<button type="submit" name="registro" value="registro" title="Haga clic para Registrar un Plan" class="btn btn-sistema"> <span class="glyphicon glyphicon-floppy-saved"> </span> Guardar </button>
						</div>
					</div>
				</form>
			</div>
		</div>
</section>						
<?php
	endif;
include_once 'pie.php';  ?>