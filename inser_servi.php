<?php
	include_once 'cabecera.php';
?>
			<?php
				//EXTRAEMOS Y CONECTAMOS
				extract ($_POST);
				require_once 'config/conexion_bd.php';
				
				
			//	$result = mysql_real_escape_string($N);
				//$result1 = mysql_real_escape_string($O);
				
				//INSERTAMOS
				
				$command_sql = "INSERT INTO servicios (fecha_serv, hora_salida, hora_llegada, hora_ingreso, parroquia, direc_salida, direc_destino, insumos, id_tipo_serv, id_unidad, id_municipio, cod_resp) VALUES ('$fecha_serv','$hora_salida','$hora_llegada','$hora_ingreso','$parroquia','$direc_salida','$direc_destino','$insumos','$id_tipo_serv','$id_unidad','$id_municipio','$cod_resp')";
				//mysqli_query($mysqli,$command_sql); 


				require 'config/sql.php';
					
				//echo "<h2><br />Se ha registrado el Servicio  correctamente</h2>";
			?>
			<script type="text/javascript">
					 	alert(" El Servicio fue registrado con Exito!");
					 	window.location="paciente.php"
					 </script>
				
			<div class="buttons text-center">
			<input class="btn btn-sistema" type="button" class="submit" name="entrar" id="submit" value="Regresar a la Página Anterior" onclick=location="servicio.php" align="center" />
			</div>
			<?php include_once 'pie.php'; ?>
