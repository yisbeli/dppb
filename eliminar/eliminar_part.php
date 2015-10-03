<?php 
include('../includes/bd_conexion.php');
$ced_part=$_REQUEST['ced_part'];
$sql = "DELETE FROM participantes WHERE ced_part='$ced_part'";
if(mysqli_query($mysqli,$sql)){
?>
			<script type="text/javascript">
				alert("Participante eliminado satisfactoriamente!");
				window.location="../consultas/consulta_part.php";
			</script>
<?php
}
?>