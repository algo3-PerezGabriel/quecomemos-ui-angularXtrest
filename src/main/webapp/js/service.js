
queComemosApp.service('RecetasService',function ($http) {
	
	var self = this;

	this.restToLog = function (callback, errorHandler) {
		$http.post('/logearUsuario',self.usr).then(callback, errorHandler);
	};

	this.restRecetas = function(callback) {
    	$http.get('/recetasToGrill').then(callback);
    };

    this.restFavoritear = function (recetaId, callback, errorHandler) {
    	$http.put('/recetaFavoritear/'+recetaId).then(callback, erro/rHandler);
    };
    
    this.restEsfavorita = function (recetaId, callback, errorHandler){
    	$http.get('/recetaEsFavorita/'+recetaId).then(callback, errorHandler);
    };

    this.restCopiarReceta = function(recetaId, nombreNuevo, callback, errorHandler){
    	$http.put('/copiarReceta/'+recetaId,nombreNuevo).then(callback, errorHandler);
    };

    this.restBusqueda = function(busqueda, callback, errorHandler){
    	$http.get('/busquedaRecetas',busqueda);
    };

    this.restTituloGrilla = function (callback){
        $http.get('/tituloEnGrilla').then(callback);
    };

	this.getRecetaById = function (identifier) {
		return _.find(self.recetasEnGrilla, function(receta) {
	  		return receta.sId === identifier;
		});
	};
});