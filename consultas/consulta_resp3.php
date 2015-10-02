<?php include("../cabecera.php"); ?>
<?php 
include('../includes/bd_conexion.php');
$ced_resp=$_REQUEST['ced_resp'];
$sql=("SELECT * FROM responsables WHERE ced_resp='$ced_resp'");
$result=mysqli_query($mysqli,$sql);
$row=mysqli_fetch_array($result);
?>
<h1>Responsable <br></h1>
<table border="4" align="center">
<tr>
<th> Nombre </th> <th> Apellido </th> <th> Cedula </th> <th> Especialidad </th> <th colspan="2"> Accion </th> 
</tr>
<tr>

	</tr>
		<td><?php echo $row['nomb_resp'];?></td>
		<td><?php echo $row['apell_resp'];?></td>
		<td><?php echo $row['ced_resp'];?></td>
		<td><?php echo $row['espe_resp'];?></td>
		<td><a href='../modificar/modificar_resp.php?ced_resp=<?php echo $row['ced_resp'];?>'>Modificar</a></td>
		<td><a href='../eliminar/eliminar_resp.php?ced_resp=<?php echo $row['ced_resp']; ?>'>Eliminar</a></td>		
	</tr>
	<?php 

?>
</table>
<br>
	<div> 
		<a href="../sala.php" style="margin:15px"><button> Volver al Inicio </button></a>
		<a href="/labsimulacion/consultas/consulta_resp2.php" style="margin:15px"><button> Consultar Otro Responsable </button></a>
	</div>
<?php include("../piedepagina.php"); ?>