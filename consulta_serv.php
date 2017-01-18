<?php include_once 'cabecera.php';?>
<?php 	include_once 'libs/menu.php'; ?>
<?php 	include_once 'inactivo.php';
	    include_once 'sesion.php'; ?>
	<section class="container">
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">

<h1>Servicios Operacionales</h1>
<table border="4" align="center">
	<tr>
		<th>Codigo de Servicio</th>
		<th>Fecha de Servicio</th>
		<th>Tipo de Servicio</th>
		<th>Hora de Salida</th>
		<th>Hora de llegada</th>
		<th>Hora de Ingreso  </th>
		<th>Parroquia</th>
		<th>Dirección de Salida</th>
		<th>Dirección de Destino</th>
		<th>Unidad</th>
		<th>Municipio</th>
		<th>Responsable</th>
		<?php if(isset($_SESSION['log'])){ ?><th colspan="4"> Accion </th><?php } ?>
	</tr>
	<tr>
<?php 
extract($_POST);
include('config/conexion_bd.php');
//$nomb_tipo_serv=$_REQUEST['nomb_tipo_serv'];
//---$nomb_tipo_serv = isset($_POST['nomb_tipo_serv']) ? $_POST['nomb_tipo_serv'] : NULL;
if (isset($_REQUEST['nomb_tipo_serv'])) {
$nomb_tipo_serv = $_REQUEST['nomb_tipo_serv'];
} else {
$nomb_tipo_serv = "";
}
//$sql="SELECT * FROM servicios, tipo_servicio WHERE tipo_servicio.nomb_tipo_serv=.servicios.tipo_servicio AND tipo_servicio.nomb_tipo_serv='$nomb_tipo_serv'";
$sql="SELECT s . * , ts.nomb_tipo_serv , u.seudonimo, r.nomb_resp, m.nomb_mun FROM `responsables` r, `servicios` s,  `tipo_servicio` ts, `unidades` u, `municipios` m WHERE ts.id_tipo_serv = s.id_tipo_serv AND r.cod_resp = s.cod_resp AND m.id_municipio = s.id_municipio AND ts.nomb_tipo_serv='$nomb_tipo_serv'";
$result=mysqli_query($mysqli,$sql);
while($row= mysqli_fetch_array ($result)){
	?>
	</tr>
		<td><?php echo $row['cod_serv'];?></td>
		<td><?php echo $row['fecha_serv'];?></td>
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
		<div class="buttons text-center">
	<input  class="btn btn-sistema" type="submit" class="submit" value="Consultar servicios Mensuales" title="Haga clic para Consultar  Servicios por mes" onclick=location="../consultas/consulta_serv_mes.php"  align="center"  />
	 
		<input class="btn btn-sistema" type="submit" class="submit" href="../sala.php" style="margin:15px" value=" Volver al Inicio" align="center"/>
		
		<?php if(isset($_SESSION['log'])){ ?><input type="submit" class="submit" "../insert/Servicio.php" style="margin:15px" value="Registrar Nuevo Servicio" align="center"/><?php } ?>
	 
		</div>
		</div>
		</div>
	</div>
</section>
  <?php include_once 'pie.php'; ?>
		 