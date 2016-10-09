<?php
	include_once 'cabecera.php';
?>
			<?php
				//EXTRAEMOS Y CONECTAMOS
				extract ($_POST);
				require_once 'config/conexion_bd.php';
			 
				$command_sql = "INSERT INTO paciente (cedu_pac, nomb_pac, edad, diag_pac, cod_serv) VALUES ('$cedu_pac','$nomb_pac','$edad','$diag_pac','$cod_serv')";

				require 'config/sql.php';
				?>
			<script type="text/javascript">
					 	alert(" El Paciente fue registrado con Exito!");
					 	window.location="servicio.php"
					 </script>
				
			<div class="buttons text-center">
			<input class="btn btn-sistema" type="button" class="submit" name="entrar" id="submit" value="Regresar a la Página Anterior" onclick=location="servicio.php" align="center" />
			</div>
			<?php include_once 'pie.php'; ?>
