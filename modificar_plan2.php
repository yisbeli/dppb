<?php 
include('config/conexion_bd.php');
include_once 'inactivo.php';
include_once 'sesion.php';

extract($_POST);

$sql = "UPDATE planes SET nomb_plan='$nomb_plan', desc_plan='$desc_plan', cant_unid='$cant_unid', tipo_plan='$tipo_plan' WHERE cod_plan='$cod_plan'";
if(mysqli_query($mysqli,$sql)){
	echo '<script type="text/javascript">
				alert("Plan actualizado satisfactoriamente!");
				window.location="busqueda_planes_participantes.php?plan='.$tipo_plan.'";
			</script>';
}
?>

?>
