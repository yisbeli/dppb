<?php
	include_once 'cabecera.php';

  extract($_POST);
  if (isset($registro)) :

    $sql=("SELECT correo FROM user WHERE correo='$correo'");
    $consulta=(mysqli_query($mysqli,$sql));
      if(mysqli_num_rows($consulta) == false):
?>
      <script type="text/javascript">
        alert("El correo no esta registrado en nuestra base de datos!");
        window.location="recuperar_contrasena.php";
      </script>
<?php
    endif;
    $sql=("SELECT pregunta FROM user WHERE correo='$correo'");
    $consulta=mysqli_query($mysqli,$sql);
    $pregunta=mysqli_fetch_array($consulta);

    if ($pregunta[0] == 1 )
      $mensaje="Nombre de su madre";
    else if($pregunta[0] == 2)
      $mensaje="Su mejor amigo de la infancia";
    else if($pregunta[0] == 3)
      $mensaje="Su personaje favorito";
    else if($pregunta[0] == 4)
      $mensaje="Su profesor de primaria";
    else if($pregunta[0] == 5)
      $mensaje="Año de promocion de los bomberos";
    else if($pregunta[0] == 6)
      $mensaje="Nombre de su padre";
    else if($pregunta[0] == 7)
      $mensaje="Su equipo de futbol favorito";
    else if($pregunta[0] == 8)
      $mensaje="Su color favorito";
    else
      $mensaje="Lugar de nacimiento";

    if (isset($respuesta)) :
    $respuesta=md5($respuesta);
    $sql=("SELECT respuesta FROM user WHERE correo='$correo'");
    $consulta=mysqli_query($mysqli,$sql);
    $respuesta1=mysqli_fetch_array($consulta);
      if($respuesta1[0] != $respuesta):
?>
      <script type="text/javascript">
        alert("La respuesta ingresada en incorrecta!");
        window.location="recuperar_contrasena.php";
      </script>
<?php
    endif;
    endif;
  endif;
?>

<section class="container">
  <div class="rows">
    <div class="col-md-5 col-md-offset-3">
      <form  method="POST" action="recuperar_contrasena.php">
     <input class="form-control" type="text" name="correo" value="<?php if (isset($correo)) echo $correo; ?>" required size="30" placeholder="Ingrese su correo"/>
     <?php if (isset($correo)) : ?>
        <label><?php echo $mensaje; ?></label>
       <input class="form-control" type="password" name="respuesta" required size="30" placeholder="Ingrese su respuesta"/>
      <?php endif;
        
      ?>
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
