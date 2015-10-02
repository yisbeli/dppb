<?php 
include('../includes/bd_conexion.php');
extract ($_POST);

$sql = "UPDATE servicios SET  hora_salida='$hora_salida', hora_llegada='$hora_llegada', hora_ingreso='$hora_ingreso', parroquia='$parroquia', direc_salida='$direc_salida', direc_destino='$direc_destino', id_tipo_serv='$id_tipo_serv', id_unidad='$id_unidad', id_municipio='$id_municipio', cod_resp='$cod_resp' WHERE cod_serv='$cod_serv'";
if(mysqli_query($mysqli,$sql)){
	
?>
			<script type="text/javascript">
				alert("Servicio actualizado satisfactoriamente!");
				window.location="../consultas/consulta_serv2.php";
			</script>
<?php
}
?>
