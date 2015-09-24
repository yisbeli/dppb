<?php
	include_once '../includes/bd_conexion.php';
	include("../cabecera.php");
?>
			<div id="cuerpo">
				<?php
					//EXTRAEMOS Y CONECTAMOS
					extract ($_POST);
					
					// REALIZAR LA  ACTUALIZACIÓN DE LOS DATOS
					$command_sql = "UPDATE responsables SET ced_resp='$ced_resp', nomb_resp='$nomb_resp', apell_resp='$apell_resp', espe_resp='$espe_resp', id_nivel='$id_nivel', id_tipo='$id_tipo' WHERE ced_resp='$cod'";
				
					
					include '../includes/sql.php';
						
					if(mysqli_affected_rows($mysqli) == 1){
						echo "<h1>Se modificó con exito el responsable<h1>";
					} else {
						echo "<h3>No se modificó el registro por:<h3></br>
						<b>a)</b> El responsable no existe ó<br />
						<b>b)</b> No se introdujo ningun cambio en el registro";
					}
				?><br /><br />
				<!-- BOTON -->
				<input type="button" class="submit" id="submit" value="Modificar otro Responsable" onclick=location="indexresp.php" align="center" />
				
			</div> <!-- /cuerpo -->
			<!--Pie de página-->
	<?php  include("../piedepagina.php");?>