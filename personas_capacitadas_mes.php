<?php	include_once 'cabecera.php'; ?>
<?php 	include_once 'libs/menu.php'; ?>
	<section class="container">
	
	<div class="rows">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h2>Reporte mensual de las personas capacitadas</h2>
			<form method="POST" action="consulta_personas_mes.php">
				<legend>Seleccione un mes y ano</legend>
				<select class="form-control" name="mes"  class="nac">
						<option value=""> -- seleccione -- </option>
						<option name="mes" value="Enero"> Enero </option>
						<option name="mes" value="Febrero"> Febrero </option>
						<option name="mes" value="Marzo"> Marzo </option>
						<option name="mes" value="Abril"> Abril </option>
						<option name="mes" value="Mayo"> Mayo </option>
						<option name="mes" value="Junio"> Junio </option>
						<option name="mes" value="Julio"> Julio </option>
						<option name="mes" value="Agosto"> Agosto </option>
						<option name="mes" value="Septiembre"> Septiembre </option>
						<option name="mes" value="Octubre"> Octubre </option>
						<option name="mes" value="Noviembre"> Noviembre </option>
						<option name="mes" value="Diciembre"> Diciembre </option>
				</select>
				<select class="form-control" name="ano"  class="nac">
						<option value=""> -- seleccione -- </option>
						<option name="ano" value="2015"> 2015 </option>
						<option name="ano" value="2016"> 2016 </option>
				</select>
				
				<div class="text-center">
					<button type="submit" name="submit" class="btn btn-sistema"><span class="glyphicon glyphicon-search"></span> Consultar</button>					
				</div><br>
			</form>
		</div>
		</div>
</section>
<?php include_once 'pie.php'; ?>