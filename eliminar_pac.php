<?php 
include('config/conexion_bd.php');
$cedu_pac=$_REQUEST['cedu_pac'];
$sql = "DELETE FROM paciente WHERE cedu_pac='$cedu_pac'";
if(mysqli_query($mysqli,$sql)){
?>
			<script type="text/javascript">
				alert("Paciente eliminado satisfactoriamente!");
				window.location="/consulta_pac2.php";
			</script>
<?php
}
?>