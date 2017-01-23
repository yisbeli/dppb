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
				
				$command_sql = "INSERT INTO tipo_servicio (nomb_tipo_serv) VALUES ('$nomb_tipo_serv')";
				//mysqli_query($mysqli,$command_sql); 


				require 'config/sql.php';
					
				//echo "<h2><br />Se ha registrado el Servicio  correctamente</h2>";
			?>
			<script type="text/javascript">
					 	alert(" El Tipo de Servicio fue registrado con Exito!");
					 	window.location="tipo_servicio.php"
					 </script>
				
			<div class="buttons text-center">
			<input class="btn btn-sistema" type="button" class="submit" name="entrar" id="submit" value="Regresar a la Página Anterior" onclick=location="servicio.php" align="center" />
			</div>
			<?php include_once 'pie.php'; ?>


			