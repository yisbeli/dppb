<?php
include_once 'cabecera.php';
include_once 'libs/menu.php';
$ced_resp = $_REQUEST['ce'];
$sql="SELECT * FROM responsables WHERE ced_resp='$ced_resp'";
$result=mysqli_query($mysqli,$sql);
$row=mysqli_fetch_array($result);
?>
<section class="container modificarResponsable">
    <div class="rows">
      <div class="col-md-3"></div>
      <div class="col-md-6">
        <legend>Modificar Responsable</legend>
		<form method="post" action="modificar_responsable2.php">
			<div class="col-md-6">
				<input class="form-control" type="number" name="ced_resp" value="<?php echo $row['ced_resp']; ?>" required />
     		</div>
			<div class="col-md-6">
				<input class="form-control" type="text" name="nomb_resp" value="<?php echo $row['nomb_resp'];?>" required>
			</div>
			<div class="col-md-6">
				<input type="text" name="apell_resp" value="<?php echo $row['apell_resp'];?>" class="form-control" required>
			</div>
			<div class="col-md-6">
				<input type="text" name="espe_resp" value="<?php echo $row['espe_resp'];?>" class="form-control" required>
			</div>
			<div class="col-md-6">
				<select name="id_nivel" class="form-control" required> 
					<?php
					include 'config/conexion_bd.php';
					$sql= "SELECT * FROM nivel_academico";
					$a=mysqli_query($mysqli,$sql);
					while ($r=mysqli_fetch_array($a)) :
						if ($row['id_nivel']==$r[0]) {
							echo "<option value='$r[0]' selected>$r[1]</option>";	
						}
						else{
							echo "<option value='$r[0]'>$r[1]</option>";
						}
					endwhile;
					?>
				</select>
			</div>
			<div class="col-md-6">
				<select name="id_tipo" class="form-control"> 
				<?php
					include 'config/conexion_bd.php';
					$sql= "SELECT * FROM tipos_resp";
					$a=mysqli_query($mysqli,$sql);
					while ($r2=mysqli_fetch_array($a)) :
						if ($row['id_tipo']==$r2[0]) {
							echo "<option value='$r2[0]' selected>$r2[1]</option>";	
						}
						else{
							echo "<option value='$r2[0]'>$r2[1]</option>";
						}
					endwhile;
				?>
				</select>
			</div>
			<div class="row text-center">
				<button class="btn btn-sistema" type="reset" title="volver" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio </button>
				<button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario </button>
				<button type="submit" name="registro" value="Registrar" class="btn btn-sistema"> <span class="glyphicon glyphicon-floppy-saved"></span> Guardar Responsable </button>
				</div>
			</div>
		</form>
		</div>
	</div>
</section>
<?php include_once 'pie.php';  ?>