<?php include("../cabecera.php"); ?>
<h1>Participantes</h1>
<input type="text" id="buscador" value="" placeholder="Buscar..." style="float:right; width:25%, display:inline-block;"/>
<table border="5" id="tabla">
<tr>
<th>Nombre Del Participante</th> <th> Apellido del Participante </th> <th> Cedula del Participante </th> <th> Telefono del Participante </th> <th> E-mail </th> <th colspan="2"> Accion </th> 
</tr>
<tbody>
<?php 
include('../includes/bd_conexion.php');
$sql="SELECT * FROM participantes" ;
$result=mysqli_query($mysqli,$sql);
while($row= mysqli_fetch_array ($result)){
	?>
	<tr>
		<td><?php echo $row['nomb_part'];?></td>
		<td><?php echo $row['apell_part'];?></td>
		<td><?php echo $row['ced_part'];?></td>
		<td><?php echo $row['tlfn_part'];?></td>
		<td><?php echo $row['email_part'];?></td>
		<td><a href='../modificar/modificar_part.php?ced_part=<?php echo $row['ced_part'];?>'>Modificar</a></td>
		<td><a href='../eliminar/eliminar_part.php?ced_part=<?php echo $row['ced_part']; ?>'>Eliminar</a></td>
	</tr>
	<?php
}
?>
</tbody>
</table>
	<br>
	<div style="text-align:center"> 
		<a href="/labsimulacion/sala.php" style="margin:15px"><button> Volver al Inicio </button></a>
	</div>
<?php include("../piedepagina.php"); ?>