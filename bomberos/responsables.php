<?php	include_once 'librerias/cabecera.php'; ?>
	<div class="container">

	<?php extract($_POST);
	if (isset($resgistrar)) :
		include 'includes/conexion_bd.php';
		$sql = "INSERT INTO responsables (ced_resp, nomb_resp, apell_resp, espe_resp, id_nivel, id_tipo) VALUES ('$ced_resp', '$nomb_resp', 'apell_resp', '$espe_resp', '$nivel', '$tipo')";
		mysqli_query($mysqli, $sql);

		$sql = "SELECT MAX(cod_resp) FROM responsables";
		$a = mysqli_query($mysqli, $sql);
		$b = mysqli_fetch_array($a);

		$iduser = $_SESSION['iduser'];
		$sql = "UPDATE user SET responsable='$b[0]' WHERE iduser='$iduser'";
		mysqli_query($mysqli, $sql);
	?>
	<script type="text/javascript">
		alert("Has culminado el registro con éxito! ");
		window.location="../sala.php";
	</script>
	<?php
	else :
		include_once 'librerias/menu.php'; ?>
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form action="responsables.php" method="POST">
					
					<h2>Registro de responsable</h2>
					
					<label>Cedula</label>
					<input type="text" name="ced_resp" placeholder="Cedula" class="form-control">

					<label>Nombre</label>
					<input type="text" name="nomb_resp" placeholder="Nombre" class="form-control">

					<label>Apellido</label>
					<input type="text" name="apell_resp" placeholder="apellido" class="form-control">

					<label>Especialidad</label>
					<input type="text" name="espe_resp" placeholder="Especialidad" class="form-control">

					<label>Nivel academico</label>
					<select name="nivel" class="form-control"> 
						
					<?php
						include 'includes/conexion_bd.php';
						$sql= "SELECT * FROM nivel_academico";
						$a=mysqli_query($mysqli,$sql);
						while ($r=mysqli_fetch_array($a)) :
							echo "<option value='$r[0]'>$r[1]</option>";
						endwhile;
					?>
					</select>

					<label>Tipo plan</label>
					<select name="tipo" class="form-control"> 
						
					<?php
						include 'includes/conexion_bd.php';
						$sql= "SELECT * FROM tipos_resp";
						$a=mysqli_query($mysqli,$sql);
						while ($r=mysqli_fetch_array($a)) :
							echo "<option value='$r[0]'>$r[1]</option>";
						endwhile;
					?>
					</select>
				
					<div class="text-center"><br>
						<button class="btn btn-warning" type="reset">Limpiar formulario</button>
						<button class="btn btn-warning" type="submit" name="resgistrar">Resgistrar responsable</button>					
					</div>
				</form>
			</div>
		</div>
	</div>
<?php endif;
	include_once 'librerias/pie.php'; ?>
