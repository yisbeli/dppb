<?php
// variables
$dbhost = 'jorgcastellano.net.ve';
$dbname = 'dppb';
$dbuser = 'bomberos';
$dbpass = '123455';
 
$backup_file = $dbname. "-" .date("Y-m-d-H-i-s"). ".sql";
 
// comandos a ejecutar
$commands = array("mysqldump --host=$dbhost --user=$dbuser --password=$dbpass $dbname > $backup_file");

// ejecución y salida de éxito o errores
foreach ( $commands as $command ) {
        system($command,$output);
        echo $output;
}
?>