<?php	include_once 'librerias/cabecera.php'; ?>
	<div class="container">
<?php

	include_once 'librerias/menu.php';

		if ($_SESSION['tipo'] == 1) :
			include_once 'librerias/nivel1.php';
		elseif ($_SESSION['tipo'] == 2) :
			include_once './librerias/nivel2.php';
		endif;
?>
	</div>
<?php	include_once 'librerias/pie.php'; ?>
