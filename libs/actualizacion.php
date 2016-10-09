<?php

	include_once 'config/conexion_bd.php';

	$fechaactual = date("Y-m-d");
	$sql = "SELECT id, Fecha_inicio, Fecha_fin, idstatus FROM planes_responsables WHERE idstatus = '0'";
	$resultado = mysqli_query($mysqli, $sql);
	if (mysqli_num_rows($resultado)>0) :
		while ($consulta = mysqli_fetch_array($resultado)) :
			if ($consulta[1] == $fechaactual) :
				$sql = "UPDATE planes_responsables SET status='activo' WHERE id='$consulta[0]'";
				mysqli_query($mysqli, $sql);
			endif;
		endwhile;

		$sql = "SELECT pp.id, pp.status, pr.idstatus FROM planes_participantes pp, planes_responsables pr WHERE pr.idstatus='1'";
		$resultado = mysqli_query($mysqli, $sql);
		if (mysqli_num_rows($resultado)) :
			while ($consulta = mysqli_fetch_array($resultado)) :
				if ($consulta[1] == "pre-inscrito" AND $consulta[2] == "activo") :
					$sql = "DELETE FROM planes_participantes WHERE id='$consulta[0]'";
					mysqli_query($mysqli, $sql);                    
				endif;
			endwhile;
		endif;
	endif;

?>