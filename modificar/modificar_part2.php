<?php 
include('../includes/bd_conexion.php');
$ced_part=$_REQUEST['ced_part'];
$nomb_part=$_REQUEST['nomb_part'];
$apell_part=$_REQUEST['apell_part'];
$profe_part=$_REQUEST['profe_part'];
$tlfn_part=$_REQUEST['tlfn_part'];
$email_part=$_REQUEST['email_part'];
$id_nivel=$_REQUEST['id_nivel'];
$cod_par=$_REQUEST['cod_par'];
$sql = "UPDATE participantes SET ced_part='$ced_part', nomb_part='$nomb_part', apell_part='$apell_part', profe_part='$profe_part', tlfn_part='$tlfn_part', email_part='$email_part', id_nivel='$id_nivel' WHERE cod_par='$cod_par'";
if(mysqli_query($mysqli,$sql)){
?>
	<script type="text/javascript">
		alert("Datos de Participante actualizado satisfactoriamente!");
		window.location="../consultas/consulta_part.php";
	</script>
<?php
}
?>