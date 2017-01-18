<?php	include_once 'cabecera.php'; ?>
<?php 	include_once 'libs/menu.php'; ?>
<?php 	include_once 'inactivo.php';
		include_once 'sesion.php'; ?>
	<section class="responsable container">

	<?php extract($_POST);
	if (isset($registro)) :
		include 'config/conexion_bd.php';
		$sql = "INSERT INTO responsables (ced_resp, nomb_resp, apell_resp, espe_resp, id_nivel, id_tipo) VALUES ('$ced_resp', '$nomb_resp', '$apell_resp', '$espe_resp', '$nivel', '$tipo')";
		mysqli_query($mysqli, $sql);
		$sql = "SELECT MAX(cod_resp) FROM responsables";
		$a = mysqli_query($mysqli, $sql);
		$b = mysqli_fetch_array($a);
		$iduser = $_SESSION['iduser'];
		$sql = "UPDATE user SET responsable='$b[0]' WHERE iduser='$iduser'";
		mysqli_query($mysqli, $sql); ?>
		<script type="text/javascript">
			alert("Registrado con éxito!");
			window.location="sala.php";
		</script>
	<?php
	else : ?>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form action="responsables.php" method="POST">
					
					<legend><h3>Registro de responsable</h3></legend>
					<div class="col-md-6">
						<input type="number" name="ced_resp" placeholder="Cedula" class="form-control" required>
					</div>

					<div class="col-md-6">
						<input type="text" name="nomb_resp" placeholder="Nombre" class="form-control" required>
					</div>

					<div class="col-md-6">
						<input type="text" name="apell_resp" placeholder="Apellido" class="form-control" required>
					</div>

					<div class="col-md-6">
						<input type="text" name="espe_resp" placeholder="Especialidad" class="form-control" required>
					</div>

					<div class="col-md-6">
						<select name="nivel" class="form-control" required> 
						<option selected disabled value=""> --Seleccione-- </option>
							<?php
							include 'config/conexion_bd.php';
							$sql= "SELECT * FROM nivel_academico";
							$a=mysqli_query($mysqli,$sql);
							while ($r=mysqli_fetch_array($a)) :
								echo "<option value='$r[0]'>$r[1]</option>";
							endwhile;
							?>
						</select>
					</div>

					<div class="col-md-6">
						<select name="tipo" class="form-control" required> 
						<option selected disabled value=""> --Seleccione-- </option>
						
						<?php
							include 'config/conexion_bd.php';
							$sql= "SELECT * FROM tipos_resp";
							$a=mysqli_query($mysqli,$sql);
							while ($r=mysqli_fetch_array($a)) :
								echo "<option value='$r[0]'>$r[1]</option>";
							endwhile;
						?>
						</select>
					</div>
				
					<div class="text-center">
					
						<button class="btn btn-sistema" type="reset" title="volver" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio </button>
						<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario </button>
						<button type="submit" name="registro" value="Registrar" class="btn btn-sistema"> <span class="glyphicon glyphicon-floppy-saved"></span> Guardar Responsable </button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<?php endif;
	include_once 'pie.php';  ?>
