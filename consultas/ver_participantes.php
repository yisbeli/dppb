<?php include("../cabecera.php"); ?>
<?php 
include('../includes/bd_conexion.php');
$cod_plan=$_REQUEST['cod_plan'];
$sql=("SELECT * FROM planes WHERE cod_plan='$cod_plan'");
$result=mysqli_query($mysqli,$sql);
$row=mysqli_fetch_array($result);
?>
<h1>Participantes del plan: <br><?php echo $row['nomb_plan'] ?></h1>
<table border="4">
<tr>
<th>Nombre Del Participante</th> <th> Apellido del Participante </th> <th> Cedula del Participante </th> <th> Telefono del Participante </th> <th> E-mail </th>
</tr>
<tr>
<?php 
$sql2=("SELECT * FROM participantes, planes_participantes WHERE planes_participantes.cod_part=participantes.cod_par AND planes_participantes.cod_plan='$cod_plan'");
$result2=mysqli_query($mysqli,$sql2);
while($row2= mysqli_fetch_array ($result2)){
	?>
	</tr>
		<td><?php echo $row2['nomb_part'];?></td>
		<td><?php echo $row2['apell_part'];?></td>
		<td><?php echo $row2['ced_part'];?></td>
		<td><?php echo $row2['tlfn_part'];?></td>
		<td><?php echo $row2['email_part'];?></td>
	</tr>
	<?php 
}
?>
</table>
<br>
	<div> 
		<a href="../sala.php" style="margin:15px"><button> Volver al Inicio </button></a>
	</div>
<?php include("../piedepagina.php"); ?>
