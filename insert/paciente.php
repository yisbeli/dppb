<?php include("../cabecera.php"); ?>
	<form method="post" action="inser_pac.php">
	<br/>
	 <label for="cedu_pac"> C.I:</label>
     <input type="text" name="cedu_pac" id="cedu_pac" required/>
     <br/>
     <br/>
	 <label for="nomb_pac"> Nombre:</label>
     <input type="text" name="nomb_pac" id="nomb_pac" required/>
     <br/>
     <br/>
     <label for="edad"> Edad:</label>
     <input type="text" name="edad" id="edad" required/>
     <br/>
     <br/>
     <label for="diag_pac"> Diagnostico del Paciente:</label><br/>
   	<textarea name="diag_pac" id="" rows="5" cols="40" placeholder="Ingrese la descripcion del paciente " required></textarea>
   	<br/>
	<br/>
    <label for="cod_serv"> Codigo de Servicio:</label>
								<?php								
									require_once '../includes/bd_conexion.php';
									/*$command_sql = "SELECT s.cod_serv, ts.nomb_tipo_serv FROM servicios s, tipo_servicio ts WHERE ts.id_tipo_serv = s.id_tipo_serv";*/
									$command_sql = "SELECT cod_serv from servicios";
									require '../includes/sql.php';
								?>
	 <select name="cod_serv" id="cod_serv">
                          	  <option name="cod_serv" value="">--Seleccione--</option>
                          	  <?php
								while($registro=mysqli_fetch_array($result))
								{
							  ?>
                          	  
                          	  <option name="" value="<?php echo $registro[0] ?> "><?php echo $registro[0] ?></option>
								<?php } ?>
    </select> 
    <br/>
    <br/>
	<input type="submit" class="submit" value="Registrar" title="Haga clic para Registrar Servicio"  />

								<input type="reset" id="reset" value="Limpiar formulario" title="Haga clic para limpiar formulario"  />
							</section>
        </form>
   <?php include("../piedepagina.php"); ?>
	
