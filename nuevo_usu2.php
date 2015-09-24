<?php
include('includes/bd_conexion.php');
$nombre = $_POST['nombre'];
$correo = $_POST['correo'];
$clave = $_POST['clave'];
$sql = "SELECT * FROM user WHERE correo='$correo'";
$result=mysqli_query($mysqli,$sql);
$reg=mysqli_fetch_array($result);
if($reg['correo']==$correo){
	?><script> alert('El usuario ya ha sido creado');history.back();</script>;	<?php
	}
else {
	$sql1 = "INSERT INTO user (clave,nombre,correo,tipo) VALUES ('$clave', '$nombre','$correo','2' )";
	if (mysqli_query($mysqli,$sql1)) {				
		?>
		<script>
		alert("Usuario creado satisfactioriamente.");
		</script>
		<body onload="document.elform.submit();">
		<form method="POST" name="elform" action="config/login.php">
			<input type="hidden" name="correo" value="<?php echo $correo;?>">
			<input type="hidden" name="clave" value="<?php echo $clave;?>">
		</form>
		</body>
		<?php
	}
}	
?>