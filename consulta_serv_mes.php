<?php include("cabecera.php"); 
	include_once 'libs/menu.php'; ?>
<section class="container">
		<div class="rows">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2 class="text-center">Cosulta de Servicios Operacionales</h2>
				
	<form style="margin:20px" method="post" action="consulta_serv2_mes.php">
	<legend for="id_tipo_serv">Consultar tipo de Servicios Operacionales </legend>
                <?php             
                  require_once 'config/conexion_bd.php';
                  $command_sql = "SELECT id_tipo_serv, nomb_tipo_serv FROM tipo_servicio";
                  require 'config/sql.php';
                ?>
         
   <select class="form-control" name="id_tipo_serv">
                              <option name="id_tipo_serv" value="">--Seleccione--</option>
                              <?php
                while($registro=mysqli_fetch_array($result))
                {
                ?>
                              <option name="id_tipo_serv" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
                <?php } ?>
       </select></br>
	<select class="form-control" name="mes">

		<option value="01">Enero</option>
		<option value="02">Febrero</option>
		<option value="03">Marzo</option>
		<option value="04">Abril</option>
		<option value="05">Mayo</option>
		<option value="06">Junio</option>
		<option value="07">Julio</option>
		<option value="08">Agosto</option>
		<option value="09">Septiembre</option>
		<option value="10">Octubre</option>
		<option value="11">Noviembre</option>
		<option value="12">Diciembre</option>
	</select>
	</br>
		<div class="buttons text-center">
		<button class="btn btn-sistema" name="submit"  type="submit"><span class="glyphicon glyphicon-search"></span>Consultar</button>
		</div>
</form>		
  </div>
		</div>
	</div>
		</div>
</section>
<?php include_once 'pie.php'; ?>