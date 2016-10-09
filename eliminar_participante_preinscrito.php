<?php 
require_once 'config/conexion_bd.php'; 
$cod_par=$_REQUEST['eu']; 
$sql="DELETE FROM participantes WHERE cod_par='$cod_par'";
if (mysqli_query($mysqli,$sql)) 
	echo '<script type="text/javascript">
					 	alert("El participante ha sido eliminado del sistema satisfactoriamente!");
					 	window.location="participantes_pre_inscritos.php"
					 </script>';
else
	echo '<script type="text/javascript">
					 	alert("El participante no ha podido ser eliminado!");
					 	window.location="participantes_pre_inscritos.php"
					 </script>';
?>