<?php
	include_once 'psl-config.php';
	
	$mysqli = mysqli_connect(HOST, USER, PASSWORD, DATABASE);
	if(mysqli_connect_errno($mysqli) > 0)
	{
		printf(
			"<h2>No se ha podido conectar a la base de datos</h2>
			<b>Numero de error: </b>%d<br />
			<b>Mensaje de error: </b>%s",
			mysqli_connect_errno(),
			mysqli_connect_error()
		);
		exit();
	}
?>