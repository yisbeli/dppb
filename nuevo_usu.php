<?php include_once 'cabecera.php'; ?>
<?php 	include_once 'libs/menu.php'; ?>
<?php 	include_once 'inactivo.php';
		include_once 'sesion.php'; ?>
	<section class="container">
	<?php //<section class="nuevou container">?>
		<div class="rows">
			<div class="col-md-5 col-md-offset-3">
				<h1 class="text-center">Cree su cuenta del laboratorio de simulacion</h1><br>
					<form  method="POST" action="nuevo_usu.php">
						<?php
							extract($_POST);
							if (isset($registro)) :
							//EXTRAEMOS Y CONECTAMOS
							require_once 'config/conexion_bd.php';
							
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
							//	$clave=md5($clave);
								$command_sql="INSERT INTO user (correo,clave,nombre) VALUES ('$correo','$clave1','$nombre')";
								require 'config/sql.php';
							?>
							<script type="text/javascript">
								alert("	Estas registrado con éxito!");
								window.location="index.php";
							</script>

							<?php endif;

					 		else : ?>
					
							<legend> <h2>Datos Personales </h2></legend>
								<input class="form-control" type="text" name="nombre" maxlength="50" size="44" placeholder="Ingrese nombre de usuario" required pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+" title="Debe introducir solo letras" />
								
								<input class="form-control" type="email" name="correo" placeholder="email@example.com" required size="30" />
					
								<input class="form-control"type="password" name="clave1" required size="30" placeholder="Ingrese su contraseña"/> 

								<input class="form-control"type="password" name="clave2" required size="30" placeholder="Ingrese nuevamente su contraseña"/> <br>
					
								<div class="text-center">
									<button class="btn btn-sistema" type="reset" title="volver" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>
						<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>
									<button type="submit" name="registro" value="registro" title="Haga clic para Registrarse" class="btn btn-sistema"><span class="glyphicon glyphicon-hand-up"></span> Registrarse</button>
								</div><br>
					</form>
			</div>
		</div>
	</section>
<?php
	endif;
include_once 'pie.php'; ?>