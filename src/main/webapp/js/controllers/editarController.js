'use strict';

queComemosApp.controller('EditarController', function ($stateParams, RecetasService, $state){
	var self = this;

	this.receta = RecetasService.getRecetaById($stateParams.identificador);
	
	self.nombreNuevo = "";

	this.copiarReceta = function () {
		RecetasService.restCopiarReceta($stateParams.identificador,self.nombreNuevo, function (response){
	    	$state.go("pantallaBienvenida");
		}, function(){});


		/*falta resolver la salida por error, integrandolo en la vista etc*/
	};
});







