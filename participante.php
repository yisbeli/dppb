<?php	include_once 'cabecera.php'; ?>
<?php   include_once 'libs/menu.php'; ?>
	<section class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h1>Registro del Participante</h1>
				<form method="POST" action="">
					<legend>Datos del participante</legend>
					<div id="cuerpo_form">
						<?php
							//EXTRAEMOS Y CONECTAMOS
							extract($_POST);
							if (isset($actualizar) AND $actualizar == "No") :
								require_once 'config/conexion_bd.php';
								//VERIFICAMOS SI EL PARTICIPANTE YA ESTA EN LA BASE DE DATOS
								$sqlito="SELECT * FROM participantes WHERE ced_part='$ced_part'";
								$sqlito2=mysqli_query($mysqli,$sqlito);
								$sqlito3 = mysqli_fetch_array($sqlito2);
									//INSERTAMOS SI EL PARTICIPANTE NO ESTA INSCRITO Y EXTRAEMOS SU CODIGO
								if( mysqli_num_rows($sqlito2) == 0) {
									$command_sql = "INSERT INTO participantes (ced_part, nomb_part, apell_part, profe_part, tlfn_part, email_part, id_nivel,dependencia, nomenclatura) VALUES ('$ced_part','$nomb_part','$apell_part','$profe_part','$tlfn_part','$email_part','$id_nivel','$dependencia', '$nacionalidad')";
									mysqli_query($mysqli,$command_sql);
									$command_sql2 = "SELECT MAX(cod_par) FROM participantes";
									$consultado = mysqli_query($mysqli,$command_sql2);
									$resultado4 = mysqli_fetch_array($consultado);
									$codigo_par=$resultado4[0];
								} 
									//EXTRAEMOS EL CODIGO DEL PARTICIPANTE SI YA ESTABA INSCRITO
								else
									$codigo_par=$sqlito3[0];

								//calculamos
								$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid) FROM unidades_trib)";
								$consultado3=mysqli_query($mysqli,$sentencia);
								$resultado2=mysqli_fetch_array($consultado3);

								$command_sql5 = "SELECT p.cant_unid FROM planes p, planes_responsables pr WHERE pr.id='$cod_plan' AND p.cod_plan=pr.cod_plan";
								$consultado4=mysqli_query($mysqli,$command_sql5);
								$resultado3=mysqli_fetch_array($consultado4);
								
								//calculamos el precio y se almacena en precio de la tabla planes_participantes
								$precio = ($resultado2[0] * $resultado3[0]);
								$sql10="SELECT * FROM planes_participantes WHERE cod_plan='$cod_plan' AND cod_par='$codigo_par'";
								$sql11=mysqli_query($mysqli,$sql10);
								$sql12 = mysqli_fetch_array($sql11);
								if( mysqli_num_rows($sql11) == 0) {
								//pre-inscribimos
									$command_sql6 = "INSERT INTO planes_participantes (cod_plan, cod_par, precio) VALUES ('$cod_plan', '$codigo_par', '$precio')";
									mysqli_query($mysqli,$command_sql6);
									/*$mensaje= "<br>RECUERDA TRAER: <br>
	                                	1 FOTOCOPIA DE LA CEDULA DE IDENTIDAD:  <br>
	                                	2 FOTOS TIPO CARNET:  <br>
	                                	1 CARPETA MARRON TAMAÑO OFICIO CON GANCHO: <br>
	                               		1 FOTOCOPIA DE TITULO DE BACHILLER: <br>
	                                	1 SINTESIS CURRICULAR:   <br>
	                            	";	*/
									echo "<script type='text/javascript'>
											alert('Participante registrado en el plan con éxito!');
											window.location='home.php';
										</script>";
									}
								else
									echo "<script>
											alert('El usuario con la cédula: ".$ced_part." ya se encuentra registrado en el plan');
											window.location='home.php';
										</script>";
							?>
						<?php 
							// ESTO HAY QUE ARREGLARLO //
							else if (isset($actualizar) AND $actualizar == "Si") :
								require_once 'config/conexion_bd.php';

								//ACTUALIZAMOS
								$command_sql = "UPDATE participantes SET ced_part='$ced_part', nomb_part='$nomb_part', apell_part='$apell_part', profe_part='$profe_part', tlfn_part='$tlfn_part', email_part='$email_part', id_nivel='$id_nivel', dependencia='$dependencia', nomenclatura='$nacionalidad' WHERE ced_part='$ced_part'";
								require 'config/sql.php';

								//calculamos
								$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid) FROM unidades_trib)";
								$consultado=mysqli_query($mysqli,$sentencia);
								$resultado2=mysqli_fetch_array($consultado);

								$command_sql = "SELECT p.cant_unid FROM planes p, planes_responsables pr WHERE pr.id='$registro' AND p.cod_plan=pr.cod_plan";
								$consultado=mysqli_query($mysqli,$command_sql);
								$resultado3=mysqli_fetch_array($consultado);

								$precio = ($resultado2[0] * $resultado3[0]);

								//pre-inscribimos
								$command_sql = "INSERT INTO planes_participantes (cod_plan, cod_par, precio) VALUES ('$registro', '$cod_par', '$precio')";
								mysqli_query($mysqli,$command_sql);
								//aqui
							?>
								<script type="text/javascript">
									alert("Participante registrado con éxito!");
									window.location="index.php";
								</script>
						<?php
							elseif (!isset($actualizar)) :
								if (isset($cedula)) :
									require_once 'config/conexion_bd.php';
									$command_sql = "SELECT * FROM participantes WHERE ced_part='$cedula'";
									require 'config/sql.php';
									if (mysqli_num_rows($result)){
										$resultado = mysqli_fetch_array($result);
										$actualizar = "Si";
									}
									else {
										$actualizar = "No";
									}
								else:
									$cedula='';
									$actualizar='';
								endif;
							endif;
						?>
						<input type="hidden" name="actualizar" value="<?php echo $actualizar; ?>" />
						<input type="hidden" name="registro" value="<?php echo $registro; ?>" />
						<input type="hidden" name="cod_par" value="<?php if (isset($resultado)) echo "$resultado[0]" ?>">
						<!-- Cedula del participante -->
						<div class="col-md-6">
							<label for="ced_part">Nacionalidad: </label>
							<select class="form-control" name="nacionalidad"  class="nac">
								<option value=""> -- seleccione -- </option>
								<option name="nacionalidad" value="V" <?php if (isset($resultado)) if ($resultado[9] == "V") echo "selected"; ?>> V </option>
								<option name="nacionalidad" value="E" <?php if (isset($resultado)) if ($resultado[9] == "E") echo "selected"; ?>> E </option>
							</select>
						</div>
						<div class="col-md-6">
							<label class="guion">Cédula: </label>
							<input class="form-control" id="text_form" class="cedula" type="number" name="ced_part" maxlength="8" size="6" placeholder="Cedula" required patter="^\d{8}" title="Ejemplo: V-00000000"  required <?php if (isset($resultado)) { echo "value='$resultado[1]'"; } elseif (isset($cedula)) { echo "value='$cedula'"; }?> /><br>
						</div>
						<!-- Nombre del participante -->
						<div class="col-md-6">
						<label for="nomb_part">Nombres: </label>
						<input class="form-control" id="text_form" type="text" maxlength="30" name="nomb_part" placeholder="Nombres" required patter="^[a-zA-Z]{3,15}" title="Ingrese un nombre" required <?php if (isset($resultado)) echo "value='$resultado[2]'"; ?> /><br>
						</div>
						<!-- Apellido del participante -->
						<div class= "col-md-6">
						<label for="apell_part">Apellidos: </label>
						<input class="form-control" id="text_form" type="text" maxlength="30" name="apell_part" placeholder="Apellidos" requi patter="^[a-zA-Z]{3,15}" title="Ingrese un apellido" required <?php if (isset($resultado)) echo "value='$resultado[3]'"; ?> /><br>
						</div>
						<!-- Profesion -->
						<div class= "col-md-6">
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
						</div>
						
						<!-- TELÉFONO - MOVIL -->
						<div class= "col-md-6">
						<label for="tlfn_part">Teléfono: </label>
						<input class="form-control" id="text_form" type="number" name="tlfn_part" maxlength="12" size="10" placeholder="0000-0000000" required patter="^\d{4}\-\d{7}$" title="0000-0000000" <?php if (isset($resultado)) echo "value='$resultado[5]'"; ?> /><br>
						</div>
						<!-- EMAIL -->
						<div class= "col-md-6">
						<label for="email_part">Correo: </label>
						<input class="form-control" type="email" size="20" name="email_part" id ="text_form" title="email@example.com" placeholder="email@example.com" required <?php if (isset($resultado)) echo "value='$resultado[6]'"; ?> /><br>						
						</div>

						<?php								
							require_once 'config/conexion_bd.php';
							$command_sql = "SELECT id_nivel, nomb_nivel FROM nivel_academico";
							require 'config/sql.php';
						?>
						
						<!-- Nivel Academico -->
						<div class= "col-md-6">
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
						</div>

						<!-- Dependencia -->
						<div class= "col-md-12">
						<label>Dependencia</label>
						<input class="form-control" id="text_form" type="text" maxlength="50" name="dependencia" placeholder="Ingrese la instutucion de donde proviene" required patter="^[a-zA-Z]{3,15}" title="Ingrese la dependencia" <?php if (isset($resultado)) echo "value='$resultado[9]'"; ?>><br>
						</div>
						<!-- Botones -->
						<div class="row text-center">
							<input type="hidden" name="actualizar" value="No">
							<input type="hidden" name="cod_plan" value="<?php echo $cod_plan; ?>">
							<input type="hidden" name="plan" value="<?php echo $plan; ?>">
							<a href="sala.php ?>">
								<button type="button" class="btn btn-sistema" name="plan" title="Haga click para regresar a la página anterior" ><span class="glyphicon glyphicon-hand-left"></span> Volver </button> 
							</a>
							<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>
							<button type="submit" name="crear" class="btn btn-sistema"> <span class="glyphicon glyphicon-hand-up"></span> Pre-Inscribir</button>
					</div>
				</form>	
			</div>
		</div>
	</section>
<?php	include_once 'pie.php'; ?>