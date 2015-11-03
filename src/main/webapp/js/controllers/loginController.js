'use strict';

queComemosApp.controller('LonginController', function (RecetasService, $state, $timeout) {
	
	var self = this;

	self.errors = [];
	
	function notificarError(mensaje) {
		self.errors.push(mensaje.data.errorLog);
		$timeout(function () {
		  while (self.errors.length > 0)
		    self.errors.pop();
		}, 4000);
	};

	this.logear = function (){
		
		RecetasService.usr = self.usr;
		RecetasService.restToLog( function () {
				$state.go("pantallaBienvenida");	
		}, notificarError);
		$state.go("pantallaLogin");
	};
});