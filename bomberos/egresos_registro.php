<?php include_once 'librerias/cabecera.php';?>
	<div class="container">
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Registre los Egresos</h2><br>
					<form  method="POST" action="egresos.php">
						<?php
							extract($_POST);
							if (isset($registro)) :
							//EXTRAEMOS Y CONECTAMOS
							require_once 'includes/conexion_bd.php';?>
							
							<?php 

								$command_sql="INSERT INTO egresos(fech_egr,clase_egr,monto_egr,num_factura) VALUES ('$fech_egr','$clase_egr','$monto_egr','$num_factura')";
								require 'includes/sql.php';
							?>
							<script type="text/javascript">
								alert("	Egreso registrado con éxito!");
								window.location="sala.php";
							</script>

							<?php

					 		else : ?>
					
							<h3> Datos de los egresos realizados </h3>
								<label>Fecha del egreso: </label>
								<input class="form-control" type="date" name="fech_egr" maxlength="50" size="44" placeholder="Ingrese la fecha del egreso" required  title="Debe introducir la fecha en que se realizo el egreso" />
									
								<label>Descripcion del egreso: </label>
								<input class="form-control" type="text" name="clase_egr" placeholder="Ingrese la descripcion de los gastos" required size="30" />
					
								<label> Monto: </label>
								<input class="form-control"type="text" name="monto_egr" required size="30" placeholder="Ingrese el monto" title="Introduzca correctamente el monto realizado" /> 

								<label> Numero de la factura: </label>
								<input class="form-control"type="text" name="num_factura" required size="30" placeholder="Ingrese el numero de la factura" title="Introduzca correctamente el numero de la factura" /> <br>
					
								<div class="text-center">
									<button class="btn btn-warning" type="button" onclick=location="sala.php">Regresar atrás</button>
									<button class="btn btn-warning" type="reset" title="Haga clic para limpiar formulario" >Limpiar formulario</button>
									<button type="submit" name="registro" value="registro" title="Haga clic para registrar el egreso" class="btn btn-warning">Registrar</button>
								</div><br>
					</form>
			</div>
		</div>
	</div>
<?php
	endif;
include_once 'librerias/pie.php'; ?>

