<?php include_once 'librerias/cabecera.php';?>
	<div class="container">
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Crea su cuenta del laboratorio de simulacion</h2><br>
					<form  method="POST" action="nuevo_usu.php">
						<?php
							extract($_POST);
							if (isset($registro)) :
							//EXTRAEMOS Y CONECTAMOS
							require_once 'includes/conexion_bd.php';
							
							$sql=("SELECT correo FROM user WHERE correo='$correo'");
							$consulta=(mysqli_query($mysqli,$sql));
							if(mysqli_num_rows($consulta)): ?>
								<script type="text/javascript">
									alert("El correo ya esta registrado con otro usuario!");
									window.location="nuevo_usu.php";
								</script>
							<?php 
							else:

							if($clave1 !== $clave2): ?>

							<script type="text/javascript">
								alert("	No coinciden las claves ingresadas!");
								window.location="nuevo_usu.php";
							</script>
							<?php 
								endif;

								$command_sql="INSERT INTO user (correo,clave,nombre,apellido) VALUES ('$correo','$clave1','$nombre','$apellido')";
								require 'includes/sql.php';
							?>
							<script type="text/javascript">
								alert("	Estas registrado con éxito!");
								window.location="index.php";
							</script>

							<?php endif;

					 		else : ?>
					
							<h3> Datos Personales </h3>
								<label>Nombre: </label>
								<input class="form-control" type="text" name="nombre" maxlength="50" size="44" placeholder="Ingrese nombre de usuario" required pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+" title="Debe introducir solo letras" />
								
								<label>Apellido: </label>
								<input class="form-control" type="text" name="apellido" maxlength="50" size="44" placeholder="Ingrese apellido de usuario" required pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+" title="Debe introducir solo letras" />

								<label>Correo electronico: </label>
								<input class="form-control" type="email" name="correo" placeholder="email@example.com" required size="30" />
					
								<label> Contraseña: </label>
								<input class="form-control"type="password" name="clave1" required size="30" placeholder="Ingrese su contraseña"/> 

								<label> Ingrese nuevamente su Contraseña: </label>
								<input class="form-control"type="password" name="clave2" required size="30" placeholder="Ingrese nuevamente su contraseña"/> <br>
					
								<div class="text-center">
									<button class="btn btn-warning" type="button" onclick=location="index.php">Regresar atrás</button>
									<button class="btn btn-warning" type="reset" title="Haga clic para limpiar formulario" >Limpiar formulario</button>
									<button type="submit" name="registro" value="registro" title="Haga clic para Registrarse" class="btn btn-warning">Registrarse</button>
								</div><br>
					</form>
			</div>
		</div>
	</div>
<?php
	endif;
include_once 'librerias/pie.php'; ?>