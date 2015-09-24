<?php
	include("../cabecera.php");
?>
			<?php
				//EXTRAEMOS Y CONECTAMOS
				extract ($_POST);
				require_once '../includes/bd_conexion.php';
								
				//INSERTAMOS
				if(isset($_SESSION['log']) and $_SESSION['tipo']==2){
					$email=$_SESSION['correo'];
					$command_sql = "INSERT INTO participantes (ced_part, nomb_part, apell_part, profe_part, tlfn_part, email_part, id_nivel) VALUES ('$ced_part','$nomb_part','$apell_part','$profe_part','$tlfn_part','$email','$id_nivel')";
				}
				else{
					$command_sql = "INSERT INTO participantes (ced_part, nomb_part, apell_part, profe_part, tlfn_part, email_part, id_nivel) VALUES ('$ced_part','$nomb_part','$apell_part','$profe_part','$tlfn_part','$email_part','$id_nivel')";
				}
				
				require '../includes/sql.php';
				?>
				<script type="text/javascript">
				alert("Participante Registrado Satisfactoriamente!");
				<?php  
				if(isset($_SESSION['log']) and $_SESSION['tipo']==1){ ?>
					window.location="../consultas/consulta_part.php";
				<?php  }
				else { ?>
					window.location="../consultas/sala.php";	
				<?php } ?>
				</script>

	<?php include("../piedepagina.php"); ?>