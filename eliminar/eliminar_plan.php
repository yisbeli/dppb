<?php 
include('../includes/bd_conexion.php');
$cod_plan=$_REQUEST['cod_plan'];
$sql = "DELETE FROM planes WHERE cod_plan='$cod_plan'";
if(mysqli_query($mysqli,$sql)){
?>
			<script type="text/javascript">
				alert("Plan eliminado satisfactoriamente!");
				window.location="consultas/consulta_plan.php";
			</script>
<?php
}
?>