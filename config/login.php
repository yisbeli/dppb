<?php
session_start();
include('../includes/bd_conexion.php');
$correo=addslashes($_REQUEST['correo']);
$clave=addslashes($_REQUEST['clave']);
$sql = "SELECT * FROM user WHERE correo='$correo' and clave ='$clave'";
$result = mysqli_query($mysqli,$sql);
if(mysqli_num_rows($result)==1){
	$row=mysqli_fetch_array($result);
	$_SESSION['log']="1";
	$_SESSION['iduser']=$row['iduser'];
	$_SESSION['correo']=$row['correo'];
	$_SESSION['nombre']=$row['nombre'];
	$_SESSION['tipo']=$row['tipo'];
	if($_SESSION['tipo']==2):
		$id= $_SESSION['iduser'];
		$sql ="SELECT ced_part FROM participantes WHERE user='$id'";
		$resultado=mysqli_query($mysqli,$sql);
		$comprobar=mysqli_fetch_array($resultado); 
		if(empty($comprobar[0]))
		header('location:../insert/reg_part.php');
		else 
		header('location:../sala.php');
	endif;
	header('location:../sala.php');
}else{ 
	?>
	<meta charset="utf-8">
	<script type="text/javascript">
	alert("Nombre de usuario o contraseña incorrectos");
	location.href="../iniciar_sesion.php";
	</script>
	<?php
}
?>
