<?php 
	  include("cabecera.php"); 
	  include_once 'libs/menu.php';?>
<?php 	include_once 'inactivo.php';
	include_once 'sesion.php'; ?>
<section class="container">
	
		<div class="rows">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<legend> Cosulta de Paciente </legend>
				<form method="POST" action="">

<table class="table table-bordered">
	<tr class="bg-warning">
		<th>CI</th>
		<th>Nombre</th>
		<th>Edad</th>
		<th>Diagnostico del Paciente</th>
		<th>Codigo de Servicio</th>
		<th>Direccion de Salida</th>
		<th>Direccion de Destino</th>
		<th colspan="4"> Accion </th>>
	</tr>
	<tr>
	<?php
	$cedu_pac=$_REQUEST['cedu_pac'];

		$sql="SELECT p.*, s.direc_salida,s.direc_destino FROM `servicios` s, `paciente` p  WHERE p.cod_serv=s.cod_serv AND p.cedu_pac='$cedu_pac'";
				$result=mysqli_query($mysqli,$sql);
				while($row= mysqli_fetch_array ($result)){ 
					
	?> 
	</tr>
		<td><?php echo $row['cedu_pac'];?></td>
		<td><?php echo $row['nomb_pac'];?></td>
		<td><?php echo $row['edad'];?></td>
		<td><?php echo $row['diag_pac'];?></td>
		<td><?php echo $row['cod_serv'];?></td>
		<td><?php echo $row['direc_salida'];?></td>
		<td><?php echo $row['direc_destino'];?></td>
		
		

		
			<td><a href='./modificar_pac.php?cedu_pac=<?php echo $row['cedu_pac'];?>'><img src="img/pencil_16.png" onclick="return confirm('Seguro que Desea Modificar Paciente')";></a></td>
			<td><a href='./eliminar_pac.php?cedu_pac=<?php echo $row['cedu_pac']; ?>'><img src="img/delete_16.png" onclick="return confirm('Seguro que Desea Eliminar Paciente')";></a></td>
			
		
	</tr>
	<?php
}
?>
</table>
			   </form>
	<br>
		<div class="buttons text-center">
	
	 
		<button type="button" class="btn btn-sistema" onclick:location="sala.php" name="plan" title="Haga click para regresar a la página anterior" ><span class="glyphicon glyphicon-hand-left"></span> Volver al Inicio</button> 
		
		<?php if(isset($_SESSION['log'])){ ?><input type="submit" class="submit" "paciente.php" style="margin:15px" value="Registrar Nuevo Paciente" align="center"/><?php } ?>
	 
		</div><br>
	</div>
		</div>
		</div>
	</div>		
</section>
  <?php include_once 'pie.php'; ?>