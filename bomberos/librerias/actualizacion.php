<?php

	include_once 'includes/conexion_bd.php';

	$fechaactual = date("Y-m-d");
	$sql = "SELECT pr.id, pr.fecha, pr.status FROM planes_responsables pr WHERE pr.status = 'por-iniciar'";
	$resultado = mysqli_query($mysqli, $sql);
	if (mysqli_num_rows($resultado)) :
		while ($consulta = mysqli_fetch_array($resultado)) :
			if ($consulta[1] == $fechaactual) :
				$sql = "UPDATE planes_responsables SET status='activo' WHERE id='$consulta[0]'";
				mysqli_query($mysqli, $sql);
			endif;
		endwhile;

		$sql = "SELECT pp.id, pp.status, pr.status FROM planes_participantes pp, planes_responsables pr WHERE pr.status='activo'";
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