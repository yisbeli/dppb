<?php 
include('../includes/bd_conexion.php');
$cedu_pac=$_REQUEST['cedu_pac'];
$nomb_pac=$_REQUEST['nomb_pac'];
$edad=$_REQUEST['edad'];
$diag_pac=$_REQUEST['diag_pac'];
$cod_serv=$_REQUEST['cod_serv'];
$sql = "UPDATE paciente SET nomb_pac='$nomb_pac', nomb_pac='$nomb_pac', edad='$edad', diag_pac='$diag_pac', cod_serv='$cod_serv' WHERE cedu_pac='$cedu_pac'";
if(mysqli_query($mysqli,$sql)){
?>
			<script type="text/javascript">
				alert("Paciente actualizado satisfactoriamente!");
				window.location="../consultas/consulta_pac2.php";
			</script>
<?php
}
?>
