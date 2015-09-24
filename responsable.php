<?php
	
	//== CEDULA DEL RESPONSABLE ==//
	if(!preg_match("/^\d{8}$/", $ced_resp))
	{
		if(empty($ced_resp) or preg_match("/^\s+$/", $ced_resp))
		{
			echo '<h2>Por favor introduzca la cédula del nuevo responsable</h2>';
			exit();
		}
		
	}
	if($ced_resp < 1000000)
	{
		echo "<h2>Cédula inválida, por favor ingrese otro número de cédula</h2>";
		exit();
	}
	
	
?>