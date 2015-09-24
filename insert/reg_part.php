<?php
	include_once '../includes/bd_conexion.php';
	include("../cabecera.php");
	?>
				<div id="cuerpoA">
						<h1>Registro de Participantes</h1>
						<form method="post" class="participante" action="insert_part.php">
							<legend>Datos del participante</legend>
							<section id="cuerpo_form" style="min-height:400px">
				
				
							<!-- Cedula del participante -->
							<label for="ced_part">Cédula: </label>
								<select name="nacionalidad"  class="nac" requi >
									<option name="nacionalidad" value="V"> V </option>
									<option name="nacionalidad" value="E"> E </option>
								</select>
							<label class="guion"> - </label>
								<input id="text_form" class="cedula" type="text" name="ced_part" maxlength="8" size="6" placeholder="00000000" requi patter="^\d{8}" title="Ejemplo: V-00000000" /><br />
							
							<!-- Nombre del participante -->							
							<label for="nomb_part">Nombres: </label>
								<input id="text_form" type="text" maxlength="30" name="nomb_part" placeholder="Nombres" requi patter="^[a-zA-Z]{3,15}" title="Ingrese un nombre" /><br />
							
							<!-- Apellido del participante -->
							<label for="apell_part">Apellidos: </label>
								<input id="text_form" type="text" maxlength="30" name="apell_part" placeholder="Apellidos" requi patter="^[a-zA-Z]{3,15}" title="Ingrese un apellido" /><br />
							
							<!-- Profesion -->
								<label>Profesion del Participante: </label>
								<select name="profe_part">
									<option name="profe_part" value=""> -- Seleccione -- </option>
									<option name="profe_part" value="economista"> Economista</option>
									<option name="profe_part" value="medico"> Médico (sector privado) </option>
									<option name="profe_part" value="disenador"> Diseñador </option>
									<option name="profe_part" value="publicista"> Publicista </option>
									<option name="profe_part" value="juridico"> Asesor Jurídico </option>
									<option name="profe_part" value="auditor"> Auditor externo </option>
									<option name="profe_part" value="gerente"> Gerente Financiero </option>
									<option name="profe_part" value="ingeniero"> Ingeniero Civil e Industrial </option>
									<option name="profe_part" value="arquitecto"> Arquitecto </option>
									<option name="profe_part" value="abogado"> Abogado </option>
									<option name="profe_part" value="ingenierop"> Ingeniero Petrolero </option>
									<option name="profe_part" value="administrador"> Administrador Público </option>
									<option name="profe_part" value="director"> Director Ejecutivo </option>
									<option name="profe_part" value="docente"> Docente </option>
									<option name="profe_part" value="obrero"> Obrero </option>
									<option name="profe_part" value="comerciante"> Comerciante </option>
									<option name="profe_part" value="otro"> Otro </option>
								</select> <br />
								
							<!-- TELÉFONO - MOVIL -->
								<label for="tlfn_part">Teléfono: </label>
								<input id="text_form" type="text" name="tlfn_part" maxlength="12" size="10" placeholder="0000-0000000" requi patter="^\d{4}\-\d{7}$" title="0000-0000000" /><br />
								
							<!-- EMAIL -->
								<label for="email_part">Correo: </label>
								<?php if(isset($_SESSION['log']) and $_SESSION['tipo']==2){ ?>
								<input type="Email" size="20" disabled name="email_part" id ="text_form" title="email@example.com" value="<?php echo $_SESSION['correo']; ?>" /><br /><?php } else{ ?>
								<input type="Email" size="20" name="email_part" id ="text_form" title="email@example.com" placeholder="email@example.com" /><br /><?php } ?>								
								
								<?php								
								require_once '../includes/bd_conexion.php';
								$command_sql = "SELECT id_nivel, nomb_nivel FROM nivel_academico";
								require '../includes/sql.php';
								?>
								
								<!-- Nivel Academico -->
								<label>Nivel Academico</label>
								<select name="id_nivel">
									<option name="id_nivel" value=""> - Seleccione - </option>
								<?php
									while($registro=mysqli_fetch_array($result))
									{
								?>
									<option name="id_nivel" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
								</select><br /><br />
								
								<!-- Botones -->
								<div class="buttons">
								<input type="submit" class="submit" value="Registrar" title="Haga clic para Registrar un Plan"  />

								<input type="reset" id="reset" value="Limpiar formulario" title="Haga clic para limpiar formulario"  />
								</div>
							</section>
						</form>
				</div>


	<?php  include("../piedepagina.php");?>
