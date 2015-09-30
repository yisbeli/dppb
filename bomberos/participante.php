<?php	include_once 'librerias/cabecera.php'; ?>
	<div class="container"><br>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h1>Registro del Participante</h1>
				<form method="POST" action="">
					<legend>Datos del participante</legend>
					<section id="cuerpo_form">

						<?php
							//EXTRAEMOS Y CONECTAMOS
							extract($_POST);
							if (isset($actualizar) AND $actualizar == "No") :
								require_once 'includes/conexion_bd.php';

								//INSERTAMOS
								$command_sql = "INSERT INTO participantes (ced_part, nomb_part, apell_part, profe_part, tlfn_part, email_part, id_nivel,dependencia) VALUES ('$ced_part','$nomb_part','$apell_part','$profe_part','$tlfn_part','$email_part','$id_nivel','$dependencia')";
								require 'includes/sql.php';

								//calculamos
								$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid) FROM unidades_trib)";
								$consultado=mysqli_query($mysqli,$sentencia);
								$resultado2=mysqli_fetch_array($consultado);

								$command_sql = "SELECT * FROM planes WHERE cod_plan='$registro'";
								$consultado=mysqli_query($mysqli,$command_sql);
								$resultado3=mysqli_fetch_array($consultado);

								$precio = ($resultado2[0] * $resultado3[4]);

								//pre-inscribimos
								$command_sql = "INSERT INTO planes_participantes (cod_plan, cod_par, precio) VALUES ('$registro', '$cod_par', '$precio')";
								require 'includes/sql.php';
							?>
								<script type="text/javascript">
									alert("Participante registrado con éxito!");
									window.location="index.php";
								</script>
						<?php
							elseif (isset($actualizar) AND $actualizar == "Si") :
								require_once 'includes/conexion_bd.php';

								//ACTUALIZAMOS
								$command_sql = "UPDATE participantes SET ced_part='$ced_part', nomb_part='$nomb_part', apell_part='$apell_part', profe_part='$profe_part', tlfn_part='$tlfn_part', email_part='$email_part', id_nivel='$id_nivel', dependencia='$dependencia' WHERE ced_part='$ced_part'";
								require 'includes/sql.php';

								//calculamos
								$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid) FROM unidades_trib)";
								$consultado=mysqli_query($mysqli,$sentencia);
								$resultado2=mysqli_fetch_array($consultado);

								$command_sql = "SELECT * FROM planes WHERE cod_plan='$registro'";
								$consultado=mysqli_query($mysqli,$command_sql);
								$resultado3=mysqli_fetch_array($consultado);

								$precio = ($resultado2[0] * $resultado3[4]);

								//pre-inscribimos
								$command_sql = "INSERT INTO planes_participantes (cod_plan, cod_par, precio) VALUES ('$registro', '$cod_par', '$precio')";
								require 'includes/sql.php';
						
						?>
								<script type="text/javascript">
									alert("Participante registrado con éxito!");
									window.location="index.php";
								</script>
						<?php
							elseif (!isset($actualizar)) :
								if (isset($cedula)) :
									require_once 'includes/conexion_bd.php';
									$command_sql = "SELECT * FROM participantes WHERE ced_part='$cedula'";
									require 'includes/sql.php';
									if (mysqli_num_rows($result)){
										$resultado = mysqli_fetch_array($result);
										$actualizar = "Si";
									}
									else {
										$actualizar = "No";
									}
								endif;
							endif;
						?>

						<input type="hidden" name="actualizar" value="<?php echo "$actualizar"; ?>" />
						<input type="hidden" name="registro" value="<?php echo "$registro" ?>" />
						<input type="hidden" name="cod_par" value="<?php echo "$resultado[0]" ?>">
						<!-- Cedula del participante -->
						<label for="ced_part">Cédula: </label>
						<select class="form-control" name="nacionalidad"  class="nac">
							<option value=""> -- seleccione -- </option>
							<option name="nacionalidad" value="V" <?php if (isset($resultado)) if ($resultado[9] == "V") echo "selected"; ?>> V </option>
							<option name="nacionalidad" value="E" <?php if (isset($resultado)) if ($resultado[9] == "E") echo "selected"; ?>> E </option>
						</select>
						<label class="guion"> - </label>
						<input class="form-control" id="text_form" class="cedula" type="text" name="ced_part" maxlength="8" size="6" placeholder="00000000" requi patter="^\d{8}" title="Ejemplo: V-00000000" <?php if (isset($resultado)) { echo "value='$resultado[1]'"; } elseif (isset($cedula)) { echo "value='$cedula'"; }?> /><br>
						
						<!-- Nombre del participante -->
						<label for="nomb_part">Nombres: </label>
						<input class="form-control" id="text_form" type="text" maxlength="30" name="nomb_part" placeholder="Nombres" requi patter="^[a-zA-Z]{3,15}" title="Ingrese un nombre" <?php if (isset($resultado)) echo "value='$resultado[2]'"; ?> /><br>
						
						<!-- Apellido del participante -->
						<label for="apell_part">Apellidos: </label>
						<input class="form-control" id="text_form" type="text" maxlength="30" name="apell_part" placeholder="Apellidos" requi patter="^[a-zA-Z]{3,15}" title="Ingrese un apellido" <?php if (isset($resultado)) echo "value='$resultado[3]'"; ?> /><br>
						
						<!-- Profesion -->
						<label>Profesion del Participante: </label>
						<select class="form-control" name="profe_part">
							<option name="profe_part" value=""> -- Seleccione -- </option>
							<option name="profe_part" value="economista" <?php if (isset($resultado)) if ($resultado[4] == "economista") echo "selected"; ?>> Economista</option>
							<option name="profe_part" value="medico" <?php if (isset($resultado)) if ($resultado[4] == "medico") echo "selected"; ?>> Médico (sector privado) </option>
							<option name="profe_part" value="disenador" <?php if (isset($resultado)) if ($resultado[4] == "disenador") echo "selected"; ?>> Diseñador </option>
							<option name="profe_part" value="publicista" <?php if (isset($resultado)) if ($resultado[4] == "publicista") echo "selected"; ?>> Publicista </option>
							<option name="profe_part" value="juridico" <?php if (isset($resultado)) if ($resultado[4] == "juridico") echo "selected"; ?>> Asesor Jurídico </option>
							<option name="profe_part" value="auditor" <?php if (isset($resultado)) if ($resultado[4] == "auditor") echo "selected"; ?>> Auditor externo </option>
							<option name="profe_part" value="gerente" <?php if (isset($resultado)) if ($resultado[4] == "gerente") echo "selected"; ?>> Gerente Financiero </option>
							<option name="profe_part" value="ingeniero" <?php if (isset($resultado)) if ($resultado[4] == "ingeniero") echo "selected"; ?>> Ingeniero Civil e Industrial </option>
							<option name="profe_part" value="arquitecto" <?php if (isset($resultado)) if ($resultado[4] == "arquitecto") echo "selected"; ?>> Arquitecto </option>
							<option name="profe_part" value="abogado" <?php if (isset($resultado)) if ($resultado[4] == "abogado") echo "selected"; ?>> Abogado </option>
							<option name="profe_part" value="ingenierop" <?php if (isset($resultado)) if ($resultado[4] == "ingenierop") echo "selected"; ?>> Ingeniero Petrolero </option>
							<option name="profe_part" value="administrador" <?php if (isset($resultado)) if ($resultado[4] == "administrador") echo "selected"; ?>> Administrador Público </option>
							<option name="profe_part" value="director" <?php if (isset($resultado)) if ($resultado[4] == "director") echo "selected"; ?>> Director Ejecutivo </option>
							<option name="profe_part" value="docente" <?php if (isset($resultado)) if ($resultado[4] == "docente") echo "selected"; ?>> Docente </option>
							<option name="profe_part" value="obrero" <?php if (isset($resultado)) if ($resultado[4] == "obrero") echo "selected"; ?>> Obrero </option>
							<option name="profe_part" value="comerciante" <?php if (isset($resultado)) if ($resultado[4] == "comerciante") echo "selected"; ?>> Comerciante </option>
							<option name="profe_part" value="otro" <?php if (isset($resultado)) if ($resultado[4] == "otro") echo "selected"; ?>> Otro </option>
						</select> <br>
						
						<!-- TELÉFONO - MOVIL -->
						<label for="tlfn_part">Teléfono: </label>
						<input class="form-control" id="text_form" type="text" name="tlfn_part" maxlength="12" size="10" placeholder="0000-0000000" required patter="^\d{4}\-\d{7}$" title="0000-0000000" <?php if (isset($resultado)) echo "value='$resultado[5]'"; ?> /><br>
						
						<!-- EMAIL -->
						<label for="email_part">Correo: </label>
						<input class="form-control" type="email" size="20" name="email_part" id ="text_form" title="email@example.com" placeholder="email@example.com" <?php if (isset($resultado)) echo "value='$resultado[6]'"; ?> /><br>						
						
						<?php								
							require_once 'includes/conexion_bd.php';
							$command_sql = "SELECT id_nivel, nomb_nivel FROM nivel_academico";
							require 'includes/sql.php';
						?>
						
						<!-- Nivel Academico -->
						<label>Nivel Academico</label>
						<select class="form-control" name="id_nivel">
							<option name="id_nivel" value=""> - Seleccione - </option>
						<?php
							while($registro=mysqli_fetch_array($result))
							{
						?>
							<option name="id_nivel" value="<?php echo $registro[0] ?>" <?php if (isset($resultado)) if ($resultado[7] == $registro[0]) echo "selected"; ?>><?php echo $registro[1] ?></option>
						<?php } ?>
						</select><br>

						<!-- Dependencia -->
						<label>Dependencia</label>
						<input class="form-control" id="text_form" type="text" maxlength="50" name="dependencia" placeholder="Ingrese la Instutucion de donde proviene" required patter="^[a-zA-Z]{3,15}" title="Ingrese la dependencia" <?php if (isset($resultado)) echo "value='$resultado[10]'"; ?> /><br>

						<!-- Botones -->
						<div class="text-center">
							<button type="submit" formaction="busqueda_planes.php" class="btn btn-danger" name="plan" value="<?php echo $plan; ?>" title="Haga click para regresar a la página anterior" >Regresar atrás</button>
							<button type="reset" class="btn btn-danger" name="limpiar" value="Registrar" title="Haga click para registrar un plan" >Limpiar formulario</button>
							<button type="submit" class="btn btn-danger" value="<?php echo $actualizar; ?>" title="Haga clic para registrar un plan" >Confirmar pre-inscripcion</button>
						</div><br>
					</section>
				</form>	
			</div>
		</div>
	</div>
<?php	include_once 'librerias/pie.php'; ?>
