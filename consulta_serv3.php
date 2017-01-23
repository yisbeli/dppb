<?php include("cabecera.php"); 
include_once 'libs/menu.php';?>
<section class="container">
					<?php 
include('config/conexion_bd.php');
$id_tipo_serv=$_REQUEST['id_tipo_serv'];
$sql="SELECT s . * , ts.nomb_tipo_serv , u.seudonimo, r.nomb_resp, m.nomb_mun FROM `responsables` r, `servicios` s,  `tipo_servicio` ts, `unidades` u, `municipios` m WHERE ts.id_tipo_serv = s.id_tipo_serv AND r.cod_resp = s.cod_resp AND m.id_municipio = s.id_municipio AND s.id_tipo_serv='$id_tipo_serv'";

$result=mysqli_query($mysqli,$sql);
if (empty($result)) {
              echo "<legend class='text-center'> No se encontro ningun registro </legend>";
            } else {		


	?>	
		<div class="rows">
			<div class="col-md-1"></div>
			<div class="col-md-8" >
				<legend>Cosulta de Servicios Operacionales</legend>
				<form method="POST" action="consulta_ser3.php">
<table class="table table-bordered" algin="center">
	 	<tr class="bg-warning">
		<th>Codigo de Servicio</th>
		<th>Hora de Salida</th>
		<th>Hora de llegada</th>
		<th>Hora de Ingreso  </th>
		<th>Parroquia</th>
		<th>Direccion de Salida</th>
		<th>Direccion de Destino</th>
		<th>Insumos</th>
		<th>Unidad</th>
		<th>Municipio</th>
		<th>Responsable</th>
		<th colspan="2"> Accion </th>
	</tr>
	<tr>
      <?php  while($row= mysqli_fetch_array ($result)){ ?>
	</tr class="text-center">
		<td><?php echo $row['cod_serv'];?></td>
		<td><?php echo $row['hora_salida'];?></td>
		<td><?php echo $row['hora_llegada'];?></td>
		<td><?php echo $row['hora_ingreso'];?></td>
		<td><?php echo $row['parroquia'];?></td>
		<td><?php echo $row['direc_salida'];?></td>
		<td><?php echo $row['direc_destino'];?></td>
		<td><?php echo $row['insumos'];?></td>
		<td><?php echo $row['seudonimo'];?></td>
		<td><?php echo $row['nomb_mun'];?></td>
		<td><?php echo $row['nomb_resp'];?></td>

		
			<td class="text-center" colspan="1"><a href='./modificar_serv.php?cod_serv=<?php echo $row['cod_serv'];?>'onclick="return confirm('Seguro que Desea Modificar Servicio')";> <span class="glyphicon glyphicon-pencil"></span></a> </td>
			<td class="text-center" colspan="1"><a href='./eliminar_serv.php?cod_serv=<?php echo $row['cod_serv']; ?>'onclick="return confirm('Seguro que Desea Eliminar Servicio')";>  <span class="glyphicon glyphicon-trash"></span></a> </td>
			
	
	</tr>
		<?php
} 
?>
</table>
<?php } ?>
	</form>
	<br>
		
		
		<div class="buttons text-center">
	 	<button class="btn btn-sistema" type="button" onclick=location="consulta_serv2.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio </button>
		</div><br>
		
		<?php if(isset($_SESSION['log'])){ ?> <input type="submit" class="submit" "../insert/Servicio.php" style="margin:15px" value="Registrar Nuevo Servicio" align="center"/><?php } ?>

		</div>
	</div>		
</section>
  <?php include_once 'pie.php'; ?>