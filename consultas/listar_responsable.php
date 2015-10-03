<?php
	include_once '../includes/bd_conexion.php';
	include("../cabecera.php");
?>
				<div id="cuerpo">
					<?php
						//EXTRAEMOS Y CONECTAMOS
						extract ($_POST);
						
						//SE VERIFICA SI INGRESO ALGUN CODIGO
						if(empty($buscarcedula) OR !isset($buscarcedula)){
								echo "Debe introducir una cedula";
								exit();
							}
						
						//CONSULTAMOS BD
						$command_sql = "SELECT * FROM responsables WHERE ced_resp='$buscarcedula'";
						require '../includes/sql.php';
						
							//SE VALIDA QUE EXISTA EN LA BD  
							if(empty($buscarcedula)){
								echo "No se encuentra ningun responsable";
								exit();
								} else 	
					?>
					<h2>Tabla para modificar</h2> 
					<form action="mostrar_responsable.php" method="post">
						<center><table border=1 align="center">
						<colgroup>
							<col style="background-color:orange;" />
						</colgroup>
							<tr>
								<th>Modificar</th>
								<th>Codigo </th>
								<th>Cedula </th>
								<th>Nombre</th>
								<th>Apellido</th>
								<th>Especialidad</th>
								<th>Nivel Academico</th>
								<th>Tipo de Responsable</th>
							</tr>
						<?php while($reg = mysqli_fetch_array($result)) { ?>
							<tr>
								<td><input type="radio" name="cedula" value="<?php echo $reg[1]?>"/></td>
								<td><?php echo $reg[0]?></td>
								<td><?php echo $reg[1]?></td>
								<td><?php echo $reg[2]?></td>
								<td><?php echo $reg[3]?></td>	
								<td><?php echo $reg[4]?></td>	
								<td><?php echo $reg[5]?></td>	
								<td><?php echo $reg[6]?></td>
								
							</tr>
						<?php } ?>
						</table></center><br />
						<!-- ENVIAR DATOS A LA PAG DE MODIFICACION -->
						<input type="submit" class="submit" value="Modificar"/><input type="button" class="submit" value="Regresar a la página anterior" onclick=location="indexresp.php"  />
					</form>
				
			</div> <!-- /cuerpo -->
			<!--Pie de página-->
			<?php  include("../piedepagina.php");?>