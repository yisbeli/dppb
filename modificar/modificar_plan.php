<?php 
include('../includes/bd_conexion.php');
include("../cabecera.php");
$cod_plan=$_REQUEST['cod_plan'];
$sql=("SELECT * FROM planes WHERE cod_plan='$cod_plan'");
$result=mysqli_query($mysqli,$sql);
$row=mysqli_fetch_array($result);

?>
					<div id="cuerpoA">
						<section id="cuerpo_form" style="text-align:center">
						
							<h1>Modificar Planes de Formacion</h1>
							<form method="post" action="modificar_plan2.php?cod_plan=<?php echo $row['cod_plan'];?>">
					
								<?php								
								require_once '../includes/bd_conexion.php';
								$command_sql = "SELECT * FROM tipo_plan";
								require '../includes/sql.php';
								?>
								<!-- Tipo del Plan de formacion -->
								<label>Tipo de Plan de Formacion: </label>
								<select required name="tipo_plan">
									<option value=""> -- Seleccione -- </option>
								<?php
									while($registro=mysqli_fetch_array($result))
									{
								?>
									<option value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
								</select><br /><br />
								
								<!-- Nombre del Plan de Formacion -->
								<label for="nomb_plan">Nombre del Plan de Formacion </label>
								<input type="text" id="text_form" value="<?php echo $row['nomb_plan']; ?>"name="nomb_plan" maxlength="50" size="44" placeholder="Ingrese un Nombre de Plan de Formacion" required pattern ="^[A-Z][a-Z]{3,15}(\s*[A-Z][a-Z]{3,15})*" title="Ingrese un nombre" /> <br /><br />
								
								<!-- Descripcion del plan  -->
								<label for="desc_plan">Descripcion del Plan de Formacion</label><br />
								<textarea name="desc_plan" id="" rows="5" cols="40"><?php echo $row['desc_plan']; ?></textarea><br /><br />
										
								<label> Cantidad de Unidad(es) tributaria(s): </label>
								<input type="text" name="cant_unid" maxlength="50" size="44" placeholder="Ingrese la cantidad de UT a cancelar" value=<?php echo $row['cant_unid']; ?> />
								<?php								
								require_once '../includes/bd_conexion.php';
								$command_sql = "SELECT id_unid, valor_unid FROM unidades_trib";
								require '../includes/sql.php';
								?>
								
								<!-- Botones -->
								<input type="submit" class="submit" value="Modificar" />
								<input type="hidden" name="cod_plan" value="<?php echo $row['cod_plan']; ?>" />
								<a href="sala.php" style="margin:15px"><button> Volver al Inicio </button></a>
							</form>
							
						</section>
					</div>
					
					<?php  include("../piedepagina.php");?>
				