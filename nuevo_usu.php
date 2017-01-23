<?php include_once 'cabecera.php'; ?>
<?php 	include_once 'libs/menu.php'; ?>
	<section class="container">
	<?php //<section class="nuevou container">?>
		<div class="rows">
			<div class="col-md-5 col-md-offset-3">
				<h1 class="text-center">Crea su cuenta del laboratorio de simulacion</h1><br>
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
							elseif(empty($respuesta)):
								?>
									<script type="text/javascript">
										alert("Debes introducir una respuesta");
										window.location="nuevo_usu.php";
									</script>
								<?php
								elseif(empty($pregunta)):
									?>
										<script type="text/javascript">
											alert("Debes seleccionar una pregunta");
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
								$clave=md5($clave1);
								$respuesta=md5($respuesta);
								$command_sql="INSERT INTO user (correo,clave,nombre,pregunta,respuesta) VALUES ('$correo','$clave','$nombre','$pregunta','$respuesta')";
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

								<input class="form-control"type="password" name="clave2" required size="30" placeholder="Ingrese nuevamente su contraseña"/>

								<select name="pregunta" required>
									<option value="">Elija una Pregunta de Seguridad</option>
									<option value="1">Nombre de su madre</option>
									<option value="2">Su mejor amigo de la infancia</option>
									<option value="3">Su personaje favorito</option>
									<option value="4">Su profesor de primaria</option>
									<option value="5">Año de promocion de los bomberos</option>
									<option value="6">Nombre de su padre</option>
									<option value="7">Su equipo de futbol favorito</option>
									<option value="8">Su color favorito</option>
									<option value="9">Lugar de nacimiento</option>

								</select>

								<input class="form-control"type="text" name="respuesta" required size="30" placeholder="Respuesta de seguridad"/>

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
