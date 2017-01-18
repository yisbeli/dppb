<?php	
	include_once 'cabecera.php';
	include_once 'inactivo.php';
	include_once 'sesion.php';
	include_once 'libs/menu.php';
?>

	<section class="container sala">
<?php

	include_once 'libs/actualizacion.php';

		if ($_SESSION['tipo'] == 1) :
			include_once 'libs/nivel1.php';
		elseif ($_SESSION['tipo'] == 2) :
			include_once 'libs/nivel2.php';
		endif;
?>
	</section>
<?php	include_once 'pie.php';  ?>
