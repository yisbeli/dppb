<?php
	include("../cabecera.php");
?>
			<?php
				//EXTRAEMOS Y CONECTAMOS
				extract ($_POST);
				require_once '../includes/bd_conexion.php';
				
				$sentencia="SELECT MAX(id_unid) FROM unidades_trib";
				$consultado=mysqli_query($mysqli,$sentencia);
				$resultado2=mysqli_fetch_array($consultado);
				
				//INSERTAMOS
				
				$command_sql = "INSERT INTO planes (tipo_plan, nomb_plan, desc_plan, cant_unid, id_unid) VALUES ('$tipo_plan','$nomb_plan','$desc_plan','$cant_unid', '$resultado2[0]')";
				require '../includes/sql.php';
				?>

				<script type="text/javascript">
					alert("Plan Registrado Satisfactoriamente!");
					window.location="../consultas/consulta_plan2.php";
				</script>
			
			<?php include("../piedepagina.php"); ?>	