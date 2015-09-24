<?php include("../cabecera.php"); ?>

		<form method="post" action="inser_serv.php">
		<br/>
         
       <br/>
       <br/>
        <strong>Hora de Salida:</strong>
      <input type="text" name="hora_salida" value="" size="5" id="hora_salida" maxlength="5"/>
      <label>Turno:</label>
      <select name="turn" id="turn">
        <option value="am">am</option>
        <option value="pm">pm</option>
      </select>
      <br/>
      <br/>
    <strong>Hora de Llegada :</strong>
    <input type="text" name="hora_llegada" value="" size="5" id="hl" maxlength="5"/>
    <label>Turno:</label>
      <select name="turn" id="categoria">
        <option value="am">am</option>
        <option value="pm">pm</option>
      </select>
      <br/>
      <br/>
      <strong>Hora de Ingreso :</strong>
    <input type="text" name="hora_ingreso" value="" size="5" id="hi" maxlength="5"/>
      <label>Turno:</label>
      <select name="turn" id="categoria">
        <option value="am">am</option>
        <option value="pm">pm</option>
      </select>
      <br/>
      <br/>
      <label for="parroquia"> Parroquia:</label>
      <input type="text" name="parroquia" id="parroquia" required/>
        <br/>
        <br/>

      <label for="direccion"> Dirección Salida:</label>
      <input type="text" name="direc_salida" id="direccion" required/>
        <br/>
        <br/>
      <label for="direccion"> Dirección Destino:</label>
      <input type="text" name="direc_destino" id="direccion" required/>
        <br/>
        <br/>
        <label for="id_tipo_serv"> Tipo de Servicio :</label>
								<?php							
									require_once '../includes/bd_conexion.php';
									$command_sql = "SELECT id_tipo_serv, nomb_tipo_serv FROM tipo_servicio";
									require '../includes/sql.php';
								?>
         
	 <select name="id_tipo_serv">
                          	  <option name="id_tipo_serv" value="">--Seleccione--</option>
                          	  <?php
								while($registro=mysqli_fetch_array($result))
								{
							  ?>
                          	  <option name="id_tipo_serv" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
       </select>
       <br/>
       <br/>

     <label for="id_unidad"> Unidad:</label>
								<?php								
									require_once '../includes/bd_conexion.php';
									$command_sql = "SELECT id_unidad, seudonimo FROM unidades";
									require '../includes/sql.php';
								?>
	 <select name="id_unidad" id="id_unidad">
                          	  <option name="id_unidad" value="">--Seleccione--</option>
                          	  <?php
								while($registro=mysqli_fetch_array($result))
								{
							?>
                          	  <option name="id_unidad" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
                          	
    </select>
    <br/>
    <br/>
     <label for="id_municipio"> Municipio:</label>
								<?php								
									require_once '../includes/bd_conexion.php';
									$command_sql = "SELECT id_municipio, nomb_mun FROM municipios";
									require '../includes/sql.php';
								?>
	 <select name="id_municipio" id="id_municipio">
                          	  <option name="id_municipio" value="">--Seleccione--</option>
                          	  <?php
								while($registro=mysqli_fetch_array($result))
								{
							  ?>
                          	  
                          	  <option name="id_municipio" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
    </select> 
    <br/>
    <br/>
      
     
     <label for="cod_resp"> Responsable:</label>
								<?php								
									require_once '../includes/bd_conexion.php';
									$command_sql = "SELECT cod_resp, nomb_resp FROM responsables";
									require '../includes/sql.php';
								?>
	 <select name="cod_resp" id="cod_resp">
                          	  <option name="cod_resp" value="">--Seleccione--</option>
                          	  <?php
								while($registro=mysqli_fetch_array($result))
								{
							  ?>
                          	  
                          	  <option name="" value="<?php echo $registro[0] ?> "><?php echo $registro[1] ?></option>
								<?php } ?>
    </select> 
    <br/>
    <br/>

						<!-- Botones -->
								<input type="submit" class="submit" value="Registrar" title="Haga clic para Registrar Servicio"  />

								<input type="reset" id="reset" value="Limpiar formulario" title="Haga clic para limpiar formulario"  />
							</section>
        </form>
   <?php include("../piedepagina.php"); ?>
