<?php
	mysqli_query($conexion, $command_sql);
	
	if(mysqli_errno ($conexion) > 0)
	{
		printf
		(
			"<h2>No se ha podido insertar en la base de datos</h2>
			<b>Numero de error: </b>%d<br />
			<b>Mensaje de error: </b>%s<br />",
			mysqli_errno($conexion),
			mysqli_error($conexion)
		);
		exit();
	}
?>