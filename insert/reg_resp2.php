<<?php
	include_once '../includes/bd_conexion.php';
	include_once '../includes/abrir_sesion.php';
?>

<!DOCTYPE html>
<html lang = "es">
	<head>
		<?php require_once '../includes/head.php'; ?>
	</head>
	<body>		
		<div  align="center" id="contenedor">
			<header>
				<!-- Membrete -->
				<?php require_once '../includes/membrete.php'; ?>
			</header>
	 
				<div id="menu">
						<!-- Menú principal -->
						<?php require_once '../includes/menu_principal.php'; ?>
				</div>
				
				<!-- Formulario -->
				<div id="cuerpo">
						<h1>Registro de Responsable</h1>
						<form method="post" action="insert_resp.php">
							
							<section id="cuerpo_form">
					
							<!-- Cedula del responsable -->
							<label for="ced_resp">Cédula: </label>
								<select name="nacionalidad" >
									<option name="nacionalidad" value="V"> V </option>
									<option name="nacionalidad" value="E"> E </option>
								</select>
							<label> - </label>
								<input id="text_form" type="text" name="ced_resp" maxlength="8" size="6" placeholder="00000000" requi patter="^\d{8}" title="Ejemplo: V-00000000" /><br />
							
							<!-- Nombre del responsable -->							
							<label for="nomb_resp">Nombres: <label>
								<input id="text_form" type="text" maxlength="30" name="nomb_resp" placeholder="Nombres" requi patter="^[a-zA-Z]{3,15}" title="Ingrese un nombre" /><br />
							
							<!-- Apellido del responsable -->
							<label for="apell_resp">Apellidos: <label>
								<input id="text_form" type="text" maxlength="30" name="apell_resp" placeholder="Apellidos" requi patter="^[a-zA-Z]{3,15}" title="Ingrese un apellido" /><br />
							
							<!-- Especialidad del responsable -->
								<label for="espe_resp">Especialidad: </label>
								<input type="text" id="text_form" name="espe_resp" maxlength="30" size="30" placeholder="Ingrese una especialidad" requi patter ="^[A-Z][a-Z]{3,15}(\s*[A-Z][a-Z]{3,15})*" title="Ingrese una especialidad" /> <br />
							
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
								</select><br />
								
								<?php								
								require_once '../includes/bd_conexion.php';
								$command_sql = "SELECT id_tipo, nomb_tipo FROM tipos_resp";
								require '../includes/sql.php';
								?>
								
								<!-- Tipo de Responsable -->
								<label>Tipo de Responsable</label>
								<select name="id_tipo">
									<option name="id_tipo" value=""> - Seleccione - </option>
								<?php
									while($registro=mysqli_fetch_array($result))
									{
								?>
									<option name="id_tipo" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
								</select><br /><br />
					
									<!-- Botones -->
								<input type="submit" class="submit" value="Registrar" title="Haga clic para Registrar un Plan"  />

								<input type="reset" id="reset" value="Limpiar formulario" title="Haga clic para limpiar formulario"  />
							</section>
						</form>
				</div>
				<!--Pie de página-->
			<footer id="pie">
				<?php require_once '../includes/pie.php'; ?>
			</footer>
		</div>
	</body>
</html>       