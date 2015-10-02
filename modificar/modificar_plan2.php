<?php 
include('../includes/bd_conexion.php');
extract($_POST);
$cod_plan=$_GET['cod_plan'];
$sql = "UPDATE planes SET tipo_plan='$tipo_plan', nomb_plan='$nomb_plan', desc_plan='$desc_plan', cant_unid='$cant_unid' WHERE cod_plan='$cod_plan'";

if(mysqli_query($mysqli,$sql)){
?>
			<script type="text/javascript">
				alert("Plan actualizado satisfactoriamente!");
				window.location="../consultas/consulta_plan2.php";
			</script>
<?php
}
?>