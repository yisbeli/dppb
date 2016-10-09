<?php
	include_once 'cabecera.php';
?>
<section class="container">
  <div class="rows">
    <div class="col-md-5 col-md-offset-3">
      <form  method="POST" action="recuperar_contrasena.php">
     <input class="form-control" type="text" name="recuperar_contrasena" required size="30" placeholder="Ingrese su correo"/> <br>
     <div class="text-center">
       <button class="btn btn-sistema" type="reset" title="volver" onclick=location="home.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>
       <button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>
       <button type="submit" name="registro" value="registro" title="Haga clic para Registrarse" class="btn btn-sistema"><span class="glyphicon glyphicon-hand-up"></span> Recuperar</button>
     </div><br>
   </form>

</div>
</div>
</section>

<?php
include_once 'pie.php';  ?>
