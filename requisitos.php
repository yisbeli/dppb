<?php   include_once 'cabecera.php'; ?>
<?php   include_once 'inactivo.php';
        include_once 'sesion.php'; ?>
    <section class="container"><br>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h1>Registro de los requisitos</h1>
                <?php 
                    extract($_POST);
                    require_once 'config/conexion_bd.php';

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


                        //actualizamos 
                        $command_sql="UPDATE planes_participantes SET exonerado='$tipo',bauche='$num_bauche', status='inscrito' WHERE cod_plan='$codigoplan' AND cod_par='$cedula'";
                        mysqli_query($mysqli,$command_sql);

                        if ($tipo=="No"):

                            $command_sql="SELECT pp.precio FROM planes_participantes pp, planes_responsables pr WHERE pr.id='$codigoplan' AND pp.cod_par='$cedula'";
                            $h=mysqli_query($mysqli,$command_sql);
                            $precio=mysqli_fetch_array($h);

                            //Actualizacion de total_ingresos en la tabla fondos
                            $command_sql="SELECT * FROM fondos WHERE id=1"; 
                            $cons=mysqli_query($mysqli,$command_sql);
                            $res=mysqli_fetch_array($cons);
                            //calculamos
                            $suma=$precio[0]+$res[3];
                            $suma2=$precio[0]+$res[1];
                            echo "$suma,$suma2,$precio[0]";
                            $command_sql="UPDATE fondos SET total_ingreso='$suma2', saldo='$suma' WHERE id=1";
                            mysqli_query($mysqli,$command_sql);
                            echo '<script type="text/javascript">
                                alert("Participante registrado con éxito");
                                window.location="sala.php";
                            </script>';
                        endif;
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
                        <select name="tipo" class="form-control" required>
                            <option value="No">Pago</option>
                            <option value="Si">Exonerado</option>
                        </select><br>
                         
                         <label>Numero de bauche</label>
                         <input class="form-control" id="text_form" type="number" maxlength="30" name="num_bauche" placeholder="Ingrese el numero del bauche" required patter="^[a-zA-Z]{3,15}" title="Ingrese el numero del bauche del deposito"/><br>

                         <label>Otro documento</label>
                         <input class="form-control" id="text_form" type="text" maxlength="30" name="otros" placeholder="Ingrese otro documento si desea" patter="^[a-zA-Z]{3,15}" title="Ingrese otro tipo de documento si desea"/><br>
                
                    <div class="text-center">
                            <button type="reset" name="eliminar" value="eliminar" title="Haga clic para cancelar la inscripcion" class="btn btn-sistema" onclick=location="sala.php"> <span class="glyphicon glyphicon-trash"></span> Cancelar inscripcion</button>
                            <button type="reset" class="btn btn-sistema" name="limpiar" value="Registrar" title="Limpiar datos seleccionados" ><span class="glyphicon glyphicon-repeat"></span> Limpiar Formulario </button>
                            <button type="submit" name="registro" value="registro" title="Haga clic para guardar los datos del expediente" class="btn btn-sistema"><span class="glyphicon glyphicon-floppy-saved"></span> Guardar Datos</button>
                    </div><br><br>
                </form>
            </div>
        </div>
    </section>
<?php endif;   include_once 'pie.php';  ?>
