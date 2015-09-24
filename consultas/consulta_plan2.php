<?php include("../cabecera.php"); ?>
<h1>Consulta por Tipo de Plan</h1>
<form style="margin:20px" method="post" action="../consultas/consulta_plan.php">
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