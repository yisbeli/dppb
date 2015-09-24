<?php
	include_once '../includes/bd_conexion.php';
	include("../cabecera.php");
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
				?>

			<!--Pie de página-->

			<script type="text/javascript">
				alert("Responsable Registrado Satisfactoriamente");
				window.location="../sala.php";
			</script>

			<?php  include("../piedepagina.php");?>