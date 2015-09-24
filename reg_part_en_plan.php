<?php include("cabecera.php"); 
if (empty($_SESSION['log'])){
?>
<p style="text-align:center;color:red;padding:50px;">Para realizar esta operacion debes haber iniciado sesión.</p>
<?php 
} 
else{ 
$cod_plan=$_REQUEST['cod_plan'];
$sql=("SELECT * FROM planes WHERE cod_plan='$cod_plan'");
$result=mysqli_query($mysqli,$sql);
$row=mysqli_fetch_array($result);
?>
<h2 style="padding:30px">Registrar participante en plan:<br> <?php echo $row['nomb_plan']; ?></h2>
			<form method="POST" action="reg_part_en_plan2.php">
				<ul>
					<li><h2>Registro realizado con exito</h2></br>
						<?php
						$id=$_SESSION['iduser'];
						$sql2="SELECT cod_par,id_nivel,profe_part FROM participantes WHERE user='$id'";
						$result2=mysqli_query($mysqli,$sql2);
						$resultado=mysqli_fetch_array($result2);
						$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid) FROM unidades_trib)";
						$consultado=mysqli_query($mysqli,$sentencia);
						$resultado2=mysqli_fetch_array($consultado);
						$sql2="SELECT cod_plan, cant_unid from planes WHERE cod_plan='$cod_plan'";
						$result2=mysqli_query($mysqli,$sql2);
						$resultado3=mysqli_fetch_array($result2);
						$calculo=$resultado3[1]*$resultado2[0];
						if ($resultado[1]==3 OR $resultado[1]==4) 
							$precio=$resultado2[0];
						else
							$precio=$calculo;
						
						$sql2=("INSERT INTO planes_participantes(cod_part,cod_plan,precio) VALUES('$resultado[0]','$cod_plan','$precio')" );
						mysqli_query($mysqli,$sql2);
						?>
					</li>
					
				</ul>
			</form>	
<?php } include("piedepagina.php"); ?>