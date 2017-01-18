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
        <h2>Consultar  Paciente</h2>

<form method="post" action="consulta_pac.php">
	<label>Paciente: </label>
		<?php 
		$sql=("SELECT * FROM paciente");
		$result=mysqli_query($mysqli,$sql);
		?>

	
		<input class="form-control" type="number" value="" name="cedu_pac" placeholder="Ingrese la cedula del paciente " required/>

						<div class="buttons text-center">
						<!-- Botones -->
								<button type="submit" name="consulta2" class="btn btn-sistema"><span class="glyphicon glyphicon-search"></span>Consultar</button>

								
						</div>
    	</form>
        </div>
		</div>
	</div>
</section>
  <?php include_once 'pie.php'; ?>
	