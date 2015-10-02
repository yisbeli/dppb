<?php include("../cabecera.php"); ?>
<h1>Servicios Operacionales</h1>
<table border="4">
	<tr>
		<th>Codigo de Servicio</th>
		<th>tipo de Servicio</th>
		<th>Hora de Salida</th>
		<th>Hora de llegada</th>
		<th>Hora de Ingreso  </th>
		<th>Parroquia</th>
		<th>Direccion de Salida</th>
		<th>Direccion de Destino</th>
		<th>Unidad</th>
		<th>Municipio</th>
		<th>Responsable</th>
		<?php if(isset($_SESSION['log'])){ ?><th colspan="4"> Accion </th><?php } ?>
	</tr>
	<tr>
<?php 
include('../includes/bd_conexion.php');
$sql="SELECT s . * , ts.nomb_tipo_serv , u.seudonimo, r.nomb_resp, m.nomb_mun FROM `responsables` r, `servicios` s,  `tipo_servicio` ts, `unidades` u, `municipios` m WHERE ts.id_tipo_serv = s.id_tipo_serv AND r.cod_resp = s.cod_resp AND m.id_municipio = s.id_municipio";
$result=mysqli_query($mysqli,$sql);
while($row= mysqli_fetch_array ($result)){
	?>
	</tr>
		<td><?php echo $row['cod_serv'];?></td>
		<td><?php echo $row['nomb_tipo_serv'];?></td>
		<td><?php echo $row['hora_salida'];?></td>
		<td><?php echo $row['hora_llegada'];?></td>
		<td><?php echo $row['hora_ingreso'];?></td>
		<td><?php echo $row['parroquia'];?></td>
		<td><?php echo $row['direc_salida'];?></td>
		<td><?php echo $row['direc_destino'];?></td>
		<td><?php echo $row['seudonimo'];?></td>
		<td><?php echo $row['nomb_mun'];?></td>
		<td><?php echo $row['nomb_resp'];?></td>

		<?php if(isset($_SESSION['log'])){ ?>
			<td><a href='../modificar/modificar_serv.php?cod_serv=<?php echo $row['cod_serv'];?>'>Modificar</a></td>
			<td><a href='../eliminar_serv.php?cod_serv=<?php echo $row['cod_serv']; ?>'>Eliminar</a></td>
			
		<?php } ?>
	</tr>
	<?php
}
?>
</table>
	<br>
	<div> 
		<a href="../sala.php" style="margin:15px"><button> Volver al Inicio </button></a>
		
		<?php if(isset($_SESSION['log'])){ ?><a href="../insert/reg_plan.php" style="margin:15px"> <button> Registrar Nuevo Plan </button> </a><?php } ?>
	</div>
	<?php include("../piedepagina.php"); ?>
