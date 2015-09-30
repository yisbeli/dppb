<?php   include_once 'librerias/cabecera.php'; ?>
    <div class="container"><br>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h1>Registro de los requisitos</h1>
                    <form name="Formulario" id="formulario" method="POST">
                        <legend>Documentos consignados</legend>
                        <section id="cuerpo_form">
                            <label for="CI">1 FOTOCOPIA DE LA CEDULA DE IDENTIDAD: </label>
                            <input type="checkbox" checked="checked" /> <br>
                            
                            <label for="foto">2 FOTOS TIPO CARNET: </label>
                            <input type="checkbox" /> <br>

                            <label for="carpeta">1 CARPETA MARRON TAMAÑO OFICIO CON GANCHO:</label>
                            <input type="checkbox" /> <br>

                            <label for="ctitulo">1 FOTOCOPIA DE TITULO DE BACHILLER:</label>
                            <input type="checkbox" /><br>
                            
                            <label for="sintesis">1 SINTESIS CURRICULAR:</label>
                            <input type="checkbox" /><br>

                            <label for="bauche">BAUCHE:</label>
                            <input type="checkbox" /><br>

                            <label for="num_bauche">NUMERO DE BAUCHE: </label>
                             <input class="form-control" id="text_form" type="text" maxlength="30" name="num_bauche" placeholder="Ingrese el numero del bauche" requi patter="^[a-zA-Z]{3,15}" title="Ingrese el numero del bauche del deposito"/><br>

                             <label for="exonerado">EXONERADO:</label>
                            <input type="checkbox" /><br>
                        </section>
                    </form>
                    
                    <div class="text-center">
                            <button type="reset" class="btn btn-danger" name="limpiar" value="Registrar" title="Limpiar datos seleccionados" >Limpiar datos</button>
                            <button type="submit" class="btn btn-danger" value="Guardar" title="Haga clic para registrar un plan" >Guardar datos</button>
                    </div><br><br>
            </div>
        </div>
<?php   include_once 'librerias/pie.php'; ?>
