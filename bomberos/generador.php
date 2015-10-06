<?php
require_once('dompdf/dompdf_config.inc.php');

require_once 'includes/conexion_bd.php';
extract($_POST);
$sql = "SELECT p.nomb_part, p.apell_part, p.ced_part, tp.nomb_plan, pl.nomb_plan, pl.desc_plan, pp.nota
FROM participantes p, planes pl, tipo_plan tp, planes_participantes pp, planes_responsables pr
WHERE pp.cod_plan='$plandeformacion' AND pp.cod_plan=pr.id AND pp.cod_par='$pedir_certificado' AND pp.cod_par=p.cod_par AND pr.cod_plan=pl.cod_plan AND pl.tipo_plan=tp.idtipoplan";
$result = mysqli_query($mysqli, $sql);
$resultado = mysqli_fetch_array($result);

if ($resultado[6]<15)
	$titulo = "ASISTIDO AL";
elseif ($resultado[6]>14)
	$titulo = "APROBADO EL";

$html='
<!DOCTYPE html>
<html>
<head>
	<title>Certificados de los participantes</title>
	<meta charset="UTF-8">
</head>
<body>
	<style>
	body {
			background-image: url("img/fondo_logo.png"); 
			background-position: 50% 50%; 
			background-repeat: no-repeat;
			margin-top: auto;
			}
	.ima{
		height: 150px;
	}
	.contenido{
		height: 550px;
		margin: auto;
	}
	.reverso{
		height: 500px;
	}
	</style>
	<header>
	 	<div class="ima" align="center">
	 		<img src="img/logocompleto.png" width="100%" height="100%" margin="auto" >
		</div>
 	</header>
 	<div class="contenido">
	 	<br><h4 style="font-weight:bolder; text-align:center;">SE OTORGA EL PRESENTE CERTIFICADO A:</h4>
		<h1 style="font-size:50px; text-transform:uppercase; text-align:center;"> '.$resultado[0].' '.$resultado[1].' </h1>
		<p style="font-size:25px; text-transform:uppercase; text-align:center;">C.I: '.$resultado[2].' <br><br>
		POR HABER '.$titulo.' '.$resultado[3].' de:<br><b>'.$resultado[4].'</b></p>
	</div>
	<div class="reverso">
		<p>Temario :'.$resultado[5].'</p>
		<p>Temario :'.$resultado[5].'</p>
		<p>Nota obtenida:'.$resultado[6].'</p>
	</div>
</body>
</html>';

$html=utf8_decode($html);
$dompdf=new DOMPDF();
$dompdf->load_html($html);
$dompdf->set_paper('letter', 'landscape');
$dompdf->render();
/* fecha en el nombre de descarga*/
/*$fecha = date("dmy");*/
$canvas = $dompdf->get_canvas();
   $footer = $canvas->open_object();
   		$w = $canvas->get_width();
		$h = $canvas->get_height();
		$font = Font_Metrics::get_font("arial", "bold");
		$canvas->page_text($w - 495, $h - 78, "DPP Bomberos del Estado Mérida - Venezuela", $font, 9, array(0,0,0)); 
		$canvas->page_text($w - 550, $h - 70, "", $font, 6, array(0,0,0)); 
		$canvas->page_text($w - 530, $h - 63, "Universidad Politécnica Territorial de Mérida 'Kléber Ramírez'", $font, 9, array(0,0,0)); 
		$canvas->page_text($w - 530, $h - 56, "", $font, 6, array(0,0,0)); 
		$canvas->page_text($w - 500, $h - 49, " ", $font, 6, array(0,0,0)); 
	 $canvas->close_object();
    $canvas->add_object($footer, "all");
$dompdf->stream('Certificado.php',array('Attachment' => 0));
?>