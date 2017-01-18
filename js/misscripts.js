$(window).load(function() {
	$('.flexslider').flexslider({
		animation: "slide",
		slideshowSpeed: 15000,
		animationSpeed: 1500,
	});
});

$(function() {
	$( ".datepicker" ).datepicker({
		minDate: "today",
		altFormat: "DD, dd/mm/yy",
		dateFormat: "DD, dd/mm/yy",
		dayNames: [ "Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado" ],
		dayNamesMin: [ "D", "L", "Ma", "Mi", "J", "V", "S" ],
		dayNamesShort: [ "Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab" ],
		firstDay: 1,
		monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
		monthNamesShort: [ "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" ],
		autoSize: true,
		showAnim: "slide",
		onClose: function( selectedDate ) {
	        $( ".datepicker2" ).datepicker( "option", "minDate", selectedDate );
	    }
		/*beforeShowDay: $.datepicker.noWeekends*/
	});
	$( ".datepicker2" ).datepicker({
		minDate: "today",
		altFormat: "DD, dd/mm/yy",
		dateFormat: "DD, dd/mm/yy",
		dayNames: [ "Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado" ],
		dayNamesMin: [ "D", "L", "Ma", "Mi", "J", "V", "S" ],
		dayNamesShort: [ "Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab" ],
		firstDay: 1,
		monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
		monthNamesShort: [ "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" ],
		autoSize: true,
		showAnim: "slide",
		onClose: function( selectedDate ) {
			$( ".datepicker" ).datepicker( "option", "maxDate", selectedDate );
		}
		/*beforeShowDay: $.datepicker.noWeekends*/
	});
});

$('#aceptacira input[type="checkbox"]').change(function(){
	if ($('#aceptacira input[type="checkbox"]').is(':checked')){
		$('#aceptacira button[type="submit"]').removeAttr('disabled');
	}
	else{
		$('#aceptacira button[type="submit"]').attr('disabled','disabled');
	}
});


$('#asignacira input[type="radio"]').change(function(){
	if ($('#asignacira input[type="radio"]').is(':checked')){
		$('#asignacira button[type="submit"]').removeAttr('disabled');
	}
});
