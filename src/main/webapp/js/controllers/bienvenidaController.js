'use strict';

 queComemosApp.controller('BienvenidaController', function (RecetasService) {

	var self = this;
	self.errorEstado = [];
	self.busqueda = {};

	this.lasRecetas = function(){
		RecetasService.restRecetas( function (response){
	    	self.recetasMostradas = _.map(response.data, Receta.asReceta);
	    	RecetasService.recetasEnGrilla = self.recetasMostradas;
		});
	};

	this.favearReceta = function(recetaId){
		RecetasService.restFavoritear(recetaId, function (){
			self.lasRecetas();
		}, function (respuesta){
			self.errorEstado.push(respuesta.data.estado);
		});
		self.lasRecetas();
	};

	this.buscarRecetas = function () {
		RecetasService.restBusqueda(self.busqueda, function(response){
			self.lasRecetas();
		}, function (respuesta){
			self.errorEstado.push(respuesta.data.estado);
		});
	}

	this.lasRecetas();
});