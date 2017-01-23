<?php
	include_once 'cabecera.php';
  include_once 'libs/menu.php';
?>


<section class="container">
	
	<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				
<form style="margin:20px" method="post" action="consulta_serv3.php">
<legend for="id_tipo_serv">Consultar tipo de Servicios Operacionales </legend>
                <?php             
                  require_once 'config/conexion_bd.php';
                  $command_sql = "SELECT id_tipo_serv, nomb_tipo_serv FROM tipo_servicio";
                  require 'config/sql.php'
                ?>
   <select class="form-control" name="id_tipo_serv" id="id_tipo_serv">
                              <option disabled selected >--Seleccione--</option>
                              <?php while($registro=mysqli_fetch_array($result))
                {      ?>
                              <option name="id_tipo_serv" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
                <?php } ?>
       </select>
       <br/>
       <div class="buttons text-center">	
		<button class="btn btn-sistema" type="submit" class="submit"> <span class="glyphicon glyphicon-search"></span> Consultar </button>
	  </div>
	
</form>
</div>
		</div>
	</div>
		</div>
</section>
<?php include_once 'pie.php'; ?>
