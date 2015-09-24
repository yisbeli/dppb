<?php include("../cabecera.php"); ?>
<h1>Responsables</h1>
<table border="5">
<tr>
<th> Codigo </th>  <th> Cedula </th> <th> Nombre </th> <th> Apellido </th> <th> Especialidad </th> <th> Nivel </th> <th> Tipo </th> <th colspan="2"> Accion </th> 
</tr>
<tr>
<?php 
include('../includes/bd_conexion.php');
$sql="SELECT * FROM responsables" ;
$result=mysqli_query($mysqli,$sql);
while($row= mysqli_fetch_array ($result)){
	?>
	</tr>
		<td><?php echo $row['cod_resp'];?></td>
		<td><?php echo $row['ced_resp'];?></td>	
		<td><?php echo $row['nomb_resp'];?></td>
		<td><?php echo $row['apell_resp'];?></td>
		<td><?php echo $row['espe_resp'];?></td>
		<td><?php echo $row['id_nivel'];?></td>
		<td><?php echo $row['id_tipo'];?></td>
		<td><a href='../modificar/modificar_resp.php?ced_resp=<?php echo $row['ced_resp'];?>'>Modificar</a></td>
		<td><a href='../eliminar/eliminar_resp.php?ced_resp=<?php echo $row['ced_resp']; ?>'>Eliminar</a></td>
	</tr>
	<?php
}
?>
</table>
	<br>
	<div style="text-align:center"> 
		<a href="/labsimulacion/sala.php" style="margin:15px"><button> Volver al Inicio </button></a>
	</div>
<?php include("../piedepagina.php"); ?>