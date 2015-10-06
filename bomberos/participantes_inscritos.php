<?php include_once 'librerias/cabecera.php';?>
<div class="container">
<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form action="participantes_inscritos.php" method="POST">
			<legend style="color:#000">Resultado de la búsqueda de participantes inscritos</legend>
			<?php
				require_once 'includes/conexion_bd.php';
				extract($_POST);
				if(isset($registro_nota)):
					for ($i=0; $i < count($nota); $i++) { 
					$inser="UPDATE planes_participantes SET nota='$nota[$i]' WHERE id='$id_participante[$i]' ";
					mysqli_query($mysqli,$inser);
					}
				?>
				<script type="text/javascript">
					alert("Has registrado las notas correctamente!");
					window.location="sala.php";
				</script>

				<?php  
					else:
				//EXTRAEMOS Y CONECTAMOS
				$sql="SELECT participantes.ced_part, participantes.nomb_part, participantes.apell_part, planes_participantes.id, planes_participantes.nota, planes_participantes.cod_par FROM participantes, planes_participantes WHERE planes_participantes.cod_par=participantes.cod_par AND planes_participantes.status = 'inscrito' AND planes_participantes.cod_plan='$registro'";
				$result=mysqli_query($mysqli,$sql);
			?>
			<input type="hidden" name="codigoplan" value=" <?php echo $registro ?>"/>
			<?php 
				$coman_sql="SELECT pr.status, pp.nota, pp.id FROM planes_responsables pr, planes_participantes pp WHERE  pr.id='$registro' AND pp.cod_plan=pr.id";
				$h=mysqli_query($mysqli,$coman_sql);
				$res=mysqli_fetch_array($h);
				if ($res[0]=="culminado"):
					$celda1="<th class='text-center'>Accion</th>";
					if (empty($res[1])) :
						$botones = '<button type="submit" name="registro_nota" value="registro" title="Haga clic para guardar la notas" class="btn btn-warning">Guardar notas</button>';
					else :
						$botones = '<button type="button" onclick=location="sala.php" class="btn btn-warning">Regresar a la página princial</button>';
					endif;
				else: 
					$celda1="";
					$celda2="";
					$botones = '<button type="button" onclick=location="sala.php" class="btn btn-warning">Regresar a la página princial</button>';
				endif;?>
				<input type="hidden" name="plandeformacion" value="<?php echo $registro; ?>">
				<table class="table table-bordered">
					<tr class="bg-warning">
						<th class="text-center">Cedula</th>
						<th class="text-center">Nombre</th>
						<th class="text-center">Apellido</th>
						<?php
							echo $celda1;
						 ?> 
					</tr>
					<?php while ($consulta=mysqli_fetch_array($result)) :
						echo "
						<tr>
							<td class='text-center'>$consulta[0]</td>
							<td class='text-center'>$consulta[1]</td>
							<td class='text-center'>$consulta[2] <input type='hidden' name='id_participante[]' value='$consulta[3]' /></td>";
						
					if (empty($consulta[4])) :
						$celda2 = "<td><input type='text' name='nota[]' size='5'/></td>";
					else :
						$celda2 = "<td>
					<button type='submit' formtarget='_blank' formaction='generador.php' name='pedir_certificado' value='$consulta[5]' class='boton-sin-estilo'>Imprimir certificado</button></td>";					endif;
						echo $celda2;
						//echo $celda2."</tr>";
					endwhile; ?>
				</table>
                <div class="text-center">
                  <?php echo $botones; ?>
                </div><br><br>
			</form>
		</div>
	</div>
</div>
<?php include_once 'librerias/pie.php'; endif; ?>
