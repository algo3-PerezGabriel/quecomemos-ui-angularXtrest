'use strict';

 queComemosApp.controller('BienvenidaController', function (RecetasService) {

	var self = this;
	self.errorEstado = [];
/*
	self.combos = new Combos();
*/
	self.combos = {
		'dificultades':['Facil','Mediana','Dificl'],
		'temporadas':['INVIERNO','VERANO','OTOÑO','PRIMAVERA']
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
			self.errorEstado.push(respuesta.data);
		});
	};		

	this.busquedaEjemplo = {
        "nombreBuscado":"Arroz con Pollo"
    };	

    this.recetasAnteriores = function (){
    	RecetasService.restRecetasAnteriores(function(){
    		self.lasRecetas();
    	});
    };

    this.buscarRecetas = function () {
    	RecetasService.busquedaJson= self.busqueda;
		RecetasService.restBusqueda(function (response){
			self.lasRecetas();
		}, function (respuesta){
			self.errorEstado.push(respuesta.data.estado);
		});
	};

	this.lasRecetas();
});

