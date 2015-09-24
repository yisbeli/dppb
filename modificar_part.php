<?php
	include_once 'includes/bd_conexion.php';
	include("../cabecera.php");
	?>
				<div id="cuerpo">
					<?php 
					include('includes/bd_conexion.php');
					$ced_part=$_REQUEST['ced_part'];
					$sql=("SELECT * FROM participantes WHERE ced_part='$ced_part'");
					$result=mysqli_query($mysqli,$sql);
					$row=mysqli_fetch_array($result);
					?>
						<h1>Actualizacion de Participante</h1>
						<form method="post" action="modificar_part2.php">
							<legend>Datos del Participante</legend>
							<section id="cuerpo_form">
				
				
							<!-- Cedula del participante -->
							<label for="ced_part">Cédula: </label>
								<select name="nacionalidad" requi >
									<option name="nacionalidad" value="V"> V </option>
									<option name="nacionalidad" value="E"> E </option>
								</select>
							<label> - </label>
								<input id="text_form" type="text" name="ced_part" value="<?php echo $row['ced_part']; ?>" maxlength="8" size="6" placeholder="00000000" required pattern="^\d{8}" title="Ejemplo: V-00000000" />
							
							<!-- Nombre del participante -->							
							<label for="nomb_part">Nombres: <label>
								<input id="text_form" type="text" value="<?php echo $row['nomb_part']; ?>" maxlength="30" name="nomb_part" placeholder="Nombres" requi patter="^[a-zA-Z]{3,15}" title="Ingrese un nombre" />
							
							<!-- Apellido del participante -->
							<label for="apell_part"> Apellido: <label>
								<input id="text_form" type="text" maxlength="30" name="apell_part" value="<?php echo $row['apell_part']; ?>" placeholder="apellido" requi patter="^[a-zA-Z]{3,15}" title="Ingrese un apellido" />
							
							<!-- Profesion -->
								<label>Profesion del Participante: </label>
								<select name="profe_part">
									<option name="profe_part" value="<?php echo $row['profe_part']; ?>"> <?php echo $row['profe_part']; ?> </option>
									<option name="profe_part" value="B">Bachiller</option>
									<option name="profe_part" value="TM">Tecnico Medio</option>
									<option name="profe_part" value="TSU">Tecnico Superior</option>
									<option name="profe_part" value="Lic">Licenciado</option>
									<option name="profe_part" value="Ing">Ingeniero</option>
								</select> <br /><br />	
								
							<!-- TELÉFONO - MOVIL -->
								<label for="tlfn_part">Teléfono: </label>
								<input id="text_form" type="text" name="tlfn_part" maxlength="12" size="12" value="<?php echo $row['tlfn_part']; ?>" placeholder="0000-0000000" requi patter="^\d{4}\-\d{7}$" title="0000-0000000" />
								
							<!-- EMAIL -->
								<label for="email_part">Correo: </label>
								<input type="Email" size="20" name="email_part" id ="text_form" title="email@example.com" value="<?php echo $row['email_part']; ?>" placeholder="email@example.com" />
								
								<?php 
								include('includes/bd_conexion.php');
								$id_nivel=$row['id_nivel'];
								$sql2=("SELECT * FROM nivel_academico, participantes WHERE participantes.id_nivel=nivel_academico.id_nivel AND participantes.id_nivel='$id_nivel'");
								$result2=mysqli_query($mysqli,$sql2);
								$row2=mysqli_fetch_array($result2);
								?>
								<!-- Nivel Academico -->
								<label>Nivel Academico</label>
								<select name="id_nivel">
									<option name="id_nivel" value="<?php echo $id_nivel; ?>"> <?php echo $row2['nomb_nivel'];?> </option>
									<option name="id_nivel" value="4">Bachiller</option>
									<option name="id_nivel" value="3">Tecnico Medio</option>
									<option name="id_nivel" value="2">Tecnico Superior</option>
									<option name="id_nivel" value="5">Licenciado</option>
									<option name="id_nivel" value="1">Ingeniero</option>
									<option name="id_nivel" value="6">Magister</option>

								</select><br /><br />
								
								<!-- Botones -->
								<input type="submit" class="submit" value="Actualizar" title="Haga clic para modificar el participante"  />
								<input type="hidden" name="cod_par" value="<?php echo $row['cod_par']; ?>">
								<input type="reset" id="reset" value="Limpiar formulario" title="Haga clic para limpiar formulario"  />
							</section>
						</form>
				</div>
	<?php  include("../piedepagina.php");?>