<?php 
require_once 'config/conexion_bd.php'; 
	include_once 'inactivo.php';
	include_once 'sesion.php';
$cod_plan=$_REQUEST['cod_plan']; 
$sql="DELETE FROM planes WHERE cod_plan='$cod_plan'";
if (mysqli_query($mysqli,$sql)) 
	echo '<script type="text/javascript">
					 	alert(" ha sido eliminado del sistema satisfactoriamente!");
					 	window.location="sala.php"
					 </script>';
else
	echo '<script type="text/javascript">
					 	alert("El usuario no ha podido ser eliminado!");
					 	window.location="sala.php"
					 </script>';
?>?>