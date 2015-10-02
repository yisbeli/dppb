<?php   include_once 'librerias/cabecera.php'; ?>
    <div class="container"><br>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h1>Registro de los requisitos</h1>
                <?php 
                    extract($_POST);
                    require_once 'includes/conexion_bd.php';

                    if (isset($registro)) :

                        if (!isset($otros)){
                            $otros = "";
                        }
                        if ($soloactualizar == "no") :
                            $command_sql="INSERT INTO expediente (copia_ced,foto,carpeta,copia_titulo,sintesis,otros,cod_part) VALUES ('$copia_ced','$foto','$carpeta','$copia_titulo','$sintesis','$otros','$cedula')";  
                            mysqli_query($mysqli,$command_sql);
                        endif;

                        if (!isset($num_bauche)){
                            $num_bauche = "";
                        }

                        $sentencia="SELECT valor_unid FROM unidades_trib WHERE id_unid=(SELECT MAX(id_unid) FROM unidades_trib)";
                         $consultado=mysqli_query($mysqli,$sentencia);
                         $resultado2=mysqli_fetch_array($consultado);

                         $consulta="SELECT cant_unid FROM planes WHERE cod_plan='$codigoplan'";
                          $consul=mysqli_query($mysqli,$consulta);
                          $resul=mysqli_fetch_array($consul);

                          $precio=$resultado2[0]*$resul[0];

                     echo "$codigoplan, $precio, $resultado2[0],$resul[0]"; 

                        //actualizamos 
                        $command_sql="UPDATE planes_participantes SET exonerado='$tipo',bauche='$num_bauche', precio='$precio',status='inscrito' WHERE cod_plan='$codigoplan' AND cod_par='$cedula'";
                        mysqli_query($mysqli,$command_sql);

                ?>
                <?php 
                        elseif (isset($eliminar)) :
                            
                            $sql = "DELETE FROM planes_participantes WHERE cod_par='$cedula'";
                            if(mysqli_query($mysqli,$sql))
                            ?>
                            <script type="text/javascript">
                                alert("Participante PRE-INSCRITO eliminado satisfactoriamente!");
                                window.location="participantes_pre_inscritos.php";
                            </script>
                <?php

                        
                else :
                        echo '<form  method="POST" action="requisitos.php">';
                        $command_sql = "SELECT cod_par FROM participantes WHERE ced_part='$registrar'";
                        $result = mysqli_query($mysqli, $command_sql);
                        $resultado=mysqli_fetch_array($result);
                        $command_sql = "SELECT cod_part FROM expediente WHERE cod_part='$resultado[0]'";
                        $resultado_consulta = mysqli_query($mysqli, $command_sql);
                        $soloactualizar = "si";
                        if (!mysqli_num_rows($resultado_consulta)) :

                            $soloactualizar = "no";
                ?>
                        <legend>Documentos consignados</legend>
                        <label for="CI">1 FOTOCOPIA DE LA CEDULA DE IDENTIDAD: </label>
                        <input type="checkbox" value="s" name="copia_ced" required /> <br>
                        <label for="foto">2 FOTOS TIPO CARNET: </label>
                        <input type="checkbox" value="s" name="foto" required/> <br>

                        <label for="carpeta">1 CARPETA MARRON TAMAÑO OFICIO CON GANCHO:</label>
                        <input type="checkbox" value="s" name="carpeta" required /> <br>

                        <label for="ctitulo">1 FOTOCOPIA DE TITULO DE BACHILLER:</label>
                        <input type="checkbox" value="s" name="copia_titulo" required /><br>
                        
                        <label for="sintesis">1 SINTESIS CURRICULAR:</label>
                        <input type="checkbox" value="s" name="sintesis" required /><br>

                    <?php endif; ?>

                        <input type="hidden" name="soloactualizar" value="<?php echo $soloactualizar; ?>">
                        <input type="hidden" name="codigoplan" value="<?php if (isset($codigoplan)) echo $codigoplan ?>">
                        <input type="hidden" name="cedula" value="<?php echo $resultado[0]; ?>">

                        <label>Seleccione</label>
                        <select name="tipo" class="form-control">
                            <option value="No">Pago</option>
                            <option value="Si">Exonerado</option>
                        </select><br>
                         
                         <label>Numero de bauche</label>
                         <input class="form-control" id="text_form" type="text" maxlength="30" name="num_bauche" placeholder="Ingrese el numero del bauche" patter="^[a-zA-Z]{3,15}" title="Ingrese el numero del bauche del deposito"/><br>

                         <label>Otro documento</label>
                         <input class="form-control" id="text_form" type="text" maxlength="30" name="otros" placeholder="Ingrese otro documento si desea" patter="^[a-zA-Z]{3,15}" title="Ingrese otro tipo de documento si desea"/><br>
                
                    <div class="text-center">
                            <button type="reset" class="btn btn-warning" name="limpiar" value="Registrar" title="Limpiar datos seleccionados" >Limpiar datos</button>
                            <button type="submit" name="registro" value="registro" title="Haga clic para guardar los datos del expediente" class="btn btn-warning">Guardar datos</button>
                            <button type="submit" name="eliminar" value="eliminar" title="Haga clic para cancelar la inscripcion" class="btn btn-warning">Cancelar inscripcion</button>
                    </div><br><br>
                </form>
            </div>
        </div>
<?php endif;   include_once 'librerias/pie.php'; ?>
