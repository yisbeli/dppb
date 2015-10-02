<?php 
include('../includes/bd_conexion.php');
$ced_resp=$_REQUEST['ced_resp'];
$nomb_resp=$_REQUEST['nomb_resp'];
$apell_resp=$_REQUEST['apell_resp'];
$espe_resp=$_REQUEST['espe_resp'];
$id_nivel=$_REQUEST['id_nivel'];
$cod_resp=$_REQUEST['cod_resp'];
$sql = "UPDATE responsables SET ced_resp='$ced_resp', nomb_resp='$nomb_resp', apell_resp='$apell_resp', espe_resp='$espe_resp', id_nivel='$id_nivel' WHERE cod_resp='$cod_resp'";
if(mysqli_query($mysqli,$sql)){
?>
	<script type="text/javascript">
		alert("Datos de Responsable actualizado satisfactoriamente!");
		window.location="../consultas/consulta_resp.php";
	</script>
<?php
}
?>