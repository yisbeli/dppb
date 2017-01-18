<?php
	include_once 'cabecera.php';
  include_once 'libs/menu.php';?>
<?php 	include_once 'inactivo.php';
		include_once 'sesion.php'; ?>
<section class="container">
	
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Registro de Tipo de Servicio </h2>
				
		<form method="post" action="inser_tipo_serv.php">
				<br/>
        		<label  for="month"> Tipo de Servicio:</label>
       			 <input  class="form-control" type="text" name="nomb_tipo_serv" required/>
    				<div class="buttons text-center">
						<!-- Botones -->
								<input  class="btn btn-sistema"  type="submit" class="submit" value="Registrar" title="Haga clic para Registrar Servicio"  />

								<input class="btn btn-sistema" type="reset" id="reset" value="Limpiar formulario" title="Haga clic para limpiar formulario"  />		
</section>
					</div>
		</form>
        </div>
		</div>
	</div>
</section>

  <?php  

  include_once 'pie.php'; ?>
