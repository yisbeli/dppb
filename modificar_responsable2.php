<?php 
include('config/conexion_bd.php');

extract($_POST);

$sql = "UPDATE responsables SET ced_resp='$ced_resp', nomb_resp='$nomb_resp', apell_resp='$apell_resp', espe_resp='$espe_resp', id_nivel='$id_nivel', id_tipo='$id_tipo' WHERE ced_resp='$ced_resp'";
if(mysqli_query($mysqli,$sql)){
?>
			<script type="text/javascript">
				alert("Responsable actualizado satisfactoriamente!");
				window.location="consulta_responsable.php";
			</script>
<?php
}
?>

?>
