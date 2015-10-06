<?php	
	include_once 'librerias/cabecera.php';
?>

	<div class="container">
	<?php 	include_once 'librerias/menu.php'; ?>
		<div class="rows">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h2>Aceptacion de usuario</h2>
				<form method="POST" action="aceptacion_usu.php" >
					<?php

						require_once 'includes/conexion_bd.php'; 

						extract($_POST);
						if(isset($actualizar)) : 	
							for ($i=0; $i < count($aprobacion); $i++) { 
							echo "$aprobacion[$i]";
							$sql = "UPDATE user SET status='aprobado' WHERE iduser='$aprobacion[$i]'";
							mysqli_query($mysqli,$sql);	
							}

							$sql = "SELECT * FROM user";
							$reg = mysqli_query($mysqli, $sql);

							while ($resultado = mysqli_fetch_array($reg)) :
			                    //Verificacion de los seleccionados para ser almacenados
			                    if (isset($guardar)) :
			                        for ($x=0; $x < $temp = count($cod); $x++)
			                            if ($resultado[0] == $cod[$x]) :
			                                if ($resultado[9] == "On")
			                                    $x=$temp;
			                                else
			                                    $on = $resultado[0];
			                                    $x=$temp;
			                            elseif ($x == ($temp-1)) :
			                                if ($resultado[9] == "On")
			                                    $off = $resultado[0];
			                            endif;
			                        if (isset($on)) :
			                            $objinicio->modificar_miembros_estatus($mysqli, "On", $on);
			                            $resultado[9] = "On";
			                        elseif (isset($off)) :
			                            $objinicio->modificar_miembros_estatus($mysqli, "Off", $off);
			                            $resultado[9] = "Off";
			                        endif;
			                        unset($off, $on);
			                    endif;
			                endwhile;
						?>

					 <script type="text/javascript">
					 	alert(" Se ha realizado la actualizacion con Exito!");
					 	window.location="aceptacion_usu.php"
					 </script>
					<?php else :
						//EXTRAEMOS Y CONECTAMOS
						$command="SELECT * FROM user";
						$r=mysqli_query($mysqli,$command);

					 ?>

						<table class="table table-bordered">
					<tr class="bg-warning">
						<th class="text-center">Nombre</th>
						<th class="text-center">Correo</th>
						<th class="text-center">Aprobacion</th>
						<th class="text-center">Eliminar</th>
					</tr>
					<?php while ($consulta = mysqli_fetch_array($r)) :
						echo "
						<tr>
							<td class='text-center'>$consulta[3]</td>
							<td class='text-center'>$consulta[1]</td>
						<td><div class='text-center'><input type='checkbox' name='aprobacion[]' value='$consulta[0]'></div></td>
						<td><div class='text-center'><button type='submit' name='eliminar' value='$consulta[0]' class='boton-sin-estilo'>Eliminar</button></div></td>
						<tr>
						 ";
							
					endwhile; ?>
				</table>

				<div class="buttons text-center">
					<button class="btn btn-warning" type="reset" title="Haga clic para limpiar formulario" >Limpiar Formulario</button>
					<button type="submit" name="actualizar" value="actualizar" title="Haga clic para Actualizar" class="btn btn-warning">Actualizar</button>
				</div><br>	
				</form>
			</div>
		</div>
	</div>
  
<?php
					endif;
	include_once 'librerias/pie.php'; ?>    