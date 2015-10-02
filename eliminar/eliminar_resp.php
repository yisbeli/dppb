<?php 
include('../includes/bd_conexion.php');
$ced_resp=$_REQUEST['ced_resp'];
$sql = "DELETE FROM responsables WHERE ced_resp='$ced_resp'";
if(mysqli_query($mysqli,$sql)){
?>
			<script type="text/javascript">
				alert("Responsable Eliminado Satisfactoriamente!");
				window.location="../consultas/consulta_resp.php";
			</script>
<?php
}
?>