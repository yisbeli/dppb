<?php

	session_start();
	include('../includes/conexion_bd.php');

	extract($_POST);
	$sql = "SELECT * FROM user WHERE correo='$usuario' AND clave ='$password'";
	$result = mysqli_query($mysqli,$sql);

	if(mysqli_num_rows($result)){
		$row=mysqli_fetch_array($result);
		$_SESSION['iduser']=$row['iduser'];
		$_SESSION['correo']=$row['correo'];
		$_SESSION['nombre']=$row['nombre'];
		$_SESSION['tipo']=$row['tipo'];

		if(empty($row[5]))
			header('location: ../responsables.php');
		else 
			header('location: ../sala.php');
	} else { 
	?>
		<meta charset="utf-8">
		<script type="text/javascript">
			alert("Nombre de usuario o contraseña incorrectos");
			location.href="../index.php";
		</script>
	<?php
	}

?>
