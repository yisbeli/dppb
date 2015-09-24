<?php include("../cabecera.php"); ?>
<h2>Reporte de Ingreso de dinero</h2>
<form style="margin:20px" method="POST" action=" ">
	<?php 
		extract($_POST);

		$sql="SELECT * FROM planes WHERE tipo_plan='$nomb_plan'";
		$resultado= mysqli_query($mysqli,$sql);
		$result=mysqli_fetch_array($resultado);
		$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid) FROM unidades_trib)";
		$consultado=mysqli_query($mysqli,$sentencia);
		$resultado2=mysqli_fetch_array($consultado);

		if (empty($result)) {
			echo "<h2> No se encontro ningun registro </h2>";
		}else{
	?>

	<table border="2">
		<tr>
			<td>Nombre</td>
			<td>Descripcion</td>
			<td>Cantidad UT</td>
			<td>Valor UT</td>
			<td>Total a cancelar</td>
		</tr>
		<?php
		$sql="SELECT * FROM planes WHERE tipo_plan='$nomb_plan'";
		$resultado= mysqli_query($mysqli,$sql);
		 while ($result=mysqli_fetch_array($resultado)) : ?>
		<tr>
			<td><?php echo "$result[2]"; ?></td>
			<td><?php echo "$result[3]"; ?></td>
			<td><?php echo "$result[4]"; ?></td>
			<td><?php echo "$resultado2[0]"; ?></td>
			<td><?php echo $result[4]*$resultado2[0]; ?></td>
		</tr>
	<?php endwhile; } ?>
	</table>

	

</form>
<?php include("../piedepagina.php"); ?>