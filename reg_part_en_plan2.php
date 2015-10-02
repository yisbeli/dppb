<?php 
include('includes/bd_conexion.php');
$cod_plan=$_REQUEST['cod_plan'];
$ced_part=$_REQUEST['ced_part'];
$sql="SELECT * FROM participantes WHERE ced_part='$ced_part'";
$result=mysqli_query($mysqli,$sql);
$row=mysqli_fetch_array($result);
$cod_part=$row['cod_par'];
$sql2="INSERT INTO planes_participantes (cod_part, cod_plan) VALUES ('$cod_part','$cod_plan')";
if(mysqli_query($mysqli,$sql2)){
	$sql3="SELECT * FROM planes WHERE cod_plan='$cod_plan'";
	$result3=mysqli_query($mysqli,$sql3);
	$row3=mysqli_fetch_array($result3);
?>
			<script type="text/javascript">
				var nomb_plan="<?php echo $row3['nomb_plan']; ?>"
				var tipo_plan="<?php echo $row3['tipo_plan']; ?>"
				alert("Participante inscrito satisfactoriamente en el plan: " + nomb_plan);
				window.location="consultas/consulta_plan.php?nomb_plan=" + tipo_plan;
			</script>
<?php
}
?>