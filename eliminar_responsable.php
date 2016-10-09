<?php 
require_once 'config/conexion_bd.php'; 
$ced_resp=$_REQUEST['eu']; 
$sql="DELETE FROM responsables WHERE ced_resp='$ced_resp'";
if (mysqli_query($mysqli,$sql)) 
	echo '<script type="text/javascript">
					 	alert(" ha sido eliminado del sistema satisfactoriamente!");
					 	window.location="consulta_responsable.php"
					 </script>';
else
	echo '<script type="text/javascript">
					 	alert("El usuario no ha podido ser eliminado!");
					 	window.location="consulta_responsable.php"
					 </script>';
?>?>