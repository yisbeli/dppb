<?php include("../cabecera.php"); ?>
<?php 
include('../includes/bd_conexion.php');
$ced_part=$_REQUEST['ced_part'];
$sql=("SELECT * FROM participantes WHERE ced_part='$ced_part'");
$result=mysqli_query($mysqli,$sql);
$row=mysqli_fetch_array($result);
?>
<h1>Participante: <br></h1>
<table border="4">
<tr>
<th>Nombre Del Participante</th> <th> Apellido del Participante </th> <th> Cedula del Participante </th> <th> Telefono del Participante </th> <th> E-mail </th> <th colspan="2"> Accion </th>
</tr>
<tr>
		<td><?php echo $row['nomb_part'];?></td>
		<td><?php echo $row['apell_part'];?></td>
		<td><?php echo $row['ced_part'];?></td>
		<td><?php echo $row['tlfn_part'];?></td>
		<td><?php echo $row['email_part'];?></td>
		<td><a href='../modificar/modificar_part.php?ced_part=<?php echo $row['ced_part'];?>'><input type="submit" value="Modificar"></a></td>
		<td><a href='../eliminar/eliminar_part.php?ced_part=<?php echo $row['ced_part']; ?>'><input type="submit" value="Eliminar"></a></td>
</tr>	
</table>
<br>
<h1>Planes en los que se encuentra inscrito:</h1>
<table border="4">
<tr>
<th>Tipo De Plan</th> <th> Nombre Del Plan</th> <th> Descripcion Del Plan </th> <th> Cantidad De UT </th><th> Accion </th>
</tr>
<tr>
<?php
$cod_part=$row['cod_par'];
$sql2=("SELECT * FROM planes, planes_participantes WHERE planes_participantes.cod_plan=planes.cod_plan AND planes_participantes.cod_part='$cod_part'");
$result2=mysqli_query($mysqli,$sql2);
if (mysqli_num_rows($result2)>0)
while($row2= mysqli_fetch_array ($result2)){
	?>
	</tr>
		<td><?php echo $row2['tipo_plan'];?></td>
		<td><?php echo $row2['nomb_plan'];?></td>
		<td><?php echo $row2['desc_plan'];?></td>
		<td><?php echo $row2['cant_unid'];?></td>
		<td>
			<form method="post" action="../pdf/generador.php">
				<input type="hidden" value="<?php echo $row['nomb_part']; ?>" name="nomb_part">
				<input type="hidden" value="<?php echo $row['apell_part']; ?>" name="apell_part">
				<input type="hidden" value="<?php echo $row['ced_part']; ?>" name="ced_part">
				<input type="hidden" value="<?php echo $row['tlfn_part']; ?>" name="tlfn_part">
				<input type="hidden" value="<?php echo $row['email_part']; ?>" name="email_part">
				<input type="hidden" value="<?php echo $row['cod_par']; ?>" name="cod_part">
				<input type="hidden" value="<?php echo $row2['nomb_plan'];?>" name="nomb_plan">
				<input type="hidden" value="<?php echo $row2['tipo_plan'];?>" name="tipo_plan">
				<input type="submit" value="Generar PDF">
			</form>
		</td>
	</tr>
	<?php 
}
else{
?>
<tr>
<td colspan="4">Actualmente el participante no se encuentra inscrito en algun plan</td>
</tr>
<?php }
?>
</table>
<br>
	<div> 
		<a href="../sala.php" style="margin:15px"><button> Volver al Inicio </button></a>
		<a href="/labsimulacion/consultas/consulta_part2.php" style="margin:15px"><button> Consultar Otro Participante </button></a>
	</div>
<?php include("../piedepagina.php"); ?>