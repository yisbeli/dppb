<?php include_once 'librerias/cabecera.php';
?>
	<div class="container">
	<?php 	include_once 'librerias/menu.php'; ?>
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Registro de planes de formación</h2><br>
				<form method="POST" action="planes_registro.php">
			
					<?php
						extract($_POST);
						if (isset($registro)) :
						//EXTRAEMOS Y CONECTAMOS
						require_once 'includes/conexion_bd.php';
						
						$sentencia="SELECT MAX(id_unid) FROM unidades_trib";
						$consultado=mysqli_query($mysqli,$sentencia);
						$resultado2=mysqli_fetch_array($consultado);
						
						//INSERTAMOS
						$command_sql = "INSERT INTO planes (tipo_plan, nomb_plan, desc_plan, cant_unid, id_unid) VALUES ('$tipo_plan','$nomb_plan','$desc_plan','$cant_unid', '$resultado2[0]')";
						require '../includes/sql.php';
					?>
					<script type="text/javascript">
						alert("Plan registrado con éxito!");
						window.location="planes_registro.php";
					</script>
					<?php
						else :
						require_once 'includes/conexion_bd.php';
						$command_sql = "SELECT * FROM tipo_plan";
						require 'includes/sql.php';
					?>
					<!-- Tipo del Plan de formacion -->
					<label>Tipo de plan de formacion: </label><br>
					<select name="tipo_plan" class="form-control">
						<option name="tipo_plan" value=""> -- Seleccione -- </option>
					<?php
						while($registro=mysqli_fetch_array($result))
						{
					?>
						<option name="tipo_plan" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
					<?php } ?>
					</select><br>
					
					<!-- Nombre del Plan de Formacion -->
					<label for="nomb_plan">Nombre del plan de formacion: </label>
					<input class="form-control" type="text" name="nomb_plan" maxlength="50" size="44" placeholder="Ingrese un Nombre de Plan de Formacion" requi patter ="^[A-Z][a-Z]{3,15}(\s*[A-Z][a-Z]{3,15})*" title="Ingrese un nombre" /><br>
					
					<!-- Descripcion del plan  -->
					<label for="desc_plan">Descripcion del plan de formacion: </label>
					<textarea class="form-control" name="desc_plan" id="" rows="5" cols="40" placeholder="Ingrese la descripcion del plan de formacion "></textarea><br>
							
					<label> Cantidad de unidad(es) tributaria(s): </label>
					<input class="form-control" type="text" name="cant_unid" maxlength="50" size="44" placeholder="Ingrese la cantidad de UT a cancelar">
					
					<!-- Botones --><br>
					<div class="buttons" align="center">
						<button class="btn btn-warning" type="reset" title="Haga clic para limpiar formulario" >Limpiar Formulario</button>
						<button type="submit" name="registro" value="registro" title="Haga clic para Registrar un Plan" class="btn btn-warning">Registrar plan</button>
					</div>
				</form>
			</div>
		</div>
	</div>
						

<?php
	endif;
include_once 'librerias/pie.php'; ?>