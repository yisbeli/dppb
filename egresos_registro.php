<?php include_once 'cabecera.php';?>
<?php 	include_once 'libs/menu.php'; ?>
	<section class="container">
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Registre los egresos</h2><br>
					<form  method="POST" action="egresos_registro.php">
						<?php
							extract($_POST);
							if (isset($registro)) :
							//EXTRAEMOS Y CONECTAMOS
							require_once 'config/conexion_bd.php';?>
							
							<?php 

								$con="SELECT * FROM fondos WHERE id=1";
								$result = mysqli_query($mysqli, $con);
                      		  	$resultado=mysqli_fetch_array($result);

                      		  	$var=$resultado[2]+$monto_egr;
                      		  	$var2=$resultado[3]-$monto_egr;

                      		  	$con="UPDATE fondos SET total_egreso='$var', saldo='$var2' WHERE id=1";
                      		  	mysqli_query($mysqli,$con);



								$command_sql="INSERT INTO egresos(fech_egr,clase_egr,monto_egr,num_factura) VALUES ('$fech_egr','$clase_egr','$monto_egr','$num_factura')";
								require 'config/sql.php';
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
									<button class="btn btn-sistema" type="button" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Regresar atrás</button>
									<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>
									<button type="submit" name="registro" value="registro" title="Haga clic para registrar el egreso" class="btn btn-sistema"><span class="glyphicon glyphicon-floppy-saved"> </span> Guardar </button>
								</div><br>
					</form>
			</div>
		</div>
	</div>
</section>
<?php
	endif;
include_once 'pie.php'; ?>

