<?php include("../cabecera.php"); ?>
<h2>Reporte Total </h2>
	<h3>Tipo de Plan de Formacion: </h3>
		<?php 
			$sql=("SELECT * FROM tipo_plan");
			$result=mysqli_query($mysqli,$sql);

			$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid)FROM unidades_trib)";
			$consultado=mysqli_query($mysqli,$sentencia);
			$resultado2=mysqli_fetch_array($consultado);
			$acu2=0;
			while($row= mysqli_fetch_array($result)){

				$sql1=("SELECT * FROM planes WHERE tipo_plan=$row[0]" );
				$result1=mysqli_query($mysqli,$sql1);
				echo "<table border=3 >
					<tr>
						<td colspan='5'>$row[1]</td>

					</tr>
					<tr>
						<td>Nombre</td>
						<td>Descripcion</td>
						<td>Cantidad UT</td>
						<td>Valor UT</td>
						<td>Monto a cancelar</td>
					</tr>

				";
				$acu=0;
				while ($result2=mysqli_fetch_array($result1)){
					$variable=$resultado2[0]*$result2[4];
					$acu+=$variable;
					echo "
						<tr>
							<td>$result2[2]</td>
							<td>$result2[3]</td>
							<td>$result2[4]</td>
							<td>$resultado2[0]</td>
							<td>$variable</td>
						</tr>";
				}

				echo "<tr><td colspan='4'><b>Total</b></td>
				<td>$acu</td></tr>
				</table> <br>";
				$acu2+=$acu;
			}
		?>
		<table border="4">
		<tr>
		<td colspan="2">Total Ingreso de dinero</td>
		</tr>
		<tr>
			<td><b>Total</b></td>
			<td><?php echo "$acu2"; ?></td>
		</tr>
		</table>
<?php include("../piedepagina.php"); ?>