'use strict';

/* Controles */
var queComemosApp = angular.module('queComemosApp', ['ui.router']);

queComemosApp.controller('BienvenidaController', function (RecetasService) {

	var self = this;

	
	this.recetas = function() {
	    RecetasService.findAll(function(data) {
	    	self.recetasAMostrar = _.map(data.data, Receta.asReceta);
	    });
	};
});

queComemosApp.controller('DetalleController', function ($stateParams, RecetasService){
	
	this.receta = RecetasService.getRecetaById($stateParams.identifier);
});


