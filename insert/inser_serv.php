<?php
	include("../cabecera.php");
?>
			<?php
				//EXTRAEMOS Y CONECTAMOS
				extract ($_POST);
				require_once '../includes/bd_conexion.php';
				
				
			//	$result = mysql_real_escape_string($N);
				//$result1 = mysql_real_escape_string($O);
				
				//INSERTAMOS
				
				$command_sql = "INSERT INTO servicios (hora_salida, hora_llegada, hora_ingreso, parroquia, direc_salida, direc_destino, id_tipo_serv, id_unidad, id_municipio, cod_resp) VALUES ('$hora_salida','$hora_llegada','$hora_ingreso','$parroquia','$direc_salida','$direc_destino','$id_tipo_serv','$id_unidad','$id_municipio','$cod_resp')";
				//mysqli_query($mysqli,$command_sql); 


				require '../includes/sql.php';
				echo "<h2><br />Se ha registrado el Servicio  correctamente</h2>";
			?>
			<input type="button" class="submit" name="entrar" id="submit" value="Regresar a la página anterior" onclick=location="../insert/Servicio.php" align="center" />
			<?php
	include("../piedepagina.php");
?>
