'use strict';

queComemosApp.controller('BienvenidaController', function ($stateParams, RecetasService) {

	var self = this;
	var recetasMostradas = [];

	this.transformarAReceta = function(recetaJson) {
			Receta.asReceta(recetaJson);
	};

	this.getRecetasAMostrar = function() {
	    RecetasService.findAll (function (response){
	    	self.recetasMostradas = _.map(response.data, Receta.asReceta);
		});
	};
	RecetasService.recetasMostradas = self.recetasMostradas;
	self.getRecetasAMostrar();
});

queComemosApp.controller('LonginController', function ($scope, RecetasService){
	$scope.credentials = {
		username:'',
		password:''
	};
		$scope.login = function (credentials){
			RecetasService.nombreUsr = credentials.username;
		};

});


queComemosApp.controller('DetalleController', function ($stateParams, RecetasService){
	
	this.receta = RecetasService.getRecetaById($stateParams.identifier);
});