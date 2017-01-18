<?php 
include('config/conexion_bd.php');
	include_once 'inactivo.php';
	include_once 'sesion.php';
$cod_serv=$_REQUEST['cod_serv'];
$sql = "DELETE FROM servicios WHERE cod_serv='$cod_serv'";
if(mysqli_query($mysqli,$sql)){
?>
			<script type="text/javascript">
				alert("servicio eliminado satisfactoriamente!");
				window.location="consulta_serv2.php";
			</script>
<?php
}
?>