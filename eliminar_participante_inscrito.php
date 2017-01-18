<?php 
require_once 'config/conexion_bd.php'; 
	include_once 'inactivo.php';
	include_once 'sesion.php';
$cod_par=$_REQUEST['eu']; 
$sql="DELETE FROM participantes WHERE ced_part='$ced_part'";
if (mysqli_query($mysqli,$sql)) 
	echo '<script type="text/javascript">
					 	alert("El Participante ha sido eliminado satisfactoriamente!");
					 	window.location="participantes_inscritos.php"
					 </script>';
else
	echo '<script type="text/javascript">
					 	alert("No se ha podido eliminar!");
					 	window.location="participantes_inscritos.php"
					 </script>';
?>