
queComemosApp.service('RecetasService',function ($http) {

	this.findAll = function(callback) {
        $http.get('http://localhost:9000/recetasAMostrar').then(callback);
    };


	this.getRecetaById = function (identifier) {
    	return _.find(this.recetas, function(receta) {
      		return receta.identificador == identifier;
    	});
    };
    
});