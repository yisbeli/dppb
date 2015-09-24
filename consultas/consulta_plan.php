<?php include("../cabecera.php"); ?>
<h1>Planes</h1>
<table border="4">
	<tr>
		<th>Nombre De Plan</th>
		<th> Tipo De Plan </th>
		<th> Descripcion Del Plan </th>
		<th> Cantidad De UT </th>
		<?php if(isset($_SESSION['log'])){ ?><th colspan="4"> Accion </th><?php } ?>
	</tr>
	<tr>
<?php 
include('../includes/bd_conexion.php');
if (isset($_REQUEST['nomb_plan'])) {
	$nomb_plan=$_REQUEST['nomb_plan'];
}

$sql="SELECT * FROM planes WHERE tipo_plan='$nomb_plan'";
$result=mysqli_query($mysqli,$sql);
	$sql2=("SELECT * FROM participantes");
	$result2=mysqli_query($mysqli,$sql2);

$res="SELECT nomb_plan FROM tipo_plan WHERE idtipoplan='$nomb_plan'";
$res1=mysqli_query($mysqli,$res);
$res2=mysqli_fetch_array($res1);

while($row= mysqli_fetch_array ($result)){
	?>
	</tr>
		<td><?php echo $row['nomb_plan'];?></td>
		<td><?php echo $res2[0];?></td>
		<td><?php echo $row['desc_plan'];?></td>
		<td><?php echo $row['cant_unid'];?></td>
		<?php if(isset($_SESSION['log']) and $_SESSION['tipo']==1){ ?>
			<td><a href='../modificar/modificar_plan.php?cod_plan=<?php echo $row['cod_plan'];?>'>Modificar</a></td>
			<td><a href='../eliminar_plan.php?cod_plan=<?php echo $row['cod_plan']; ?>'>Eliminar</a></td>
			<td><a href='ver_participantes.php?cod_plan=<?php echo $row['cod_plan']; ?>'>Ver Participantes</a></td>
			<td><a href='../reg_part_en_plan.php?cod_plan=<?php echo $row['cod_plan']; ?>'>Inscribir Participante</a></td>
		<?php } ?>
		<?php if(isset($_SESSION['log']) and $_SESSION['tipo']==2){ ?>
			<td><a href='../reg_part_en_plan.php?cod_plan=<?php echo $row['cod_plan']; ?>'>Inscribir Participante</a></td>
		<?php } ?>
	</tr>
	<?php
}

?>
</table>
	<br>
	<div> 
		<a href="../nuevo_usu.php"> <button style="margin-left:10px"> Registrar Nuevo Usuario </button></a>
		<a href="../sala.php" style="margin:15px"><button> Volver al Inicio </button></a>
		<?php if(isset($_SESSION['log']) and $_SESSION['tipo']==1){ ?>
		<a href="../insert/reg_plan.php" style="margin:15px"> <button> Registrar Nuevo Plan </button></a>
		<?php } ?>
		
		
	</div>
	<?php include("../piedepagina.php"); ?>