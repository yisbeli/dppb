<?php
	include_once '../includes/bd_conexion.php';
	include("../cabecera.php");
?>
					<div id="cuerpoA">	
						<h1>Registro de Planes de Formacion</h1><br>
						<form method="post" action="insert_plan.php">
							<section id="cuerpo_form">
					
								<?php								
								require_once '../includes/bd_conexion.php';
								$command_sql = "SELECT * FROM tipo_plan";
								require '../includes/sql.php';
								?>
								<!-- Tipo del Plan de formacion -->
								<label>Tipo de Plan de Formacion: </label>
								<select name="tipo_plan">
									<option name="tipo_plan" value=""> -- Seleccione -- </option>
								<?php
									while($registro=mysqli_fetch_array($result))
									{
								?>
									<option name="tipo_plan" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
								</select><br /><br />

								
								<!-- Nombre del Plan de Formacion -->
								<label for="nomb_plan">Nombre del Plan de Formacion: </label>
								<input type="text" name="nomb_plan" maxlength="50" size="44" placeholder="Ingrese un Nombre de Plan de Formacion" requi patter ="^[A-Z][a-Z]{3,15}(\s*[A-Z][a-Z]{3,15})*" title="Ingrese un nombre" /> <br><br>
								
								<!-- Descripcion del plan  -->
								<label for="desc_plan">Descripcion del Plan de Formacion: </label>
								<textarea name="desc_plan" id="" rows="5" cols="40" placeholder="Ingrese la descripcion del plan de formacion "></textarea> <br><br>
										
								<label> Cantidad de Unidad(es) tributaria(s): </label>
								<input type="text" name="cant_unid" maxlength="50" size="44" placeholder="Ingrese la cantidad de UT a cancelar">
								


								<!-- Botones -->
								<div class="buttons">
									<input type="submit" value="Registrar" title="Haga clic para Registrar un Plan"/>
									<input type="reset" value="Limpiar formulario" title="Haga clic para limpiar formulario"  />
								</div>
							</section>
						</form>
				</div>


				<?php  include("../piedepagina.php");?>
