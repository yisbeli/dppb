<?php include("cabecera.php"); ?>
<?php 	include_once 'libs/menu.php'; ?>
<?php 	include_once 'inactivo.php';
		include_once 'sesion.php'; ?>
<script>
 function imprimir(){
 window.print();
 }
</script>
<section class="container">
		<div class="rows">
			<div class="col-md-2"></div>
			<div class="col-md-8">
<h1>Servicios Operacionales</h1>
<table border="4" class="table table-bordered">
	<tr class="bg-warning">
		<th>Codigo de Servicio</th>
		<th>Fecha de Servicio</th>
		
		<th>Hora de Salida</th>
		<th>Hora de llegada</th>
		<th>Hora de Ingreso  </th>
		<th>Parroquia</th>
		<th>Direccion de Salida</th>
		<th>Direccion de Destino</th>
		
		
	</tr>
	<tr>
<?php  
      
if(isset($_POST['submit'])) {
	$sql= "SELECT * FROM  servicios WHERE  id_tipo_serv ='".$_POST['id_tipo_serv']."'";
	//$sql= "SELECT s . * , ts.nomb_tipo_serv , u.seudonimo, r.nomb_resp, m.nomb_mun FROM `responsables` r, `servicios` s,  `tipo_servicio` ts, `unidades` u, `municipios` m WHERE  ts.id_tipo_serv = s.id_tipo_serv AND r.cod_resp = s.cod_resp AND m.id_municipio = s.id_municipio AND ts.nomb_tipo_serv='nomb_tipo_serv' ";
	


	$query=mysqli_query($mysqli,$sql);
	$conmt= 0;
	while($row= mysqli_fetch_array ($query)){
		$m=substr($row['fecha_serv'],5,2);
		if($m == $_POST['mes']){ ?></tr>
		<td><?php echo $row['cod_serv'];?></td>
		<td><?php echo $row['fecha_serv'];?></td>
		
		<td><?php echo $row['hora_salida'];?></td>
		<td><?php echo $row['hora_llegada'];?></td>
		<td><?php echo $row['hora_ingreso'];?></td>
		<td><?php echo $row['parroquia'];?></td>
		<td><?php echo $row['direc_salida'];?></td>
		<td><?php echo $row['direc_destino'];?></td>
		
		
		
			
			
		
	</tr>
	<?php
			
			/*echo $row['cod_serv'].' '.$row['fecha_serv'].''.$row['hora_salida'].*/'<br>'; $conmt++;} 
	}
	
	echo 'Cantidad de registros:  '.$conmt;
	}else{
?>
<?php } ?>
</table>
<br>
	<div class="buttons text-center">
	
	 
		<button class="btn btn-sistema" type="button" onclick=location="sala.php"><span class="glyphicon glyphicon-hand-left"></span> Volver al Incio</button>	
		<button class="btn btn-sistema"  type="button"  onclick="imprimir()" value="Imprimir"/> <span class="glyphicon glyphicon-print"></span> Imprimir</button>
	 
		</div>
		</div>
		</div>
	</div>
</section>
  <?php include_once 'pie.php'; ?>
		 