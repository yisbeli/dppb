<?php
	include_once '../includes/bd_conexion.php';
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
			<?php
				//EXTRAEMOS Y CONECTAMOS
				extract ($_POST);
				require_once '../includes/bd_conexion.php';
				
				//VALIDACION
				require_once '../validar/responsable.php';
				
			//	$result = mysql_real_escape_string($N);
				//$result1 = mysql_real_escape_string($O);
				
				//INSERTAMOS
				
				
				$command_sql = "INSERT INTO responsables (ced_resp, nomb_resp, apell_resp, espe_resp, id_nivel, id_tipo) VALUES ('$ced_resp','$nomb_resp','$apell_resp','$espe_resp','$id_nivel','$id_tipo')";
				
				
				require '../includes/sql.php';
				echo "<h2><br />Se ha registrado el responsable correctamente</h2>";
			?>
			<input type="button" class="submit" name="entrar" id="submit" value="Regresar a la página anterior" onclick=location="../insert/reg_resp.php" align="center" />
				
			<!--Pie de página-->
			<footer id="pie">
				<?php require_once '../includes/pie.php'; ?>
			</footer>
		</div>
	</body>
</html>