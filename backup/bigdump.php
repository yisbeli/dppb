<?php

error_reporting(E_ALL);

// Database configuration

$db_server   = 'localhost';
$db_name     = 'dppb2';
$db_username = 'root';
$db_password = ''; 

$archivo="Respaldo/".$_GET['file'];
//echo $archivo;

$zip = new ZipArchive;
$zip->open($archivo);

$zip->extractTo('Restaurar');
$zip->close();

$db_connection_charset = 'utf8';

// OPTIONAL SETTINGS 

$filename           = '';     
$ajax               = true;   
$linespersession    = 3000;   
$delaypersession    = 0;      


// CSV related settings (only if you use a CSV dump)

$csv_insert_table   = '';     
$csv_preempty_table = false;  // true: delete all entries from table specified in $csv_insert_table before processing
$csv_delimiter      = ',';    // Field delimiter in CSV file
$csv_add_quotes     = true;   // If your CSV data already have quotes around each field set it to false
$csv_add_slashes    = true;   // If your CSV data already have slashes in front of ' and " set it to false

// Allowed comment markers: lines starting with these strings will be ignored by BigDump

$comment[]='#';                       // Standard comment lines are dropped by default
$comment[]='-- ';
$comment[]='DELIMITER';               // Ignore DELIMITER switch as it's not a valid SQL statement
// $comment[]='---';                  // Uncomment this line if using proprietary dump created by outdated mysqldump
// $comment[]='CREATE DATABASE';      // Uncomment this line if your dump contains create database queries in order to ignore them
$comment[]='/*!';                     // Or add your own string to leave out other proprietary things


$delimiter = ';';

// String quotes character

$string_quotes = '\'';                  // Change to '"' if your dump file uses double qoutes for strings

// How many lines may be considered to be one query (except text lines)

$max_query_lines = 300;

// Where to put the upload files into (default: bigdump folder)

$upload_dir = dirname(__FILE__);

// *******************************************************************************************
// If not familiar with PHP please don't change anything below this line
// *******************************************************************************************

if ($ajax)
  ob_start();

define ('DATA_CHUNK_LENGTH',16384);  // How many chars are read per time
define ('TESTMODE',false);           // Set to true to process the file without actually accessing the database
define ('BIGDUMP_DIR',dirname(__FILE__));
define ('PLUGIN_DIR',BIGDUMP_DIR.'/plugins/');

header("Expires: Mon, 1 Dec 2003 01:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

@ini_set('auto_detect_line_endings', true);
@set_time_limit(0);

if (function_exists("date_default_timezone_set") && function_exists("date_default_timezone_get"))
  @date_default_timezone_set(@date_default_timezone_get());

// Clean and strip anything we don't want from user's input [0.27b]

foreach ($_REQUEST as $key => $val) 
{
  $val = preg_replace("/[^_A-Za-z0-9-\.&= ;\$]/i",'', $val);
  $_REQUEST[$key] = $val;
}


do_action('header');

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Restaurar</title>
<meta http-equiv="CONTENT-TYPE" content="text/html; charset=iso-8859-1"/>
<meta http-equiv="CONTENT-LANGUAGE" content="ES"/>

<meta http-equiv="Cache-Control" content="no-cache/"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<meta name="robots" content="noindex, nofollow">

<?php do_action('head_meta'); ?>

<style type="text/css">
<!--

body
{ background-color:#FFFFF0;
}

h1 
{ font-size:20px;
  line-height:24px;
  font-family:Arial,Helvetica,sans-serif;
  margin-top:5px;
  margin-bottom:5px;
}

p,td,th
{ font-size:14px;
  line-height:18px;
  font-family:Arial,Helvetica,sans-serif;
  margin-top:5px;
  margin-bottom:5px;
  text-align:justify;
  vertical-align:top;
}

p.centr
{ 
  text-align:center;
}

p.smlcentr
{ font-size:10px;
  line-height:14px;
  text-align:center;
}

p.error
{ color:#FF0000;
  font-weight:bold;
}

p.success
{ color:#00DD00;
  font-weight:bold;
}

p.successcentr
{ color:#00DD00;
  background-color:#DDDDFF;
  font-weight:bold;
  text-align:center;
}

td
{ background-color:#F8F8F8;
  text-align:left;
}

td.transparent
{ background-color:#FFFFF0;
}

th
{ font-weight:bold;
  color:#FFFFFF;
  background-color:#AAAAEE;
  text-align:left;
}

td.right
{ text-align:right;
}

form
{ margin-top:5px;
  margin-bottom:5px;
}

div.skin1
{
  border-color:#3333EE;
  border-width:5px;
  border-style:solid;
  background-color:#AAAAEE;
  text-align:center;
  vertical-align:middle;
  padding:3px;
  margin:1px;
}

td.bg3
{ background-color:#EEEE99;
  text-align:left;
  vertical-align:top;
  width:20%;
}

th.bg4
{ background-color:#EEAA55;
  text-align:left;
  vertical-align:top;
  width:20%;
}

td.bgpctbar
{ background-color:#EEEEAA;
  text-align:left;
  vertical-align:middle;
  width:80%;
}

<?php do_action('head_style'); ?>

-->
</style>

</head>

<body>

<center>

<table width="780" cellspacing="0" cellpadding="0">
<tr><td class="transparent">


<?php

function skin_open() 
{
  echo ('<div class="skin1">');
}

function skin_close() 
{
  echo ('</div>');
}

skin_open();
echo ('<h1>Restauracion de Base de Datos</h1>');
skin_close();

do_action('after_headline');

$error = false;
$file  = false;

// Check PHP version

if (!$error && !function_exists('version_compare'))
{ echo ("<p class=\"error\">PHP versión 4.1.0 ".phpversion()." instalar . por favor!</p>\n");
  $error=true;
}

// Check if mysql extension is available

if (!$error && !function_exists('mysqli_connect'))
{ echo ("<p class=\"error\">No hay extensión mysqli que se encuentra en la instalación de PHP. Puede utilizar una versión anterior de PHP soporta extensión de MySQL.</p>\n");
  $error=true;
}

// Calculate PHP max upload size (handle settings like 10M or 100K)

if (!$error)
{ $upload_max_filesize=ini_get("upload_max_filesize");
  if (preg_match("/([0-9]+)K/i",$upload_max_filesize,$tempregs)) $upload_max_filesize=$tempregs[1]*1024;
  if (preg_match("/([0-9]+)M/i",$upload_max_filesize,$tempregs)) $upload_max_filesize=$tempregs[1]*1024*1024;
  if (preg_match("/([0-9]+)G/i",$upload_max_filesize,$tempregs)) $upload_max_filesize=$tempregs[1]*1024*1024*1024;
}

  
do_action ('script_runs');

// Handle file upload

if (!$error && isset($_REQUEST["uploadbutton"]))
{ if (is_uploaded_file($_FILES["dumpfile"]["tmp_name"]) && ($_FILES["dumpfile"]["error"])==0)
  { 
    $uploaded_filename=str_replace(" ","_",$_FILES["dumpfile"]["name"]);
    $uploaded_filename=preg_replace("/[^_A-Za-z0-9-\.]/i",'',$uploaded_filename);
    $uploaded_filepath=str_replace("\\","/",$upload_dir."/".$uploaded_filename);

    do_action('file_uploaded');

    if (file_exists($uploaded_filename))
    { echo ("<p class=\"error\">File $uploaded_filename ¡ya existe! Eliminar y subir de nuevo!</p>\n");
    }
    else if (!preg_match("/(\.(sql|gz|csv))$/i",$uploaded_filename))
    { echo ("<p class=\"error\">Sólo se puede cargar .sql .gz o csv..</p>\n");
    }
    else if (!@move_uploaded_file($_FILES["dumpfile"]["tmp_name"],$uploaded_filepath))
    { echo ("<p class=\"error\">Error al mover el archivo subido".$_FILES["dumpfile"]["tmp_name"]." al $uploaded_filepath</p>\n");
      echo ("<p>Compruebe los permisos de directorio para $upload_dir (must be 777)!</p>\n");
    }
    else
    { echo ("<p class=\"success\">El archivo subido guardado como $uploaded_filename</p>\n");
    }
  }
  else
  { echo ("<p class=\"error\">Error al subir el archivo ".$_FILES["dumpfile"]["name"]."</p>\n");
  }
}


// Handle file deletion (delete only in the current directory for security reasons)

if (!$error && isset($_REQUEST["delete"]) && $_REQUEST["delete"]!=basename($_SERVER["SCRIPT_FILENAME"]))
{ if (preg_match("/(\.(sql|gz|csv))$/i",$_REQUEST["delete"]) && @unlink($upload_dir.'/'.$_REQUEST["delete"])) 
    echo ("<p class=\"success\">".$_REQUEST["delete"]." fue eliminado con éxito</p>\n");
  else
    echo ("<p class=\"error\">No se puede eliminar ".$_REQUEST["delete"]."</p>\n");
}

// Connect to the database, set charset and execute pre-queries

if (!$error && !TESTMODE)
{ $mysqli = new mysqli($db_server, $db_username, $db_password, $db_name);
  
  if (mysqli_connect_error()) 
  { echo ("<p class=\"error\">conexión de base de datos ha fallado debido a ".mysqli_connect_error()."</p>\n");
    echo ("<p>Editar la configuración de base de datos en la configuración , o póngase en contacto con su proveedor de base de datos.</p>\n");
    $error=true;
  }
  if (!$error && $db_connection_charset!=='')
    $mysqli->query("SET NAMES $db_connection_charset");

  if (!$error && isset ($pre_query) && sizeof ($pre_query)>0)
  { reset($pre_query);
    foreach ($pre_query as $pre_query_value)
    {	if (!$mysqli->query($pre_query_value))
    	{ echo ("<p class=\"error\">Error con el pre-consulta.</p>\n");
      	echo ("<p>Query: ".trim(nl2br(htmlentities($pre_query_value)))."</p>\n");
      	echo ("<p>MySQL: ".$mysqli->error."</p>\n");
      	$error=true;
      	break;
     }
    }
  }
}
else
{ $dbconnection = false;
}

do_action('database_connected');

// DIAGNOSTIC


if (!$error && !isset($_REQUEST["fn"]) && $filename=="")
{ if ($dirhandle = opendir($upload_dir)) 
  { 
    $files=array();
    while (false !== ($files[] = readdir($dirhandle)));
    closedir($dirhandle);
    $dirhead=false;

    if (sizeof($files)>0)
    { 
      sort($files);
      foreach ($files as $dirfile)
      { 
        if ($dirfile != "." && $dirfile != ".." && $dirfile!=basename($_SERVER["SCRIPT_FILENAME"]) && preg_match("/\.(sql|gz|csv)$/i",$dirfile))
        { if (!$dirhead)
          { echo ("<table width=\"100%\" cellspacing=\"2\" cellpadding=\"2\">\n");
            echo ("<tr><th>Nombre del archivo</th><th>Tamaño</th><th>Date&amp;Time</th><th>tipo</th><th>&nbsp;</th><th>&nbsp;</th>\n");
            $dirhead=true;
          }
          echo ("<tr><td>$dirfile</td><td class=\"right\">".filesize($upload_dir.'/'.$dirfile)."</td><td>".date ("Y-m-d H:i:s", filemtime($upload_dir.'/'.$dirfile))."</td>");

          if (preg_match("/\.sql$/i",$dirfile))
            echo ("<td>SQL</td>");
          elseif (preg_match("/\.gz$/i",$dirfile))
            echo ("<td>GZip</td>");
          elseif (preg_match("/\.csv$/i",$dirfile))
            echo ("<td>CSV</td>");
          else
            echo ("<td>Misc</td>");

          if ((preg_match("/\.gz$/i",$dirfile) && function_exists("gzopen")) || preg_match("/\.sql$/i",$dirfile) || preg_match("/\.csv$/i",$dirfile))
            echo ("<td><a href=\"".$_SERVER["PHP_SELF"]."?start=1&amp;fn=".urlencode($dirfile)."&amp;foffset=0&amp;totalqueries=0&amp;delimiter=".urlencode($delimiter)."\">Ver la Importacion</a> into $db_name at $db_server</td>\n <td><a href=\"".$_SERVER["PHP_SELF"]."?delete=".urlencode($dirfile)."\">Eliminar fila</a></td></tr>\n");
// TODO: echo ("<td><a href=\"".$_SERVER["PHP_SELF"]."?start=1&amp;fn=".urlencode($dirfile)."&amp;foffset=0&amp;totalqueries=0&amp;delimiter=".urlencode($delimiter)."\">Start Import</a></td>\n <td><a href=\"".$_SERVER["PHP_SELF"]."?delete=".urlencode($dirfile)."\">Delete file</a></td></tr>\n");
          else
            echo ("<td>&nbsp;</td>\n <td>&nbsp;</td></tr>\n");
        }
      }
    }

    if ($dirhead) 
      echo ("</table>\n");
    else 
      echo ("<p>Sin SQL cargados, GZ archivos CSV o encontrar en el directorio de trabajo</p>\n");
  }
  else
  { echo ("<p class=\"error\">listado del directorio de error $upload_dir</p>\n");
    $error=true;
  }
}


// Single file mode

if (!$error && !isset ($_REQUEST["fn"]) && $filename!="")
{ echo ("<p><a href=\"".$_SERVER["PHP_SELF"]."?start=1&amp;fn=".urlencode($filename)."&amp;foffset=0&amp;totalqueries=0\">Ver la Importacion</a> from $filename into $db_name at $db_server</p>\n");
}


// File Upload Form

if (!$error && !isset($_REQUEST["fn"]) && $filename=="")
{ 

// Test permissions on working directory

  do { $tempfilename=$upload_dir.'/'.time().".tmp"; } while (file_exists($tempfilename)); 
  if (!($tempfile=@fopen($tempfilename,"w")))
  { echo ("<p>formulario de carga desactivada. Los permisos para el directorio de trabajo<i>$upload_dir</i> <b>se debe establecer permisos de escritura para el servidor web</b>en orden ");
    echo ("para subir archivos aquí. Alternativamente, usted puede cargar sus archivos de volcado a través de FTP.</p>\n");
  }
  else
  { fclose($tempfile);
    unlink ($tempfilename);
 
    echo ("<p>Ahora puede cargar su archivo hasta $upload_max_filesize bytes (".round ($upload_max_filesize/1024/1024)." Mbytes)  ");
   
?>
<form method="POST" action="<?php echo ($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data">
<input type="hidden" name="MAX_FILE_SIZE" value="$upload_max_filesize">
<p>Seleccione el archivo (.sql) a restaurar: <input type="file" name="dumpfile" accept="*/*" size="60"></p>
<p><input type="submit" name="uploadbutton" value="Restaurar Respaldo"></p>
</form>
<?php
  }
}


if (!$error && isset($_REQUEST["start"]))
{ 


  if ($filename!="")
    $curfilename=$filename;
  else if (isset($_REQUEST["fn"]))
    $curfilename=urldecode($_REQUEST["fn"]);
  else
    $curfilename="";

// Recognize GZip filename

  if (preg_match("/\.gz$/i",$curfilename)) 
    $gzipmode=true;
  else
    $gzipmode=false;

  if ((!$gzipmode && !$file=@fopen($upload_dir.'/'.$curfilename,"r")) || ($gzipmode && !$file=@gzopen($upload_dir.'/'.$curfilename,"r")))
  { echo ("<p class=\"error\">No se puede abrir ".$curfilename." para la importación</p>\n");
    echo ("<p>Por favor, compruebe que su nombre de archivo contiene sólo caracteres alfanuméricos, y cambiarle el nombre en consecuencia, por ejemplo: $curfilename.".
           "<br>O bien, especifique \$filename el nombre de archivo completo. ".
           "<br>O bien, usted tiene que cargar el $curfilename al servidor primero.</p>\n");
    $error=true;
  }

// Get the file size (can't do it fast on gzipped files, no idea how)

  else if ((!$gzipmode && @fseek($file, 0, SEEK_END)==0) || ($gzipmode && @gzseek($file, 0)==0))
  { if (!$gzipmode) $filesize = ftell($file);
    else $filesize = gztell($file);                   // Always zero, ignore
  }
  else
  { echo ("<p class=\"error\">No puedo buscar en $curfilename</p>\n");
    $error=true;
  }

// Stop if csv file is used, but $csv_insert_table is not set

  if (!$error && ($csv_insert_table == "") && (preg_match("/(\.csv)$/i",$curfilename)))
  { echo ("<p class=\"error\">Se tiene que especificar \$csv_insert_table cuando se utiliza un archivo CSV. </p>\n");
    $error=true;
  }
}


// *******************************************************************************************
// START IMPORT SESSION HERE
// *******************************************************************************************

if (!$error && isset($_REQUEST["start"]) && isset($_REQUEST["foffset"]) && preg_match("/(\.(sql|gz|csv))$/i",$curfilename))
{

  do_action('session_start');

// Check start and foffset are numeric values

  if (!is_numeric($_REQUEST["start"]) || !is_numeric($_REQUEST["foffset"]))
  { echo ("<p class=\"error\">Inesperado: los valores no numéricos para el inicio y el desplazamiento</p>\n");
    $error=true;
  }
  else
  {	$_REQUEST["start"]   = floor($_REQUEST["start"]);
    $_REQUEST["foffset"] = floor($_REQUEST["foffset"]);
  }

// Set the current delimiter if defined

  if (isset($_REQUEST["delimiter"]))
    $delimiter = $_REQUEST["delimiter"];

// Empty CSV table if requested

  if (!$error && $_REQUEST["start"]==1 && $csv_insert_table != "" && $csv_preempty_table)
  { 
    $query = "DELETE FROM `$csv_insert_table`";
    if (!TESTMODE && !$mysqli->query(trim($query)))
    { echo ("<p class=\"error\">Error al borrar las entradas de $csv_insert_table.</p>\n");
      echo ("<p>Query: ".trim(nl2br(htmlentities($query)))."</p>\n");
      echo ("<p>MySQL: ".$mysqli->error."</p>\n");
      $error=true;
    }
  }
  
// Print start message

  if (!$error)
  { skin_open();
    if (TESTMODE) 
      echo ("<p class=\"centr\">MODO DE PRUEBA HABILITADO</p>\n");
    echo ("<p class=\"centr\">archivo de procesamiento: <b>".$curfilename."</b></p>\n");
    echo ("<p class=\"smlcentr\">A partir de la línea: ".$_REQUEST["start"]."</p>\n");	
    skin_close();
  }

// Check $_REQUEST["foffset"] upon $filesize (can't do it on gzipped files)

  if (!$error && !$gzipmode && $_REQUEST["foffset"]>$filesize)
  { echo ("<p class=\"error\">INESPERADO: No se puede establecer puntero de archivo detrás del final del archivo</p>\n");
    $error=true;
  }

// Set file pointer to $_REQUEST["foffset"]

  if (!$error && ((!$gzipmode && fseek($file, $_REQUEST["foffset"])!=0) || ($gzipmode && gzseek($file, $_REQUEST["foffset"])!=0)))
  { echo ("<p class=\"error\">INESPERADO: No se puede establecer puntero de archivo para compensar: ".$_REQUEST["foffset"]."</p>\n");
    $error=true;
  }

// Start processing queries from $file

  if (!$error)
  { $query="";
    $queries=0;
    $totalqueries=$_REQUEST["totalqueries"];
    $linenumber=$_REQUEST["start"];
    $querylines=0;
    $inparents=false;

// Stay processing as long as the $linespersession is not reached or the query is still incomplete

    while ($linenumber<$_REQUEST["start"]+$linespersession || $query!="")
    {

// Read the whole next line

      $dumpline = "";
      while (!feof($file) && substr ($dumpline, -1) != "\n" && substr ($dumpline, -1) != "\r")
      { if (!$gzipmode)
          $dumpline .= fgets($file, DATA_CHUNK_LENGTH);
        else
          $dumpline .= gzgets($file, DATA_CHUNK_LENGTH);
      }
      if ($dumpline==="") break;

// Remove UTF8 Byte Order Mark at the file beginning if any

      if ($_REQUEST["foffset"]==0)
        $dumpline=preg_replace('|^\xEF\xBB\xBF|','',$dumpline);

// Create an SQL query from CSV line

      if (($csv_insert_table != "") && (preg_match("/(\.csv)$/i",$curfilename)))
      {
        if ($csv_add_slashes)
          $dumpline = addslashes($dumpline);
        $dumpline = explode($csv_delimiter,$dumpline);
        if ($csv_add_quotes)
          $dumpline = "'".implode("','",$dumpline)."'";
        else
          $dumpline = implode(",",$dumpline);
        $dumpline = 'INSERT INTO '.$csv_insert_table.' VALUES ('.$dumpline.');';
      }

// Handle DOS and Mac encoded linebreaks (I don't know if it really works on Win32 or Mac Servers)

      $dumpline=str_replace("\r\n", "\n", $dumpline);
      $dumpline=str_replace("\r", "\n", $dumpline);
            
// DIAGNOSTIC
// echo ("<p>Line $linenumber: $dumpline</p>\n");

// Recognize delimiter statement

      if (!$inparents && strpos ($dumpline, "DELIMITER ") === 0)
        $delimiter = str_replace ("DELIMITER ","",trim($dumpline));

// Skip comments and blank lines only if NOT in parents

      if (!$inparents)
      { $skipline=false;
        reset($comment);
        foreach ($comment as $comment_value)
        { 

// DIAGNOSTIC
//          echo ($comment_value);
          if (trim($dumpline)=="" || strpos (trim($dumpline), $comment_value) === 0)
          { $skipline=true;
            break;
          }
        }
        if ($skipline)
        { $linenumber++;

// DIAGNOSTIC
// echo ("<p>Comment line skipped</p>\n");

          continue;
        }
      }

// Remove double back-slashes from the dumpline prior to count the quotes ('\\' can only be within strings)
      
      $dumpline_deslashed = str_replace ("\\\\","",$dumpline);

// Count ' and \' (or " and \") in the dumpline to avoid query break within a text field ending by $delimiter

      $parents=substr_count ($dumpline_deslashed, $string_quotes)-substr_count ($dumpline_deslashed, "\\$string_quotes");
      if ($parents % 2 != 0)
        $inparents=!$inparents;

// Add the line to query

      $query .= $dumpline;

// Don't count the line if in parents (text fields may include unlimited linebreaks)
      
      if (!$inparents)
        $querylines++;
      
// Stop if query contains more lines as defined by $max_query_lines

      if ($querylines>$max_query_lines)
      {
        echo ("<p class=\"error\">Se detuvo en la línea $linenumber. </p>");
        echo ("<p>En este lugar la consulta actual incluye más de ".$max_query_lines." líneas. Esto puede suceder si el archivo de volcado era ");
        echo ("creado por alguna herramienta que no coloque un punto y coma seguido de un salto de línea al final de cada consulta, o si su volcado contiene ");
        echo ("inserciones extendidos o las definiciones de procedimientos muy largos.</a> ");
        echo ("para más informaciones. Pedir que los servicios de apoyo ");
        echo ("con el fin de manejar los archivos de volcado que contienen insertos largos.</p>\n");
        $error=true;
        break;
      }


// DIAGNOSTIC
// echo ("<p>Regex: ".'/'.preg_quote($delimiter).'$/'."</p>\n");
// echo ("<p>In Parents: ".($inparents?"true":"false")."</p>\n");
// echo ("<p>Line: $dumpline</p>\n");

      if ((preg_match('/'.preg_quote($delimiter,'/').'$/',trim($dumpline)) || $delimiter=='') && !$inparents)
      { 

// Cut off delimiter of the end of the query

        $query = substr(trim($query),0,-1*strlen($delimiter));

// DIAGNOSTIC
// echo ("<p>Query: ".trim(nl2br(htmlentities($query)))."</p>\n");

        if (!TESTMODE && !$mysqli->query($query))
        { echo ("<p class=\"error\">Error en la línea de $linenumber: ". trim($dumpline)."</p>\n");
          echo ("<p>Query: ".trim(nl2br(htmlentities($query)))."</p>\n");
          echo ("<p>MySQL: ".$mysqli->error."</p>\n");
          $error=true;
          break;
        }
        $totalqueries++;
        $queries++;
        $query="";
        $querylines=0;
      }
      $linenumber++;
    }
  }

// Get the current file position

  if (!$error)
  { if (!$gzipmode) 
      $foffset = ftell($file);
    else
      $foffset = gztell($file);
    if (!$foffset)
    { echo ("<p class=\"error\">INESPERADO: No se puede leer el archivo puntero de desplazamiento </p>\n");
      $error=true;
    }
  }

// Print statistics

skin_open();

// echo ("<p class=\"centr\"><b>Statistics</b></p>\n");

  if (!$error)
  { 
    $lines_this   = $linenumber-$_REQUEST["start"];
    $lines_done   = $linenumber-1;
    $lines_togo   = ' ? ';
    $lines_tota   = ' ? ';
    
    $queries_this = $queries;
    $queries_done = $totalqueries;
    $queries_togo = ' ? ';
    $queries_tota = ' ? ';

    $bytes_this   = $foffset-$_REQUEST["foffset"];
    $bytes_done   = $foffset;
    $kbytes_this  = round($bytes_this/1024,2);
    $kbytes_done  = round($bytes_done/1024,2);
    $mbytes_this  = round($kbytes_this/1024,2);
    $mbytes_done  = round($kbytes_done/1024,2);
   
    if (!$gzipmode)
    {
      $bytes_togo  = $filesize-$foffset;
      $bytes_tota  = $filesize;
      $kbytes_togo = round($bytes_togo/1024,2);
      $kbytes_tota = round($bytes_tota/1024,2);
      $mbytes_togo = round($kbytes_togo/1024,2);
      $mbytes_tota = round($kbytes_tota/1024,2);
      
      $pct_this   = ceil($bytes_this/$filesize*100);
      $pct_done   = ceil($foffset/$filesize*100);
      $pct_togo   = 100 - $pct_done;
      $pct_tota   = 100;

      if ($bytes_togo==0) 
      { $lines_togo   = '0'; 
        $lines_tota   = $linenumber-1; 
        $queries_togo = '0'; 
        $queries_tota = $totalqueries; 
      }

      $pct_bar    = "<div style=\"height:15px;width:$pct_done%;background-color:#000080;margin:0px;\"></div>";
    }
    else
    {
      $bytes_togo  = ' ? ';
      $bytes_tota  = ' ? ';
      $kbytes_togo = ' ? ';
      $kbytes_tota = ' ? ';
      $mbytes_togo = ' ? ';
      $mbytes_tota = ' ? ';
      
      $pct_this    = ' ? ';
      $pct_done    = ' ? ';
      $pct_togo    = ' ? ';
      $pct_tota    = 100;
      $pct_bar     = str_replace(' ','&nbsp;','<tt>[ No está disponible para ficheros comprimidos]</tt>');
    }
    
    echo ("
    <center>
    <table width=\"520\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\">
    <tr><th class=\"bg4\"> </th><th class=\"bg4\">Sesión</th><th class=\"bg4\">hecho</th><th class=\"bg4\">Ir</th><th class=\"bg4\">Total</th></tr>
    <tr><th class=\"bg4\">Líneas</th><td class=\"bg3\">$lines_this</td><td class=\"bg3\">$lines_done</td><td class=\"bg3\">$lines_togo</td><td class=\"bg3\">$lines_tota</td></tr>
    <tr><th class=\"bg4\">consultas</th><td class=\"bg3\">$queries_this</td><td class=\"bg3\">$queries_done</td><td class=\"bg3\">$queries_togo</td><td class=\"bg3\">$queries_tota</td></tr>
    <tr><th class=\"bg4\">Bytes</th><td class=\"bg3\">$bytes_this</td><td class=\"bg3\">$bytes_done</td><td class=\"bg3\">$bytes_togo</td><td class=\"bg3\">$bytes_tota</td></tr>
    <tr><th class=\"bg4\">KB</th><td class=\"bg3\">$kbytes_this</td><td class=\"bg3\">$kbytes_done</td><td class=\"bg3\">$kbytes_togo</td><td class=\"bg3\">$kbytes_tota</td></tr>
    <tr><th class=\"bg4\">MB</th><td class=\"bg3\">$mbytes_this</td><td class=\"bg3\">$mbytes_done</td><td class=\"bg3\">$mbytes_togo</td><td class=\"bg3\">$mbytes_tota</td></tr>
    <tr><th class=\"bg4\">%</th><td class=\"bg3\">$pct_this</td><td class=\"bg3\">$pct_done</td><td class=\"bg3\">$pct_togo</td><td class=\"bg3\">$pct_tota</td></tr>
    <tr><th class=\"bg4\">% bar</th><td class=\"bgpctbar\" colspan=\"4\">$pct_bar</td></tr>
    </table>
    </center>
    \n");

// Finish message and restart the script

    if ($linenumber<$_REQUEST["start"]+$linespersession)
    { echo ("<p class=\"successcentr\">Felicidades: Archivo cargado exitosamente</p>\n");
      echo ("<p class=\"successcentr\">IMPORTANTE: Los Cambios realizados sustituyen automaticamente los existentes!</p>\n");
      echo ("<p class=\"centr\">Esta herremienta te permite ver los cambios realizados dentro de la base de datos</a></p>\n");
      echo ("<p class=\"centr\">Una ver terminado preciona en IR A INICIO</p>\n");
?>

<?php      
      do_action('script_finished');
      $error=true; // This is a semi-error telling the script is finished
    }
    else
    { if ($delaypersession!=0)
        echo ("<p class=\"centr\">Ahora soy <b>Espere $delaypersession milliseconds</b> antes de iniciar la próxima sesión...</p>\n");
      if (!$ajax) 
        echo ("<script language=\"JavaScript\" type=\"text/javascript\">window.setTimeout('location.href=\"".$_SERVER["PHP_SELF"]."?start=$linenumber&fn=".urlencode($curfilename)."&foffset=$foffset&totalqueries=$totalqueries&delimiter=".urlencode($delimiter)."\";',500+$delaypersession);</script>\n");

      echo ("<noscript>\n");
      echo ("<p class=\"centr\"><a href=\"".$_SERVER["PHP_SELF"]."?start=$linenumber&amp;fn=".urlencode($curfilename)."&amp;foffset=$foffset&amp;totalqueries=$totalqueries&amp;delimiter=".urlencode($delimiter)."\">Continuar desde la línea de $linenumber</a> (Habilitar JavaScript para hacerlo de forma automática)</p>\n");
      echo ("</noscript>\n");
   
      echo ("<p class=\"centr\">Presione <b><a href=\"".$_SERVER["PHP_SELF"]."\">STOP</a></b> para abortar la importación <b>OR WAIT!</b></p>\n");
    }
  }
  else 
    echo ("<p class=\"error\">Detenido por error</p>\n");

skin_close();

}

if ($error)
  echo ("<p class=\"centr\"><a href=\"index.php\">Ir a Inicio</a></p>\n");

if ($mysqli) $mysqli->close();
if ($file && !$gzipmode) fclose($file);
else if ($file && $gzipmode) gzclose($file);

?>

</td></tr></table>

</center>
<?php do_action('end_of_body'); ?>
</body>
</html>

<?php

// If error or finished put out the whole output from above and stop

if ($error) 
{
  $out1 = ob_get_contents();
  ob_end_clean();
  echo $out1;
  die;
}

// If Ajax enabled and in import progress creates responses  (XML response or script for the initial page)

if ($ajax && isset($_REQUEST['start']))
{
  if (isset($_REQUEST['ajaxrequest'])) 
  {	ob_end_clean();
	  create_xml_response();
	  die;
  } 
  else 
    create_ajax_script();	  
}

// Anyway put out the output from above

ob_flush();

// THE MAIN SCRIPT ENDS HERE

// *******************************************************************************************
// Plugin handling (EXPERIMENTAL)
// *******************************************************************************************

function do_action($tag)
{ global $plugin_actions;
  
  if (isset($plugin_actions[$tag]))
  { reset ($plugin_actions[$tag]);
    foreach ($plugin_actions[$tag] as $action)
      call_user_func_array($action, array());
  }
}

function add_action($tag, $function)
{
	global $plugin_actions;
	$plugin_actions[$tag][] = $function;
}

// *******************************************************************************************
// 				AJAX utilities
// *******************************************************************************************

function create_xml_response() 
{
  global $linenumber, $foffset, $totalqueries, $curfilename, $delimiter,
				 $lines_this, $lines_done, $lines_togo, $lines_tota,
				 $queries_this, $queries_done, $queries_togo, $queries_tota,
				 $bytes_this, $bytes_done, $bytes_togo, $bytes_tota,
				 $kbytes_this, $kbytes_done, $kbytes_togo, $kbytes_tota,
				 $mbytes_this, $mbytes_done, $mbytes_togo, $mbytes_tota,
				 $pct_this, $pct_done, $pct_togo, $pct_tota,$pct_bar;

	header('Content-Type: application/xml');
	header('Cache-Control: no-cache');
	
	echo '<?xml version="1.0" encoding="ISO-8859-1"?>';
	echo "<root>";

// data - for calculations

	echo "<linenumber>$linenumber</linenumber>";
	echo "<foffset>$foffset</foffset>";
	echo "<fn>$curfilename</fn>";
	echo "<totalqueries>$totalqueries</totalqueries>";
	echo "<delimiter>$delimiter</delimiter>";

// results - for page update

	echo "<elem1>$lines_this</elem1>";
	echo "<elem2>$lines_done</elem2>";
	echo "<elem3>$lines_togo</elem3>";
	echo "<elem4>$lines_tota</elem4>";
	
	echo "<elem5>$queries_this</elem5>";
	echo "<elem6>$queries_done</elem6>";
	echo "<elem7>$queries_togo</elem7>";
	echo "<elem8>$queries_tota</elem8>";
	
	echo "<elem9>$bytes_this</elem9>";
	echo "<elem10>$bytes_done</elem10>";
	echo "<elem11>$bytes_togo</elem11>";
	echo "<elem12>$bytes_tota</elem12>";
			
	echo "<elem13>$kbytes_this</elem13>";
	echo "<elem14>$kbytes_done</elem14>";
	echo "<elem15>$kbytes_togo</elem15>";
	echo "<elem16>$kbytes_tota</elem16>";
	
	echo "<elem17>$mbytes_this</elem17>";
	echo "<elem18>$mbytes_done</elem18>";
	echo "<elem19>$mbytes_togo</elem19>";
	echo "<elem20>$mbytes_tota</elem20>";
	
	echo "<elem21>$pct_this</elem21>";
	echo "<elem22>$pct_done</elem22>";
	echo "<elem23>$pct_togo</elem23>";
	echo "<elem24>$pct_tota</elem24>";
	echo "<elem_bar>".htmlentities($pct_bar)."</elem_bar>";
				
	echo "</root>";		
}


function create_ajax_script() 
{
  global $linenumber, $foffset, $totalqueries, $delaypersession, $curfilename, $delimiter;
?>

	<script type="text/javascript" language="javascript">			

	// creates next action url (upload page, or XML response)
	function get_url(linenumber,fn,foffset,totalqueries,delimiter) {
		return "<?php echo $_SERVER['PHP_SELF'] ?>?start="+linenumber+"&fn="+fn+"&foffset="+foffset+"&totalqueries="+totalqueries+"&delimiter="+delimiter+"&ajaxrequest=true";
	}
	
	// extracts text from XML element (itemname must be unique)
	function get_xml_data(itemname,xmld) {
		return xmld.getElementsByTagName(itemname).item(0).firstChild.data;
	}
	
	function makeRequest(url) {
		http_request = false;
		if (window.XMLHttpRequest) { 
		// Mozilla etc.
			http_request = new XMLHttpRequest();
			if (http_request.overrideMimeType) {
				http_request.overrideMimeType("text/xml");
			}
		} else if (window.ActiveXObject) { 
		// IE
			try {
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				try {
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch(e) {}
			}
		}
		if (!http_request) {
				alert("Cannot create an XMLHTTP instance");
				return false;
		}
		http_request.onreadystatechange = server_response;
		http_request.open("GET", url, true);
		http_request.send(null);
	}
	
	function server_response() 
	{

	  // waiting for correct response
	  if (http_request.readyState != 4)
		return;

	  if (http_request.status != 200) 
	  {
	    alert("Página no disponible, o url mal!")
	    return;
	  }
		
		// r = xml response
		var r = http_request.responseXML;
		
		//if received not XML but HTML with new page to show
		if (!r || r.getElementsByTagName('root').length == 0) 
		{	var text = http_request.responseText;
			document.open();
			document.write(text);		
			document.close();	
			return;		
		}
		
		// update "Starting from line: "
		document.getElementsByTagName('p').item(1).innerHTML = 
			"A partir de la línea: " + 
			   r.getElementsByTagName('linenumber').item(0).firstChild.nodeValue;
		
		// update table with new values
		for(i = 1; i <= 24; i++)
			document.getElementsByTagName('td').item(i).firstChild.data = get_xml_data('elem'+i,r);
		
		// update color bar
		document.getElementsByTagName('td').item(25).innerHTML = 
			r.getElementsByTagName('elem_bar').item(0).firstChild.nodeValue;
			 
		// action url (XML response)	 
		url_request =  get_url(
			get_xml_data('linenumber',r),
			get_xml_data('fn',r),
			get_xml_data('foffset',r),
			get_xml_data('totalqueries',r),
			get_xml_data('delimiter',r));
		
		// ask for XML response	
		window.setTimeout("makeRequest(url_request)",500+<?php echo $delaypersession; ?>);
	}

	// First Ajax request from initial page

	var http_request = false;
	var url_request =  get_url(<?php echo ($linenumber.',"'.urlencode($curfilename).'",'.$foffset.','.$totalqueries.',"'.urlencode($delimiter).'"') ;?>);
	window.setTimeout("makeRequest(url_request)",500+<?php echo $delaypersession; ?>);
	</script>

<?php
}

?>
