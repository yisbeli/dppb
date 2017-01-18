<?php

	include_once 'config/conexion_bd.php';
	extract($_POST);
	$sql = "SELECT * FROM planes_responsables WHERE Fecha_inicio >= '".$ano."-".$mes."-01' AND Fecha_inicio <= '".$ano."-".$mes."-31' ORDER BY Fecha_inicio ASC";
	$resultado= mysqli_query($mysqli,$sql);
	$result=mysqli_fetch_array($resultado);
	$sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid) FROM unidades_trib)";
	$consultado=mysqli_query($mysqli,$sentencia);
	$resultado2=mysqli_fetch_array($consultado);


require_once("pdf/dompdf/dompdf_config.inc.php");

$html = '
<html>
<head>
	<meta charset="UTF8" />
		<link rel="stylesheet" type="text/css" href="assets/css/estilos.css">
		<link rel="stylesheet" type="text/css" href="/bomberos/css/bootstrap-3.3.5/css/bootstrap.css">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<link rel="stylesheet" type="text/css" href="/bomberos/css/bootstrap-3.3.5/css/bootstrap-responsive.css">
		<link rel="stylesheet" type="text/css" href="/bomberos/css/estilos.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">	
</head>
	<body>
	<div id="cuerpo">

	 <header>
	 	<div class="">
	 		<img src="assets/imgs/sinfondo.png">
		</div>
	 </header>

	 <table border="2" class="table table-bordered tablaestilo">
							<tr class="bg-warning">
								<th colspan="4" class="text-center">Egresos</th>
							</tr>
							<tr>
								<th class="text-center">Fecha</th>
								<th class="text-center">Descripcion</th>
								<th class="text-center">Monto</th>
								<th class="text-center">Factura #</th>
							</tr>
							';

							$sql=("SELECT * FROM egresos WHERE fech_egr >= '".$ano."-".$mes."-01' AND fech_egr <= '".$ano."-".$mes."-31' ORDER BY fech_egr ASC");
							$resultado=mysqli_query($mysqli,$sql);
							$montoTotal= 0;
							while ($result=mysqli_fetch_array($resultado)): 
								
								$montoTotal += $result[3];
							
										$html .= '<tr class="text-center">
											<td>'.$result[1].'</td>
											<td>'.$result[2].'</td>
											<td>'.$result[3].'</td>
											<td>'.$result[4].'</td>
										</tr>';
										endwhile;	
							
							$html .= '<tr class="bg-warning">
								<th colspan="3"> Total egresos</th>
								<th class="text-center">'.$montoTotal.'</th>
							</tr>
				</table>

	
			</div>
  	 <footer>
  	 	<p>&copy; 2017 Direccion del Poder Popular del Cuerpo de Bomberos del Estado Bolivariano Mérida - Venezuela</p>
  	 </footer>

</body>
</html>';

$html=utf8_decode($html);
$dompdf=new DOMPDF();
$dompdf->load_html($html);
$dompdf->set_paper(array(0,0,400,500), 'portrait');
$dompdf->render();

$dompdf->stream("egresos.pdf",array("Attachment" => 0));

?>