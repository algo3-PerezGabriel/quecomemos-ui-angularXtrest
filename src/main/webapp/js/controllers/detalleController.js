'use strict';

queComemosApp.controller('DetalleRecetaController', function ($stateParams, RecetasService){

	var self = this;
	this.receta = RecetasService.getRecetaById($stateParams.identifier);
});