<?php
	include_once 'includes/cabecera.php';

	if ($_SESSION['tipo'] == 1) :
		include_once 'librerias/nivel1.php';
	elseif ($_SESSION['tipo'] == 2) :
		include_once 'librerias/nivel2.php';
	endif;

	include_once 'includes/pie.php';
?>
