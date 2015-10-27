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

	self.traerRecetas();

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

	var self = this;
	this.receta = RecetasService.getRecetaById($stateParams.identifier);
	

	this.esFavorita = true;
	/*esto debe ser una funcion que evalue con el usr traído por el log*/
});

queComemosApp.controller('EditarController', function ($stateParams){
	this.idReceta = $stateParams.identificador;
});