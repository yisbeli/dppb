<?php 
if (empty($_SESSION['login'])){ ?>
	<script>
		alert('Su tiempo de sesión ha expirado, por favor vuelva a iniciar sesión');
		location.href='home.php';
	</script>
<?php 
}
?>