<?php
	include_once 'cabecera.php';
	include_once 'libs/menu.php';
?>
<section class="container">
  <div class="rows">
    <div class="col-md-5 col-md-offset-3">

<?php
    extract($_POST);
    if (isset($registro)) :
      if($contrasena_nueva !== $contrasena_nueva2): ?>

        <script type="text/javascript">
          alert("	No coinciden las claves ingresadas!");
          window.location="actualizar_contrasena.php";
        </script>
        <?php
      endif;

      $iduser=$_SESSION['iduser'];
      $command_sql="SELECT clave FROM user WHERE iduser = '$iduser'";
      require 'config/sql.php';
      $pass_actual=mysqli_fetch_array($result);

      $clave_actual=md5($contrasena_actual);
      if ($pass_actual[0]==$clave_actual) :

        $clave=md5($contrasena_nueva);
        $command_sql="UPDATE user SET clave = '$clave' WHERE iduser = '$iduser'";
        require 'config/sql.php';
        ?>
        <script type="text/javascript">
          alert("	Se ha actualizado la contraseña con éxito!");
          window.location="sala.php";
        </script>
    <?php
        else :
          ?>
          <script type="text/javascript">
            alert("Contraseña actual invalida");
            window.location="actualizar_contrasena.php";
          </script>
      <?php
        endif;
    else : ?>

      <form  method="POST" action="actualizar_contrasena.php">

        <legend> <h2>Cambio de Contraseña </h2></legend>

        <input class="form-control"type="password" name="contrasena_actual" required size="30" placeholder="Ingrese su contraseña actual"/>

        <input class="form-control"type="password" name="contrasena_nueva" required size="30" placeholder="Ingrese su nueva contraseña"/>

        <input class="form-control"type="password" name="contrasena_nueva2" required size="30" placeholder="Ingrese nuevamente su nueva contraseña"/> <br>

        <div class="text-center">
          <button class="btn btn-sistema" type="reset" title="volver" onclick=location="sala.php"> <span class="glyphicon glyphicon-hand-left"></span> Volver al inicio</button>
          <button class="btn btn-sistema" type="reset" title="Haga clic para limpiar formulario"> <span class="glyphicon glyphicon-repeat"> </span> Limpiar Formulario</button>
          <button type="submit" name="registro" value="registro" title="Haga clic para Registrarse" class="btn btn-sistema"><span class="glyphicon glyphicon-hand-up"></span> Registrarse</button>
        </div><br>

      </form>
    </div>
  </div>
</section>

<?php
	endif;
  include_once 'pie.php';  ?>
