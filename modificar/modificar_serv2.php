<?php 
include('../includes/bd_conexion.php');
//$cod_serv=$_REQUEST['cod_serv'];
$cod_serv = isset($_POST['cod_serv']) ? $_POST['cod_serv'] : NULL; 
//$nomb_tipo_serv=$_REQUEST['nomb_tipo_serv'];
$nomb_tipo_serv = isset($_POST['nomb_tipo_serv']) ? $_POST['nomb_tipo_serv'] : NULL;
$hora_salida=$_REQUEST['hora_salida'];
$hora_llegada=$_REQUEST['hora_llegada'];
$hora_ingreso=$_REQUEST['hora_ingreso'];
$parroquia=$_REQUEST['parroquia'];
$direc_salida=$_REQUEST['direc_salida'];
$direc_destino=$_REQUEST['direc_destino'];
//$seudonimo=$_REQUEST['seudonimo'];
$id_unidad = isset($_POST['id_unidad']) ? $_POST['id_unidad'] : NULL;
$id_municipio=$_REQUEST['id_municipio'];
$cod_resp=$_REQUEST['cod_resp'];
$sql = "UPDATE servicio SET nomb_tipo_serv='$nomb_tipo_serv', hora_salida='$hora_salida', hora_llegada='$hora_llegada', hora_ingreso='$hora_ingreso', parroquia='$parroquia', direc_salida='$direc_salida',direc_destino='$direc_destino',direc_destino='$direc_destino',id_unidad='$id_unidad',id_municipio='$id_municipio',cod_resp='$cod_resp' WHERE cod_serv='$cod_serv'";
if(mysqli_query($mysqli,$sql)){
	
?>
			<script type="text/javascript">
				alert("servicio actualizado satisfactoriamente!");
				window.location="../consultas/consulta_serv.php";
			</script>
<?php
}
?>
