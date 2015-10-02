A R R E G L A R NIVEL ACADEMICO Y TIPO DE RESPONSABLE.
<?php
	include_once '../includes/bd_conexion.php';
	include("../cabecera.php");
	?>
				<div id="cuerpoA">
					<?php 
					include('../includes/bd_conexion.php');
					$ced_resp=$_REQUEST['ced_resp'];
					$sql=("SELECT * FROM responsables WHERE ced_resp='$ced_resp'");
					$result=mysqli_query($mysqli,$sql);
					$row=mysqli_fetch_array($result);
					?>
						<h1>Actualizacion de Responsable</h1>
						<form method="post" action="modificar_resp2.php">
							<legend>Datos del Participante</legend>
							<section id="cuerpo_form">
				
				
							<!-- Cedula del Responsable -->
							<label for="ced_resp">Cédula: </label>
								<select name="nacionalidad" requi >
									<option name="nacionalidad" value="V"> V </option>
									<option name="nacionalidad" value="E"> E </option>
								</select>
							<label> - </label>
								<input id="text_form" type="text" name="ced_resp" value="<?php echo $row['ced_resp']; ?>" maxlength="8" size="6" placeholder="00000000" required pattern="^\d{8}" title="Ejemplo: V-00000000" /> <br>
							
							<!-- Nombre del Responsable -->							
							<label for="nomb_resp">Nombre: <label>
								<input id="text_form" type="text" value="<?php echo $row['nomb_resp']; ?>" maxlength="30" name="nomb_resp" placeholder="Nombres" required patter="^[a-zA-Z]{3,15}" title="Ingrese un nombre" /> <br>
							
							<!-- Apellido del Responsable -->
							<label for="apell_resp"> Apellido: <label>
								<input id="text_form" type="text" maxlength="30" name="apell_resp" value="<?php echo $row['apell_resp']; ?>" placeholder="apellido" required patter="^[a-zA-Z]{3,15}" title="Ingrese un apellido" /> <br>
							
							<!-- Especialidad del responsable -->
								<label for="espe_resp">Especialidad: </label>
								<input id="text_form" type="text" value="<?php echo $row['espe_resp']; ?>" maxlength="30" name="espe_resp" placeholder="especialidad" required patter="^[a-zA-Z]{3,15}" title="Ingrese una especialidad" /> <br>
							
							<?php 
								include('../includes/bd_conexion.php');
								$id_nivel=$row['id_nivel'];
								$sql2=("SELECT * FROM nivel_academico, responsables WHERE responsables.id_nivel=nivel_academico.id_nivel AND responsables.id_nivel='$id_nivel'");
								$result2=mysqli_query($mysqli,$sql2);
								$row2=mysqli_fetch_array($result2);
								?>
								<!-- Nivel Academico -->
								<label>Nivel Academico</label>
								<select name="id_nivel">
									<option name="id_nivel" value="<?php echo $id_nivel; ?>"> <?php echo $row2['nomb_nivel'];?> </option>
									<option name="id_nivel" value="4"> Bachiller </option>
									<option name="id_nivel" value="3"> Tecnico Medio </option>
									<option name="id_nivel" value="2"> Tecnico Superior </option>
									<option name="id_nivel" value="5"> Licenciado </option>
									<option name="id_nivel" value="1"> Ingeniero </option>
									<option name="id_nivel" value="6"> Magister </option>

								</select><br /><br />
								
								<?php 
								include('../includes/bd_conexion.php');
								$id_tipo=$row['id_tipo'];
								$sql3=("SELECT * FROM tipos_resp,responsables WHERE responsables.id_tipo=tipos_resp.id_tipo AND responsables.id_tipo='$id_tipo'");
								$result3=mysqli_query($mysqli,$sql3);
								$row3=mysqli_fetch_array($result3);
								?>
								
							<!-- Tipo de Responsable -->
								<label>Tipo de Responsable</label>
								<select name="id_tipo">
									<option name="id_tipo" value=""> <?php echo $row3[ 'nomb_tipo'];?> </option>
									<option name="id_tipo" value ="1"> Coordinador </option>
									<option name="id_tipo" value ="2"> Instructor </option>
									<option name="id_tipo" value ="3"> Bombero (Pre-Hospitalario) </option>
									<option name="id_tipo" value ="4"> Foraneo(a) </option>
														
								</select><br /><br />
					
								
								<!-- Botones -->
								<input type="submit" class="submit" value="Actualizar" title="Haga clic para modificar el responsable"  />
								<input type="hidden" name="cod_resp" value="<?php echo $row['cod_resp']; ?>">
								<input type="reset" id="reset" value="Limpiar formulario" title="Haga clic para limpiar formulario"  />
							</section>
						</form>
				</div>
	<?php  include("../piedepagina.php");?>