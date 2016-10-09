<?php include_once 'cabecera.php'; ?>
<?php   include_once 'libs/menu.php'; ?>

<section class="container">
<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form action="participantes_inscritos.php" method="POST">
			<legend>Resultado de la búsqueda de participantes inscritos</legend>
			
			<?php
				require_once 'config/conexion_bd.php';
				extract($_POST);
				if(isset($registro_nota)):
					for ($i=0; $i < count($nota); $i++) { 
					$inser="UPDATE planes_participantes SET nota='$nota[$i]' WHERE id='$id_participante[$i]' ";
					if (mysqli_query($mysqli,$inser)){ ?>
						<script type="text/javascript">
							alert("Has registrado las notas correctamente!");
							window.location="sala.php";
						</script>
					<?php }
					}
				?>
				<?php  
					else:
				//EXTRAEMOS Y CONECTAMOS
				$sql="SELECT participantes.ced_part, participantes.nomb_part, participantes.apell_part FROM participantes, planes_participantes WHERE planes_participantes.cod_par=participantes.cod_par AND planes_participantes.status='inscrito' AND planes_participantes.cod_plan='$idplan'";
				
				$result=mysqli_query($mysqli,$sql);
			?>
			<input type="hidden" name="codigoplan" value=" <?php echo $idplan ?>"/>
			<?php 
						$coman_sql="SELECT idstatus FROM planes_responsables WHERE  id='$registro'";
							$h=mysqli_query($mysqli,$coman_sql);
							$res=mysqli_fetch_array($h);
						// 	if ($res[3]=="culminado"):
						// $celda1="<th class='text-center'>Accion</th>";
						// $celda2= "<td class='text-center'><input type='text' name='nota' size='5'/></td>";
						// else: 
						// 	$celda1="";
						// 	$celda2="";
						// endif; 
						?>


				<table class="table table-bordered">
					<tr class="bg-warning">
						<th class="text-center">Cedula</th>
						<th class="text-center">Nombre</th>
						<th class="text-center">Apellido</th>
						<th colspan="2" >Accion </th>
						<input class="form-control" id="text_form" type="text" name="tlfn_part" maxlength="04" size="05" placeholder="" required patter="^\d{4}\-\d{7}$" title="00" <?php if (isset($resultado)) echo "value='$resultado[5]'"; ?> /><br>
						</div>
					</tr>
					<?php while ($consulta=mysqli_fetch_array($result)) :
						echo "<tr>
							<td class='text-center'>$consulta[0]</td>
							<td class='text-center'>$consulta[1]</td>
							<td class='text-center'>$consulta[2]</td>
							<td><form action='#'><input type='text' name=''></form></td>
							";
						echo "</tr>";
						echo "";

					endwhile; ?>
				</table>
                <div class="text-center">
                  <button type="submit" name="registro_nota" value="registro" title="Haga clic para guardar la notas" class="btn btn-sistema"> <span class="glyphicon glyphicon-floppy-saved"> </span> Guardar notas</button>
                <button class="btn btn-sistema" type="button" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver</button>
                </div><br><br>
			</form>				
		</div>
	</div>
</section>

<?php endif; include_once 'pie.php';  ?>
