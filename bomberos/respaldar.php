<?php
	include_once 'librerias/cabecera.php';
?>
	<div class="container">
		<div class="rows">
			<div class="cold-md-3"></div>
			<div class="col-md-6">
				<h2>Respaldar</h2><br>
				<form method="POST" action="respaldar.php" >

					<?php
						extract($_POST);
						if(isset($respaldar)):

						//EXTRAEMOS Y CONECTAMOS

						require_once 'includes/conexion_bd.php';

						$command_sql = "INSERT INTO respaldar SELECT * FROM respaldar";
						$command_sql = mysql_query($respaldar) or die(mysql_error());
						require 'includes/sql.php';
 
					 ?>
					 <script type="text/javascript">
					 	alert(" Se ha Realizado el Respaldo con Exito!");
					 	window.location="index.php"
					 </script>
 
					<?php else : ?>

						<label>Realizar Respaldo: </label>
								<select name="resp_bd">
									//<option name="resp_bd" value=""> -- Seleccione -- </option>
									<option name="resp_bd" value="Pendrive">Pendrive</option>
									<option name="resp_bd" value="Documentos">Documentos</option>
								</select> <br /><br />	
						<div class="buttons" aling="center">
							<button type="submit" name="respaldar" value="respaldar" title="Haga clic para Respaldar" class="btn btn-danger">Respaldar</button>

						</div><br>	
				</form>
			</div>
		</div>
	</div>
  
<?php
	
	endif;
	include_once 'librerias/pie.php'; ?>    