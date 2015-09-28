<?php include_once 'librerias/cabecera.php';
	session_destroy();
	session_unset();
?>
	<div class="container">
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Crea tu cuenta del Laboratorio de Simulacion</h2><br>
					<form  method="POST" action="nuevo_usu.php">
						<?php
							extract($_POST);
							if (isset($registro)) :
							//EXTRAEMOS Y CONECTAMOS
							require_once 'includes/conexion_bd.php';

								if ();

							$command_sql="INSERT INTO user (correo,clave,nombre) VALUES ('$correo','$clave','$nombre')";
							require 'includes/sql.php';
						?>
						<script type="text/javascript">
							alert("	Estas registrado con éxito!");
							window.location="index.php";
						</script>

					<?php else : ?>
					
						<h3> Datos Personales </h3>
								<label>Nombre: </label>
								<input class="form-control" type="text" name="nombre" maxlength="50" size="44" placeholder="Ingrese nombre de usuario" required pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+" title="Debe introducir solo letras" />
									
								<label>Correo electronico: </label>
								<input class="form-control" type="email" name="correo" placeholder="Ejemplo@gmail.com" required size="30" />
					
								<label> Contraseña: </label>
								<input class="form-control"type="password" name="clave1" required size="30" placeholder="Ingrese su contraseña"/> 

								<label> Ingrese nuevamente su Contraseña: </label>
								<input class="form-control"type="password" name="clave2" required size="30" placeholder="Ingrese nuevamente su contraseña"/> <br>
								
								<div class="buttons" align="center">
									<button class="btn btn-danger" type="reset" title="Haga clic para limpiar formulario" >Limpiar formulario</button>
									<button type="submit" name="registro" value="registro" title="Haga clic para Registrarse" class="btn btn-danger">Registrarse</button>
								</div><br>
					</form>
			</div>
		</div>
	</div>
<?php
	endif;
include_once 'librerias/pie.php'; ?>