<?php
session_start();
if($_SESSION["log"]!=1){
	?>
	<script>
		window.location="change_ad.php";
	</script>
	?>
}
?>