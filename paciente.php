<?php
  include_once 'cabecera.php';
  include_once 'libs/menu.php';
  include_once 'inactivo.php';
  include_once 'sesion.php';
?>

<section class="container">
 
    <div class="rows">
      <div class="col-md-3"></div>
      <div class="col-md-6">
        <legend>Registro del Paciente</legend>

<form method="post" action="inser_pac.php">

       <div class="col-md-6">
	   <label for="cedu_pac"> C.I:</label>
     <input class="form-control" type="number" name="cedu_pac" id="cedu_pac"  placeholder="Ingrese  solo caracteres numericos "required />
     </div>
	
     <div class="col-md-6">
    <label for="nomb_pac"> Nombre:</label>
    <input class="form-control" type="text" name="nomb_pac" id="nomb_pac" placeholder="Ingrese nombre del paciente" required/>
     </div>

      <div class="col-md-6">
     <label for="edad"> Edad:</label>
     <input class="form-control" type="number" name="edad" id="edad" placeholder="Ingrese  solo caracteres numericos" required/>
     </div>  
     
     <div class="col-md-6">
    <label for="diag_pac"> Diagnostico del Paciente:</label><br/>
   	<input class="form-control" name="diag_pac" id="" placeholder="Ingrese la descripcion del paciente " required>
   	</div>  
    
    <div class="col-md-12">
    <label for="cod_serv"> Codigo de Servicio:</label>
								<?php								
									/*$command_sql = "SELECT s.cod_serv, ts.nomb_tipo_serv FROM servicios s, tipo_servicio ts WHERE ts.id_tipo_serv = s.id_tipo_serv";*/
									$command_sql = "SELECT cod_serv from servicios";
									include 'config/sql.php';
								?>
	 <select class="form-control" name="cod_serv" id="cod_serv">
                          	  <option name="cod_serv" value="">--Seleccione--</option>
                          	  <?php
								while($registro=mysqli_fetch_array($result))
								{
							  ?>
                          	  
                          	  <option name="" value="<?php echo $registro[0] ?> "><?php echo $registro[0] ?></option>
								<?php } ?>
    </select>
    <div class="buttons text-center">
  <div align="center">
            <!-- Botones -->
              <button class="btn btn-sistema" type="button" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio </button>
              <button type="submit" name="registro" value="registro" title="Haga clic para registrar el paciente" class="btn btn-sistema" onclick="valida()" ><span class="glyphicon glyphicon-floppy-saved">  </span> Guardar Paciente</button>
              <button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>   
      </div>
      <br/>
    </div> 
  </div>


  
  </form>

      
</section>


  <?php include_once 'pie.php'; ?>
  