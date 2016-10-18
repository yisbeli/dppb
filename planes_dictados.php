<?php	include_once 'cabecera.php'; ?>
<?php 	include_once 'libs/menu.php'; ?>
	<section class="container">
	
	<div class="rows">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h2>Reporte mensual de los planes dictados</h2>
			<form method="POST" action="consulta_planes_dictados.php">
				<legend>Seleccione un mes y ano</legend>
				<select class="form-control" name="mes"  class="nac">
					<option value=""> -- seleccione -- </option>
					<option value="01"> Enero </option>
					<option value="02"> Febrero </option>
					<option value="03"> Marzo </option>
					<option value="04"> Abril </option>
					<option value="05"> Mayo </option>
					<option value="06"> Junio </option>
					<option value="07"> Julio </option>
					<option value="08"> Agosto </option>
					<option value="09"> Septiembre </option>
					<option value="10"> Octubre </option>
					<option value="11"> Noviembre </option>
					<option value="12"> Diciembre </option>
				</select>
				<select class="form-control" name="ano"  class="nac">
					<option value=""> -- seleccione -- </option>
					<option value="2015"> 2015 </option>
					<option value="2016"> 2016 </option>
				</select>
				
				<div class="text-center">
					<button type="submit" name="submit" class="btn btn-sistema"><span class="glyphicon glyphicon-search"></span> Consultar</button>					
				</div><br>
			</form>
		</div>
		</div>
</section>
<?php include_once 'pie.php'; ?>