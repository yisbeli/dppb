<?php
include_once 'cabecera.php';
include_once 'libs/menu.php';
$cod_plan = $_REQUEST['cp'];
$sql="SELECT * FROM planes WHERE cod_plan='$cod_plan'";
$result=mysqli_query($mysqli,$sql);
$row=mysqli_fetch_array($result);
?>
<section class="container modificarPlan">
    <div class="rows">
      <div class="col-md-3"></div>
      <div class="col-md-6">
        <legend>Modificar Plan</legend>
		<form method="post" action="modificar_plan2.php">
			<!-- Tipo del Plan de formacion -->
					<div class="row">
						<div class="col-md-6">
							<label>Tipo de plan de formacion: </label><br>
							<select name="tipo_plan" class="form-control" required>
							<?php 
							$sql2="SELECT * FROM tipo_plan";
							$p=mysqli_query($mysqli,$sql2);
							while ($m=mysqli_fetch_array($p)) :
								if ($row['tipo_plan']==$m[0]) {
									echo "<option value='$m[0]' selected>$m[1]</option>";	
						}
						else{
							echo "<option value='$m[0]'>$m[1]</option>";
						}
					endwhile;
					?>

							</select><br>
						</div>
						<!-- Nombre del Plan de Formacion -->
						<div class="col-md-6">
							<label for="nomb_plan">Nombre del plan de formacion: </label>
							<input class="form-control" type="text" name="nomb_plan" value="<?php echo $row['nomb_plan']; ?>"maxlength="50"size="44"  title="Solo caracteres y espacios" /><br>
						</div>
					</div>
					<!-- Descripcion del plan  -->
					<div class="row">
						<div class="col-md-6">
							<label for="desc_plan">Descripcion del plan de formacion: </label>
							<input class="form-control"type="text" name="desc_plan" value="<?php echo $row['desc_plan']; ?>" /><br>
						</div>
						<!-- Unidades tributarias-->
						<div class="col-md-6">		
							<label for="cant_uni">Cant. de unidad(es) tributaria(s): </label>
							<input class="form-control" type="number" name="cant_unid" value="<?php echo $row['cant_unid']; ?>" maxlength="10" size="44"  required>
						</div>
					</div>
					<!-- Botones -->
					<div class="row">
						<div class="col-md-4 text-left">					
							<button class="btn btn-sistema" type="button" title="volver" onclick=location="sala.php"><span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>
						</div>
						<div class="col-md-4 text-center">
							<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"><span class="glyphicon glyphicon-repeat"></span> Limpiar Formulario</button>
						</div>
						<div class="col-md-4 text-right">
							<input type="hidden" name="cod_plan" value="<?php echo $cod_plan; ?>">
							<button type="submit" name="registro" value="registro" title="Haga clic para Registrar un Plan" class="btn btn-sistema"> <span class="glyphicon glyphicon-floppy-saved"> </span> Guardar Plan</button>
						</div>
			</div>
		</form>
		</div>
	</div>
</section>
<?php include_once 'pie.php';  ?>