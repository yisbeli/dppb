<?php
	include_once 'cabecera.php';
  include_once 'libs/menu.php';
  include_once 'inactivo.php';
  include_once 'sesion.php';
$cod_serv=$_REQUEST['cod_serv'];
//$cod_serv = isset($_POST['cod_serv']);
$sql=("SELECT * FROM servicios WHERE cod_serv='$cod_serv'");

$result=mysqli_query($mysqli,$sql);
$row=mysqli_fetch_array($result);

?>

<section class="container">
	
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<legend>Modificar  Servicio Operacional</legend>
				
		<form method="POST" action="modificar_serv1.php">
		<br/>
    <div class="col-md-12">
    <label>Codigo:</label>
     <input class="form-control" type="text" readonly="readonly" name="cod_serv" value="<?php echo $row['cod_serv']; ?>" size="5" id="cod_serv" />
      
       </div> 
        <div class="col-md-6">
        <label  for="month"> Fecha de Servicio:</label>
        <input  class="form-control" type="date" name="fecha_serv" value="<?php echo $row['fecha_serv']; ?>" required/>
      </div>

       <div class="col-md-6">
      <label>Hora de Salida:</label>
      <input  class="form-control" type="time" name="hora_salida" value="" size="5" id="hora_salida" maxlength="5"  value="<?php echo $row['hora_salida']; ?>" required/>
      </div>
      <br/>

      <div class="col-md-6">
    <label>Hora de Llegada :</label>
    <input class="form-control" type="time" name="hora_llegada" value="" size="5" id="hl" maxlength="5" value="<?php echo $row['hora_llegada']; ?>" required/>
      </div>
      <br/>

      <div class="col-md-6">
      <label>Hora de Ingreso :</label>
    <input class="form-control" type="time" name="hora_ingreso" value="" size="5" id="hi" maxlength="5" value="<?php echo $row['hora_ingreso']; ?>" required/>
      </div>
      <br/>

      <div class="col-md-6">
      <label  for="parroquia"> Parroquia:</label>
      <input class="form-control" type="text" name="parroquia" id="parroquia" value="<?php echo $row['parroquia']; ?>" required/>
      </div>
      <br/>

      <div class="col-md-6">
      <label for="direccion"> Dirección Salida:</label>
      <input class="form-control" type="text" name="direc_salida" id="direccion" value="<?php echo $row['direc_salida']; ?>" required/>
      </div>
       <br/>

       <div class="col-md-6">
      <label for="direccion"> Dirección Destino:</label>
      <input class="form-control" type="text" name="direc_destino" id="direccion" value="<?php echo $row['direc_destino']; ?>" required/>
       </div>
       <br/>

       <div class="col-md-6">
       <label for="insumos">Insumos: </label>
      <input class="form-control" type="text" id="insumos" name="insumos" value="<?php echo $row['insumos']; ?>" />
    </div>

          <div class="col-md-6">
          <label for="id_tipo_serv"> Tipo de Servicio :</label>
                <?php             
                  require_once 'config/conexion_bd.php';
                  $command_sql = "SELECT id_tipo_serv, nomb_tipo_serv FROM tipo_servicio";
                  require 'config/sql.php';
                ?>
         

   <select class="form-control" name="id_tipo_serv"  required>
                              <option name="id_tipo_serv" value="<?php echo $row['id_tipo_serv'];?>">--Seleccione--</option>
                              <?php
                while($registro=mysqli_fetch_array($result))
                {
                ?>
                              <option name="id_tipo_serv" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
                <?php } ?>
       </select>
       </div>
       <br/>  

       <div class="col-md-6">
     <label for="id_unidad"> Unidad:</label>
								<?php								
									require_once 'config/conexion_bd.php';
									$command_sql = "SELECT id_unidad, seudonimo FROM unidades";
									require 'config/sql.php';
								?>
	 <select class="form-control" name="id_unidad" id="id_unidad" required>
                          	  <option name="id_unidad" value="">--Seleccione--</option>
                          	  <?php
								while($registro=mysqli_fetch_array($result))
								{
							?>
                          	  <option name="id_unidad" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
                          	
    </select>
      </div>
    <br/>

      <div class="col-md-6">
    <label for="id_municipio"> Municipio:</label>
								<?php								
									require_once 'config/conexion_bd.php';
									$command_sql = "SELECT id_municipio, nomb_mun FROM municipios";
									require 'config/sql.php';
								?>
	 <select class="form-control" name="id_municipio" id="id_municipio" required>
                          	  <option name="id_municipio" value="">--Seleccione--</option>
                          	  <?php
								while($registro=mysqli_fetch_array($result))
								{
							  ?>
                          	  
                          	  <option name="id_municipio" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
    </select> 
      </div>
    <br/>  

      <div class="col-md-6">
    <label for="cod_resp"> Responsable:</label>
								<?php								
									require_once 'config/conexion_bd.php';
									$command_sql = "SELECT cod_resp, nomb_resp FROM responsables";
									require 'config/sql.php';
								?>
	 <select class="form-control" name="cod_resp" id="cod_resp" required>
                          	  <option name="cod_resp" value="">--Seleccione--</option>
                          	  <?php
								while($registro=mysqli_fetch_array($result))
								{
							  ?>
                          	  
                          	  <option name="" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
    </select> 
      </div>
    <br/>


    <div class="buttons text-center">
						<!-- Botones -->



                
							 <button class="btn btn-sistema" type="reset" title="volver" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>

               <button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>

              	<button  type="registrar" name="registro" value="Modificar" title="Haga clic para Modificar servicio operacional" class="btn btn-sistema" > <span class="glyphicon glyphicon-floppy-saved"> </span> Guardar Servicio </button>

								
							
              </section>

		</div>
    </form>
        </div>
		</div>
	</div>
</section>
  <?php include_once 'pie.php'; ?>