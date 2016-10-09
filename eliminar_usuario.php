<?php 
require_once 'config/conexion_bd.php'; 
$cod_par=$_REQUEST['eu']; 
$sql="DELETE FROM user WHERE iduser='$iduser'";
if (mysqli_query($mysqli,$sql)) 
	echo '<script type="text/javascript">
					 	alert("El usuario ha sido eliminado del sistema satisfactoriamente!");
					 	window.location="aceptacion_usu.php"
					 </script>';
else
	echo '<script type="text/javascript">
					 	alert("El usuario no ha podido ser eliminado!");
					 	window.location="aceptacion_usu.php"
					 </script>';
?>