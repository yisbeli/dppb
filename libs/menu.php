			<div class="container cirabel">
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="sala.php">Lab. simulación</a>
			    </div>

			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				    <?php if (!empty($_SESSION['tipo'])&& $_SESSION['tipo'] == 1) : ?>
				      <ul class="nav navbar-nav">
				        <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Planes de Formacion<span class="caret"></span></a>
				          <ul class="dropdown-menu">
				            <li><a href="tipo_plan.php">Registro de Tipos de Planes</a></li>
				            <li><a href="planes_registro.php">Registro de Plan de Formacion</a></li>
				            <li><a href="asignacion_planes.php">Asignación de Planes</a></li>
				            <li><a href="responsables.php"> Registrar Nuevo Responsable</a></li>
				            <li><a href="consulta_responsable.php">Consultar Responsables</a></li>
				            
				            
				          </ul>
				        </li>
				        <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Estadisticas <span class="caret"></span></a>
				          <ul class="dropdown-menu">
				           <li><a href="planes_dictados.php">Reporte Mensual de los Planes Dictados</a></li>
				           <li><a href="personas_capacitadas_mes.php">Reporte Mensual de las Personas Capacitadas</a></li>
				            <li><a href="egresos_registro.php">Registro de los Egresos</a></li>
				            <li><a href="egresos_mes.php">Reporte Mensual de los Egresos</a></li>
				          </ul>
				        </li>
				        <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Servicios Operacionales<span class="caret"></span></a>
				          <ul class="dropdown-menu">
				            <li><a href="servicio.php">Registro de Servicios Operacionales</a></li>
				            <li><a href="consulta_serv2.php"> Consultas de Servicios Operacionales</a></li>
				            <li><a href="paciente.php">Registro de Pacientes</a></li>
				            <li><a href="consulta_pac2.php">Consultar Pacientes</a></li>
				            <li><a href="consulta_serv_mes.php"> Reportes de Servicios</a></li>
				          </ul>
				        </li>
				      </ul>
					<?php endif; ?>
					<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
					  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Herramientas <span class="caret"></span></a>
					  <ul class="dropdown-menu">
						<?php if ($_SESSION['tipo'] == 1) : ?>
					        <li><a href="nuevo_usu.php">Registrar Nueva Cuenta</a></li>
					        <li><a href="nivel_academico.php">Nivel Académico</a></li>
					        <li><a href="cargo_institucional.php">Cargo en la Institución</a></li>
					        <li><a href="unidades_tributarias.php">Unidades Tributarias</a></li>
					        <li><a href="tipo_servicio.php">Registrar Tipo de Servicio </a></li>
					        <li role="separator" class="divider"></li>
					        <li><a href="#"></a></li>
					        <li><a href="aceptacion_usu.php">Aceptación de Usuario</a></li>
							<?php endif; ?>
					    <li><a href="actualizar_contrasena.php">Cambio de contraseña</a></li>
					    <li role="separator" class="divider"></li>
						<?php if ($_SESSION['tipo'] == 1) : ?>
					        <li><a href="respaldo.php">Respaldar</a></li>
					         <li><a href="restaurar.php">Restaurar</a></li>
					        <li role="separator" class="divider"></li>
							<?php endif; ?>
					  </ul>
					</li>
					<li><a href="config/logout.php"> Cierre de sesión <span class="glyphicon glyphicon-log-out"></span> </a></li>
				        
				      </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
			</div>	