<?php
	include_once '../includes/bd_conexion.php';
	include("../cabecera.php");
?>
			<div id="cuerpo">
					<section>
						<form action="listar_responsable.php" method="post">
							<label for="uni">Ingrese la cedula del Responsable:</label>
							<input  type="text" id="text_form" name="responsable" /> <br /><br />
							<input type="submit" class="submit" value="Enviar" />
						</form>
					</section>

			</div> <!-- /cuerpo -->
			<!--Pie de página-->
<?php  include("../piedepagina.php");?>