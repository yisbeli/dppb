<?php include("cabecera.php"); ?>
		<h2>Iniciar Sesión</h2>
			<form method="POST" action="config/login.php">
				<ul>
					<li><label>Correo electronico:</label>
						<input type="email" name="correo" size="35">
					</li>
					<li><label>Contraseña:</label>
						<input type="password" name="clave" size="35" maxlength="16">
					</li>
					<li><br> <button type="submit">Entrar</button> 
					</li>
				</ul>
			</form>		
		<a href="nuevo_usu.php"> <button style="margin-left:10px"> Registrar Nuevo Usuario </button> </a>
<?php include("piedepagina.php"); ?>