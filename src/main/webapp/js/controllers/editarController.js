'use strict';

queComemosApp.controller('EditarController', function ($stateParams, RecetasService){
	this.receta = RecetasService.getRecetaById($stateParams.identifier);
});







