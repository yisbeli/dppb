<?php   include_once 'librerias/cabecera.php'; ?>
    <div class="container"><br>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h1>Registro de los requisitos</h1>
                    <?php 
                        extract($_POST);
                        require_once 'includes/conexion_bd.php';

                        if (isset($registro)):
                       echo "$tipo,$num_bauche,$cedula,$codigoplan";

                        $command_sql="INSERT INTO expediente (copia_ced,foto,carpeta,copia_titulo,sintesis,otros,cod_part) VALUES ('$copia_ced','$foto','$carpeta','$copia_titulo','$sintesis','$otros','$cedula')";  
                        mysqli_query($mysqli,$command_sql); 

                        $command_sql="UPDATE planes_participantes SET exonerado='$tipo',bauche='$num_bauche' WHERE cod_plan='$codigoplan' AND cod_par='$cedula'";
                        mysqli_query($mysqli,$command_sql); 

                    ?>     
                    <?php else :
                        $command_sql="SELECT cod_par FROM participantes WHERE ced_part='$registrar'";
                        $result = mysqli_query($mysqli, $command_sql);
                        $resultado=mysqli_fetch_array($result);
                    ?>
                    <form  method="POST" action="requisitos.php">
                        <legend>Documentos consignados</legend>
                        <section id="cuerpo_form">
                            <label for="CI">1 FOTOCOPIA DE LA CEDULA DE IDENTIDAD: </label>
                            <input type="checkbox" value="s" name="copia_ced" required /> <br>
                            <input type="hidden" name="cedula" value="<?php echo $resultado[0]; ?>">
                            <input type="hidden" name="codigoplan" value="<?php if (isset($codigoplan)) echo $codigoplan ?>">
                            <label for="foto">2 FOTOS TIPO CARNET: </label>
                            <input type="checkbox" value="s" name="foto" required/> <br>

                            <label for="carpeta">1 CARPETA MARRON TAMAÑO OFICIO CON GANCHO:</label>
                            <input type="checkbox" value="s" name="carpeta" required /> <br>

                            <label for="ctitulo">1 FOTOCOPIA DE TITULO DE BACHILLER:</label>
                            <input type="checkbox" value="s" name="copia_titulo" required /><br>
                            
                            <label for="sintesis">1 SINTESIS CURRICULAR:</label>
                            <input type="checkbox" value="s" name="sintesis" required /><br>

                            <label>Seleccione</label>
                            <select name="tipo" class="form-control">
                                <option value="No">Pago</option>
                                <option value="Si">Exonerado</option>
                            </select><br>
                             
                             <input class="form-control" id="text_form" type="text" maxlength="30" name="num_bauche" placeholder="Ingrese el numero del bauche" requi patter="^[a-zA-Z]{3,15}" title="Ingrese el numero del bauche del deposito"/><br>

                             <label>Otro documento</label>
                             <input class="form-control" id="text_form" type="text" maxlength="30" name="otros" placeholder="Ingrese otro documento si desea" requi patter="^[a-zA-Z]{3,15}" title="Ingrese otro tipo de documento si desea"/><br>

                        </section>
                    
                    
                    <div class="text-center">
                            <button type="reset" class="btn btn-danger" name="limpiar" value="Registrar" title="Limpiar datos seleccionados" >Limpiar datos</button>
                            <button type="submit" name="registro" value="registro" title="Haga clic para guardar los datos del expediente" class="btn btn-danger">Guardar datos</button>
                    </div><br><br>
                 </form>
            </div>
        </div>
<?php endif;   include_once 'librerias/pie.php'; ?>
