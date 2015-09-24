<?php

	include_once '../includes/config_bd.php';

	$mysqli = mysqli_connect(HOST, USER, PASSWORD, BD);

	if (mysqli_connect_errno($mysqli) > 0){
		echo "Existe un error<br>";
		echo "Nro.: ".mysqli_connect_errno()."<br>";
		echo "Mensaje: ".mysqli_connect_error()."<br>";
		exit();
	}

?>