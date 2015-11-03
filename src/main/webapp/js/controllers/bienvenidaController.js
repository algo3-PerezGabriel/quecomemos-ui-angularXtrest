'use strict';

 queComemosApp.controller('BienvenidaController', function (RecetasService) {

	var self = this;
	self.errorEstado = [];
	self.busqueda = {};
	self.listsAux = {
		"dificultades": ["Facil","Dificil","Mediana"],
		"temporadas": ["TODO EL AÑO","INVIERNO","OTOÑO","PRIMAVERA","VERANO"]
	};

	this.lasRecetas = function(){
		RecetasService.restRecetas( function (response){
	    	self.recetasMostradas = _.map(response.data, Receta.asReceta);
	    	RecetasService.recetasEnGrilla = self.recetasMostradas;
		});
		RecetasService.restTituloGrilla(function (respuesta){
			self.tituloGrilla = respuesta.data;
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
		RecetasService.restBusqueda(self.busqueda, function(){
			self.lasRecetas();
		}, function (respuesta){
			self.errorEstado.push(respuesta.data.estado);
		});
	};

	this.lasRecetas();
});