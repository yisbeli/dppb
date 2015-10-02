<?php
require_once("dompdf/dompdf_config.inc.php");
$nomb_part=$_REQUEST['nomb_part'];
$apell_part=$_REQUEST['apell_part'];
$ced_part=$_REQUEST['ced_part'];
$nomb_plan=$_REQUEST['nomb_plan'];
$tipo_plan=$_REQUEST['tipo_plan'];
$html='<html>

<meta charset="utf-8">
 
<body>
 <style>
	body { 
			background-image: url("../imagenes/fondo_logo.png"); 
			background-position:center; 
			background-repeat:no-repeat;
			}
</style>

		 	<header>
			 	<div class="ima">
			 		<img src="../logocompleto.png" width="80%">
				</div>
		 	</header>
	  	    <br><br><br>
			<h1 style="font-size:45px; font-weight:bolder; text-align:center;"> QUE SE OTORGA A: </h1><br>
			<p style="font-size:35px; text-transform:uppercase; text-align:center;"> '.$nomb_part.' '.$apell_part.'	</p><br>
			<p style="font-size:30px; text-transform:uppercase; text-align:center;">C.I: '.$ced_part.'  <br><br>
			Por su participacion en '.$tipo_plan.' de '.$nomb_plan.'<br><br></p><br>
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