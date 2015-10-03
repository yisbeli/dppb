<?php
	
session_start();

$_SESSION = array();

session_destroy();
?>
	 <script>
    window.location="../index.php";
    </script>