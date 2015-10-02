<?php
include 'cabecera.php';
if (empty($_SESSION['log'])){
	?>
		<section>
			<form onsubmit="return validar(this)" method="post" action="nuevo_usu2.php">
						<h2> INFORMACION PERSONAL </h2>
						<fieldset>
							<ul>
								<li><label>Nombre: </label>
									<input type="text" name="nombre" required pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+" title="Debe introducir solo letras" size="40"></li>
								<li><label>Correo electronico: </label>
									<input type="email" name="correo" required size="30"></li>
									<li></li>
								<li><label> Contraseña: </label>
									<input type="password" name="clave" required size="30"></li>
									<li></li>
								<li><button type="submit">REGISTRARME</button></li>
							</ul>	
						</fieldset>
					</form>
		</section>
<?php
include 'piedepagina.php';
}
?>