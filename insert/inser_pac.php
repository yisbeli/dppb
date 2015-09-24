<?php
	include("../cabecera.php");
?>
			<?php
			extract ($_POST);
			require_once '../includes/bd_conexion.php';
			
			$command_sql = "INSERT INTO paciente (cedu_pac, nomb_pac, edad, diag_pac, cod_serv) VALUES ('$cedu_pac','$nomb_pac','$edad','$diag_pac','$cod_serv')";
			
			
			require '../includes/sql.php';
				echo "<h2><br />Se ha registrado el Paciente  correctamente</h2>";
			?>
			<input type="button" class="submit" name="entrar" id="submit" value="Regresar a la página anterior" onclick=location="../insert/paciente.php" align="center" />
			<?php
	include("../piedepagina.php");
?>
