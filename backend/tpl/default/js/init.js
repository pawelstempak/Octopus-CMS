(function($){$(function(){

	$(document).ready(function(){

	  	 $('select').formSelect();
		 $('.dropdown-trigger').dropdown();
		 $('.modal').modal();
		 $('.tabs').tabs();
	    $('.collapsible').collapsible();
	    $('.sidenav').sidenav();
		 $('.tooltipped').tooltip({enterDelay: 500});
		 $('.datepicker').datepicker({
		 										format:'yyyy-mm-dd',
		 										i18n:{
										            cancel: 'Anuluj',
										            clear: 'Wyczyść',
										            done: 'Ok',
														months:['Styczeń','Luty','Marzec','Kwiecień','Maj','Czerwiec','Lipiec','Sierpień','Wrzesień','Październik','Listopad','Grudzień'],
														monthsShort:['Sty','Lut','Marz','Kwie','Maj','Czer','Lip','Sie','Wrze','Paź','Lis','Gru'],
														weekdays:['Niedziela','Poniedziałek','Wtorek','Środa','Czwartek','Piątek','Sobota'],
														weekdaysShort:['Nie','Pon','Wto','Śro','Czw','Pią','Sob'],
														weekdaysAbbrev:['Nd','Pn','Wt','Śr','Cz','Pt','So']
														}
		 										});
		 $('input#code, textarea#textarea2').characterCounter();
		 $(".closeCard").click(function() {
													 $(".info").fadeOut(700);
		 											 });
	    $('.carousel.carousel-slider').carousel({
															  fullWidth: true,
															  indicators: true
															  });
		 $('.next').click(function() {
											   $('.carousel.carousel-slider').carousel('next');
											  });
		 $('.fixed-action-btn').floatingActionButton();
	}); // end of document ready

});
})(jQuery);