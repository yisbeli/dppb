<?php include("../cabecera.php"); ?>
<h2>Reporte de Ingreso de dinero</h2>
<form style="margin:20px" method="POST" action="consulta_plan_ingresos.php">
	<label>Tipo de Plan de Formacion: </label>
		<?php 
		$sql=("SELECT * FROM tipo_plan");
		$result=mysqli_query($mysqli,$sql);
		?>

	<select name="nomb_plan">
		<?php while($row= mysqli_fetch_array ($result)){ ?>
		<option value="<?php echo $row['idtipoplan']; ?>"><?php echo $row['nomb_plan']; ?></option>
		<?php } ?>
	</select>
		<button type="submit">Enviar</button>
</form>
<?php include("../piedepagina.php"); ?>