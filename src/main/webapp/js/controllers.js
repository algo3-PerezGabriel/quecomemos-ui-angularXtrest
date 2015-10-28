'use strict';

queComemosApp.controller('BienvenidaController', function ($stateParams, RecetasService) {

	var self = this;
	this.recetasMostradas = [];

	this.traerRecetas = function () {
		RecetasService.restRecetas(function (response) {
			RecetasService.recetasEnGrilla = _.map(response.data, Receta.asReceta);
			self.recetasMostradas = RecetasService.recetasEnGrilla;
		});
	};

	this.favearReceta = function(recetaId){
		var receta;
		for (receta in self.recetasMostradas){
			if (receta.sId === recetaId){
				if(receta.esFavorita === false){receta.esFavorita = true;}
				else {receta.esFavorita = false;}
			}
		}
	};

	self.traerRecetas();

});

queComemosApp.controller('LonginController', function (RecetasService, $stateParams) {
	
	var self = this;
	this.usr = {
		'id' : '',
		'nombre':'',
		'password': ''
	};

	this.logear = function (){
		RecetasService.usr = self.usr;
	};

});




queComemosApp.controller('DetalleController', function ($stateParams, RecetasService){

	var self = this;
	this.receta = RecetasService.getRecetaById($stateParams.identifier);
	

	this.esFavorita = self.receta.esFavorita;
	/*esto debe ser una funcion que evalue con el usr traído por el log*/
});

queComemosApp.controller('EditarController', function ($stateParams){
	this.idReceta = $stateParams.identificador;
});