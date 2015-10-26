'use strict';

queComemosApp.controller('BienvenidaController', function (RecetasService) {

	var self = this;

	
	this.transformarAReceta = function(recetaJson) {
			Receta.asReceta(recetaJson);
	};

	this.getRecetasAMostrar = function() {
	    RecetasService.findAll ( function (response){

	    	self.recetasAMostrar = _.map(response.data, Receta.asReceta);
	    });
	};

	self.getRecetasAMostrar();
});

queComemosApp.controller('DetalleController', function ($stateParams, RecetasService){
	
	this.receta = RecetasService.getRecetaById($stateParams.identifier);
});